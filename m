Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32B31088E5C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 00:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCP3E6bRClmy3hqOTkzXJ+Tl5D7V/mR8JgM5+dZ2V80=; b=gnM4XF4Yu9AxOaArWGAXPc1Lt4
	J2MnG7zE/kBGNZV0/UpRKaCFwx3nY3LSJAO8SIrCQzo4noEv+dqScAr16aUGxco1wW1+TTMol2Ld/
	Z8I65S2r+IlRXZJaZo1/Q1klNP2/W0Vfqkrb0GVtzplN3hEDUWHBQcd/gBhN72O5Um3RRihdUkcpU
	LonWES0g4PoyFaaJfxLjz6wWoZ5yhu8SPAQgUD63YlHAd8OlZjX61+h0CrBfIK8RsSChFnbxFCRI8
	RiR/mXXNtthzEdmWlFi9c73x6zu9DKrI6cMcOxXTTdbiU93Nf6j0frGeleEioLsguaH1GaU37k1dm
	PJXQ7GRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w31Zt-00000009YwP-3ydI;
	Thu, 19 Mar 2026 00:49:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w31Zr-00000009Yw8-3pEA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 00:49:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C841E60121;
	Thu, 19 Mar 2026 00:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71265C2BC87;
	Thu, 19 Mar 2026 00:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773881370;
	bh=ojPX7kAcg1fQ+0xujOOgF0QYzwR67rBBwSvbHwYLXUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IUqznDJAB/qRHaqLzniXe1UptuuD9+YjvODekdWxrFDYZVmQ4lagksvCEK7wec7TO
	 TPUHTa2ED1DRKp/z3df4AEP6bTTlBs1ULM13USL20ShsiGgGb/QwHFMunmEEGGlcO2
	 95cuJhilFyjOsU9jzsqLOz1Kz3p4c3z+JbT5ixyE9ZSrrnDspU2skwBtR2U7RRErG2
	 5ZRGqjHxTPY60cJ+rhWIEH2PAFxU6anp4lOyISVWtEtzWjXFbQbo4/W+MKu295mBUV
	 oYR+dgWScJbfS1X8Ld2jcUzF95O619RM+CNRvNPCJVj4OZkKe/VY5GEm1BwikchpWs
	 QXlpfeyAugd+w==
Date: Wed, 18 Mar 2026 17:49:27 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v2 07/12] kbuild: Only run objtool if there is at least
 one command
Message-ID: <zdipyf26t2gos5dw2gjyzmeg2zm5a67xwr5ozubnhmhllrwgnm@ezdt54coe2bk>
References: <cover.1773787568.git.jpoimboe@kernel.org>
 <42418c5fa73a8876e91b3dfb38fa3f263e39f1c1.1773787568.git.jpoimboe@kernel.org>
 <absC93h6fNgyniD4@derry.ads.avm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <absC93h6fNgyniD4@derry.ads.avm.de>
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

On Wed, Mar 18, 2026 at 08:54:31PM +0100, Nicolas Schier wrote:
> On Tue, Mar 17, 2026 at 03:51:07PM -0700, Josh Poimboeuf wrote:
> > Split the objtool args into commands and options, such that if no
> > commands have been enabled, objtool doesn't run.
> > 
> > This is in preparation in enabling objtool and klp-build for arm64.
> > 
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > Tested-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> > ---
> >  arch/x86/boot/startup/Makefile |  2 +-
> >  scripts/Makefile.build         |  4 +--
> >  scripts/Makefile.lib           | 46 ++++++++++++++++++----------------
> >  scripts/Makefile.vmlinux_o     | 15 ++++-------
> >  4 files changed, 33 insertions(+), 34 deletions(-)
> > 
> [...]
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 3652b85be545..8a1bdfdb2fdb 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -277,7 +277,7 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
> >  is-standard-object = $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(target-stem).o)$(OBJECT_FILES_NON_STANDARD)n),$(is-kernel-object))
> >  
> >  ifdef CONFIG_OBJTOOL
> > -$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(delay-objtool),$(is-single-obj-m),y))
> > +$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(objtool-cmds-y),$(if $(delay-objtool),$(is-single-obj-m),y)))
> 
> Please use $(and a,b,c) instead of multiple nested $(if $(a),$(if
> $(b),$(c)); as the last variable (is-single-obj-m) is 'y' or empty, the final 'y' can be
> left-out:
> 
> $(obj)/%.o: private objtool-enabled = $(and $(is-standard-object),$(objtool-cmds-y),$(delay-objtool),$(is-single-obj-m))

I believe that would break the !delay-objtool case.  The logic needs to
be something like:

if (is-standard-object && objtool-cmds-y) {
	if (delay-objtool) {
		// for delay-objtool, only enable objtool for single-object modules
		$(is-single-obj-m)
	} else {
		// for !delay-objtool, always enable objtool
		y
	}
}

so maybe something like this?

$(obj)/%.o: private objtool-enabled = $(and $(is-standard-object),$(objtool-cmds-y),$(if $(delay-objtool),$(is-single-obj-m),y))

-- 
Josh

