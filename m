Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD1FE98E0B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4IEVe23JvosF/ljVHhtNPHgumeDGeBSyPmBAPyvh5HY=; b=jZURnNuz1Ym4RITK+YAHb1Ym3N
	YhV47WKeLmPuA8OeKIujVExVM3rU31ou1Gh995/YVks71q1JQcFl7/6KD4Ki1XYQteRpkw044/+B9
	6/UFOFyuoL2Q0HwDGgnS+RfN1YRVgEzpNMWupzsjqQ/s4JTOPSlMnNxTtPbvu4nRZEwZ6X8fNJzbg
	VGGOKVz+eM0RbXU6nPmb+lMT14TDbblJk4HLDazQai36104+VcuJvtl7OqxXWznbg7y9zD/X4qew7
	Qpz3UwOovFP0BJdkglH5bnsYqzbTi73yhXlTS27F73hAKoDRZkxkhS9dxFtYvMscYjGo20TsEJbdI
	Hn9oXqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRte-0000000HUHj-3cGu;
	Mon, 23 Feb 2026 09:06:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtZ-0000000HUB3-2EZn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:06:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMt6v52001244
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IEVe23JvosF/ljVHhtNPHgumeDGeBSyPmBAPyvh5HY=; b=lCyqVSccFm2MNmzq
	d/VWC0//Ou8hzdNf1sUs01NwCFgGtI6gp+comyP9bcJ9wz6wYtMv5SRADSyOfPbu
	cLPxr969xyh0DoSsTvzjlM3bEa0UhRAkhzvogOqv36RscKZxZ/8i+qLP2OioAIlf
	9oK5GMyIKP9vbCVc3H7Jttk/nm9/yn4S+uZ5pVDmSgDrzjOrPNYulSAC1RYUf2D+
	ga8pXgO3vsN2sNLe/0Ec1jRr95T2Hg/59NsYfamSMPQcqYe9X2uOMFmykvZ9NXbG
	vTgNjDnB1ZLS8Y5T/zI0+EFroavgpPfxpJlzPwJdJumiaTnCdGTyI0HqILFH6FGN
	1pAGSQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav3cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-896f50f008eso536633856d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837584; x=1772442384; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IEVe23JvosF/ljVHhtNPHgumeDGeBSyPmBAPyvh5HY=;
        b=KTv788KPkaNe3bEOQrJEQtYO2AM4Li4RGy0HN/xiBb/NgT+37O9Uv0vjwNEMKz1YON
         LumKW468EuL/f7aOgLMFw98UhLwxmRiVySjtZtTrZNoh819JQ3ZKN8Pz16fRBVSidyau
         iM6jYr+xBduUBN1keN4Z/fHoEa9oa1F2zsSVTBIX48VImOVC/QMzytukTEaanqx1kPyi
         BFkbkO4LrfQnjmFobG0gyiasvFg/BQV4srVM/2QVf3WJ0C+FOtpWqJmLdW5ErAS4Q+uv
         I/8BXPqbOfz36OhmxL62PkrC55ooPvaPe2YuJ1yX63c8OtpwwDV/4dK0rNxqx2Xb6Fxl
         I8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837584; x=1772442384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4IEVe23JvosF/ljVHhtNPHgumeDGeBSyPmBAPyvh5HY=;
        b=UY12ypVp//ZCNpORasSsz8+Mzd9axN7oTTWHpb6xYdM2r0povzSgzSBlyJZWyLBWmL
         NVCaq6Dc+lI6TdNSu60rpXZdXFYSQmNPk3tkDiNTwws23aRFeJEdKEwvIzKO9Hr+dxUL
         /OynBDyYjJLYnU0pnj3XwTWOyDYT+a+fc7h4uoGLYEveSPwbqjD8JqaINnRUkhAfaEg7
         Ut/Azn2zSmcHznS2kfL9PBIOA4crNEtnhXzjdDAbLXCjkq/2zbOYFY53SnSBbLVKflFt
         Sxyoo+tSSFGquhGCmqULl90p6RAwmTScRmXxIj5aguEeOycjKn4C+Inj9z4zvb2LTGiv
         jihA==
X-Forwarded-Encrypted: i=1; AJvYcCVTBPT5Nv/U83Wgkv6XXHA0ZcyXhUBbL5L3TmVcA1qFwPstRv0jiplQb38D5ll9ndp1TeIK8L5OUPThvufzhi4P@lists.infradead.org
X-Gm-Message-State: AOJu0YxDC8SpF+oa5GKARbHYxS4iqqeiCaltjI2hVt5Ns9lAJs/KapQm
	hQKR0qxlvtrPg25t0pBMZ3ARN2YdJ4iMP2Z8pakFQzd2cLQq57jAkPPPnt6vDvoi15C6eFoH5Fj
	rVzAhUmyD3vasQCUCLa3K8UW0qUqRPo2dN6k+ZNJP7ckY+b1DPxdLj0VjKrpXGnp5YI1mbA+gsh
	cPbA==
X-Gm-Gg: AZuq6aIpE/9jl570f4iaz/m33JF80gwjF1JBCcg5/eq2iDU0JHMPFmaVkiZjuf5rWwd
	5zaZP/vQY734ar/CXtUe6obB5MwGoOT/qmbkZNFANXyzMxh4fyzbCEJY7HmBUFzI2aQtzKtgl9H
	WvmmwgZ3s3djWU2jYijuIFs2m/AYIhxBJdcJeOHNEMGAV4oWM7VaAI11RuZNztZPBJEZj+jCiZB
	5h9y74593qS/rsu6U7oIge15jLnaqAmef9L/3af/UNVByG+NuKOKQC2kbjm4qWGQRKrOFei4DGE
	7FEpeA/BTBfCnIiY82Nj4qWkcgEKkDS/PFnFkWljxUZPOKaYl45zFi/f1iaUJV31cKkQiWfZjUH
	uAVdWnl8vkZc5h1TQq/+qpyr8+gC3nY5V9u0IzbxIyMnnQ6eMCJH9
