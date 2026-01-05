Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1630C2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 00:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+jSiPWTak82xdkGqmhBxUT/Rw7weH7GEOHsr3Ick4Q=; b=N1wkyZXc2iAJFBSlhVBGv9bOpU
	yMCgnMbgIA2OocZvODQ6lD4hzRHDlvLGJ/5OYVCwfGL47JwFcwf7Jzx9En48tIADbWcvDNVZtYF+N
	M5zfj+Ce3Q2qrJV1Xl0Qf6kzLues5b4v1MTWEZJGuHyBjyjCP/UfA3UPzlRs0SqInnPxqRGF8UR+w
	k2jJgdIXvy53VZiFZxRx2a+ZAHxqU5KhYQKO0CJ6QA2tA/OAEwA1hXXvqxDCgqyLAJi4N7VV5s/My
	r1nFdIX0McLcXTkHTT5ClPsCxJCC+wtAhzAUncTCbgVdqbVW3IRcQy249lOpSOREYDOonTFrLmvqe
	KBBBqxpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcY3Q-0000000AZHl-401G;
	Mon, 05 Jan 2026 00:02:36 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcY3O-0000000AZHN-2pS3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 00:02:36 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8b2d7c38352so139183785a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Jan 2026 16:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1767571353; x=1768176153; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8+jSiPWTak82xdkGqmhBxUT/Rw7weH7GEOHsr3Ick4Q=;
        b=JbnXe+MJfqNG9HdbAxGzGuBgaKir80IcjKMEGDmZpwiu8F9H0zo++qARTqE2zZk8NR
         90sjjtoU3Hb53kkvAf/ZgmqFkLek5VhyaSy+c7SnJR5N19iqHPBTOu39WajwLRdAtI7c
         sr6hcf9XUjCj2XvdRhrWyV8MC7n5VloWUN2v9kDu6xzBtz/ywD0zh3IE1o9qXIEC/gTo
         E/Nx9tsO2L/qpyC7BLIwMDSJ2u3k89PpXG+lJyFa+pkevXzw1iEmUL+MPgpbV200fUEu
         yA5Ck3EEkWN6NuRPkjuqFgftwRuAEFT9l+56p0F9upXTOqnPugtYZMAAEkYPNpLQSTK1
         uRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767571353; x=1768176153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+jSiPWTak82xdkGqmhBxUT/Rw7weH7GEOHsr3Ick4Q=;
        b=c7sWPDyTMAcrlC1CR+0Bl2HggcZQ/UPxTPbr46dTaQZA1ybYeaGlmbxdInQGKGbT8E
         INCKlAA4b+NCT56oltPbEbp6Bq6qzWcRassnP2IlHw/fTn4gG7qLBa8McrajBqbLa0bx
         b7eEanj4o6XRqh5UxNpPcM8yReI3VZvS/aqif6imjpJWz6R7exo5NHGCboKv6V08yCmb
         T1UworpfcnIp6sY55V50FUTTZTt11T2kk9LhAqNXLALpNRgx0f6s+A0Gb3ZkfzPGI0dX
         hXN1DjTgdi74M5ng0hBesvDDVlCj2Ooi5pklYyZ956EDOFs8d2yvculXpi5obMkJsB92
         gjWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAdWg7tb5tOlMO1TA9QXUuLC32Qcz62rgF14GuXiu7yGrWLhULbcJC/pvXIl5Hin3eQ5JDPFNCZb+WShWw0EsM@lists.infradead.org
X-Gm-Message-State: AOJu0YxQhDQiV5H5DWvXsX3YxWyIdG74/5+NKStLW01+MAWKhyxIFDHZ
	VBoxxfGbgv08SzP0Fx2MASUmlZ5+h9KpLjeI+yoezDzx1BGGFvj6SbUN8yrG0TP+nFg=
