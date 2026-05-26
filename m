Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BFFCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GGjD03A3MFR1E+2x0JHp9IAt4+VqFMFWRBB5rYD3t8=; b=pF2f/xI/4EhSL7T3t3QSnVPM1D
	qRJ/Nk9jXJsqI7z1ffcyXIVYidhncswXCh5Fvtt1AwU5qK/v2YGWTUx3UuVV69sld8l0x8WkQkJGx
	6RU5mSfylRorvuc2oFnUwopOBuGHvaH2/MgHBGilDnEwAfpPTb0d6Qo2/fv+xnsDSCsZwqX7jd04S
	sHXTCnMNCJ26PmKr5p9EImN1JO3OzyrRh2JTVA8G5eFWqHGKJTwGg0UlBXdUmFoEqmrNE+FVDCuZc
	pYTW/Qhf+utuJg6kX1jXzk0q8Z3+c/eUJ0cXGzEtLyI7geZCXoS/2FrlmbgJ+FnE5xyBVNIAoc+N0
	nxVvoC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRthp-00000002NKk-28t3;
	Tue, 26 May 2026 15:28:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRthj-00000002NIy-47eJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:28:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24338168F;
	Tue, 26 May 2026 08:28:20 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E99A3F7D8;
	Tue, 26 May 2026 08:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779809305; bh=Vn96Xv1urpIQgHp5+8KzXszTCaXvdSDbQYLCgOToJmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POEqMYRWyqgVTmrQqYt8a94MDpa71Msui1uZ2AQ6N3re2QZmtBMgdrHP8K56bap4J
	 KFa5fJcGcAAqfvljGbZWva33zxPMGHhyXNaJVimz4TuiQ5NQ+OsJwgj7RLQ886eGy+
	 FXiHO9rRUmBwAtChf9FHRrgNMoH5lx2ah6+sJuZw=
Date: Tue, 26 May 2026 16:28:17 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
	maz@kernel.org, oupton@kernel.org, tabba@google.com,
	will@kernel.org
Subject: Re: [PATCH 17/18] arm64: fpsimd: Move SME save/restore inline
Message-ID: <ahW8Eba3SNqfVDdk@J2N7QTR9R3>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-18-mark.rutland@arm.com>
 <ahWpST4K3rbMbjWK@J2N7QTR9R3>
 <08e5ce52-be74-4fc5-a0b2-8f405a5eff99@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08e5ce52-be74-4fc5-a0b2-8f405a5eff99@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_082828_062408_5F3291A0 
X-CRM114-Status: GOOD (  18.12  )
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

On Tue, May 26, 2026 at 03:39:56PM +0100, Vladimir Murzin wrote:
> Hi Mark,
> 
> On 5/26/26 15:08, Mark Rutland wrote:
> > On Thu, May 21, 2026 at 02:25:55PM +0100, Mark Rutland wrote:
> >> +static inline void __sme_save_za(struct sme_state *state, unsigned long svl)
> >> +{
> >> +	/* The <Wv> argument to STR (array vector) can only encode W12-W15 */
> >> +	register unsigned long v asm ("12");
> > Sorry, I had meant to put "x12" here, but evidently GCC and LLVM accept
> > "12" on its own.
> > 
> > For clarity (e.g. to match the comment) I'll change that to "w12" and
> > make the type unsigned int. Likewise in __sme_load_za().
> 
> I suspect you are intentionally not using "Ucj" constrain to limit register allocator,
> if so I'm wondering why?

Thanks for the suggestion; that was ignorance rather than intent.

I was not aware of "Ucj" as it doesn't appear on the public GCC
documentation:

  https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html

Looking at the machine description file, that's marked with '@internal',
so IIUC GCC folk don't seem to expect/want people to use it. That said,
LLVM seems to support it.

I'll go check that all relevant toolchains support this, and poke GCC
folk to see if they're happy to promote that to a public constraint.

If that's all good, I'll move over to "Ucj". If not, I'll update the
commit message and/or comments to explain why.

Mark.

