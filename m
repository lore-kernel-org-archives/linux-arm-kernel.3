Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CBEC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPT9rgj0rLpckhACaCzlKgGeeCb7MV3HiAZFcPnjPCo=; b=4RghyUgpio3JFy5c5xlvC+8eQQ
	1yHLt/nT1ree7QNkGd01X5H74GZAT6OO7CJAVqS0N6LyszHHea/VmmeRan228F6RcrSzgKrWliY+j
	uZajReDDiYF3j98fUdjXq5ijLHH4m6pGRZfxOXB7+yXPTkUmAiTwU0bTIFefEKcD3HZ4Df3k76De0
	ywqz/CuqZhVLisEvDwBGsGIqZwQlzzFBvdietFrOsx5EAGLWF+N0RiL9x4P921BLZqIefbFyXIU51
	WyXmEBMg2kAkgcTThyGZC2hxvUUseBVevMwyxqqsqBsNrvYgIS6oMqiEh01/cWEltrUUoG32Ok9lP
	ZDM0mN6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZgb-00000001Bnu-2Ds8;
	Mon, 10 Feb 2025 19:43:17 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thZdn-00000001API-1dSo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 19:40:25 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739216421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPT9rgj0rLpckhACaCzlKgGeeCb7MV3HiAZFcPnjPCo=;
	b=tllRQVac7aKjW2rAIx9zhjYgi3keo7pIMJVAyv9DPj9OLvDEc2qwDn/EGjJy7Cp68AeeVG
	meyL9UWkzu0Tl6WW1e8ETEYsIeY6gmt+aBvfwfjak5T1P2UPcZl/fkj+HoXdoo4eSK0aet
	kirFTxP+VoV8bo18i7Tg17IgrNpSenV4ODzdY2iNO3iwvvAFNjwCjqzVNuFri9pDQIqS+R
	UyZHSTm5//LLl7MAR7rtGyfvjDpRZ1tSlMrXPSN6gzU0VLrBU9VeqDDiDElEZja/Q8M1Lu
	/Q19d3lYFID7XJBT5atjBpYL6cJ07UUV6xcX16JP+Bvec4EMlIONvOCGvHj6qQ==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Mon, 10 Feb 2025 14:39:53 -0500
Subject: [PATCH 1/5] iommu/dart: Track if the DART is locked
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-locked-dart-v1-1-5d97fe247f35@rosenzweig.io>
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
In-Reply-To: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2311; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=DPdvKhQ3kbgTp3Fn2VyCCGlV/g2DDrlKViyHLbfPM1o=;
 b=kA0DAAgB/v5QWgr1WA0ByyZiAGeqVhmhMAEDsg2LrpEFYFtHpvoi59s/jPPOHIcYInI9JT71g
 IkCMwQAAQgAHRYhBENe4JuwrwDQHar2OP7+UFoK9VgNBQJnqlYZAAoJEP7+UFoK9VgNwJMQAKJm
 FqkCYR0CPS075sM8jAaNwH61RG7jWysqRhdrd9RWnY90Ni9DTozTZTBpYHGqjlvU39F0nC70WPU
 LfTQcqV8PiymZ30FpxyPpRynmJwrw6FjDhQNI3xJy9KLEjy0GqoNwwjYVFUdftXoPetPjGo2bv/
 L0mY2vXCS0aPvoPOA9Y2iJOEjpAiHlC+XYAkZaDzbsDTIiXHPj3NzLEi3y/d13fxWw4YGX1uHHd
 0mYyd0ymPgb8An9pwmL2Q75NgVJdPRYKdY/ZhlMbUfd6h/EYRleKkZNW13Lpk2M8Nnxdc852dPD
 0HJdmn0h1UpRjuIkY32hA6gzmFXj77jpcOsqRkEmVDS5nCvrGv3aL5J3vxUjqbeXoENGeSOtZQT
 vx5xVm0J+ueuwPZRqZxK0yUkP3sqU8Nvwa5znSSOzDVAwQ4aLqpYHXYrChHbn6MVWYd8yC7vR6j
 xZbVGQqU4FUiDHJEr+HMvyOb9TlvSFuWuFtXBnH49YNxFtDqNT8eZZA/4ADIDMUGWBlIbkp/1kl
 trouAk/ftwx9TuM5CxccxVng79ULPOfbfOPMonaWkjf9TAEU6pq0SFh/lI1Vd6iRLVyuJBh9BXQ
 1VrnET6L1lVXVO7CW0CSiYLWFIcGylH4C4fcDLgL5AZqTApbaK7pkdVmrUrzfdOAmgPYxAnDiJd
 KwjO5
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_114023_580358_D23F9EE0 
X-CRM114-Status: GOOD (  12.03  )
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

Some DARTs are locked at boot-time. That means they are already
configured and we cannot change their configuration, which requires
special handling. Locked DARTs are identified in the configuration
register. Check this bit when probing and save the result so we can
handle accordingly.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
 drivers/iommu/apple-dart.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 95ba3caeb40177901086076416874b9905a1f40a..460cf96bc8001e051916f356d5d175b35e36c608 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -197,6 +197,7 @@ struct apple_dart_hw {
  * @lock: lock for hardware operations involving this dart
  * @pgsize: pagesize supported by this DART
  * @supports_bypass: indicates if this DART supports bypass mode
+ * @locked: indicates if this DART is locked
  * @sid2group: maps stream ids to iommu_groups
  * @iommu: iommu core device
  */
@@ -217,6 +218,7 @@ struct apple_dart {
 	u32 pgsize;
 	u32 num_streams;
 	u32 supports_bypass : 1;
+	u32 locked : 1;
 
 	struct iommu_group *sid2group[DART_MAX_STREAMS];
 	struct iommu_device iommu;
@@ -1076,6 +1078,11 @@ static irqreturn_t apple_dart_t8110_irq(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static bool apple_dart_is_locked(struct apple_dart *dart)
+{
+	return !!(readl(dart->regs + dart->hw->lock) & dart->hw->lock_bit);
+}
+
 static int apple_dart_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -1143,6 +1150,7 @@ static int apple_dart_probe(struct platform_device *pdev)
 		goto err_clk_disable;
 	}
 
+	dart->locked = apple_dart_is_locked(dart);
 	ret = apple_dart_hw_reset(dart);
 	if (ret)
 		goto err_clk_disable;
@@ -1165,9 +1173,9 @@ static int apple_dart_probe(struct platform_device *pdev)
 
 	dev_info(
 		&pdev->dev,
-		"DART [pagesize %x, %d streams, bypass support: %d, bypass forced: %d] initialized\n",
+		"DART [pagesize %x, %d streams, bypass support: %d, bypass forced: %d, locked: %d] initialized\n",
 		dart->pgsize, dart->num_streams, dart->supports_bypass,
-		dart->pgsize > PAGE_SIZE);
+		dart->pgsize > PAGE_SIZE, dart->locked);
 	return 0;
 
 err_sysfs_remove:

-- 
2.48.1


