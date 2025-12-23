Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EABE6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoQy+fdvtf/HqhhS47O1zByPYj8iqB0bW0jZ0bVe61k=; b=kz8UsiUW2z/K9cJucBYRgBGtzu
	hh1XyQjwa81bwsDKcIH1aroVwz30OZZr8DGJR8UI/nqGi3/KDu+jKlyHYCRAr09liINQgKRof69Ad
	jjnN1EbKmkKBxvQDurybiq1fAFwLQfEl5ViJns/RgXe5xkskcoYG+XDaKlsK28z/H6rCfwLdis6Ec
	rqb2rkkIiVPi5BnYsMFuCRivz9au58BoRnCfcENtI9mOulMzbMkcYXO20Ys70zZKwSBtJz1Qp+vM1
	XtJNl68ytu62Ve2BbtQ7pw+Cqq0PJdaVtuv8jTwmImEDy8UuBdQjmTjh7oWSfRgvhwtjRXu5uw0yX
	vqwAV+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGZ-0000000Eq8U-3xr1;
	Tue, 23 Dec 2025 10:05:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGN-0000000Epwq-2uew
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:05:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9uYkx1530068
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zoQy+fdvtf/HqhhS47O1zByPYj8iqB0bW0jZ0bVe61k=; b=CYPsozokpGPmQJ0L
	/aQS9fjYK9EIHelqTgwlX1va4a/az7er30jowGpk0BLmKujXEtSSbLR3+GLrEosy
	Qc/fk6IXN0QOBy53r8b1OPbFTglsHmdDIvcxWY/n921QHZ3vx7U838WTM1JyyRGe
	aBiJiAIJ4VGb2m1OKdkAeOl3gd54owOqb0I0e1zImVxaC4zirfW3+XEBASirQ36Q
	/v6SNJYGpMUjDa3vtsaXn9lOGz0/T6q5hHspXJdtq0HgKLf/cjSPtxJHufQr+iID
	kMC7/N+ZbedAAVw+pPATFVmif9RLDLV6HQs69kvd/nlhd4AQPqtE0L01CXF5AvQP
	JAvUQQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y3ghe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d26abbd8so130874931cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484306; x=1767089106; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoQy+fdvtf/HqhhS47O1zByPYj8iqB0bW0jZ0bVe61k=;
        b=KGBIx6dB+9i97LXmKQ0+vlPcanrvZYr9oSxkiVfSk0z+V18icI3B6uK73GTX6kS7uz
         8DuM9gWmwoJgKMPczLSKoUibh0gqWqdPRWLDJvYEkugeYYaSk1WYLOt90q0oh6c5c/ni
         wWuPg9I7ce3REXz6RP+koNZLz5HZHY2oR+a7/cyMozcfq42yBpQ9e+Bl7a0dzpx6c5yj
         w/UkKioyfJu14W4CcGznszsFdBK1MzUBAaBYXKuJ4D5q81bhUx+tmZ824c2g3yWre7OS
         FtJbfaaiLIl2fcQNyYetA/19kKna3WEemBm30lVAm6gW5+H2bEnLga6pez8858SaJzRP
         pBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484306; x=1767089106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zoQy+fdvtf/HqhhS47O1zByPYj8iqB0bW0jZ0bVe61k=;
        b=JM4A68Lr1OpwNaOkBa2GLjl1SR7GzCeoG4N5GTwoablxIVqhlIGkr9SWylAuHMimRS
         HToj4gw5GghqX0PVB0ntWAMgcuQfi8X3hzgYcFHvC0hEq8ws27ocg05hZzZLeQ+VjOYx
         JAH+E5idnXprsNVBSvAaxrxx1z5jqWmnkFxQ/kxvYmp1+HmxtcxDOEPcnGhNBvvuaWjD
         ANG/Vq8ljJnNIyOxaSsI9+X5AL8Vh0Bvc+K2nxgKxSqx0vtIPLEEwNqFMBJAMEmYBdTI
         JC3AsJ5IWsJ5FqLu5mJRFjbS2AuiDXrqpq6TVD+yyHquw3oo6EkTyVh+SWxV5Y5G3ek7
         y4nw==
X-Forwarded-Encrypted: i=1; AJvYcCVhc6FvQil8e1mepVFCBf9WkuaN0ilExEb4dftT+aQiLF5GfFN8N8Yi7YcY6jLFh+BNe+mE4eAxzdQ+LZAO7f7x@lists.infradead.org
X-Gm-Message-State: AOJu0YwWjPofhW/J9mvSQR6fbZkHaJaj1GwoAelgeB1zbEFLl57YaO4E
	YRuVbLhAaHwbeUR/viYr+Kj6UIn9E9C+y1vhdzHe28S6OeSQNCLvPnszPnfrlB1L0riWv2z74xF
	DSlNjOM+XWuo6h8q3wRg36XbnsQlc0OdO4cfbiODKuU759H6aIgcoh9hCkWKLRYAt/JA79FsPRZ
	jWMg==
