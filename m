Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5726BC5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 00:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98aVebFo2ZoGfQEah6KnP9OcE5j2THfDpj4TyKk+wKM=; b=QwCfUP6Lw0yGzAD8TT5ZCyobmr
	M3kWnRittn8thMR9Qr7u+R5dBZJVmjtw26Qw4tBfMQcqt3VQagVNx4H3gdHLaRFBnxBZgr45uij6D
	qWx+SmLOp3XP+G8PpCH8o9OskDt7ciDCNBlCzWJfkzSgzPu1YpzRXSjrCMAWH8VfBEZbZ2La0eb41
	PrMQ8qhwjfWbAjxu/rYWbd+dhHmOcivKm77oMFTKUw275KF5QmxcfC3Y/2AO86PtA26GeU1/P6xBA
	WJnGfdMnpe2qSoMZ5gMdUGL0/9E8jtPh/DR27/ti4TuvjPxLHCOfH196rOhh1olzrxInubianfAgO
	L9IsrkIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsV7j-00000008vQH-38Pf;
	Sat, 08 Aug 2026 00:41:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsV7i-00000008vPs-0V9N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 00:41:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B34B940B56;
	Sat,  8 Aug 2026 00:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53AA1F000E9;
	Sat,  8 Aug 2026 00:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786149672;
	bh=98aVebFo2ZoGfQEah6KnP9OcE5j2THfDpj4TyKk+wKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mGHeSRHPCALXQ2CKGzJk0XT8cIV1NasjJulNs0XvN+XouLKRIAibTVD3t4a2NJDkV
	 HuRkgSc6LIT/xxrdkhmSLmES1SO2x9w0UkdURNjHVTCbtkwvijiqT3HzCfpOO2DdTw
	 f+iQl6vtkmKmJMxypHbois9i54yMmN8Y/p28QWJdhruxvFcp5iPgNZQens00qek6Tj
	 mlgqaEY2QPR5MkilBGgPPbIQ8rKwjrCkOPnXdJcdN9DSCulD342EtyQGLuZj0WhwP9
	 q8DARi8OzrMXmHfeDLetWjdqV2KADRrubBjZupItcbQEB9yorbT05LU/WjAtft0eKr
	 ZFU2DKQzbzrvA==
Date: Fri, 7 Aug 2026 17:41:10 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: sashiko-bot@kernel.org
Cc: x86@kernel.org, live-patching@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Song Liu <song@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, Miroslav Benes <mbenes@suse.cz>, 
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 19/21] objtool/klp: Introduce objtool for arm64
Message-ID: <7owxhuwmxb2kbaioac5cm3qgqgqezcn6vgz34md47zuvm3ajjj@sgxpuzvuulmm>
References: <5b66146373b1ff1aba1318fd51867dea2eb882f6.1778642121.git.jpoimboe@kernel.org>
 <20260515020845.CE5B2C2BCB3@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515020845.CE5B2C2BCB3@smtp.kernel.org>
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

On Fri, May 15, 2026 at 02:08:45AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The arm64 instruction decoder misclassifies trap instructions (e.g., `brk #0x800` used for `BUG()`) as `INSN_OTHER` instead of `INSN_BUG`.
> --
> 
> commit dd63f0c03bab6a47f34cfcb310454460653638ed
> Author: Josh Poimboeuf <jpoimboe@kernel.org>
> 
> objtool/klp: Introduce objtool for arm64
> 
> This commit adds basic support for arm64 in objtool, initially enabling 
> only the "objtool klp" subcommands.
> 
> > diff --git a/tools/objtool/arch/arm64/decode.c b/tools/objtool/arch/arm64/decode.c
> > new file mode 100644
> > index 0000000000000..47658c76e1af0
> > --- /dev/null
> > +++ b/tools/objtool/arch/arm64/decode.c
> 
> [ ... ]
> 
> > +int arch_decode_instruction(struct objtool_file *file, const struct section *sec,
> > +			    unsigned long offset, unsigned int maxlen,
> > +			    struct instruction *insn)
> > +{
> 
> [ ... ]
> 
> > +	if (ins == 0xd503201f) {
> > +		/* NOP: static branch */
> > +		insn->type = INSN_NOP;
> > +	} else if ((ins & 0xfc000000) == 0x14000000) {
> 
> [ ... ]
> 
> > +	} else if ((ins & 0x7e000000) == 0x36000000) {
> > +		/* TBZ/TBNZ: intra-TU sibling call */
> > +		insn->type = INSN_JUMP_CONDITIONAL;
> > +		insn->immediate = sign_extend64((ins >> 5) & 0x3fff, 13);
> > +	} else {
> > +		insn->type = INSN_OTHER;
> > +	}
> 
> Does this code misclassify trap instructions?
> 
> On arm64, BUG() is implemented using the brk instruction (such as brk #0x800).
> Since the decoder doesn't appear to check for brk, it will fall through to the
> else block and classify it as INSN_OTHER.
> 
> If INSN_BUG is misclassified as a normal instruction, won't this lose dead-end
> propagation and corrupt objtool's control-flow analysis?

Nope, as the comment above this says:

	/*
	 * These are the bare minimum needed for static branch detection and
	 * checksum calculations.
	 */

For arm64 we don't have any reason to care about INSN_BUG.

-- 
Josh

