Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC387C021A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPghIJ6cL7pP85XJ6Sy2Pd5BpvYfGOTZK412wRzCiEM=; b=GCG+8AiyW5kr4j8x2PiFleQ5NN
	ylyIBP7zzg93kQKOnLPrQKmtG/psduFPyuYTjjiqXTyUJlVJEvq6yIZNdZYKaNuDfw0uZdLokBAc2
	T7Fz66pqn6bocO+wfKP2Ja4n9ylX4sOA/vx4wgpwB3uSvwxxoV7IlHBZ93TvvEqJzhvGxD2tN/q/o
	PjeRiEI6VCxoIHCJW5rFMnUy9xeU/aArI9QA1GlSxSZlprH6d4mhGitL6RoRlsvCX6UuzaCdmMCeY
	vnfHn8FV/11jha8JoGtZXO59T9fVXOSvknm7qHKKeU3bDtdmQyb2nCJcrB3I9qQK7kFH3xIJdCLgh
	Gigm1yMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGGG-00000008EaB-0Vg5;
	Wed, 12 Feb 2025 17:10:56 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFgh-000000086HB-0KVp;
	Wed, 12 Feb 2025 16:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378051; x=1770914051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oGp2bSSFfKzAg37Gu5Gmi9/S21sWW7TvcVISpEG/3cs=;
  b=RzEZ6Heyr4jNsIYnnu/3kFJ0TDw8HLu1tdCuq4M+gQgXB7ddddtx04di
   2ZdEbudxjlriN9dxD0fAPw7Ez06hWdeoGWaLkyKws4ryT2XK4GwjLfYDY
   sKiKxox+wVciHHktmG+QtyuW1OMOF7iZNPX1tCPlbvCmPCf9mw4yRmGgA
   ORrfzxVDPx9YHaZUQkKgw05IAUhhLHixuDKzlSQqrYMDDYcFL6QjI4Ku/
   ZrqN6IHi7l0FNM+E1Mxih/kXCpSaAR0BCMVdeZRcn1XcK+qVopjUKn2Gl
   sh9eaV5yWE4KgYAByzxErJIMV9IWtj+d9+cFLhiHaMRqEbAXadBxSMbPp
   A==;
X-CSE-ConnectionGUID: 9PrMFS+BQQmWeOHRORlk4Q==
X-CSE-MsgGUID: Y8l0QmXUQDyav83oLpcv9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51032373"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="51032373"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:08 -0800
X-CSE-ConnectionGUID: sL7QU6DURcK9HnFMaJ3MFw==
X-CSE-MsgGUID: QXIAKTKjSJyFZbLr1csgZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117879145"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 08:34:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9D9B210F; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
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
Subject: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Date: Wed, 12 Feb 2025 18:32:26 +0200
Message-ID: <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_083411_165447_EE9192D1 
X-CRM114-Status: GOOD (  10.61  )
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

There are already a lot of drivers that have been using
i2c_8bit_addr_from_msg() for 7-bit addresses, now it's time
to have the similar for 10-bit addresses.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/i2c.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 997e80649889..4d281ff5582b 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -952,6 +952,16 @@ static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
 	return (msg->addr << 1) | (msg->flags & I2C_M_RD);
 }
 
+static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)
+{
+	/*
+	 * 10-bit address
+	 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
+	 *   addr_2: addr[7:0]
+	 */
+	return 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7) | (msg->flags & I2C_M_RD);
+}
+
 u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold);
 void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred);
 
-- 
2.45.1.3035.g276e886db78b


