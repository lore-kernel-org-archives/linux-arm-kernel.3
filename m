Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CDACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 22:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6TDU0bNZJfmPAor7skQm3oH9ixmiq5qVekBnZmHN1E=; b=X3B7o+d/JctFaN4x5oZG7/Lrul
	pFOTiNDj4rSTkofi9xS82NVm9mZw6MEf9hH/Z4FKcFMDAWUQIHcjJgBy/nYVmZJ9BG7lsKv1NvRPI
	VBHCEDGTm0RnBF8oRCKfWbH7aHdeRC0uZC0l2AV0bq7B7eXSbwGGZr3Urxci7SxZ6tqYwfwFtdwwS
	/SA3/FP7aDzXNWN/GwDfPVAS0R5cqduFWZqiVnBbAAucJqPFrldpRO5HlgzlaCePhoqYHyufaT+SV
	hDX0w2dAR1Y4rhLr4T9Oh7uxPZRhuUtFYSM9X3L0dC8wKATkp1IDvqgWexfYmH0jUqf19cX6cYQiI
	y57UW8wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMWG-00000004mRM-1YKM;
	Wed, 27 May 2026 22:14:32 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMW7-00000004mMg-35zA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 22:14:24 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-36865d109dcso11139470a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 15:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779920062; x=1780524862; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p6TDU0bNZJfmPAor7skQm3oH9ixmiq5qVekBnZmHN1E=;
        b=s0M+SMdT3tfW3iiK35Kts6Zf2edDv7AQg9NKTrloyJJUb5UKjbdkslZml4A6dPH0lA
         34+3uBm4UY5EDkpNOKYSMv1dUjYu24BB+keQWyzyEiQEiyLJbnQodg6BKr5KceT4KktZ
         YVfSaZsiQqYf7dZggEFm0ExN0dWbXl/LNddFJBkhKYrz5p1hTTiGSI/ch4iHac9EGGbs
         LLJFWh+9Scn9QG92KnMk8PFDEOTayr6y8s+QHK1bQ3n01oqLezg94Lpbstgd4Z/4H6SE
         RRK2rv9M3OXoqCJcn0GbVxb2c8dDo01HacpBGkSrqvNeAJM52QvOOQt9ZzPU1m9LbPsD
         Ylsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779920062; x=1780524862;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6TDU0bNZJfmPAor7skQm3oH9ixmiq5qVekBnZmHN1E=;
        b=MjK7ZFwVALuI8RAi0zuEdpWdcQJMaquFC6MAb8JvtxjqEr8x4hU31uOOkW6mT4aGRZ
         RzW3oZTHFoz2iW902ED4NfezmIpPp0Thkp62JCao4ecSFtnOj6pZ//lUys5IGyAwKF7Q
         /YejoRw0mp7MNS6ecpMEONUvXYVwYcqlxVdKpD6LgzJgzUj+znnalg9Be/sQq4hAkFms
         6lsR1pH0CzdkLygG2DAYPipC/6JEkGtcigk44z0aKSImN0NLIw8VUZ4iZm01SAdxMRRV
         LaIQJXq6up/KKLAdDPz7UfmC141k64VS3JazPJzgkZ7duwZgEaF0wRhWKMPpBDVocAbo
         Rv/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/74OiXZqEN8ax+Krn4NoKOaPfdbcLpxfCP3bOBS7DkuEIBp3hsz2Jvggs5ASJ6+XYL4UavqbVhsv2fKZU9HxN3@lists.infradead.org
X-Gm-Message-State: AOJu0YwQf6ZCc922sue2V7VWBVW+NpEoS3h+2zB3spoOBEaepnlLCTLe
	/X7h/5NQVrioa+80EPNNU+2a5mMZAsuP6BAIg55kg5d21uxUdCKjKRj7fYZzUgmXgVzMXIq4sRk
	p/Q==
X-Received: from pjx15.prod.google.com ([2002:a17:90b:568f:b0:366:5767:4cda])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:58a8:b0:36a:cd8c:ad3d
 with SMTP id 98e67ed59e1d1-36acd8cb47amr9969892a91.22.1779920061831; Wed, 27
 May 2026 15:14:21 -0700 (PDT)
Date: Wed, 27 May 2026 22:14:00 +0000
In-Reply-To: <20260527221407.1756491-1-praan@google.com>
Mime-Version: 1.0
References: <20260527221407.1756491-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260527221407.1756491-5-praan@google.com>
Subject: [PATCH v7 04/11] iommu/tegra241-cmdqv: Restore PROD and CONS after resume
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_151423_776722_BBBBACAD 
X-CRM114-Status: UNSURE (   9.77  )
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

From: Ashish Mhetre <amhetre@nvidia.com>

PROD and CONS indices for vcmdqs are getting set to 0 after resume.
Because of this the vcmdq is not consuming commands after resume.
Fix this by restoring PROD and CONS indices after resume from
saved pointers.

Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index cb1e75e4ee91..866cae7b73e5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -511,6 +511,8 @@ static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
 
 	/* Configure and enable VCMDQ */
 	writeq_relaxed(vcmdq->cmdq.q.q_base, REG_VCMDQ_PAGE1(vcmdq, BASE));
+	writel_relaxed(vcmdq->cmdq.q.llq.prod, REG_VCMDQ_PAGE0(vcmdq, PROD));
+	writel_relaxed(vcmdq->cmdq.q.llq.cons, REG_VCMDQ_PAGE0(vcmdq, CONS));
 
 	ret = vcmdq_write_config(vcmdq, VCMDQ_EN);
 	if (ret) {
-- 
2.54.0.794.g4f17f83d09-goog


