Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307C1CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjsKnx6myc+SjSVfljlFz1uoxxYpQs+XjVirkwIqzsU=; b=5C44s0tXP2kVxK9FG2pVxGjDnT
	hXqrXBWzMo62YNab8NqPFSEjSeZfe0SAIjZBtTci13pQqFiSFydQJdSQyWJOvJ4cvkmSC1hSksP7j
	fuoV9nRG49IXee+O4YnPHWTHudYaf6APfZygSvSiyRdNEnpA6SZLGw9eoWV9/cTjxtLRdkLk5sDSI
	jkgQa+ji7D8RVs66KAUJrLSg47TcPct7TzdLHGRvtkMXbA4ZMV1YQRldzHWBTUDqrtTrzgIW9cSWm
	Dt5lQlJD4/MHiS9mrPxkXMi8tgSZwyfF4qyF2pawRF8+V65jszSV0xMuRw5pnBegutL5qdahAP2dV
	nq5fS42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJE8-0000000H1wB-3Gth;
	Fri, 07 Nov 2025 09:57:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJE6-0000000H1vM-0rqv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:57:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53BF714BF;
	Fri,  7 Nov 2025 01:57:39 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B3523F66E;
	Fri,  7 Nov 2025 01:57:45 -0800 (PST)
Date: Fri, 7 Nov 2025 09:57:40 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dylan Hatch <dylanbhatch@google.com>,
	Fanqin Cui <cuifq1@chinatelecom.cn>
Subject: Re: [PATCH v2 2/2] arch: arm64: Reject modules with internal
 alternative callbacks
Message-ID: <aQ3ClNpcT-YBlvnG@J2N7QTR9R3>
References: <20250922130427.2904977-1-abarnas@google.com>
 <20250922130427.2904977-3-abarnas@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250922130427.2904977-3-abarnas@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_015750_286796_49AFA8F1 
X-CRM114-Status: GOOD (  18.26  )
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

On Mon, Sep 22, 2025 at 01:04:27PM +0000, Adrian Barnaś wrote:
> During module loading, check if a callback function used by the
> alternatives specified in the '.altinstruction' ELF section (if present)
> is located in core kernel .text. If not fail module loading before
> callback is called.
> 
> Reported-by: Fanqin Cui <cuifq1@chinatelecom.cn>
> Closes: https://lore.kernel.org/all/20250807072700.348514-1-fanqincui@163.com/
> Signed-off-by: Adrian Barnaś <abarnas@google.com>
> ---
>  arch/arm64/include/asm/alternative.h |  7 +++++--
>  arch/arm64/kernel/alternative.c      | 19 ++++++++++++-------
>  arch/arm64/kernel/module.c           |  9 +++++++--
>  3 files changed, 24 insertions(+), 11 deletions(-)

[...]

> @@ -166,10 +166,13 @@ static void __apply_alternatives(const struct alt_region *region,
>  		updptr = is_module ? origptr : lm_alias(origptr);
>  		nr_inst = alt->orig_len / AARCH64_INSN_SIZE;
>  
> -		if (ALT_HAS_CB(alt))
> +		if (ALT_HAS_CB(alt)) {
>  			alt_cb  = ALT_REPL_PTR(alt);
> -		else
> +			if (!core_kernel_text((unsigned long)alt_cb))
> +				return -ENOEXEC;
> +		} else {
>  			alt_cb = patch_alternative;
> +		}

There's an existing noinstr safety issue there that this makes a bit
worse.

The core_kernel_text() function is instrumentable, and so for
(non-module) alternatives, calling that in the middle of patching isn't
safe (as it could lead to calling arbitrary C code mid-patching).

That said, __apply_alternatives() aren't marked as noinstr, and cleaning
that up properly is going to require some major rework. I don't think we
want to block this patch on that.

I think we can bodge around the worst of that for now with:

	if (is_module && !core_kernel_text((unsigned long)alt_cb))
		return -ENOEXEC;

... which'll avoid calling out to other instrumentable code during the
patching sequence, and minimize the risk of that blowing up during boot.

I'll see about prioritizing a follow-up to fix the extant issues more
thoroughly.

Will, are you happy to add the 'is module &&' part to the condition?

Mark.

