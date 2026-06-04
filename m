Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33802CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 14:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SN06MWYgnamNhN1ZWgRIcR80dI4EtU2wUgYpm//Klo=; b=mD1WQWqa0yY0AW7LbVMjg6jTaf
	2g/ZCibcOUMv37wlozMvsHGz7xX9M+G1/JoL+1D2wV6rC7/EVrma3yq6atXBTyBaepCva8CYYlBkX
	OK6aP5rNuwegvLb/H6WuXVuF+9zLUMlts0XQDY7ynzPc/+T5niEojgYg5StuDZ1+sNYuFw9GDT8Wc
	SmVWmEFlGQkV9kvEbcPXTKOq9HzCEbjB/tvY6W/XsxiSgZM29gm/nkre0QSXNnQqquUgK3hMvp/d5
	iMYjsXhm7NMM2fSVifMdCW8oP5t49Jm59s3UOCfc9jxtJWm39AZCcxAaI7LB3Te1uIa/sxJk7489j
	rrGA2NRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8oj-0000000GsLx-0Bn5;
	Thu, 04 Jun 2026 14:13:05 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8og-0000000GsLM-3hD1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 14:13:04 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5176096116fso7899661cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 07:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780582381; x=1781187181; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6SN06MWYgnamNhN1ZWgRIcR80dI4EtU2wUgYpm//Klo=;
        b=OQFXXUFLVNS3wrPNRSselYwfXfOMDsAVkN5epFUAZaRzuG0hDZWjGq9gCCUPc8YaFy
         YLBi/ks0fkgJ6Z7KgDIH1x7OQby9ShF7FboKm2huKC0ppcbB65sBfVcuSdsFjNUthj6X
         gA3x4O2OK5+3sDTNe1Z9SFiT344rWToOElWLY2+Pc9nEgZXWw7lMWKph5R+JRxqoexWU
         LKyESCPgddbxgtEUEY1f8aIau7VixwEWy/WvZHT9SBI6f2SQO8ViV5O5ejiwCE6w+bkr
         5FhGfIjt/2BglqCnsWKr9Vhq6ARB8B7KMpC3CSnm6OfxsPpS95WLFdZN2YFyldO5suX/
         43qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780582381; x=1781187181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SN06MWYgnamNhN1ZWgRIcR80dI4EtU2wUgYpm//Klo=;
        b=S52MPi1K5d/yj4yBW/xuMnewJ8dzTH1YfL5p7Vrm0MMVsePR3BPzCojK88VUKv1PGW
         0XEtdwJGqYkZlarQEoeBKMThu2Z39cCmbwKzY1okJdPCHP+B9nuZ+Xuu5sEBAV4iNI0P
         o6QWb4zFPf07/mvFn3GSdSTuQcUo+Pne0/x1tL1rvyyb9kyJGW2xgNyam597ssioNdAE
         97edEsj3MdLtbAmP3Q9ep6yF1kn+CND3KRIm0iWaIohG4eJBZq+H+hIcKw1eO59NWaZW
         1nBxMGmUFtGFly7l4SRkXoBb8ZiGs2v3pYBBinx8noZGqhMNKyJQ7AdzLUyxx83Pv/L/
         Nj5A==
X-Forwarded-Encrypted: i=1; AFNElJ94Zh3nk5eD9q8frpzWHiq186qpisZiMJMWf2Cli429Fi+QPjhIe3jPfh4EXwom5+IOZ1W8D/WKTtjjX7Q5dC3x@lists.infradead.org
X-Gm-Message-State: AOJu0YznoTVn/CspCk1mvVAwgoi8WklIZt0FWOBgILIwZn6g/csIoYnz
	x6qoHDe84uTU+GLdGAmzva0afde6gPKnREE5Ej10hBZ4Omilig+OkmMIQrhi6PGZn9M=
X-Gm-Gg: Acq92OF2mCXfW/MpDi+o1fb6yq4PVmkcW/IU7XONY1Du1r2teRK166BNsVPGdT/JOc9
	5wHJwTHJcBLDwNNEdAMLujPRTOzvbqAnJS8Tn5Wq8sm6GWjVBXSVRdaD3U1xcbJaKijTtyTXirV
	LtpNyk2IQrqokuIAJjIgx/K6Pk7F80K67BMhEHp8LPwBMV4i7goHElCT1yGy/ol63JoX8E5ptqk
	Ccl4h4KweM8YojGZqoBGb5bB446Yi0Utcar4RykPaNZqv6hcD0UhaEhvzks9VOV7F8p1M/XYk+b
	JLD1JEFJQPWAY+IXBufoli0l4TNu+cwTpPylP2ILXZGIuYnpsQByNTm7IRQzGGk8e2HP33ARdog
	YvaWpoSlTJw9ZQoJwZvvuTJKN+IuqiBKDzJH/G30SN29ZEvj/rusvv6KpU3j7BnimVajyjmx5AM
	B4tfSqWxQBaM+z/GlUcZgUtIDrM/+UyIUwOYD+sBdz04OMaDTZQAoh4gb7zYpxiNhjnDYmGQQmn
	RpKc2qg2lEn4ieWELRi0La9n74=
