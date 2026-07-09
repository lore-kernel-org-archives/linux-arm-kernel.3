Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75175C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHkQmsdB2OewXXEQfHxageXwJQg6EnEw6Gurdq9kErI=; b=PsXON54H02SdQwlPRHiqAbT5Ek
	R57EAOZ+4kJ9oWON12roSgbM5Sb4hjMB7XFnwCQAnVPXWPgZiSIJ6JBhCAVNUgc50nWZBPADtlq+f
	xh8GK93L2ERuHQxzr+Xhvd30Q9oZ44SWh/8E0fQtA4KxijlGOzP1Px7Dpq8SmUaAYXp1lsAanqhFB
	f3evIp9BJWYlVHdOmNZqto7lq1gGoFzTOOxifiKOrYlgUU+izjNO8jRLOuyPhySV/9OpbN0FQbLha
	+HTuanPTAIq49DWEDDOhSXgJkkz8hmtj4si5CZtxze7/mpvp08lM/tWsgnrG/nabV+4JxI5ov4Muu
	/730S/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtFl-00000003D90-0lPZ;
	Thu, 09 Jul 2026 18:13:41 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtFi-00000003D8e-3UY5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:13:40 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-8efb708b1a0so2094156d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 11:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783620817; x=1784225617; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHkQmsdB2OewXXEQfHxageXwJQg6EnEw6Gurdq9kErI=;
        b=anOtqgv5Pw0Fh+mLtQphywP9ghN+XFb3rBCe0nIoMEXryU4dcGwIz6GNHca3AAuVky
         3uVVphmJ1KGjxcq14hOmt0Uk+r25nUb7XpySoUhGpoOYE9ShUOsUzCAuL0y+wnrMjBGA
         IH3IzHNrGG6TpH8HMVuqvN+XO2FEI6mXvyCI4dfqsTwU+TLLMvM/SePB/3xpLcxnwDtq
         pZgzGGwcy4XuiXRVlzV5x0TQa/LHYTVvr1Kwp2GVu7ehxast7YU6iAdHLYqSPv9fbKSL
         1V4F0sy82S+u9EefWW3CYx1uiAtIdnwgWVtdDDpUdAOs8L1cRI18DjculDtcT7IVabrl
         tDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783620817; x=1784225617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHkQmsdB2OewXXEQfHxageXwJQg6EnEw6Gurdq9kErI=;
        b=P621mvqSxOH4GzIIIPnrMr/tq5IC8Apfvp82eR4NdEQW/WTUxWmyrHXp8UwIOP05lV
         wSi9nzS9vHkieh4sdPqbzALwZriPXmA5r+pP5xXHFVXP3sYjiwDc07vs0ZSlNt6/6ECy
         kWfzjWnfDmSgg++zvdm+mmqDb8j99HdjX3BIqWpsxe1wPoGGfA/H1Bk4zDu5PJlE48wP
         VacX5f161kRoFtgBENSKqSnjiJY1HwCWY+1f3ZDsMpxEu1evE++HvxkDaqb/PKVuF1jA
         U1uc3tKAfAJks7SyviiAsuHb/UIVDIy4zZzcXXM6xP9nZbJIHrTzIV1GdiwfprTdUZaP
         /C6A==
X-Forwarded-Encrypted: i=1; AHgh+RpjcjCp7ty9sArgAg12IRzTDaRTr2ulloT2PkpducGMKY6rjCFqzh1iwgAaOkQSBZKsLWeyGEEtQZ77WXq/F47E@lists.infradead.org
X-Gm-Message-State: AOJu0YyI1+l9eXmkh0zN13VIdjfKgZ34RRZTLhFhfwqeCM9vtnkPYnDc
	vCuC7HsK97B8DKBnBs34y9A5vf28lv1AAMfWDrCCy29mBHtoe3WKk2FokA0NaHGM7Ds=
X-Gm-Gg: AfdE7cmJjN/md3l4TLywYag8mbQkMyGZ0g1gIZk0pE6qjX3jQr5q+YOqY3liPBOF6aQ
	DRGQfBZMcA9FJafpbNsZdKSSXUz3jlNvKQvl8ciN9tXnAFrjZw7nuwUKtC9jhxhTUVRxwX5srXO
	P9SiHN/LDP4fXPP+hpwVe8Kj5JFYpP933EAhcG1Xdgu0/aZ6ErGGTnq6SNPWksKQ5MBOK0knIiG
	1lhwgy7ayaK9h1rfO0DeMuv/j7XeZRD+U2UJfuIUjEpPFWO7hnJXBWRPiQ4X4gIDdVtedHQQkkX
	ccpr6gNXGkQhXKONpPO5thH7iwMjPp406CqbOoAbvGNEHfDS+E6MN+ugFDh/r6IiTJ2K+MJ3bcc
	v3zdfHIdqu1X5Zfh39j4emjoxKXZjAD90SQdyr4JrN7puU2FPsInRHzfotS1T
X-Received: by 2002:ac8:690c:0:b0:51c:43d8:8604 with SMTP id d75a77b69052e-51c8b3b4eb1mr92527611cf.51.1783620817365;
        Thu, 09 Jul 2026 11:13:37 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd82ea9casm22695666d6.42.2026.07.09.11.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:13:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1whtFg-00000005Kqr-0IQc;
	Thu, 09 Jul 2026 15:13:36 -0300
Date: Thu, 9 Jul 2026 15:13:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 16/22] dma-direct: make dma_direct_map_phys() honor
 DMA_ATTR_CC_SHARED
Message-ID: <20260709181336.GM118978@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-17-aneesh.kumar@kernel.org>
 <ak42F240d-53QeFN@arm.com>
 <yq5apl0xgy89.fsf@kernel.org>
 <ak-CT3oanlDfgTy4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak-CT3oanlDfgTy4@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_111339_005096_83509525 
X-CRM114-Status: GOOD (  19.96  )
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

On Thu, Jul 09, 2026 at 12:13:19PM +0100, Catalin Marinas wrote:
> > > For AMD/SME, on host with memory encryption we now end up setting the C
> > > bit for DMA_ATTR_MMIO. This is fine for RAM but not sure whether
> > > some other MMIO bus understands this attribute. Maybe we should stick to
> > > something like __phys_to_dma() for the !CC_SHARED && MMIO path. Or,
> > > since this is not universally defined, just use the old dma_addr = phys
> > > if MMIO and ignore any unlikely DMA offsets.
> > >
> > 
> > Considering for AMD/SME system an unencrypted dma addr is one without C
> > bit, will this be good?
> > 
> > 	/*
> > 	 * For host memory encryption and device requiring unencrypted DMA,
> > 	 * MMIO memory is treated as shared by default.
> > 	 */
> > 	if (attrs & DMA_ATTR_MMIO) {
> > 		if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT) || force_dma_unencrypted(dev))
> > 			attrs |= DMA_ATTR_CC_SHARED;
> > 	}
> 
> Yes, I think it does the trick, preserves the current semantics for AMD.
> I guess you could use a single 'if' for all checks (up to you).

Please don't change it, MMIO P2P is broken on CC systems today and it
should stay broken. Passing DMA_ATTR_MMIO with DMA_ATTR_CC_SHARED is
an error that we need to correct in the drivers not make work in the
core code.

Jason

 

