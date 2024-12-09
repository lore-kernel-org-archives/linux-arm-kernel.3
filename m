Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D828E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vm/TBp0Ce4O4LQiS6ttXnOUEbYFw8BKRqFJOuaIMtQc=; b=CKgcrnASDKjODVSYWa8n1e1gKR
	U5FKm6OkyUcsZnEnVSWGccLoIqPxcvxesuJGr5F1dD3Qls7EiU3RFqbOUTem5VPkdOTQ43Ge+3eH7
	XWfWeeDieJEmabzX7knkJVuQzCwi08D0rkqRqQY4GPBD9QepxMcNRRwasguscL720wB3V45ZcKfpV
	tvsSB7BgTLdUMl352W6Lu3q/M2C2Yx/REgvbH3I1qee6VB7it/lD4T0LN+CnTN0vHCsq70Hi+IAsl
	1//hvpJlFvdob02FIvBBSm2XHaG2laDBJN20eTZZkbkpb7gylHNU4V4bjLfI795S7IIJjQB5BWkXw
	IOeWWNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKehg-00000008CEH-045k;
	Mon, 09 Dec 2024 14:25:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKegc-00000008C03-0PTI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 14:24:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69FD91650;
	Mon,  9 Dec 2024 06:24:59 -0800 (PST)
Received: from T9219K2H65.arm.com (unknown [10.119.39.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0FBC3F720;
	Mon,  9 Dec 2024 06:24:30 -0800 (PST)
From: Chase Conklin <chase.conklin@arm.com>
To: maz@kernel.org
Cc: andersson@kernel.org,
	christoffer.dall@arm.com,
	joey.gouly@arm.com,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH 00/11] KVM: arm64: Add NV timer support
Date: Mon,  9 Dec 2024 08:24:29 -0600
Message-Id: <20241209142429.882-1-chase.conklin@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241202172134.384923-1-maz@kernel.org>
References: <20241202172134.384923-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_062434_175306_426ACEB4 
X-CRM114-Status: GOOD (  26.09  )
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

Hi Marc,

On Mon, 2 Dec 2024 17:21:23 +0000, Marc Zyngier <maz@kernel.org> wrote: 
> Here's another batch of NV-related patches, this time bringing in most
> of the timer support for EL2 as well as nested guests.
> 
> The code is pretty convoluted for a bunch of reasons:
> 
> - FEAT_NV2 breaks the timer semantics by redirecting HW controls to
>   memory, meaning that a guest could setup a timer and never see it
>   firing until the next exit
> 
> - We go try hard to reflect the timer state in memory, but that's not
>   great.
> 
> - With FEAT_ECV, we can finally correctly emulate the virtual timer,
>   but this emulation is pretty costly
> 
> - As a way to make things suck less, we handle timer reads as early as
>   possible, and only defer writes to the normal trap handling
> 
> - Finally, some implementations are badly broken, and require some
>   hand-holding, irrespective of NV support. So we try and reuse the NV
>   infrastructure to make them usable. This could be further optimised,
>   but I'm running out of patience for this sort of HW.
> 
> What this is not implementing is support for CNTPOFF_EL2. It appears
> that the architecture doesn't let you correctly emulate it, so I guess
> this will be trap/emulate for the foreseeable future.
> 
> This series is on top of v6.13-rc1, and has been tested on my usual M2
> setup, but also on a Snapdragon X1 Elite devkit. I would like to thank
> Qualcomm for the free hardware with no strings (nor support) attached!
> 
> If you are feeling brave, you can run the whole thing from [1].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/nv-next
>

I was feeling brave, and I think I see an issue in the cpufeature change
in the kvm-arm64/nv-e2h-select branch that's a part of
kvm-arm64/nv-next. In d75a4820a897 ("arm64: cpufeature: Handle NV_frac as a synonym of NV2"),
I don't see NV_frac being added to the FTR bits. I believe that means it
will get sanitized out and consequently not seen by the NV feature
detection code. Does that commit also need:

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9fa8bd77ae0..f97459e160b 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -480,6 +480,7 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr3[] = {

 static const struct arm64_ftr_bits ftr_id_aa64mmfr4[] = {
        S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR4_EL1_E2H0_SHIFT, 4, 0),
+       S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR4_EL1_NV_frac_SHIFT, 4, 0),
        ARM64_FTR_END,
 };

Thanks,
Chase

