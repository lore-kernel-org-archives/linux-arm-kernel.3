Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFD4CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 19:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TiIl36uFY8ZkqiyyqljWp+GeIOt2p0pIoWmVGkzz89Q=; b=NN73Kb2Am1343l0YnRBMxEnhl/
	5nMCkhKJcvXYRBjV1iJZIQ5dRH3SHRm4HKFM69GHSUL+1cDBwvn2lXR7Z9a3MsCXkkISQ5lryEnIS
	6rWUjDTeqUWcvDM6lX0l3hKN1yXwCgBMhxD3AvZs50NR4LThjHJvwiE2rVtrEtfUnK4UY7odejHEh
	W0JIU6y0CWJVGhM7Nrv0MeIQYzTaspYa1uCfPH11/i3h+g0jQfKwUxAKReexg/jN9lSY3HFBL32mZ
	JKnz1Tl9HgMrOx1tzuWhnWkoIB18E5dP2BCxoFC0bd3PGv+j3+q6pKxkT3IV+jFw8fkPQZbfO7F/e
	JDOg+x9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyF45-00000005Woe-27EB;
	Mon, 15 Sep 2025 19:40:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyF43-00000005WoA-1LpX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 19:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFF8C43284;
	Mon, 15 Sep 2025 19:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F133C4CEF1;
	Mon, 15 Sep 2025 19:40:36 +0000 (UTC)
Date: Mon, 15 Sep 2025 20:40:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 4/6] arm64: futex: refactor futex atomic
 operation
Message-ID: <aMhrscd1gz_syMtL@arm.com>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-5-yeoreum.yun@arm.com>
 <aMRQIeIdyiWVR8a0@arm.com>
 <aMfrR0vserl/hfZ3@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMfrR0vserl/hfZ3@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_124039_391263_AE025DF2 
X-CRM114-Status: GOOD (  23.82  )
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

On Mon, Sep 15, 2025 at 11:32:39AM +0100, Yeoreum Yun wrote:
> > On Sat, Aug 16, 2025 at 04:19:27PM +0100, Yeoreum Yun wrote:
> > > diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
> > > index bc06691d2062..ab7003cb4724 100644
> > > --- a/arch/arm64/include/asm/futex.h
> > > +++ b/arch/arm64/include/asm/futex.h
> > > @@ -7,17 +7,21 @@
> > >
> > >  #include <linux/futex.h>
> > >  #include <linux/uaccess.h>
> > > +#include <linux/stringify.h>
> > >
> > >  #include <asm/errno.h>
> > >
> > > -#define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
> > > +#define LLSC_MAX_LOOPS	128 /* What's the largest number you can think of? */
> >
> > I just noticed - you might as well leave the name as is here, especially
> > if in patch 6 you align down address and use CAS on a 64-bit value as
> > per Will's comment (and it's no longer LLSC). I think renaming this is
> > unnecessary.
> 
> Okay. I'll restore to use origin name.
> But I think LSUI wouldn't be used with CAS according to patch 6's
> comments from you and additionally i think
> chaning the CAS would make a failure because of
> change of unrelated field. i.e)
> 
> struct user_structure{
>   uint32 futex;
>   uint32 some_value;
> };
> 
> In this case, the change of some_value from user side could make a
> failure of futex atomic operation.

Yes but the loop would read 'some_value' again, fold in 'futex' and
retry. It would eventually succeed or fail after 128 iterations if the
user keeps changing that location. Note that's also the case with LL/SC,
the exclusive monitor would be cleared by some store in the same cache
line (well, depending on the hardware implementation) and the STXR fail.
From this perspective, CAS has better chance of succeeding.

> So I think it would be better to keep the current LLSC implementation
> in LSUI.

I think the code would look simpler with LL/SC but you can give it a try
and post the code sample here (not in a new series).

BTW, is there a test suite for all the futex operations? The cover
letter did not mention any.

-- 
Catalin

