Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B162C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTJ3OgERgaCDW+LQkBlZMWmTLghyw5QjbL4bGzZjkyM=; b=1OTp94n4ufGXU1BK/jRVcB3gK9
	XR376PfMn5gPvknWpY+8RM4B0aN0ArdRMLbojGyr1anh2/zTg7GqCgJxNqGIlsyMTqPkTakGBN36x
	Cgg9jo5/bDh0WJIuBp/I7xXqt93xIP30Uu64OgcupQuPTO2rxV3Vg0v/BznmroKJiGBoIZma8bRep
	Fa5nIybAaWSjC+B/jMj8p6EyzxHWqfNCFlR6Kv+0cO+dRSIV4OKfRb+xY3/HeRiXVNrjnbX/4clzQ
	5/gyMTF/3T7eUrk8me6iiO9oNTaR7tPjbowyDV8xfja+olWp77SZvP8+Ol8KOI6IUoOg9UeMoTTO/
	B48JL/Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGGJ-00000008EgY-3FNp;
	Wed, 12 Feb 2025 17:10:59 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFgi-000000086HB-499y;
	Wed, 12 Feb 2025 16:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378053; x=1770914053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6LcH/n/8RKz7Qn8xIS3YjC1iiVGNtYLVAm7DIZYYkeY=;
  b=SHpoqde6Nm+tECA6jCwZdx08DLm/BXl9wko974GOVBt18ej6zv0U4iyd
   7jbRkbC32yv/1hBDRZ7f9tHm+zBK3ViVY6YSc6OLfSxJ1r4VE3Zm8qq39
   PRI54Z+pqKE8K1e1jL7t6Rfgj1iQ1foheifnT03tGq7fcidbpj2z55un2
   y7u8vAs15CAgayrAJdscEApZf89UFBl6boNOSSGD19lFv2Le9d/M3e1NY
   vYbIzkNlHKDrIiJ+SZV9LQnz5dMLLLg79PS4B+WNAh9GQfQczgPS0p4Iy
   LnF7kXmPo6pZKmXSf8QPfJCw+R5xB10nnsvkYtkr5wCeNlM0d+QkrSgWg
   g==;
X-CSE-ConnectionGUID: V+jBqZOgTyyLJxEQIZLhbg==
X-CSE-MsgGUID: F9AzBJnyQ+SD+TgYJQglLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51032404"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="51032404"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:13 -0800
X-CSE-ConnectionGUID: ywYT84jHTgqIZemsslPwlQ==
X-CSE-MsgGUID: 1fXgybwmTnmsx5GqXBiEuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117879160"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 08:34:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E0A00322; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
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
Subject: [PATCH v1 5/8] i2c: kempld: Use i2c_10bit_addr_from_msg() helper
Date: Wed, 12 Feb 2025 18:32:30 +0200
Message-ID: <20250212163359.2407327-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_083413_089742_8A95E63C 
X-CRM114-Status: GOOD (  10.65  )
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

Use i2c_10bit_addr_from_msg() helper instead of local copy.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-kempld.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempld.c
index 212196af68ba..7508cc7a33a6 100644
--- a/drivers/i2c/busses/i2c-kempld.c
+++ b/drivers/i2c/busses/i2c-kempld.c
@@ -115,9 +115,7 @@ static int kempld_i2c_process(struct kempld_i2c_data *i2c)
 	if (i2c->state == STATE_ADDR) {
 		/* 10 bit address? */
 		if (i2c->msg->flags & I2C_M_TEN) {
-			addr = 0xf0 | ((i2c->msg->addr >> 7) & 0x6);
-			/* Set read bit if necessary */
-			addr |= (i2c->msg->flags & I2C_M_RD) ? 1 : 0;
+			addr = i2c_10bit_addr_from_msg(msg);
 			i2c->state = STATE_ADDR10;
 		} else {
 			addr = i2c_8bit_addr_from_msg(i2c->msg);
-- 
2.45.1.3035.g276e886db78b


