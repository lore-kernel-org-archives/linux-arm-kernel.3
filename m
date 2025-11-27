Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D202ED11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lXLMTwsVE5PrrxBMxsVCoUcLv2OfpkJJM3iox2q0QmM=; b=2myUgFOfBwa/8p1gT3tunnWHzl
	qSwfyMNopAESn47NYkTR6y/nj2ouraOsAsM71YhQMHMHBbPYcueZdYmYjgvYHMH7YIL9CaaBb5J7U
	vQOdxej0zKLDdTzGAdLyQ1SvfVMLp8maZj2HbYGz+qP+Ov5eUjvgZgUaCcohWGxj9Rw6GUzFYlmw7
	HZazdvQIlG0fmWB3go637Fv4fhQ+SD8rnyUac52GJro8XSlNDTJ2/+sU4Rt1AelI+wqnGY3awQDpJ
	MxFxTtoraUPVrynjxPJyjrG/pNbosmr4wHf9DiHwDrfEj9IRgdybb+JJxnWTZTeDoD0rpodN90Le/
	Xx7aDXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYoA-0000000GKsJ-1BSV;
	Thu, 27 Nov 2025 10:01:03 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYo5-0000000GKr1-03qb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 10:00:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-297f35be2ffso11017325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 02:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764237656; x=1764842456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lXLMTwsVE5PrrxBMxsVCoUcLv2OfpkJJM3iox2q0QmM=;
        b=Rh/dn0OOSQvYi4y/qPFkmwglW56hDbzYSDbAg8FclSf+golyWthLXkI/JSfzBwmCic
         ME7+V810Is9tKg3YXQijcz8FxnhYMlsxDn2w97mvBTGu1V5SZR432gpHJ/E0RDhC/o1g
         6ptes7DVNb1FzUAMLvzIWOPNEr1qKQRD8jcpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764237656; x=1764842456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXLMTwsVE5PrrxBMxsVCoUcLv2OfpkJJM3iox2q0QmM=;
        b=mmVHX0EHATzJu0xqnCG4UN2P9fxcqTnJzV1Q3F+AdTXGjYVgKf9zf8nMM58w0ue1/9
         3oklVeC08VE8L4zWWvORb5VGgr6SgNB0kQqo6zPCzhWQYAgOX6DLwR9jzylFRaZya7bq
         cOmXuNvjW7/b15lQMReBKI11fWUmA83XnYgYXnd/DDEbP1TP9SmCevKHu4d5WDimzHDq
         qt3Vto4Lq6EYAE4HTs3RjrG9nBnHtYJhpF7B1cp6DIdudurcaewtELBX2NILj8RQQv/0
         YXb+mKY2pqGYNEfPGmoirws5BhjSMT/gvu9pvHdIx0EHQDuPzLQV3Xjr600qUSy/WBPE
         pfqA==
X-Forwarded-Encrypted: i=1; AJvYcCW1NYJn2emkLfoOP1fDg80VCeeEk5DqsPzpCjC7P9BuOQ+zCsY/SuFb48ZudgQaq2p7dy6dLX4GkBssSClE5Wv8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/jDzGQr5M6JDSkC1/AGt4NWm7ixeY+hCjPHwdr9/qnp2Y9dB6
	rLvzY+WhXc5jIimvwj6DNibs6bXKgVGGmbJv0OErcUh1ieX7lyRkA/gzzaH6aqkcBw==
X-Gm-Gg: ASbGnctl8Dab9hJ1MQ82QSVutqGRd5xvTMAVbRXnekY/HRoepanF1IDXsuj1XuaahQu
	ND2o3Dtxfk4YdTnJHOoYOntIgZ9/6TYrF9phyh/LueL32lD5BrWE9m9SNh07Th612LVnabDC1BW
	BialEFHXFajiMpBND9JLNHwCYR4hX9wwaRa9v9ySYBdSdV7XmDFInJbSA2+EqbIZIIA79p961S6
	udl7UrL9cMSBD+bdk6P13xeYpEeADGIpsaS4zeX2ZXTkFxM3R0zA6Fj2YFTcMiTyPCLo3p/SzAU
	3lAVOUen1BJsZM5kW1U4SLGu8/Kmq9mlU/edU7gswrEMZvP+wc9240Z14o89u8DNVWB6GE9vUi+
	d0nU9Oq6A/sPoOtaTKXdnOgP2Fgkj8gzSYRLuOyu6wbVGVJ1a/FxiDsqiC5BgQ1pUVUKRdVFkTc
	NHEte22mnONOYL5Y4kHrX5Oq4Es7JL95WlW/9lRQovS0z17M4UbsjzXPGBcv1wRx1KwWph
X-Google-Smtp-Source: AGHT+IHivfNnrfK3dtvJit5EMEyVA6t8fLK67j9PbneBRp9gDarid+L6oRuRF/o2DijnRZbB5oV9KA==
X-Received: by 2002:a17:902:e551:b0:295:3eb5:6de1 with SMTP id d9443c01a7336-29b6c684abbmr298506555ad.34.1764237655717;
        Thu, 27 Nov 2025 02:00:55 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:4917:2ae3:8ebd:4ff1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb29fbbsm12490515ad.49.2025.11.27.02.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 02:00:55 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	soc@kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8195: Fix address range for JPEG decoder core 1
Date: Thu, 27 Nov 2025 18:00:42 +0800
Message-ID: <20251127100044.612825-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_020057_114193_EBFCCC52 
X-CRM114-Status: GOOD (  14.21  )
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

The base address of JPEG decoder core 1 should start at 0x10000, and
have a size of 0x10000, i.e. it is right after core 0.

Instead the core has  the same base address as core 0, and with a crazy
large size. This looks like a mixup of address and size cells when the
ranges were converted.

This causes the kernel to fail to register the second core due to sysfs
name conflicts:

    sysfs: cannot create duplicate filename '/devices/platform/soc/soc:jpeg-decoder@1a040000/1a040000.jpgdec'

Fix up the address range.

Fixes: a9eac43d039f ("arm64: dts: mediatek: mt8195: Fix ranges for jpeg enc/decoder nodes")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This was introduced in v6.18-rc1.

Maybe have the soc maintainers take this directly instead of waiting?

Also, I'm not sure if this error could mess up the JPEG decoder driver's
internal tracking.

 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index ec452d657031..c7adafaa8328 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3067,7 +3067,7 @@ jpgdec@0,0 {
 
 			jpgdec@0,10000 {
 				compatible = "mediatek,mt8195-jpgdec-hw";
-				reg = <0 0 0x10000 0x10000>;/* JPGDEC_C1 */
+				reg = <0 0x10000 0 0x10000>;/* JPGDEC_C1 */
 				iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
 					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
 					 <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
-- 
2.52.0.487.g5c8c507ade-goog


