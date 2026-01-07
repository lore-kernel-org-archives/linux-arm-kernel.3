Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09367CFD626
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1ga9hgoLz/9NRUhVBfHrCw/F/qtxibREvdnxc5/TAuU=; b=yOOeX3n1ScqJag
	RURUU8mTQ3lAnQwqqFIrpqcWkZMSjq4O3CZrluDe3/tifPgk0PuN7bTwlwSDj7DEhWS93mH46uUL/
	u7rroGTpRLaAHAKgCyhIRpVUfvxzfPzEjoKP8TdKi4YGrwNEyULesSca8cMgKUF5Eh3yGgCqz83eL
	Iyc//kxO4hWEB96+qnRYxtjM283AIicCPial7HWcZWcCIX/FMhTqa6CZG+TKGrJlNMqTqsEsgJW2d
	nxF5iwuBYSHcyre+paozZYLWTwMjaK7AWrMGX+VdGd3C9Et2Qeiiuxy05TzXSXf4WabbQNO6gqCd6
	5cv9+x3RiU4J861xVsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTE6-0000000Ex3E-2RKq;
	Wed, 07 Jan 2026 13:05:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTDz-0000000Ex12-2rqd;
	Wed, 07 Jan 2026 13:05:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 42AC64E41EAA;
	Wed,  7 Jan 2026 13:05:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1559F606F8;
	Wed,  7 Jan 2026 13:05:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F302103C821A;
	Wed,  7 Jan 2026 14:05:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791113; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=1ga9hgoLz/9NRUhVBfHrCw/F/qtxibREvdnxc5/TAuU=;
	b=dJa/3HBT2YYvgkLM+gr+n0s+1sPAl5nAgRbJfk3suFGpcKg/ezPW02AwahlEfdNPkG6KcV
	BrFwkDye8tRMNiMV7V6t2fWhuf9AmsRwMmqXOkli46Y/ru1+xx2PnmwHnniAtNWG4fPRGj
	itFHyltR0rL3lE/c/1Yakndj7XXbwYfy5rmOP3lwN/Wset1UhinZd8ZQZWUxCEq3DrXNZO
	X9GFkvjBTATGLhgoQwey7G7PTa012c6IwHyr8QjLYtOvAhvSBE26AIlj9C+5uL3zgO0CrN
	1UoBg1dWM7X6j39iz+IzMhpvgcGBBO7ePBqBLcDNjPWRrKhooiuLIN7EMDkp+w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v3 0/4] MTD physmap: Adding reserved RAM support and fixing
 reserved_mem limitations
Date: Wed, 07 Jan 2026 14:04:51 +0100
Message-Id: <20260107-mtd-memregion-v3-0-f9fc9107b992@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPNZXmkC/3WMwQ7CIBAFf8XsWQwLUqon/8N4aGHbkkgx0BBN0
 3+X9qQmHuflzcyQKDpKcN7NECm75MJYQO53YIZm7Ik5WxgEFwoRNfOTZZ58pL48WV1LbtBazQ1
 BcR6ROvfcetdb4cGlKcTXls+4rv9KGRlnupWqQjT61FSXNoTp7saDCR7WVhYfvsBfXxTfKCVVZ
 w21dPz2l2V5Aw0XtN/sAAAA
X-Change-ID: 20251117-mtd-memregion-8830c1dd70ce
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_050520_221915_23B58F28 
X-CRM114-Status: GOOD (  12.02  )
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

Hello,

While working on adding reserved RAM support to the MTD physmap
driver, I encountered a limitation in the kernel's reserved memory
support: although the Device Tree specification allows multiple reg
entries for a memory-region node, the kernel only processed the first
one. This limitation prevented proper support for reserved RAM regions
in MTD.

This series addresses both issues:

First, the reserved memory support is extended to fully support
multiple reg entries per memory-region node, ensuring compliance with
the Device Tree specification.

Then, with this foundation in place, the series updates the MTD
physmap driver to support reserved RAM regions. The DT bindings are
extended to allow memory-region for RAM access, and the physmap driver
is modified to use these regions.

Gregory

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Changes in v3:

- Fix the placement of the __free() annotation in patch 4, and also
  address the same issue in the current codebase with patch 1.
- Add MTD properties directly into /reserved-memory nodes, as
  suggested by Rob.
- Rebase on v6.19-rc1
- Link to v2: https://lore.kernel.org/r/20251121-mtd-memregion-v2-0-c5535fdcebe4@bootlin.com

Changes in v2:

- Properly managed cases where register entries used by the memory
  region are out of order, particularly when one or more register
  entries are mixed with memory region entries in an other node.
- Used "memlog" as the node name instead of "sram," which was misleading.
- Link to v1: https://lore.kernel.org/r/20251117-mtd-memregion-v1-0-7b35611c79a6@bootlin.com

---
Gregory CLEMENT (4):
      of: reserved_mem: Fix placement of __free() annotation
      of: reserved_mem: Support multiple 'reg' entries for memory-region
      dt-bindings: mtd: physmap: Allow using memory-region to access memory resources
      mtd: physmap: Add support for RAM reserved memory regions

 .../devicetree/bindings/mtd/mtd-physmap.yaml       |  69 +++++++---
 drivers/mtd/maps/physmap-core.c                    |  73 ++++++++--
 drivers/of/of_reserved_mem.c                       | 150 ++++++++++++++++++---
 drivers/of/platform.c                              |   2 +
 include/linux/of_reserved_mem.h                    |   4 +
 5 files changed, 252 insertions(+), 46 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251117-mtd-memregion-8830c1dd70ce

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


