Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737D6CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 16:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYxHUrhvUcgT5oBRsyiThgUc5t2jF5qQX768Aozw98Y=; b=3aFDYE/EaOlDwCfKKTxrz/2ry4
	tjkTgK2rTVlXKaT6XCsc9W4OuvOVeHGwYCro5ZbydXrZzPjtKb3CMMr36kK4292Zf1+kU/AnrcF6j
	gM6Uf5TWe1yjFYpeMca0rHc7i+MnJy10fpciZfvHeEpXMtWxib2Ndax0Htwyvks+LlGEIgBbo3hTj
	iNGMnfR/6QdE9M58i6kSYQSj6Cmy9hdgqhYHxGB64FVUfHuJdQWQQq5pQ3Wm2KZi5oKzlm0gzwsin
	iv8bWjtevhB4xiCi6yhUG6YhHDj/JeYlT94Zud4DfrfvbVbtQspfmm4t7PiJhmG8KufoplVwaoXyh
	CJw2AARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOfKe-0000000Gx53-0Mew;
	Thu, 27 Nov 2025 16:59:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOfKc-0000000Gx4T-0Bsy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 16:58:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55F47176A;
	Thu, 27 Nov 2025 08:58:48 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B8CE3F66E;
	Thu, 27 Nov 2025 08:58:53 -0800 (PST)
Date: Thu, 27 Nov 2025 16:58:50 +0000
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
Message-ID: <aSiDSp8NpqJkr1oD@J2N7QTR9R3>
References: <20251127092226.1439196-8-ardb+git@google.com>
 <b1dae5a7-27bd-42de-bcce-9fd3c2b1c178@arm.com>
 <CAMj1kXE-Qm4DQNAcg8Tg7YM4EMdLBu_UJm7M8Cpk3t5g7XqP5w@mail.gmail.com>
 <e996fdd5-7113-4327-a884-336dd5f77c4d@arm.com>
 <CAMj1kXGyYMy2xhcdNicHkMfWBnEjyhc+xg8ciuR-6WXDxDpZxg@mail.gmail.com>
 <f95593ac-d4cf-4e06-9a94-cc5133897c59@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f95593ac-d4cf-4e06-9a94-cc5133897c59@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_085858_126863_88F04827 
X-CRM114-Status: GOOD (  20.27  )
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

On Thu, Nov 27, 2025 at 03:56:59PM +0000, Ryan Roberts wrote:
> On 27/11/2025 15:03, Ard Biesheuvel wrote:
> > So the question is really whether we want to dedicate 16 bytes per
> > task for this. I wouldn't mind personally, but it is something our
> > internal QA engineers tend to obsess over.
> 
> Yeah that's a good point.

I think it's a fair point that some people will obsesses over this, but
I think the concern is misplaced.

I know that people were very happy for the kernel FPSIMD context to
disappear from task_struct, but 16 bytes is a fair amount smaller, and
I'm pretty sure we can offset that with a small/moderate amount of work.

AFAICT there are extant holes in task_struct that could easily account
for 16 bytes. I can also see a few ways to rework arm64's thread_info
and thread_struct (which are both embedded within task_struct) to save
some space.

> Is this something we could potentially keep at the start of the
> kstack? Is there any precident for keeping state there at the moment?
> For arm64, I know there is a general feeling that 16K for the stack
> more than enough (but we are stuck with it because 8K isn't quite
> enough). So it would be "for free". I guess it would be tricky to do
> this in an arch-agnostic way though...

We went out of our way to stop playing silly games like that when we
moved thread_info into task_struct; please let's not bring that back.

Mark.

