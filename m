Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CECFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=MXM42XRsNruvqY2Vgb884XDt0as+6A4qsiGUbLElGzc=; b=CdrsvvIKyt2hhb
	EikkZq8LDJ5OJW68eelOB3+b29cTYULqZDuIJi0p9zm63W05I6gL0hxvcRPTe8oS4ZYPicVqtJG7x
	VE79+GUalrcAQq6JzEdXpBobK1ELEYbAa8DBd0pWT5oOlcdCh1y0pxQHxawXqVuewaipV9xJXzvCL
	EX1R8R7eaQUIAKF3kt06YliryD2rbbXUXVhzI0DuOw3kNNkJkcvDJU4JzkUTU3juRVGwgnWy4Sq7G
	ZrafKngFJRxMPYz0TWQKyv5wX2/VrrxRaM3LQcE6VWDS+gZqxUiDTd6fjVoQ9aGz4k7yabB0yyy9A
	f3xpu8txZ62vdXPj1URQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqvc-0000000Ddyt-0cxP;
	Mon, 06 Jul 2026 21:32:36 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqva-0000000DdyU-1XVi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:32:35 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-7e6b73b3920so2451825a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783373553; x=1783978353; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MXM42XRsNruvqY2Vgb884XDt0as+6A4qsiGUbLElGzc=;
        b=ortFWmJaURT1UVXRbOQD0EmJYV3tmuEROJdRgFgmKs8/lfnVmZ582Yod99eJSL4gz6
         GxjTD8yMEHMx+bXo20d+KYaAslSnGl1VSb2GZhmcZNjqjADKTDTlxuar5Q/Khsy0Bvce
         JoTTaCrysJhM+aUwwmBL/4kkZgY96Hk22Ob9JIWpUHOhogke8IgAXN4JVwHSt0hXvagO
         q2/g5bcdjuRK5K0uBPZGwdWhen+xvX2tnWIYQFUbwuFExybi/kjhl0Wcq0cJ6Ei8fN2d
         LLLUwZlodR8V0lZQgl8xmXapHOgUhTdJrbS8Bwq8HIw7yeKOnakykOtWyyVWMk3OgN6x
         qluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373553; x=1783978353;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXM42XRsNruvqY2Vgb884XDt0as+6A4qsiGUbLElGzc=;
        b=EoIirXODUArtifoLF0a0ZXRB092EB7HJ+qxOD4BmsYwkfMzvAmaimafpk4+wYvcFlo
         PzWLNOz1sM+2BPTDRCXtS8QkHiuK33BZVgBgWiT1qHT0MOnHrxOPNxWdBk7+WfUrN+aD
         LsZbHnGmP3oev1xYa/vxXftfn4z/JN4ebQ6U8n95jQJX1mvKobrbgBzRaQo6rSIoahr+
         NOrlz9vVtmV2fCj4HHjRtx3E7GF6Z+zBdTlIryk7g6XYgv8Jw3w6nJ8wd5KjFKQ8RvFR
         ArPylAeYS1nn5dhx6ME0mwrtQHXbvtdjyylUq6lmAogNNDoNmTfR2uG3ss160nn3DbvN
         fIWw==
X-Forwarded-Encrypted: i=1; AFNElJ+b8ajtZjnnqghm07xGINbZfZd+POFZYiN9S86M0445RiJeTVzMtF6eLV15qrR9APfIO2rtcr2ubzlFq1JHEl6H@lists.infradead.org
X-Gm-Message-State: AOJu0YzWHcJCNnNhHg5Bz5dCILw3FAsfXrD2UCpME8znx9SZT2f8VCV0
	DEja890FMGW5OE0EH80TZnl1T9ZHSI5NI0ZMthb5IWt0kuBbMDjSTEzgJ4epiWB7nEnMnCAz3J7
	PAJwj8gZAR/mRXmBQRaAwrO3Yug==
