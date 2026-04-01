Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FFE107637E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 14:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UupDMjAJp4yzINA6QJU8md4qmWt8WCECZVr4ci6ye1I=; b=VGwRAf6dKuq9syfLTbM9AgNQT+
	/m9eHONNK6c9hTzUjj7JmyhiK8W0a2Xr3OUQaCBp4KZaaod9BI6HDO4qoakfrOKpDcnw/fpLem5HE
	WJdvFVLiZtLc509fwd70A4B/g0Ou3HFtyyff1WYGFd60FuytYmD7PafGIHHH/xFlJp4A3sfm7GnCa
	cheM8uV2iMj6x3TV0Gyf4HXsLrnrn9FrSp0PdnOF5cUsHVHGG6FTKYlGFTbFs5TwQBKGfmHzngBcZ
	iDeQyl6IjcbI+zJonwSjCNA+r25lEFLwnctrQb3rCh6EEPKXEHFq4H11KCbBwI+Pcb6hIlFNoP/n8
	ehvA8ZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wc9-0000000FV2k-048I;
	Wed, 01 Apr 2026 14:32:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wc6-0000000FV2P-1bXF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 14:32:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45B7931DB;
	Wed,  1 Apr 2026 07:32:02 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 575E33F641;
	Wed,  1 Apr 2026 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775053927; bh=Q5Skf/Q0cN2o/FcGvISUP7ojEcZPEcIVT4XxZbbG56U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ocjoGJEIuL/I405PfYBiKYb3mKbyYL+3xOsmXuBWe0APxYaSuqgvVZoVmazTed82h
	 BV4doXjYNU9Ujd1jqab/F4/Xg9rCDNWb1SnLoJde/jRnIwzo/7NSKNPEBTlreoPo9x
	 BZA/EdfxOqa48ogaOFhzyRSJ335fUzjHABgnuyWA=
Date: Wed, 1 Apr 2026 15:31:59 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>, kernel-team@android.com,
	linux-hardening@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Carlos Llamas <cmllamas@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Will McVicker <willmcvicker@google.com>
Subject: Re: [PATCH v8] arm64: Use static call trampolines when kCFI is
 enabled
Message-ID: <ac0sX46TwAQAChWG@arm.com>
References: <20260331110422.301901-2-ardb+git@google.com>
 <177503506493.2514486.12265333685036392947.b4-ty@kernel.org>
 <2b0b9c69-650c-46bb-8579-4af85c17b8ab@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b0b9c69-650c-46bb-8579-4af85c17b8ab@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_073210_662239_28190130 
X-CRM114-Status: GOOD (  23.47  )
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

On Wed, Apr 01, 2026 at 02:03:22PM +0200, Ard Biesheuvel wrote:
> 
> On Wed, 1 Apr 2026, at 12:03, Will Deacon wrote:
> > On Tue, 31 Mar 2026 13:04:23 +0200, Ard Biesheuvel wrote:
> >> Implement arm64 support for the 'unoptimized' static call variety, which
> >> routes all calls through a trampoline that performs a tail call to the
> >> chosen function, and wire it up for use when kCFI is enabled. This works
> >> around an issue with kCFI and generic static calls, where the prototypes
> >> of default handlers such as __static_call_nop() and __static_call_ret0()
> >> don't match the expected prototype of the call site, resulting in kCFI
> >> false positives [0].
> >> 
> >> [...]
> >
> > Applied to arm64 (for-next/fixes), thanks!
> >
> > [1/1] arm64: Use static call trampolines when kCFI is enabled
> >       https://git.kernel.org/arm64/c/e70c2335f889
> >
> 
> Thanks,
> 
> I just spotted that the function name gets stringified twice inadvertently.
> 
> E.g., the assembler may see
> 
> .quad "__static_call_return0"
> 
> rather than the intended
> 
> .quad __static_call_return0
> 
> The assembler does not seem to care, and still emits an ABS64 relocation against the correct symbol, but it is definitely unintentional.
> 
> I can send a follow-up fix if you prefer, or you could just tweak the patch in place:
> 
> --- a/arch/arm64/include/asm/static_call.h
> +++ b/arch/arm64/include/asm/static_call.h
> @@ -16,7 +16,7 @@
>             "   .popsection                                     \n" \
>             "   .pushsection .rodata, \"a\"                     \n" \
>             "   .align  3                                       \n" \
> -           "1: .quad   " #target "                             \n" \
> +           "1: .quad   " target "                              \n" \
>             "   .popsection                                     \n")

Not sure Will is going to look at this until next week. I folded it into
the arm64 for-next/fixes branch and pushed out.

-- 
Catalin

