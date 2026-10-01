Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4D5CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 02:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JBj760CSPEhTHdB5J8bb+wCBarK2SuYvXC2QB16HtCA=; b=s0Fvdcy7YicGCbFCipBThhQH96
	jWNbUR8HQcFqeNNpSVgOKPwVsv4Ao8VePaez/HwTFqd3H4r3HvCba73CZDiXBq1V2dSbhn1AlBBhS
	FYZpMe1fNfSBa1T/K+cnrtmM5EjIBuJA84vV1IIs6vntoZYP3sdq5ICoYvcLg5X97DeJ23wp6DOkF
	mT/fiKbPdj/PJ7zJT4kBRDovOOT4y5mD61Oiw7qHLQqlW6AJEogZQmWsL5V2pwcxCbcMW/qUvh1jl
	dN74EVwg6HCHhkte1SeJ2F5A53kY2TREYND020iP69DdmW1KBMAUGRteBZVYfhcYUxpsuNG6JTfhT
	6ZhNXFRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC6TL-00000007bUE-28OJ;
	Thu, 01 Oct 2026 02:24:35 +0000
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC6TI-00000007bTo-0LdT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 02:24:33 +0000
Received: by mail-pj2-x2b.google.com with SMTP id d9443c01a7336-2e2d42b972bso14250345ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 19:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821470; x=1791426270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBj760CSPEhTHdB5J8bb+wCBarK2SuYvXC2QB16HtCA=;
        b=fJ7halD7qN/gu8F1HFPI4zWnnlOtHBmfcNFI36N5dGI3+xk7bIr3hJhDXiUGGPKP+P
         rRyBWFDG64xd5HhlmP2hyaqis3i0RdiGrvHL4Djk1r+acbZJSCFhmgc4W+CVebH9FwTY
         IaEAsjiCC0UURnijUBJ1tYRvnkRyzJl1vrfG5OalhMU0vEMdtjcn034XQGLc4O+kQPJs
         R8lTboJCvXYxuetV9hp0CwvwpFbSnRJv6qKdGcr3BuftE6dcQeOc600Mq+S7Yd8nfl9n
         WB11VEUoU/IyK+Te13KW3rQo4ansHBoe8BcYF2o+cVykQ248ZZijWhPtbyZNCThDorvQ
         bKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821470; x=1791426270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBj760CSPEhTHdB5J8bb+wCBarK2SuYvXC2QB16HtCA=;
        b=fB2W9/JXPWrpxcm/Jg/GIpjIIDbq/SLZXXFqmhWPtg74n/V8Nj48970TcEMtd1PVFI
         i+xq10l2yKGxWkl/3joSmvLgJJLr/IsTS/NE/nViqN6ZK/frvgkEY75fRwGAHvCF8eU7
         UHrq2EZTU7TpDIfwi08hQe3eIh7YnGsdmvA8lqerqlWeTFd+YHw29LnA13yQ3LTFfFxF
         vEdU+m8Y3Q7GRUcbMyZpNbgfu8wnjXF+TP7xHvlcZKK4y2JcKag7OqTrlcZd0Rqq4SsQ
         RPGfeuHIgYRVKb5tyB0EhDLGKKksGX0Seq8WuWf+ELCvsYWljmI6LWoDOBKa/MODRcSu
         NfKA==
X-Forwarded-Encrypted: i=1; AKwUvBwYUu5jn9PRfq2ep2rRFw7bc2fpGO5nqN+uidRgfSQV2wIxW10D8IzPzc2ESA/Dk185sWMFY2FM3ZLnE/D7waah@lists.infradead.org
X-Gm-Message-State: AFq9FYLiKA0rV4prQYafNe7dVWrCOkWvNInrcFXurAd++yBT7k4AE4/I
	2vpCDSjC4DR2r3SUmBYC8ygSN9UmuRzgvTeHNIhNx+zs2AnyVQmKwcDY