X-Received: by 2002:a05:622a:598c:b0:517:1465:9167 with SMTP id d75a77b69052e-51778696c8emr120221011cf.28.1780582380950;
        Thu, 04 Jun 2026 07:13:00 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775df4dd6sm52447511cf.27.2026.06.04.07.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:13:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wV8od-00000008HC1-3PHn;
	Thu, 04 Jun 2026 11:12:59 -0300
Date: Thu, 4 Jun 2026 11:12:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Guanghui Feng <guanghuifeng@linux.alibaba.com>,
	adrian.larumbe@collabora.com, airlied@gmail.com, alex@shazbot.org,
	alikernel-developer@linux.alibaba.com,
	boris.brezillon@collabora.com, dri-devel@lists.freedesktop.org,
	dwmw2@infradead.org, iommu@lists.linux.dev, joro@8bytes.org,
	kevin.tian@intel.com, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, oliver.yang@linux.alibaba.com, robh@kernel.org,
	robin.murphy@arm.com, shiyu.zsq@linux.alibaba.com,
	steven.price@arm.com, suravee.suthikulpanit@amd.com,
	tzimmermann@suse.de, wei.guo.simon@linux.alibaba.com,
	will@kernel.org, xlpang@linux.alibaba.com
Subject: Re: [PATCH v3 05/32] iommu/generic_pt: implement iova_to_phys_length
Message-ID: <20260604141259.GW2487554@ziepe.ca>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-6-guanghuifeng@linux.alibaba.com>
 <c179b999-8c7f-4338-8aad-b61fd09f1329@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c179b999-8c7f-4338-8aad-b61fd09f1329@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_071302_931419_64ACF7DE 
X-CRM114-Status: GOOD (  14.26  )
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

On Thu, Jun 04, 2026 at 11:30:37AM +0800, Baolu Lu wrote:
> > -static __always_inline int __do_iova_to_phys(struct pt_range *range, void *arg,
> > -					     unsigned int level,
> > -					     struct pt_table_p *table,
> > -					     pt_level_fn_t descend_fn)
> > +struct iova_to_phys_length_data {
> > +	pt_oaddr_t phys;
> > +	size_t length;
> > +};
> > +
> > +static __always_inline int __do_iova_to_phys_length(struct pt_range *range,
> > +					       void *arg, unsigned int level,
> > +					       struct pt_table_p *table,
> > +					       pt_level_fn_t descend_fn)
> >   {
> >   	struct pt_state pts = pt_init(range, level, table);
> > -	pt_oaddr_t *res = arg;
> > +	struct iova_to_phys_length_data *data = arg;
> > +	unsigned int entry_lg2sz;
> > +	size_t entry_sz;
> > +	pt_oaddr_t expected_oa;
> >   	switch (pt_load_single_entry(&pts)) {
> >   	case PT_ENTRY_EMPTY:
> > @@ -159,45 +167,77 @@ static __always_inline int __do_iova_to_phys(struct pt_range *range, void *arg,
> >   	case PT_ENTRY_TABLE:
> >   		return pt_descend(&pts, arg, descend_fn);
> >   	case PT_ENTRY_OA:
> > -		*res = pt_entry_oa_exact(&pts);
> > -		return 0;
> > +		break;
> >   	}
> > -	return -ENOENT;
> > +
> > +	data->phys = pt_entry_oa_exact(&pts);
> > +	entry_lg2sz = pt_entry_oa_lg2sz(&pts);
> > +	entry_sz = log2_to_int(entry_lg2sz);
> > +
> > +	/* Start with the full mapping size of the first entry */
> > +	data->length = entry_sz;
> 
> data->length doesn't account for iova offset. Is this by design? We
> should document this clearly somewhere.

That's defintaely a mistake, the phys has to be offset by the iova in all cases,
it is part of the API.

Also add kunits tests to the iommupt selftest to cover various
scenarios please.

Also this doesn't look quite right, the walk should look more like
unmap where we just walk and stop walking when we hit a physical
address discontiguity. The stop point defines the result length.

Jason

