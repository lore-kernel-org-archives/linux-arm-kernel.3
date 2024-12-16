Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1068E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 11:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/PsmoRvy792kxD8bL4e3toILYMjRBSNGx4CpqeF2xg=; b=JJphgFCvqmU4Xa2HU11Us2pEv2
	1N8/pXTvIWqB5Dsz0dSkH0YiCXrsdvME+io1/12i6Y9m+JahsjNIPOiX+c7k8pa3dDLByDQ1bncwH
	C/ByKsCLcz5MnVVyGjcGFyJ8X384JJ+ZMSAC1rkaozEqXzvx3+YA5tidwKK2McbfcxBJigbZdaKu1
	iTy1eelr0yl/+emWjYltjEJ5lb2+r2jwEvwBJkzFT4tDD1KQunYhjN6nvreMF34gTGsJEG/gv4NOl
	pcmOozmgeEBE4TS0PxETog5G/5I8YscchzQMbXdLxBmvkErp3tQIusr4sKRKHY71W176wYPseJ3Py
	oOn3n2JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN90t-00000009n63-0Dp5;
	Mon, 16 Dec 2024 11:11:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8oA-00000009l1f-098r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:58:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD235113E;
	Mon, 16 Dec 2024 02:59:03 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 901093F720;
	Mon, 16 Dec 2024 02:58:33 -0800 (PST)
Date: Mon, 16 Dec 2024 10:58:29 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH V3 7/7] arm64/hw_breakpoint: Enable FEAT_Debugv8p9
Message-ID: <Z2AH1SN5CipWkkE4@J2N7QTR9R3>
References: <20241216040831.2448257-1-anshuman.khandual@arm.com>
 <20241216040831.2448257-8-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216040831.2448257-8-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_025838_120529_E6364C8A 
X-CRM114-Status: GOOD (  21.65  )
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

On Mon, Dec 16, 2024 at 09:38:31AM +0530, Anshuman Khandual wrote:
> Currently there can be maximum 16 breakpoints, and 16 watchpoints available
> on a given platform - as detected from ID_AA64DFR0_EL1.[BRPs|WRPs] register
> fields. But these breakpoint, and watchpoints can be extended further up to
> 64 via a new arch feature FEAT_Debugv8p9.
> 
> This first enables banked access for the breakpoint and watchpoint register
> set via MDSELR_EL1, extended exceptions via MDSCR_EL1.EMBWE and determining
> available breakpoints and watchpoints in the platform from ID_AA64DFR1_EL1,
> when FEAT_Debugv8p9 is enabled.

[...]

> +static u64 read_wb_reg(int reg, int n)
> +{
> +	unsigned long flags;
> +	u64 val;
> +
> +	if (!is_debug_v8p9_enabled())
> +		return __read_wb_reg(reg, n);
> +
> +	/*
> +	 * Bank selection in MDSELR_EL1, followed by an indexed read from
> +	 * breakpoint (or watchpoint) registers cannot be interrupted, as
> +	 * that might cause misread from the wrong targets instead. Hence
> +	 * this requires mutual exclusion.
> +	 */
> +	local_irq_save(flags);
> +	write_sysreg_s(SYS_FIELD_PREP(MDSELR_EL1, BANK, n / MAX_PER_BANK), SYS_MDSELR_EL1);
> +	isb();
> +	val = __read_wb_reg(reg, n % MAX_PER_BANK);
> +	local_irq_restore(flags);
> +	return val;
> +}
>  NOKPROBE_SYMBOL(read_wb_reg);

I don't believe that disabling interrupts here is sufficient. On the
last version I asked about the case of racing with a watchpoint handler:

| For example, what prevents watchpoint_handler() from firing in the
| middle of arch_install_hw_breakpoint() or
| arch_uninstall_hw_breakpoint()?

... and disabling interrupts cannot prevent that, because
local_irq_{save,restore}() do not affect the behaviour of watchpoints or
breakpoints.

Please can you try to answer the questions I asked last time, i.e.

| What prevents a race with an exception handler? e.g. 
| 
| * Does the structure of the code prevent that somehow?
| 
| * What context(s) does this code execute in?
|   - Are debug exceptions always masked?
|   - Do we disable breakpoints/watchpoints around (some) manipulation of
|     the relevant registers?

... and the question form the earlier comment, i.e.

| Is the existing code correct?

I suspect that the existing code might not have the necessary mutual
exclusion in all cases, but it's difficult to trigger an issue by
accident. Is there any way a handler could race with some other
manipulation of watchpoints/breakpoints such that some data structure
gets corrupted, or such that the kernel deadlocks?

Mark.

