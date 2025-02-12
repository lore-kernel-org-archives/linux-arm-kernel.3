Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431BAC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LYn0fgjRDLK7we1WSOcVCL7eXddRMLXfF5g2iN6bwXY=; b=UyTnLtGe8MSbmpztnKjGKy6RPR
	7XaLrgDW76h+VwPPH5OLqNzWbICEwFoz2yESeGt7QWqwup8et8eSmKI+/sxyFKXClMzV5dBXWHwlx
	r22uRzhuahm+6W1YAz2ejxtQ1u3/0fn8yghIqrW6O3AVEcENnIannabXLYYkSe56nhAZYyHGqkOf5
	ycLzzN/OHZMbby5ZGi3MW5ch7jsLdxn6z7/g9Ud28wCGQi8Nd54Y4KdM45ClWCDeBS08x43ogXcVs
	7I0aBs4LhTLGyDWeIwYGstIyk87wi5gVXGBXXJgxNAZkI9ugXZSIUFWeX/+xKwn3G6TPdP8rfLzH7
	4vrpSfsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGGD-00000008EWH-38Ey;
	Wed, 12 Feb 2025 17:10:53 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFgf-000000086HB-3BBO;
	Wed, 12 Feb 2025 16:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378050; x=1770914050;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kCFQDLNfPixVyUh7+fi7hXH2lVNVmZoD/srcHAu/zkY=;
  b=QG9YHrgJCJEiRPB+RpFGdmWrmwf1Yuj04MXg/QQ4B1F8jHyGZt5WWCDu
   HFGjk8v2A7nU5dD0p0k+T4oAe7UNHTkHDfRSmduCA0AWthkZNtKPdQL+M
   j7iNkqqVtpNE/ffILIreJ0Ok9F8XWMjzcpvK+FSEdYTNJKNOEJ+QmEq47
   tuWJPqpDp0VqBMhxRMQDAtkDuqn0vqLyiVk5LVw4ejiqkvfIDZ1bbKs3c
   4crcknXXaROcKgOfzWNfNxpaZQ5x0pVL1gtW0hA3jp0j/qlifD7Cj3J6Y
   HwcEoNJDNsoWKMZQiFrQ8/aNmi2pQ0Ez+1Yt1j79+o4zV+sHeKJfV/+rq
   Q==;
X-CSE-ConnectionGUID: tRycJX5kR2Sci1Ps3flmjg==
X-CSE-MsgGUID: rQc9+lCDRKiFlHVhu/nhtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51032329"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="51032329"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:08 -0800
X-CSE-ConnectionGUID: irz/hdSsQPyHAJdCuCCBCA==
X-CSE-MsgGUID: lO25qOasSlKvhSxXSqtPRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117879143"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 08:34:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8E55F11E; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v1 0/8] i2c: busses: Introduce and use i2c_10bit_addr_from_msg()
Date: Wed, 12 Feb 2025 18:32:25 +0200
Message-ID: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_083409_839913_A08783D7 
X-CRM114-Status: UNSURE (   7.23  )
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

For 8-bit addresses we have a helper function, define similar one
for 10-bit addresses and use it in the drivers. It allows to remove
some boilerplate code.

Andy Shevchenko (8):
  i2c: Introduce i2c_10bit_addr_from_msg()
  i2c: axxia: Use i2c_10bit_addr_from_msg() helper
  i2c: bcm-kona: Use i2c_10bit_addr_from_msg() helper
  i2c: eg20t: Use i2c_10bit_addr_from_msg() helper
  i2c: kempld: Use i2c_10bit_addr_from_msg() helper
  i2c: mt7621: Use i2c_10bit_addr_from_msg() helper
  i2c: mv64xxx: Use i2c_*bit_addr_from_msg() helpers
  i2c: rzv2m: Use i2c_10bit_addr_from_msg() helper

 drivers/i2c/busses/i2c-axxia.c    | 19 ++-----------------
 drivers/i2c/busses/i2c-bcm-kona.c |  9 ++++-----
 drivers/i2c/busses/i2c-eg20t.c    | 28 +++++-----------------------
 drivers/i2c/busses/i2c-kempld.c   |  4 +---
 drivers/i2c/busses/i2c-mt7621.c   |  4 +---
 drivers/i2c/busses/i2c-mv64xxx.c  | 10 ++--------
 drivers/i2c/busses/i2c-rzv2m.c    | 10 +++-------
 include/linux/i2c.h               | 10 ++++++++++
 8 files changed, 28 insertions(+), 66 deletions(-)

-- 
2.45.1.3035.g276e886db78b


