Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B25CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 11:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hXg/GxymvCtNiazPIaxXzRrcAnchuXSa5kiiDg/krUU=; b=x9ag+Mi263pbU5L/porGkCtTrm
	K7HtQOm8YXWfgHnCMJrZVtl5COSOFwBwv+eqO55oZSYsA9ymDUMUZWRLsXWv1+KP6TwJAX2yaZn1f
	/WQBcKbYkkgU+oKfe04ZNfgcJEar9fnhnPTWcM8IaZn67T07StkW/VWc2wr3GdHYNlncYMi4VCgnE
	y36jOniOOHvPJokqRE+wIeEFJqlwLJF/ZR5RGkVNRvTlpjO9cr7OXeapXkbD+MN3Ya6DbnDNKEJjF
	tvvWwMyNfG/nRhxxdbE1SS1R8YIGt8NUDIbMU8FB6bAw3rAgYlbdsjgrttI8kCkNZF4xyv8T8MsQy
	D6F7ospg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eOT-0000000A9Tk-1V7X;
	Mon, 22 Sep 2025 11:07:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eOQ-0000000A9Rw-0FaI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 11:07:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-46d40c338b8so6061905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 04:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758539256; x=1759144056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXg/GxymvCtNiazPIaxXzRrcAnchuXSa5kiiDg/krUU=;
        b=KGi7IzXtKJywdh2Ca0jrTMUD6kJw7IDOiEeLRZmvhxH7YdQobAbg2sIOubwm60V/Ui
         aWfCZxW5l5o5P8rRsQMrnaaHpU2SB+FxewjRCjyCZg5CfQ81QjfVzh49MCcqD773fH0a
         P050NgKOg7tJeZ2fDiqmr//7/SINdy5DLuwIv9Uoscdl3FslIqsMb633a5Z9d5AUKU+6
         51WPNAAY5lKrNYQzvUXL46Oirh06yiQpJB901V86V+kTMNHFswfxkZ5QqzdqqQE7pAVv
         /ZIRRJGIzUWWTgoBTkMobSDm7kvZAjL3ridyy1usVXSAkR15mmznpAKr0mG5dgIKIsab
         qArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758539256; x=1759144056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXg/GxymvCtNiazPIaxXzRrcAnchuXSa5kiiDg/krUU=;
        b=fkHBnMbUoqtQ0QmCzPnw5JW7rT6Of8WhLKV5TNTPMjd/TpiZUGzdp28pMQ3B8nOJT7
         vkO+Sl9HUze9FG4Ecklp0OmwD/6GvyQcQj52JYfxRm0TsLjbGwJC3jsvKzU+I7y06t1S
         EUBPetxW5OmFvBIdclKSPu8S3s88hkCcPPqB5ULSmlkFXpSqNKdgM7KupUHGhO4xN/7R
         jTV3v4D0CVCXUXexZUNREl+aA+ex/RQHGX2xoV0AWhSKvZHghVAxzcubJnWgS+hP1oN0
         A+z/cgTQn6bbWN3s6LJLvLp1hbmgWXL7XYs8hrK0tAjOhRrJ4ULhcV+wuiOQRa2PNbVL
         5Wxw==
X-Forwarded-Encrypted: i=1; AJvYcCV6g4mbRPU2HWnj6YX4j9bo/IdOeibc+JDc20nyLTcX2Hu0JqRTep/13UUNZQ4RmoLLg6kOaUOyUBi7WAyHIm6U@lists.infradead.org
X-Gm-Message-State: AOJu0Yx878aUEavfXnr0uI4DP75OrV11TqUnrrhtnRaL1Bf+wBcTXX47
	RY7b4QpRiPPn3ouDT1Vwbsk7+Eb2BUn8B6mA9BiZlXGOclNmRAmdA6cx
X-Gm-Gg: ASbGncui2HeqvNg1ppiX9yoZSfCmdO0MGcCOzAek0aiVv1/ST6BzdwudLFzAeQXPpx+
	q+2jgvlgJGZSUkloe1MJcDcSfRrN5dblT4ShRdfNi9S4W44wHuTB+f8GkV+M84zkq6ad1s1FUvs
	LnZFX5pXRN8Z4iYnmJA0S8EMXLyhQNI3EmKvhuDprrCJp1hvvc9L/iP3GPRthwJGeUJJ4ShzLUh
	QsEEfcLnbTszf2uPsnWeAxXxoyP702/UAuFuOZi9cs7ixSgJGTWUt6HbmKGzLXFG8xnmfTiZo/4
	O0ziwBVBgqm8jxOqwV5NAT993Gb/9OhOFtJHG2UrMA9JoHJdffOXHjWN3W8Ai+XKBHOfCZQqZgP
	B42DBh+ddZ64A9OKtzPhPu9nsx/Qx9FE=
X-Google-Smtp-Source: AGHT+IGuwhHEO83sfFCU12OTOC2+vkw5qcfiySY1IUg+z3oQVKsK98ybPmO83IDuQ6N/NzO8qDOnLA==
X-Received: by 2002:a05:600c:1d0d:b0:45d:f7e4:87a3 with SMTP id 5b1f17b1804b1-467e6b64fdfmr112379105e9.3.1758539255657;
        Mon, 22 Sep 2025 04:07:35 -0700 (PDT)
Received: from pc.. ([105.163.156.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee073f53c4sm19524684f8f.3.2025.09.22.04.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:07:35 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH] mtd: rawnand: atmel: Fix error handling path in atmel_nand_controller_add_nands
Date: Mon, 22 Sep 2025 14:07:27 +0300
Message-ID: <20250922110727.1423318-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_040738_096663_A1C2E79A 
X-CRM114-Status: GOOD (  13.21  )
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

In case of a jump to the  err label due to atmel_nand_create() or
atmel_nand_controller_add_nand() failure, the reference to nand_np
need to be released

Use for_each_child_of_node_scoped() to fix the issue.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index db94d14a3807..49e00458eebe 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1858,7 +1858,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 
 static int atmel_nand_controller_add_nands(struct atmel_nand_controller *nc)
 {
-	struct device_node *np, *nand_np;
+	struct device_node *np;
 	struct device *dev = nc->dev;
 	int ret, reg_cells;
 	u32 val;
@@ -1885,7 +1885,7 @@ static int atmel_nand_controller_add_nands(struct atmel_nand_controller *nc)
 
 	reg_cells += val;
 
-	for_each_child_of_node(np, nand_np) {
+	for_each_child_of_node_scoped(np, nand_np) {
 		struct atmel_nand *nand;
 
 		nand = atmel_nand_create(nc, nand_np, reg_cells);
-- 
2.43.0


