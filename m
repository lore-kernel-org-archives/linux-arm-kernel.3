Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51050CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSB/t2vnZpwaKaBmIo7hL1ql2I4ostuStLW/up58Wu8=; b=P8ZCdIg1CqG4e8aO9mEFeL1q8f
	g56myGJ9iW6YFH7IfLjAn814PLJcLbdEtHM+e5cKvd4BUDynKYrhCsdPT++THHSTBPH5ler1AuSXq
	gI6znZSs1kglTvAEYfZJFZH1SBhNqsTxNqDEl+9cRJH6rP4hEZNfsyv2cy2Kyeo8uZIRpqf1uEZ4a
	JvwTa2vFfKCnxD6V8SDw2CJ4fluNOy5mTDVdLSUVSNaUvlrSxGsbBxCy2oP5CgeWT6N5nelmJtUwh
	5nSRJjLXyHiKL72XMePjL8JRlCF5mXdNsdoHoceEv0BuAwRynLLDu3sboSD+RixEKno6qVBkeYwoA
	ReF6hVjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZrS-00000002Wnf-0Jmw;
	Fri, 19 Jun 2026 14:06:22 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZrP-00000002WnK-2FMN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 14:06:20 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-9159477c893so250070185a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781877978; x=1782482778; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rSB/t2vnZpwaKaBmIo7hL1ql2I4ostuStLW/up58Wu8=;
        b=Si33svVuzREUzz/LNEv5t1aSiuXBMyXXPpzP/capNHPQxrEf5iFet4kZhJS0ECArQz
         lcNtolzrVl9L/vBSlrhJ+LPK5v8K8PZ8JPYW6C+RA4SWBv/+N1rkFCsBfNhkBhnjWIb9
         ELV217SGImUKax/f5LqnSmoWBtJ70bruio19WcaVqQ8KMseaRF3VDMoF/2T3EuJxGn0h
         CnLhobqOXndilFpO572ijCsy9kstcaF1Uwfqe7uVaiNp4P97ehi44bxgEQl7hgII4jjk
         7K4PmKk2KwT0DLO05ZY8e+xT8efGK6hFYZpVuzC68LdGQCGj6jm9R6fiN8FmEvE5V0Hp
         sfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781877978; x=1782482778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSB/t2vnZpwaKaBmIo7hL1ql2I4ostuStLW/up58Wu8=;
        b=L9w84H1JeGjFwCGxMYfn47jBcfBvuadX6lOvipGoksmgrza6fxWsGsAiDOGFQbzhQC
         Q6Z6MxMgnZxWAdS8j9A7ABPvHlzcF0kmwRvIEeh0XrPK/JMgaow7HthhSoqlyP620VNw
         6Ahjo8d1kYfCkrGWt+V4lHr+vknLPFqho9sUWspPF/70uckyLRsy+Zgi2kPNYHCBFx3s
         11RmkFizcL9aG3htDi3nobjPcqMrCKnFvdMYkstf4waZBgCbUu10KapcuwtsD6PhBnWX
         3iaDQmIi0b+0JEnDFNUDVxknd+v2N89ySaq//ob9V7LnwZ0PXOLODPA6SPqCTC8IsACr
         XTxg==
X-Forwarded-Encrypted: i=1; AFNElJ92iqaeq2hP9XQVfTLb8px8+0JUwpvxsLXD0j5Wftk6xgOfsZC4vlrH9LsSZ0noRf+BxtMvXPwmdyMjegEMkZXY@lists.infradead.org
X-Gm-Message-State: AOJu0YxWIXYzeXHekxbtj/rgPuJ2u+GFCJK4524RFGsq5Yg67c/QW+EU
	foE4C0HBCiRoMrAxwZDAnEBtYFqhcyceMj9LxV5B28szjT3ljT0pfRlahEcQBArzF8k=
X-Gm-Gg: AfdE7cm9vU7GqJTWyECy1F8P8rfaZv5BqNxwvxVrXg+ypNIsQCT4NTZzEzRdpzFd19l
	7UvkxkMFjv8a5ra/gOuCu2GifpEPOqGpWEq/kj97JzVVf1VqgN2wQD6UtsHb5hqzEihXD/+bibT
	q7L38PUAwaN4/cyM7uqeWKbgDtlRtInMAb1nUM+DGvDaA1izuRNJZlBjiL3Hkf3SSpfAjv0I6F3
	rpAh++d/aBA1DnLpGeM53HqbfG4BpHU1UsN7dmM2YpHTPiATqKSJhwXkGtGw2qPwSTp4vfLRAX8
	TpW7ceHMnbsjOlI9CpUo5ZfULlhVTRwIn4iZRtlB8olo7VhWIfd3PxPuauC21F9u/eGXvts6/ul
	1u6A2e0EaopooMUPungxlk6irB/2JJ0rnXQXm95a8+Y7ctrkxF3B+x5y/js7+NvVWl+CjXVP1Qi
	3Gh0tGJfvwx4JM2LqKu4UX2+CV7nlOJQIPzWeWmp+AyLo02ETeN7IzU4+S8pg1zVkGqnA=
