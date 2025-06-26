Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788F8C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 05:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PVe6wGUug93MpyjkrNCWfM9sBMWoe0QRMhfdfW1sERg=; b=wvOcgT1V4oN2mDsLrrOPGBb+bl
	/dlLLOo+8aYzdlk/xKpsIdv1KmoqZVVPeFa6+H83XDtuOvkpPEVCmuGRaRfvzfuZ7x9XjdMef8trr
	36Cx11wTa9F4gEzoEjUca/WKNfWlbkFtPP+Oy15IGVKeLCBKg/tBKrlT+T1JGbBl/iUFJu31+9Dlz
	aHSUwWVlxHqvjw8Sro7NjG+9Ae0FNIyZxKOwbsM17jEQtMQRAgkQ7PJ+PCzf9hAM+ViP8qJP7cW2E
	gMhU0DsNLqvom/xgSBk2HK8nl7nD+DzgXrnzKHnjZObuyGa44S1QVBjS0OgWeZqYUam/A5U+VC+WI
	HxhF9H5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUfVk-0000000AfM5-1sEA;
	Thu, 26 Jun 2025 05:51:00 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUfTS-0000000Aerf-00ls;
	Thu, 26 Jun 2025 05:48:39 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-714078015edso6028887b3.2;
        Wed, 25 Jun 2025 22:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750916916; x=1751521716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PVe6wGUug93MpyjkrNCWfM9sBMWoe0QRMhfdfW1sERg=;
        b=br4TlGCWUC8jabHAGqxO/r3or8WDJOKKp9a7A/Pmrgcchj8YxIYVbcWlKo7gQK/Myf
         z9sdZOKens0PsrfDlGUVSzDjqBwXEW0wt5durn/L2pw2ivhB8xDXy7DSh9VgQPUB7DcX
         QJNmzpTUCT+5cR/jORQYyJcC22Ru6IPtPk6diYRWcyOoHkqKMtsGbAXtZRT+/59g+9fK
         D+mANgP02h60TubipQaTOgwkksT88nUXjyS6XixzTjuSbbScoTPLXhM+GH32oBON2/ox
         2Y1QFXrcu9wDewC4wr1K0oWMNcakNLE0SVvajiJ+HEEh3QBvPT2zDj14QhWy2cHbq0PA
         Oi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750916916; x=1751521716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVe6wGUug93MpyjkrNCWfM9sBMWoe0QRMhfdfW1sERg=;
        b=uwZr2lrdEm3KYFwWyqABYOonPgdtaD3HthjE80Rc5PYsgI/lGfbrRvF9X+vL35mWum
         BcTIItsEX/92Fqqne2aRnMzLnKbJUfo/ZQSkoRO0BLqRORGCzn1+aQoSgIfaLj+4WwGW
         mQvjqf+X690gO8TebTrheGFrQIouLYSn2IK/ELMhYbJk2Fk577/SWyk+S/gM0LtWmpN7
         Dt/NMMPiXZLEOFDNuw/Vcf3hyOcMuu2KHCHACNbYyNqO8uMQuC09Eivz0Asv4vIb4glh
         FboWcUBHw3yUwaMTNasaZuf1Ou0TZPYN7+hzyj4iKqqMTdIeMlXirqCPRay6p00KXlSh
         G8qA==
X-Forwarded-Encrypted: i=1; AJvYcCUeMDyAtrE8NeE4cShir3XvHHRYUN38wXEr0MJmPPTJdbeAjGF76lNNBOXtnn6m1TqzOJQkxnDdEtom6HGLUCE=@lists.infradead.org, AJvYcCWP+kE9YuekQ+2V/tzNBE+p/95khEmbLKuPMM0c6+r0CxefprQGVZ3JJtK/Ol/NccMUH4y7BXqg/cLZXae17gIt@lists.infradead.org
X-Gm-Message-State: AOJu0YzBly31V1soJQ+QnTOzGCcnvXrH5LcGSYluhZlp/WVPt9Yzukop
	Qyr3Iv9KZD109+bP2ndGkgffc3y13OTzP9/9ShRc7iAa7UVzCu0mxF8A
