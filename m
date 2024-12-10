Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AFDE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ldrDCueE7EtAyArj20F66jLgkk2NNyODodRKr0ilU8=; b=SlZIR7pTRFfz2H1d80RoJy7+wC
	ZINeE+2Dx0KxP91fO+6SKKtdIHGo/OColBHgwJgrphX9A5ZUugMMeZPEc9BaN+zxTDkqsk7VTp6iX
	/7N50Pp04P3udEHxOlcuoDk/S3tVEP7130A+comCP6OPA4IRt7ThTomyfGfq7LkCRKL9TkfM24e9t
	QI1U8uMdkCVRonWrdURDUPDb8KoocapiA528uVJMCNPZWSx/8TkbcMPWjCGcGvbLOVPmOkjWYpK8O
	SOeAcRCGDYaDiJb8SOQ9NeK6zNM/WfZdRbaIcKIHIBquNQQ5kXDUiPARNdgva9FN1NFIMBfC03HzB
	MNRsLC2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3Vi-0000000CAlR-0cVa;
	Tue, 10 Dec 2024 16:54:58 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3Sf-0000000CA1B-0K91
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:51:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2156e078563so43774705ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 08:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733849508; x=1734454308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ldrDCueE7EtAyArj20F66jLgkk2NNyODodRKr0ilU8=;
        b=XF0wyAeF/K5xuZFE7O0f8/ZnxM3TFvEmahWmD9eHlKBRPAwHUWVxHLjvt1yYqNbTbz
         LxhqvK6Az7mspQJqmr6zji6ktjQse+xLd5S1ryjjUcEYJ68u5yBmTE5iIOGVEWy1xpbT
         cKkL08RfkSha0A5L1Iez22X1CEF8D5ZNEUYyTwmD2KqnfxqRKquDvsuMh/DbyP5RLV9w
         ZIBQvx6fL4ipknJjURSxQMwwRHXEVP8+a3soznIpj3NiUpA3B6hlhaMJbGZh0GajVj5b
         cBLJTTOMMm95wbsHdgHixecj0Klc5sEo4o/4nZ+SIU2wi8hrarO2bC6SfwVKCP///BF5
         MyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733849508; x=1734454308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ldrDCueE7EtAyArj20F66jLgkk2NNyODodRKr0ilU8=;
        b=vljcu1zx9t1+99zVP3Ql1iPdgs0vptCwyL5fMspJW7ljgAcd9XQdnwS9UFKlziGwvX
         /Vs0PUJAcNPgA3ddKpfgvjTxkLvbI8BFMKXpqlB4ISweiOLi9tqTP+KtT2BWUnMoCUhU
         JT1Ck1cxSrvcnWHuSHigR1p4LMdQW4gPnmlmMYgOV9Ic8yqyUJr4kTcJz1WBFSTWb3o7
         UUVoNi1rVviZjleB7wHvEY622u6fECsNqt4d6fyMm62A4OQH+Qq8ZaYGH8kIHpLQp9Om
         m9HotnVdcoKzLv3heNBZggG/3Zuwn5I4mYBtXV8+8nsjo9RnjNfO7c1bUrMecx+/LqLQ
         OE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoAy79Yyrq9eCegIlaiPnKAz9mt3I3My5ut/5DJRzuc5BfVAAgQ1JsxKJ08xVJYbKYfagiPMl3qYIzoufkpO8G@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2rfOK3EcsEsMW7lPhsrAvi+Pm+37mE/G+Mv0OxnhE2LR6gSuM
	mZyvVTNBPFMHIAKiIg3XEAS8JCwFRhPddR50/4RquXDp0LpEcHB4Vb2GWg==
