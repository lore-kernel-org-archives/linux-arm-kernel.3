Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF57DC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niSdBLQKknGzg8N9jW+6lT5th349IdFmUhj+0zgN8x8=; b=P3aCZKV3ICTJ9jgNv8rYql92Jj
	iStQCFSgjlgmeNVN3/3U7MDvtcjAb9VqomakAZWCFczTJ9HKwT6uwtQcgM4JmItglom13ECSnUAT/
	A1pCOUPi46c5uTLHLEWXQ3nfZHH6pICnQVcw4yjFZdQy4c8l4893xcTiu/iM5qjSinZFDb22TKvwx
	gyT+2v9Y0aMIgtGAl6ThLvYTWGG6cgNl1btqOI//z3IZh2PRTHAVnRRm7JdKLHIX7bW9E6xEjLe9y
	+ksb/n3MyrX9Nxv+5MTK8Qt0Pzaz081f3egOKfkopWL2cFNjvDCWzdC3zYxBx+RZ9zdiJQD6QFqN7
	+nWxoadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3m-00000006GY7-1agE;
	Tue, 28 Jul 2026 21:09:58 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop3Z-00000006GPW-2UAl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:09:46 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cab041eced3so241989a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785272984; x=1785877784; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niSdBLQKknGzg8N9jW+6lT5th349IdFmUhj+0zgN8x8=;
        b=eViFVbCZHQiEn/VgQOrLhLf+pRazm6AYoYW3M67oUSuVjsZXvY4H+68FoIvmksIOZb
         aM+JSM5p65+i2MOEcl7MgWwLihCaxQtCczpiczZaiL9+R7Df/ofNjNEDTDmvLbJB1iq9
         x6UixNfiHjUI91GQkyG/+/bL4E1W++qvPC2pPJjvDoE3b2J8y9VdMkJ50HU+IiInjmeZ
         wdiKdAS5mpfCUZX5c9QCf2ylP0cUxScdrbHkQJPIcsUBPAxu4e6phWY2+yvRPuFSO5C7
         3Nq5JTne0DSxX+APyhqb9uETsOzQYCtaoWAj5RplP3cFmLF+ZePnhaI6dqpFe6LTLU5G
         MXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785272984; x=1785877784;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niSdBLQKknGzg8N9jW+6lT5th349IdFmUhj+0zgN8x8=;
        b=nZRTAy2woLHKUvYoFDXLN9UwxCbWx/KN5K7P6KIWT/26sxql8F3GQFwLlqOUFwbC+2
         uK7bgKsirNvydYZfGOArkmSeStw6CLDn4vQEYH8dE6BrmNyBBs0n0UhtWnG8rwrEl0sq
         /X0FyEISe2z4BTfP9YDyAc2U1S9CK+NQJFH6InNoFSdUdJs2y2m7XUcNRykcjmOpSsd1
         iMCdEGis+s69eegIohkIYxi4wxDvUrJRjikEYr1sMVTBmFpJ/ufCN0+ITtjUm0IDx1xz
         GFfA9YcAmF4NMZkD7nWckYbohcpkP/0icsir5M2UcfSq0FkkekQXikYwAIWWiRL52rne
         h25g==
X-Forwarded-Encrypted: i=1; AHgh+RpRtuM9AIWZsVzZFLcHiBtHabm8y9qts/QSEs/c1/5E/OJB2jZq8EWWStmBkdwOUzH9RSKKYRQo5GBpaPU69vY1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1ZSQgNSlfn7KeHjERZo9/KnbP+uqWa3y8AIFgbOFVs10J5uVn
	mIqSLvA80nNZcCDlIP4N1nJfYOa6vWP88xb5M+aiQw0BmLkloSFazNfhAOnsFkDh6t+YDczWHC9
	S/g==
X-Received: from pjbgx1.prod.google.com ([2002:a17:90b:1241:b0:38e:4a3c:2514])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2b8b:b0:389:8f6c:4d58
 with SMTP id 98e67ed59e1d1-38f6a45d39bmr4419333a91.34.1785272983619; Tue, 28
 Jul 2026 14:09:43 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:09:20 +0000
In-Reply-To: <20260728210928.1050849-1-praan@google.com>
Mime-Version: 1.0
References: <20260728210928.1050849-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728210928.1050849-5-praan@google.com>
Subject: [PATCH v9 04/12] iommu/tegra241-cmdqv: Restore PROD and CONS after resume
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	linux-arm-kernel@lists.infradead.org, Ashish Mhetre <amhetre@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_140945_647001_AEA62CCB 
X-CRM114-Status: GOOD (  10.51  )
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

From: Ashish Mhetre <amhetre@nvidia.com>

PROD and CONS indices for vcmdqs are getting set to 0 after resume.
Because of this the vcmdq is not consuming commands after resume.
Fix this by restoring PROD and CONS indices after resume from
saved pointers.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index f62e9bdabf8a..8ecd2052b6dd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -553,6 +553,13 @@ static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
 	/* Configure and enable VCMDQ */
 	writeq_relaxed(vcmdq->cmdq.q.q_base, REG_VCMDQ_PAGE1(vcmdq, BASE));
 
+	/*
+	 * HW Registers reset to 0 when power-cycled. Restore them from their
+	 * SW copies to prevent executing stale/ghost commands after resume.
+	 */
+	writel_relaxed(vcmdq->cmdq.q.llq.prod, REG_VCMDQ_PAGE0(vcmdq, PROD));
+	writel_relaxed(vcmdq->cmdq.q.llq.cons, REG_VCMDQ_PAGE0(vcmdq, CONS));
+
 	ret = vcmdq_write_config(vcmdq, VCMDQ_EN);
 	if (ret) {
 		dev_err(vcmdq->cmdqv->dev,
-- 
2.55.0.487.gaf234c4eb3-goog


