Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B380ED5AE66
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 06:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXBEpFmFzi8INkB2Bb0DSvGG6kE3LNqjdEC99i0wI3w=; b=tosHdkTNZnEa+NnpwJmxklvAcK
	mpkI28XczUyvMmhTSZ5kz1uY3pXrS88T7oCboTE70ZSyL9Eqt3/+mMlc5Y6b9hOWM1bowddpDgz36
	K0AfiH75V+VfU8YUJ7nqHjArCGZLDoar5DC6BNHXQtUpwOEJ01ZyT6DX6k73bhNXZp7zsqr/Hg96q
	Do+lG+lMtO+OwotYgh/MH261txJYNo/tcXtkyHtuSx2x9tecfKmoOGR1+ykzfINrmfrUSHM7EGytf
	nmjU3911F579CWSZ3xP/oj/N2FJ37jmgwBgl6WTKwzlmD9NDEWommz8SvthRiPilpKc+trzSdKbHp
	rV3KtPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8vp4-00000005odj-1Yi7;
	Thu, 07 Nov 2024 06:16:50 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8vjy-00000005nlq-20QS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 06:11:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20cdb889222so6367715ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 22:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730959893; x=1731564693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXBEpFmFzi8INkB2Bb0DSvGG6kE3LNqjdEC99i0wI3w=;
        b=B/d2ZEdRIY4N3RYBBnuZZpUq7Jhg8NyGUXcBgo2lUAqcGni3tPoVUzo6C2mAMaXUUw
         NmStE2BmXx8xS8tO1DGCG3ILO1229qJXgemaK8fNnAa8/SXBHW49LfK3PxP0Brii3ttG
         xn4LrVVV3K1aoOwCAJS4FDy+Gx8N5wkx6pGMzQ0sF+eRIUm0RgVH4/WiFb1HFVBjySZr
         BwBhMMDzKhyHjPxz9hnCxgn8ztDEO71lb/e1bwRGExn/X+lNzM7FtW0/27vYNqPuVeW1
         2TGaf/pygSHIpkhSPiUCGaxxvLsmhorQI48wWDHNgxTOgczwu+E45gZgZmYzxw2bD6UZ
         97KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730959893; x=1731564693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXBEpFmFzi8INkB2Bb0DSvGG6kE3LNqjdEC99i0wI3w=;
        b=BfZj20bcQo1pTXU/+3qvP6pX7NB+FBDkrM0dkEnCz2ZIQUSRZXWEO+ymT841uTPnSm
         5NkdC2JW1F+Hqkqh2BLjUoL3U73UGCDG3Ii5B0SIXBKM1Y0P31TzfBszDGSTsKQfsUOM
         ijMHn6zTNVL8YogIuZXZl6Atw0e00B37rjtkFI60wl2xQt0IDx3DG8pCT91WsNOz7YYp
         0mkOkM+3qk5tTDUZ7nGKJTHdrtI7g6BaOCiWuHSzsW7UP09CfA8Qb3CXrKHppbaTi/E6
         D2dkSShgS/KXnTAFNHj9lb7aIWZZg8mXlAs3Uj3PL2Iy9j+R9TIJC+g1qqr+k/vZ20AE
         a2gg==
X-Forwarded-Encrypted: i=1; AJvYcCVut83PbuzV0P7CF9rexpt4Vr9j6SaeiH30U4yXYrGTdKP69IAqxJJW29gqBuH3GodSPC7v70eSg1GM9bgFZDLx@lists.infradead.org
X-Gm-Message-State: AOJu0YywU00GQbHxnQgoSu9C9gIc/a4TWI811rj419DwQ5txHJ0Dsq1B
	bJXTZ5VTmJA9xIHHpUpvIyQA8d/V9nPOzq0GwBdeI6p36TZoyhqw
