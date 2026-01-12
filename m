Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C96CF45CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 21:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FGoocTn0i3bC9X+0hadEqLNQB9DQNrsCMg6yETh1aZ0=; b=Nh9J5xZ1vUtu4nkelhd6Ggi80d
	lqp4GXllobcCJ+M7sQHAmq7V7Ds7D10XukFR5OomUGhFqbtJrHJ/cLkwpEqYLmlDVBa10o48fOTej
	sqXHasrqIdtEWvj+tb5B64aqYj3NihGOASm6umdAyQqDeIl3wWx8F1Wo4TySyk/AE7j0optOsaBKX
	30nACc0VblQsHS+QZZ9r3qDwgMMLXcn+YbWRK3ApB7B1cIEe9ix6mCxm7nJYfz+TGz2ZStmmvuzlQ
	64m+FBmYD7bKgooZw/NrocyQ8dZWm8f3UBFXfzS31sF0tIrZTDp26p0ZrSyoh3pNc+JcEr5odPO+m
	ygQmE/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPGb-00000006Ca3-1x7z;
	Mon, 12 Jan 2026 21:16:01 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPGY-00000006CZi-2YQ9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 21:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768252556; bh=rWb3SpOfrjZZ6el4MNTV0Ke40BroBOS7IsFzl8PiMe0=;
	h=From:To:Cc:Subject:Date:From;
	b=B3aIr83gKqLA7r3LFwP7luBLV2j0twHPV/RnkY3hD5GLhOm5uqE6FuKPvsOvXDmg7
	 ZbaaJxaRkBRNxR3TNjLKSicnVeqJnu9NYiAKyLY/by45Tme/AahNwc+/MeR/5kvz1r
	 YX9Irn6y7PeZSGo5LiKvwODW/5cJvtFDKCtcToKze5eOvY0Epj5WAU4tCkq/vnU3BW
	 a6WRIzpjEMVK9koHzG/ajV9BPlYQyByozG+PJ4yellznlr238SkkD8ZQ+JEy8xMozM
	 M90qRfY5k467nnzYFVohHD2/NEidMrg4yoT4f0WJN+HNkpLT2rdVMgaPeKtpHdd5Tg
	 vBNa4cNIFDWQg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 717163EC06A;
	Mon, 12 Jan 2026 21:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768252556; bh=rWb3SpOfrjZZ6el4MNTV0Ke40BroBOS7IsFzl8PiMe0=;
	h=From:To:Cc:Subject:Date:From;
	b=B3aIr83gKqLA7r3LFwP7luBLV2j0twHPV/RnkY3hD5GLhOm5uqE6FuKPvsOvXDmg7
	 ZbaaJxaRkBRNxR3TNjLKSicnVeqJnu9NYiAKyLY/by45Tme/AahNwc+/MeR/5kvz1r
	 YX9Irn6y7PeZSGo5LiKvwODW/5cJvtFDKCtcToKze5eOvY0Epj5WAU4tCkq/vnU3BW
	 a6WRIzpjEMVK9koHzG/ajV9BPlYQyByozG+PJ4yellznlr238SkkD8ZQ+JEy8xMozM
	 M90qRfY5k467nnzYFVohHD2/NEidMrg4yoT4f0WJN+HNkpLT2rdVMgaPeKtpHdd5Tg
	 vBNa4cNIFDWQg==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 0CAE13EBBA0;
	Mon, 12 Jan 2026 21:15:55 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: s3c: remove a leftover hwmon-s3c.h header file
Date: Mon, 12 Jan 2026 23:15:54 +0200
Message-ID: <20260112211554.3755188-1-vz@mleia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260112_211556_491810_99F387F1 
X-CRM114-Status: GOOD (  11.66  )
/bin/ln: failed to access 'reaver_cache/texts/20260112_211556_491810_99F387F1': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_211556_491810_99F387F1 
X-CRM114-Status: GOOD (  12.68  )
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

The last user of defined structures s3c_hwmon_pdata and s3c_hwmon_chcfg
was removed in commit 0d297df03890 ("ARM: s3c: simplify platform code"),
thus the platform data header file itself can be removed also.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 include/linux/platform_data/hwmon-s3c.h | 36 -------------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 include/linux/platform_data/hwmon-s3c.h

diff --git a/include/linux/platform_data/hwmon-s3c.h b/include/linux/platform_data/hwmon-s3c.h
deleted file mode 100644
index 7d21e0c41037..000000000000
--- a/include/linux/platform_data/hwmon-s3c.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright 2005 Simtec Electronics
- *	Ben Dooks <ben@simtec.co.uk>
- *	http://armlinux.simtec.co.uk/
- *
- * S3C - HWMon interface for ADC
-*/
-
-#ifndef __HWMON_S3C_H__
-#define __HWMON_S3C_H__
-
-/**
- * s3c_hwmon_chcfg - channel configuration
- * @name: The name to give this channel.
- * @mult: Multiply the ADC value read by this.
- * @div: Divide the value from the ADC by this.
- *
- * The value read from the ADC is converted to a value that
- * hwmon expects (mV) by result = (value_read * @mult) / @div.
- */
-struct s3c_hwmon_chcfg {
-	const char	*name;
-	unsigned int	mult;
-	unsigned int	div;
-};
-
-/**
- * s3c_hwmon_pdata - HWMON platform data
- * @in: One configuration for each possible channel used.
- */
-struct s3c_hwmon_pdata {
-	struct s3c_hwmon_chcfg	*in[8];
-};
-
-#endif /* __HWMON_S3C_H__ */
-- 
2.51.0


