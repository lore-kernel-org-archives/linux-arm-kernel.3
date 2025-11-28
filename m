Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E35D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OX4PMm+qO7zPBCVq86cl92pLBJaZal/jPsXns4lrFgs=; b=PywApEbS7voEpG1aXhArK7dIo4
	Y+6InFU6c83h3kjX+x6z3ZS1GJLHnFJ+iSwaJJB1QtA+dncQVlWtJbNb70MWIDkJBTcGETCecsOx2
	sfu/VYHUG7qwUKiwfl9A07lawR8ken2yZUrDOIPW2sO8CdrIQpsXgVDw+KP87YLpJ2a8WPHN4DOLX
	9qxLUp6xpEicxxnbTOb11C/WWczunODXO5JCDJxkd5thUVw4gkRa7rY3xsBf3nU4HRe8vWuV3J7ur
	dZ9Hnh6RJm8AeH0bsnxeCYrV0fP3gPGvRS3LfUpP6cbEIZFJPtzMQoWMxHyoRHylE85dv6sI/XII4
	sWoLERFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOwuH-00000000NA0-18yZ;
	Fri, 28 Nov 2025 11:44:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOwuE-00000000N9b-1wBA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:44:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9E59176A;
	Fri, 28 Nov 2025 03:44:44 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EC263F66E;
	Fri, 28 Nov 2025 03:44:50 -0800 (PST)
Date: Fri, 28 Nov 2025 11:44:47 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [RFC/RFT PATCH 0/6] Improve get_random_u8() for use in randomize
 kstack
Message-ID: <aSmLLz24stY_B9g0@J2N7QTR9R3>
References: <20251127092226.1439196-8-ardb+git@google.com>
 <b1dae5a7-27bd-42de-bcce-9fd3c2b1c178@arm.com>
 <CAMj1kXE-Qm4DQNAcg8Tg7YM4EMdLBu_UJm7M8Cpk3t5g7XqP5w@mail.gmail.com>
 <e996fdd5-7113-4327-a884-336dd5f77c4d@arm.com>
 <CAMj1kXGyYMy2xhcdNicHkMfWBnEjyhc+xg8ciuR-6WXDxDpZxg@mail.gmail.com>
 <f95593ac-d4cf-4e06-9a94-cc5133897c59@arm.com>
 <aSiDSp8NpqJkr1oD@J2N7QTR9R3>
 <CAMj1kXF9-tXVQS-_p8c058ssn80xaiDu+01SR98=yQ004xevng@mail.gmail.com>
 <6e4cfa83-3181-4988-a3d8-55e066b68947@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e4cfa83-3181-4988-a3d8-55e066b68947@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_034454_649259_35C8DA8B 
X-CRM114-Status: GOOD (  25.83  )
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

On Fri, Nov 28, 2025 at 10:36:13AM +0000, Ryan Roberts wrote:
> On 27/11/2025 19:01, Ard Biesheuvel wrote:
> > On Thu, 27 Nov 2025 at 17:58, Mark Rutland <mark.rutland@arm.com> wrote:
> >>
> >> On Thu, Nov 27, 2025 at 03:56:59PM +0000, Ryan Roberts wrote:
> >>> On 27/11/2025 15:03, Ard Biesheuvel wrote:
> >>>> So the question is really whether we want to dedicate 16 bytes per
> >>>> task for this. I wouldn't mind personally, but it is something our
> >>>> internal QA engineers tend to obsess over.
> >>>
> >>> Yeah that's a good point.
> >>
> >> I think it's a fair point that some people will obsesses over this, but
> >> I think the concern is misplaced.
> >>
> >> I know that people were very happy for the kernel FPSIMD context to
> >> disappear from task_struct, but 16 bytes is a fair amount smaller, and
> >> I'm pretty sure we can offset that with a small/moderate amount of work.
> >>
> >> AFAICT there are extant holes in task_struct that could easily account
> >> for 16 bytes. I can also see a few ways to rework arm64's thread_info
> >> and thread_struct (which are both embedded within task_struct) to save
> >> some space.
> > 
> > Oh, I completely agree. But it is going to come up one way or the other.
> 
> I'm always terrified of changing the layout of those god structs for fear of
> accidentally breaking some cacheline clustering-based micro optimization.
> Putting new variables into existing holes is one thing, but rearranging existing
> data scares me - perhaps I'm being too cautious. I assumed there wouldn't be an
> existing hole big enough for 16 bytes.

FWIW, ignoring holes, the trailing padding is pretty big. In v6.18-rc1
defconfig task_struct appears to have ~40 bytes of padding due to
64-byte alignment. So (in that configuration) adding 16 bytes doesn't
actually increase the size of the structure.

I have a few specific changes in mind which could ammortize 16 bytes, so
even if this turns out to be an issue, we can make good.

For example, I'd like to change arm64's FPSIMD/SVE/SME context switch
to remove the opportunistic reuse of context after A->B->A migration.
That would remove the need for 'fpsimd_cpu' and 'kernel_fpsimd_cpu' in
thread struct (which is embedded within task struct, at the end), saving
8 bytes.

If we change the way we encod the 'vl' and 'vl_onexec' array elements,
we can shrink those from unsigned int down to u8, which would sve 12
bytes.

Mark.

