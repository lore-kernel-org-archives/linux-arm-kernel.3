Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE80C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 13:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klomjTp/kFRiT2SqS4cY7wTFQ0YyZY2hiOo18ni0jNo=; b=jgs0Fk2QYVksziDQOFmmYeP/DG
	5mAU3cnydHwFtNTfvR2jqR1Vww9Jt766qYwcCj9t60RgWBXexe213DizRD8AdF24NcQXg5Mc2Rzuo
	qiTJJPNBLbSJbdodIRLvgi/YiiTXDnuMa4s5YJ9E9O5irNe4/KBJNIyu02ceu0dIN6fYMA0gRh2lI
	tKt9N+Mm9FlKp0POdF7IjJd+xDIqlPA7N/WwKDfRGpBL9BEMxHzOhEvSBE+ypCYVywx+4A1UJnHso
	bEobCj6RWXR8xbKsbaOmDJMbM7ucf9+DF/Q0ljlaAD4fZaiwK2c4/yyBXA1Jjc430FjjXUEoT4xxX
	3sz/Qalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6zD-0000000BQxw-2NVF;
	Fri, 26 Jun 2026 13:52:51 +0000
Received: from mail-106112.protonmail.ch ([79.135.106.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6zA-0000000BQxO-2QH2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 13:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rasmusvillemoes.dk;
	s=protonmail; t=1782481963; x=1782741163;
	bh=klomjTp/kFRiT2SqS4cY7wTFQ0YyZY2hiOo18ni0jNo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=tYtKxiCAO2i7EgBB0iHvY58UJ/xOmE/Mi4aygHHteB8dah1JYvhSLsHmc7aMMQkjq
	 7OoCzVeMSvPsM1+gbfgi9KlhdeVaXBjsofY47ESJvL83RhYGaWdyWlCgBzzXvarXFo
	 kqp6fCxBcZAVQEQvIFNVjWxBJJvsDe9YsSNKB4tEwD9SZNEMEGJRukqGCejizJRTJd
	 5vaO8D+ujry4oIoyUHRbg949P9Lc75PC9PM0mFwXuwzqv9vwuG/3DBfcJJH+kwv1Ti
	 dIb+++Vuq39+SPO1ikZXFumJ0bWdAWlnupQWazT3gi5B+qTYCtN0Q2DGnVsGnsZE4N
	 tHY5GUy5C1NVw==
X-Pm-Submission-Id: 4gmxvD3Kjdz1DFTD
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: "Mark Rutland" <mark.rutland@arm.com>
Cc: <linux-arm-kernel@lists.infradead.org>,  "Ard Biesheuvel"
 <ardb@kernel.org>,  "Will Deacon" <will@kernel.org>,  "Jonathan Corbet"
 <corbet@lwn.net>,  <linux-doc@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: arm64: Document that text_offset is always 0
In-Reply-To: <ajVekauNroapwbtm@J2N7QTR9R3.cambridge.arm.com> (Mark Rutland's
	message of "Fri, 19 Jun 2026 16:21:53 +0100")
References: <20260604140839.1930847-1-linux@rasmusvillemoes.dk>
	<FJaxt3BQA_NDzW32PANPtSgJ_BxYjJ7azs-k2dgboQtWdDfsdpM7j_VNuB7Vym1cYLDXKM1Tsm1YnqsSB7boQA==@protonmail.internalid>
	<ajVekauNroapwbtm@J2N7QTR9R3.cambridge.arm.com>
Date: Fri, 26 Jun 2026 15:52:39 +0200
Message-ID: <87y0g1mms8.fsf@rasmusvillemoes.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_065249_249182_B2D3C6C9 
X-CRM114-Status: GOOD (  25.99  )
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

On Fri, Jun 19 2026, "Mark Rutland" <mark.rutland@arm.com> wrote:

> On Thu, Jun 04, 2026 at 04:08:39PM +0200, Rasmus Villemoes wrote:
>> When trying to figure out where to place and call an arm64 Image in
>> memory, reading booting.rst should provide the answer. However, it
>> requires quite some digging to figure out that text_offset is set via
>> ".quad 0" in head.S and is thus actually always 0 since v5.10.
>
> What is the actual problem?
>
> The documentation in booting.rst is accurate; I don't see why it's
> necessary to read the source code to look at text_offset. Immediately
> above the text in your diff, the documentation has:
>
> | 4. Call the kernel image
> | ------------------------
> |
> | Requirement: MANDATORY
> |
> | The decompressed kernel image contains a 64-byte header as follows::
> |
> |   u32 code0;                    /* Executable code */
> |   u32 code1;                    /* Executable code */
> |   u64 text_offset;              /* Image load offset, little endian */
> |   u64 image_size;               /* Effective Image size, little endian */
> |   u64 flags;                    /* kernel flags, little endian */
> |   u64 res2      = 0;            /* reserved */
> |   u64 res3      = 0;            /* reserved */
> |   u64 res4      = 0;            /* reserved */
> |   u32 magic     = 0x644d5241;   /* Magic number, little endian, "ARM\x64" */
> |   u32 res5;                     /* reserved (used for PE COFF offset) */
>
> Can you explain the problem you're facing? e.g.
>
> * Is the documentation unclear, in a way that could be better?
>
> * Is there some aspect of the boot protocol that is hard for a
>   bootloader to follow?
>
> * Is there some problem with *testing* that bootloaders respect the
>   text_offset requirements?
>
> * Something else?

Yes, the structure of the header is documented. But nowhere is it
explained how the text_offset field gets its value.

So imagine I've just built an arm64 kernel. Now I want to put that into
a FIT image, where I tell the bootloader where to place it and what
address to jump to, via the load= and entry= properties. Now, the
documentation

  The Image must be placed text_offset bytes from a 2MB aligned base
  address anywhere in usable system RAM and called there.

is clear enough that those two have to be the same value. What is not at
all clear is how I'm suppose to determine what that text_offset value is
that I'm suppose to add to some 2MB aligned address I choose.

Prior to 120dc60d0, one could at least 'git grep TEXT_OFFSET --
arch/arm64/' and see 'TEXT_OFFSET := 0x0'.

>> I've included a Fixes tag since I spent way too much time tracking
>> down where that text_offset might be defined. The mentioned commit did
>> get rid of all references to TEXT_OFFSET-the-macro, but not
>> text_offset-the-concept.
>
> Keeping text_offset as a concept was deliberate. That allows us to keep
> the documentation accruate for older kernel versions, and allows for the
> possiblity that a non-zero offset is introduced in future (though I
> admit that might be a tough sell).

Fair enough. But would you at least consider adding just this part:

>> +- As of v5.10, text_offset is always 0.
>> +

One can, using the documented header, read it post-factum from the
kernel binary itself, and perhaps that's what's intended. But to answer
your first question, yes, I did find the documenation unclear and
expected to find some explicit mention of how one is supposed to know
the value of text_offset.

Rasmus

