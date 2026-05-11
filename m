Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2165ACD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRu8PBFexJkXAK4pr5czUbNe2ffmqFkTspqpEqHZ1YI=; b=fmTwAVPhymvAPinpWNbnBMatLt
	E2TRfkNW4R3g8dNV9FySE+SzgrtmiW1L7vUt8bxehDj9lfwSXTiN9yMgK7a+ckagUXKzRir/3j1u5
	jYjLayTGlzBaivoqS9lpNIkkL58IEDXGoKugoiaNeGXuu9VTw9EEbz0zydz1fgZbzcaNvQWpQj7E0
	8r+nvArYhE72ld3JqyYknfpVmiLSvVhtQT+K+PK8EKcNEa+ORd/OIwilGFtcq8Tc0bZflIOcj6tBo
	4R/gx7anjPll73y2As2OdUVtWCCq3Ov2TKxOlLHMaWZfG/4FB6K119oo+IMGl5AMrO5lPRWphNM1b
	BlibIJ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRWo-0000000Dtjs-0USJ;
	Mon, 11 May 2026 14:22:38 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRWl-0000000Dtj0-0kd5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:22:36 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-8b81586dff3so51954596d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778509354; x=1779114154; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lRu8PBFexJkXAK4pr5czUbNe2ffmqFkTspqpEqHZ1YI=;
        b=DSj4zabhdyHUvTkmOrmsgd0JAPlyc5J52zXh8+YkNz8q2aRGvLvXZkhbyci3Wall2Y
         5S+2dqzkoarWAw0LO0gND4P19FWJQT4W20/SSnN6G8PW+1bQI6VKR7jviPquOqilV9rc
         vwWzE84vDJzQT6BZEu94B1Vm1qS1Lh7BjjI7pqGUImBNeJNJTJGjrpC8l5LQ52UmMsIK
         tFwzn21jI2GBjRPw4eNG28CQzle+2EGuJMANxZouU6j3LjxmSiNyRyka3CFwIhg5Mptu
         az9AwhU+V1YJRT/c9zAT3UR70Eg8VHRXNho8IcpaImJtN4wrRQgS7OJWockuZcyIVZjA
         jnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778509354; x=1779114154;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRu8PBFexJkXAK4pr5czUbNe2ffmqFkTspqpEqHZ1YI=;
        b=UzsRG7IjB+MWWvMi5dnYg8SnotLZ5MXuo+wQBEnJHAefgIGC9tmd7SyLhFo0bsiV4t
         qzdtFQJOY33X6PmRxkCkY17RIcSLm6H7LnvDPd/016ZkMsHPCOoS+Fv7pMi8fAb6T/zr
         ujS5uNEeEYgfYlCXdvR5UuR22lzerUT8DFgtZFfz9U+78dYr6jVQmOqYIyRuIHq+dElR
         Y2TnpqMehlv3h9zNucEVrtYmAMmg3kvLXzis2kLLOqN0a63c3mobMdf9G8b9gi6KuCwR
         RgOx1uCWWnX/qE2mfPSnvKtr7ndU3EW5k3EkEwcxXxEnX8AVh364NkXxkCb8NvWdZ0rl
         xIJg==
X-Gm-Message-State: AOJu0YwWwkG7G6pIus7oq4xP/lY/g13a3E/n1+202u1F8lUaGV9PU92F
	wsFhpt5/mmMEZXdgMS/5gK4CgOZn7d2INuYrQ8mliYOEPhExYt+iEjVvWnWibqWrTWtkTDtdymv
	7SHdLkIk=
