Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A89F9D0F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 21:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6fcQdJy5Isb05lVxumeVwTz5l2G3c8or1PmL7X7po4=; b=gv0V0bqIzsGHk/LIGi1d1HU5BA
	DLzb1Gd6Nst5LvV8ohQP4totd+Wfvi9fxHnG9dZrf+4+HacV5Z4GcIRWdWYrR7VHX1nYjJDgRLXdi
	VBL39cYr82V+cet51C+iPMJSF8apyoNlZAJrPJLnuxzMwWLMyXeMgQ0iEmx3p7dLTfJLq/PQiaokl
	3R3tKYDin8xiM750hsCdkTzE+CFjFRrcOdMn/Mo2QuxOh03mRJWn75okMjF6O0M+PdsJ7RCLhMMNI
	2LfQJ6+L2/OtT99mHEB5260wyOHy4DY4GMLZgrqS+sLoafiluyy2Ys10pkGO1+Y7kQB97VZsn1nsT
	F2CsJSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3j-00000000Dv5-0hn3;
	Tue, 14 Apr 2026 21:12:35 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3h-00000000DtD-0RIS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 21:12:34 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43cfd96354aso3623977f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 14:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776201151; x=1776805951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6fcQdJy5Isb05lVxumeVwTz5l2G3c8or1PmL7X7po4=;
        b=RVpIzNnI4/weG2pP1RmkjGVSYX8rjqn2dOh+LBIdb2lHaKrKPPQ6dj22zRacjxB+rY
         JvAVqulXFEvw6s3xxp9uZCR+slhOINhSgkUJFoxFEJU+Sl4PEwDMgoI0IN+mlRrI0mI8
         JJcmcyr++OjSxX4fb5nLUjCa2K6WUXxG4jJV+XqqDrAwUBmCRpQWPRF2f8vhryu5c8Ej
         xY+dM/AxetOZDs80EwfSt31IbusRTxkwVTJC5yKMIpkXn8JU/l0GUjnLi6fIdS4RNd//
         LD5LFT7VKmX+fIfC1VI6HcWhaguVateWMyPojvq5VcNckr/QooJnMF5A6q950BoTQXUn
         +O5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776201151; x=1776805951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M6fcQdJy5Isb05lVxumeVwTz5l2G3c8or1PmL7X7po4=;
        b=aNnanB0RFogA7wtqBksubU5cT46Llovq5QN4NlsMyYX1QQ9Wx+DwxWB3GLiVd0QwSO
         yDixi6Sw1jXfhCqU/0WGus4VNpFqDSwOiXtRmRtUp06c3shI/+bUGFMjyYvUkbxH9VUp
         MFTxoF6hfjBZ99b5npigOu8XPYWZGi/iiUjfj597WDQDBOjnc+O1HQf0XkXaTzrqhdq+
         cwvbLqosgFCQfbeOELCo63uHhkH4+xO8jYhc6Cg90weJm0wBz+f1nBesaK7eUtNYejUT
         rSMITl8Y7ocu6Fvow8eHRShoGcDTGf1XeW54vFdQGvhJh8GP2LNST99o1fbX4pKWMkfH
         mdMQ==
X-Gm-Message-State: AOJu0YzRZrXgSkheu4hWG5l9yZmtqHLUdQA2EFdzPsXgyx7rANT09Kbs
	yAVABsmpyY2jTpr8GsoThEz9RzHY04hqHzFPY4E7/g0YFNwXU994YrfoD8MWX2vE
X-Gm-Gg: AeBDieuiTQniyAN2UjDzoOXCo48ZVlvKyLE2hi0U6U/3Vlh047w+WW7pBTErdz35E1p
	lg0nM4A75IDJTSo6F6kJabjJUvfD9obHfIE/pBlBaSATrrEjMEMTSQLnypYvN2GLHFpgfCKDqND
	IvO0p132/E+QceJW8urv1UYADcQxK0gAJ+L02U5ZRss2mHt85PrYrw8o7OImx6tOkkSQf5c/A+F
	2Zuln221wXNAVSGZYDsAJ0uFPNBUzQ6JlRaga/0JmYDYcAUVZCy6PrMewq8UYSopQ69Nvo02XCF
	HO1z+5p8Ug5QmVWh7b2t3hPL2oVMaZavdV0hSmDdwmYaaxTpj3YPeLAeoRGXj9NxvSXGgHjm1cs
	uLGj85AFGvg65zg27ZgCaJReZMi2EDo74x02LePfsNG8KdnvKGncDYFsZexercSxxrGCSlweqMh
	eiCy4oT1deytWtaZMnLd5gA1MfyJSHXDxPBNikS/R9rnU=
X-Received: by 2002:a05:6000:2f86:b0:43b:87bf:89cc with SMTP id ffacd0b85a97d-43d642cb604mr28811174f8f.49.1776201151047;
        Tue, 14 Apr 2026 14:12:31 -0700 (PDT)
Received: from strix.doe.home ([197.250.100.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73b44b3esm27652679f8f.13.2026.04.14.14.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:12:30 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 5/8] ARM: dts: Add an armv7 timer for zx297520v3
Date: Wed, 15 Apr 2026 00:12:12 +0300
Message-ID: <20260414211215.152850-6-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260414211215.152850-1-stefandoesinger@gmail.com>
References: <20260414211215.152850-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_141233_160974_B4B45049 
X-CRM114-Status: GOOD (  17.49  )
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

The stock kernel does not use this timer, but it seems to work fine. The
board has other board-specific timers that would need a driver and I see
no reason to bother with them since the arm standard timer works.

The caveat is the non-standard GIC setup needed to handle the timer's
level-low PPI. This is the responsibility of the boot loader and
documented in Documentation/arch/arm/zte/zx297520v3.rst.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index d6c71d52b26c..ecd07f3fb8b3 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -24,6 +24,15 @@ soc {
 		interrupt-parent = <&gic>;
 		ranges;
 
+		/* The GIC has a non-standard way of configuring ints between level-low/level
+		 * high or rising edge/falling edge at 0xf2202070 and onwards. See AP_INT_MODE_BASE
+		 * and AP_PPI_MODE_REG in the ZTE kernel, although the offsets in the kernel source
+		 * seem wrong.
+		 *
+		 * Everything defaults to active-high/rising edge, but the timer is active-low. We
+		 * currently rely on the boot loader to change timer IRQs to active-low for us for
+		 * now.
+		 */
 		gic: interrupt-controller@f2000000 {
 			compatible = "arm,gic-v3";
 			interrupt-controller;
@@ -33,5 +42,20 @@ gic: interrupt-controller@f2000000 {
 			reg = <0xf2000000 0x10000>,
 			      <0xf2040000 0x20000>;
 		};
+
+		timer {
+			compatible = "arm,armv7-timer";
+			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			clock-frequency = <26000000>;
+			interrupt-parent = <&gic>;
+			/* I don't think uboot sets CNTVOFF and the stock kernel doesn't use the
+			 * arm timer at all. Since this is a single CPU system I don't think it
+			 * really matters that the offset is random though.
+			 */
+			arm,cpu-registers-not-fw-configured;
+		};
 	};
 };
-- 
2.52.0


