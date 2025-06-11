Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054A2C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 02:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TY4Fo7Qc96Sj3j/wHZ7Z3CVZujOkSKBjcn2b/yThPTM=; b=iJEFYh3Zan21AbafTyIJlWGDId
	HZ23iqqm3uKlnMvVninxlLjG3FoUfvZDQ9LN3lY74kATkUDMarzfZkSZUMV4zly75vecekK+oUQHD
	QZWtiXDnG+7hJmOG+3Lg05cYGltJ5Naycfao8FnzTCW+/AEFe/Heigm04U+RsAsqt72IknY1RTXj5
	Hr5bf9GAp5Q43oivJ4C3r7BXXb8ji+9oXt303Lpuym/afLUd9m4zo2DuA7XQd3tw+cx2pKKxdD4Kz
	6vVvJcXCwrTKQauFf6y0C+MZxbb3PzQecK5VFk5hYjSYlLWR49CoZTOIrea6rNcNTj1tpHTnzwcit
	75ues4Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAsO-00000008bez-27hX;
	Wed, 11 Jun 2025 02:07:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAqF-00000008bbe-1gCY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 02:05:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2EF17A51068;
	Wed, 11 Jun 2025 02:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0307DC4CEED;
	Wed, 11 Jun 2025 02:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749607525;
	bh=A51pa5/WPgp2e8i40HxCGD3ZD76gKs7+NQ43jxy+d9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DyriQXiFzqJa1ac6hdkQcZfTiX4DP+cTupGXG9L5ERo5k4ZTBHsB5D+6q7/ZkPL8d
	 8tpHW10IYriUGEi4prIzad/nK9ClWHb8iUPjPV5Hm2pC+LOpRhGOMLApv/HzY5IEFE
	 uNhLcgnuiMXvmcP+AE0mdxAyY56Gyg+R18TS3b5qopIopfLb5CNF6V/jPBBR5W1kqA
	 3i3Dvh4O8TuZg3PuIv/Uhkk79FrYlUly0hM1KJ+1m2Yc3wbNpU2ppxhX0gxjUniNxt
	 rIN1l7hrx6SBkVZEP5NWtNDw6/nFV2h1bIPHxuGbv8hDnL3M4lz59l9e47yrzQgJC1
	 AH5iABPZol9/g==
Date: Tue, 10 Jun 2025 19:05:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: bpf-restrict-fs fails to load without
 DYNAMIC_FTRACE_WITH_DIRECT_CALLS on arm64
Message-ID: <20250611020522.GA3981304@ax162>
References: <20250610232418.GA3544567@ax162>
 <CAADnVQ+jNQyC=RcoiwDXeHj9y6CGzr322scz_8uGwCDVx-Od4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQ+jNQyC=RcoiwDXeHj9y6CGzr322scz_8uGwCDVx-Od4Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_190527_501166_0098AD2B 
X-CRM114-Status: GOOD (  17.15  )
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

On Tue, Jun 10, 2025 at 04:37:24PM -0700, Alexei Starovoitov wrote:
> On Tue, Jun 10, 2025 at 4:24 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > I was able to figure out that enabling CONFIG_CFI_CLANG was the culprit
> > for the change in behavior but it does not appear to be the root cause,
> > as I can get the same error with GCC and the following diff (which
> > happens with CFI_CLANG because of the CALL_OPS dependency):
...
> > -       select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS \
> > -               if DYNAMIC_FTRACE_WITH_ARGS && DYNAMIC_FTRACE_WITH_CALL_OPS
> >         select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS \
> >                 if (DYNAMIC_FTRACE_WITH_ARGS && !CFI_CLANG && \
> >                     (CC_IS_CLANG || !CC_OPTIMIZE_FOR_SIZE))
> >
...
> That's expected.
> See how kernel/bpf/trampoline.c is using DYNAMIC_FTRACE_WITH_DIRECT_CALLS.
> 
> Theoretically we can make bpf trampoline work without it,
> but why bother? Just enable this config.

As I note above, this is incompatible with CONFIG_CFI_CLANG, which is
more important for my particular area of testing and maintenance. Since
you note this is expected, I will just go back to ignoring the warning
in my kernel logs :) thank you for the quick response!

Cheers,
Nathan

