Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DEECD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 14:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UR0H1P2VS3kaB3iZ1809TswMb1cbtGLR3JmcUIz3mWM=; b=3af5PCJfzphh48oodIQKPoxhNX
	GXIHU/4MFIQSvwRl73OF0D3DIlTLTettA+it4Eu0CwtpW4z3IBzm17BxfSP4ZSTZ7UUz+TIzHwz2p
	pJ8brLCTMFV+tC/B4ffG5e4dgXOq1f1WzJaDfEgHU5kqdB5gQnglFPMW8ZL0G35xIRCtqSjCaNKh+
	DM1TDqq6ieWnr2BO3d3rAs92lPH8GrGA14j2gE8RgJcPYEnk2D22woP28/RJOtTZYNXvYqObi+Cy/
	sI9RovVlaN4bkJzrGGKPY50iwYZetLkD5ehLBmuR2TPkNt6XlS2QgHz1X5asv2/NdrcVoTffN4dZQ
	zARvRYgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVVGF-00000000i8S-30MN;
	Fri, 05 Jun 2026 14:10:59 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVVGD-00000000i86-2wUj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 14:10:58 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-5178a42caa3so17599431cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 07:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780668656; x=1781273456; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UR0H1P2VS3kaB3iZ1809TswMb1cbtGLR3JmcUIz3mWM=;
        b=IQ7IDl/1QUevfs6iet9qfNrEPPZGTusDNtunTpIO1BC3HBkLfZfdRk2JW8voNEKnKv
         zHlARf9RaTY1K3hN3/ECi27ssvCB1Ox+QgXc/8F62/JioTBcytObMukaNKcraJ5kLb/q
         0jGK9kGk+appKWk5aCS1Sci4xV1HZZ+jlyH/z9oWwQk8TRIRdE8kU81LLR9dMeVbf0w0
         CTb/9HwazwdCCAQu6jqo3+ZX5OS9BIO01KRv/kq7LCQShqmsgiJe0q/l7SUP2x1/O5HH
         E+3HuipFKFp4gLceaIRTOD2Tzgt3bC8MuUAliz0MEpvToIzCdq0ni4zIIksZ6VaPe8+P
         RPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780668656; x=1781273456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UR0H1P2VS3kaB3iZ1809TswMb1cbtGLR3JmcUIz3mWM=;
        b=rxbylhPrwaQ66I61kdkPQ6dq6xqmpiS//JEHdPXGU/i1ZVshAws1+rWgG0HAURQv6R
         aHc6PsSgkRTxyheoWW9/nAbACck1wrKxyHMoS06xF4bx2FY3J3CgYxc0CL35CGAd9y3L
         216kzOP3L8O6NziaqDi9Us4dm67qZ5m0cKAtLYO6ohQrkrun8tyNDwM5IMCPG82Bhbyy
         H8RTKZ259d2lY7xNaAm4CCMrihZvxda3iHSzWfriNt14P/nQPF9jcUFCCjeC8sHibgh9
         qYhzHApI7eer4s2CaKj9/LPjDDiBp+oqQaNU5JO7pjeo+jrlMXwk/jRjxZ0GnKSjwASH
         tNzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nT1g6RAE4UuwwRZYyMtaddZB1JEGAswyrNC+JkIvB4qX5C+zhQAzO28hDdWsEn7NubR+F5Va7aJCGbFnmhUfr@lists.infradead.org
X-Gm-Message-State: AOJu0Yysxlp4LRuYzM6m5TtRTy/SZFtTCejA4+oufzVUlotf8/QmOpAm
	Fi53MszhcFnLzFqpG5pgnn61KUTlu7Poaf4KmjxofS4YOxCmCKHSr/Yz2ZjEKuBEo/4=
X-Gm-Gg: Acq92OG/N+6bz1IeZmb4yPGKau/jAIlfXhsnHatkiES/FYLr20yGK0idRiCp/YfOE1T
	sgjCRwhX5UAweNgy44WQO6boq/66xFidJ+8FSlJ11vDpSSkdIQjs/tqvyaCMqZeqGPS2lL/j0a0
	FZM/Jk2f4h0dYCyDK4yCVtYVsYlGyL2o+Dy46ApJp9E/CzP+VzI3Y3QZGYs9l4B0hH1pj+v/6IN
	uDNpWT/S6Ue0GrWjSj3jvAGsmSyBRrbs6jqwhLqMcgG5utfLXPkD7U3PqcgZqBHNIu99AWW47Yx
	+D+oHMIfMFDqlQtUB/vMiQ3++ZKrHGu0MdVdbjaiwZvozQv+YFVasOiRH0iq9Y41H6qoAQi+N+J
	574PLvZ0e3FPd5oU4RfmzQdcj5lAwR6LA/rx0nQrVvEw+K01QVdwp6OznI6ar8f9ZPFmiWBxQS9
	ES0iVFwHTMYM6RrLxSmwsKN5I8CMMktkfqsXgdadBIVaaNREZzL6PDPBBflkVyxrqYmTKRJPiBq
	VfAAIV95vQdAhBj
X-Received: by 2002:a05:622a:244:b0:517:5f11:b353 with SMTP id d75a77b69052e-5179888c297mr31853621cf.41.1780668655956;
        Fri, 05 Jun 2026 07:10:55 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775e2e16dsm80797461cf.31.2026.06.05.07.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 07:10:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wVVG9-0000000BEgc-3cQ9;
	Fri, 05 Jun 2026 11:10:53 -0300
Date: Fri, 5 Jun 2026 11:10:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: Will Deacon <will@kernel.org>, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/arm-smmu-v3: Detect Tegra264 erratum
Message-ID: <20260605141053.GF2487554@ziepe.ca>
References: <20260601104845.995005-1-amhetre@nvidia.com>
 <20260601104845.995005-3-amhetre@nvidia.com>
 <ah85c4u011WNJQgE@willie-the-truck>
 <09a501ff-d1e8-4035-95c1-a6df9f0cb9d0@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09a501ff-d1e8-4035-95c1-a6df9f0cb9d0@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_071057_908850_A064AB27 
X-CRM114-Status: GOOD (  14.59  )
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

On Fri, Jun 05, 2026 at 07:35:35PM +0530, Ashish Mhetre wrote:
> > > +{
> > > +     if (!(smmu->options & ARM_SMMU_OPT_TLBI_TWICE))
> > > +             return false;
> > Maybe we should make this a static key?
> 
> Okay. Shall I add just static key and remove option bit, or
> have static key alongside existing option bit such that
> static_branch_unlikely will precede the option bit check?

You'd have the static key and the options. Keep it simple, enable the
static key once if any driver probes to set TWICE. Check the key
before options to get the best code gen

But IDK if it is really worth it, there are already lots of branches
on the performance tlbi flow, and we didn't do this for other tlbi
affecting errata..

IDK if we really care about branches we should also be doing things
like disabling the range/non-range paths and ATC based on what is
actually in use..

Jason

