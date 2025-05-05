Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7739FC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 01:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juWjgZTnzEq1qvsZ25SNfHOkJGOQgynIPW+cNzIjWuc=; b=sywiZWiQCwXu6Q6abueA88tbn3
	tIA1pPA9QXYSCDWWcu/WGkr0sbYH03UO8WDloQQyl2RG/P29v3PY4Ydm8sDo5lUgVKQbajQLF/61M
	OqC8XsIUsVaAaooYZDUKrjIUvnB7Fswlqcsg/vItu89DtFtD13vIN8QCzORPjuq2Aj+6D5Ui5WAP1
	jDaAHL2EcRMfNCPNGUj7nLdrQAIEfmw9at5Rq1W4HXLoRTrughyw2G42e1Qt9ibAq+GgkF0uzRm7+
	xEsgKGe6Bi5H8Bp/O9H4aqKFBffaqWuwBuT1wyx1yOYEWUTwKYL7QsD0d6ilWQXZ6NgazILgd9vim
	bmoq+v5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7RD-00000009b9O-1ilC;
	Tue, 06 May 2025 01:49:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4aw-00000008rZK-0qWu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:47:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7DBB629C1;
	Mon,  5 May 2025 22:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2096C4CEED;
	Mon,  5 May 2025 22:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485249;
	bh=9elIbN0ee7YCS6XH2gjwAqOeBDXjnu76EVBthsCsdTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s3qW7sRl877zQmGhgbQRaFT0Wj5zXKxcSLpjpNuazfM8SEKYtDTjahjsBRNlZD3S/
	 HanT3nSVik1BD0K92+KJsgDstO6HS4DGXb1SBzWGpCWoHs0fkXNuc6l+Rl/PQ+jVdN
	 IQa4FSuv1WeULGzvEivNFgFWaOlKHA0aJhZqN23ziV+2sQ++ROSjqhvubtMTUagazm
	 RgHq7uwI/FvmROz/ev6nZMvVTYyqsGacjn14ExD3/dXGJKUmfP5N25mKMZkpWMv7PL
	 IimEQZR4IahBgAc2fplOHgqnVMW8OaDnbMtLf4ct8wycIfIc7mhIgsqDbmVU/5h+Nj
	 plUJ3damoa0mg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 235/486] firmware: arm_ffa: Set dma_mask for ffa devices
Date: Mon,  5 May 2025 18:35:11 -0400
Message-Id: <20250505223922.2682012-235-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
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
index dfda5ffc14db7..dea3eb741d95d 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -212,6 +212,7 @@ ffa_device_register(const struct ffa_partition_info *part_info,
 	dev = &ffa_dev->dev;
 	dev->bus = &ffa_bus_type;
 	dev->release = ffa_release_device;
+	dev->dma_mask = &dev->coherent_dma_mask;
 	dev_set_name(&ffa_dev->dev, "arm-ffa-%d", id);
 
 	ffa_dev->id = id;
-- 
2.39.5


