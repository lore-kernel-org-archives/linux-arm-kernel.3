Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD0BC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 04:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7WYJG3fbndzJxqM+0OtygT3aFs/YNjP+azoDJMKJeo=; b=qNnuAP7eZbHTQxDaZwUL+K+aA7
	GfO/1HubOeQnDVr3a0WhKZxYaZoxbkfmzqULgl5kMCkhydoDu50GRQiExZ2/h3/cFoyxR32SudU1q
	Xoddvtp0sinsxc7k00cooZsdrhlU99SH1oBZetAtlsIGVHSvD8pjxeFOnyO8Zojvx0hc5Rusrtm6a
	e2SNUol/qHTTDvD9zBXeUwWV7g1njeiCJ4mMzF3uBOxv3/ZnBMuy6qbJyuPRj51x0JhzYc/YYHd9N
	bxdvqUsEBytf/B5ApDR/vOS/a/kJO3Lkj2Plr6h3yxgpx4CLzFVditv+F9LRmpBECQ7IrP8BMlZ8f
	0c9yVLFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC9yo-0000000AEYI-2GH4;
	Tue, 06 May 2025 04:32:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC52Y-0000000900j-2v9p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:16:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2F8F5C5529;
	Mon,  5 May 2025 23:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DB9C4CEF5;
	Mon,  5 May 2025 23:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486961;
	bh=ObOcuQ7uehgIs7wkMXNdM1MgdTP7bxAc1+4SriNNzwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VeJvgyXQkTiajGMPSbj3AcmnY4iYsgWxfd8kFW+5jzCOZ6p659d+rek9Aszy6bMx4
	 mdSkWGIQSuigMFYqjVt6S+xbPoWr74Xt4pKccjrwT/hWQMs7uon7W8jD4D6pNTniS0
	 cx4W6ERbtqcZKT8q2fo6TI4hqLxaJUY4frfdXoOIuNcaWMyZXiYNu3od8jmj8v3zEW
	 pS/VCKLt/NuT5q4TXfBtVtg79thbsiPE/Mr5Mg4CQUlvMUBAV0rHnIqz3x5QBdXE7a
	 pxoapd/ehA/cLsyhf3Gd7kV7O6hnijEB90RC38wQHmdlMUqlCSX3Aw5IZSrjpVD3+G
	 XtVxp7C5JG7MQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 081/153] firmware: arm_ffa: Set dma_mask for ffa devices
Date: Mon,  5 May 2025 19:12:08 -0400
Message-Id: <20250505231320.2695319-81-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_161602_777176_2A5A311C 
X-CRM114-Status: UNSURE (   8.16  )
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

From: Viresh Kumar <viresh.kumar@linaro.org>

[ Upstream commit cc0aac7ca17e0ea3ca84b552fc79f3e86fd07f53 ]

Set dma_mask for FFA devices, otherwise DMA allocation using the device pointer
lead to following warning:

WARNING: CPU: 1 PID: 1 at kernel/dma/mapping.c:597 dma_alloc_attrs+0xe0/0x124

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Message-Id: <e3dd8042ac680bd74b6580c25df855d092079c18.1737107520.git.viresh.kumar@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/firmware/arm_ffa/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index f79ba6f733ba4..27820a59ce25e 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -190,6 +190,7 @@ struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id)
 	dev = &ffa_dev->dev;
 	dev->bus = &ffa_bus_type;
 	dev->release = ffa_release_device;
+	dev->dma_mask = &dev->coherent_dma_mask;
 	dev_set_name(&ffa_dev->dev, "arm-ffa-%d", id);
 
 	ffa_dev->id = id;
-- 
2.39.5


