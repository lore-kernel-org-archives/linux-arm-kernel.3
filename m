Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367F3CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JXCaUs8U/JNspRHlN3rFEQiKScpBbxa26neT4DytoGQ=; b=FhHUyjiLx4V37B
	VPO/gt6KPgIk4YasDh0TKBDVs55+CJf8o/Y1wCFhuvZMRT/j0DcWEMadJGa6X7s54RMvnJkHSXH9+
	5gaQiSxTo4SobNMI9qbw7IHf4O7KjIL8M4QkkN80FlAgvCrBUQ0DTabZID54d7PnE8Ou3K0FsW35K
	hsqADHHmp/2raJF0VijiA+4ZAgVH1TIa3Nn55X2r74jNjBNwdwddWpK8wiJCCdpveWRjMnybpdwPR
	VQiyfL3sq3R7UHQolyeU6PeiOoVcOlVc3nvhqLe+KwNmehsCaze78GFmGwxIQwzsacwwGTB5fwhu9
	QCPtTJaPkYHaYxclz01Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2ag-0000000GRgx-2ISK;
	Mon, 17 Nov 2025 17:00:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2ae-0000000GRg9-3xug
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 17:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=JXCaUs8U/JNspRHlN3rFEQiKScpBbxa26neT4DytoGQ=; b=NVcZTV7uZHRIzo6UE4LMBc4x9b
	LyHCi8/BB3YwiPQUnOuPwkLcjZllOeamamFShuaUC6jMWNSal8pJ+OGzKdDNm+YNG9KZPnqb9oNeg
	EWMzrsiiewhPwqvuKWO1D6n5oOS03JVOlk59xKZ1MFPtifMOeOmxSCmaoXgVlwMVplp71MHCenmwW
	czZ7qEjRtQ/LbYUqSGT+XTKGilXXBEaUXRF7lurdNy1tKhAvhdwHYW12BHWvXswXFApQdxBSLm/or
	HhJdoAhgTIIurUELRa/lrd86I+Qekuvcqy4AXzf3t5au8VoEcehtVmTudHk+KiAUOU3LD0ZVY6/vw
	7plTQU4w==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1iy-00000007iSh-0hcB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 16:05:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 41F3C4E41728;
	Mon, 17 Nov 2025 17:00:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F0AA606B9;
	Mon, 17 Nov 2025 17:00:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B7F510371894;
	Mon, 17 Nov 2025 18:00:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763398826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=JXCaUs8U/JNspRHlN3rFEQiKScpBbxa26neT4DytoGQ=;
	b=EKFokzddJv+9jr2XFsIb2dkNyIwhhthpKzNrS/o35e2YJRysHcw4GGO1Jpy/WdQv6mMEX2
	ETgbo1oYpSas9p216gPRGy9d8jeIsclM0VObnKkPkNrXkLdYegb2EKHytN63ruot3AQ1QJ
	6P9SjSjnbJAv8XP3We42dJAWgewBKciG//LuA2+0jIXzrx95ztSqcvMBwR0Z/ejbRfmUvk
	BMxoZd/J2dcfcHnlj+lC5VlMGaNM+VQv2NU+ywsQtdufZubJUpQ6frDm8Nl8EqZl1aYqoy
	vxkqnAIvyNrCw+KfGesBrY22i+fhCxMmh1s6KMtCaZB46OMK5piAPWQDq81+/Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 0/3] MTD physmap: Adding reserved RAM support and fixing
 reserved_mem limitations
Date: Mon, 17 Nov 2025 18:00:13 +0100
Message-Id: <20251117-mtd-memregion-v1-0-7b35611c79a6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ5UG2kC/x2MQQqAIBAAvyJ7TnCNUPpKdAjdbA9aaEQg/j3pO
 DAzFQplpgKzqJDp4cJn6oCDAHdsKZBk3xm00hMiGhlvLyPFTKGb0tpROfTeKEfQmyvTzu//W9b
 WPpkOQ69fAAAA
X-Change-ID: 20251117-mtd-memregion-8830c1dd70ce
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
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
X-CRM114-CacheID: sfid-20251117_160504_283407_C1AED7CB 
X-CRM114-Status: UNSURE (   9.86  )
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
extended to allow memory-region phandles for RAM access, and the
physmap driver is modified to use these regions.

Gregory

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Gregory CLEMENT (3):
      of: reserved_mem: Support multiple 'reg' entries for memory-region
      dt-bindings: mtd: physmap: Allow using memory-region to access memory resources
      mtd: physmap: Add support for RAM reserved memory regions

 .../devicetree/bindings/mtd/mtd-physmap.yaml       |  59 ++++++---
 drivers/mtd/maps/physmap-core.c                    |  56 ++++++--
 drivers/of/of_reserved_mem.c                       | 141 +++++++++++++++++++--
 include/linux/of_reserved_mem.h                    |   4 +
 4 files changed, 220 insertions(+), 40 deletions(-)
---
base-commit: b55d426c390f2a4762b2a88b113cc44c37e08e46
change-id: 20251117-mtd-memregion-8830c1dd70ce

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


