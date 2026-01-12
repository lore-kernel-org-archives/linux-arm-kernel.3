Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78249C9EC94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pap1OJWQGM8TY1SgybjWHV9rK3+HZYlfSxqT5mail6k=; b=WRBq3azoZnNkqj/QQS/IpoQ/uw
	kDHY2u/0g4Vlg6FQoAf/k96k8N9q7AWbKg23/yRWJW1zDKKKX0uQjnaVytbLL3uH/xL5NpBvo66Fd
	vvfEjbuC7sEeByC/smzZQaxostSxxi8ogPYgG+OTRgfA0MeXn4rr9krSXLgYVnog8TGH0S8PlZU2P
	ZxV7moOSiJ2vdU26SKgMUkI2pizc65yvMaMs5iccmDKkir4Odtbh++XDLitfTIIW+tthPSmWbYbQ4
	uBvsONjKHIG8jfukPK/x8QFpcFHbPPNYksj7QkXYTQwZ2h2MrpNWC/VWWAMm2rxzRpmn1u2w7UZST
	9lOalh4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIII-00000005RXQ-0Dl7;
	Mon, 12 Jan 2026 13:49:18 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIID-00000005RSM-3WUR;
	Mon, 12 Jan 2026 13:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225754; x=1799761754;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=stoeaFvLKGGn0uhn85r/nzgAeuADmULIQT05Vn4VYoE=;
  b=guLjQhOU5dKu5hsPlXtmc+uWQ0vXhsnF8XGUa5khIKK0bE+je+hBN2z2
   D7m+OV7Rj33FYk0ravHfKF1ePQ2OoHLhfk5bXsOC+jT0HOt5ji10Bv6ad
   P7K4sUETgqmapHMdQVJLlYk1F0X9b7ffy+16L2PGv0c5stQLTi8pUV60t
   T24UEYRP7iTXQBZsPreLvTC1GrKJyWaUbnLmsxDquYX2/pT3F8uVDuARY
   OEgL2O+duelWOCgixikQ8D31SzfFz39Mj976xlEGfOenwyfMKy5WcPzP2
   +GewUwm+PnlpUmRdrUKE30CmHj18fOcKVX7Fo9YqrSqFp/uMu3kGZcljs
   g==;
X-CSE-ConnectionGUID: 2B06Ky5aTsO9vj/0RcDRRA==
X-CSE-MsgGUID: KeHKX5K7S0KTttlv1DESGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="57048281"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="57048281"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:12 -0800
X-CSE-ConnectionGUID: 3psanrVbTtGgoavkyMUQUw==
X-CSE-MsgGUID: g0E+JuNQRYarjdD7ueGt/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208618611"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 05:49:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B08B598; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi@smida.it>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v1 0/7] i2c: busses: Introduce and use HZ_PER_GHZ
Date: Mon, 12 Jan 2026 14:46:08 +0100
Message-ID: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_054913_891574_089FDF8C 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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

A few drivers for I²C host controllers use HZ_PER_GHZ in numeric form.
This is less readable and prone to subtle mistakes. Instead, introduce
a well defined constant and use it in the drivers. No functional change
implied except one case where 64-bit division replaced with 32-bit one.

Andy Shevchenko (7):
  units: Add HZ_PER_GHZ
  i2c: mlxbf: Use HZ_PER_GHZ constant instead of custom one
  i2c: mt65xx: Use HZ_PER_GHZ constant instead of plain number
  i2c: nomadik: Use HZ_PER_GHZ constant instead of plain number
  i2c: rk3x: Use HZ_PER_GHZ constant instead of plain number
  i2c: st: Use HZ_PER_GHZ constant instead of plain number
  i2c: synquacer: Use HZ_PER_GHZ constant instead of plain number

 drivers/i2c/busses/i2c-mlxbf.c     |  5 ++---
 drivers/i2c/busses/i2c-mt65xx.c    | 11 ++++++-----
 drivers/i2c/busses/i2c-nomadik.c   |  7 ++++---
 drivers/i2c/busses/i2c-rk3x.c      | 12 ++++++------
 drivers/i2c/busses/i2c-st.c        |  3 ++-
 drivers/i2c/busses/i2c-synquacer.c |  3 ++-
 include/linux/units.h              |  3 +++
 7 files changed, 25 insertions(+), 19 deletions(-)

-- 
2.50.1


