Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0DFC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xg8bxcCx9Xplr0VksHoJCXIx7eh2ZBKcRPIgfCbqvCk=; b=I3g2/DXWjB1fFNDaAs5bHv+PQ/
	OYRv728aFxfzssWHhM64+MCPpyJyWp2ZYQ1PCp9pyATXYjv7pSjcMK1BVC3wsGMNP0jyfo5yrahHt
	sf4d3WJWVQ9gX9Z7A/cT4XE4XnhPt+ztulddro0w1xxGl04oBzgAEZbXwpx0gsUCPN1HgsBe1NhyN
	7si6ppZM+abz6xyhq54G5GaPl4z3Ux0Ed5lLEBdwUDkp7WJvlpqGdQbzmNZs6+c9YyQ/y6r1l1JVO
	SqiM/IR3qPnCh9YWLFQvMKRGt9njUUuMsNk3WzTXxAbv+WbMHS19Wp58SVebIaWyXY6uZqgPwRnKw
	IdlSTtgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7buS-0000000F7LY-36sx;
	Fri, 18 Sep 2026 16:58:00 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7buQ-0000000F7KA-0JzQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:57:59 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-52fb76906adso12081571cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789750677; x=1790355477; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xg8bxcCx9Xplr0VksHoJCXIx7eh2ZBKcRPIgfCbqvCk=;
        b=E1g1ATky5anZiOaGQnc+aeRl0LwjwTEnSbC3t80LHqXTzxJTQmJVRWAigZIBM/sJ+J
         KOQKpS/lFi9Mx8kWfLxDHKfSVsWglzlOOn5ZPsQw1uAwH2XRAYHQDdq8d+Gw30P4iMEp
         iyFo0OV5HqkXEmt2wL4ONA3vf83Jg0PetZy4ExrHsYrQqs5EB5ExTVMOY4Zbj7IaJ6QA
         dcFtbEuF16w23xNjbO5aUjBVPBr2Xkl6WDmSSpeznzyRCrlB/w3DgzfbfqkxduJZ1Wi7
         EgKnzYvIFKP6nYf08L/aJNlBN/RL55TBCYjDGTNEMpnNMDvLLHGTHpBtPHsDaYodr0/A
         QFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750677; x=1790355477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xg8bxcCx9Xplr0VksHoJCXIx7eh2ZBKcRPIgfCbqvCk=;
        b=Yms/6mD0oeUmZjMr6fuTieKnSkXQQNsPIDxsv4CJc6glszH1chEEcca/BB+DaeR6O8
         2nFnq9pZfyu3DsCY+ShWhKxOvpeUM3gQOnKh4mf75Hy6mViU6vGVwSzPQxCEBEVSBsyF
         zgVFIlzY6WFt4PMlo3NNopNucGzl7crte1yrsLrvFF7DDEmcM2k5FXahSzDFlT12EmU3
         et8cHTctR/aD4RjQDFF9/SOinfMANq7Ai0Iiafb3tCdXRLS1O0jqkTMH7gWk9p70F3Wt
         j1oyT0mW4RJR4wMLTr8SumOARLtfsSOj3cNkUp3QHgq0DG4eAt2mzKWJTbk6bPuBTKfs
         gsaw==
X-Forwarded-Encrypted: i=1; AKwUvByOMl6bU15fRHxI/lIl72wylThfMdIouohWGcVEtzLY7yQeYZ5ChXN9oFlbs38NXjqvRIcY648w6tJ0905FF+tP@lists.infradead.org
X-Gm-Message-State: AFuF++mjjDErG74Y84iJTIcKkw8Th6Kew+299EniihlpLGuZiVbAg0AT
	KLxor3/JtDxGO/QAcE0z5hLbOmF3Qhg69He+TF11CRs1HlqiARBTS5HePX1KToDHySc=
X-Gm-Gg: AYBFou3GDv7S62QwyH6NIjIzzB8+6+rrai7PchzGCB/xnFuEYzLei6LLkrgViyrpLm2
	o0umBzrmq5qsadRa8xFT6QG9xUWlYbkw6jeEqNEFFphZcofC/x1zuzbHKtG2IvKbNY9Jm7eMIit
	eogdncxzEX35cV9/Bi+Jz9RfSxneAT4JlmvNXluypcdYO9PRpibZNvEUFH6/HKIdZL+GybgEing
	rO9SeRc8eyWbg/BRATMkfd1OSrAGq4JxL/XR5EY5kDGRRhsoQGFt8TB1at9fcU1Yg+B3CZ3poDz
	ekw5QHZcfJcugg5+bumbb9L4w2z/0UfJSx+cgN2vzh2GG/svLoNEroEIYL0v35QykGbnICdFX6Z
	XRkuKQOoqM0hhJrAh9nxKizF0xemNI4CL1TshlobAy7ldS8CvsmnN3DS6a3be3P0sU31WachdpP
	INj8gPtjMXnWUqNuqGKOLBKEPME36s4ul8BYLiDbipYPKzOOKUCw+S8ScwTuQK2rW8OrZAls4dk
	cZfRjw9jkc/d3u6G1uVyeFxQKpBKFoyrT6/DCx7vd1I/IkLY41U1Tzt
X-Received: by 2002:a05:622a:60d:b0:530:9bb:54ae with SMTP id d75a77b69052e-5329e259e51mr55816971cf.15.1789750676599;
        Fri, 18 Sep 2026 09:57:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae2c6a33sm1773871cf.0.2026.09.18.09.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:57:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7buM-00000001zBN-2BHs;
	Fri, 18 Sep 2026 13:57:54 -0300
Date: Fri, 18 Sep 2026 13:57:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 0/9] coco: guest: Enforce host page-size alignment for
 shared buffers
Message-ID: <20260918165754.GG11599@ziepe.ca>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
 <aq1sT2EDsGaomqST@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq1sT2EDsGaomqST@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_095758_296872_0315606F 
X-CRM114-Status: GOOD (  13.14  )
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

On Fri, Sep 18, 2026 at 05:52:31PM +0100, Catalin Marinas wrote:

> TBH, I'm tempted not to support this configuration at all, just fail
> gracefully if the realm page size doesn't match the host's. However, if
> that's a real world configuration, 

realm != host is going to be fairly common.

host > realm is probably not that common, I would guess.

> I wonder whether could we leverage the swiotlb mechanism but with a
> separate io_tlb_mem as a shared coco allocator with the right
> alignment and use this pool when force_dma_unencrypted() instead of
> specific alloc_pages() with adjusted order.

I propose we fix the far too low level set memory decrypted apis into
proper allocators, with APIs that can handle a round up. Then see
where we end up after that.

If we can hide 90% of it in an allocator then lets see if we can open
code the rest.

Jason

