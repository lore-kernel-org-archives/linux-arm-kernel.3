Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BE2E98E08
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=; b=u1rJNAyw4eTQ7s/mqAQHWGx3sd
	nsWcFVmBihF9FKCN5xILuQWNiCL0BjR/g0M3yRxVwePCl/FUd1i89CY0mMJt/Ft9gE/SgUniZnK/K
	zeR63uFHpVqhGP/K6F5amfSWIxJPu969LkTeymwCnfetCHHu5uVvUJMzex69VTZiZtUDY5vcioJMu
	HTOcVLWh05fRnqidM/IYRN318l5yqZIm/pvloyzEBrpzcKMqeZfH5Xmij4m4yXp78UEyOB5ApMzVZ
	KHMLOiijElr0pk8Sn5m0d+6nrGE7Gfv9XuVAzxm/pAkZDu6HJTbygZxL07K7V+PNDDBAd9Y5jozt/
	3Se+6mpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtq-0000000HUUg-0LFZ;
	Mon, 23 Feb 2026 09:06:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtd-0000000HUEM-01fr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:06:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLDq2M2077802
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=; b=hAQdRWvvV0G+NLiW
	MEGF9Jf95N7zQMt+9m5bmPGFLSo7Eu9+Mt03F6fs+Se1rzZb6pK1IW6IfRGnhR1Y
	o8ODSwJeWHfhUQUeazDO9mCdk9QlBo4vAeoXYSwgR0uaIuKCxeXh9bFuQ1eLb23N
	KDcGNM1YBpWlOOSI87m3Xfjb8ZyG5mxvfyVWEEZEWgqQboKe9MTk6uJhXGSORwts
	sNYIDpmBhp6n2XqiB3YvgX3VwBIC3I+pZMDCysz0hmBryFQJxW5Ni6liSbnKx2Go
	aegRmaZmzQeBegQGQEYD2xBPgA6stAI4RC2dePjjcbGPKQ8VRsE/OsSEjYVyiwuS
	WdohNw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3v1up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71156fe09so3758753885a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837587; x=1772442387; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=;
        b=emW1UNpJulu2qftOsNl1EO8BohN4xjfG7mEUWoKeJ9seV34eGVMf6RH+gbYFHTeoA+
         WNQIj7IwHQiGEJ5/+o5269XiwqGhBphWDEGmFehWic5WNKLz7hT+w6EzpYsxD+ImB6wR
         /lIGdpSV54jYufv2BYTSz21IzwrAwkwlfzwJ3tjlzqW2HhlGw0+0B0kz0gWakCxSUuFR
         LKAetu0+A/07cmTJ3paTGbOYte39Q5w8mxHUQtwaZf54yRxcO4Mh7ZPjlX/U80LIP14M
         9lJxvYQOjqW5vzHxEvmu987zmRxJP7gxODuwhKgSAJp9LZBhoyFBadQ4DLuLq8S3fMtq
         g4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837587; x=1772442387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=;
        b=SbmLfFM8oOmL+IdMueid2Hy2cU8Lyh/4dXMsTl4i/guJxxXP0QvBHeUKGDC1LmK9SC
         cRynXwVOEwfaWiFrMG6NBlpAQ0217960RK+IgIKqAtTx343vHCAxNtwVM9nR9qN74wPx
         fBYES4QJt5g2SZ+tc0mr6VDZcD7oYo/leEoaKAY3c8UjwgoWW3/BW+F9i1/xUtS1sYJh
         hUBUnZItWJgZdhEsR3F/KSKutoQUkypwaPRACmTOA/8vuj+Jgb+a7fYT5g8bCanBWnjQ
         f7uKX2PNdiqgfxuH8Tw28ciLWAA5IOF5iKAHLlYAxk29Zshq2lsZfnmkxm4M8F5PgFWF
         gpHw==
X-Forwarded-Encrypted: i=1; AJvYcCXf5sGFxpcQ6j8EL3ePjbSCGidcLVvZ2vEDyJQkhAg+6v6gORAIHeuQDYtBhu2a8DTpe0Ce74xFFILENklonZ4/@lists.infradead.org
X-Gm-Message-State: AOJu0YzlmlUis5UcIc9PXArdXsXdp1/1dlOr/QxjfsyPBVuKED7ggUFq
	8kMrD9bvxQHiexXi2OBRzIXraxV62GSvppdV4ZVIxiYUcsVfjlVA9ONw+g8dhG1UUTMjq9oNwL/
	2IZ7mR7OEXCH3E0f8dQsYwW8ZgaNQLjVmtFJtP8IWaGx1PcN9G+TmbbJKp5u8yyGzB5uAi1FFyj
	Cyhg==
X-Gm-Gg: AZuq6aIMEkNoM/iCN2UG8+4RFXKsEfAiR5iR33zVUjVIUJmOW8VkLWBid3C1KStymeO
	uKdAXhqUS7Cy0w75bbiQkZnZpzz9HoXiPXCRV9JeSlcHuOfOhE/rDNobD7x9lzsuh9XWUeey0a4
	ttrYlwmPGg7pHz5B1sqpW83CSF41p9Mbnct1jU4NCUI2Zxhl3w4bq38PwwSsu5oAyOQaF2z+mXc
	elGY1AYj30NpImOMPMz7nlizU/s00RRzgIB5RdrXUcpe6x8AunA604PWhA5qu5ebwpeeB/KNMGL
	lesPgxJzj8LGi7iKmaR9BMvRCHfmYGeiRAgxDXZzaW0fZ0W5wC+J7fmexdJ8GaLnL5W4VfFsIG/
	BZGHBbLQvHRdh32Q58ziGzJ0yTAfq5V1HTFgNmq89sFX5hphMQ/R8
