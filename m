Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C520107760E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 19:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kxTwCDk3Bv9xaYP7SQwO+fLH97BxoRrV/efBbpFe/0=; b=nKfo5g327ojynYlaa37KdtPiyV
	i8r4XyQWtr3o1+NuYcV8vqgzoXb0L/kDbER50CiBJnQfOGjXlHPn1mSHlOndCbmdBInKcd/GrOAlw
	QsvB0iIFq+sCViyuwbTOnVof+kKhhI0p7EdX9Mvk7O9P5U5RaXrrnu9HWrgYFFhFTtcGjw4vuP+ES
	Z4j0Ap4INJ6mtBgIFN4ty+1dBqwgKcUT+WWk8DWQJYQR4qpdnVqbmEVQ98GVbBXzppbwZO2qbkFVY
	CtAmUBD2mhuTdBU1C6Ce+Kd/TfHbNUdyI525Ts/V1DRhc9eh4Z+SpK27TjwaEJVVuRB8eQW3kYwDl
	IHOLOUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2x12-00000009GC3-2YuS;
	Wed, 18 Mar 2026 19:57:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2x11-00000009GBs-2LWD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 19:57:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84ED160103;
	Wed, 18 Mar 2026 19:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF89C19421;
	Wed, 18 Mar 2026 19:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773863834;
	bh=+kzhDbxT+jFXab+XbKrbVAzjztS5lNka6dGbKHY8tfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FxDn+8mdrB44DQlF18pS/g3/WTyQr8wmoCHkwNd/VfVbi8PevUxhkV6I2gC3MBWvQ
	 nBvqsE9JF6/hMF3V+UZFslspo/G5Qm1suAh4zJdWhuBv6rYQSE5XrpeMHdV4HPzkXb
	 YQpEcuDCNixIXBu+wJtHJB5s5cctTtqWZAEhOMQJ+V6ect5egb/RYHh0P7sHdgkaRB
	 48qGJxRK2tkRSkSWOQDFfxW8S+8Aywj7w4DH1s9xqV/+tGLrdAhRnbvvwsd3KwxVZe
	 RhOG3fUh2Rv3x0kYmxQ/8nIcY+V95etapPwtPKevfInoDheM1Qr4NZxaqga+ZwC0bf
	 GJa+n1+QLQz4A==
Date: Wed, 18 Mar 2026 20:54:31 +0100
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
Message-ID: <absC93h6fNgyniD4@derry.ads.avm.de>
References: <cover.1773787568.git.jpoimboe@kernel.org>
 <42418c5fa73a8876e91b3dfb38fa3f263e39f1c1.1773787568.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42418c5fa73a8876e91b3dfb38fa3f263e39f1c1.1773787568.git.jpoimboe@kernel.org>
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

On Tue, Mar 17, 2026 at 03:51:07PM -0700, Josh Poimboeuf wrote:
> Split the objtool args into commands and options, such that if no
> commands have been enabled, objtool doesn't run.
> 
> This is in preparation in enabling objtool and klp-build for arm64.
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  arch/x86/boot/startup/Makefile |  2 +-
>  scripts/Makefile.build         |  4 +--
>  scripts/Makefile.lib           | 46 ++++++++++++++++++----------------
>  scripts/Makefile.vmlinux_o     | 15 ++++-------
>  4 files changed, 33 insertions(+), 34 deletions(-)
> 
[...]
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 3652b85be545..8a1bdfdb2fdb 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -277,7 +277,7 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
>  is-standard-object = $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(target-stem).o)$(OBJECT_FILES_NON_STANDARD)n),$(is-kernel-object))
>  
>  ifdef CONFIG_OBJTOOL
> -$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(delay-objtool),$(is-single-obj-m),y))
> +$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(objtool-cmds-y),$(if $(delay-objtool),$(is-single-obj-m),y)))

Please use $(and a,b,c) instead of multiple nested $(if $(a),$(if
$(b),$(c)); as the last variable (is-single-obj-m) is 'y' or empty, the final 'y' can be
left-out:

$(obj)/%.o: private objtool-enabled = $(and $(is-standard-object),$(objtool-cmds-y),$(delay-objtool),$(is-single-obj-m))

>  endif
>  
>  ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
> @@ -501,7 +501,7 @@ define rule_ld_multi_m
>  	$(call cmd,gen_objtooldep)
>  endef
>  
> -$(multi-obj-m): private objtool-enabled := $(delay-objtool)
> +$(multi-obj-m): private objtool-enabled := $(if $(objtool-cmds-y),$(delay-objtool))

Could be changed to $(and), too; but personally I think the $(if) is
easier to parse at once.


Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

