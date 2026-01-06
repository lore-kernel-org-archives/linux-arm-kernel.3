Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB3DCE9D45
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Id7mMU47XER2g8M01+ksD3/e3xj34gH+ioyx6b+UIXs=; b=sbSSuMrvQgHNzh7DGOl9YG4p/J
	JUILWZvC+uFZdS90CKIgBz8k6kgsjJtOy7nV3YZuyvcsegAUPYK1H+d18+bLG8oGuxVZfIfVfIaLP
	S/No9qSgW8gzs0WTn54ZKRpQV16zcoJRLXmUnJobYGmF4uXWJY4WenAFDVMTbtGh+cv/N/vETQoPU
	UR/JF8JNOGAEsBd8a8/A1D8K085q7gObPw/Frl/p6KVbAg7lYtyzmmqpTf0cIUvWHU/U21qflrnuE
	lKtnu7fQ/UZFMqsUGSQyrUkDSI7nBW5xdkK1tZn2Ej4D0YigPgZ5r4/zG4hRHmxkz+nAqsgCmWYub
	DliTbvbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8rF-0000000DOCR-0BHe;
	Tue, 06 Jan 2026 15:20:29 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8r8-0000000DOBd-04rY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:20:27 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-37b9d8122fdso8330181fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767712820; x=1768317620; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Id7mMU47XER2g8M01+ksD3/e3xj34gH+ioyx6b+UIXs=;
        b=UX8Ywl4v8xwIxBFS4pmHIDp5gu7GijDPRmVsmtK7H+Y9gFA4hNzQgu7S4tibd1wkmE
         IntcNqLO451X0yuxhVHy7h60dNHIASFiybrz6+oxmsR5p0cQgCmeztTOSMBS80bWWbQC
         uv8x6luCxGAQAfio1t4QQ8dN+nuoEfroezsU0ElE7SxBqdMaK2yR7eROCSqIri7+UHNk
         f4gpwB5lCg7Dbv0FoGYJTso9rrYTjtFb6ivv908OJ77v9DMDLbi+HMmPrLfAs1m/lyta
         udsJsh438dN5IJ78CCmhBazAG65lFk8osPZJmwO4xKykIeo0WZQHV59bM2q6W34U6lhC
         cbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767712820; x=1768317620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Id7mMU47XER2g8M01+ksD3/e3xj34gH+ioyx6b+UIXs=;
        b=CEzFv1hhuJvc1Ph9M+4zfhbOMRAQllucAL0qz4N0wUMo5tH+Bzeb4ysVWsUFwJN9o4
         5yCcIfROFdSVo69xqkU3EbFMjqfxWI36GjWktR/LJ1jZSH0wuV8eaixxialnX7GRCw45
         UMhUft1zYa3dZz3WYIKFRiY3gGXOl3+4F7els0IZfm+ckh6P6qf1O0uLPNr4x+m1Y/VA
         +d4SOyPX7FTljQliKfCDCzybuhILKUNvoqyxnWcrvcATM8txMtJ2vQgCvR0eVDfGQii/
         WHq3F5Ir2tV0Gm95oU/D7pObXf2M/a8pjOj6Z240vKkIDra4ITUdfaznI4lVf1AAWAzR
         QxgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV27N4I1nw6OmiZwdj/Hnr1DNmPqTvyWlTTtsDKjk6rXFKTbxoeuf5niE/crIG4ZxB9raSKw7FaKT+8Gdc64Guh@lists.infradead.org
X-Gm-Message-State: AOJu0YymzpJZu1FN8zTD10Uyze7HrUCXzHB/zJaQrpF1Th7mbWGBjgUu
	8RDlt8OVHaTuMh4aBh6sO3WWFyK0tmcII2Q2NeF2j20aEqu0YG2gJWEj2PgMQJzb9g==
