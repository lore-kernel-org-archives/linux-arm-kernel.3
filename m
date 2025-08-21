Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414EECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ydu8ovpseLZ3ENO4JcyCtXnqUBXiHHPsXi6xuDRTXlQ=; b=e7F5848vjQHX7W+QvuiI0UIwUf
	l8CDaIzLfM+Mbv1rD76B0b7khXkbrZP0ioD10u2NWp6uX8/JKfl8uu3pzUnpfPjjuNMq8SAm0CGGm
	3sJfIQq/zTl3MUeVwE3Wwbz+E9P6mQE7jNqZWLUGcqQFlToUt+kgMuc/YrK9tdnkY24npagcPeKlq
	CAwFmvcGBPxXJhi8kuzb192VdmMVO44Fl/UWKZh+k0voTr60ifwCAaUrk0OCeUX0fbdiLvH6BXVUf
	NyHO28nh2yH7rKzs7vbg8xmNkgrJYiDmIqbGha1Ih5xnNVtBSuSFJzHuC/qcgqDlTB6BNDUhOjee7
	tjGLFwcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7m-0000000Fdpe-2SW0;
	Thu, 21 Aug 2025 03:38:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotR6-0000000FKV8-0YfK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:45:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67ED82573;
	Wed, 20 Aug 2025 17:45:39 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A630E3F63F;
	Wed, 20 Aug 2025 17:45:45 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 3/9] pinctrl: sunxi: only use PortK special handling on A523
Date: Thu, 21 Aug 2025 01:42:26 +0100
Message-ID: <20250821004232.8134-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_174548_206913_DD6B1AD1 
X-CRM114-Status: GOOD (  14.64  )
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

The Allwinner A523 pinctrl IP requires an exception for addressing PortK,
since the registers for this GPIO bank did not fit anymore in the
existing MMIO frame. Since the A523 was also the first SoC to actually
implement PortK, we just enabled this quirk unconditionally.
Now the new Allwinner A733 changed the MMIO frame layout, so PortK can
and must be handled without any special code.

Mark the special casing for PortK with the ELEVEN_BANKS quirk flag we
introduced, so that it will only be used on SoCs using the A523 pinctrl
IP.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index a5e390c7ba0ba..2af6ebef7a10b 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -67,7 +67,7 @@ static u32 sunxi_bank_offset(const struct sunxi_pinctrl *pctl, u32 pin)
 {
 	u32 offset = 0;
 
-	if (pin >= PK_BASE) {
+	if (pin >= PK_BASE && (pctl->flags & SUNXI_PINCTRL_ELEVEN_BANKS)) {
 		pin -= PK_BASE;
 		offset = PIO_BANK_K_OFFSET;
 	}
-- 
2.46.3


