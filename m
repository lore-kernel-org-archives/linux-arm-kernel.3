Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0B4C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=buJVDP+W15xpcU6Ik7coVY+TJlW7TKsQq01dS8t+N64=; b=dHFMzvKAyaZG7H2tTExEOhzWek
	UKarI8qMv7AD5qJt8FJ0+KXGP4Gtbafb0H+8JAcD6vHi2TJG/o+E1osGF+NQKgknfCh5zCzUDoXHZ
	L9j06TvOnm5ZqRay/Ea/bYoDmPwzWYmpx1lGdr4LOzEqnQ15r6gzTHgFrEU2X3mEOCzCX+u1eUlRj
	e7wyh9Mxf4JszVIlfwuWhUsb2viXADh527h7MdQU0EY77Iy14q3DZVxP+LRlvIdRByH707ThTgcMM
	2edNRVEZYGx0zKslLgidqAIZf3fw65/LU3QMwmC3+7GTclH/Dboiv34aTp5JuJJ1FlXvjai9V49fR
	14LEezcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA60P-0000000Cjqh-3GaL;
	Wed, 30 Apr 2025 11:53:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA48F-0000000CRZS-2U27
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 09:53:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A229A106F;
	Wed, 30 Apr 2025 02:53:25 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3620B3F673;
	Wed, 30 Apr 2025 02:53:31 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: fix order of arguments in clock macro
Date: Wed, 30 Apr 2025 10:53:25 +0100
Message-Id: <20250430095325.477311-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_025335_674037_13D8CCD7 
X-CRM114-Status: GOOD (  10.68  )
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

When introducing the SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT macro, the order
of the last two arguments was different between the users and the
definition: features became flags and flags became features.

This just didn't end up in a desaster yet because most users ended up
passing 0 for both arguments, and other clocks (for the new A523 SoC) are
not yet used.

Swap the order of the arguments in the definition, so that users stay
untouched.

Fixes: cdbb9d0d09db ("clk: sunxi-ng: mp: provide wrappers for setting feature flags")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu_mp.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.h
index b35aeec70484d..8fc7fdb7ef494 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.h
+++ b/drivers/clk/sunxi-ng/ccu_mp.h
@@ -109,8 +109,7 @@ struct ccu_mp {
 					     _mshift, _mwidth,		\
 					     _pshift, _pwidth,		\
 					     _muxshift, _muxwidth,	\
-					     _gate, _features,		\
-					     _flags)			\
+					     _gate, _flags, _features)	\
 	struct ccu_mp _struct = {					\
 		.enable	= _gate,					\
 		.m	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
-- 
2.25.1