X-Gm-Gg: ASbGncvMiJGr2hXw5Tige3srwSvkA3TKKCdpbSl0kS0LoL69JbSa5wJvtbE31yXtbN0
	WiBMQYkcL2XdmOHhyLScy6UUzdRch6uT5hBwojwUqvMRcTtEqMavMEha6BoG7JlejaB26iICWDv
	lSYnq/9Kcb+7S4UoqEwvPvz7o98ASoVOjw8OtIHBJDW5mf1UahAd5DFADD3V/TMBr5XzPjIskcx
	xUfd2JGZMl1jV53DREmwwuq40bHT3G5RrmY1ALTkRfH+DCKNfpPZMIFNitxwKMOrlBgZ7lTODN0
	6vWqCt2bzWkjCNvCcJnp82K8CFND
X-Google-Smtp-Source: AGHT+IHS0LaxpkQDW28nSbT1wx8gEP6+R1uzXYbRGTNeVekseOAHAqPvkFtV0qVh9HekmfV/jSF44A==
X-Received: by 2002:a17:902:d2c5:b0:216:725c:a122 with SMTP id d9443c01a7336-216725ca362mr51995685ad.19.1733849508260;
        Tue, 10 Dec 2024 08:51:48 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f093a3sm91911265ad.192.2024.12.10.08.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 08:51:47 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Mostafa Saleh <smostafa@google.com>,
	Will Deacon <will@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v11 2/4] iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
Date: Tue, 10 Dec 2024 08:51:20 -0800
Message-ID: <20241210165127.600817-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210165127.600817-1-robdclark@gmail.com>
References: <20241210165127.600817-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_085149_116229_EB53A95A 
X-CRM114-Status: GOOD (  13.48  )
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

From: Rob Clark <robdclark@chromium.org>

Re-use the generic pgtable walk path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 74 +++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 7e9c0f8ae138..88b128c77893 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -712,42 +712,6 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
 				data->start_level, ptep);
 }
 
-static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
-					 unsigned long iova)
-{
-	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
-	arm_lpae_iopte pte, *ptep = data->pgd;
-	int lvl = data->start_level;
-
-	do {
-		/* Valid IOPTE pointer? */
-		if (!ptep)
-			return 0;
-
-		/* Grab the IOPTE we're interested in */
-		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
-		pte = READ_ONCE(*ptep);
-
-		/* Valid entry? */
-		if (!pte)
-			return 0;
-
-		/* Leaf entry? */
-		if (iopte_leaf(pte, lvl, data->iop.fmt))
-			goto found_translation;
-
-		/* Take it to the next level */
-		ptep = iopte_deref(pte, data);
-	} while (++lvl < ARM_LPAE_MAX_LEVELS);
-
-	/* Ran out of page tables to walk */
-	return 0;
-
-found_translation:
-	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
-	return iopte_to_paddr(pte, data) | iova;
-}
-
 struct io_pgtable_walk_data {
 	struct io_pgtable		*iop;
 	void				*data;
@@ -763,6 +727,41 @@ static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
 				 arm_lpae_iopte *ptep,
 				 int lvl);
 
+struct iova_to_phys_data {
+	arm_lpae_iopte pte;
+	int lvl;
+};
+
+static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, int lvl,
+			      arm_lpae_iopte *ptep, size_t size)
+{
+	struct iova_to_phys_data *data = walk_data->data;
+	data->pte = *ptep;
+	data->lvl = lvl;
+	return 0;
+}
+
+static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
+					 unsigned long iova)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct iova_to_phys_data d;
+	struct io_pgtable_walk_data walk_data = {
+		.data = &d,
+		.visit = visit_iova_to_phys,
+		.addr = iova,
+		.end = iova + 1,
+	};
+	int ret;
+
+	ret = __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
+	if (ret)
+		return 0;
+
+	iova &= (ARM_LPAE_BLOCK_SIZE(d.lvl, data) - 1);
+	return iopte_to_paddr(d.pte, data) | iova;
+}
+
 static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 			    struct io_pgtable_walk_data *walk_data,
 			    arm_lpae_iopte *ptep, int lvl)
@@ -780,8 +779,9 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 		return 0;
 	}
 
-	if (WARN_ON(!iopte_table(pte, lvl)))
+	if (!iopte_table(pte, lvl)) {
 		return -EINVAL;
+	}
 
 	ptep = iopte_deref(pte, data);
 	return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
-- 
2.47.1