X-Received: by 2002:a05:620a:4587:b0:8c8:82a1:11c9 with SMTP id af79cd13be357-8cb8c9d1dcbmr922890285a.14.1771837587508;
        Mon, 23 Feb 2026 01:06:27 -0800 (PST)
X-Received: by 2002:a05:620a:4587:b0:8c8:82a1:11c9 with SMTP id af79cd13be357-8cb8c9d1dcbmr922886285a.14.1771837587053;
        Mon, 23 Feb 2026 01:06:27 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:26 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:54 +0100
Subject: [PATCH v2 08/12] i2c: mxs: set device parent and of_node through
 the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-8-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iacvmP5MKst4koF4pQzdNY4+k8gIR/r7nU+j4v1o/rI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh46t9YVusxGMRyOKiO1gXCj7YchvrY73yIi
 M9XKPAvJqmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYeAAKCRAFnS7L/zaE
 w1f8D/9Kr6cIxWLtSoo/iCsrKZvQ1AH7s9U2qJB6pL13Bs2n53X6os+fQTcQ3mW6OqL9+gW2IBO
 hKJyz5n049Yg9UAulAPIB2NwtjSqS+2e3S2e4+YVRmkxHqOdSYiUcQiX7UKJQU51B0sRz4x+Jsy
 j3bdNkn8RXeXakq85CDPNGeBlub6cxzXNysFXSejcPM9tA9av5dQSSq3w9uAg6Z6JlNv2rkjfbO
 Mru0GOD4rjDb05x/1ld6B71rL2iqeiOY6LJ+5Zag0iNaqwpIroZIZGRg8cnygQ3av91fBgclbCE
 wdt/NmYrtU9IIPBwJDv3Jn1NbLe2TjwYYADsuEGwKC2OJeadyxdITubVzqMoZVdr19TWwEhMjVQ
 AEImAkWG/9zFYjU4his2ENsP0xL/V2N6R70qdXddM3VPqQUOnpD595mWRSkqQgIfVG47kt3SB7Z
 8N/tLHhNvG6+30lNhzc/F89tdmILZIhk0D15gcNcWaJ90xx++Ua/MCzmp2wD6GDTuoHkYEt4hXV
 tO1YDz8vjze5y8gIf5ACLG3claNn3De8Yxn7RhBwfuB3pg6YxMWkplKp6r2GbZJdQDHEpWdLJEL
 owN4Lg0hxbwpY928+IW+n+cKYnIuhUEC+JQbKv8kTubPpXwlNvRuGlvIyVrD413i2bk0gWxDFCp
 W78klu2oVB6AoJg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c1894 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ZBRMoY1RY0NPWYz5CrkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: XtpgIgUdibRbK3cGtAV5QdWsST73XjH3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX7t5HUuURL21s
 A72kUMgyXd0o8f0tnh1v5UYmtteHckk2zTpv7763pTRNiToF85v/kKOw0Q0cZRg2FXWzFcQdFV8
 Ze+dudYmAyGcrpCf2pCI0UeKGaJT9zjD6sFgF8H+EpXnyDV7x3q61wWwjZRQvJZv1V76Y7/p1AI
 2pllsBCFVui9RGLeAcH6V/eI3IXUL44O/B+xjDqq3aR4K4pvJgN+qg25d/Xi9lTNMdcXcnw14Sp
 /E/2JBncIk6g5kkzjFpMqYX2CvsvpvZsQehznb4ad2ttfsQ1GZlqRmqZn9U4L72eSG1n5oDB2Fp
 hL7ftVFS1ZtMJBs1SxmUoxTAysNW8QAZTgK1kPimBgmVBRzEdyGvjRXCf/ORHlJal50e4XxfEx7
 j0LaD4LsL2AtuksE4tCQrFb2SO2gaTNPcG6QCk/2y6bzaM2xDsZ7XrOx4bwmmoGzfW0ioCLNO09
 EaxZCLlXcJUcA079Tsw==
X-Proofpoint-GUID: XtpgIgUdibRbK3cGtAV5QdWsST73XjH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010629_174900_C2A8CC74 
X-CRM114-Status: GOOD (  16.63  )
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
 drivers/i2c/busses/i2c-mxs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 08c9091a1e35151bac8d4adb80abdbd29a62b95a..bfbd96ee2f483cd1dd872c3448eaa6a17940d70f 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -849,9 +849,9 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	adap->algo = &mxs_i2c_algo;
 	adap->quirks = &mxs_i2c_quirks;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 	adap->nr = pdev->id;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->of_node = pdev->dev.of_node;
 	i2c_set_adapdata(adap, i2c);
 	err = i2c_add_numbered_adapter(adap);
 	if (err) {

-- 
2.47.3


