Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADE8CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 04:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aU3qD3/P4X3aGl+GxoTABgHAWYmZmNCs4mQEkZTLmtc=; b=ZddDN2Xj8ezkYVUD7T9GQbotGo
	vOL1xmkjb0XQaCeEMQdo7pBF+TbluRaQP8taxepE0XCq111C3jYJRWwksnONIdEi1uggJSiFa6x0J
	M4Z5oUfqm//fMtsKb7fTuTRvnSUVxmxxnG/HLjwClR5c3y/mQI/SheAbQVQDbbMLjuMNqKVmy/hR9
	PR/D6nsjQDtV8dFMTkTqY2ggvEwMC1fAgOR6p5W+2WX5buwbvEWE6+Gq7dtnrmMpq7Ok265odMWNE
	XPLCJhJO8Wo0fjPO6/PKN4axzVlBTdkbvcOYovULfeHz0rAFOk8TPQvtNdXXwxEhCYlxTSr44/zq0
	5R65bHng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCVxa-0000000AwiZ-30W6;
	Sat, 25 Oct 2025 04:32:58 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCVxY-0000000Awgg-3hMX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 04:32:58 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-592f098f7adso3329162e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 21:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761366775; x=1761971575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aU3qD3/P4X3aGl+GxoTABgHAWYmZmNCs4mQEkZTLmtc=;
        b=Qp1pNLny1e2N6JjWUH6sJkl6tN6K2g39BvK9A1P0vrgTp4gs9Eo4ypkstQSGukXPBZ
         zla4sVqGy2a27SeTeSQ60QAglNdY3EF/ujSx16YsOBSzFptXxf/BSX5bGcZyhp0GNeiv
         SUw+WvqZtBSLyWW0c7ajGJeJQqDQamshMWc0e0jt88PnaopUTJkRoeRalK/UPEkW83vm
         Mmg+MQ3yG9L1fXgpAI7zfCF5NlFIH7AhGOZ9QMTZ/C43bZfP9fMnG2Iq9EGoD3BZ3Xtl
         S/VmlHs93i03HQQNK+ljNzR3wChpDVfgn/MrbibadVDC2al4m97ZW4BlXN+TMbQ0Hvd4
         qISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761366775; x=1761971575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aU3qD3/P4X3aGl+GxoTABgHAWYmZmNCs4mQEkZTLmtc=;
        b=K2Bd0gPP8+A8JA334Q3qYchHB+ofcQKI7X7bC4MIQnMSvyCM/NsVitxeaqCk5pM5nP
         923DSAwEfJFxaVqBsseqjoBf9K8H6UaszQXJhPxukGVrAoWjActcHDhvnXPO7OCbJoCy
         IJu1Eb+p50y+3t1ZFLPN+5lgWSMysHHFnBR4frtNb3OLlKAca3KzjkVHVTnPl59TDxxt
         wCPGhsmK4NQki4It9z3WXSLFYRwt34wLddfo6hxU2w5PNVUhTaS1mZgAJhXB2gizqiIS
         Dvljmr9rF0bNc/XP20u7RquOz9AZy7NO4CpoMKlZnL9vgnkNZ6GZAuspI/RcEtD01mua
         a6Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXaXpLmIOo7IfWEAf7qfYgc/OGmN1V73tHpw3WjDIizdlH7V1kramA5tIQuh0TwBjwyv7pO2AqcLEeyCcOhwgUD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0jFr/PXT6Uxtdfav0hgG0zlHd/ddzFekItm2HN3jANE3hcHuI
	LymMbAYHDplbdXO4fCMnoWV5lEsAL5Zmycdsa7dKYyNyDfahWKaihe0N
X-Gm-Gg: ASbGncvy3p8Di2x2N161qOigfdfaayc7VQ8b8w6NhdFHyRBapoGmyGE7QDcJEDfll2w
	3flKSdIoyAQBiNTKXb2v8sJQAsHymWTqVfj/skxEb2ZKtZjr0poommm6S4UFQlgLA5Dyal5yKim
	Oi8ZabvP5nGkaRcfzzwLX0pS+5V/PEs5w85JRSuktgaXrij1v2b81lSebVHo9P1YtaqafDnqUqr
	JWDm3lHOxvObj55BxOqvxG3OqaqjoQNPFVJvIieup4+cu9hvv8/iZNfihJ62+lFQIhh8E7093F3
	j5Xrp5qP7DxnxAdHUAaCqIWJbfd4W1PAJLmOqVGyGXsw3p3byMXRWCQDkamXOqQ0G5x0Wm1cQmd
	e5H5GGTW04QkPkCoixM4NOhbk4lOFiYSKcc0AF06z+Ibs5JPeo2GBNZnPDAkhsB6hhG99/h+7W3
	XW
