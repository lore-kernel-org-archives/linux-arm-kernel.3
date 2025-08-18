Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D47CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 05:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0xnmUoPbLe3vT3NMmzy6zQdJ0mJHLlIGC1PWoFjBq8=; b=d2JJOcmuLY/YRB8oekuXklzjB6
	KQt++BzwwahUYF0zAhOaOFx1zZOrav6vhvCBt5vL/0DruX+hX9BWcMNfiuY2S7cMoKiJ7oTuJ7yo0
	zunc63/OOy+TfcS8UJ3ciiNDn6bjIxWyjQJ9GZtPkcUQLFe+LzOLJ2xgu7cTRimurYcbT/Bdgl7gM
	MXrZZ5dFl8qKD78GlsNmvZZlW9Ld3y6+leB+uxORpyVmWVyCGesidJvniINkQirvzPvbhPbWmr5J/
	J1G1pRTHajPWkye7gGOk2F+bQ7LVO20DykC7+NRmBvsFxEaHYyHdbKMXISUtnmg3vU7VkRwuS+4Ie
	smx1trpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsEd-00000006X3F-3OuA;
	Mon, 18 Aug 2025 05:16:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrgl-00000006UA0-0Yfg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 04:41:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HMdKVi010617
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 04:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0xnmUoPbLe3vT3NMmzy6zQdJ0mJHLlIGC1PWoFjBq8=; b=neZ+gXwxh7DYoV3Q
	RwltZb/MFrqFAdRbBoJhw1q+d3H+1qtZB06Hhg9owEftks5nyuSqwwBTc6K8ZRHB
	UUEgboC5ZjnJ507kGkmVx2XiAdPOFb5/1coFKYii/0nfWT3S9phecWXdshQB5yVb
	PHqKFFy48yWYBvUDHa9RfiM6gEZ4bOwabPQeJj+I8KruCAZgCAI3mmVrJy/5n1in
	AcRcurrw/5tAVtwjVQRVu9mO2ZFloWMlLxsc9svEK/TeG4ntUTXgDP/oNoz29IqJ
	UZJwFnIOvJ5ViXaRMz56/QdExvMzuKMK+XngfH6dC1/PxDbYMbBtcZP3TYjS/iZm
	fEVaCg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99k5qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 04:41:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458274406so92155345ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 Aug 2025 21:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755492102; x=1756096902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0xnmUoPbLe3vT3NMmzy6zQdJ0mJHLlIGC1PWoFjBq8=;
        b=YgVF27bSt6K7WnRDUednJdGvYp3Dy78LD/BQTfgnK3NAdu3RPpDItVLfHFLgx8Rqa2
         eS2aj+6+yeqT1PrL++FjALVthN/JIBS7eA5sessRFzUUDNSrVM0vmnI614KpjoLBqVMB
         ywTf1kav+TyLv71PUywHt0K+7JB4mSVe+I0M4gNzZfrk1PAaANg3fuvhjLj+sYYKUE7e
         8FELch4FrWsbHdcbaA6WMgic6P+UYLHUMxXsuzlK9ytLsxpRZf93RzfGX4pKC7SqqFJM
         m90KiJQeW7JMIZFcDjvEbP3sxe/ZtK6A6fd/jhObsMHgIGw0H9a+CuwjU3GxIpZ4oocN
         Hbrw==
X-Forwarded-Encrypted: i=1; AJvYcCWc4MrD3YtOIUQe8Y+IPR8Ip3Aqctr0kOnnA7Ks/MDikAMsDxa8IALDAmvCydcInRdAcCDmRQoQzeNKXuChpTIS@lists.infradead.org
X-Gm-Message-State: AOJu0YzyX9kihZERxUOaKQRcPmJPDdELbiVxKtnjmrc2KLZnGYXn+51o
	HxRH4M/AvrPybYYA/42eTOsUsv6xL9kEbBEw0PZR0b0NOfxsTilTQhp/FIPmuDoa2ngGQ8qxrR5
	fvmcZs//Ptk+jVVc9jOz00QL4yRUWN3JoUHnUjbsgkFyMF+HSTb5d5VvO/ro/MwQyo9RW4UBVcP
	obXw==
X-Gm-Gg: ASbGncub5/BinFSXmULp6iGrL9gMadbx2sPI7wqJDYDm5HN/psCR6g+2XlTlJNu3Fvw
	1UovPfCsyaGYSKYz9RC2NX643Mvwt6NsxwYvfU1TfTuaCveMr6bLA9Bumxd1vg7bQft/59nR08n
	wzG6Qw6yx+r6Y+VRKtLSZBghXCamZG49ShQuYpxOdFMccsI/lbB85GPYPHc0Es36VHmWAYUgkAp
	tuPfJzokKrnq7HMaqIL3n8GMh0+cWpG4meYIFkLJ9ZsmnVK8IjAhAO3AsPGEO2hQWQy1w2Yt5iD
	D99tq6PyuK5Eprc8N0VYh2496zV7O5dN5aMgMrVNaUePaEIhtjRyzGGQo/VpLpXg6+OeKgNj4/o
	lxYcLToS3rAxQR97FgFK8k/N3If8pkVY/l56oVgYbAXnasU5MT8S2bsBk
