Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3F8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VA6hRI3hbiq0ArbSD1G7iFQw3+knszMjw4fdTdB16GY=; b=VaVdg2DG+gt9nh/4dkQA85+mOh
	PX0QLSOiKkpyzn7Yc6fCWfdRUi22TUAUZ19oU64CbhInCXRNi8qW75vk7SNuT44CNQc8sDkevySec
	/GBeq44pQ32EwHUI+ptzlXrz098Y7+33AZqfkKg2/0EAFMY19P/4V0UUuX9WdHIAfX6Q3ESlNanJs
	gNUgrcyrWtojIH7YLto7wapRR9hNrNJmf92NU7tvq6zISIM7c76pCzeGzAAaurGjmj/ArkZfL9NP9
	6MmaFINhrtHSulzT+hdXzXWzeIg2msmyZ45gsu1ZwGQEcCTb5V8p7SMlYZinNIWk1KZrbmX2Id5tL
	4goxkjUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzPf-0000000EE0n-21CC;
	Tue, 07 Jul 2026 06:36:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzPe-0000000EE0f-2t35
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 06:36:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22F2143BD9;
	Tue,  7 Jul 2026 06:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74181F000E9;
	Tue,  7 Jul 2026 06:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783406170;
	bh=VA6hRI3hbiq0ArbSD1G7iFQw3+knszMjw4fdTdB16GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GBMMQ+hfSSFbdU3T0z9wE/HVRIq7VvYl/FgG0nW2om20zFQ0ctNNZYTL5j+27HVas
	 F5GdlMJv8AS0sAUCcK9epMGD40oNeghDnf2stZteCOJpQKSAf/ZMJTNPrw6H6KIY6/
	 sM1wJr2VzFLWjWMdMYMYFt6Ov+CVRZ5LKHZ3RV6eNdaVRR8vv4fRXZ/17e3AoiZezN
	 ZFFhg0qoyUHT5OFkfosUcON3pXWMm4HmEF4hhcBnhbzRIkkWcYq92u3hvsLP5/bU68
	 qzHZ5ePPZwZT/fMgQ476BsGX0SwF3vg9+A2G2FJNjpUj4XcDYs1Z5fSGHaFQCLfZdI
	 e26Q2TII9nV0Q==
Date: Mon, 6 Jul 2026 23:36:08 -0700
From: Oliver Upton <oupton@kernel.org>
To: Tangnianyao <tangnianyao@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, "guoyang (C)" <guoyang2@huawei.com>,
	"huanglingyan (A)" <huanglingyan2@huawei.com>,
	"Wangzhou (B)" <wangzhou1@hisilicon.com>
Subject: Re: Question about the "TLBs and I-cache are private to each vCPU"
 guarantee with VTTBR_EL2.CnP
Message-ID: <akyeWPzrMDuAGRXP@kernel.org>
References: <e85b957d-c8bc-aac0-b413-03441d05c3df@huawei.com>
 <xx4obnrmf6lp5dbyo2uwn4pglq7q5nw7ccoyude4zavrgejctg@ll25qpga7qef>
 <292b5734-9005-6db0-da08-3da04628e620@huawei.com>
 <86o6gkpokm.wl-maz@kernel.org>
 <21eb51aa-443c-4d08-b4dd-3f813bbc9880@huawei.com>
 <86jyr8pkw8.wl-maz@kernel.org>
 <5685cdb9-95d8-9ead-4d24-d6ad06dd9547@huawei.com>
 <akvKvePWiu4pB47Q@J2N7QTR9R3.cambridge.arm.com>
 <7d97b19a-ef56-dea1-cd99-056e0e34a7fa@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d97b19a-ef56-dea1-cd99-056e0e34a7fa@huawei.com>
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

On Tue, Jul 07, 2026 at 10:41:35AM +0800, Tangnianyao wrote:
> On 7/6/2026 23:33, Mark Rutland wrote:
> > If *both* of the vCPUs set TTBRn_EL1.CnP, then surely that is
> > indistinguishable from physical CPUs:
> >
> >     PE0(core0,smt0)         PE1(core0,smt1)
> >     cpu0 va->pa0        
> >                             cpu1 flush local tlb
> >                             cpu1 modify desc to va->pa1
> >     cpu0 hit *va->pa1*
> >
> > Mark. 
> >
> > .
> >
> Thanks for the clarification.
> Stage-1 CnP determines whether Stage-1 translation entries may be shared
> across vCPUs, and the hardware is responsible for enforcing the
> architectural semantics.
> 
> Given that, why does KVM still need to guarantee that TLBs are private to
> each vCPU?
> 
> Assuming VTTBR_EL2.CnP == 1:
> If TTBRx_EL1.CnP == 1, the guest is responsible for ensuring that the
> translations referenced by TTBRx_EL1 are shareable, as required by the
> architecture.
> If TTBRx_EL1.CnP == 0, the hardware must ensure that Stage-1 translations
> are not shared, again according to the architectural definition.
> 
> The reason I'm asking is the potential performance impact. In a scenario
> where multiple vCPUs of the same VM are scheduled onto a single PE, this
> TLB flush may prevent a vCPU from reusing its previously populated
> translation entries, potentially increasing TLB misses.

The problem is you can't infer the state of the TLB based on the current
value of CnP at stage-1. CnP only applies to the current TTBR;
nothing stops the guest from using a mix of CnP=0/1 for different TTBRs.

KVM still needs to invalidate in the case that the PE retained a CnP=0
TLB entry for a different stage-1 context than the one configured at
the time of vcpu_load().

Thanks,
Oliver

