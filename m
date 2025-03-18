Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B331C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 23:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s89OgBh7LyFizOxBoCWmPVcMvU87W1mpSrqj4j2Kvxs=; b=fgI4isMt0z+joIlCyT0mC8nTme
	icCjKFc/3cBZdALih3xHl1pNLUBSJ/JXNFTPJL85wORz1oowfJ2QAagXGgflS63i8fpi8x4+NBi+T
	fWR5xMbiO+YDZpbrgi8j6Wcdy5HRvsVVWmiYnv5sQ5H9oB8khZCny5IVHrK214+C/WMseGeSylocp
	/2mJ+I8ojIhTYoGGlIO6AVCSEd6AsbrBvRCwAUrwM4qit7YMYG9p8nWO0Hx2UayiqE67n0gqyMmoU
	+l6MedLBmVyj6HR7NLs5+0xCqvbpX+BKBkM4JrpQWbD38W48YgFUnYqQuD2R5XSlCTbXg6fnJogCu
	sx8DpT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tufwz-00000007JMp-2Ttu;
	Tue, 18 Mar 2025 23:02:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufvJ-00000007J06-13s5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 23:00:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6CC55C5848;
	Tue, 18 Mar 2025 22:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D91C4CEDD;
	Tue, 18 Mar 2025 23:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742338835;
	bh=Dr5JLgo/lrzaiY2c96lg9HAJ5ExgQ1teNDMLECNkAPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qaweLj0QPu0L9CSUDZXj53BHV7x204cZV4Je65s0qsvQgiV3LfKmgPTQcN6v6Ecmg
	 8I+TT9ZvhQ9hfqB1u/wwGfg7gA//xpC5Uu9DFbvTI/rjyRZ7GvRFd/biXCqTPFu7Qc
	 +s0G4yml9DQFIbkXF77D3qwGY4L/bB9R6Xo+zn1gErqhF72GSfVeo5iv3iOkx8vl4M
	 KnQJMSgOuRXO1HranIi5nLgmQL1epTPYKu6b8Jsu9ImxUFrqJMvp+aiOIXoVZ14aM5
	 MLg7jB8EVBzM5UxGS2/1cazgJSJZLTIGzNiQTIc+SJ+w+zmWVr8cx1+3geDmUhembm
	 JrEOONPr7+Rcg==
Date: Tue, 18 Mar 2025 16:00:32 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, indu.bhagat@oracle.com, 
	puranjay@kernel.org, wnliu@google.com, irogers@google.com, joe.lawrence@redhat.com, 
	mark.rutland@arm.com, peterz@infradead.org, roman.gushchin@linux.dev, 
	rostedt@goodmis.org, will@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] arm64: Implement arch_stack_walk_reliable
Message-ID: <ox4c6flgu7mzkvyontbz2budummiu7e6icke7xl3msmuj2q2ii@xb5mvqcst2vg>
References: <20250308012742.3208215-1-song@kernel.org>
 <20250308012742.3208215-2-song@kernel.org>
 <iajk7zuxy7fun7f7sv52ydhq7siqub3ec2lmguomdd3fhdw4s2@cwyfihj3gvpn>
 <CAPhsuW4A73c0AjpUwSRJ4o-4E6wpA9c5L0xWaxvHkJ3m+BLGVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPhsuW4A73c0AjpUwSRJ4o-4E6wpA9c5L0xWaxvHkJ3m+BLGVA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_160037_332743_42BD9FE2 
X-CRM114-Status: GOOD (  14.15  )
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

On Tue, Mar 18, 2025 at 01:14:40PM -0700, Song Liu wrote:
> >
> > See for example all the error conditions in the x86 version of
> > arch_stack_walk_reliable() and in arch/x86/kernel/unwind_frame.c.
> 
> I guess I missed this part:
> 
> diff --git i/arch/arm64/kernel/stacktrace.c w/arch/arm64/kernel/stacktrace.c
> index 69d0567a0c38..3bb8e3ea4c4b 100644
> --- i/arch/arm64/kernel/stacktrace.c
> +++ w/arch/arm64/kernel/stacktrace.c
> @@ -268,6 +268,8 @@ kunwind_next(struct kunwind_state *state)
>         case KUNWIND_SOURCE_TASK:
>         case KUNWIND_SOURCE_REGS_PC:
>                 err = kunwind_next_frame_record(state);
> +               if (err && err != -ENOENT)
> +                       state->common.unreliable = true;
>                 break;
>         default:
>                 err = -EINVAL;

I still see some issues:

  - do_kunwind() -> kunwind_recover_return_address() can fail

  - do_kunwind() -> consume_state() can fail

  - even in the -ENOENT case the unreliable bit has already been set
    right before the call to kunwind_next_frame_record_meta().

-- 
Josh

