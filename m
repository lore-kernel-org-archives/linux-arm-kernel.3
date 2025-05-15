Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EDAC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 13:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GPQvSDNsGP21UtCMjtLguObeYIbupU++Wvm4cQkw6lQ=; b=oJUF0HmB8+jkMR
	1hHQe7w4JPHxzLVHHQCjT2g4gEddS+RVcCyb4869KguW13CKXaaSn8J0uGq9vkX2iI/noR6AVQ23R
	RiMb8Rt9yC+f1892AHqizVWCCCLtlhVRIQ9VKH4CALGL+ETbzoWYfaJq/XtebBGW0LpOub1lCJtdf
	CJAuzYPQ4RJmSBuYT2F2EqmRqfaMiF2kxsRYs+N6y+iZ74OO5L1hK+6l94jf3DthfgCszdnVJSq+u
	oeo+AHPE59DAphKAyayZQsBNXZOCSk1iLq94+RfKYjvjtKRyIvL2ict/gQcQKfYR4GEvSWP2MTrsL
	nIxwBkywaDA0Zhn1UpHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYjT-00000000kQ7-0vEV;
	Thu, 15 May 2025 13:34:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYge-00000000ju6-2zSL;
	Thu, 15 May 2025 13:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747315906;
	bh=+qZaWRvZ9Dgx+EpqRZQgSt4qBnNCWnJbJUmOtKwdjgE=;
	h=From:Subject:Date:To:Cc:From;
	b=UUpIT/pFbKME4d3DBPwv84lQlVe92KlvTuedp+1qewWET30JdynRQQ8oehrCBQOZH
	 LpEPzxP1uMK7Q8aGd4yQTzsJmrXkyM39iT9EPn78NVcpJBwM1/O0nO5uX59pFl5+44
	 us/b6QjAOPK3rRTd+upxGroPb9TWqEmX2uktlApbUxw8ykdjpzuz+jDcK0YVJuFaye
	 sfYZOtc8jrDfxims7Q/2TT/ESVwRNZUgmjn7+4sTpMzELv+j10AXzv1ofd0030S/T5
	 S+/zrf0h6HXo3XFDMbC2tTeoTnVjcRXcbZpAsNnni6vRBZmE9PvG/YXu/0VciQsy+h
	 iAYHGqkVeIMMg==
Received: from apertis-1.home (2a01cb0892f2D600c8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AEB6417E02BE;
	Thu, 15 May 2025 15:31:45 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/3] mt8188: Fix missing reset and clock-names DT
 properties
Date: Thu, 15 May 2025 15:31:42 +0200
Message-Id: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL7sJWgC/x3MQQqAIBBA0avErBvQYsC6SrQonXKILDQiCO+et
 HyL/19IHIUT9NULkW9JcoQCXVdg/RRWRnHF0KiGFGlCd81oPdsN98toY5CmhZQjR7ZroWRn5EW
 efzmMOX+RhBF7YgAAAA==
X-Change-ID: 20250515-dtb-check-mt8188-5af50d5d5c93
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Garmin Chang <garmin.chang@mediatek.com>, 
 Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_063148_899686_F53F63AD 
X-CRM114-Status: GOOD (  10.56  )
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

Hi all,

This patch series addresses some issues found in the MediaTek MT8188 device tree
and its corresponding bindings:

The #reset-cells property was missing in the MT8188 clock controller binding and
device tree nodes. This causes DT validation errors.

The clock-names property was missing from the Global Command Engine (GCE) mailbox node,
which also triggers a dtb-check failure.

Patch 1 updates the binding to declare #reset-cells as a valid property.
Patch 2 adds #reset-cells to all affected nodes in mt8188.dtsi.
Patch 3 fixes the missing clock-names property in the GCE node.

To: kernel@collabora.com
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Garmin Chang <garmin.chang@mediatek.com>
To: Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Julien Massot (3):
      dt-bindings: clock: mediatek: Add #reset-cells property for MT8188
      arm64: dts: mediatek: mt8188: Add missing #reset-cells property
      arm64: dts: mediatek: mt8188: gce: add missing 'clock-names'

 .../devicetree/bindings/clock/mediatek,mt8188-clock.yaml     |  3 +++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                     | 12 ++++++++++++
 2 files changed, 15 insertions(+)
---
base-commit: bdd609656ff5573db9ba1d26496a528bdd297cf2
change-id: 20250515-dtb-check-mt8188-5af50d5d5c93

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


