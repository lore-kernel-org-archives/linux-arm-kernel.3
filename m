Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F460C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 20:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7ahAhPaVbmvJ+GYrCpR7reVXxCTe1j1GHD20Jn19pE=; b=EcCZO2ZvRKbzozVbVn1bFObEpN
	JcEBHMo2rRVqjAuxT/uP1RNhrK2CH+MkNJpK+demZAU06vssWJTIZLxkgUXhnC6X1sFatisaDdis5
	sFRyxFui85ugZyvhHfCI24tazp/7sGN1pXtCxwmnKnUYBNdT6k4zltyk26LNr2apI8BOQVxMpfu9n
	OxA9131Zd2/vnuHNZMYRM+qns1M0knxpa13OnTyF0xTe67KMG/BI8F0MHUlmxeprWtQPRs5iuP6lG
	iPU35xRI0/4li0UKCo6aH87yBcqEvb+ZXuLtLn9bT8U876TNUrWQu1u0dDJEMWZaNZ2G+nw8PpdOY
	uMwkCa3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqe0j-0000000FRru-00VR;
	Fri, 07 Mar 2025 20:09:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdz5-0000000FRZk-2e5k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 20:07:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ACAED5C61E5;
	Fri,  7 Mar 2025 20:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07BCAC4CEE7;
	Fri,  7 Mar 2025 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741378070;
	bh=IbehU3J+OYsV0YR19msdwmo9VEnGilX4b2l/J/pWEKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pqWoUP0N4DJSJV1hyYYl/yQbVSqn4JGxlUsQfKaW5tdj1ub2Eu+tGgoYfug+PrOrE
	 eSAzQAZnFZPbUNb4zeV8rZY4JeN5YWkvfvivyqJM0ZJ9PNJsFeRt8YX++9J6Qr4YE1
	 aHHf2Yk0+sJD+g/HlVK/O2AolXsik5hGrJTvqY0s1Ub54ZwrSSxYm2LUQ9/wQa9gYM
	 mnlix4S0nr8kXzg+jYbT59cdj+Jk5oXdKX5RD57LRYPFOZYiyAHb1MS1fnn8YRBQMB
	 kkPuBn3ah+MOQVHNIcgdLyVgVi89gMdVX8RM8keABs3BHLlC2kNALc3fX/82AHxwaG
	 Qn2YDzAx+onWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76D8C28B23;
	Fri,  7 Mar 2025 20:07:49 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Fri, 07 Mar 2025 21:07:45 +0100
Subject: [PATCH v3 1/2] iommu: apple-dart: Increase MAX_DARTS_PER_DEVICE to
 3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-isp-dart-v3-1-684fe4489591@gmail.com>
References: <20250307-isp-dart-v3-0-684fe4489591@gmail.com>
In-Reply-To: <20250307-isp-dart-v3-0-684fe4489591@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741378068; l=698;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=lnQqB1BR4mWIGODXOGI5G9lt91LbhceR/0LaO+MRnP8=;
 b=hb786voX2A/Zpfx3df/i6HBELMfG+WChRQ+gVPjf13bM7zHlP5dR/JwTCojn8llcpbX90nexF
 PK1W1aIzQaYB/s5G7gj1BOAxx9vqxvreXXoTQpErQTiKqYEeOtsrraY
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_120751_732425_536F006F 
X-CRM114-Status: UNSURE (   9.95  )
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



