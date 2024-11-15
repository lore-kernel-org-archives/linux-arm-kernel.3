Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E27D68BCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 18:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BsyG1LXRA/7W+KV3OjFnPglA0evpVqXbyPXRpQQ0nGw=; b=vVK3/Z5dkpSjGPFHnOIbZOVGDQ
	NdExHsKBEgtkFX66CBHxehS2HESL/xo2yBvCF3zn1Ci5rZKmtyDrWFe/2jCuLaD40dcJjBTDJ6q2+
	9KA3JGAOhK/prdJpOMyUe/HYEWufA/QYqGF6JCCYsjhgXgok45naCXESyWXQJgTZ3IB4Oru6IJief
	HilqcQJntXNcZ6DDlOeczTgYgsEt1HvOBhGpt/ovO0lKRfNGJfi9Et2K2jbOQGK/oYG1TYntDMPoo
	xjqhQ2BSdzGGwUT5+Os0hgK79PEIQthjPn4s7/fFHAtVifKT1catOV8tmvPYHyJautiGIrqOwAkhu
	kQcV6WuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC15b-00000003hnO-1Uwq;
	Fri, 15 Nov 2024 18:30:39 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC01x-00000003XPu-0ZGI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 17:22:50 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e3826e5c0c0so1637756276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 09:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731691367; x=1732296167; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BsyG1LXRA/7W+KV3OjFnPglA0evpVqXbyPXRpQQ0nGw=;
        b=C6Fa3ffgSZsUcU0R8LN6a64gt1zfrc7+GqeEcXOml0io+YWuc1P+5aCQfO4KBY3P82
         QIvmpO7lXVoT6nhQSE71CqYk474bkhp/u48CI//mTtWJN/Gd5FZ0f8yM2malrON7MPOk
         +hDBCVkqvcDK0NxWAQzP3OYAhdPQW8nLhBEAy+f2pRXEQJw/bLz/prreKdw4Flt6fIgJ
         MwxvBxN7onGrJMg/OrWmdAHJ+gOTyhgj/V4OlN+wIWBqc2Qt2dFeurHrTOJNgs0yhrNT
         iPwKWt9egeCig175zVFL6BusikJQm0tTsw0wWTaxebCPcimLycCMC+mx/Fi6Eo14lM7r
         sQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731691367; x=1732296167;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BsyG1LXRA/7W+KV3OjFnPglA0evpVqXbyPXRpQQ0nGw=;
        b=aW9T4+xhv6h89Grq+aLgaeM9DGeDW9zBuig+GSlHr7yCemQFY1FP3WRz//I+xbbhdJ
         yEvIuLholaX2X0nmq+5019NxbPiTgCrMISVuRb/UGi5Y1tMDwloUkkHg35IbuwrEO/De
         GF/yK6gFl5GW0hdMslQ6hpKQoY9k92XJBG4cmlSUXOlrVAXmFn5h1jWEUU3eXvpeDrmM
         JuMlGlc7ULv90YrRKWCqF/nY1ZGyH0qNTUNAjFfiD/qdsEJl9DWHeQ/5Yw/viYKp/K+0
         qYsTM5qGiyGvam8Aii9sbbb+LP/dbVoljHnezb4bzNHMjfYvyqUZ/C1jxkjkYrpEXhS/
         oAJw==
X-Forwarded-Encrypted: i=1; AJvYcCVzz1Qaa/rL7UxHWqpFBENikRue9Uh1/moBKlouVDBPhv7LjImTaYaNIiWDWLYfy9AP370i2HKSmGrHR8wg6WSI@lists.infradead.org
X-Gm-Message-State: AOJu0YxDlHRmDMOgs+HJf6rQaIl6bxODc6kIJ4NXI7iI7CCkK6qEUUbb
	qTazEKjzyBVs1DHpvZYvySloGd45aHyfMoP8x9lBYgi4+vNYd8deyi1GDFxa4UkKnp8+lQk0Hvr
	ocPIzzSPMgg==
X-Google-Smtp-Source: AGHT+IGsNFjwDx3jzS5qgLurnITHUTNl+C7edx5Hcxb5uU5DHpf+5tuu5L5h4bcVjOQnEwH2ggCQphITmYa6kA==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a25:660d:0:b0:e2e:2cba:ac1f with SMTP id
 3f1490d57ef6-e3826395ad4mr76341276.6.1731691366807; Fri, 15 Nov 2024 09:22:46
 -0800 (PST)
Date: Fri, 15 Nov 2024 17:22:35 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241115172235.1493328-1-smostafa@google.com>
Subject: [PATCH] drivers/io-pgtable-arm: Fix stage concatenation with 16K
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	Mostafa Saleh <smostafa@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_092249_170833_E4380542 
X-CRM114-Status: GOOD (  14.10  )
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

According to the Arm spec DDI0487 K.a, in:
"Table D8-9 Implications of the effective minimum T0SZ value on the
initial stage 2 lookup level"

Some combinations of granule and input size with stage-2 would
require to use initial lookup levels that can only be achieved
with concatenated PGDs.

There was one missing case in the current implementation for 16K,
which is 40-bits.

Cc: Daniel Mentz <danielmentz@google.com>

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 0e67f1721a3d..9a57874a5cb8 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -1044,10 +1044,18 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 		return NULL;
 
 	/*
-	 * Concatenate PGDs at level 1 if possible in order to reduce
-	 * the depth of the stage-2 walk.
+	 * Some cases where concatenation is mandatory after de-ciphering RSRKBC
+	 * in the Arm DDI0487 (K.a):
+	 * - 40 bits with 4K: use 2 table at level 1 instead of level 0
+	 * - 40 bits with 16K: use 16 tables at level 2 instead of level 1
+	 * - 42 bits with 4K: use 8 tabels at level 1 instead of level 0
+	 * - 48 bits with 16K: use 2 tabels at level 1 instead of level 0
+	 * Looking at the possible valid input size, that concludes to always
+	 * use level 1 with concatentation if possible or at level 2 only
+	 * with 16K.
 	 */
-	if (data->start_level == 0) {
+	if ((data->start_level == 0) ||
+	    ((data->start_level == 1) && (ARM_LPAE_GRANULE(data) == SZ_16K))) {
 		unsigned long pgd_pages;
 
 		pgd_pages = ARM_LPAE_PGD_SIZE(data) / sizeof(arm_lpae_iopte);
-- 
2.47.0.338.g60cca15819-goog