X-Gm-Gg: ASbGncsnMUwuz69aCqzt9DYNpSaDbLtjN8ydmEOJbNqcaQQiiYuTM/OkE8Mac3SuZXG
	wyPBuMhRRONQkIkhd9THZAVa6cP21hizx5ENFRAwlVYlcfXFJLYj+hhEOA8uZF/629m7Kq9K8Kb
	b7o8x8nGxslayhVyDXub9656vdyNVljEtdy63YjACkLjGN0d0K3tnGj58H3xcOwPlx810eQ/Ay2
	pX684pW9XSfUIjuDjx31EzpLo5DOhQvneUIpupQxKYNFbTPvopbaAEeUpztMg4ywhQ4ArI7z3vK
	GumifaYfdW5xmLZ4tvFBLUSzoOySYWZwMM1aSVZUpNoBIGtF93oqXPm6tsCqGm7ERrPAYXXDv95
	Six+dAw==
X-Google-Smtp-Source: AGHT+IH9LKreUxvc3F5L5oWgirPyG5WU6cpWSWHJoSO7yLg9DvB+ScH57eawkJzLKyHLorJFXLN5zQ==
X-Received: by 2002:a05:690c:6902:b0:70e:7882:ea97 with SMTP id 00721157ae682-71406ca14e7mr87220437b3.10.1750916916528;
        Wed, 25 Jun 2025 22:48:36 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4b97299sm27323757b3.66.2025.06.25.22.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 22:48:36 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v4 0/2] Add FriendlyElec NanoPi M5 support for Rockchip RK3576
Date: Thu, 26 Jun 2025 01:47:26 -0400
Message-Id: <20250626054728.4882-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_224838_039844_65D14B2D 
X-CRM114-Status: GOOD (  12.19  )
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

This series adds device tree support for the FriendlyElec NanoPi M5 board,
powered by the Rockchip RK3576 SoC (4x Cortex-A72, 4x Cortex-A53, Mali-G52
MC3 GPU, 6 TOPS NPU). The patches enable basic booting and connectivity,
including dual 1Gbps Ethernet, USB 3.2, microSD, M.2 PCIe NVMe, and HDMI.

Changes in v4:
 - Addressed Diederik's feedback:
   - Renamed pinctrl nodes to align with schematic labels
 - Moved pinctrl-0 and pinctrl-names into button-user sub-node

Changes in v3:
- Improved (even more) fspi1m1_pins comment for clarity, specifying
  gpio1_d5, gpio1_c4-c7 (clk, d0-d4) for SPI NOR flash.
- Removed redundant #address-cells and #size-cells from sfc1 node, as they
  are inherited from rk3576.dtsi.

Changes in v2:
- Fixed DT schema warnings (Rob Herring):
  - Renamed spi-nor@0 to flash@0
  - Renamed pmic@23 pinctrl nodes to end with -pins
  - Renamed hym8563@51 to rtc@51 and removed clock-frequency
  - Renamed button@1 to button-user
- Addressed Heiko Stuebner's feedback:
  - Sorted non-addressed nodes alphabetically
  - Added blank lines in regulator nodes
  - Improved fspi1m1_pins comment to clarify SPI NOR flash pinmux
  - Moved status property in saradc to last

Patch 1: Updates DT bindings in rockchip.yaml
Patch 2: Adds NanoPi M5 device tree and Makefile entry

No MAINTAINERS update needed, as the new file is covered by the existing
ARM/Rockchip SoC entry.

Tested on NanoPi M5 with successful boot and feature validation.

Signed-off-by: John Clark <inindev@gmail.com>
---
John Clark (2):
  dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
  arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 999 ++++++++++++++++++
 3 files changed, 1006 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts

-- 
2.39.5