X-Gm-Gg: Acq92OEIVJ35V+8f97Fmdr1SMAJ0JahyzdZIJ3cuRxkCO5c0ewvyg+2Xkm2vgVRwIW5
	6etyydVchvlFPnAfkvPD40vTGSbEl0q9/xtChjPcrncuC5KRMlrhqY5mmxpA2AUu87jStZ5oE+T
	3moJ8L4JIndWX+5Ei1p79XPcSWip1+PPljt2imH8dhODUQSYAwPxE9WUnqOS0kgDN7rc88z8Z8W
	dlfJuj4vNsmjVxo2wWW15MM5ah0/tY5uvvNOe0viQa/oE8BmOfeZr8QfkKLfF/qHi0zJokAD9lu
	80pl1KtLY5f4zLiqV8WWN7TVk+XYMalPES+pn5hUxy2APS6lSKEkm2ilhLLtmZDYoaahTAlHi83
	9EnXjVpoBEOmw8dMvtz37NTzqbYLE2liVCvTSK3C2tbxDvWZ5SBUN5pzUczClKDANIBHikj58tp
	zJDowAvnNvtH4wjIsZNdDK8P1cwrLkgw3gJrlzur4rl5XXuE+DUJ/kWJTyBuICLoctoQLNsdHzx
	knhxdgcGxHWX7t4
X-Received: by 2002:a05:6214:130b:b0:89c:8a0f:55a0 with SMTP id 6a1803df08f44-8bc42f55059mr354930086d6.16.1778509353844;
        Mon, 11 May 2026 07:22:33 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d83114fsm308645866d6.48.2026.05.11.07.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:22:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wMRWi-00000004oEW-37xE;
	Mon, 11 May 2026 11:22:32 -0300
Date: Mon, 11 May 2026 11:22:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <20260511142232.GP9285@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <20260501130006.GF6912@ziepe.ca>
 <afiRB3e3o0G1oZvY@google.com>
 <20260509232714.GI9285@ziepe.ca>
 <agG8XtrHUfWGy-kd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agG8XtrHUfWGy-kd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_072235_222997_A92089E9 
X-CRM114-Status: GOOD (  30.34  )
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

On Mon, May 11, 2026 at 11:24:14AM +0000, Mostafa Saleh wrote:
> On Sat, May 09, 2026 at 08:27:14PM -0300, Jason Gunthorpe wrote:
> > On Mon, May 04, 2026 at 12:28:55PM +0000, Mostafa Saleh wrote:
> > > So far this is the list of requirements/changes needed share the
> > > stage-2 page table (besides the obvious: same page table format,
> > > granularity, endianness...)
> > > 
> > > 1) HW BBM is not supported in the hypervisor page table, that’s
> > >    because it can generate TLB conflict aborts, which the hypervisor
> > >    can not handle because of the limited syndrome information.
> > >    We can rely on FEAT_BBML3 which was newly introduced to work
> > >    around that, it’s quite niche and not supported in KVM yet or
> > >    have an allow list similar to the kernel
> > >    (as in cpu_supports_bbml2_noabort()) which also limits the number
> > >    of CPUs that can run this.
> > 
> > Do you think pkvm will need BBM? Hitless replace of a PTE is already a
> > pretty advanced feature and the SMMU has its own support matrix there
> > too. Is it for shared/private conversion?
> 
> Yes, we can break block on memory donation which is transfer of
> ownership to the hypervisor or a guest.

So you need BBM support on the SMMU too? That is probably a big
problem because the SMMU is often mismatched to the CPU :\

Also io-pgtable arm cannot trigger BBM behaviors, so how do you
implement it?

> > No.. once you turn on IO like this you don't have page faults
> > anymore. Everything must be permantently mapped into the SMMU view, it
> > can never be made non-present and you must run without page
> > faults. That's what you have in the io-pgtable constructed table,
> > right?
> 
> Exactly, but the CPU page table doesn’t guarantee that, so we either
> have to handle page faults in the IOMMU, or completely change how KVM
> deals with stage-2 if we want to share the page table with the CPU.

So that's the real explanation, KVM cannot manage the S2 in the right
way so you can't share it. RMM/etc are managing the S2 without
pointless page faults so they can share it.

> > >    Alternatively, we can pin the stage-2 pages, that would require some
> > >    hypercalls, hacks to the driver/IOMMU API and possibly new semantics
> > >    in the DMA-API for IDENTITY devices as they will still need to pin
> > >    the pages as they are actually in stage-2 translation and not bypass.
> > 
> > ?? Then how does this series work?
> 
> This series works fine as it shadows the page table and doesn't share it
> with the CPU, so it fully populates the address space.

Which is why it is so weird that KVM is using a partially populated S2
when there is, and must, be a fully populated one for the SMMU. But I
understand there are reasons fo rthis.

Jason

