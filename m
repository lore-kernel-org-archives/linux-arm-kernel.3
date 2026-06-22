Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BDECD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1zc6fACDY3A5wvHcbvKcOrTOihcoi6Hpp6cktnrlbI=; b=pVRdD0hfLSAZ/Ga5gnQiw8L90I
	tpPcL5BNzro/1ZZOeKpnAtxzI5DitqUcnW4LzZnas68Q959fLwuCiGRcnYGUpLmfWeSJ8pGE/g5eB
	QVFz9OiCCWBYkrSnK4ftWyv1xQlvb50SmC3551FRevF2zVwgSfVf8+4uQ+JQiDLnfGCrKqYx+LOHM
	Zz2aZjwOtDwZf6rIWiaTRndPzIOcGdAkcJaw+5FUFvm4XIYmkDOQFTZAmUMTyzJ279g05TxGMA8e/
	/SBdxbLY28J+fVvR+6aMFQM7LGl6px3SndC2mIiwb7xoqTeNO5jjYRq+3Ejtq+1VnUpNFrnbb+vcO
	Dn1zdtJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbfxq-0000000565U-1Sbu;
	Mon, 22 Jun 2026 14:49:30 +0000
Received: from devianza.investici.org ([198.167.222.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbfxm-0000000564m-3Zpa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 14:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1782139762;
	bh=L1zc6fACDY3A5wvHcbvKcOrTOihcoi6Hpp6cktnrlbI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=UCugRXiAHVZcaACZntQUfgXH2WAXOAXe+P+PJZHJBy74IX7aqqX6IDQxE0jFPEyiO
	 b7vyQbeLgyIbYlgr/ZrWOgWB8tWlrNqjG+X0/Ld3BhQztuUs03jj8+c186wSOow5Ii
	 yw5UcNuD4pWDghs2CxYgd3rVJ+hFbinZ/RKliE3Q=
Received: from mx2.investici.org (unknown [127.0.0.1])
	by devianza.investici.org (Postfix) with ESMTP id 4gkWLV4MCsz6vKF;
	Mon, 22 Jun 2026 14:49:22 +0000 (UTC)
Received: by mx2.investici.org (Postfix) id 4gkWLV1J44z4y2q;
	Mon, 22 Jun 2026 14:49:22 +0000 (UTC)
Date: Mon, 22 Jun 2026 15:49:23 +0100
From: Bradley Morgan <include@grrlz.net>
To: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>
CC: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: account pKVM reclaim against the VM mm
In-Reply-To: <86y0g7q6jh.wl-maz@kernel.org>
References: <20260621213155.6019-1-include@grrlz.net> <CA+EHjTztL4O6NH-sNpPywchgER6SswetOCgmaaSGjtKaRtL8XA@mail.gmail.com> <86y0g7q6jh.wl-maz@kernel.org>
Message-ID: <9826F145-3592-4769-A200-3BE8102A6D3A@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_074927_363605_56BD6E0C 
X-CRM114-Status: GOOD (  14.35  )
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

On June 22, 2026 10:16:18 AM GMT+01:00, Marc Zyngier <maz@kernel.org>
wrote:
>On Mon, 22 Jun 2026 09:32:45 +0100,
>Fuad Tabba <fuad.tabba@linux.dev> wrote:
>> 
>> On Sun, 21 Jun 2026 at 22:32, Bradley Morgan <include@grrlz.net> wrote:
>> >
>> > Protected guest faults charge long term pins to the VM's mm. Teardown
>> > can run later from file release, where current->mm may be unrelated.
>> >
>> > Drop the charge from kvm->mm instead.
>> >
>> > Fixes: 4e6e03f9eadd ("KVM: arm64: Hook up reclaim hypercall to
>pkvm_pgtable_stage2_destroy()")
>> > Signed-off-by: Bradley Morgan <include@grrlz.net>
>> 
>> Reproduced by creating a protected VM, running the vCPU to fault in a
>> page, then forking and having the child close the last fd reference.
>> Without the fix, the parent's VmLck leaks (the reclaim decrements the
>> child's mm, which is freed on exit). With the fix the parent's VmLck
>> returns to zero.
>> 
>> One minor observation: account_locked_vm() also passes `current` as
>> the task pointer to __account_locked_vm(), but on the decrement path
>> that is only used in the pr_debug log line, so it is technically wrong
>> but functionally harmless.

I agree with marc here. Maybe awkward.


I tested it on my pixel 7! :)

>I don't think this is wrong. Awkward, maybe. It is just that the
>rlimit check and the accounting may be different contexts, and the
>pr_debug() call covers both inc and dec.
>
>>
>> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
>> Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Thanks for the review! :)

Cheers!

>Thanks,
>
>	M.
>
>

