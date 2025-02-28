Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD88C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 16:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7ahAhPaVbmvJ+GYrCpR7reVXxCTe1j1GHD20Jn19pE=; b=KrjagiU/3rZZF5R3UNE/q0aClv
	kKL65w87FvHYVYpNxW+itITZSOmom1QC7K/y/uhkrJhrOCWaB7mbncm34sAWnNXGMHm3j5o8UHDqa
	U/oc8ervuKGHHDVrriS8p1aasbWdx8p3rvxrYdTscbtX5fCIQXAvJdlsHQdZEoFktkI84ble/Uet4
	y9khnDnLuqnQRxcC1+jOQ27P9PS7uBNLZTg/mVjEaPV4j9xNTT0NM4oVsLjvES7LCXVtjduIr8LRe
	AUt5outREV6Hx1EuMBGjCo6GefsVEv7Ns07wzHCSjXMk6EfVxBzmASt0P19GelIYiUArObBAvCVZ1
	o6Gbrkmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3Kc-0000000BhUy-3UrY;
	Fri, 28 Feb 2025 16:35:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to3HV-0000000BgAq-3tu1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 16:32:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9048E61FAB;
	Fri, 28 Feb 2025 16:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB02AC4CEE2;
	Fri, 28 Feb 2025 16:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740760328;
	bh=IbehU3J+OYsV0YR19msdwmo9VEnGilX4b2l/J/pWEKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TmXHIIuMbkmQ1XYD/WDnmG2toGxcQgUsC0tlH/Q2rAlfQ31uDUBa3MkGANGzLAjH0
	 4aN2p0mvuSNgb7uOp9s8ht1JxgBUXMU7KQIu24dwXJib4qMpwR5xoqO1SBPyUWYaLO
	 BQShG+qTimycwaldYMwXsXqvqq/DywDcuP+Kb+U51ROfOyQVW9FJFgs9GOqlDkdiXN
	 GY6ErfSLPC9YQfA0sU/vEwteWlOUQOts6fgawvsGSspHaiYc8aZQEtyg7e8QU6QkNP
	 i7pLpQ4/tpqwQ1YQJjWLZGle9dpMCDyQLYwpQO/K/UX3K+s7J3Xk8dmvCiQON+ejoV
	 +7K/QqXXj3mvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB9EC282D0;
	Fri, 28 Feb 2025 16:32:08 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Fri, 28 Feb 2025 17:32:07 +0100
Subject: [PATCH v2 1/2] iommu: apple-dart: Increase MAX_DARTS_PER_DEVICE to
 3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-isp-dart-v2-1-0ead81a90e2d@gmail.com>
References: <20250228-isp-dart-v2-0-0ead81a90e2d@gmail.com>
In-Reply-To: <20250228-isp-dart-v2-0-0ead81a90e2d@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740760327; l=698;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=lnQqB1BR4mWIGODXOGI5G9lt91LbhceR/0LaO+MRnP8=;
 b=S06jxQ7AYreCqafQAUkk1RbVxcL4tN9dIdffKsqJUcXn9Y6vwsP8LtxfP1nNmIV4pa79FE9S0
 ndH2BkZx621DgfmBLn9vvS2e3dDYhQIoXOHwK0Q9zdQXq83cKazxu68
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
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
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
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



