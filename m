Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1673C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJJ3rvH96jfH7HjWknKZbz82wIRHH2RKrLCdelmI5J8=; b=Lhg2XEgXHd1ZETpebfFQ0C+zUi
	lRcJFSU2EcA0X7ks4kLn41IMwgVzhbxDrpEaFICfkeHXZTSyGaBYuO1v/h82Uts36L9IAJ99NSWaI
	gcPfTmW1Nf0NnEpkhJ6ijWILmeX7DqZjLfPrTTnLLy00gqGtcIZyDHS0712iefBhUV7R6L5oD/viC
	kqOrPO3V2jqHoK6zw+KI1iwMhW9/gFNxsLACgnHZsGhX7IFDt0pidd4uTm5V7owtLJCmkCHaC+W0E
	rjctLHBroxBALPywNKaA8lGbBwLZvpK3+blFF+4pL4lA9Vws+gTy4Lr1R7zidMlcHtppVKICvep9P
	KWMcuKPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgl65-0000000CrjA-46EK;
	Mon, 06 Jul 2026 15:19:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgl64-0000000Crj0-0LTW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:19:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 407A1600AE;
	Mon,  6 Jul 2026 15:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FEE1F000E9;
	Mon,  6 Jul 2026 15:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783351139;
	bh=eJJ3rvH96jfH7HjWknKZbz82wIRHH2RKrLCdelmI5J8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C6BYkVFJHX6A1VEPT5mQ0tlXcYmjOWDyoBg6YMcHWGE1q4Y13E1pOvLE18YjW6Jj3
	 UM4ByFlZGrTSybPjJw/9zHEDgDtozySUI+SFpbQnvYQlwcmFlHzn8yTOP/mrwYyPz+
	 DSUYSEdPsmHOugxlfGHQwrgqoiBHcXXyJJUxBykyZdJQ5cVM42wRo9q0UT0Hqdl6UG
	 /lYEyC87FBcUH4VddMQmHMp3+ksfutsNVJUVR1nTH1VcYjh+Qf1MFTQ9MzY5wZuouo
	 EQYtio/NL0599nwDhtUYKgBf13lvRinxTPvvwYyNzUTckYvy66ih09uxuLQPEeKu9F
	 Eez1DZa+yFcqA==
Date: Mon, 6 Jul 2026 16:18:52 +0100
From: Will Deacon <will@kernel.org>
To: Tangnianyao <tangnianyao@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, Wei-Lin Chang <weilin.chang@arm.com>,
	oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	"guoyang (C)" <guoyang2@huawei.com>,
	"huanglingyan (A)" <huanglingyan2@huawei.com>,
	"Wangzhou (B)" <wangzhou1@hisilicon.com>
Subject: Re: Question about the "TLBs and I-cache are private to each vCPU"
 guarantee with VTTBR_EL2.CnP
Message-ID: <akvHXN6Gynjw1n8m@willie-the-truck>
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

For that to be observable, I think both PEs must be configured with CnP
enabled.

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

If they're "supposed to be private", why have the vCPUs configured CnP
at stage-1?

Will

