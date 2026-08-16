Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879CEC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcoLOjKDDmtqunMNkfYSl4zpIl64RrwdwteFQlSWVFo=; b=jH8nZj9rRQrcwQqczQsEecsp4U
	xuBrlGwmmO4zdfiP9G/B8RN9kpmVaOHQ1kD3EwKE2yjttnC77WDUyOQQKBvXsSAfyrqYOS3/QSEws
	mjsNcGTMrQQxcmQm8kHoxupqAnEaloUjOTJqWZFZoSquFvU+ToBzfaGbC94K7IkKACnw8asU9ookb
	czHB6yZyGhyxn0sN+cwMkVzvGWejejsH/iSgzt2VX1UcH26UCPqGoV5/I5Pqgt3Oo0TDfMrg6oRiZ
	C1PxiGb45NMTkVUbDPJO9/utIUFgdySfL4DX4G4z7MPXpt3q9JrI5RP2ssApDlV/JPilT6kQJJ4cr
	qHIOWUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvfs4-00000004zmX-33Jf;
	Sun, 16 Aug 2026 18:46:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvfs3-00000004zmR-2zj2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 18:46:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 59FC060120;
	Sun, 16 Aug 2026 18:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BD11F000E9;
	Sun, 16 Aug 2026 18:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786905969;
	bh=PcoLOjKDDmtqunMNkfYSl4zpIl64RrwdwteFQlSWVFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zw7BTpZmuiy+my5vtssZbG0M38DjXtf6TC3kamgJyxovcW6Gw9UrhvmEDLapVZ2Th
	 O/Iv8DatLXwk/Q23uSqloyfwHpcylEeylj17Dwedp24cLhjqUGEX+iTXVrR927URi/
	 YYySQ9hbmqgb174wGyQD+XnaxWY/FbqB7eeKdLeZ4b1S26ki+egjIxkfJfosbmHS4F
	 inpAPonbupAdpp01TfVe2vpxwq7pvBL1gySNCuZqpVy+4WpjK74qYD3z8TaWCQqWzr
	 Ggb442NWOLgFkSDoWkj3n0QteNXmp9QohLKmFB5oduX5KKw28DiB8doLEMBAz9NSjI
	 BjQ7Mr31Rp+AQ==
Date: Sun, 16 Aug 2026 11:46:07 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org, Song Liu <song@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	linux-toolchains@vger.kernel.org
Subject: Re: [PATCH 02/12] arm64/module: Fix BTI exceptions caused by omitted
 landing pads in Clang 21
Message-ID: <aoIEVL0M2QPNIOO3@jpoimboe>
References: <cover.1786768375.git.jpoimboe@kernel.org>
 <2ff1b2482406c61ca5979d6284ba5f948a3fbc20.1786768375.git.jpoimboe@kernel.org>
 <6bc20c00-21a9-4315-8ec3-33c7ad6ae95f@app.fastmail.com>
 <aoGFxycNrA0p-H4T@willie-the-truck>
 <6c7153d7-67d1-46ce-afb0-688fca871c66@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6c7153d7-67d1-46ce-afb0-688fca871c66@app.fastmail.com>
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

On Sun, Aug 16, 2026 at 04:49:59PM +0300, Ard Biesheuvel wrote:
> On Sun, 16 Aug 2026, at 12:41, Will Deacon wrote:
> > Overall, it seems to me like there are three cases we need to consider
> > for re-enabling BTI in the kernel:
> >
> > 1. A cross-section call that spans beyond the 128M range and therefore
> >    needs a veneer. I think the static linker should resolve this, probably
> >    by emitting a second veneer with the landing pad. Do we know if LLD
> >    gets this right?
> >
> 
> There are two variants here:
> 
> A cross-section call .init.text to .text that spans beyond the 128M range:
> 
> 1a. inside vmlinux, which should be dealt with by the linker, but which might
> be unreliable in practice due to the lack of BTI annotations in asm files,
> missing exec permissions on ELF sections etc. This is addressed by this series,
> but is only an issue for unusually large kernel images (e.g., allyesconfig).

Right, and if we don't care about the >128MB kernel case (I have no idea
if anybody actually uses that big of a kernel?), then we can basically
just drop patches 3-11 in favor of a simple linker assertion (similar to
patches 5 and 6) which just *always* triggers a build error on a large
kernel + BTI + !COMPILE_TEST.

-- 
Josh

