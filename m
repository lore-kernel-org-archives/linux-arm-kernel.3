Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7ABD4694F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UedYq8FtO+S0opF2vMXtHgmko/W13/M6+cgttZROYtQ=; b=0ASfme9/Tg6tNYsX6WDfu5Yckh
	WyVZRu5OBohCQLEsLRVSWj3rYG+uKDBeKaiwFsTagdsDCzitqkhg4euGCudmTf2z4WkVRem1WtfQm
	HidKV6w27/A5iMHGZ2VUvh2bR35fujJR5SCzcSULOrqXrkpuY6vve4NhArAxrzjkhwYWuHV60jMZP
	K5PC7DINwG1Vlp3y74KDfQYcJ0c3e2oyFIRFnIBhzXxHjRptW6416Q1vFupRatan6OTRAgT1Iz+WO
	ds7i+DabMQnNQGHwZkqWiJoSbAX7tsOXAACxoQBVGc7r8ExCBa6tkud7JGYVGKbQup4IfCma8Hyqo
	fH60NnKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viags-00000005lPm-25Cb;
	Wed, 21 Jan 2026 16:04:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viagp-00000005lOy-2T2n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:04:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECA3B1476;
	Wed, 21 Jan 2026 08:04:05 -0800 (PST)
Received: from [10.57.49.179] (unknown [10.57.49.179])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 240CA3F694;
	Wed, 21 Jan 2026 08:04:10 -0800 (PST)
Message-ID: <6bffe794-b5d5-421e-9091-594201bb3b6d@arm.com>
Date: Wed, 21 Jan 2026 17:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: poe: fix stale POR_EL0 values for ptrace
To: Mark Rutland <mark.rutland@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org,
 david.spickett@arm.com, stable@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20260121135639.1835784-1-joey.gouly@arm.com>
 <4f4b9dd9-02ed-4899-b17d-24415e50e5c3@arm.com> <aXDynm0YGuNzi7B3@J2N7QTR9R3>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <aXDynm0YGuNzi7B3@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_080415_717103_C3895087 
X-CRM114-Status: GOOD (  22.13  )
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

On 21/01/2026 16:37, Mark Rutland wrote:
> On Wed, Jan 21, 2026 at 03:59:22PM +0100, Kevin Brodsky wrote:
>> On 21/01/2026 14:56, Joey Gouly wrote:
>>> If a process wrote to POR_EL0 and then crashed before a context switch
>>> happened, the coredump would contain an incorrect value for POR_EL0.
>> Isn't that also a problem if using ptrace(PTRACE_GETREGSET, REGSET_POE)?
> In the case of manipulating a tracee (i.e. target != current), the core
> code ensures that the tracee is stopped (has context-switched out, an
> hence has saved its registrer contents to memory) before the relevant
> regset functions can be called.

Right, hadn't thought that through!

>> Just like for fpsimd, etc.
> Just FYI, The FPSIMD/SVE/SME registers are a special case relative to
> all the other regsets.
>
> The FPSIMD/SVE/SME registers eagerly saved to memory (and so when a task
> is scheduled out, the value in memory will be up-to-date), but they're
> lazily restored (so the value in registers can be transiently stale
> while the task is running), and there's a special case when scheduling a
> task in where we attempt to spot if the CPU registers happen to be
> up-to-date with the task.
>
> The gist of this is that when manipulating the FPSIMD/SVE/SME regsets of
> a task:
>
> * For reads, we know that the value in memory is up-to-date unless the
>   task is the current task.
>
> * For writes (which can only occur for a tracee which is not the current
>   task), we need to update some tracking data to prevent context-switch
>   from reusing stale values on a CPU. That's what
>   fpsimd_flush_task_state() does.
>
> Pretty much all other regsets don't need the "flush" on writes, since
> the value in memory will be loaded when the task is next scheduled in.

That is good to know, thanks! I actually meant to write TLS/TPIDR as
that's a more comparable case (not saved/restored on exception
entry/return), but as you pointed out above a task must be scheduled out
before its register state is inspected so there's no concern here.

- Kevin

