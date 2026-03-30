Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC641061B20
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 20:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4ZoAoOvwk8WXV5204eONaIMa6AANTZ/dg38pNpPUBs=; b=VM7JM7jPm1UUpG3Vqgcl69+AaL
	5/me2XrvfRmSdlY2arvk2rwUjFFPzt4KalzvOoJ0l00uXs/nKP/hjRhGaDvJD3/YO/6nckAZz7I2X
	cZk/oyIpSGmrRpNjoXPES2DHg4SpTmNZvC/dfg6DQOdCstDXm+eTf6WtqTrO7lUCV6B+cVlFZkDaM
	OeEPWkZAinzPM7wMD9VOsImQkRyiW2x6u6GTlcK4b4cv6tU95Jhfto359iC11dSt2YY1auz8K/kN3
	sjMcNleDfjX93aPqzxcPwTDGtOhv+kJUqdhhvuSQrTITZibbqJDbpz5Qm5RUEuRj8/1IcDfm5paiM
	FsYJEniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JCz-0000000Bpop-3zq7;
	Mon, 30 Mar 2026 20:27:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JCy-0000000Bpoj-18WL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 20:27:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 221E660130;
	Mon, 30 Mar 2026 20:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CDDC4CEF7;
	Mon, 30 Mar 2026 20:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774902454;
	bh=g+gwsR+gNrNm22Hp+EF93Bvvi9OTcgbAaxyzqRzDwLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EMacDWh57ISefa8yBdpmiZ6lgzX1NTVvuvP6ITKNfuPWEiwh9eGPoLwcfrLMehPI9
	 Vz/xrAn03fVZc8uabw9zlPDGpgk+4FKfDVOc+Bw+88JEmM87JjWYwxTdc20AUemzWs
	 NsBGQPscOB4otw2Ul6ElWnVRvnNjL6Lsq04SY/LvuIB5lwrh9D53nW0LQEyD0xHaGe
	 nSs2GAKe5ZfP9L2sfEzgYYho8vXVYiR0b97bgufZyv87QNCfg6n4ozoH2q2e51mW+m
	 Dz3K/lzFkEbSSLsbf40rpi4vfqP6EIBjvoblp3yK/tHyn6X4YSl7pNdIF/IPJXmEfE
	 o6THgOpNDYqhA==
Date: Mon, 30 Mar 2026 20:49:20 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v2 07/12] kbuild: Only run objtool if there is at least
 one command
Message-ID: <acrFsFFBVOzPYl_C@levanger>
References: <cover.1773787568.git.jpoimboe@kernel.org>
 <42418c5fa73a8876e91b3dfb38fa3f263e39f1c1.1773787568.git.jpoimboe@kernel.org>
 <absC93h6fNgyniD4@derry.ads.avm.de>
 <zdipyf26t2gos5dw2gjyzmeg2zm5a67xwr5ozubnhmhllrwgnm@ezdt54coe2bk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zdipyf26t2gos5dw2gjyzmeg2zm5a67xwr5ozubnhmhllrwgnm@ezdt54coe2bk>
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

On Wed, Mar 18, 2026 at 05:49:27PM -0700, Josh Poimboeuf wrote:
> On Wed, Mar 18, 2026 at 08:54:31PM +0100, Nicolas Schier wrote:
> > On Tue, Mar 17, 2026 at 03:51:07PM -0700, Josh Poimboeuf wrote:
> > > Split the objtool args into commands and options, such that if no
> > > commands have been enabled, objtool doesn't run.
> > > 
> > > This is in preparation in enabling objtool and klp-build for arm64.
> > > 
> > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > > Tested-by: Nathan Chancellor <nathan@kernel.org>
> > > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> > > ---
> > >  arch/x86/boot/startup/Makefile |  2 +-
> > >  scripts/Makefile.build         |  4 +--
> > >  scripts/Makefile.lib           | 46 ++++++++++++++++++----------------
> > >  scripts/Makefile.vmlinux_o     | 15 ++++-------
> > >  4 files changed, 33 insertions(+), 34 deletions(-)
> > > 
> > [...]
> > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > index 3652b85be545..8a1bdfdb2fdb 100644
> > > --- a/scripts/Makefile.build
> > > +++ b/scripts/Makefile.build
> > > @@ -277,7 +277,7 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
> > >  is-standard-object = $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(target-stem).o)$(OBJECT_FILES_NON_STANDARD)n),$(is-kernel-object))
> > >  
> > >  ifdef CONFIG_OBJTOOL
> > > -$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(delay-objtool),$(is-single-obj-m),y))
> > > +$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(objtool-cmds-y),$(if $(delay-objtool),$(is-single-obj-m),y)))
> > 
> > Please use $(and a,b,c) instead of multiple nested $(if $(a),$(if
> > $(b),$(c)); as the last variable (is-single-obj-m) is 'y' or empty, the final 'y' can be
> > left-out:
> > 
> > $(obj)/%.o: private objtool-enabled = $(and $(is-standard-object),$(objtool-cmds-y),$(delay-objtool),$(is-single-obj-m))
> 
> I believe that would break the !delay-objtool case.  The logic needs to
> be something like:
> 
> if (is-standard-object && objtool-cmds-y) {
> 	if (delay-objtool) {
> 		// for delay-objtool, only enable objtool for single-object modules
> 		$(is-single-obj-m)
> 	} else {
> 		// for !delay-objtool, always enable objtool
> 		y
> 	}
> }
> 
> so maybe something like this?
> 
> $(obj)/%.o: private objtool-enabled = $(and $(is-standard-object),$(objtool-cmds-y),$(if $(delay-objtool),$(is-single-obj-m),y))

sorry for the delay!  Yes, I overlooked the !delay-objtool.  That line
looks good to me, thanks!


-- 
Nicolas

