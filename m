Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35A7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YJ5yRhEXoyr3qFo0UosrAK3gyLR08Z9zFBUtrpqidkc=; b=aW+VSI+jdiH+DL
	+nP+8uGDzV2NGskBkr+avgV292019jUsJOneKNV+P55O3TJjpxYl6FbbyHxG9qby407ruc4AyY8TQ
	54hg58Y8cRfSDuzac2elFJXEiz7lXiUFE3lBfjUsVgGKgwa7N7aEPZLW8tduHAT2zFiSsB/tf9a/t
	GA0SPobEN4KCkd8flI1/25F4x97fU7U7rEXnQON3C+gfysaw7kkfvuJIiLb3kDKvsdIVhBPHTd9+5
	7SjIOECoKBRizgi8QVyq4esGdTrTajKyWxpc3gf8ULp6+klJnsq7hPTH8wh2Tll80aoequn3cbwkS
	ANFMNOP+Wm8B+29BgHeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZfD-00000001BJf-3NuY;
	Mon, 10 Feb 2025 19:41:51 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thZdm-00000001AO5-22R2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 19:40:24 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739216416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YJ5yRhEXoyr3qFo0UosrAK3gyLR08Z9zFBUtrpqidkc=;
	b=FObrw5BQoektcwRD88CI4sswFGdzZKPAOG391abd55vqBDZJxnnDee2bVCWPpYaLHUDBks
	UAllmQ2NXPaYPQwNMIumDDSrVLmdTqCZVqKwhn3rzuJUgCU6cyuIj7LIP7weEmBvft2DG7
	VWXoxkQX32srM4IWjHs0QEtTxOwIskiJpUhgsDTya2xriGAcmIJMsbXk8IPJjTZGI0h8Uz
	K2qbj91EoW+cxbnK2zRxWFJ8isAbwb1JIMiF6jFOBX2jo94xbT2sLy49Tmh3i2+g/zLpUk
	Zc9CA5IAYO+uGA+O343unSKe6xHW3HPJnQ0Vi1I42UaWchB0U61Njcj5Ib8H2g==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH 0/5] iommu: apple-dart: Support locked DARTs
Date: Mon, 10 Feb 2025 14:39:52 -0500
Message-Id: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAhWqmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0MD3Zz85OzUFN2UxKIS3RTz1ORUA9M0Q8tECyWgjoKi1LTMCrBp0bG
 1tQCmRutuXQAAAA==
X-Change-ID: 20250210-locked-dart-d7ece05f19a8
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=4m41YzXmjKupOvgxXvACISwj81PDpF3Wa8u8owr0LLQ=;
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnqlYRCsvA2TKU35TcwcTeHEjZDfJWZAbzoZMTu
 mDScW8XTe6JAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ6pWEQAKCRD+/lBaCvVY
 DZvkD/wNBKHL8Sj5ae3cTzcgtwP45qQujSUaDxn1qQgJsm5YqbVs7R3C4ieWiZE/eTMaGUvBG41
 zCGYUAPMHoknvwcZYAVH1Fz5i2VNgzjebqbKM6YP6ahwftq5IyApgx8kJ9xoY3L5mrqmcFmTe4R
 dhpKffn9nKce2cxh/pM5hnGom9PsLY0xytF41tMWMooEt4o+CCgW0HVtgCSLgy7Oj8zlJIfGJQj
 1IJyc6o2GgnfWAdk8SMurRfy4onuacWbrgmaw+9QRHZxQaVGpISjXR5QnmPROPvpq+Ig6xwBLti
 Aitm1g6tj1uLHNZfTvuGuj0GUFww4EwVYsjl9NI4y1MzABqxPWVn9qE/aI5SkYB16AXdpmBuVhv
 Dca0fBpPxEq7DY71fdbKkRXlzNj5YxrMxjDhK29FImvPZpBpH/I/4xGGHhqpSaxQSu3pH2xlUj+
 076kKmBWzOGCQkFY+HASbdZMUpI5e9mzPGL899jQ4pjjBVsNutF3GHeQtIztEKTuL4XivNjLLxW
 2Auqlc9wa/fmhHHbHLVsZtTyrkF1uvU0ZdxF32JBjWNK2NjuMjyRDVRR5fkR+cmhxs9MzwF4LnI
 PjZQt3YVlM4vznT39QoOx9iunn84/ib5QoA3GsR5YKyDPM/gluIu2wLVIbbGYnLL/qE4951esln
 UmyvEHb6RWXN3Zg==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_114022_989897_A4CF3BCD 
X-CRM114-Status: UNSURE (   7.22  )
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

Some DARTs on Apple SoCs are "locked" at boot time, meaning we cannot
write most of their configuration registers. Currently, we refuse to
probe locked DARTs and do not include any in the upstream device trees.
However, the DARTs used for the display controller are locked, so we
need to handle locked DARTs as a prerequisite for a KMS driver.

This series teaches the iommu/apple-dart driver about locked DARTs,
preparing for a future upstream display driver. It has been extensively
tested downstream with our work-in-progress display driver.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
Alyssa Rosenzweig (5):
      iommu/dart: Track if the DART is locked
      iommu/dart: Skip reset for locked DARTs
      iommu/dart: Set DMA domain for locked DARTs
      iommu/dart: Reject identity domain for locked DARTs
      iommu/dart: Assert !locked when configuring

 drivers/iommu/apple-dart.c | 47 +++++++++++++++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 15 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250210-locked-dart-d7ece05f19a8

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>


