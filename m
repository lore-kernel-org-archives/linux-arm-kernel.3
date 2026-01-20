Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50E5D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XzkSDuDP0HfzejUTV5XzIVGv3/HCsAZ2kabQBiMoXc=; b=d0GKjff1pOZUCbJyTq0q1F/iav
	nc/c3hcGSPLetx1/IwUTXKDk41wg/363dSg7+X470WDI0dYaHdSYabGq9UbGRFYvygkq4mZN6XOhV
	Am+Q8PVCRNeszxWfJMcIw4KkajahijZ1AHtjhaas87y0w8A7nTEnaETsE6Rvk6r71j1vDyNYnq+8G
	toVksD64k+d5Gyii3h5k7KW+k5DtK6dbGmrUpZHWNlZQfyvI78+GglVr4kZSPLRcxvhAUuJndnTZT
	FWp6UthPaJHa7Cnk519qpnwDjBNt1n7m6UzHT7UGtisMSRv83wKAkAHT3ZBKNt4CPDrlctnt7MUn5
	9TXp3vLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCsl-00000003zyh-33Sm;
	Tue, 20 Jan 2026 14:38:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCsj-00000003zwk-1Q2y
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Jan 2026 14:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6XzkSDuDP0HfzejUTV5XzIVGv3/HCsAZ2kabQBiMoXc=; b=rW3t9aZ09XIwTRs2FjaW33J+WW
	Q7inhlFdcw7mGn4ZwihpH5rBz0hwTirIBBY7U0aQ1LWFZkyhFvHPk2SR+lq9SUuqNUdX9o1kxNwmM
	UOhlYvqZ4BpMkn+kB87bzqERAmS4ROSM3NvuuVjWf3weJgv9GSQXPQkZNLjmbiNrX9/JJI7c4KIVu
	fPPph/2/Yh8DrAyrZdyVRDMxh8V5Cxvfp4dIpUbLhi8mECFU9MvfaT3YKG9LiIk7WjHpoZbENVBLW
	DVOtutK54sawQD9gzpie8XDahShUeFIKitpdR6ebDso3fI37zvCBcjeHHIqSg/nOVSLCBHcZTTYWx
	fi6TqNPQ==;
Received: from mail.thorsis.com ([217.92.40.78])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCsg-0000000EEC5-1NqB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 14:38:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D702C148AD45;
	Tue, 20 Jan 2026 15:38:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768919924; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6XzkSDuDP0HfzejUTV5XzIVGv3/HCsAZ2kabQBiMoXc=;
	b=oMyZMHrBI12VPCPL0yQIS0fjxoar0Ljo5pzPQ3ubhw8r5eYKbZm6j9O2804oOXaMg1m23X
	6l7c2y2zCfnnUPtOYKMdaNXEXmqq+oTCndzwGhmS/SULtz7K6Jieivw7skL+M48hL0jWcm
	f3DmEoHBVsFTc2KUC9MlX4GLNVjfgNPaJGvhcdgdSmd7Iwst4NH2pMSap5WQgHq/iwfXA9
	fvoKK29N09ZsuXEJcyvHjJBkWWzopahom8M+WWiNZT9ss20z7j49XYECEcUpBsUXM8G6sp
	lQKGhqFcqUytn9Zfj13/Snr4jE5N3+gB4CLi4KH/Q4mO4P0t+NPCZgIlq8n8LA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Cristian Birsan <cristian.birsan@microchip.com>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
	Varshini Rajendran <varshini.rajendran@microchip.com>
Subject: [PATCH v3 07/19] clk: at91: Add peripheral id for OTPC
Date: Tue, 20 Jan 2026 15:37:28 +0100
Message-ID: <20260120143759.904013-8-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120143759.904013-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_143854_529668_D3A64303 
X-CRM114-Status: GOOD (  12.27  )
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

That peripheral clock is required for proper OTPC function.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - no changes
    
    v2:
    - new patch in series, was not present in v1

 drivers/clk/at91/sam9x60.c  | 1 +
 drivers/clk/at91/sam9x7.c   | 1 +
 drivers/clk/at91/sama7d65.c | 1 +
 drivers/clk/at91/sama7g5.c  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index a9f293a8e3b26..11f16126ff9e9 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -146,6 +146,7 @@ static const struct {
 	{ .n = "isi_clk",    .id = 43, },
 	{ .n = "pioD_clk",   .id = 44, },
 	{ .n = "tcb1_clk",   .id = 45, },
+	{ .n = "otpc_clk",   .id = 46, },
 	{ .n = "dbgu_clk",   .id = 47, },
 	/*
 	 * mpddr_clk feeds DDR controller and is enabled by bootloader thus we
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 9a5afd258cb86..c4d2b022d9d07 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -407,6 +407,7 @@ static const struct {
 	{ .n = "isi_clk",	.id = 43, },
 	{ .n = "pioD_clk",	.id = 44, },
 	{ .n = "tcb1_clk",	.id = 45, },
+	{ .n = "otpc_clk",	.id = 46, },
 	{ .n = "dbgu_clk",	.id = 47, },
 	{ .n = "pmecc_clk",	.id = 48, },
 	/*
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 5d8973aa50a53..52467d629258f 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -641,6 +641,7 @@ static struct {
 	{ .n = "mcan2_clk",	.p = PCK_PARENT_HW_MCK5, .id = 60, .r = { .max = 200000000, }, },
 	{ .n = "mcan3_clk",	.p = PCK_PARENT_HW_MCK5, .id = 61, .r = { .max = 200000000, }, },
 	{ .n = "mcan4_clk",	.p = PCK_PARENT_HW_MCK5, .id = 62, .r = { .max = 200000000, }, },
+	{ .n = "otpc_clk",	.p = PCK_PARENT_HW_MCK0, .id = 63, },
 	{ .n = "pdmc0_clk",	.p = PCK_PARENT_HW_MCK9, .id = 64, .r = { .max = 200000000, }, },
 	{ .n = "pdmc1_clk",	.p = PCK_PARENT_HW_MCK9, .id = 65, .r = { .max = 200000000, }, },
 	{ .n = "pit64b0_clk",	.p = PCK_PARENT_HW_MCK7, .id = 66, },
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 9a6f0f30b2b7e..3e0cfd2613851 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -504,6 +504,7 @@ static struct {
 	{ .n = "mcan3_clk",	.p = PCK_PARENT_HW_MCK1, .id = 64, .r = { .max = 200000000, }, },
 	{ .n = "mcan4_clk",	.p = PCK_PARENT_HW_MCK1, .id = 65, .r = { .max = 200000000, }, },
 	{ .n = "mcan5_clk",	.p = PCK_PARENT_HW_MCK1, .id = 66, .r = { .max = 200000000, }, },
+	{ .n = "otpc_clk",	.p = PCK_PARENT_HW_MCK0, .id = 67, },
 	{ .n = "pdmc0_clk",	.p = PCK_PARENT_HW_MCK1, .id = 68, .r = { .max = 200000000, }, },
 	{ .n = "pdmc1_clk",	.p = PCK_PARENT_HW_MCK1, .id = 69, .r = { .max = 200000000, }, },
 	{ .n = "pit64b0_clk",	.p = PCK_PARENT_HW_MCK1, .id = 70, },
-- 
2.47.3