X-Gm-Gg: AY/fxX6DLkC7ZZwJUMWIVCLuNMA7sIQEQrRDklN8MnCllfkQc1FbBlb++QrE0bRO4sw
	UI+8zDHZj+agkEdAUx+BnnMtCSWS8xkKSz5uq6y8y0jDc1bC6aOhzeII+SY7MoF27dxZ79hViwi
	Lno/ElH5vW9IUfoUJpP04VohR0z0XTa+eTdIvarp3fF9dMYHluO+PXVLqDLbGEFUu1dHJRGFuyZ
	9yJJ36wLv+0qjuP3aA7SSh7HtyZGbBBsn1rMRaYkiK+oGpf8nazgfCuYj4uG8lmK6A3dS7voIrT
	9eo8w6ft5HWXXCSbqtZXEIFXYr34E/xM/AYp2oomzDeRuZOE7o9XRMfVEOp9vW3vvGxLHQKoILw
	1knPl/tGgQjtlj0lYh/loEAAAtKgiBq9jYyMgank=
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr216109901cf.27.1766484306216;
        Tue, 23 Dec 2025 02:05:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYSreD7Y+9GMIiyDmnU8M0Z0VrGwNbAb3A+4vjzlYqPF8ialPbc18WsA6KQA14vybQlLSi5Q==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr216109221cf.27.1766484305734;
        Tue, 23 Dec 2025 02:05:05 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:43 +0100
Subject: [PATCH 05/12] i2c: omap: set device parent and of_node through the
 adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-5-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nf5oJf3O9aPMhO8Ad3i1lt+LuRiSuT6c7NtPghEnn7A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlA7HFYEcqnhzElUdoOdZ+7alBl6UxXjVygN
 v/t/qSpYA6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQAAKCRAFnS7L/zaE
 wwf2EACFpsKQZzzmiZCLCkquEwqerhjh8hoJkP7q1sDxU70FDXE79o8YJoJ2soAlRU0+A81A3mQ
 hkMJEk8DbkFqKASaw5jf415hONmKR9bkn6sQIDcxVzVjeFuGrzbvKpm5t7tWQps8aS8yoinb3b1
 hm7g83C6NHjTOILFdzPzTtobZv+yzAeYgccd8PObZ5CiUBWM6XcSwJTDr4mTD9pFzXGfXBaFB8Y
 ZSb1vxzVPWLjVlX/EtyRKpughnvLg7NaMu6fkfYLHLPh5oJ+egpBlwFgJ4+GnbQK8wWevc/lA1/
 TrjkzqroV6IQAcgqg712YiLNOYUlZzj6c4J8uYyFkYpxbZ7S8nEb+34+gfKNYdzckwC1tsSgxMb
 gCEGesh8sRcoOg4XpUNn9dYDcW/NxbjB2G/0bb+zgzMjUj1w6CB1qtFPsybwK944L7HU6Bs6Iuk
 YtrfJb3eo+mhFeJzjZjiDOFj1R/3MSIfYXzSt7Y5XoeOrRwEdMu+rBIFj++KEWFyR+gHqVTdTvV
 qYy2SXXtmlHyuZC7qv2jxaMV7mcKNZqEhyQHozb0midmk4BlPCfUoYNi9sqHk7hnUZyuNhVDDt3
 kXwkFF5NCQN7UlW72CgJsVRsCjl/RytsZJLrVA/Ek4JAWgFLKV7PcHZ8sEYs8ORp0r6K+ml+CJe
 zQiWdDnKBY0L08g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694a6953 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=H-w5s1-Ky7DYDkcl1QcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: DLMO9JFwmRY3SZc0Lk8WkB6hzVuHRiW_
X-Proofpoint-GUID: DLMO9JFwmRY3SZc0Lk8WkB6hzVuHRiW_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX3cocret8wSyT
 mGWsX7BQ/2VKMoJFWagcTSzJN6iNFn+Ov2/P4QrDswv+/HotDyh6S5MUWEfyG/mdaZJzxHOCNrW
 3PVMguR+p5JhLADRGoe8+6tzeAeOwqsT4YME1M+lDzlzxWaljAoVGqcL19h4RDK2w0DKmXA1PIi
 Ea3QdfXMGOYxlgF2yjrwiEbqi1ymbYNiEkibv2iZXYv2T8YwHt7YWn+IBmcQovLE5Zo/u80nSN7
 P+gDiEzD5YkidZNjezpmbpnCx54cfb0rbzPfqNQknhpY0i2tioRo7u2Zy1ZgS6mhsR1Xt/VpbMw
 HBuxTbqKFFqVXoTYIJC/3DRe1c2uJSM6dxqtbr5Ip3xA9jwg3jFBl3ZLZTnY9sTeKfqXySdw6iU
 /GrXjeHg3L9XOAduGP1XIa4VZ4SCjWE10GMNOHHr6aQL6Oo7OcpCU3pmsARL93/bva/Awy6LZKv
 a5E6GtSgod09Yog72rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020507_760473_418149D2 
X-CRM114-Status: GOOD (  15.49  )
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
 drivers/i2c/busses/i2c-omap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index d9f590f0c384340dd31308bdf9ed0cb1a1a2ba8b..f95f31c521314e1d67f3d5b34bb44fcef557624f 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1496,8 +1496,8 @@ omap_i2c_probe(struct platform_device *pdev)
 	strscpy(adap->name, "OMAP I2C adapter", sizeof(adap->name));
 	adap->algo = &omap_i2c_algo;
 	adap->quirks = &omap_i2c_quirks;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 	adap->bus_recovery_info = &omap_i2c_bus_recovery_info;
 
 	/* i2c device drivers may be active on return from add_adapter() */

-- 
2.47.3


