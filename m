Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCE5C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21vSlX4lky0OwRHxp3Nq/MqdFOweBV2Vbm0BMWfvn2A=; b=dwQq3wr+J+9iDLKvwCX1iq5X+K
	4RCo9TfBSiDS3IW3tkQSE+gdQ4DqdvEnVL/pZaQCuNtI7A7cPevWCEmJs/9lSZTI59usu6dJFjef9
	SO5HmXTQDUIIbGN4T8Eg0R8qUiW3dRhOacVLj8VnnTRdiCciqRR62ANqK0JRqa+B14HLX+mm8kH4R
	2kheP6otJ7YBW222193PMfAOrzMDK9uK6APFNDGgMVICC1ldkDx77bN5cPXmX77BschtUJEkICORp
	ZmLmfbdk2nmSQNoRS0kc0HeAK7RXVr7Lq09fmY6IWgRgarTb9l2EJRgS0CEVRhZz5/uOrP1liguzh
	2k70jMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Kla-0000000CgUp-2VbM;
	Thu, 17 Sep 2026 22:39:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KlT-0000000CgPu-0XfK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:39:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F1FA1FC7;
	Thu, 17 Sep 2026 15:39:30 -0700 (PDT)
Received: from e142021.. (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 561313F86F;
	Thu, 17 Sep 2026 15:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789684773; bh=MqxByHHRAMiILQpCwGLbqvoCedSkxvWgAOUz0k/g3VE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hNrgkGFB33xBqnbOof23Nb1JNHTs1T1uevRzc70iq+LvboDRdZ2Gl4EcdQ/anH8Mx
	 Rx/ZmrKwwLlFLqrTioT7p4GpvGphV2D17YaPFUfvyLFXC+wmVypBA5J9xFuznp2HRl
	 op5KqREyqiCiW0Fwq1RMvKo4w5Z/CMI2LFVU0qgA=
From: Andre Przywara <andre.przywara@arm.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/5] clk: sunxi-ng: mp: support clocks with just a shift register
Date: Fri, 18 Sep 2026 00:39:10 +0200
Message-ID: <20260917223913.1855301-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917223913.1855301-1-andre.przywara@arm.com>
References: <20260917223913.1855301-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_153935_234629_DC4ECC8D 
X-CRM114-Status: GOOD (  11.65  )
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

The "mp" clock models a mod clock with divider and a shift field. At
least one clock in the Allwinner A523 features just a power-of-2 divider
field, so support an initialisation of the clock without providing an
actual divider field.

Add a check whether the "width" field is 0, and skip the divider
handling in this case, as the GENMASK macro will not work with a zero
length.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu_mp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
index 7cdb0eedc69b5..3896cb94bf733 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.c
+++ b/drivers/clk/sunxi-ng/ccu_mp.c
@@ -236,9 +236,11 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsigned long rate,
 	spin_lock_irqsave(cmp->common.lock, flags);
 
 	reg = readl(cmp->common.base + cmp->common.reg);
-	reg &= ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
+	if (cmp->m.width)
+		reg &= ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift);
 	reg &= ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift);
-	reg |= (m - cmp->m.offset) << cmp->m.shift;
+	if (cmp->m.width)
+		reg |= (m - cmp->m.offset) << cmp->m.shift;
 	if (shift)
 		reg |= ilog2(p) << cmp->p.shift;
 	else
-- 
2.43.0


