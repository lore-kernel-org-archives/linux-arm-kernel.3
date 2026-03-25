Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B27109C021
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VgK1oXGIFU+z5TbG7yMMSeCHzb44q+Uk133wfccpYEM=; b=Ro+VhqvXwf9g9qBZsE+XmNTc90
	HZR0qETRiJSNFY1/bYTM9+QvZWidBiU47CniVH7a0YfPY6y2qatlIeLpvQdUcIRknpdS8GyOY8SgY
	5gwvcg1SB5p7QLVmKKDBdPJHjFsIxt3jtPl/7LDW67q8TvQxPF3mZCA5MEhcxX/9GUBmaACxZzpgC
	bvyhCvTiNUFEDuABrtIvflhlhYxzWA9uCw3HJcGdZ3dXLVjdlOi9hLmTJobwExubXy045ihdE9cS3
	OsE1z1OdBjApDUfsGjOMhvRIAw0/3ivlnqCNJXv4yYw/AToGAiNpo+8S/0oHcHg0gxqelpOX67aUI
	kmBLR9RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PTp-00000003e5B-3jgD;
	Wed, 25 Mar 2026 14:45:09 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PTn-00000003e4D-27Ae
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:45:08 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-35c0e7b751aso879090a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774449906; x=1775054706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VgK1oXGIFU+z5TbG7yMMSeCHzb44q+Uk133wfccpYEM=;
        b=Vv+VRV+TEtHeDBRdcMYhnvK767pz/QnLB6zZCOzxakaJv3kNXNwxm8VhigK+OqCgRV
         4kQ5mBcMGcAmuy6Iq3RwtBO1spSY3siI+460GSH6cDdSnBq7HnT9HLwOG+ro23HUNQsm
         ELSimEIRtEni4x5O3lXFPH2gXMkvajXXywcXt71AdCpR48IVT6Ct3OBFSb8HhDBHWKCN
         r3V2IFDQ+g2wJ0mKgpVaOSDLhj0E+03h7nuzvqFsE6AxnvCuPX3bQUx1UxJCgsprWsom
         Pcz+0TuvDElVAgGDqpNLHhpSqTdWzxBafMZ8/EeKQjJI42ksPrF/DPWBPPltdHd2xEe7
         OTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449906; x=1775054706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgK1oXGIFU+z5TbG7yMMSeCHzb44q+Uk133wfccpYEM=;
        b=ngV1/EtNRvekd8wOPvuq3OJE5Pt5nwfC9jyS5MyAONj1Hamfl5Pt/gvroE0c8SIV79
         DOmnNJLQ0Zr63akSSZqw49yF5+ZjraCYGLxww0eyh7OOL9Wd/1zkaCNJdFpY96RXysSx
         uZK3v6CUg3fK5a8+SSUOE5w+FI283qplp+UgRVpM2GHrnM+CoPEbGLiCibR+fCUWB1eR
         lLCrrtpCONJHnlzPnuSsTMLh6su4Zgc3jL0BxBq71MLielREYXoG3Q0prvM/8O+zUed6
         6W+zVlD59aRidURvqWo6I9/MJuYw2aMqia32Z3UAmpPbaAJ7A1zLKHOczl31BaeGwF0d
         2Y8w==
X-Forwarded-Encrypted: i=1; AJvYcCXBxrk8yMe5mJ8N22DVEg8eMCLBQ3ASgE0x5ytgLhMZWQWNtNTvDlcOLE/HyUo4XTTpbPnzlO7p4T3do3lGrKm5@lists.infradead.org
X-Gm-Message-State: AOJu0YxMEvsfFIDjVrQIHyuUq3CwDYhb2oLUbifd/ZtvAO8jTgP0baAv
	1RSylV1l8PPdUB6p6514Lrv9KnPsgt8blSTMin/G/i2/asW81zDjZYUk
X-Gm-Gg: ATEYQzwwAe/O2en2mNe/8aFsDPF0eeF45jukt9JPLXugPXDX67dyLTsOHdwhVOgposD
	aYrGZpjgGRPtTXFWoDhRdpjtF4eoUMAW3gYq4VMoLVvjwm2d4n81lw6ze5iqC/ss8UbEkMIQ+Zt
	JhRnMKSonEK3d4pYKlA2mdGcWLisSH17bAwYCXEJ8eTaVtM3htpw2W1mdIS2NTFhX108S5DOFsa
	EQOXJO6cQFh+h4YGRD3JXGRv+GeYWudYCJ1/r2j5Xkd0+kxNqdHfKcTQXfLYO2r07KYs4W/x+hU
	Rrhz8fJnlr29aUb6S8Jm6ZRCs6riY0RH7eb4d7j6i+e3GV6dbSiHpEGXYSZiInkAUFDkki7TIKM
	7ShSO9uOKmIjc9EhNttyRm9DM11gbdHFN0hEZxEVL4hDcSea0uu2YLuF4xOkWDtcyqTX/GiSDa8
	5ThVxMQVfB4HRA7AJ4EHlvHUVsViB9/HVR9BkJffQkKeaBGr9PAKjOhS6C9IczR5XtHOCoB2aBO
	jj27r4=
X-Received: by 2002:a17:90a:d605:b0:359:9014:99e7 with SMTP id 98e67ed59e1d1-35c0dd817admr3310324a91.29.1774449906239;
        Wed, 25 Mar 2026 07:45:06 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0dc6287csm1223227a91.2.2026.03.25.07.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:45:05 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH] arm: dts: mediatek: mt6589: Add Arm Generic Timer node
Date: Wed, 25 Mar 2026 23:45:00 +0900
Message-ID: <20260325144500.667385-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_074507_589606_9A1E1410 
X-CRM114-Status: GOOD (  10.17  )
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

Add the Arm Generic Timer node to the MT6589 SoC.
"arm,cpu-registers-not-fw-configured;" is required
because the bootloader does not initialize the Arm Generic Timer.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index c6babc8ad2ba..46dea445742b 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -42,6 +42,17 @@ cpu@3 {
 
 	};
 
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		clock-frequency = <13000000>;
+		arm,cpu-registers-not-fw-configured;
+	};
+
 	clocks {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.53.0