X-Received: from iljr8.prod.google.com ([2002:a05:6e02:1088:b0:503:bc46:aeaf])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:178d:b0:6a2:92a3:d1e7 with SMTP id 006d021491bc7-6a3554fa67amr1473951eaf.3.1783373552699;
 Mon, 06 Jul 2026 14:32:32 -0700 (PDT)
Date: Mon, 06 Jul 2026 21:32:32 +0000
In-Reply-To: <akWqXBJrJ1n34BQ5@kernel.org> (message from Oliver Upton on Wed,
 1 Jul 2026 17:01:32 -0700)
Mime-Version: 1.0
Message-ID: <gsnto6gj6byn.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 0/5] Backport ARM64 VHE boot fixes to 6.6.y
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: stable@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mizhang@google.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_143234_411546_952BA90D 
X-CRM114-Status: GOOD (  21.74  )
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

Oliver Upton <oupton@kernel.org> writes:

> Circling back around...

> On Wed, Jul 01, 2026 at 04:23:21PM -0700, Oliver Upton wrote:
>> The subject prefix should be "[PATCH 6.6 0/5]" so people know right up
>> front where this is going.

>> On Wed, Jul 01, 2026 at 08:43:37PM +0000, Colton Lewis wrote:
>> > This series backports VHE CPU boot fixes to the 6.6.y stable branch.
>> >
>> > These fixes are already present in the 6.12.y stable branch (and
>> > newer), but are missing in 6.6.y. They are required to enable booting
>> > L1 guests with nested virtualization enabled (kvm-arm.mode=nested).

>> It's a bit worse than this. The architecture retroactively made
>> FEAT_E2H0 an optional feature, there are now implementations in the wild
>> that do not support the feature.

>> > Without these patches, a 6.6.y guest boots with HCR_EL2.E2H
>> > incorrectly configured (because it misses VHE-only detection or early
>> > initialization), causing early boot hangs/trap loops.
>> >
>> > Conflict resolutions:
>> > - Patch 4 (KVM: arm64: Initialize HCR_EL2.E2H early) had conflicts in
>> >   arch/arm64/kvm/hyp/nvhe/hyp-init.S due to differences in state
>> >   initialization. Resolved by extracting EL2 state initialization into
>> >   __kvm_init_el2_state.
>> > - Patch 5 (arm64: Revamp HCR_EL2.E2H RES1 detection) had conflicts in
>> >   arch/arm64/include/asm/el2_setup.h. Resolved by using raw msr hcr_el2
>> >   instead of the missing msr_hcr_el2 macro.
>> >
>> >
>> > Marc Zyngier (4):
>> >   arm64: sysreg: Add layout for ID_AA64MMFR4_EL1
>> >   arm64: Treat HCR_EL2.E2H as RES1 when ID_AA64MMFR4_EL1.E2H0 is
>> >     negative
>> >   arm64: Fix early handling of FEAT_E2H0 not being implemented
>> >   arm64: Revamp HCR_EL2.E2H RES1 detection
>> >
>> > Mark Rutland (1):
>> >   KVM: arm64: Initialize HCR_EL2.E2H early

> Please go through and correct all of the SHA1s for the cherry-picks,
> smells like some LLM just hallucinated some bits given how close they
> are to the real deal.

That is what happened. Sorry about that. I thought I double checked
those but I missed at least one.

> I also want to see that all KVM modes have been tested (nVHE, hVHE, VHE,
> protected) before this gets picked up. Overall though taking this to
> stable seems like the right thing to do.

I'll make sure to test all those modes.

> Any reason why you've only done 6.6? The kernel was first aware of
> E2H=RES1 as far back as 5.13.

My reason for only doing 6.6 is when I tried to boot an L1 nested guest
with these patches on 6.1 I ran into another boot hang I haven't yet
debugged, and I didn't see the point in applying to 6.1 or earlier if
it's not enabling the behavior we want.

> Thanks,
> Oliver