X-Google-Smtp-Source: AGHT+IEhLX1Ix3kvbnhGTk3oM5FNMOle9lT4S2S6mmMGQXogZWZm53W55lSd+4P4hV9Wykx6SDq4ig==
X-Received: by 2002:a17:902:ec88:b0:20b:8ef3:67a with SMTP id d9443c01a7336-211785b1234mr10045595ad.7.1730959893349;
        Wed, 06 Nov 2024 22:11:33 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc7cf8sm4652465ad.34.2024.11.06.22.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:11:32 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH 2/2] Documentation: dt-bindings: Remove trailing whitespace
Date: Wed,  6 Nov 2024 23:11:24 -0700
Message-Id: <20241107061124.105930-3-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107061124.105930-1-xandfury@gmail.com>
References: <20241107061124.105930-1-xandfury@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_221134_541686_081311AA 
X-CRM114-Status: GOOD (  19.59  )
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

Remove trailing whitespace from devicetree binding documentation files:
- regulator/regulator-max77620.txt
- interrupt-controller/nvidia,tegra20-ictlr.txt
- interrupt-controller/msi.txt

No functional changes. Issues detected using checkpatch.pl script.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/msi.txt   | 10 +++++-----
 .../interrupt-controller/nvidia,tegra20-ictlr.txt      |  2 +-
 .../bindings/regulator/regulator-max77620.txt          |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/msi.txt b/Documentation/devicetree/bindings/interrupt-controller/msi.txt
index c20b51df7138..2109a3454cf6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/msi.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/msi.txt
@@ -12,17 +12,17 @@ potentially including additional information.
 MSIs are distinguished by some combination of:
 
 - The doorbell (the MMIO address written to).
-  
+
   Devices may be configured by software to write to arbitrary doorbells which
   they can address. An MSI controller may feature a number of doorbells.
 
 - The payload (the value written to the doorbell).
-  
+
   Devices may be configured to write an arbitrary payload chosen by software.
   MSI controllers may have restrictions on permitted payloads.
 
 - Sideband information accompanying the write.
-  
+
   Typically this is neither configurable nor probeable, and depends on the path
   taken through the memory system (i.e. it is a property of the combination of
   MSI controller and device rather than a property of either in isolation).
@@ -48,7 +48,7 @@ Optional properties:
   not encode doorbells or payloads as these can be configured dynamically.
 
   The meaning of the msi-specifier is defined by the device tree binding of
-  the specific MSI controller. 
+  the specific MSI controller.
 
 
 MSI clients
@@ -117,7 +117,7 @@ Example
 		reg = <0x1 0xf00>;
 		compatible = "vendor-c,some-device";
 
-		/* 
+		/*
 		 * Can generate MSIs to either A or B.
 		 */
 		msi-parent = <&msi_a>, <&msi_b 0x17>;
diff --git a/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
index 2ff356640100..0c37e569e6f3 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
@@ -12,7 +12,7 @@ Required properties:
 - compatible : should be: "nvidia,tegra<chip>-ictlr". The LIC on
   subsequent SoCs remained backwards-compatible with Tegra30, so on
   Tegra generations later than Tegra30 the compatible value should
-  include "nvidia,tegra30-ictlr".	
+  include "nvidia,tegra30-ictlr".
 - reg : Specifies base physical address and size of the registers.
   Each controller must be described separately (Tegra20 has 4 of them,
   whereas Tegra30 and later have 5).
diff --git a/Documentation/devicetree/bindings/regulator/regulator-max77620.txt b/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
index bcf788897e44..7484c0728e27 100644
--- a/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
@@ -65,14 +65,14 @@ Following are additional properties:
 					Valid values are 0 to 7.
 					This is applicable if FPS source is
 					selected as FPS0, FPS1 or FPS2.
-			
+
 - maxim,active-fps-power-down-slot:	Sequencing event slot number on which
 					the regulator get disabled when master
 					FPS input event set to LOW.
 					Valid values are 0 to 7.
 					This is applicable if FPS source is
 					selected as FPS0, FPS1 or FPS2.
-			
+
 - maxim,suspend-fps-source:		This is same as property
 					"maxim,active-fps-source" but value
 					get configured when system enters in
-- 
2.34.1


