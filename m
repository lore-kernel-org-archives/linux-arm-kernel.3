Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06449FED3E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 15:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/x75TqXNcWuPRjyy/KdKbQT3qJql0Oi7XAZXrmCpBRk=; b=AF1JCBi1NfzCyOBKALvJlgOYqs
	sIzHGZSK8O1cZ3xqXfWoTAnl83PxPut99f33+UWmWl9Ir5+XEoKTzN5oGk4x4/X3g3uWmAwEnRlWt
	ETXvJ1Yk1rsLUGGPJ263p6J1Rz+2SLUscWMHJRmwLGlLaCFLnwcfbeyWf8uesEiGCKirC73PHlhIl
	HbDhttTwEqxf06cLBX1Ufsz8BaGfUAM5yxvsoV+U/kySivPhUgf1VPMtxmBYupMPizUpRcK2k1opn
	1jftrQjSC9BnGa6o57aMVNPRnn2XHM2Dob1C3UEZAsI8WHsWXgrAvBRmIhLX+RWdquIE+NyL0xWO9
	lwDRtsOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIgH-0000000DOes-3Lel;
	Fri, 24 Apr 2026 15:43:01 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIgF-0000000DOeL-1lMM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 15:43:00 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8c70b5594f4so879101685a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777045377; x=1777650177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/x75TqXNcWuPRjyy/KdKbQT3qJql0Oi7XAZXrmCpBRk=;
        b=ndPQsyAm356+l3BgckIXjh6Ik6aX0tiGyNLmJxGT/RKam/qSYblAzqwzEEbUw9jjGH
         CkmIUrxZnHO3ECyIdBPYrrdWH8bEiU13mYYdW7TIx3XhJXGFxB2h27X9wj6KywLh9fUp
         gvv1lNxrmHzdLkB+j1Sp7T/vjLpz5KFImQUEdwh5pXfwHWHMyu5ZKqu5BObS4MvzSJsh
         jcUn+W490dKsQBQDxX7R2p8mCR9WaMlnMmCQZpL1dnBEyT5Xim0uQgMnV/ebqHd6GgEV
         ooILTmTs3wYpPpX2N1FPBJMIkcVLbOBnpz2nSMU08HyDMCmqgPqngaeqP79vNnJIrmED
         NGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777045377; x=1777650177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/x75TqXNcWuPRjyy/KdKbQT3qJql0Oi7XAZXrmCpBRk=;
        b=Fxpju6X2L4Sin4Ao83TTooxi/ObZzCz2BkNZnyw7MAYyXgvz81PfWjjgqk9Mc1ubtp
         Hum5ZzKg8g64FUdujkB7Fs/LlkRYlWfUWzb/3jOLUnJ2sG+LTbfegmLIkT5TLqBnx+hG
         0gWLdNUl69gD5500xpiCYNC9Gxf5QtrxZu3B73U7H/+unL65T6JND7jjlljwdkNNx/7u
         ChrGCLcJtEPgoytp3Orsxg/qFqK2uAR3Xsojl1j/Iv+ztU+oSDX7wRa6JPKp7L8wRIGm
         3B/Q1Zl9TNr7656Uiuijm6H5f+AAPtPu7oCbnmHMhmTKPV1B1A2Y4ZGWpt6LHwaQP3HS
         TroQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fVaZlTwx6FHT74BB0RlIbfQfU/5cNQoAJAdkBgc5yyq5i+ofokfv9943VOKVKW/7L6yN2tCSHj39l0MLUNa3z@lists.infradead.org
X-Gm-Message-State: AOJu0YzEzJ+tvj0ndhqyZvjTL1I7yvIgDh8YYD2Va5Nx9nk7/rTjQ2KA
	0YvU+q8UE6ja3gJdAcXOV53vFnD9kv9MJ5/xcSQioE+86UyVPhdZ/tizijffDhVN3aE=
