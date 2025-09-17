Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D552CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zn0Is8eeOR4Gu6G7tdLKQq8N5ufCD33SLmEnkNniBDc=; b=sAf3wv8tpCcGhT7SAXwUAMKWXv
	i4pL3PUAmEtxmbG63NBZ8atV1lPGQCDDELn3ZMEclIsO4aoxnLQGwSrnP+BGs4ZwfOVQc+ULal8JV
	/YnwtdbYLV5Y1/X4ulc8lu9vdrvw6Nf6yJQNN+n6mGMpao0Qe0aYxdtKsUuDIJW77qTR7c9VV1vTy
	E2ECE8Ywnn1kLVim68B5ga7XOvlv9mJYFIDusVUeQVrRjjz6V8pI/hew+uotVgTEO1/7PdZIepua7
	LaYtq0QDfRWVgjeYzFHXpcvaEetIWLv+/pMcYKXaLq0so17vIQHrmZSul3+HktcIMggq3yIL3/Cxx
	XJA8Td5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxyx-0000000ELCD-1VjM;
	Wed, 17 Sep 2025 19:38:23 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxyu-0000000ELB2-2ClM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:38:21 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8287fa098e8so20514985a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 12:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758137899; x=1758742699; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zn0Is8eeOR4Gu6G7tdLKQq8N5ufCD33SLmEnkNniBDc=;
        b=ot6u8fbsaWGfjYZg0TiKks1r+SkhaFcuXnmrvoUu1Indp/hVMfgz9nMoy+E60Fydfp
         hFDYgC+5DnSyyJmL4ClvW9vs4F28Wc8cPz4aM9+cQGR6V8DROqDlBR2cplDXVAAhV7Sy
         bJYBJSmuv0/HQhgQCSssBRO6N6loAv1Hq4wJJyc4euk1q+PPb0rkM/NN6r+MP4PLv1wh
         Ppz8nxQg9rZrDdiZ1OMVczL/lZYzmeDAeYi8ldizMO5YEARWpfMkm/8a+ZJLNyfid1z0
         nCYvapNedARCWfRFeYSKReNu3bahA+d54SpJyBpGx5Mf3z6GWXsKy2DTUO0vLUjMW8Ua
         S7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758137899; x=1758742699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zn0Is8eeOR4Gu6G7tdLKQq8N5ufCD33SLmEnkNniBDc=;
        b=Hx54pavWkuGnzNzI/c57Q9Pjc4KMk/09cEXnvSlJ1E1wJ2WJbnfGH7xts1XQAVNtyc
         CSoW7Zhk9+64kveZBsjxAATA9bLIjvLak7BGCd2tZ3FvtBLoL/FeSTc0uvoYETUoz752
         XX44ziUUmmlYZoIX1TyFkCWd78RpipPltoqck1I8bR5vm27lAukdEoTfiEnqinyUXKqU
         8/rKIAiSrcucVh1YZsu9ALnCW70lvOrjcHZP8txJDbQxHZNo8H9L5SCnN/ye1DdsvKk5
         i+OPN/dvq3FqiFgCzxuH4AJhaXugDlQUoahTwZT2ZM+js5eQ+aslWjaun6uPkHrk/MDF
         abuA==
X-Forwarded-Encrypted: i=1; AJvYcCXSqeb3UEhEVQk03FTnc+EaqFjkQaI8yfTg+EowmgXvEnO+Rz0GK/eI5iGa8spA4GbbEYnK19oMvqgkgofKMxKO@lists.infradead.org
X-Gm-Message-State: AOJu0YxI3SlIKFASEG6FlbMlh1fV0zLizJWnXJXNr4P7mUeiHhC5Mbrd
	2DGV16VTHkgNVWamZYqF/h6VYGIjN2VUHQcPwTMtklhg/JeK5EXg1TuwNrlyQgzkJVk=
