Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B5FCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 19:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00u0fNz3bWpllwVWiXvs/q7EItAM6xFzqP7BO4pPgFg=; b=PpmGFcf8hl4Q3cE/EVexzOCnxg
	msKdjy0qVq7LRS7/BEBs2RCgRovxgBVeqeK9WISKv1kdXx+bzeoG2ZJh0N5PcDVxQyjVVFOupj2Mi
	aoB8UEgwkT8AbMFo7YjrfWNsHyDAq13A5KbLDfMZ4NbJ0nZaemHbzKvWLZMkvqGqBO7i2IXVPDUVb
	j03HQCmUZCWf2359yzCdrmTZmdzjRi1tZum1aUAPUKGuv2I++9ginjgCchqS6aGmUQ+ahQUFWSfH+
	cFFq+E66wD+dzC98ksqwtg8+ZWiDMK5wnGuNWeDFJrogHIS0KucouaRKLbj0hdLG4DVIJVFDv8SEh
	Fdze1/Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMsQO-00000000BGs-14WH;
	Tue, 12 May 2026 19:05:48 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMsQL-00000000BFz-3JuT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 19:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=00u0fNz3bWpllwVWiXvs/q7EItAM6xFzqP7BO4pPgFg=; b=Eg5eq0ofQPoWkiwwJGo2qJSBCd
	+FeS7Xf4fNJv1sNiBgVfW6bunQxTcFYpdQMV1zsFhL49WeTt1MkBQv4KpmW5x1jXioE0f919m2VES
	9/YYdpJIhtswBJ2HOUfZzKBX0q6sPxstNKihRA3DH6mrK+O802RZE6Yxi6wegiiqDw0471Eododd3
	lqef7+ZDA84Esn9zfmqN0roJg8Ss6zLuaA20ozki5fpt3AdQLF8PHMH1uZ5fhcwRKfB47/GuI3x9P
	ZVbj2ihNSiMJEAmeAehCF8LqbNW5adZg1GsKHRS7XhmU5Wlh/A2cQpt6CjCbwqPpzZUNyu74+TNll
	2lPt4nhA==;
Date: Tue, 12 May 2026 21:05:27 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mithil Bavishi <bavishimithil@gmail.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Russell King
 <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, Kees Cook
 <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: Make OMAP4 finish_suspend callback
 CFI-safe
Message-ID: <20260512210527.02381e0e@kemnade.info>
In-Reply-To: <20260512135757.GB570003@ax162>
References: <20260512042341.1452-1-bavishimithil@gmail.com>
	<20260512073442.GA570003@ax162>
	<20260512100207.3d24837e@kemnade.info>
	<20260512135757.GB570003@ax162>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_120545_840728_6D775A35 
X-CRM114-Status: GOOD (  22.33  )
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

On Tue, 12 May 2026 22:57:57 +0900
Nathan Chancellor <nathan@kernel.org> wrote:

> On Tue, May 12, 2026 at 10:02:07AM +0200, Andreas Kemnade wrote:
> > On Tue, 12 May 2026 16:34:42 +0900
> > Nathan Chancellor <nathan@kernel.org> wrote:
> >   
> > > On Tue, May 12, 2026 at 12:23:41AM -0400, Mithil Bavishi wrote:  
> > > > With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
> > > > because omap_pm_ops.finish_suspend points directly to the assembly
> > > > routine omap4_finish_suspend, which lacks the expected KCFI type
> > > > metadata.    
> > > 
> > > It sounds like omap4_finish_suspend() should be defined with
> > > SYM_TYPED_FUNC_START then? Is that the case for all of the other
> > > functions that are added to omap_pm_ops?
> > >   
> > omap_cpu_resume: the address is written to some cpu register and
> > on that way casted to u32. So therefore does not trigger CFI.
> > Same for secondary_startup which is also assembler code.
> > scu_prepare is C.
> > 
> > DO you have a pointer to any documentation:
> > :~/linux$ grep -R SYM_TYPED_FUNC_START Documentation/  
> 
> I don't think we have any formal documentation for SYM_TYPED_FUNC_START
> (it should probably be documented via kernel-doc?) but you can read the
> commit message of the change that added it for more information:
> 
>   e84e008e7b02 ("cfi: Add type helper macros")
> 
Ok, I found what is the missing piece of the puzzle in my head:
"
In order to make this easier, the compiler emits a
    __kcfi_typeid_<function> symbol for each address-taken function
    declaration in C, which contains the expected type identifier that
    we can refer to in assembly code.
"
So time to look into my backyard if anything more is there.

Regards,
Andreas