X-Google-Smtp-Source: AGHT+IH/eF1EDfMQXoqCn1NhnMmPtXp6P1wcPRtuabMRfy3u2y12SFECgEV2LqHRoicJ+PYpOzbYLg==
X-Received: by 2002:a2e:a916:0:b0:376:4430:b545 with SMTP id 38308e7fff4ca-378e4648542mr13765001fa.49.1761366774636;
        Fri, 24 Oct 2025 21:32:54 -0700 (PDT)
Received: from junAIR ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0ca7a0sm3409241fa.33.2025.10.24.21.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 21:32:54 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] thermal/drivers/sun8i: get calibration data from two nvmem cells
Date: Sat, 25 Oct 2025 12:31:27 +0800
Message-ID: <20251025043129.160454-5-iuncuim@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025043129.160454-1-iuncuim@gmail.com>
References: <20251025043129.160454-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_213256_955322_7069AB7F 
X-CRM114-Status: GOOD (  22.53  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has calibration data in two nvmem cell. To be able to
add support, the ability to add data from two cells into one array must be
added.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 77 ++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index aa496e1ba..d6d8e13e5 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -303,43 +303,70 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 
 static int sun8i_ths_calibrate(struct ths_device *tmdev)
 {
-	struct nvmem_cell *calcell;
+	struct nvmem_cell *calcell = NULL;
 	struct device *dev = tmdev->dev;
-	u16 *caldata;
-	size_t callen;
+	struct device_node *np = dev_of_node(dev);
+	struct property *prop;
+	const char *cellname;
+	u8 *caldata = NULL;
+	size_t callen = 0;
 	int ret = 0;
 
-	calcell = nvmem_cell_get(dev, "calibration");
-	if (IS_ERR(calcell)) {
-		if (PTR_ERR(calcell) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		/*
-		 * Even if the external calibration data stored in sid is
-		 * not accessible, the THS hardware can still work, although
-		 * the data won't be so accurate.
-		 *
-		 * The default value of calibration register is 0x800 for
-		 * every sensor, and the calibration value is usually 0x7xx
-		 * or 0x8xx, so they won't be away from the default value
-		 * for a lot.
-		 *
-		 * So here we do not return error if the calibration data is
-		 * not available, except the probe needs deferring.
-		 */
-		goto out;
+	of_property_for_each_string(np, "nvmem-cell-names", prop, cellname) {
+		size_t len;
+		u8 *caldatapart;
+
+		calcell = of_nvmem_cell_get(np, cellname);
+		if (IS_ERR(calcell)) {
+			if (PTR_ERR(calcell) == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			/*
+			 * Even if the external calibration data stored in sid is
+			 * not accessible, the THS hardware can still work, although
+			 * the data won't be so accurate.
+			 *
+			 * The default value of calibration register is 0x800 for
+			 * every sensor, and the calibration value is usually 0x7xx
+			 * or 0x8xx, so they won't be away from the default value
+			 * for a lot.
+			 *
+			 * So here we do not return error if the calibration data is
+			 * not available, except the probe needs deferring.
+			 */
+			goto out;
+		}
+
+		caldatapart = nvmem_cell_read(calcell, &len);
+		nvmem_cell_put(calcell);
+		calcell = NULL;
+		if (IS_ERR(caldatapart)) {
+			ret = PTR_ERR(caldatapart);
+			goto out;
+		}
+
+		caldata = devm_krealloc(dev, caldata, callen + len, GFP_KERNEL);
+		if (!caldata) {
+			kfree(caldatapart);
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		memcpy(caldata + callen, caldatapart, len);
+		callen += len;
+		kfree(caldatapart);
 	}
 
-	caldata = nvmem_cell_read(calcell, &callen);
 	if (IS_ERR(caldata)) {
 		ret = PTR_ERR(caldata);
 		goto out;
 	}
 
-	tmdev->chip->calibrate(tmdev, caldata, callen);
+	tmdev->chip->calibrate(tmdev, (u16 *)caldata, callen);
 
-	kfree(caldata);
+	devm_kfree(dev, caldata);
+	caldata = NULL;
 out:
-	if (!IS_ERR(calcell))
+	if (calcell && !IS_ERR(calcell))
 		nvmem_cell_put(calcell);
 	return ret;
 }
-- 
2.51.0


