Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6662606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ypKaVu7J;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=suEgwP3Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MVt4jUBXqyElZ0SSRIhpdxWMUMvKdg3ek8bVkKAtdNk=; b=ypKaVu7J0ZKumw
	ySm6+if9/qGE6T/8NO2UXN1WpWi3MdXwhfFnnstY7F05ldMz+Q9iaXrs0f9skLTZP4/OElMctTYm3
	Qp3kZz9XCKwgpTtITEB/NDgD3VVDIoMQqdx7jlAGSqXOgb0QG9f+hmcpDglxUKY0avmfLw+xsPJuM
	WDfAuAYzG4pb1pJxQ6Pg4iaux/zBW0zAm6RIEk1Te9ILgCT6BT8SGIRtbkNSt1Ou+RjxKWHD3PMlj
	DjtIz0lWI1zRNUr1sGo7oAlO7qstJ7aD8h6QeZ/hReuel3UZrxH8eQiDyfqB3wsWpGxllL4zCWtop
	vx4wLs9ZIWjQMVn5CXUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwHa-00000008qVr-0jof;
	Thu, 05 Nov 2026 12:09:30 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwHU-00000008qRN-3H8f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:09:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46B7D14966A9;
	Thu, 05 Nov 2026 13:09:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793880598; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=MVt4jUBXqyElZ0SSRIhpdxWMUMvKdg3ek8bVkKAtdNk=;
	b=suEgwP3Q78IIN724CzYRSSlNnTvr5+Dbkxy/6rXKWS/DxVSjJd7zOywboXOSuA3BRMuMha
	kfG/zhpyBpdMfekk1/t8ewOKEq6ybszdOrqVubbfb4rD/8ph7PVMeESedO9eiRJpF6GpFY
	nIMsdN3wHr65BOCzNJj7fWvCgbeH9hxtJkwqSm6VFObT4H+lweGx+hvEbW7Izi1y7+DWKz
	etXPTjWVmOLPK2pPdceuLnUqtf+Rw2NIbsDMhAohFYfWJrO7CJp1S2yupu7IbggiJ4kGki
	GGb0+j/3vZbg3m/0hSeI5SBVxQLLvxxQQbXbKX8HcLTgN04UELA4D362x5hEMg==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Mihai Sain <mihai.sain@microchip.com>,
	Durai Manickam KR <durai.manickamkr@microchip.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v4 06/16] clk: at91: Add peripheral clock id for OTPC
Date: Thu,  5 Nov 2026 12:06:42 +0100
Message-ID: <20261105110715.2486432-7-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_040925_014172_FD14BE31 
X-CRM114-Status: GOOD (  12.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the peripheral clock IDs for OTPC.
This clock is required for proper OTPC operation.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - Reword patch title and message
    
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
index 4a7ff559522eb..b4cd001782604 100644
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
index 194a8e44aa0ec..8edf62fb9f371 100644
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
index ef54d2fa6cf40..1f3c724739133 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -643,6 +643,7 @@ static struct {
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


