Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880C9E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 21:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hKZ9SY7EGr04EhqIPL6Drfty1RVOYgzWDHsZqBj3uw=; b=zQyflFNVEydv3D0j4rJTMgTTBJ
	CtcngrDBW7kwB326ZTPSsDroPIho0AnwcBk2+oWmK4bWMNwZlenmjNE0faWTqv6phcNUwyLfz8gkI
	V72l8HsY6qGTe/aPs7A4t2GPjA377qHbxL3GgA9i7ri6M7Gu+jnHt9F35In9vmhxoKN+g06fp8O++
	GiLWhJ0ap+F5FtRg0b8QSOy9ri4q3TTPRtuUarekmrAgiNA0RPOeGDChROgNYFY/nuNtDlImr6/3h
	Wz0ifTbhYxaDwFlmiF58LLXIXQBnBCpc6pUYEbowePRAMYSiMtDZJMXSAm4eZ15iNX+C/Ugz9YFIs
	+/DNjyUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqtn-00000001zWc-26K6;
	Thu, 12 Dec 2024 21:39:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqsL-00000001zAT-0u5H;
	Thu, 12 Dec 2024 21:37:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4670AA42AAE;
	Thu, 12 Dec 2024 21:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE1CC4CECE;
	Thu, 12 Dec 2024 21:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734039456;
	bh=hF4mJhnVVXZXfZmgDwcher6bwGaSHVExWyvvXFEjp2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olHk7jG7/rj4jRsPenllCQhTf5QGq/o+IXUWAK82q6pCJzN6i0SdtI7XXvHvfiYLW
	 o7Yb2dtL1CH8VNEjEG8A5mpzTFx8yH0hEIFW7L1nUsgKKc9ugXfj5gaT9OXUqTDi58
	 6N9jkLSNkjhUTqlAcmvg1HLxdVRSD5WcssiicIJ2Nxmvr9M6pJD1wQCUfPhz2WNC+t
	 2xdjNIS1+MX5kC7hdRX17/1bm7hIdvOxPxxX9hHKaS50L38XE0/FImLbSAiegVPTIq
	 VSrgB1QqyjlJeR5aTe0UIkwwE/K4CIPz765ubY7ooteF3fveq0wORNZ7ubo5V6o5Xr
	 rY71XaqihMshQ==
Date: Thu, 12 Dec 2024 13:37:34 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v4 00/19] Wire up CRC32 library functions to
 arch-optimized code
Message-ID: <20241212213734.GB39696@sol.localdomain>
References: <20241202010844.144356-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_133737_313924_04750381 
X-CRM114-Status: GOOD (  12.49  )
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

On Sun, Dec 01, 2024 at 05:08:25PM -0800, Eric Biggers wrote:
> This patchset applies to v6.13-rc1 and is also available in git via:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib-v4
> 
> CRC32 is a family of common non-cryptographic integrity check algorithms
> that are fairly fast with a portable C implementation and become far
> faster still with the CRC32 or carryless multiplication instructions
> that most CPUs have.  9 architectures already have optimized code for at
> least some CRC32 variants; however, except for arm64 this optimized code
> was only accessible through the crypto API, not the library functions.
> 
> This patchset fixes that so that the CRC32 library functions use the
> optimized code.  This allows users to just use the library instead of
> the crypto API.  This is much simpler and also improves performance due
> to eliminating the crypto API overhead including an indirect call.  Some
> examples of updating users are included at the end of the patchset.

FYI, this patchset is now in linux-next via the crc-next branch in my repo.
Additional reviews and acks would always be appreciated, of course.

- Eric

