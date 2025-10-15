Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C92CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7gNIafNOAAdT8vVW1v+tnHUrlaQMtRV3mgcHVHcyVA=; b=mYnBVDC73F3QdKm3Yqnlsyh6a6
	wjhn0H/8tV071rPpJPamBoDG5coQzlRmdU73jjdk+fMSISO0z2aBEKphwReHWAKspnGE/YOU++P3i
	d3XehJeHefd31OG7DX1uc8s7T4mWhSCZv9EkIbPq5d0VQDDFt8wA7dJCo7LLZcz95m9a78YnIlkhk
	5Nq1ZWNsDEJ8KTcabqjTTElEKdjh3dEexRNjXZcWhv6ftmiS8P4vEYYYWc5S+mi1DvpPjILwC/6IE
	HhgL6zucIjG7osqqsShtdNgntigl1fuPAegH3lIjNXWG4x3fe2SePHP2ZES8W6hwx2iiaplw3XmU3
	mYJc0Jtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8y0u-00000001B1b-1OEZ;
	Wed, 15 Oct 2025 09:41:44 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8y0s-00000001B13-2MPG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 09:41:43 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47105bbb8d9so18685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 02:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760521300; x=1761126100; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B7gNIafNOAAdT8vVW1v+tnHUrlaQMtRV3mgcHVHcyVA=;
        b=Ryz6cpg2LB7LZFtLLrafcIn8+t/NIS70u5TLXsFj9/eOarylqhHkZUrkQ1Co/T+x09
         8qjfIenaxXZOpy0LU8yYv8VZOB5sB/xfXzi2tIJoVWQr0270or7t0Ua0wZCADtijcQOc
         wZRqF5bt5wa7ZxzHZQEGwsAIHFERwMFIrbfPPS13NMBhwXwSjlPQgNbHIHCcG/iA5djA
         eQ8adgiQYU1Cg/ra7zBneBcDUQ4kByrHc1xrLBFzCM1ACa5LKbAhLLgj0v6Im9Bc++wn
         ekGn4GOce1L9Kjq8zlcIJul0XUo0lS6kEcwLBvVGiMteWme/CB81yIRSr4roSTOuLLs1
         DW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760521300; x=1761126100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7gNIafNOAAdT8vVW1v+tnHUrlaQMtRV3mgcHVHcyVA=;
        b=AcPNK8yfuR2tmUJNaDgJuv9pM9NkJbGEk/LnBlUjnd8CFoweOUV+Dab7LsYmYsmnO3
         u2X1SO9DMJpgNLewZY81bDrTc/Rlw/kYcBl8dgIlEueS//1rn3Jc90LkwzuvvjV99E51
         FJTaajt+gUXBqhL46lNap/C+6gFmN9W5vBf7ebz/mhtuyuMPLA64tZygWs+WqQUQkJTT
         zScMLtlctbMtQDDC8OhOwSCU1XFDdUz9A6h3hcbht9ZeclJjFn+dn3hNt2gRLKRJQaYX
         LGiQBzMukevGryeVOkgoK9lN+gzxkAdrjLIexZCsBxH4hJCsOUS+mm+ezC77mbgTMGy7
         c4bA==
X-Forwarded-Encrypted: i=1; AJvYcCXsrAw5EY3oDQTXhSws6gibKpJA6owoSjJ9OPBWB1VhXb9IEpRIqV0tEf1/tCFnaeePFz6nXEJjAGoUr2EpAsSe@lists.infradead.org
X-Gm-Message-State: AOJu0YwVKKiQSeQ9afrmWFOuxUDHr3wBVXdslK4K9zAvxC3sLfslQ2Vd
	PhffwWhWuOL4buuFJOenpsMAEux0Xqlxu7cjLs2Gt1bzabZd+NePDOxRY6lL9ez15nX4IH4CMLe
	KStlNkg==