X-Received: by 2002:a05:620a:1904:b0:8c7:10dc:9055 with SMTP id af79cd13be357-8cb8ca0b5e4mr941449185a.23.1771837583963;
        Mon, 23 Feb 2026 01:06:23 -0800 (PST)
X-Received: by 2002:a05:620a:1904:b0:8c7:10dc:9055 with SMTP id af79cd13be357-8cb8ca0b5e4mr941446385a.23.1771837583455;
        Mon, 23 Feb 2026 01:06:23 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:52 +0100
Subject: [PATCH v2 06/12] i2c: rcar: set device parent and of_node through
 the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-6-d78db0a6fcf7@oss.qualcomm.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=deCpsbgsyzGz52UYVrUFu+GK4rDUeaxHx5qfsuJiwbw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh2nfK3wWYF2E/xl2FdbyYiySDaGr7DmWU7Y
 gVOwe1z2tCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYdgAKCRAFnS7L/zaE
 wx/KEACU1EBIcNW47+QMfddH+tXvVKOd2tvwk6pL6qS63YjG7EoaUpXM31XW4EJi7MqCRLRCDlg
 gC81tNRb+Zid1pqEiPYtS/Kqvfp1ycij7mS5/LnnC17ugukqtbneKVtXQRVg9nny9MfzCxP5UUl
 xgHzIFWCwq98ELAqzaSg4rrdG8ofefA0PJEcuq5f2fPmsQyAHcF62k6bfZWOV1+vcJkgyU9GZxR
 NOjBebuqmXgJP5NisCzQ6Nu80KBwZT53MEQ0heWoc/EiSuxxgogMYrBCBsL/WFj49zhR4+4/EJV
 adnwNMA9579jlTWF3Szxb+vG5W/MKZTyeqxSA9BZ2NhPsBlNReYLHjJ429tUvSg2rnt6q+qFftT
 Xlmh42TrNDLpPpdXFvJ9KRX0enYLbt9JXs9AkIGQKiLYrAAwZrwodaptbHtC+XYX4uPiKwbKd+0
 2bIJgfeim7TcZL+Ruh1mfmXHgPwUG3AWFArAHg1sBe047KuWqd6PbBFFkQlH+K56BRq0lU8Ch2y
 7sJawmyu6+SbRyP8DE7EpDWu5EYph29HOzk9f/NoQSC3ARHNUayWALyELpMufM2EORXiNq5M3YL
 S6yzQDKetgiK3wkpUAxzJKwZBzmE7clZ7sXnbfXLcJXmNjOQlikQbZ0dWNcmnuq9OvqeVNqfqPQ
 boJzOV2Zd4srHmA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c1890 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Cv5rWQh4W07jABGdPz4A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfXzvdC9JYdKbqI
 unEnhWDqoMCLE1Y1eI8CXowQddIzYICgTb52eSmoFR5mHTmFXMQjaN+YUFPiSE0WsBHoc/d83cR
 iUAxBNxsfqEwGdusxaRSaz0vsJzJ/f7jWycEai5OKFen4t3UR3uC79mSDvUv8hxew35KA+vM7hV
 U9iuOnygUxYZkQ01SCykE7IaSUX1EoGOGBgU952cn3w+MyyEafLHsd0FpYZkd9D9ppr7ip2ahRL
 baME+D82gZRTYxRTxNdZA3LaTc1S+d5t/u3D3lNJ8dkDLqYELvD8yubip3yUf5ldGRQ9QoJhVTP
 pGQAf1ssqhcvTvxveJkVtaVmFrxiEFVvQZwOQxXPbcs+wGEOl7uGM63r6oJM48JIz+t4UtvU29R
 BHWIICY+Sg0hDkPM7mEXDG25uNieax+g88AtT21eCXCQ+oY0MXQcTcJDEr3OpoYIeEnnfV6A8Lg
 6ofYlwvSVDCQNwPRZig==
X-Proofpoint-ORIG-GUID: nI6bR8_lEsdhWrZxmvlMjAUm-DHMAJSo
X-Proofpoint-GUID: nI6bR8_lEsdhWrZxmvlMjAUm-DHMAJSo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010625_584715_6DBDB306 
X-CRM114-Status: GOOD (  15.66  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-rcar.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 5ce8f8e4856fb2bb21c9cd731ddbbd8f3622ca26..af96892718fe04c5c428c82d3a47ad23aa08ee9c 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -171,7 +171,7 @@ struct rcar_i2c_priv {
 	u8 slave_flags;
 };
 
-#define rcar_i2c_priv_to_dev(p)		((p)->adap.dev.parent)
+#define rcar_i2c_priv_to_dev(p)		((p)->adap.parent)
 #define rcar_i2c_is_recv(p)		((p)->msg->flags & I2C_M_RD)
 
 static void rcar_i2c_write(struct rcar_i2c_priv *priv, int reg, u32 val)
@@ -1149,8 +1149,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	adap->algo = &rcar_i2c_algo;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->retries = 3;
-	adap->dev.parent = dev;
-	adap->dev.of_node = dev->of_node;
+	adap->parent = dev;
+	adap->of_node = dev->of_node;
 	adap->bus_recovery_info = &rcar_i2c_bri;
 	adap->quirks = &rcar_i2c_quirks;
 	i2c_set_adapdata(adap, priv);

-- 
2.47.3


