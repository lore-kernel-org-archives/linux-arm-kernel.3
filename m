Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A706CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5pjsrH0NuPhJAa2Q4JnWo3JaksS0ES3ehHxy8GX7zY=; b=TbeyacvddLNqIpRglcUj60Fs34
	U/Zyez1pqjqkBEyp6KyUmORT66G1WExKB5GInw6nhpS9XT+FoAIBrheR1TjkCsNnA60ty9Ceg4bEq
	vduo0BIoiCEoTbpmpkCDYYC5HWupdVhNRxhZdkjo/tQgQm24ke4tTtXUjFCsxYpp7l1SRlGw4377h
	9jHvzhbB2f2Xs5lGR3ilJVd6MxAK1UDuQ7M67CmUaiFIUqhY3esojZraNI+b/pFuk7nntD/8lBG3e
	pxrqQVh7wqV1lBF0saWpLTCQqp/g+Bg24VKkoINXdvqg9IatebSpbA9qT8McN3rN6Ile5bdcpQb2K
	nClIctsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz00r-0000000F1CU-0lM2;
	Wed, 17 Sep 2025 21:48:29 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz00o-0000000F1BN-3gd2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:48:27 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-76ea7993925so2254296d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 14:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758145705; x=1758750505; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M5pjsrH0NuPhJAa2Q4JnWo3JaksS0ES3ehHxy8GX7zY=;
        b=LegSt0L8ACD4iH2aWyhZM6Kc0RwKZ4w3RTZBnqbAxqFgbdlDwUFEY4aeOuQVbsULcJ
         50/UIRE5V+5M4Y8p0X3sYYnyhnmQRNNgEqjyMYHIjav5BaCTC2UBVU/fz9EF1JhzxgD6
         jh8Mg467GgwbOYPcVz/+PTOmt40YtWCScUz5fd8gJ+kBIaYy2YJ4Ku/CjRvA9E/ssbso
         eQjotG8HwjseskmhwcsyloNS+mtd4HC2KbOGCC5izEETVPse163ACl/A4/fO9gr+0OjG
         XI4VPi6W52Egy8XMYq1iLi14cakDVereanDYCDylIk1oFpAPogwZFzVtG/K+cOJbtu25
         A7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758145705; x=1758750505;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5pjsrH0NuPhJAa2Q4JnWo3JaksS0ES3ehHxy8GX7zY=;
        b=XagPpU1FHBoUzBmDXfACWx4OnkNaaQyVvjYuPsV6tm1RRABBFJc8DTKn5eZ/iPrJqm
         JzHCCUQA75ughGQ1gtwSLDu6M4zhrzAflGdA7eOhakOiN4yzJViDg5EbAZC5vovJaUtD
         kWRdGFZ3V3/ZsFCbXACT5PyuY4fhwCq5PAYbRzxsuZHAHjpRJJXvS7VKaar5db8X5qrI
         1r/tK2VwDPZzGe+qubhLd+59gC9/lxgT/lPWuxfx/bopbp+owr3aNTB/Ko2Xs4XFRJeL
         aIRB4d+3zq8lXo/y0NHQRXfruQmQFAH5A9JUdQCVuWCj89DIq+d943tdFN19mFaSj+yY
         QlxA==
X-Forwarded-Encrypted: i=1; AJvYcCVEWC7vVUObtFFK5L9SmtJ9XdT+4n7LPqROsZdqLOwlb6Llri0qbowvsR8WrqrOn2cXIk/MKQ7vfzmPuDKvnddg@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk7KQOz353pjSIGeNrIdnirIWfhRprW68bWhqy4ExwdzmMDvir
	+pRuOXdqg6alXJH59XhFcnTO7RtXkNFGH07r4vEsKA6cgdbHsGF0lzWjAqx04oJI1sE=
X-Gm-Gg: ASbGncvVrrBnQBHVvDIbb/X0i5rUYK+24ymCSEL5AEj8wIkozP+3QF/FUqmx4VPGpik
	na9CAmGy02xaNGGFcwr4uCKjU37xeiJQxkeDtTvz7I/VMe6Cqycr/6z8GdJhrBpjB98NL1htZ7h
	B7TDKBCasBfejIsH+A2F9mChb+1Yy9U4jGa1/FDA9FgG8qK/NTl8wtZfS+DeFaWlAFIWGIXq/hD
	7tamBjqklkvnNQF2BGiuo/6JAKKtHMCoSNizblOhNcnxhGxlNxIPps8pWVYyLPwoXuc2ZMJMvwS
	TmUYNE0ETlJxjjUy+5EghAeN2iocqZpGwXdl5KuivEgfJCK36QvtVM8rooSKaW7X5a7qOJR6shG
	BFfr0dhG2QQsqh9xnRkQjU2OB6P/SGDg8WbDRlYhPrEsuyjJ5PfvktYUFrFhYcVA0sfxjdGXyB5
	EuGZhQU6LncxQ=
X-Google-Smtp-Source: AGHT+IGqltdD4fDq4evbzVSSO987bVfhcgn3SKxWfDcujX+SUfkoa+t2KVNljJJgOxNmqIWdaHiAsA==
X-Received: by 2002:ad4:4ee4:0:b0:720:e4bd:d3e6 with SMTP id 6a1803df08f44-78ecca1699cmr47085396d6.15.1758145705595;
        Wed, 17 Sep 2025 14:48:25 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-79346931b67sm2589176d6.22.2025.09.17.14.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 14:48:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uz00m-00000008ots-2fnK;
	Wed, 17 Sep 2025 18:48:24 -0300
Date: Wed, 17 Sep 2025 18:48:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v2 1/3] iommu/io-pgtable-arm: Move selftests to a
 separate file
Message-ID: <20250917214824.GN1326709@ziepe.ca>
References: <20250917191143.3847487-1-smostafa@google.com>
 <20250917191143.3847487-2-smostafa@google.com>
 <20250917193818.GK1326709@ziepe.ca>
 <aMsX_HafW3rLs5dQ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMsX_HafW3rLs5dQ@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_144826_922756_F840A857 
X-CRM114-Status: GOOD (  20.25  )
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

On Wed, Sep 17, 2025 at 08:20:12PM +0000, Mostafa Saleh wrote:
> On Wed, Sep 17, 2025 at 04:38:18PM -0300, Jason Gunthorpe wrote:
> > On Wed, Sep 17, 2025 at 07:11:38PM +0000, Mostafa Saleh wrote:
> > > +static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
> > > +{
> > > +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> > > +	struct io_pgtable_cfg *cfg = &data->iop.cfg;
> > 
> > Can be:
> > 
> >        struct io_pgtable_cfg *cfg =
> >                &io_pgtable_ops_to_pgtable(pgtbl_ops)->cfg;
> 
> There are a bunch of other formatting issues here also, but I wanted to
> move the code as is, so with “--color-moved” you can see the exact
> difference, otherwise, it’s harder to review.
> 
> I can add a patch before to fix those + the printing as you suggested
> next.

Yeah, I brought it up because with the above you don't need
arm_lpae_io_pgtable

> I don’t have a strong opinion about this, but I am more inclined to
> keep the prints considering it’s a low-level test for the page table,
> and such parameters would be useful to understand the failures.

My general view has been that there is alot of debug prints I've added
to kunits to debug them but once they are debugged I tend to drop them
off as they may not be useful to debug the next issue.

> I know this is not relevant to this series, but the KVM driver will
> need to expose arm_lpae_io_pgtable anyway.

Really? That sounds like wrong layering, why does it need to break the
iopgtable abstraction? :(

Jason

