Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFE7C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e2mgp3aeDNqwXac3Bt8GyZQFUnGVjU1wOzB29KvaY5Y=; b=mSMWLsRtgjfLuG
	6oY9Sil3IM6hv+bvhOdUQvjWpgfH/BpeX5mr+s6FsF4zrRdMnLjD0NrECB7LOE7OVLgl1QY3NVGjk
	kJoQTVFWJywWg0GCArcOBSFEWiREXFUykRlWKVRhdJAeuCYXIXraykyI5FUrsC7f6LiuwSsxFnhd8
	w1Sv7JH3hSfSsR5Iq+SoZRp3ehFOMbvnZfX7OBtdTIViMgMN25a8XdckuoKhKQ44MsmaLx5Ws7dpd
	FarRKxe/dXpTzBdWugDfmTKvpJNVGt4cypgiD/SlXQR/UryUnrIXSz3PRdy3IK0xu03BJ8rzmJMHt
	CCfNpXrusWS3Msf24oqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwN3-00000003ivQ-1YFc;
	Fri, 16 May 2025 14:49:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvnf-00000003d7a-3CWP;
	Fri, 16 May 2025 14:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747404753;
	bh=NJBXz1AbfA1GAlcdN/Q5wV2specP9Nphdtb3gDoHx0w=;
	h=From:Subject:Date:To:Cc:From;
	b=T/A/AYauLsmBu4sQJbPeliv7IlBOZ6fFwHkjQAa2shZHy8/PAw1oy+R2r/LldxCbt
	 AiRvfpDNeGAFc0/YXTQeP/T3twG9+CtDfnZTYrjAOHlokBXP5aiW1NnvjOnYPuJljF
	 7dWu31C1keUQVt9hG36WTqtHspRx8kiSo10TgHDkJo7ySAPXtF2AnyN4sOLDf0fCtz
	 Liht9dTnNuwaTeZIjqEQuKY6HlKwPkX2JlxI6Iikj3qB9dOBaJ20fC3PZ3/J7EbXcx
	 XofAYAsCTT8oyR7ypUcb5/KEAZsDA+RaYVlVoCh1D24pdGDfQ6Ndgyf7DYC/L07tlU
	 hcX5le4nii21A==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600C8F85Cf092D4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D081117E00F0;
	Fri, 16 May 2025 16:12:32 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 0/2] mt8188: Fix missing reset DT property
Date: Fri, 16 May 2025 16:12:12 +0200
Message-Id: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALxHJ2gC/32NQQ6CMBBFr0Jm7ZgWnKS68h6GRTsdpBEoaQnRE
 O5u5QAu30v++xtkSUEy3KoNkqwhhzgVqE8VcG+np2DwhaFWNSnShH5xyL3wC8fFaGOQbEfKkye
 +NlBmc5IuvI/koy3ch7zE9DkeVv2zf2KrRoXsbWMaduIu3Z3jMFgXkz1zHKHd9/0L/tVK47QAA
 AA=
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
X-CRM114-CacheID: sfid-20250516_071235_959883_1594C465 
X-CRM114-Status: GOOD (  11.85  )
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

Patch 1 updates the binding to declare #reset-cells as a valid property.
Patch 2 adds #reset-cells to all affected nodes in mt8188.dtsi.

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
Changes in v2:
- Change the wording for patch 1/2
- Drop the fix tag on patch 2/2
- Drop the former 3/3 patch in favour of another solution:
https://lore.kernel.org/all/20240911104327.123602-1-angelogioacchino.delregno@collabora.com
- Link to v1: https://lore.kernel.org/r/20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com

---
Julien Massot (2):
      dt-bindings: clock: mediatek: Add #reset-cells property for MT8188
      arm64: dts: mediatek: mt8188: Add missing #reset-cells property

 .../devicetree/bindings/clock/mediatek,mt8188-clock.yaml       |  3 +++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                       | 10 ++++++++++
 2 files changed, 13 insertions(+)
---
base-commit: bdd609656ff5573db9ba1d26496a528bdd297cf2
change-id: 20250515-dtb-check-mt8188-5af50d5d5c93

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


