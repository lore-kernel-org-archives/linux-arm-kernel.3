Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A938CFC28B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 15:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yTl8T9kOPsRlZLi/qxLvoBg6wGqTVmaXfk9LwQI9gG0=; b=c4NkhZll9/amJn
	/m1KOg0SRVVasGXR8R8yV3vRSnpel+9P+aEPAmX1CUuBc70YeOYTex6FBrU59ZQoIAiW9HaHB8VyY
	cgYG3qwQRitapR/rlLPOel4dVsp/WCSsuqhzfricVybHekLu3xL9Xwl2eXrFGWMmjib7sv2u5dAqc
	JeUs1mqHcMECGtP03zXMJY+RKEOSzMclCvhZ5NYHLldwDJKQfex1ESVspHO3kSK/jloTrzfAfNKpD
	6m/QXDPqh7mjEuuH8SyZRH1Ls5I1q+F04PyeR9klTh9wTzFWc4/HY9z7HNscsA2JAfux3aZydjMtK
	R75dBakLxqELktmNvzgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTHb-00000008d9w-4Bk3;
	Fri, 21 Nov 2025 15:42:48 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTHY-00000008d9Q-2zE6;
	Fri, 21 Nov 2025 15:42:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C84B3C1019F;
	Fri, 21 Nov 2025 15:42:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19DEE60719;
	Fri, 21 Nov 2025 15:42:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DFBD10372188;
	Fri, 21 Nov 2025 16:42:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763739760; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=yTl8T9kOPsRlZLi/qxLvoBg6wGqTVmaXfk9LwQI9gG0=;
	b=Ao77SuV1edzIejLmr9NePiyIi6sDLyET5aHhLyRUZYC3OmM3c5LiAnuKMdqHGrow6OWaCg
	54OyYzdJpRo81tUPqvjP0zv6xlkRPt85CCRGCRiOYHiBIP2y5cn2YoUj2DjiLR7PJIN3dY
	71M+9AbGuTSCcGXHjwMlGbxF4E2wt+yNyODv0jKqaOs3pBZq0qJSQxoOZ1i90/MsymcfIS
	azL8tDVsuXpqOIY9ZmIrQ8/HUB1WlepKdtSH6886eq3/qZQTc3fMjKhPxmNbXsNVoIIXTN
	Pq0EvQQzy8Nl4Qbs44rAVOTSCz4g+r0LyuACqKWf3f/typfuD+/7/Iu9hTbnjA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 0/3] MTD physmap: Adding reserved RAM support and fixing
 reserved_mem limitations
Date: Fri, 21 Nov 2025 16:42:34 +0100
Message-Id: <20251121-mtd-memregion-v2-0-c5535fdcebe4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGqIIGkC/3WMQQ7CIBBFr9LMWgxD01JdeQ/TRQtjO4kUA4RoG
 u4udu/y/fz3dogUmCJcmx0CZY7stwrq1IBZp20hwbYyKKk6RNTCJSscuUBLfYphaKVBa7U0BNV
 5BXrw++jdx8orx+TD58hn/K3/ShmFFHpuux7R6MvU32bv05O3s/EOxlLKF7EcAKusAAAA
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
X-CRM114-CacheID: sfid-20251121_074245_256104_D51EB879 
X-CRM114-Status: GOOD (  10.48  )
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
Changes in v2:

- Properly managed cases where register entries used by the memory
  region are out of order, particularly when one or more register
  entries are mixed with memory region entries in an other node.
- Used "memlog" as the node name instead of "sram," which was misleading.
- Link to v1: https://lore.kernel.org/r/20251117-mtd-memregion-v1-0-7b35611c79a6@bootlin.com

---
Gregory CLEMENT (3):
      of: reserved_mem: Support multiple 'reg' entries for memory-region
      dt-bindings: mtd: physmap: Allow using memory-region to access memory resources
      mtd: physmap: Add support for RAM reserved memory regions

 .../devicetree/bindings/mtd/mtd-physmap.yaml       |  59 ++++++---
 drivers/mtd/maps/physmap-core.c                    |  56 +++++++--
 drivers/of/of_reserved_mem.c                       | 139 +++++++++++++++++++--
 include/linux/of_reserved_mem.h                    |   4 +
 4 files changed, 218 insertions(+), 40 deletions(-)
---
base-commit: b55d426c390f2a4762b2a88b113cc44c37e08e46
change-id: 20251117-mtd-memregion-8830c1dd70ce

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


