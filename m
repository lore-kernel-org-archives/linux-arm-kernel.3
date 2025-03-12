Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA35C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 22:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RPZeAMND+U90bEKUDn6ihSLrgG/axOEBj8vKKlbjoxE=; b=1DTdyKlA8vrWtBfQ/pF8oeVGkB
	NTs1YinaofAl+F0R6LXVC0tzLMnJ4ZgKrEzj+cKE6SW+FD0kJNmKJfm1ztIZGR8Kb1RA550OYFHnM
	oEzbGJq6h/6WCXRDLcjbUu7E9VPMYBHzsWxVi6969dYxBLvY7i0EJloZDDMnjw4gnQwQKMkj8miKo
	QNqEz9ldTJ1SiL9ldYUzaM627JoATn0tfjyuJqSHV7jYfxiBc5nZk+rMhHrB0T2Er5XLIZ4wRC2Ol
	G7vXjPewhDTMZAwOvp819sh8+Vled1Evqtg4KOEdOSs0O/XzfT/1am39BEKt1vBaJQNfAjdtQKfwC
	3JMz0t9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsUII-00000009bAp-1UPr;
	Wed, 12 Mar 2025 22:11:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsU74-00000009Zj8-3P21;
	Wed, 12 Mar 2025 21:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=RPZeAMND+U90bEKUDn6ihSLrgG/axOEBj8vKKlbjoxE=; b=GeaONFQBmB7HtgLI6iiUmJU14B
	2uYAB5VDedKtPtg1tPKjYIEjnMkzlr/oQMfZqT+en+XuDnnTqaqMAz98mty8sySEJskeBdn7kTWbB
	mQEq4itxJwgVNhHq54Er8aYkMhlue0e/WbEE8JUodxIrMqjet7QVkJ2+uLp0VU9oX6/GRbpty/amI
	mP7ZDYoKAhrNUZ4D9SEYGyDmgQSi3A9+kZl7MI+PwW2VcvxGOrT1wak7yZTXIqSrdBfv4nvrZLJVQ
	GgTtmoL8lbxYbJMatFKSSJUP5iKfkgK9CHHUFgmzrpGiIYTDxfOjReBdCFTDV+4NR+u9xUG0VP19C
	Gqngmjaw==;
Received: from p3ee2c254.dip0.t-ipconnect.de ([62.226.194.84] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsU6w-0002k3-7B; Wed, 12 Mar 2025 22:59:34 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de,
	sboyd@kernel.org,
	mturquette@baylibre.com
Cc: robh@kernel.org,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kever.yang@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] dt-bindings: reset: fix double id on rk3562-cru reset ids
Date: Wed, 12 Mar 2025 22:59:23 +0100
Message-ID: <20250312215923.275625-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_145942_867950_D595D4A8 
X-CRM114-Status: GOOD (  16.78  )
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

Id 173 was accidentially used two times for SRST_P_DDR_HWLP and
SRST_P_DDR_PHY. This makes both resets ambiguous and also causes build
warnings like:

drivers/clk/rockchip/rst-rk3562.c:21:57: error: initialized field overwritten [-Werror=override-init]
   21 | #define RK3562_DDRCRU_RESET_OFFSET(id, reg, bit) [id] = (0x20000*4 + reg * 16 + bit)
      |                                                         ^
drivers/clk/rockchip/rst-rk3562.c:266:9: note: in expansion of macro 'RK3562_DDRCRU_RESET_OFFSET'
  266 |         RK3562_DDRCRU_RESET_OFFSET(SRST_P_DDR_PHY, 0, 8),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/clk/rockchip/rst-rk3562.c:21:57: note: (near initialization for 'rk3562_register_offset[173]')
   21 | #define RK3562_DDRCRU_RESET_OFFSET(id, reg, bit) [id] = (0x20000*4 + reg * 16 + bit)
      |                                                         ^
drivers/clk/rockchip/rst-rk3562.c:266:9: note: in expansion of macro 'RK3562_DDRCRU_RESET_OFFSET'
  266 |         RK3562_DDRCRU_RESET_OFFSET(SRST_P_DDR_PHY, 0, 8),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~

To fix that issue give SRST_P_DDR_PHY a new and now unique id.

Reported-by: Stephen Boyd <sboyd@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503121743.0zcDf6nE-lkp@intel.com/
Fixes: dd113c4fefc8 ("dt-bindings: clock: Add RK3562 cru")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
The original patch did go with the reset of the clock controller code
into the clock tree, so this patch should of course also go that way.

I also don't have anything more open for the 6.15 merge window, so
clock-maintainers could just apply this patch on top of the main changes.

 include/dt-bindings/reset/rockchip,rk3562-cru.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/reset/rockchip,rk3562-cru.h b/include/dt-bindings/reset/rockchip,rk3562-cru.h
index a74471d7d2a93..8df95113056e3 100644
--- a/include/dt-bindings/reset/rockchip,rk3562-cru.h
+++ b/include/dt-bindings/reset/rockchip,rk3562-cru.h
@@ -217,7 +217,7 @@
 #define SRST_MSCH_BRG_BIU		171
 #define SRST_P_MSCH_BIU			172
 #define SRST_P_DDR_HWLP			173
-#define SRST_P_DDR_PHY			173
+#define SRST_P_DDR_PHY			290
 #define SRST_P_DDR_DFICTL		174
 #define SRST_P_DDR_DMA2DDR		175
 /********Name=DDRSOFTRST_CON01,Offset=0x20204********/
-- 
2.47.2


