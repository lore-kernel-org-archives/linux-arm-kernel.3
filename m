Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B0AE98E08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1s69ZOUW4W/eG75pyy2jJwkNoebNytXCN87O0Rdgw8=; b=ll/Q9pwEI7bl3qYdqlYziFyxnI
	6GCFloHUwgz4gseljUOO4Ee1yHiBdZWOU0nvRAndlgrvd+17RfgeWpIefRL74K+IvVBpkkJrBOhSq
	nYpvgezu53RekoMYtW7snHTWaPIJcr9eUH9rInGF01NulIHNbDM674pqTl755VaaU630Ey9h8rHwf
	9XdpM/x98bUldXLxA1ZhwdDXcHHCrL4VPx0ynipHY2VkEU5HkWCe0b6pY9FzhWuc0Dj8jOf0P3WAN
	UwbcsYryWOByxDLKB8i4tnGDJgITS5wu7n1Xf+Lbdxn2JjEbyv7v7gRwsLFMLvDxZFZyHvTpyT6Zo
	cmVQGlUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtw-0000000HUcj-44rq;
	Mon, 23 Feb 2026 09:06:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRti-0000000HUM9-341P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:06:36 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNXmKA3683223
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z1s69ZOUW4W/eG75pyy2jJwkNoebNytXCN87O0Rdgw8=; b=OF24CyJJeT8R58iH
	w8BMKHU7AVuj7IBfWA7+aF1MLDSW1w93K637as1xCBWheutodXGU2WvKF5f3Uf+Q
	J0X2Wtdj/ne6oU5oWhseU6ympGKihcmkjbUPlPBZniAIxSX5qHINcnoIAu5gqDcR
	+VFtM+iWAHeQzI8KjnMsLQUDkHIAqbiEtERrX+NbkHlFg/d53LLloCT7zMfjsmAZ
	DAxnspg460MiCk0GUxIzjL1XptcPRal+l3M7Xb8cHOIHu8bdSM+L1rTwDg8ynmxg
	R23GCEjSa69xofpCD4b7SlwlG9t03+EKAGSbzeUpCyV+cizLsBH5M1sOqhF3Q5qf
	heqZsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8m26r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4a241582so3867334685a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837593; x=1772442393; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1s69ZOUW4W/eG75pyy2jJwkNoebNytXCN87O0Rdgw8=;
        b=fYyRw+RudRlDQz+Z79AIDDLMycCXOx2FwdUcQR0yA29Xz905rz/r6jZIpwXrgqr7Mu
         Qg/3GkvzahjwS0c/zwV63UMzlMdEWHdGySsUA9v++qOFwolGpP30N2id9YWLnqxn6OjV
         0Kbg9DNKvYKtr4fD8HruF0XAt30ved5hWxchdMgzUMYYXGInWlN/wPw0xEP7WZVu7gAO
         g1K35sgby3xy++2OrSXqK0OBXQyMbVN5bSXjeqvtjj+Nd5Y9jI6qNBZkLDrvzcyXTnNO
         hPyMN5gyp2cl4Fb36Qf3Y+yTUx9ReF97vkEmzFtEknGc3ky0KyB1fX9Ls5LMYqk+vaxD
         v9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837593; x=1772442393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z1s69ZOUW4W/eG75pyy2jJwkNoebNytXCN87O0Rdgw8=;
        b=dDKIyxMxSMkURj+cpSPbE7kgabsnhEKOJO+byNHZrRu93AOJtiI+1gslvXThPANJKj
         KjdicR7gJ2gjVWJnuBGn/pHOEmcbMozmi9jvU9bp6qTiKbHroNh7GJJtvktYEanijCYA
         ZdQMg8VQ9WKs9sAu+jpxs7SCtPJ5aXCxKGl4FcYl4Y4Y5H0uCkZ3B9fuATqjaG9VOmnh
         q67sBwMcCCHL4iO2X9PxzOwPtNIVgPJvmtKZi6SHGPUiqUpMmT+lgs4LCQb8HeUB6hfE
         VS+tOKdWFV/h4IRAkmfFuzvX0btx27mXrPXifStj16Xj/nEdfLYqR8Ybp9wck9CUDxse
         F3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMEC3iBUTo66sqB7WCglQpdPnNWFJ6YTBvaKcIhBB+0HSPOtnkrwOFbxAh0GE9fbAMOtPII/AfRSoWgggkhLin@lists.infradead.org
X-Gm-Message-State: AOJu0YwhGInYew7iqMj0Me1jFzW64ySHVm3NwUW29CFGH8nmYFLzest6
	YCxtL9BsWD7w53YM/y0m4pHSf/FCRQVlAbJ2prDaCbH/Tygxdt4H8ro4H8pu/Fp3GBfG5yBxj8g
	0t1z7ToTdfNwF8A31cxUQqsMbcFJpilfKRfwrqF+v6/YeY1TICJBsLOthFKUxoTS65j9miSsf8E
	RXBA==