X-Gm-Gg: AY/fxX4KpdL60subjQAn73aYAS0wno0w30xZIRVggAQbfKjkg4NIs4s12zPqJ3RxTa9
	kJswa2YIGkumTJrwMlFdZ16Fa1tiI9+pr1G8EHoS/HTBKzKajaYGvYyTghryKvpnsdy6ALC/mrB
	859CvNZDcHmitz2zE/WR4dN54AEZoznduxd4Wy1il1xdk063SSuYXH2AaleXhH6BypjTIjUDW85
	FQQydd3SqlSDHklDwUc7uTHLv5UcC1rqvhEpBxRCKbZsYulxkSpT67Zh71WAIEeEsWruU46pH8T
	W10/Io97xQoSzYlNUvbfaJ/eziraNiqd1l+ltaU5CIAE/SEWWcJUC01qZPzJMH00cileUMs871j
	EzknbmrQBHvyKI3oZIzOx3VQAgQBhO47b6GQMbNiJj/Z3xr296J0JyZ/IhZ1jc4ZOXmNnefGa+J
	Pik/vhLWsWTgFuDMW9TLXm08a83j9NS6gcvZ7sAtxmvQ0RgOuOm4YQV9cmvPCK94GpD70=
X-Google-Smtp-Source: AGHT+IGiRum5OAeqK7KwLoeA3fYC8uB4/qk0h6ByodkxfauKgGSblQTUCpTabkdDEAjM1i6E2aZiIQ==
X-Received: by 2002:a05:620a:440b:b0:8a2:595f:657 with SMTP id af79cd13be357-8c356f10068mr814244585a.21.1767571350945;
        Sun, 04 Jan 2026 16:02:30 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c09688e3d4sm3545746985a.13.2026.01.04.16.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:02:30 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vcY3J-0000000156c-2OeL;
	Sun, 04 Jan 2026 20:02:29 -0400
Date: Sun, 4 Jan 2026 20:02:29 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dawei Li <dawei.li@linux.dev>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Maintain valid access attributes for
 non-coherent SMMU
Message-ID: <20260105000229.GC125261@ziepe.ca>
References: <20251229002354.162872-1-dawei.li@linux.dev>
 <20260102184113.GA125261@ziepe.ca>
 <20260104133532.GA173992@wendao-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104133532.GA173992@wendao-VirtualBox>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_160234_887040_C33F401E 
X-CRM114-Status: GOOD (  16.91  )
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

> >  /* DMA for "CMDQ MSI" which targets q->base_dma allocated by arm_smmu_init_one_queue() */
> > 
> > > @@ -1612,11 +1624,18 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
> > >  		(cd_table->cdtab_dma & STRTAB_STE_0_S1CTXPTR_MASK) |
> > >  		FIELD_PREP(STRTAB_STE_0_S1CDMAX, cd_table->s1cdmax));
> > >  
> > > +	if (smmu_coherent(smmu)) {
> > > +		val = FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> > > +		      FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> > > +		      FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH);
> > > +	} else {
> > > +		val = FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_NC) |
> > > +		      FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_NC) |
> > > +		      FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_OSH);
> > > +	}
> > 
> > This one is "CD fetch" allocated by arm_smmu_alloc_cd_ptr()
> > 
> > etc
> > 
> > And note that the above will need this hunk too:
> > 
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > @@ -432,6 +432,14 @@ size_t arm_smmu_get_viommu_size(struct device *dev,
> >             !(smmu->features & ARM_SMMU_FEAT_S2FWB))
> >                 return 0;
> >  
> > +       /*
> > +        * When running non-coherent we can't suppot S2FWB since it will also
> > +        * force a coherent CD fetch, aside from the question of what
> > +        * S2FWB/CANWBS even does with non-coherent SMMUs.
> > +        */
> > +       if (!smmu_coherent(smmu))
> > +               return 0;
> 
> I was wondering why S2FWB can affect CD fetching before reading 13.8.

Yeah, that table is super useful

> +               if (!fwb) {
> +                       val = FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_NC) |
> +                               FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_NC) |
> +                               FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_OSH);
> +               } else {
> +                       dev_warn(&smmu->dev, "Inconsitency between COHACC & S2FWB\n");
> +                       /* FIX ME */
> +                       return;

I prefer we block it as I showed instead of printing a warning, cache
inconsistencies in virtualization can become security problems.

Though it is probably good to add a comment here about s2fwb also

Jason