X-Gm-Gg: AYBFou0Sr15H/CowOkziMBjLQ1Aow3E4YdwLs/nJHXQoj5p7hfFJJmGK1s5XS+TwF8W
	wqa7WMOhQgio/+MdOmu2N0W6cRyYqgy+wx4c4xx5AY9SFkC2OCdNympL/oLPV8p4OXVnKvlEoCl
	pNRurLAvayMw3gPMCx7IXMyctpawMzNDwCwt/7+S7DPl/QZbxiDQ+Tpj7FhKZLBUaAgd96UO0lZ
	YpasQWsNOaJedu4GfJM0aiqatowrpPGEIzW0flDoe8O+VLgExMURA9HZjBHpB0rkCovHFx5jJf1
	KROdI9LQG05kQjsCSI5eq6ThtGn3NltdWySVfEZ/jrqkyS0koQ6iuO+BlSgyhWhVd8bTLrpOw+A
	lTWugYJgXan0GlN10gjM6dPqhbZuBVIZKt4PSKNOyWf1UNZw45KXvLRsT8A0eA2R0nqTGywaJdp
	vaNYgtRXl/2lIJkHwzWp9LfqWuBqlZ/gtGCpLm7I5RnAvKoRJdZvBlBo1xhpQDXA==
X-Received: by 2002:a17:90b:28c4:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3a4d18bde23mr2612397a91.46.1790821469669;
        Wed, 30 Sep 2026 19:24:29 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:29 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 0/4] arm64: dts: allwinner: add Teclast P85T (A523) support
Date: Thu,  1 Oct 2026 10:24:11 +0800
Message-ID: <20261001022415.913959-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_192432_253075_1D4C23A9 
X-CRM114-Status: GOOD (  15.99  )
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

This series adds initial support for the Teclast P85T, an 8-inch tablet
based on the Allwinner A523 (sun55i) SoC.

This initial submission enables only what has a binding today.
Display (DE/TCON/DSI), PWM backlight, audio codec, camera (CSI/VIN)
and LRADC keys are deliberately left out, as those blocks is not ready
yet. They will be sent separately.

Patches 1 and 2 overlap with Andre's series
https://lore.kernel.org/linux-sunxi/20260914210115.28151-1-andre.przywara@arm.com/T/#ma8a2554315eccbccdb15ee7ac212a4d0afb45a5c
They are included for compatibility and differ only in the full company
name in the description.

Touchscreen operation requires firmware extracted from the Android
firmware; the file will be added to a public repository later.

The touchscreen values below were obtained experimentally via evtest
and may be inaccurate:
  touchscreen-size-x = <1786>;
  touchscreen-size-y = <1128>;

With the values below the touchscreen and display coordinates match:
  touchscreen-inverted-y;
  touchscreen-swapped-x-y;

The battery values are taken from the battery label
(5000 mAh, 4.4 V max charge) and the Android DTB
(pmu_runtime_chgcur = <0x320>, i.e. 800 mA safe charge current).

U-Boot support requires an LPDDR3 driver for the A523, which will be
sent a bit later.

A ready-to-use image with working display, audio and touchscreen can be
found on the Manjaro forum. Patches will be added as other contributors
add their parts.

Changes since v1 [1]:
  - Added Reviewed-by from Andre Przywara for patch 3;
  - Replaced the dummy 1.8V pio-18 regulator with the real PMIC rails;
  - Dropped reg_dcdc4: no consumers, the kernel would turn it off;
  - Dropped AXP323 aldo1/dldo1: no consumers - the board is verified
    to work with both rails disabled;
  - Renamed bldo2 to "vcc-dram-1v8" (needs to be kept always-on).
  - Renamed cldo1 from "vcc-codec-sd" to "vcc-codec-mmc";
  - Described AXP323 dcdc3 as the RISC-V management core supply, like
    on the other A523 boards;
  - USB: removed the inbound 5V rail from usb0_vbus-supply and dropped
    ehci0/ohci0; the port is works like peripheral-only, using
    usb0_vbus_det-gpios for VBUS sensing;
  - Dropped the iio-hwmon node due to invalid values;
  - Commit message wording: those blocks "don't have a binding yet".

[1] https://lore.kernel.org/linux-sunxi/20260918165414.1129076-1-iuncuim@gmail.com/

Based on 7.3-rc3.

Mikhail Kalashnikov (4):
  dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
  dt-bindings: arm: sunxi: Add Teclast P85T tablet
  arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1 pin groups
  arm64: dts: allwinner: add Teclast P85T tablet

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun55i-a523-teclast-p85t.dts    | 386 ++++++++++++++++++
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  18 +
 5 files changed, 412 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts

-- 
2.55.0

