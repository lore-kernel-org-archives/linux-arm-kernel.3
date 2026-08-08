Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24412C5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 00:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LveIhWTPzg6Gu5DfHx0xwV39eUz2DOfyxOY7EwK5aU=; b=VzTuuJJloXWKyjv3vBbYuZ6UmY
	7PHr7Xxws2OyuC0q5X6ymxuG27mX464djYG/gFlQnkhHIqKI1zXYmeyK0T6fCduPX5ztk9Lu5mbXB
	SE3tFoRauei2wbgA2yuj41zIF+nF+aMFda9RcQEl8zIjHSG3joi5QLTAlnj9KGJnjpSb68Cyx7YvT
	UDn6s6astZbT/m7ywTM6rYtILdbg2j6bt2mdaz3mTL71zy+dii+UNH1cfjyPbl5yhEij+/Z7Dr7AW
	UJwmNNSk2aNNTdNNbd7YNOkL2Ok2CD02iSaKM5LEPLbpZMwivjd3JMJw2HE4KfjHrQQ4j6Ax0jW12
	O/UmG/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUf3-00000008trE-13dG;
	Sat, 08 Aug 2026 00:11:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUf1-00000008tqk-0C5s
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 00:11:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CE7A6001A;
	Sat,  8 Aug 2026 00:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBD61F000E9;
	Sat,  8 Aug 2026 00:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786147893;
	bh=2LveIhWTPzg6Gu5DfHx0xwV39eUz2DOfyxOY7EwK5aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ePwUA1CYnS/FhTDJv4Ir/iMYm3iG4dDABCHqo0TS0h549Hrebs+wRDQiaLQ6KEbpa
	 QMKPz/Lau6dz8iCakdQIOE0ZszA3u3B8DEYKsdnEJjfmwkAFIIpmiCpaJB0PtwI05j
	 scu+Yzu3t6kHuqjASVcu3bOM8JrGMtLXOScfdOnybk1BZv+jw1XA0PpeRj4cbJiaRm
	 07HvE54noBglpCfoCFJej7OVGYwcpLGSDRgBdO2xVhv6N3rBcn+6s086B5LI6DSd0S
	 HgprRgVodPgtoGFkX4txioOS0oZVxgOsJ6gjbuvV+x5vFXnSxBz/dHAoYEtK9BOBlq
	 gmNrRYXq8BMSg==
Date: Fri, 7 Aug 2026 17:11:31 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Joe Lawrence <joe.lawrence@redhat.com>, 
	Song Liu <song@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v3 11/21] objtool: Allow empty alternatives
Message-ID: <ykyqrueqcpoxuondp2hcbjpqnmvshxmlqinlqamsmb626rd7h7@x64cqzsmlqr5>
References: <cover.1778642120.git.jpoimboe@kernel.org>
 <3c474673ec5ddc9f27fbf5ddb1fd0f66ef6a779f.1778642120.git.jpoimboe@kernel.org>
 <20260513073711.GI1889694@noisy.programming.kicks-ass.net>
 <jbjmteak3slp5jxytozuaxvh34lv5uvqzvq7gv47ch363mc4s3@frpc2izplmhp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <jbjmteak3slp5jxytozuaxvh34lv5uvqzvq7gv47ch363mc4s3@frpc2izplmhp>
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

On Fri, Aug 07, 2026 at 04:40:34PM -0700, Josh Poimboeuf wrote:
> On Wed, May 13, 2026 at 09:37:11AM +0200, Peter Zijlstra wrote:
> > On Tue, May 12, 2026 at 08:33:45PM -0700, Josh Poimboeuf wrote:
> > > arm64 can have empty alternatives, which are effectively no-ops.  Ignore
> > > them.  While at it, fix a memory leak.
> > 
> > How does this happen?
> 
> Yeah, that commit log sucks...
> 
> The case I stumbled on was the dcache_by_myline_op_nosync macro:
> 
> alternative_if ARM64_WORKAROUND_4311569
> 	.ifnc	\op, cvau
> 	mov	\start, \tmp
> 	mov	\tmp, xzr
> 	cbnz	\start, .Ldcache_op\@
> 	.endif
> alternative_else_nop_endif
> 
> That's actually a bit weird, the .ifnc should probably be outside the
> alternative_if.  Let me try fixing that instead.

I'll probably drop the above patch (leaving empty alternatives as a hard
error) and replace it with this one:

commit 5dd83bdddff38f4df2829b05f876e57215b2e850
Author: Josh Poimboeuf <jpoimboe@kernel.org>
Date:   Fri Aug 7 16:41:10 2026 -0700

    arm64: Remove unnecessary empty alternatives
    
    The code in arch/arm64/mm/cache.S creates three empty alternatives, all
    from calling the dcache_by_myline_op_nosync asm macro.  If \op == cvau,
    it creates an empty alternative for ARM64_WORKAROUND_4311569.
    
    Since orig_len == 0, the alternative patching code mostly ignores it,
    though it does do an unnecessary clean_dcache_range_nopatch().  It also
    triggers an objtool error ("empty alternative entry").
    
    Clean it up by moving the .ifnc check outside the alternative emit.
    
    Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index effae53e9739d..6e059efced5bb 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -404,13 +404,13 @@ alternative_else_nop_endif
 	add	\start, \start, \linesz
 	cmp	\start, \end
 	b.lo	.Ldcache_op\@
-alternative_if ARM64_WORKAROUND_4311569
 	.ifnc	\op, cvau
+alternative_if ARM64_WORKAROUND_4311569
 	mov	\start, \tmp
 	mov	\tmp, xzr
 	cbnz	\start, .Ldcache_op\@
-	.endif
 alternative_else_nop_endif
+	.endif
 
 	_cond_uaccess_extable .Ldcache_op\@, \fixup
 	.endm

