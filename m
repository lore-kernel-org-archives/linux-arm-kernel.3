Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B58107BCCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtcNUMGKVVgSM3uf08zTcKGbo2CYKpe7hKWLv4V5pfg=; b=RhBY6bx9ymeqwLH8OO3eWiRdKW
	7JCq7ZFRlIQdEyhkDCB4Y8tbJRMS+rXcsHZ6iPD8EQnsbprUcGmiGoUakdX9BGPvN9SSRcsYdfA8U
	QHn4wCoMbcEFNG0hOp8dPYmufNnjvP3waSiBvQXlJUNuU67XEpBkc0ofRKt8+2tLbY8JpNp3jLjnV
	EyAl9K4eHCH+scE569NRutBtchSUSLA7Pmpabt055iAWYz2WD5K0HwH4bPHeiy7sJhztHirTxPSjK
	P7uzFBFNFNJGTiiEmF/V/0gwxE3BrNJg4ZpiYbEAn/tJBJuGD/MuCUuyQbt08ASMoLEGbawIo5i7Q
	DMd5QaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15pR-00000000iHO-1J5c;
	Fri, 13 Mar 2026 16:57:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15pP-00000000iG4-26Wx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:57:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E755060142;
	Fri, 13 Mar 2026 16:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A5AC19421;
	Fri, 13 Mar 2026 16:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773421054;
	bh=MTmIlUNYfXXnCtYkphjtUGyol0ytTPCJ+MfxqNUsfM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AuI3+9HmBaEN1ebQ3DX/E6l5JyTzQpzp/3gEvaJ4Uz1vZbXGHV0Mlh/kenhsU9R0o
	 m+e8q7ZVdeQAWzAa7H8nhKLvfrTegfdH/tuSlbjYWzsXSzf+lrKm/AOpQfARaAhhry
	 Nsovi3o1l5ys6wT24pt0QQzOL6Cip/aLB5+x4uTFH7zRa8vFkRmPEBO5H5toYdhqSZ
	 y9wMG1bsxs/qfjDBnJ9Dw0yCUYz8XsPQlzH1W/yqKhw2pGIGUP0cO1lsHtheiL73kV
	 YDlqNOFMeAzUshb1fH+bBR3cIxL+mHdUsrY0E8om/bBM/jeqmfPRi/zcCUineRoVp/
	 xpx5QrRMtSxBA==
Date: Fri, 13 Mar 2026 16:57:30 +0000
From: Will Deacon <will@kernel.org>
To: Pepper Gray <hello@peppergray.xyz>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] arm64/scs: Fix handling of advance_loc4
Message-ID: <abRB-raKFBZItDQP@willie-the-truck>
References: <CAC+fAGbCjQSGbtkbGr5Qb=tPez1i4KZ7TtC0DPHxGbC0wLvBAw@mail.gmail.com>
 <abLGwg1aFyoCosHi@willie-the-truck>
 <4141e534-0d81-45f7-a341-98ae1a6dcd8b@app.fastmail.com>
 <CAHLDejw4XKZ3-dbFFRYVGAZyYkmkzW5cdkvJNVJ9p3ARMUUyjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHLDejw4XKZ3-dbFFRYVGAZyYkmkzW5cdkvJNVJ9p3ARMUUyjQ@mail.gmail.com>
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

On Fri, Mar 13, 2026 at 08:13:01AM +0100, Pepper Gray wrote:
>    This is my system:
>    6.19.6-gentoo-dist-hardened
>    LLVM-22, aarch64-unknown-linux-musl, clang version 22.1.0+libcxx
>    Ampere Altra (ARM64, Neoverse N1)
>    Some patches are needed which I linked
>    here: [1]https://bugs.gentoo.org/971060
>    I'm working on a script to reproduce the error, will share it asap!

Thanks.

In the meantime, I've picked up your fix:

https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?h=for-next/fixes&id=d499e9627d70b1269020d59b95ed3e18bee6b8cd

Will

