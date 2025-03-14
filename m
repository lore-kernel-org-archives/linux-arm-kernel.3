Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC18C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 00:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vRtPg6oACw1hvTRmuv/RSNk9va89gmS+OSMNWv2jX3U=; b=3QmhImHLo6kUE4CR1hXMqL5B0W
	i9kRF/pliC+zjKyTBdoUm6Gxb93sXbPi6vKF63K7f4r1gJ7W4ltiBhhZKfpxDpGLd/LDh6goRZumX
	L2Chh3oIDdBu3kwoK9iutZUjXfKkHm+paOKgJVxTPExsv1XGkbTDk3YXiN3Bv62QgmVURWXXV0Yyp
	8EKFOqxSMgEMwGjE5S7rDBU52HFrWimLhj6vHcXC2J5PoSkSW6+xYqUmvANQjWby4NML94aS6zNDb
	C9xakubvOJ9MKq1r/cdpvnJAi5Ba65O66FlU+KYG2sWxeCcg8UXmEIJfKH0FeKuSPBVuRtSgyPQ8S
	vwRZ8QAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttF2X-0000000FYVD-0JzD;
	Sat, 15 Mar 2025 00:06:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttE1q-0000000FULO-3Kwt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 23:01:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43690d4605dso1598165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 16:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741993281; x=1742598081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vRtPg6oACw1hvTRmuv/RSNk9va89gmS+OSMNWv2jX3U=;
        b=BrvucrGjYCL0yGZRPpUwVBeu4xPE+dgNKX8byh6xAM4Jv2xjql6smVL4pPtwvd7FRH
         eADrxCA9a91E/E9O3DS1dCnBCc6AKXF9ryjCtbnRGnm+s4G4B7OjnPuwArZo9PrMvqoY
         Krfh4J/p/KtGsb4Htm1UK2PBfL6Xz3YLBoErUy9eRagp3lV1rn4H+NKaw+htNLK4cMrx
         f5MAurdL7aGAvvqPtkqzht+yyjlRtQ/tFGvoopTj6j85yEI5ubnX9H4yBJd3PlG/bL3z
         k0tJTDM4jNYmzBXgGEvPVvvlMMRr496tBLekQ4Z+7/YyCR8BmJwGrRY8PcNxIU6tfNZO
         9Mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741993281; x=1742598081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRtPg6oACw1hvTRmuv/RSNk9va89gmS+OSMNWv2jX3U=;
        b=Eu4TxjGf2lcHlfc190/YPAwVSHJRYPefgCzRzHyMmWQfGxYDrmeJ9JVv5vKpALISXO
         6UH0ef5jrAwQ+FZL3WhhSnbG/MT2iWYm1oTvDcFuWQk+meSKjVgfRvdDuzS0Rb0iOM4A
         3FMPJ86GrQn7Ur/pyT8n0CEQePXyRbg4J/0I3PnXYq2PpcPNG95iWIpyApEE8MOcHEDx
         gA6xgZlqcsusNYhmSJ9yr84HX9X/GNWqN1vaVhubWuDoN9pYne9CLhk1GzwxqegyaBus
         nb2WUf2ZILXTJ/FvAvby382Q1NWrTliZm00gRSipkyvfDeV+23Z3T9bp9DbEZRf135QR
         qJtA==
X-Forwarded-Encrypted: i=1; AJvYcCXkgIwCSG6uaDkBxt60S9M/glzBRPQ6TEty9b01ALGZ4Yhaz8nGSR1023DFOmdwfm9bWi/0s3WdgWCTG05OmEof@lists.infradead.org
X-Gm-Message-State: AOJu0YwWWh/NKSCSY9YomqzLCklXNvcGtJJx5KSDtCZor6Oc8RJjaLAM
	etNC+w7eaVwukQTCSLRn6ejW8hzwyH0qUjIXX2i7wDdy24Jw9Np8
X-Gm-Gg: ASbGncvEQGxLnBoXtnY57scXzZH4yem0ktwoa1YGWl9zKM3kiyvU6marVnPwhrRLyww
	yUs8f0i0MdMfgdlq3P9IkFuJfzAUD4NrRj5IQJWQeBD7AxgbkXRD7wnZr6/BTAh+AKCU1IFf6Qn
	JU3SYqLbIw6lMhyFFniiZxrYEWplRzRBzvUPIXbnEA+JJFnPTRtVwYhEBQej1deCA3FATieH9mq
	ZY+n+EY3TqeisAqovIYT/jchliLxrqBDGY66Uxum3ZWryQk4pAQno+ZX51jQp1K0KF2eADRHBcc
	dU/YC4rom0AN/IiHhYwiplnE7HgxubHOg3KSLHEs7wx3
X-Google-Smtp-Source: AGHT+IE0pax4j7XCryEzABptGEHj97UrueRJkeMrjB7rZqxeTR5+yJpR9Dcqmq7/m6LJKVapTevhJg==
X-Received: by 2002:a05:600c:198c:b0:43d:10c:2f60 with SMTP id 5b1f17b1804b1-43d1ed00016mr53261805e9.24.1741993280384;
        Fri, 14 Mar 2025 16:01:20 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:15a:24b1:8146:1068])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe2927fsm30441345e9.18.2025.03.14.16.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:01:19 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: marcan@marcan.st,
	fnkl.kernel@gmail.com,
	Sven Peter <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iommu: apple-dart: fix potential null pointer deref
Date: Fri, 14 Mar 2025 23:01:02 +0000
Message-Id: <20250314230102.11008-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_160122_836001_D660B8B7 
X-CRM114-Status: GOOD (  10.67  )
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

If kzalloc() fails, accessing cfg->supports_bypass causes a null pointer dereference. 

Fix by checking for NULL immediately after allocation and returning -ENOMEM.

Fixes: 3bc0102835f6 ("iommu: apple-dart: Allow mismatched bypass support")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/iommu/apple-dart.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 13ccb801f52a..e13501541fdd 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -797,12 +797,11 @@ static int apple_dart_of_xlate(struct device *dev,
 
 	if (!cfg) {
 		cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
-
+		if (!cfg)
+			return -ENOMEM;
 		/* Will be ANDed with DART capabilities */
 		cfg->supports_bypass = true;
 	}
-	if (!cfg)
-		return -ENOMEM;
 	dev_iommu_priv_set(dev, cfg);
 
 	cfg_dart = cfg->stream_maps[0].dart;
-- 
2.39.5


