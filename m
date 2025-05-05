Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B0BC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 23:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuQKKAaSu00srW6YEW9C7JIwKB3Z+divJKt9D9/5G2I=; b=gVw6oSW24Xtgc5BcjzO2TANdh6
	payoR/iv1p26IR5GxD6BDzMnigqeo8gjFMAMF4quMiB9o/n3RNOatM/pv0DXqlDNGTRPzvqsUOqKI
	L1RCt5eq+1ZjPDpiGMrdw2lzkdWWHbb/xnO62VyzJFdurWWdYmZgwub0wFc0yBWxcVjXAkn2lFRcH
	ffPOjNxBptG6TiyOmHbnrqOLI/HAUGUvxalZwT3yf8lQD25Teqh2Oxsbo0NaFNXNoYnJ/877uBhAM
	c2s6CcXVJw0WCrX9y2VUH4sv/PHq5sDjqaJ654zxem9soQQ/thBE/GzxHsoaykDFtG5UEGkwLC/yr
	jKRMKjdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5Ua-000000097jS-0tPS;
	Mon, 05 May 2025 23:45:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4GF-00000008kwe-3TYQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:26:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8831EA4CD1C;
	Mon,  5 May 2025 22:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D69C4CEEE;
	Mon,  5 May 2025 22:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483966;
	bh=cPpXnFjPAzYupv5JW6H48Za2AGfwdIzDn04kP4CkeI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oUoEh3om4SGO7Ja+qYsQTQZxgn9/QaiWHmr9XjNi0pIebXs6eg7AoZCLGbfzDm5Wn
	 OLvyKUNGsxC7/6nQgKjBocIKdiQJuRTMBj//bWIemUY6qNXNM9X2An9KyVe1b2lLqT
	 R+vKTWHguUoW5Zx4uCFeXinCK+9+3kqpUU07ZtD9iJGxuxqvQG31rZjNF6flxsOngO
	 V1Hygj8VlYDgO9CHwRVBeKsAeNjqF6uBzQen36dtwmjgMHlNMyzqu93Y5gvd1/m57g
	 vjMUqBYsnC1uYmlHh0nzUzVlsuOz71NgHbsodutX5LUsUlCxEC34OzleeO0GgR0IsV
	 GgIylt5FenS8Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 296/642] firmware: arm_ffa: Set dma_mask for ffa devices
Date: Mon,  5 May 2025 18:08:32 -0400
Message-Id: <20250505221419.2672473-296-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_152607_933933_D0E6C21D 
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
index fa09a82b44921..eacde92802f58 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -213,6 +213,7 @@ ffa_device_register(const struct ffa_partition_info *part_info,
 	dev = &ffa_dev->dev;
 	dev->bus = &ffa_bus_type;
 	dev->release = ffa_release_device;
+	dev->dma_mask = &dev->coherent_dma_mask;
 	dev_set_name(&ffa_dev->dev, "arm-ffa-%d", id);
 
 	ffa_dev->id = id;
-- 
2.39.5