X-Received: by 2002:a17:902:da8d:b0:240:719c:65a7 with SMTP id d9443c01a7336-2446d6d32e0mr159087545ad.4.1755492101665;
        Sun, 17 Aug 2025 21:41:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2thLy29PrxJ70+GSafoj0wED9GTya2I7AqB3dNKWfIa9uz5OFViAwXFdIZoBJWmxi0q7J8g==
X-Received: by 2002:a17:902:da8d:b0:240:719c:65a7 with SMTP id d9443c01a7336-2446d6d32e0mr159087315ad.4.1755492101276;
        Sun, 17 Aug 2025 21:41:41 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53ba5fsm67547155ad.113.2025.08.17.21.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:41:40 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:41:23 +0800
Subject: [PATCH 1/2] pinctrl: sx150x: Make the driver tristate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-modularize-sx150x-gpio-expander-v1-1-c2a027200fed@oss.qualcomm.com>
References: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
In-Reply-To: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fange Zhang <fange.zhang@oss.qualcomm.com>,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755492094; l=1605;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=GGuWQsaFj5N1Asx+oiUdrjXtCKQPDaS7TzmDRzr00Zs=;
 b=tZXVod/q1p8wOuV7N1MK2nF9TrizbNNHavYakcjr8j4B/K2tK9z69Df6o3cEVnvu+upE1qyfH
 qFNvcdEP8QBDEW8+HicRx+0yB7Asdqfme9BgIIM/a8FZQg8jTsMVlbJ
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Proofpoint-ORIG-GUID: KUUGt1jjl7uZwNr5dTMWeXjESzXA8_IM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX9KoT+MoJRlHN
 54+NAFZiNQ1TqEfCrr8CrYNFVp/YlO11neDw8tOmN3oV1xIkL/ByBnVPcrxVhHRZgB5/9SeP1BA
 7ZUnlgQpC6Ikm4uGLifmsCuulpk/caFVqoJ/OmMsKf1t6FFo0g6n0FbEkLj5wdKLncV23nj17Tj
 QWuCvhc8xiYykPwYxue8lBGUHUh6eFGKAsrDsWoaFeNJqzdxVM+e4KT+EHI3S5QlVCAo/fkjrqw
 sAYmC1UwRnP+aI49W6OwvQS06o0ZyuHnc9RNkjSjZFxuK4bKaJSn0zq4T92PaqOhIFFEreCno6e
 fUHsP/V9XL/d7JZ4REB0WKC8uDF9VDRlQZw5IiwtuZarrYH+APYx4sx45YPLbp/tS7qv9L3YJtQ
 qfP24k4d
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a2af06 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jVJqA2H4-3kyb8ebEaEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: KUUGt1jjl7uZwNr5dTMWeXjESzXA8_IM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1011 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_214143_181254_F980C24C 
X-CRM114-Status: GOOD (  15.95  )
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

Set PINCTRL_SX150X config option as a tristate and add
MODULE_DEVICE_TABLE()/MODULE_LICENSE() to export appropriate information.

Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
---
 drivers/pinctrl/Kconfig          | 2 +-
 drivers/pinctrl/pinctrl-sx150x.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index ddd11668457ceded9861438768f89945f2307e31..3d06f02a3da549317a9364540d1b598051b926f4 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -550,7 +550,7 @@ config PINCTRL_STMFX
 	  interrupt-controller.
 
 config PINCTRL_SX150X
-	bool "Semtech SX150x I2C GPIO expander pinctrl driver"
+	tristate "Semtech SX150x I2C GPIO expander pinctrl driver"
 	depends on I2C=y
 	select PINMUX
 	select PINCONF
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 53cf8168b274c5310706512dcd3ba8d4d25f5049..b613568b42b73d1c1b220b641e292055e23f4de2 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -863,6 +863,7 @@ static const struct of_device_id sx150x_of_match[] = {
 	{ .compatible = "semtech,sx1509q", .data = &sx1509q_device_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, sx150x_of_match);
 
 static int sx150x_reset(struct sx150x_pinctrl *pctl)
 {
@@ -1266,3 +1267,6 @@ static int __init sx150x_init(void)
 	return i2c_add_driver(&sx150x_driver);
 }
 subsys_initcall(sx150x_init);
+
+MODULE_DESCRIPTION("Semtech SX150x I2C GPIO expander pinctrl driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


