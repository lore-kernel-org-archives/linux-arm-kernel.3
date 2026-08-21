Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBCCC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 01:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRGcQvnKLAeLq/zsHD6Ma8Ccz7ec9Urq2bWU0+6yeKw=; b=eCK69Sd8hjfPoLw7wRuAzdjfbV
	E+eX/i6ymNGTjZZGD5RhA3OZuUGhb7X9b0nTPKa39+SmLTeoc7Sk83IXNGvU0hqk6jj9TnseVNxZC
	FjRFoZ5xxxC2Z4wQ2To+DSpeYQvCHsGLUWclkCjzYV3/UiUfVVgDb43hDyTUcBDv6rXSPy3Su6qzj
	AoE8o3HfVHDXv4HVqvTbJd9GyK1xA4tv9Rzj3S5wgXPlVlZ0gX8/MOvPr+BPT5Zdrqc6LEW3IM3Pe
	QiNxJIGvD9EMTOSUIAGw0F8UvIQ2KdqRauQlP4SowTdtVwUotYWxwzrnjRe1o2Qg0knh8QIzySD4l
	eY/SeHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxDkR-0000000COws-1Oau;
	Fri, 21 Aug 2026 01:08:43 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxDkJ-0000000COvF-0g41
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 01:08:36 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so589141a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 18:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787274513; x=1787879313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRGcQvnKLAeLq/zsHD6Ma8Ccz7ec9Urq2bWU0+6yeKw=;
        b=obBfJdwpOZEN0yrCg69xgfgMc893NQR7HyEVubOqFpPYE81mUBn4rKp+n76ZA+ry5a
         iIDV8jVEAgAQu8H+dnDCBxNEx9y8ENBvhJk7SrE2Pj1jA4jjRNbYv4TF5eRlVgx2ULIb
         0TDpIH6mSIjTGQkTcn2PoGkh4/zOO30vWAhqxViUmZ3mepWLqETgYrASU54pSmM3Q/gN
         M6anwXTjiyikC6qYu1KRuFaYPjwPgTdguwOU62gX/UekO1teraXJgXenhW80BkA1dxVC
         ZX2KE5x+jjioLGndx2xk3K2/7MIAa6F4Z+3zhjmeYTmxLVTABHWIYYkltZLuBFN1MPt9
         oCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787274513; x=1787879313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mRGcQvnKLAeLq/zsHD6Ma8Ccz7ec9Urq2bWU0+6yeKw=;
        b=MyFX6ruEK4Xx1DS/Es1QW1HDYbXTEcnJIWMX1R9x821964K4lRkW70wuuEy/00ITDo
         sFvgNBJtKYXqI1H7ruv9uetB0QDRnvTVXXDj3xHkvjGzVwaN+WFhYTkbiXfobKSoRkqn
         gqIUAYUDy/sOBOlS/ymwIdvH08YNLkOeeLEVle+oJLQJ6WjbbTGGfNgBXj28RMUYt69W
         mb3B4Ye/VSo9pYH+pCppFDE4ybyf7N2AvEuZ06wz9lLF5ZLDRwJ7Dgoyb6Z6gwPxoIDw
         M/Hj36C2goAoOVskou5j7aTQEvD1ax2/HbQKUYcwzXcm1pKVaMl605nbpO4WABf4/twW
         JsSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/2tPdp7Tm0ACMRH/IrIraAGuiF4bzi/qO97t2qrmukZgT1TpzH04wNu6Br2RvLh1p5fY3fR9F/ZgtuemOhElR@lists.infradead.org
X-Gm-Message-State: AOJu0YznsLlzOF7GqDVVtf/c6ya+Ngem/sAn3WqWuwRwAD1SiKNM23Jl
	J0SyBoqyktJyu1aCHKWbrGcxxzTxxqDap+g1wg67ubwYLbNiyIn+yQfb
X-Gm-Gg: AR+sD12V8ld+/1iu4rlrekRJWuufG7PBG5ODusedqW18+IKhrlvJgyDzdGWsqbQcqju
	hq7MgtS8JhFCHanzrsndu+Hb0S+G+PagI5s7K9TaLFi0Nw2FEYdWBm1DcbNZfT7MK+7IydXg1X2
	2yDlUrySEdUQP7xsbifm9uwKCfsHOovEhcydb4vG8TGMu1A/jKDoDd0b5RyK35TQGRfjWWNCk2S
	eXkw8eCfYRKw3DSdj1IpahT6B0DB5oTr2Z7JAWeBnn7WN2rro4AKlXYiTJkmGY6ix9kQM1jehKH
	9VuLiemSYsY/z9eR0fXOF650gBAMiVnA4PvR1clTC/5Blg+ld3RxbCEyDsVoLf3cwCHek2c+lFs
	BTEdcBwH95Xa2BabkrLVhfSSSiLmFvvElVIMlv9M5vsmb1fS0qd1opiBvZqmdplskwvuWGrXwgd
	4wqpoI20ufdfs2k5LrFqivuH4L6izXq2yP8/N+v5prgjdtp378mtmhr4Q35I2nfOhNqVkGJ5PBE
	V4nJ8ku5R4MpuSvpu7Dryuq0t9M0qvcdXg3m4uh93CQi6qdQljkLHvokHsfZNF/Cw==
X-Received: by 2002:a17:907:3e9b:b0:c21:9870:c4f7 with SMTP id a640c23a62f3a-c246a6799e3mr240994766b.20.1787274512882;
        Thu, 20 Aug 2026 18:08:32 -0700 (PDT)
Received: from localhost.localdomain ([151.251.247.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm3913104a12.14.2026.08.20.18.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 18:08:32 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch,
	krzk+dt@kernel.org
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	arend.vanspriel@broadcom.com,
	peddolla.reddy@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v6 3/3] ARM: dts: armada: WRT3200ACM: add marvell,invalid-reg-hint-in-rom
Date: Fri, 21 Aug 2026 04:07:28 +0300
Message-ID: <20260821010728.45065-3-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821010728.45065-1-gvalkov@gmail.com>
References: <20260821010728.45065-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_180835_228083_9C28067C 
X-CRM114-Status: GOOD (  15.19  )
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

WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
from the mwifiex ROM, which conflicts with the platform regulatory
configuration on units sold outside the US market. For example:
- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US

When the system boots, it detects a conflict between the user selected
region and the radios, e.g. BG FR US, and applies extreme restrictions,
preventing phy0 from starting on any DFS channel. phy2 works.

Add a flag marvell,invalid-reg-hint-in-rom to the WRT3200ACM device-tree,
which signals mwifiex that its regulatory hint from ROM conflicts with
the platform and should be ignored, so the platform regulatory domain can
be used. This does not allow the user to change the regulatory config of
any radio. It only allows phy0 to start and operate according to its
certified configuration. All radios in WRT3200ACM/WRT32x are locked to
the hard-coded configuration for which they are certified.

On WRT3200ACM, the platform configuration is stored on the devinfo mtd3
partition, which is read-only: cert_region=EU modelNumber=WRT3200ACM-EU

The Linux kernel sources do not have support for WRT32x. An equivalent
patch for these routers has to be sent to OpenWrt.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
index 4ab45f294de2..2bf29981a031 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
@@ -165,6 +165,15 @@ &sdhci {
 	wp-inverted;
 	bus-width = <8>;
 	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wifi@1 {
+		compatible = "marvell,sd8897";
+		reg = <1>;
+		marvell,invalid-reg-hint-in-rom;
+	};
 };
 
 &usb3_1_vbus {
-- 
2.55.0


