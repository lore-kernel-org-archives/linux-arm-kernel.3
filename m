Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC51BC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbQlCChsa/iUeZzEUWyVX76UMM7DA8g+S1BfYCxtxlQ=; b=g4L14tsmpcpf4nzL2sUqamzfRX
	tG5/qNWcOteU+BuK9R+YcXFPFp3qlah0pM4UtrH4pq6LomnZDYxgKIRPVqiMNCAJfmRd9wHz5Zmo1
	FqGm21tkzYRzfqHPCXc2+ED+/P2Omyxg4kYiURkYf9F75xnWWV7rC6opX3qKOp+Vrn16j4XVMe1a4
	eyyXE4ABpsUUVLeH2vya530swn7deZkbYkcoSrgbWuvGGC1HKUjxKA+sXqxgXK4nnh0tj3SYZeEbQ
	beQMCY7Jxui8k1uLS+W/CfXBwHWKXwNLRA3FHEPfAnbybq/G3QXfYtpa2K7XRM/ZdRsfLnH/biy+J
	YHfsFCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIP-0000000BLBh-29uh;
	Thu, 13 Feb 2025 14:34:29 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZvd-0000000BGnm-2Qge;
	Thu, 13 Feb 2025 14:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455858; x=1770991858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yp4FrWXW4JaF+mT3WDe29SXBFmsQXNetyMj2cbrB3Lc=;
  b=dtkbSTu9oG4FZeUbatLOcC4mG8BtrpsXyjAj1Rkx5wcQZzSBNzeO5gjh
   b0zIPYPc04tmmeDkzZf8qizTzVncqX1v2AAL0is2gx2kUGJ2BQbywhRbp
   2ZsMPQ0jRdFCvG3AYEUvuh6ZuqHUgYpjLHLJ9pbAf5zvWXGtlOnqh57XE
   NthvQCn7YbC8NQsFV0V7GYtJhr8OI+Ep9YRf78pcc7DPIbBklG1rZGm4B
   sB/1uuC698Ldw9xxAMhMKJkLeLbGDlAHlQlFrWnZoEBNgCrfRdKgiS3O2
   kFzUqOIRoeN9EbJ9jcb79A0MH9Je+zgh/h4mU/rxTc2d2pgMTqUZmk8Wy
   Q==;
X-CSE-ConnectionGUID: +mWzjQViQ+q5kov2xLW+qw==
X-CSE-MsgGUID: G/OWEewiTEOZbRRyU2RWOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40273364"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40273364"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:55 -0800
X-CSE-ConnectionGUID: N12ApcrZTLmSWu4H86qDJw==
X-CSE-MsgGUID: 59+8kRuIQtSBaiDwgv5slQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113815328"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 13 Feb 2025 06:10:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 31DD11F5; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 01/10] i2c: Introduce i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:15 +0200
Message-ID: <20250213141045.2716943-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_061057_687752_FDDD664F 
X-CRM114-Status: UNSURE (   9.20  )
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

There are already a lot of drivers that have been using
i2c_8bit_addr_from_msg() for 7-bit addresses, now it's time
to have the similar for 10-bit addresses.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/i2c.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 997e80649889..e23b373b6b57 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -952,6 +952,20 @@ static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
 	return (msg->addr << 1) | (msg->flags & I2C_M_RD);
 }
 
+/*
+ * 10-bit address
+ *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
+ *   addr_2: addr[7:0]
+ */
+static inline u8 i2c_10bit_addr_hi_from_msg(const struct i2c_msg *msg)
+{
+	return 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7) | (msg->flags & I2C_M_RD);
+}
+static inline u8 i2c_10bit_addr_lo_from_msg(const struct i2c_msg *msg)
+{
+	return msg->addr & GENMASK(7, 0);
+}
+
 u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold);
 void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred);
 
-- 
2.45.1.3035.g276e886db78b