X-Gm-Gg: AeBDiescKA/q0UmrIdM76p0ceSbgVo1igm2rIh7x3xC0EdTg7FotslNi5gWfLJtqudo
	CCHv2IhX5jfHF3CqLWJi4MXa0WlfDn3f9TZgpQZ6KN0r17rWnVlVCZPF44zoV2fqkQ4jOPKdm46
	vi/D9VTXkfNIzmWaKcBbQERt7XR1f7/0SjYBLQVyjXfEwFYUacooeeQG6//2i3PTpWw0INkfCZW
	APPcgOxgYPNMHnE1HZ3Viw6sFQltZEDQ3/X1DEkFftqISp1+f7SFevQUZD0oNIXYjpije/SzHha
	npvFaI/33D7k1DNgC4eX8Vrsx+Uj9qJiFHUFTVm6/Hrb3j8nxg68xgAB9GqYGIXewtcyx8SvMKr
	i2FdhWAKAt4q03bvnoycPdTahspIiphTTZeDixLCAsEaT4vuU4qz2DiwPqj8h20myhRYXMRkuvx
	Ng+eQq2xrajXSloR6sFawmzL4Hk8shrH6NTKeSP3vPd8LUcJkjK5PEtdgU10fGnNH9Cyds+DGZz
	tfk+qwGqx4eolXX
X-Received: by 2002:a05:620a:31a5:b0:8d7:c82f:ff7b with SMTP id af79cd13be357-8e78cab251cmr3765152685a.35.1777045377193;
        Fri, 24 Apr 2026 08:42:57 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae7fef0sm181782366d6.38.2026.04.24.08.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:42:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wGIgC-000000035kk-0Ekr;
	Fri, 24 Apr 2026 12:42:56 -0300
Date: Fri, 24 Apr 2026 12:42:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Evangelos Petrongonas <epetron@amazon.de>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com,
	Zeev Zilberman <zeev@amazon.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allow disabling Stage 1 translation
Message-ID: <20260424154256.GF3611611@ziepe.ca>
References: <20260420123221.20801-1-epetron@amazon.de>
 <20260420124032.GO2577880@ziepe.ca>
 <20260422064431.GA49867@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
 <20260422162351.GK3611611@ziepe.ca>
 <aenp6FHzx9rtUQkZ@willie-the-truck>
 <aenqxasLJ8yKYqbT@willie-the-truck>
 <20260423142326.GP3611611@ziepe.ca>
 <aepRy7Gp7Ng85Zr7@willie-the-truck>
 <20260423223716.GS3611611@ziepe.ca>
 <aeuJQW8bGLY-O_vv@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeuJQW8bGLY-O_vv@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_084259_489941_EF157A81 
X-CRM114-Status: GOOD (  28.79  )
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

On Fri, Apr 24, 2026 at 04:16:17PM +0100, Will Deacon wrote:
> > > > STE/CD is pretty simple now, there is only one place to put the CMO
> > > > and the ordering is all handled with that shared code. We no longer
> > > > care about ordering beyond all the writes must be visible to HW before
> > > > issuing the CMDQ invalidation command - which is the same environment
> > > > as the pagetable.
> > > 
> > > You presumably rely on 64-bit single-copy atomicity for hitless updates,
> > > no?
> > 
> > Yes, just like the page table does..
> > 
> > I hope that's not a problem or we have a issue with the PTW :)
> 
> You trimmed the part from my reply where I think we _do_ have an issue
> with the PTW. Here it is again:
> 
>   The non-coherent case looks more fragile, because I don't _think_ the
>   architecture provides any ordering or atomicity guarantees about cache
>   cleaning to the PoC. Presumably, the correct sequence would be to write
>   the PTE with the valid bit clear, do the CMO (with completion barrier),
>   *then* write the bottom byte with the valid bit set and do another CMO.

I wasn't sure if you are being serious.

CMO + barriers must provide an ordering guarentee about cache cleaning
to POC otherwise the entire Linux DMA API is broken. dma_sync must
order with following device DMA. IMHO that's not negotiable for Linux.

All ARM iommus rely on 64 bit atomic non tearing. No bugs reported?

Any fix to that is going to have major performance downsides..

I also strongly suspect it is provided on real HW. It would be hard to
even build HW where <= 64 bit quanta can tear.

Maybe this is something ARM should take a look at.

At the very least it would warrant an IORT flag for safe HW to use to
opt into the faster cachable flow.

> > My argument is that the CMO on STE/CD shouldn't bother mobile, you
> > could even view it as an micro-optimization because we do occasionally
> > read-back the STE/CD fields.
> 
> I was against that read-back, iirc :)

Yes, but it is OK :)

> > And if Samiullah can tackle dma_alloc_coherent then maybe the whole
> > question is moot.
> 
> Yes, that would be great, but we probably need to fix the page-table
> code too.

You really want to deal with the likely perf regressions that would
cause on Android/etc?

Jason

