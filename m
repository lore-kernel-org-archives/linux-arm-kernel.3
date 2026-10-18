Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFDBCCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A95fhrvfAAlu2Cvs/sZqanN19o2eeng7TB9Tzs9GgKQ=; b=fXknBfOhCeGX3QedjSzR00JINT
	v0hKdw0dZvrHI11vnQ/rJbm/F/bsdH7BkVzUdQ0/c/uVbEqZu17ujPRLih9CaVBIQWLTt81UFhBa3
	Yaz2R1T9VAPKV99dNtOwAjeREO1OTvqnI9f/9h/CWAghqnbQDSfQBQEoFHQYI+R2wGrx74jZ9iz0q
	XJ5cULnbNtaGnQurO8daub4HCbBFY0pkURuPf+AYCeZIOnTCSKz2c07TRAIJvJD5Z8fBoA8kXs1FH
	BUCD19ztWSj+7GJYAlWQjB7SnWtP7qkj83VTC3K+yv51QTJXf0CIqMKI1CPw8yVBpMBJaVea6tViR
	9fpDM7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIRnC-00000005ve5-3rhb;
	Sun, 18 Oct 2026 14:23:18 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIRnA-00000005vde-2hUf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 14:23:18 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48de72fc832so958118f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 07:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792333394; x=1792938194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A95fhrvfAAlu2Cvs/sZqanN19o2eeng7TB9Tzs9GgKQ=;
        b=ZuO+iUxWDCSGRzub5ZhVK8aec1+91rnF+b/O2scC6ZCOt5mi4TmMQs5kCloVws+g1q
         mULgtC2Q+R+VTf69kn3hMKwejnv2jG8fbvj2d78Ws9uGfsC2wwU/oag6JSfwHlVoWVfD
         qFaYQoiwuBcUDReKhuCYcoHei2CwfpzlCQxgEnMMy/rdFjdQ4Aa8a4GQG/jdfqZX8ftf
         W2x1z7hYsZEZLr2+twNaGSIxTye8mqHqsJrmbdGP3xBhNNtWuAaAhaS4Mm2++JRo+O1I
         DDmbVTmKVJjxzEaYASB6FVK7CxdkTEIH9meDWuEACrzN43RpQcOY3MEXfbKO3zdVIKAF
         uQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792333394; x=1792938194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A95fhrvfAAlu2Cvs/sZqanN19o2eeng7TB9Tzs9GgKQ=;
        b=aIdYPqpT1fZBeHV7wwG5wrQgVKDXer3pJfNonAdICMpQf+dw86jUxBAbRj3ycP0GLP
         QgiWrm3uewtBJAbgoj4dJXWOi5HWEWELmVnMbJqVY7Sb7JayTf0305dLLhoz6kOUHNX6
         nSHdJQHyRm47lrRHBfvPrEonVG0N2ovP8MnRdsScCCLIhvO5WMt9QOKlaXn0QK6J7csF
         9pX54ForNR8AcBCE8NlKL/oAOlWNbiKepcS5jBJXmlJazZafAZWsFOpbpLYzkA/eaYBj
         uMfqvFNHX0HcpDLSOhbLCk/6QfuHPsk1Ojz7m6hQYsl8lqcUnzrXEQbVZaxU2CgDV4mr
         OYow==
X-Forwarded-Encrypted: i=1; AKwUvBy/2hP6wmU8EFm4kr9P8WihVq77WtgxYsH0YC887aa5Ch71s5rlfAUMxk7RjZv5MZ0XMSslmeQKr+66fBHoLOX7@lists.infradead.org
X-Gm-Message-State: AFq9FYKBg3qpqKBgWfsdnXvnUDf/AhTlaIctJo6wGCOFGcvOMow7koTI
	Hc0d50kZVjKIqA2ovUiw7gg6kh2dXM8MV9pgvTwM5ihhKeokz2ofP5Zx
X-Gm-Gg: AYBFou0gcUx0vmlCoiRy/AgRSmp/vx6KqESrQNfGMbC7miKnh9KrC63GIuMwIHpQPW2
	GnM6MMO/JsAJgw+p9M94anincZksRMm/Joi8t1pOs7okuv4WgqZlqSgnkmuCv6ht5ob54niZ0RM
	8fF8hsXTL66JD2vAv9CbXJj0FHNZ9n3bKn+PR+GW6+gwwVKvQXaaRXh2hcsiVGiflg8pO1SN+zF
	2SamphywgXOccRaO97sswSgvPN8e78DLkkeaUB+sxJ7QKaQvu91dtmABszG4Do/OAyTHp1RURgP
	kL5iSfSIv9HVnhyHLP06XzLrsIcpeBrHXy8qJyqUz6C63xNaK9EM2IFO+/WIa6uIEA54enx02cG
	7VgrNJiitcQqzgPyAkUNRq0mUUWKLkxHNMtBNHFf0qxHSXDiQwnlPTGowe11R/RByP4HSFf58oa
	VjQohj4uEu7FKlXiFepWOOPwdowLbkTcKtsr6uc2mYvxU93VFm0SBx4jusxAguEfWyCztGFu0WK
	ECSa6oeXBCTohXhMCgOaczXwqQQr7O/lzX5XohsZtG93Q0Z9VaNFBycsozfYEc1BWx0MS3+VWS5
	d3OcmaSbg0gZ+W0iPoY/nw==
X-Received: by 2002:adf:e18e:0:b0:48c:7387:6b88 with SMTP id ffacd0b85a97d-48e07fa0252mr10691595f8f.37.1792333394198;
        Sun, 18 Oct 2026 07:23:14 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8cfesm14971909f8f.37.2026.10.18.07.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:23:13 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mm-var-som: Use the official product names in model strings
Date: Sun, 18 Oct 2026 16:23:10 +0200
Message-ID: <20261018142310.28242-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_072316_704856_7817D399 
X-CRM114-Status: GOOD (  12.26  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Replace VAR-SOM-MX8MM with the official VAR-SOM-MX8M-MINI product
name and identify the carrier as Symphony-Board.

This aligns the model strings exposed to userspace with the product
names used in Variscite documentation.

Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index fd0a1862ce90..d9b588526542 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -11,7 +11,7 @@
 #include "imx8mm-var-som-wifi-bt-iw61x.dtsi"
 
 / {
-	model = "Variscite VAR-SOM-MX8MM Symphony evaluation board";
+	model = "Variscite VAR-SOM-MX8M-MINI on Symphony-Board";
 	compatible = "variscite,var-som-mx8mm-symphony", "variscite,var-som-mx8mm", "fsl,imx8mm";
 
 	chosen {
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 514cc568fb71..e717bc229d3e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -7,7 +7,7 @@
 #include "imx8mm.dtsi"
 
 / {
-	model = "Variscite VAR-SOM-MX8MM module";
+	model = "Variscite VAR-SOM-MX8M-MINI module";
 
 	memory@40000000 {
 		device_type = "memory";
-- 
2.47.3