X-Received: by 2002:a05:620a:6842:b0:914:ac45:a98 with SMTP id af79cd13be357-9208f6479eamr503398085a.17.1781877977966;
        Fri, 19 Jun 2026 07:06:17 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a142f50asm250739785a.12.2026.06.19.07.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 07:06:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1waZrM-00000004cLp-3AI9;
	Fri, 19 Jun 2026 11:06:16 -0300
Date: Fri, 19 Jun 2026 11:06:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v6 00/20] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
Message-ID: <20260619140616.GB1068655@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <aigYbK12D8uKQvJF@arm.com>
 <20260609144746.GL2764304@ziepe.ca>
 <2ecfa1a8-6202-4319-9692-a6ffeb5a3dbf@amd.com>
 <yq5aqzm4dz25.fsf@kernel.org>
 <20260618153705.GH231643@ziepe.ca>
 <yq5ao6h6enhm.fsf@kernel.org>
 <20260619122148.GL231643@ziepe.ca>
 <yq5aldcaejos.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aldcaejos.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_070619_588898_1F1BA2A6 
X-CRM114-Status: GOOD (  37.01  )
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

On Fri, Jun 19, 2026 at 02:36:19PM +0100, Aneesh Kumar K.V wrote:
> >> Agreed. If the device can do encrypted DMA and requires bouncing, it
> >> should bounce through encrypted pools. We don't support encrypted pools
> >> now and that means, we mark the option ("mem_encrypt=on iommu=pt
> >> swiotlb=force") not supported for now? 
> >
> > ?? if you don't have a CC system then the swiotlb is "encrypted"
> > meaning ordinary struct page system memory.
> >
> > The hypervisor should not be triggering any CC special stuff here, it
> > is not a CC guest.
> >
> > Agree we don't need to worry about swiotlb=force with a trusted device
> > in the GUEST for now, but it should be something to fix eventually.
> >
> 
> If i understand this correctly, the setup Alexey is referring to here is
> bare metal system with memory encryption enabled and dma address doesn't
> need C bit cleared because it is handled in iommu.

This is how I understand it too, if the iommu is turned on then it can
take the high PA with the C bit set and map it to an IOVA that matches
the device's dma limit.

> ( I consider this as memory encryption that is handled
> transparently, device can access any address because that encryption
> details are now managed by iommu).

Compared to the guest side there are some important host side differences:

 - On the host the iommu can fix it because this is only a matter of
   IOVA range not access control. On a guest even a IOMMU cannot
   permit access to private memory
 - On the host the state of the device is driven by the dma limit
   which is not set until after the driver probes. On guest the state is
   set by the tsm and device security level before the driver
   probes
 - Both flows end up using pgprot_decrypted and set_memory_decrypted()
   to create their special pools, but for completely different
   reasons.
 - The memory coming from the special swiotlb pool must NOT be used by
   a trusted device on a CC guest, while there is no problem for any
   device to use it on the host.

> Thinking about this more, I guess we should mark the swiotlb as
> cc_shared only with  CC_ATTR_GUEST_MEM_ENCRYPT instead of
> CC_ATTR_MEM_ENCRYPT as we have below.

The name cc_shared should be used for GUEST scenarios only.

I guess there is some merit in keeping swiotlb using "decrypted" to
mean it usinig pgprot_decrypted and set_memory_decyped() which AMD
gives meaning to on both host and guest.

IDK what AMD should do on the host by default. I guess it should setup
a swiotlb pool of low dma addrs "unencrypted", but not "cc_shared"?

But if we are operating on the host then this pool is not limited to
only T=0 devices, every device can "safely" use it. (ignoring this
destroys the security memory encryption on bare metal was supposed to
provide)

> Now we have the case of host memory encryption where the C-bit needs to
> be cleared in dma_addr_t. That requires special handling in the kernel, and
> I believe we need to mark swiotlb as unencrypted in this configuration.

I think we need to split the two things up, they have different
behaviors and need different flags and labels to make it all work
right.

> I am still not clear whether there is a config option or runtime check
> we can use to identify this case.

The dma api has to detect, after the driver sets the dma limit, that
none of system memory is usable when:
 - The direct path is being used
 - phys to dma for 0 is outside the dma limit

Then it should assume the arch has setup a swiotlb pool for it to use
to fix the high memory problem.

Similar hackery would be needed in the dma alloc path to know that
decrypted can be used to fix the high memory problem like for GUEST.

I guess some 'dev_cannot_reach_memory(dev)' sort of test in a
few key places? Setup with a static branch to be a nop on everything
but AMD, compiled out on every other arch.

Jason