X-Gm-Gg: ASbGncvGeGedEdB7n6xXmAmVVmWPPwHZ8fZLXwkD17DjqOpLurhY15r/ZdmqS+ksLeP
	qVTPKGtMt28NnAbw3ihGOXgy3mn/7lNXztDt1C7SCbn4oCwHon9iGrm5iDBGnCvWNl++h3Vw5yC
	XehpQZ3MM2M28GuJHNdvYT6FMcIw8erNhjLHvBoDEoyjK+J76Bq0beBAUPwnEAp3Gz3fgsNm4+O
	M8/Kh3nUF5yPVmp7ypgUyKyJzLGfgOdLrKDUgUH7EhdaOsgor23gmiwe8cmhmxO7vE1DVkABZq1
	QGXMZRhqshjFdO9gbDQrdwQ6nd0jpiUG604Gc6pDCQ+8fvNvJJhdQNxrNuifHaDwgIAA49Mjt+Y
	yZ+cU+zAjFPhwm3eWASIY1el0dL+vBVBdtEABpSP9ju4xGW6l31hg3nlkwWDjwbZrr6Oa
X-Google-Smtp-Source: AGHT+IEijZbrq+i+0WS1CBxKV2AIyy3lPGfFcOI06YkWPNxuKICHcEdaLnL2uf7gK6Yw1m11T0+frw==
X-Received: by 2002:a05:620a:4406:b0:810:511f:3885 with SMTP id af79cd13be357-8310da0c6e3mr377680985a.33.1758137899133;
        Wed, 17 Sep 2025 12:38:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-836263ab0e4sm34559685a.11.2025.09.17.12.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 12:38:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uyxys-00000008n8R-0Qxu;
	Wed, 17 Sep 2025 16:38:18 -0300
Date: Wed, 17 Sep 2025 16:38:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v2 1/3] iommu/io-pgtable-arm: Move selftests to a
 separate file
Message-ID: <20250917193818.GK1326709@ziepe.ca>
References: <20250917191143.3847487-1-smostafa@google.com>
 <20250917191143.3847487-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917191143.3847487-2-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_123820_574799_7F1B4778 
X-CRM114-Status: GOOD (  14.75  )
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

On Wed, Sep 17, 2025 at 07:11:38PM +0000, Mostafa Saleh wrote:
> +static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	struct io_pgtable_cfg *cfg = &data->iop.cfg;

Can be:

       struct io_pgtable_cfg *cfg =
               &io_pgtable_ops_to_pgtable(pgtbl_ops)->cfg;

> +
> +	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
> +		cfg->pgsize_bitmap, cfg->ias);
> +	pr_err("data: %d levels, 0x%zx pgd_size, %u pg_shift, %u bits_per_level, pgd @ %p\n",
> +		ARM_LPAE_MAX_LEVELS - data->start_level, ARM_LPAE_PGD_SIZE(data),
> +		ilog2(ARM_LPAE_GRANULE(data)), data->bits_per_level, data->pgd);

The entire struct arm_lpae_io_pgtable is exposed to a public header
just for this one print.. Seems undesirable.

Drop the print? Honestly, I prefer this, given the maturity let's not
compromise modularity to print someting nobody will ever read..

Alternatively call a kunit-only exported function to do the print
directly from ops so. smmuv3 has an example how to do that

Either way a precursor patch to adjust it will allow this patch to
avoid publishing most stuff.

> +/*
> + * Calculate the right shift amount to get to the portion describing level l
> + * in a virtual address mapped by the pagetable in d.
> + */
> +#define ARM_LPAE_LVL_SHIFT(l,d)						\
> +	(((ARM_LPAE_MAX_LEVELS - (l)) * (d)->bits_per_level) +		\
> +	ilog2(sizeof(arm_lpae_iopte)))

Didn't see this being used?

> +#define ARM_LPAE_GRANULE(d)						\
> +	(sizeof(arm_lpae_iopte) << (d)->bits_per_level)

Only used by the above print

> +#define ARM_LPAE_PGD_SIZE(d)						\
> +	(sizeof(arm_lpae_iopte) << (d)->pgd_bits)

Only used by the above print

> +#define ARM_LPAE_PTES_PER_TABLE(d)					\
> +	(ARM_LPAE_GRANULE(d) >> ilog2(sizeof(arm_lpae_iopte)))

Didn't see this being used?

> +typedef u64 arm_lpae_iopte;

Only used by the defines and the above print.

Jason

