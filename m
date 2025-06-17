Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A89C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 20:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsc6+rj+ZpD8mRHG2bGPM7ojavTJkazfZIEipBQH2zA=; b=dKbF1jtpGg0/Mf30VCekc3WrZn
	YSnReonE+tAqEPpWGrNs91Yhqg8Xv8LCyWCjUzklCa+qee9ReZ+vypJZsywms3bPCLWpBgyrfn7Ww
	1rXGSVsccTiybYJHzkq/oQ+hHJo9Gpt4a6hDltWYkzUV73eV5ajcmDR5eEZm8fxuKduPPNmGto7dM
	A3fRIA1RKZFsBUHhYewovxgb1wX4bRQJfvKwRc780LxgMmw+e2faSSBv1aBaYYl57tfc/vza7/R2z
	ePdBAyYbNppIGFCbsWM7NAcJKiWyyQopSRRY+ztvmCT/XZ6/WS/khO34UyvCHeLp8396aNBhPf40H
	Ac8AGumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcV8-00000008IsT-1gW2;
	Tue, 17 Jun 2025 20:01:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcSw-00000008Iea-0kU3;
	Tue, 17 Jun 2025 19:59:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 528F36111C;
	Tue, 17 Jun 2025 19:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D714C4CEE3;
	Tue, 17 Jun 2025 19:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750190369;
	bh=sVM19GCCKQhRp7EuGvOjAU8kPQ/rNAQiUgZpz7qYa9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jpuuywa+IXfUA58X/baAFYHnGhet/xCyxu6nUDvANGgktcIrxSAm0C3qyjPft1OJ8
	 /y4dJgVEs9CvsoBUi7zm41P2K5DVBQGFHkF63SMXLVtBPNg+RNoCDRhykPgB/cCb/I
	 0GUs7QVKT7dzc10B7nKJBKSa+HGdx8xUpToVFPL/pn9lQnclWua9imiZaTuOFliWkK
	 QJ3Lk7X8LqghgjWhlMoEew05m6Q36dKnoSXfGrVIyruIKgN0nV1Ro/IMSMFobGM2Ss
	 yUn50Tvu5YRZwURvrxaD4PLtRZwUsym+zN1F6jHXG/OF7wTlnMynGIiEcyupVN8L2t
	 rC07wEKDje+cg==
Date: Tue, 17 Jun 2025 12:58:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
Message-ID: <20250617195858.GA1288@sol>
References: <20250616014019.415791-1-ebiggers@kernel.org>
 <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
 <20250617192212.GA1365424@google.com>
 <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
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

On Tue, Jun 17, 2025 at 12:43:54PM -0700, Linus Torvalds wrote:
> On Tue, 17 Jun 2025 at 12:22, Eric Biggers <ebiggers@kernel.org> wrote:
> >>
> > The tests are already in their own patches: patches 4 and 5.  Yes, this patchset
> > has a negative diffstat once you subtract them.
> 
> Yes, the patches were separate, but my point stands.
> 
> Let me repeat that part of the email since you seem to have missed it:
> 
> > If I see a pull request that only adds new tests, it's a no-brainer.
> >
> > If I see a pull request that only re-organizes the code and the
> > diffstat just just renames with some small updates for new locations,
> > it's a no-brainer.
> >
> > If I see a pull request that does both, it's a pain in the arse,
> > because then I need to start to look into individual commits and go
> > "which does what".
> 
> IOW, I really prefer pull requests to do clearly separate things too
> when we're talking re-organization. Or at the very least spell things
> out *very* clearly.
> 
> Otherwise I have to waste time just to go split things out _anyway_.

Again, the tests depend on the code they test being added first.

I could do two pull requests, the first with all non-test code and the second
with all test code, where the second depends on the first, i.e. it will have the
last commit of the first as its base commit.  Is that what you want?  Or are you
misunderstanding and thinking the tests are independent and apply to current
mainline?

- Eric