X-Gm-Gg: AY/fxX5tss504V1m/IXUjeThLYJmE68c5Vqqaj9IZYh18BkLQ++etI/n8+UCWql7kvg
	IkhxdGfFDywGEKIXwsNepZ5FxP5n4jvsuv+78JdaAPRvkxRnbePNN+1sBCu4jHj1bivl6shvpIW
	KT2gLLnBcNj47Zmwtnqvt8AbR45HJI8YCJmx5t+OxD5vMfpP4UqeSAIMi61LoNZuGUt1Laj9Ld3
	r7xiNyGzvb/fxa1NaQjLTt4IGuxjCAnMg+7Neyk5Q4/cG3cCIQT4oLcCX2rpZbjNEBgfm+0+6bp
	+SmpP0OGhNZeF0CTdshJ9ZYUhvX9VxtigAFKwjBvl3hfzzv1DigQAVZkXmUyTb5L4ygdiJd5Dcu
	TOzRo3fPYZMKpWURiGCxaNZ4i12h2Kwtou4Q1nYSvDzD07YLFHtvseePqM9ZBDzsymA3qi6NkOR
	rqMTuVPeU3DK8ChQlfC7OyWIvdVIlmxWBtyyb5A/k8Eu79pd2U
X-Google-Smtp-Source: AGHT+IFU9XgMuYZOygAp7IsVsq2f35QvR9jvRwZzMLfy3bby4dhwHBGD9DFQoSjkX9BMOAy+TSw0oA==
X-Received: by 2002:a2e:a10d:0:b0:36b:b0eb:9d64 with SMTP id 38308e7fff4ca-382eaac9251mr8967191fa.30.1767712819609;
        Tue, 06 Jan 2026 07:20:19 -0800 (PST)
Received: from google.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382fc17b990sm716001fa.40.2026.01.06.07.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:20:19 -0800 (PST)
Date: Tue, 6 Jan 2026 15:20:15 +0000
From: Quentin Perret <qperret@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 17/30] KVM: arm64: Generalise
 kvm_pgtable_stage2_set_owner()
Message-ID: <rm55zbvakwmh5ny25bosf3jjiehfubcm2st5q4porsmnffuod5@edygmhqq2ckn>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-18-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105154939.11041-18-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_072022_100433_E322D74B 
X-CRM114-Status: GOOD (  14.84  )
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

On Monday 05 Jan 2026 at 15:49:25 (+0000), Will Deacon wrote:
>  /**
> - * kvm_pgtable_stage2_set_owner() - Unmap and annotate pages in the IPA space to
> - *				    track ownership.
> + * kvm_pgtable_stage2_annotate() - Unmap and annotate pages in the IPA space
> + *				   to track ownership (and more).
>   * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
>   * @addr:	Base intermediate physical address to annotate.
>   * @size:	Size of the annotated range.
>   * @mc:		Cache of pre-allocated and zeroed memory from which to allocate
>   *		page-table pages.
> - * @owner_id:	Unique identifier for the owner of the page.
> + * @annotation:	A 62-bit value that will be stored in the page tables.
> + *		@annotation[0] and @annotation[63] must be 0.
> + * 		@annotation[62:1] is stored in the page tables.
>   *
>   * By default, all page-tables are owned by identifier 0. This function can be
>   * used to mark portions of the IPA space as owned by other entities. When a
> @@ -673,8 +678,8 @@ int kvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
>   *
>   * Return: 0 on success, negative error code on failure.
>   */
> -int kvm_pgtable_stage2_set_owner(struct kvm_pgtable *pgt, u64 addr, u64 size,
> -				 void *mc, u8 owner_id);
> +int kvm_pgtable_stage2_annotate(struct kvm_pgtable *pgt, u64 addr, u64 size,
> +				void *mc, kvm_pte_t annotation);

While we're on this topic, perhaps we could go one step further and 'type'
the annotation itself? For instance have a 'type' and 'meta' parameter
directly at the kvm_pgatble_stage2_annotate() level instead of leaving
that up to the callers. This would allow to have one place to allocate
annotation 'types' (donated pages, locked PTE, MMIO guard, ...) and one
way to serialize/deserialize them. That 'type' would be stored in top 2
or 3 bits of the PTE for instance, and decoding of the 'meta' field would
be dependant on the type value. Thoughts?

Thanks,
Quentin

