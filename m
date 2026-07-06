Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F300C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRS5SFBTU6Qi819haKCrqH2cAVM4+2Tt7xhwcQ+yyIY=; b=mbzpnHiJR7CR3pPrX+xL8li48A
	VdfXVmDcNPv/+GBOLsXUTivuTE/kAmNknhYaQlcKFkmPp0BAqACJpfKfv03Ce0VpmQjT1aLOmyAlm
	o8lgMkpOOt6XcFxFks7yv74F88rFx7dBA572N9p8a4q2jfEttLWJkgWJrbADt8/mAUnMJwg/BJpjN
	1L6w13n/IO3iN9dBhpqUzLE617hVX3phGRMHpFVOmlYogJCIJyifgtXWn4263Ha4zNvaVNw9L1rs0
	BZUVPH/SCpx6k5o759yit8meaqCSndjmTUgSDQF8ikcPIabKKj/pZX5an7HvVefUEpT6KM7NlploB
	xcou/2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglK7-0000000CtZQ-2f17;
	Mon, 06 Jul 2026 15:33:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglK5-0000000CtYm-0EL8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:33:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 819BD236D;
	Mon,  6 Jul 2026 08:33:21 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BA623F7B4;
	Mon,  6 Jul 2026 08:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783352005; bh=maL0BNYhvr2QfHPnX5dCkuL2XYtxHjcR0qs6j+Dl0A8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YghzYDnFDXnaph394rzzwrEwATxrs/wW6+lZ2Qrw68ZBJdHA7p5IraQmQiErm0KDH
	 WR67beGRF7VN0Lg+v0GzYKhxZ4/gj2B0d6cqHaWRU8vSRGpY5kt96r/NJLaB2vUvF5
	 rCFzZnWkjrJXbJxKYirQoHPViCiP/w8JtQerwLqk=
Date: Mon, 6 Jul 2026 16:33:17 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tangnianyao <tangnianyao@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, Wei-Lin Chang <weilin.chang@arm.com>,
	oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, "guoyang (C)" <guoyang2@huawei.com>,
	"huanglingyan (A)" <huanglingyan2@huawei.com>,
	"Wangzhou (B)" <wangzhou1@hisilicon.com>
Subject: Re: Question about the "TLBs and I-cache are private to each vCPU"
 guarantee with VTTBR_EL2.CnP
Message-ID: <akvKvePWiu4pB47Q@J2N7QTR9R3.cambridge.arm.com>
References: <e85b957d-c8bc-aac0-b413-03441d05c3df@huawei.com>
 <xx4obnrmf6lp5dbyo2uwn4pglq7q5nw7ccoyude4zavrgejctg@ll25qpga7qef>
 <292b5734-9005-6db0-da08-3da04628e620@huawei.com>
 <86o6gkpokm.wl-maz@kernel.org>
 <21eb51aa-443c-4d08-b4dd-3f813bbc9880@huawei.com>
 <86jyr8pkw8.wl-maz@kernel.org>
 <5685cdb9-95d8-9ead-4d24-d6ad06dd9547@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5685cdb9-95d8-9ead-4d24-d6ad06dd9547@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_083329_234193_7B97DE04 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jul 06, 2026 at 10:15:04PM +0800, Tangnianyao wrote:
> Two SMT threads(PE0,PE1) on the same physical core share TLB.

Critially those are *NOT* allowed to share entries allocated with
CnP==0, and are only allowed to share entries where CnP was enabled at
stage 1 (and stage 2 if applicable).

Please see the ARM ARM:

  https://developer.arm.com/documentation/ddi0487/mc/

Specifically, section D8.12.3.4 "Common not private translations":

  https://developer.arm.com/documentation/ddi0487/mc/-Part-D-The-AArch64-System-Level-Architecture/-Chapter-D8-The-AArch64-Virtual-Memory-System-Architecture/-D8-16-Translation-Lookaside-Buffers/-D8-16-3-Use-of-ASIDs-and-VMIDs-to-reduce-TLB-maintenance-requirements

> VM0 has 2 vcpus, vcpu0 and vcpu1 that share all architectural context
> except the address translation context.
> 
> Vcpu0 may observe TLB entries that are supposed to be private to vcpu1
> in the following case:
> 
>     PE0(core0,smt0)         PE1(core0,smt1)
> vcpu0 load           
> vcpu0 va->pa0        
> vcpu0 put            
>                                        vcpu1 load
>                                        vcpu1 flush local tlb
>                                        vcpu1 modify desc to va->pa1
> vcpu0 load
> vcpu0 hit *va->pa1*

How is CnP managed in this example?

If *either* of the vCPUs don't set TTBRn_EL1.CnP, that is not permitted
to happen.

If *both* of the vCPUs set TTBRn_EL1.CnP, then surely that is
indistinguishable from physical CPUs:

    PE0(core0,smt0)         PE1(core0,smt1)
    cpu0 va->pa0        
                            cpu1 flush local tlb
                            cpu1 modify desc to va->pa1
    cpu0 hit *va->pa1*

Mark. 

