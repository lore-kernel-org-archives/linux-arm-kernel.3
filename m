Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57A6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSJyRKfUgsicif6Zhh9aMvR5uHldOPhckaMuBpk84sM=; b=ZVCR+DnWVu04dj93zA5Sv6c6If
	5ZRNnHR5uY6vk8Jue5jf6oOUvlJ6sQS0LXHqBrMeE2R/wQc1vTE5EG+WHQ1I6b+P2KKf3jCpHHQ6m
	XJnHo8qcBa6dGxHBuaAznAy11Cn2LAGYiFWM9iZq3YBbWmJsx4XMCKreJn1iSpGmkQJlOTcv+KuYR
	VE3n76ThN5xWCZAtd/gXXwgm5q8tJHr1chm6UqNGDY4BQR99KAZzcLANzG2hhX8E2AxYzla3ww6co
	C6feqgK+YPNVZ3qjnkyy9sNumw/SmLEgccZQaC5Q98lxAm1fwYvvqI9S63ZOBV6A4PryoN7yUj0sD
	ricF0p9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzUp-0000000D8IC-22OU;
	Thu, 10 Jul 2025 22:12:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYk-0000000Ct47-0LpS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 20:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JSJyRKfUgsicif6Zhh9aMvR5uHldOPhckaMuBpk84sM=; b=kiXoqT+SRwbaZiV5dD0pyG/q4t
	m2CRIhHdYYeetOq0yciRDGorRvAvJSYOPyYinW3AW2vlCGgPVq8JE1bK/c/7U92GRWhglNrHd0rtV
	6wYxFRBhWAqoLkUIR7yYCgWTWIKrlh5vU91sXl7vcchmJJf7BnD2MAbSP4NjQbLiLNWTJRKww9Lfr
	6B+RbvTmvi2ypj30JWo2jcKPYfXonX2WOuvKUAZRcaDVurcLaPegSTjhyRHEQjgE1r/iXXXvUyNJh
	WJPpzuaTjN+qI3bthCbsqrHXbbXj+ZM9zwqqOmcJdGz8errps20IBiQ+M3s7EDy+1hapzqjPP2NHP
	N1dzazIA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxYg-000000098pc-2CcC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752178074; x=1783714074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zv0CC3WYKH/36O9O0t/SOoiKrmvlfng/rt5RJxB0L+A=;
  b=hrAyMcON+dkE5ZvsnvLmTXAmwzF1pXAbfl9c7es1IQsEKFWdToscxoOy
   8AoIwO4nLxEgZyzzqrhG0kM+gshqd1tiQcWCykE9a77gf0UipnY7Npqnz
   oH7rt9FxXdaaK/jjMovM9eJv+S1yuOJt3TNX2PQ/yjiV0OpyxHGyixWoX
   jiKtURR6suFbcVWuXXvHM9lhZ3B0aXGhTcCwZlVsKGfeg3VYv6SRzPyFv
   u24IyJkuuzq6AD37Cl6dADJGHy0BcTbYqqdb41xgSzB5pOr7TjVhNXB7G
   kJ3guy5RFuYuSSYn+fLvoo5eZ/ga7Cn+2vn+kal4YgCI9LmNuMLL2phqp
   A==;
X-CSE-ConnectionGUID: VcY24SkbRKSMnNSaLxS1vA==
X-CSE-MsgGUID: zr4ioYhrTsmq9eXidwg21Q==
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="44448156"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jul 2025 13:07:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Jul 2025 13:07:30 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 10 Jul 2025 13:07:30 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <varshini.rajendran@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>
Subject: [PATCH v3 01/32] clk: at91: pmc: add macros for clk_parent_data
Date: Thu, 10 Jul 2025 13:06:54 -0700
Message-ID: <f3ef0275345578c504b41710c67bfe1238c44c21.1752176711.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752176711.git.Ryan.Wanner@microchip.com>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210755_146203_21D11C7D 
X-CRM114-Status: UNSURE (   9.24  )
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

From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Add helpers to set parent_data objects in platform specific drivers.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: enclose complex macro with parentheses.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/pmc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 4fb29ca111f7..0b721a65b77f 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -15,6 +15,12 @@
 
 #include <dt-bindings/clock/at91.h>
 
+#define AT91_CLK_PD_NAME(n, i) ((struct clk_parent_data){ \
+	.hw = NULL, .name = (n), .fw_name = (n), .index = (i), \
+})
+
+#define AT91_CLK_PD_HW(h) ((struct clk_parent_data){ .hw = (h) })
+
 extern spinlock_t pmc_pcr_lock;
 
 struct pmc_data {
-- 
2.43.0


