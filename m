Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AE9C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGZwYBojvf6z6A3kSsqqOxznQcvg2kta/W2R0+OqU+I=; b=uJw6x6XXn/HX0gVovQ3k3UfYsy
	iTafWzImC2TTnd+bTlj2nY97ptMIm9DEgGH/yS+lynmh9fvk/2Ohkn8za/wgQWe+Lrsqa7XlXbpgo
	UkzYdSI7kcALiAOU8Go7FunQgVdlyC6k5uniDK8lWY9IsgVsDcakYHbSdWvarVU0L/Jq2sU+fN9aG
	oazzBmQw5fZiQdYKBhPiIPEaMRC8dYRPTrsw2L2I+Jx3GpRku4Z2t+Vt9BHLTcJXjTqwX9UsWqCJz
	sDrxNyrZ0GG+AZEqFvgUUKC2FDt+RgQODY8nhWGAMaMdNAyl0c4VfJwJHUgG2x8GEulay+QAAvbBq
	ntsOAhxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oJr-0000000FKkV-2RVa;
	Wed, 02 Sep 2026 17:00:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oJm-0000000FKck-0tbE;
	Wed, 02 Sep 2026 17:00:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 730984E414EB;
	Wed,  2 Sep 2026 17:00:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47B4C6053C;
	Wed,  2 Sep 2026 17:00:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 552B511C79D62;
	Wed,  2 Sep 2026 19:00:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788368407; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LGZwYBojvf6z6A3kSsqqOxznQcvg2kta/W2R0+OqU+I=;
	b=JwDbN15jc6X++alUeVNGWxECEV7xs0qC3M1t+K0CP0N7sLzhJHcDjQsJH97WPOMhqnbme2
	riiDEidWszJ7WfaQLHb0qkmEHOCujv9Uhz6qyAuYqZSdiUHYoRPF78tEnMSBS5BTZWN6tG
	IW2KL7NuwCPgGieLTUcaEq+UdK7ngBHWSK+2moD+dGg5u9V8Ew0xnZdxjcTvsJSCOIKlhG
	4KgRY1pfnxt8PuaSqcAIYE0DqqcrK3k68i3ctWhbdPlDuPiIcosn5nftYKgL/1/psWhVaj
	SsCIHWblxytCh01m9ZRAAiWRF3WEDRtHsYVjgzPcdQB8TG4OgImjdPNqLoWDGg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 02 Sep 2026 18:59:21 +0200
Subject: [PATCH v4 07/25] mtd: spi-nor: Create an indirection on the part
 name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-7-779d35303dff@bootlin.com>
References: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
In-Reply-To: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_100010_427128_F6A97B5A 
X-CRM114-Status: GOOD (  15.29  )
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

We currently print through sysfs and debugfs the name of the part if the
.name field, which is legacy, has been filled in the ID table (otherwise
"(null)" is printed). These IDs had an interest until manufacturers
started re-using more and more extensively the so called unique JEDEC
IDs. At this stage, a name that was tailored for a chip sold in 2016 may
no longer be relevant for a chip sold in 2026. Still showing this name
through the various filesystems may confuse people, removing these names
cannot be done since they are now part of the user ABI (because of
sysfs).

In order to allow overwriting the .name field (which is part of a
read-only structure), let's create a spi-nor pointer which will by
default point to that .name, but which can be cleared in fixup hooks to
make sure the name is hidden on newer parts.

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c    | 1 +
 drivers/mtd/spi-nor/debugfs.c | 3 +--
 drivers/mtd/spi-nor/sysfs.c   | 4 ++--
 include/linux/mtd/spi-nor.h   | 1 +
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 77d28c99c33b..1e8628da675b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3493,6 +3493,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		return PTR_ERR(info);
 
 	nor->info = info;
+	nor->partname = info->name;
 
 	mutex_init(&nor->lock);
 
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 512825c3fc85..275671222588 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -82,13 +82,12 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *erase_map = &params->erase_map;
 	struct spi_nor_erase_region *region = erase_map->regions;
-	const struct flash_info *info = nor->info;
 	char buf[16], *str;
 	loff_t lock_start;
 	u64 lock_length;
 	unsigned int i;
 
-	seq_printf(s, "name\t\t%s\n", info->name);
+	seq_printf(s, "name\t\t%s\n", nor->partname);
 	seq_printf(s, "id\t\t%*ph\n", SPI_NOR_MAX_ID_LEN, nor->id);
 	string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
 	seq_printf(s, "size\t\t%s\n", buf);
diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
index 643513ee891b..a2dabe4c6422 100644
--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -25,7 +25,7 @@ static ssize_t partname_show(struct device *dev,
 	struct spi_mem *spimem = spi_get_drvdata(spi);
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
-	return sysfs_emit(buf, "%s\n", nor->info->name);
+	return sysfs_emit(buf, "%s\n", nor->partname);
 }
 static DEVICE_ATTR_RO(partname);
 
@@ -78,7 +78,7 @@ static umode_t spi_nor_sysfs_is_visible(struct kobject *kobj,
 
 	if (attr == &dev_attr_manufacturer.attr && !nor->manufacturer)
 		return 0;
-	if (attr == &dev_attr_partname.attr && !nor->info->name)
+	if (attr == &dev_attr_partname.attr && !nor->partname)
 		return 0;
 	if (attr == &dev_attr_jedec_id.attr && !nor->info->id && !nor->id)
 		return 0;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 3a55d76ea77d..b1e573367604 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -395,6 +395,7 @@ struct spi_nor {
 	u8			*id;
 	const struct flash_info	*info;
 	const struct spi_nor_manufacturer *manufacturer;
+	const char		*partname;
 	u8			addr_nbytes;
 	u8			erase_opcode;
 	u8			read_opcode;

-- 
2.54.0