X-Gm-Gg: AZuq6aJICv18uulnje87DTKPYI1kt62t4by+arRPhBCFAIUMD0gjiR2hK3dvCQXUKbT
	ZtkgA/Zt/2nUjjhM5Eu8ufAfDLe2hEumHqxNL2d5hDZc6pYSxqDdhVX/jyzCvuI1ihvc7tH+IEP
	qzOEp1P0Kqn7NkPCqCtD6qkWaC22mR3A2dtxmKpbkvvNv3UdSJMeqL8l72PTJU+qqQVwmMJeVVZ
	8Z3uNRuoRwPPrJDT9uwZfvxxEoABGGsS42a2v2GwioXxmn+wBIjo/mspXCxMa58UKsOWvgjGAEb
	3zyHhX9+4hXBPPB15B+fVVqIQ0PtuW3ug+01Z4WClHK8c7G0xgaCxbt3WxLe9XW7JZfZ2JAa671
	k8EZhmfdWGan1wYKSqESu4VSX/2zhNJTw8/OZHnP9CMjButzuWy9+
X-Received: by 2002:a05:620a:468c:b0:8cb:55d3:2a4 with SMTP id af79cd13be357-8cb8ca08308mr922170385a.35.1771837593228;
        Mon, 23 Feb 2026 01:06:33 -0800 (PST)
X-Received: by 2002:a05:620a:468c:b0:8cb:55d3:2a4 with SMTP id af79cd13be357-8cb8ca08308mr922166085a.35.1771837592722;
        Mon, 23 Feb 2026 01:06:32 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:57 +0100
Subject: [PATCH v2 11/12] i2c: nomadik: set device parent and of_node
 through the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-11-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GNCZSO1tofFVimQlfEXcivvHDvpWa5BaBkjqLZZcroE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh66xd7+MQZXKYUp1lof2Wde5NsKOrQrt95U
 eR8Ce2ipBuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYegAKCRAFnS7L/zaE
 w04VEACsdT4VCfUT8Out0yUzqZzfml7dMxtbxcoCnGY8tQLapaBzscsfnI+5Bu5NVsBjRWz2YfK
 GKz1PyQVjNRu6C8ehswM/RGsSkjYRUxZSTdjV631sUHy16gbpFobawG+M6magVodquPAsrG2efp
 fw078QxbHLsGtHgQUf3QlBUOhMk22ArZLQ7UVI4eWPuitiP6f64SssRo7tqJ//BaGhTLtlxLgt1
 jvZJM6D+hpoylJBTdwdFh3LNOWlNngiDMmXlJ+TYP7vEyQAHqGifdZcZ2gOjEZvuuGtO/lEw4zo
 SozwKRkeYXSwgcaSyFO1dD01Yswbq2jYdHSqqQ/U6ptyeOxHXTthssXS7L2LPdlo+WWnkUba/Bf
 4oG7Kg6fqOGDNbJAGQFzXbP88fe9GJvo21ZhNEA96KsQPTOoYosm2cONZstWSuGzQHRYlbRNoD0
 o41lI5eyWu16TVPGP0JRYBMjXMYTYSlhuH3hkyYXocF/XU6tyGdnIhI9kAYh5ZTFmS7uDBVKtYs
 9Tyx0EIpX5yv7J38BgWtyTxoLDGrIrU5OAym2Uw4iiru7lO0Rf+h4+zA/T/ASHlw7uHwH0ZBqTF
 evk49M+ClOODknfwmlUK6g5DkzMRRmmnMtP8HudXzwpA2Gyo6WgvZHRgm23knlsypDaTyhOz3PZ
 EC6ZWixHAae92HQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: _oyaj0LPcAEVo1dGQVAuuON7gP9ld3S8
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c1899 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tIHrhau139UvCPJ7cvIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: _oyaj0LPcAEVo1dGQVAuuON7gP9ld3S8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX0e8WXmQvZBVf
 I8ZYelugZZwUnmup3ijpuV6viEzkBfo1ipKmYg+EQo7h5Q8TqSX0D9Lw73DkC9AjEP//wUGybdQ
 Z0cQ8d9jhZTVe5hCuI8s6GVh0YskmV6IcUJ8GaYrUz8qrcZCr7pHALxg0zSv60TtU40vfCgJK8K
 k/8oWHeslL5lIj5//tdD8Furw5HXzGwvBBrhm0hV/57Xu3Sg1Gw4X4/AjqCJO+hyQQJoBECQPOC
 sB+I7s2i3ho/XCiWIg8PNu01gZEOYPXK0Zy+OrMIw7S5ayViosEdq2yfyvJfAM7NJ1APp9lWnFb
 G4hPoERvbqCh3tbV4tdqwPD1HbivSrkJJxR5Y5goNBKEEY6FUvIMPfJ1wU83vXSkDIwz/DiPT9x
 PJF4SDcv5xfDS8RGVTDTDDivvFrPzl4KUjsSx69gwltnB+jKctNIxiN01kWJ8/hMhDGqyiDxkvF
 dsvAb3UTi5uX1h8r1Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010634_904078_A3817868 
X-CRM114-Status: GOOD (  15.02  )
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

Acked-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index b63ee51c1652080e414f4302bee16905914c1288..12b4f8750886d7f6f5b6027b00691240952a3694 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1148,8 +1148,8 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 	init_hw(priv);
 
 	adap = &priv->adap;
-	adap->dev.of_node = np;
-	adap->dev.parent = dev;
+	adap->of_node = np;
+	adap->parent = dev;
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->algo = &nmk_i2c_algo;

-- 
2.47.3