X-Gm-Gg: ASbGncsmB6EOH9soyY/dMUEe1J8IUXsrQEHBj0INLtXTkwxZeDgKih0Ama5VkhJv6bt
	DLahixIHjRZqJlcAyCvvsC2E0+MfbNeOwnT1V6wREehTBLAYxj+nCN9GBz35TmkI/eakK0A1LyG
	PTlxd14GfnyThG7Ijd6UpI3MCeGat2x2pyfzNulsMGTfn/7KAekDXt05R+B4KXS8cR0Lt1sc4+M
	RjQ3+n6MALvqPzNwXZ8HJk4oyh48Y7ms5K73c/S2Jcgh5gWLBVECE5P89HR0iLthinft7Gc4VxV
	10XuYHzOcBMVgrkhocPaJvSFts0fgQRcr1DEtQvRSwx/ds8dx5gkdLOgj12vECTDfSG7YyxBizS
	llVYX4qoFWSwQuj1C/ncfEHBcrKFCkOmTQNFDkGdkCCNRAYYhSEGMSuBTywCPacSJPmVkLHh/lF
	JKqUDNjxlDUQ==
X-Google-Smtp-Source: AGHT+IHR5pyr1xnwIimpgjpOhjIZXkvm+AJq3ntKDNIiM5QNlOCKNqqBRMSb2N3JBImOJuWcOi7CEA==
X-Received: by 2002:a05:600c:a316:b0:45a:2861:3625 with SMTP id 5b1f17b1804b1-470fd76ca76mr1181095e9.4.1760521300016;
        Wed, 15 Oct 2025 02:41:40 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5d0006sm28388114f8f.34.2025.10.15.02.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:41:39 -0700 (PDT)
Date: Wed, 15 Oct 2025 09:41:36 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, will@kernel.org, joro@8bytes.org,
	jgg@ziepe.ca, praan@google.com, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v5 1/4] iommu/io-pgtable-arm: Simplify error prints for
 selftests
Message-ID: <aO9sUNYmOg9W2Vru@google.com>
References: <20250929155001.3287719-1-smostafa@google.com>
 <20250929155001.3287719-2-smostafa@google.com>
 <526186fa-d17a-4b79-b51d-83492b19c941@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <526186fa-d17a-4b79-b51d-83492b19c941@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_024142_616463_C220F846 
X-CRM114-Status: GOOD (  26.36  )
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

On Tue, Oct 14, 2025 at 12:09:56PM +0100, Robin Murphy wrote:
> On 2025-09-29 4:49 pm, Mostafa Saleh wrote:
> > At the moment, if the self test fails it prints a lot of information
> > about the page table (size, levels...) this requires access to many
> > internals, which has to be exposed in the next patch moving the
> > tests out.
> > 
> > Instead, we can simplify the print, using ias, oas, pgsize_bitmap
> > and fmt is enough to identify the failed case, and the rest can
> > be deduced from the code.
> 
> That is the same cfg information already logged at the start of the test, so
> if it's not useful to dump the actual internal details of the ops then just
> remove the whole function and make life even simpler. (Otherwise export it
> or turn it into a callback.)

I see, I think it's better to just remove the whole function.

Thanks,
Mostafa

> 
> Thanks,
> Robin.
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Reviewed-by: Pranjal Shrivastava <praan@google.com>
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >   drivers/iommu/io-pgtable-arm.c | 10 +++-------
> >   1 file changed, 3 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> > index 7e8e2216c294..00218af5d5f7 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -1299,14 +1299,10 @@ static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
> >   static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
> >   {
> > -	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> > -	struct io_pgtable_cfg *cfg = &data->iop.cfg;
> > +	struct io_pgtable_cfg *cfg = &io_pgtable_ops_to_pgtable(ops)->cfg;
> > -	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
> > -		cfg->pgsize_bitmap, cfg->ias);
> > -	pr_err("data: %d levels, 0x%zx pgd_size, %u pg_shift, %u bits_per_level, pgd @ %p\n",
> > -		ARM_LPAE_MAX_LEVELS - data->start_level, ARM_LPAE_PGD_SIZE(data),
> > -		ilog2(ARM_LPAE_GRANULE(data)), data->bits_per_level, data->pgd);
> > +	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit oas %u-bit\n",
> > +		cfg->pgsize_bitmap, cfg->ias, cfg->oas);
> >   }
> >   #define __FAIL(ops, i)	({						\
> 

