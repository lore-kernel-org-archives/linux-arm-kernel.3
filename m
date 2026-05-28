Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2865CCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdR59bdOLxfad3MlDdWkNtt/Xj++SWYyaF4AAiiPNOc=; b=35hPRW0dxXTU8vHPcIGnWfTgkd
	3vJbwPy4UjDWc4TkLVwqZ0cvzb1Bs66ihj9mux8i6yFrol1O/buYFwWrA8DYVvnSwaslbAqISgCVf
	m61euc9xON3qJzVyLGB7bqMCRqR6dZbFKB44bjUc8oo7AKj3bO5DEM37hQMEVv4xuEsbcLhjIb8tM
	iUA4fbclhHU8SxA6OOuLmz//z714XXF/asnkBFh0+tWKMpaR0HghQ21gjVgk1iex+G3doVs5Rje37
	+FrkL1QyLr3CxS3gwlxhc1k6oen8n3ZK8iMdJOfBddf89vX4gNlQ5Sln6hnVKAz/ANozDeKnFtGD1
	EzDGGwCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShRg-00000006MWY-0V1k;
	Thu, 28 May 2026 20:35:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShRf-00000006MWO-2X2B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:35:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B35C56020A;
	Thu, 28 May 2026 20:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345F61F00A3A;
	Thu, 28 May 2026 20:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780000510;
	bh=HdR59bdOLxfad3MlDdWkNtt/Xj++SWYyaF4AAiiPNOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jxckgX6IuzS/15UM3yoi8wUw31sv5pTRwPf89lOLv7YAmOWqO7Y6l4UUIXYmD26Bi
	 5/D1Y5q8jASex0Bx+2bPrFvEO53T8Kf2a8FL7UTTAEXU/dlplF21UzqJZrOrPLNIzf
	 3BEty7OmJMnTZLQ20t6N9v8jZJfzG+uWtUVtXmD+50ggMTe7kaV62YEH1ybmMWBExd
	 Qiw3LWsak9AEq6XkDxz6IuIW65bCqlwjc0WPYGFf9+KszGLwP3DWNpO3zR8JuwUmDR
	 YjxEkcT90DeMfcbTYGYv6tXtfQWO9XnAGFkuQNiRoIdOqgLg6l6HIsengSTBj/6A/q
	 I7ZAXSyOuswtA==
Date: Thu, 28 May 2026 13:35:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-raid@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/8] ARM crc64 and XOR using NEON intrinsics
Message-ID: <20260528203508.GA2054@quark>
References: <20260422171655.3437334-10-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422171655.3437334-10-ardb+git@google.com>
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

On Wed, Apr 22, 2026 at 07:16:56PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> This is a follow-up to both [0] and [1], both of which included patch #1
> of this series, which introduces the asm/neon-intrinsics.h header on
> 32-bit ARM. The remaining changes rely on this.
> 
> The purpose of this series is to streamline / clean up the use of NEON
> intrinsics on 32-bit ARM, by sharing more code, clean up Make rules and
> finally, getting rid of the hacked up types.h header, which does some
> nasty things that are only needed when building NEON intrinsics code.
> 
> Patches #2 and #3 replace the ARM autovectorized XOR implementation with
> the NEON intrinsics version used by arm64.
> 
> Patches #4 and #5 enable the arm64 NEON intrinsics implementation of
> crc64 on 32-bit ARM.
> 
> Patches #6 and #7 drop the direct includes of <arm_neon.h> and perform
> some additional cleanup to reduce the delta between ARM and arm64 code
> and Make rules.
> 
> It would probably be easiest to take all these changes through a single
> tree, and the CRC tree seems like a suitable candidate, if Eric agrees.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Eric Biggers <ebiggers@kernel.org>
> 
> [0] https://lore.kernel.org/all/20260331074940.55502-7-ardb+git@google.com/
> [1] https://lore.kernel.org/all/20260330144630.33026-7-ardb@kernel.org/
> 
> Ard Biesheuvel (8):
>   ARM: Add a neon-intrinsics.h header like on arm64
>   xor/arm: Replace vectorized implementation with arm64's intrinsics
>   xor/arm64: Use shared NEON intrinsics implementation from 32-bit ARM
>   lib/crc: Turn NEON intrinsics crc64 implementation into common code
>   lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64
>   crypto: aegis128 - Use neon-intrinsics.h on ARM too
>   lib/raid6: Include asm/neon-intrinsics.h rather than arm_neon.h
>   ARM: Remove hacked-up asm/types.h header

Applied patches 1-6 to
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

- Eric

