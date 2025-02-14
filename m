Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9A4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoHU4fruD6MEqxZdo0UiR+vpiz2t17cE/AjiMnXEXFo=; b=BLWvWYKunj+2cHBBPBZHeUefsS
	StlN1NkA167wA3i+HHKH5mxvdwfF8cYDBrd4mkT5KMg3Dz+ZkssGy86W+BZ9Muoy1QvNkiUh7pq3E
	T+XvDgS4ZeF3Lp9iuW79eBaq/ojx2bFIE2d2ecNXHggwyhgx/TOc0Oeg+Z8Z2IYFoE3bAVTMI1Mlt
	z687CHrNWrNfa0Kd9dyQPdJLKOf7BHUBZUihb2JpHfOVEBDWSqFx0YuybA7u9gKkptAIW47DcBr4Q
	Fb/JGfUPlEAWAdjqJU7WBPnI2na4ux8nfbBS0Sqez4+P6edp+mW/4mH7jyfoFxKcA9kF/mhYW6kDp
	QUs7+3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqoS-0000000E4F9-09lq;
	Fri, 14 Feb 2025 08:12:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqkl-0000000E3jx-35QK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:08:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42A455C58FF;
	Fri, 14 Feb 2025 08:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F8EC4CED1;
	Fri, 14 Feb 2025 08:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739520530;
	bh=8fIq6lw3P3TyFk9U6Dky3t367XWONU83XLGY7Ec0/4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAmbBAwGJaDrisyAiRs7d6rtf1gEdYFkfp2NxA37drWHXg0ZJycOZbKFzG+K+n58c
	 kVqbfGYP0N+qw0mdFfdJwtB2kZKOGnnz4rIkWlZNfcMu49sOrMGYOoJdgD6A/sSUgL
	 rCDxUH+P6CQe4T14lFvFL9CftGviplC7hsZjU876WerR43VCpYG5BgVajipmnA8NPC
	 xzmjps1vFBEYM85bXiu5BWXDc+2zE3Kaw8HScv+5yFn3kf2Ol+3++YVIwEbsVWqAT2
	 T1SIWlNxLGr9S05gk77oaRACklsGRKwz6P8K5jP07GF7ocZ+CWKfDBruAz6MsGhlVE
	 P98kVABruTf+A==
Date: Fri, 14 Feb 2025 00:08:48 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Puranjay Mohan <puranjay@kernel.org>, Weinan Liu <wnliu@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Indu Bhagat <indu.bhagat@oracle.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org, joe.lawrence@redhat.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <20250214080848.5xpi2y2omk4vxyoj@jpoimboe>
References: <20250127213310.2496133-1-wnliu@google.com>
 <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <20250212234946.yuskayyu4gx3ul7m@jpoimboe>
 <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
 <20250213024507.mvjkalvyqsxihp54@jpoimboe>
 <CAPhsuW4iDuTBfZowJRhxLFyK=g=s+-pK2Eq4+SNj9uL99eNkmw@mail.gmail.com>
 <mb61py0yaz3qq.fsf@kernel.org>
 <CAPhsuW7dV7UR3PsGVx_DLBH5-95DAmLMGTPuY0NfUwWLZMSTrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPhsuW7dV7UR3PsGVx_DLBH5-95DAmLMGTPuY0NfUwWLZMSTrQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_000851_829457_A5194A39 
X-CRM114-Status: GOOD (  11.11  )
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

On Thu, Feb 13, 2025 at 11:40:43AM -0800, Song Liu wrote:
> Yeah, objdump does show the same disassembly. However, if
> I open the file with gdb, and do "disassemble copy_process",
> the one in livepatch-special-static.o looks very weird.

The symbol table looks ok.  I'm not sure why gdb is getting confused,
but that could possibly be a red herring.  Maybe it doesn't like the
-ffunction-sections for some reason.

It's really weird the function length reported by kallsyms is so wrong.
Can you share the .ko?

The refcount warning might indicate it's passing some bogus memory to
tty_kref_get().  Any chance you have struct randomization enabled?

Are you sure there's no code or .config mismatch between the built
kernel and the running kernel?

Ignorant arm64 question: is the module's text further away from slab
memory than vmlinux text, thus requiring a different instruction (or
GOT/TOC) to access memory further away in the address space?

-- 
Josh

