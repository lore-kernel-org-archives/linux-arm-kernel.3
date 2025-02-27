Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9076EC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHS/39La90WwvnseVs5GXu6/gSN0G+xptssm68HDKOQ=; b=Rah1blRkU0cgLe0Nao1atymFxG
	pBmB09rVAKbQTBRbZX2vzudNNl3MIR+Y8TRysMIMwM9wb5PPWI/z417YMjwm6qf7kPMKbrmiPe5B/
	8BOMftU4CqHP9H5cTC/0DBLn1zXVDLWmyrnyc18Sr8YWAoQNUUHDOrFLKRDgCmkgFTYKiK9lRW+iQ
	ckgMMPDCq7pha/b8DeLIPB0QS/Bnh1MKsvxqz/MQb4LumlxJ1e7EDsUrYr30kbBkLA77O0Mzg4Ceo
	wwM84+RBfx8RkC/xx2TNkIIYf5T3LxgTT+Ax14TdM5dpcFYvtSLUJL6WSEm1in1XIrbqPjvDyD2Zi
	WFgcrMQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjc-00000008YcC-3PLk;
	Thu, 27 Feb 2025 19:39:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhBB-0000000890Z-1PiV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 16:56:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 763305C607D;
	Thu, 27 Feb 2025 16:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 039B5C4CEE7;
	Thu, 27 Feb 2025 16:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740675368;
	bh=4UiMkKkA2k7XmYBH6m4C6kTI8TjWMvHDne3q7Wmshd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r3WXj7Zf9qbAc4E44AOSlvzhMW8gE1wOPf+XLxyFDJfByYEYpiuwzAE3i65/G8kyO
	 60YB0MdyzN95iADRDOKAJBg5Bx4hjlRKVjuLv+vL47fRZZPv0EyYVA4S03iwvcmCjv
	 VpGWnW4zCpwHraa4KfdmZG+nScj3iOIDKf6qBBesR8FMshSSo8eHjoSu7yPCIXf3qC
	 bfUXHYo42MPHIo1IUqoq4xSVmX9GUXeB9ewt8dVqp3Lw25lTRHoJ8x0+Nhag1WDe7y
	 0z0pOQ2CeeL03jp38KB87WLdvAMNdBEkOjGOidaVDE+QTUJWrm8EsL+sTAYGtV1Wlq
	 bNR85VXu28Qyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E65C282C1;
	Thu, 27 Feb 2025 16:56:07 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Thu, 27 Feb 2025 17:56:03 +0100
Subject: [PATCH 1/2] iommu: apple-dart: Increase MAX_DARTS_PER_DEVICE to 3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-isp-dart-v1-1-161e91ef4f46@gmail.com>
References: <20250227-isp-dart-v1-0-161e91ef4f46@gmail.com>
In-Reply-To: <20250227-isp-dart-v1-0-161e91ef4f46@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740675366; l=643;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=VLb6ei5YDATwjI9GwTuWhThgZUr54hxXR+bLrvtteos=;
 b=nGennlX6EccZFKEYMqV//HecoBeGHkhvWIENZ1kzeI1LmLGnOIbWsPLane7YabErGkJ94lnzi
 EDuLvx5Cd4UCBm8e92qD8T/Q5beHjuc2U6wmjryWx2nGorcigYKmfbH
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_085609_441255_4BA3D854 
X-CRM114-Status: GOOD (  10.00  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

ISP needs this.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/iommu/apple-dart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 95ba3caeb40177901086076416874b9905a1f40a..edb2fb22333506d7c64ad1b6321df00ebfd07747 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -36,7 +36,7 @@
 
 #define DART_MAX_STREAMS 256
 #define DART_MAX_TTBR 4
-#define MAX_DARTS_PER_DEVICE 2
+#define MAX_DARTS_PER_DEVICE 3
 
 /* Common registers */
 

-- 
2.48.1



