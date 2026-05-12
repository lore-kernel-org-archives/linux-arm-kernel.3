Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07576CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2BwjOnI4HufK7niIgigjtrAH1cZxwpvQlVzoJs1VpQ=; b=y4ygiiLyoFTH0kgUKgVg60Z12v
	eWXZvnIfR7r5d/+fi9BBlF0U56g6PxTiK+qKfVEHStZ/4qiCcGX5FWe8ULYIz9jw5SJdS6BY/ICAz
	rbJguhPtDWf1+3c1Yz3L85DoJ2Gjp/q4O4CqeecQT4l5dY2z5Q4wvT5isOy/4HTeZUWe6THI+XDFD
	ITh9SqUTnB/Y6h0hZZoF1cbdPsewYnABGfGTvDl4Rvv96iB/3ivVhVabC6VwGqrYaK0TV8jGYb5kP
	usLTyMau3B01u4VZz9CFmIh326b1uAsNjELk2Jkr0MqQj/1iD38VNjHv7MFOqoJ4ZNdT2f54BxYqf
	8Klr/ThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkCV-0000000GPed-2LIc;
	Tue, 12 May 2026 10:18:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkCT-0000000GPe6-0vkh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 10:18:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEDAA1691;
	Tue, 12 May 2026 03:18:46 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 801993F7B4;
	Tue, 12 May 2026 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778581132; bh=U2RKyZFvAJWxf0WCPY/QD6ZBjPhpAW6Y7NJlEYh5m/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RmkRaQVb1rWl0nZAhjmin3dPinyheV0A8H6NPKwNRAZSkz2kDu9erVlPzr8cWejjx
	 RDLHH9k5kuVsFreX56A1KXFJv2KL5a9CTuEm5c+q8PYmn3rHwQsDEq+6LZG6BLvC19
	 AYqYCePgiYB+a6VmXItxNpzJIusKvB7sDCbP+mKY=
Date: Tue, 12 May 2026 11:18:45 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Weinan Liu <wnliu@google.com>, Will Deacon <will@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Indu Bhagat <ibhagatgnu@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Kosina <jikos@kernel.org>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
	joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH v5 8/8] unwind: arm64: Use sframe to unwind interrupt
 frames
Message-ID: <agL-hacT_xeh1kmz@J2N7QTR9R3>
References: <20260428183643.3796063-1-dylanbhatch@google.com>
 <20260428183643.3796063-9-dylanbhatch@google.com>
 <afTYzAF_x41pyilu@J2N7QTR9R3>
 <CADBMgpx9YxNUO6wLP7mYKxWW8L78Hk9gPwHrMjXUwPyUmGEu9w@mail.gmail.com>
 <0542f042-14fb-4588-bc3a-5031249d9834@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0542f042-14fb-4588-bc3a-5031249d9834@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_031853_342803_852C39A5 
X-CRM114-Status: GOOD (  23.92  )
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

On Tue, May 12, 2026 at 10:55:28AM +0200, Jens Remus wrote:
> On 5/12/2026 5:00 AM, Dylan Hatch wrote:
> > On Fri, May 1, 2026 at 9:46 AM Mark Rutland <mark.rutland@arm.com>
> > wrote:
> 
> >> (1) For correctness, we'll need to address a latent issue with
> >> unwinding across an fgraph return trampoline, where the return
> >> address is transiently unrecoverable.

> >> I think we can solve that with some restructuring of that code, 
> >> restoring the original address *before* removing that from the 
> >> fgraph return stack, and ensuring that the unwinder can find it.
> > 
> > If my understanding is correct, the issue arrises in
> > return_to_handler as the return address is recovered:
> > 
> > mov x0, sp bl ftrace_return_to_handler // addr =
> > ftrace_return_to_hander(fregs); mov x30, x0 // restore the original
> > return address
> > 
> > Because ftrace_return_to_handler pops the return address from the 
> > return stack before it can be restored into the LR, it cannot be 
> > recovered.
> 
> Based on reliable-stacktrace.rst section "4.4 Rewriting of return
> addresses" I wonder whether the following might work:
> 
> - If an unwound RA points at return_to_handler the actual RA needs to
>   be obtained using ftrace_graph_ret_addr().  This might already be
>   taken into account if ftrace_graph_ret_addr() is used unconditionally.
> 
> - If an unwound RA points into return_to_handler() mark the stack trace
>   as unreliable.  This could be accomplished by marking LR in
>   return_to_handler() as undefined (i.e. .cfi_undefined 30) to use
>   SFrame's outermost frame indication to stop and mark the stack trace
>   as unreliable:

We don't currently have any CFI annotations for return_to_handler(), so
if we interrupt that, any unwind will naturally be marked as unreliable.

The problem is that we can try an unwind from an interrupted *callee* of
return_to_handler(). In that case, we'll unwind through
return_to_handler() using the frame pointer, without consulting SFrame.
In that case, the PC will be part-way through return_to_handler(), but
we only call ftrace_graph_ret_addr() when the PC is the start of
return_to_handler, and so we don't even try to recover the return
address.

We can handle that better by checking whether the PC is *within*
return_to_handler(), and aborting when the original return address
cannot be recoverted. I'm happy to go put that together, nad longer term
I would like to do the better reovery I described above such that we can
*always* recover the return address.

Mark.

