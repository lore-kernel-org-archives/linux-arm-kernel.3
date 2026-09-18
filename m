Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEC0C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 02:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LyEuyhMjybdKsrqgNnG3WNcZJLY74KYhr+Yi4PBNvdg=; b=rLUGhY+1OczrQ1ySQnu48+m9F9
	xuPlXUb0ehEA37o5sGfdtEQ4sggFRPTFIk6XHBeBNwvfM3hjWW06AkiYANxsMx45dqryiULsAt7/W
	yONyG69IkMhJU7UTjdO0Ynlja5+s2LQKAQxvhC785vcy4UBnxZXo/QpVrbNLm6Wbja9ENBJkhVrFH
	XWc8h0mT2BMY1JFShMdTvJHQzG8nBU0dTnmzQ3GvMqaSkA8OBICCnsGlYzUkYw1wH0xZM7Z4gemf1
	XOcLpvZwmbnj8hoil8yXsG+SbBdnOju6V6pp/7oO+Fb8hdw4yoGakNIP/STlWqnwV8KlF8LPSuENu
	n1K9migw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ONN-0000000DK1W-2o0d;
	Fri, 18 Sep 2026 02:30:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ONM-0000000DK1I-2ZTe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 02:30:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0515F4329F;
	Fri, 18 Sep 2026 02:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD0B1F000FF;
	Fri, 18 Sep 2026 02:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789698655;
	bh=LyEuyhMjybdKsrqgNnG3WNcZJLY74KYhr+Yi4PBNvdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X5FFh4FW0+DE8D8u2gfp+SVJDYepLGKxRb6zXmYAK/Rsm16mBGOx9Sp63TeP+sysJ
	 3HgI48/Yrr5x4WzjUu+uJxEUr8Yt5pu04R4i9/bEfGOvsm8wBPjwZ5F18vSws9cfAl
	 wZZ4hAHjYKsiwIFU6sLSxFZgmYumthBB4/QlNjyaXpxRmWKVyskfYNId4syOJGSs8H
	 4hw2BEdJQ9quCxDj9NcbbsMHc1LL4uy2KgLa0Q/xykks4QcPtO+HSrEIJPLIhT0ONS
	 fghKouZiMJNIi5VPcivBoyrKcQsa4uWxDZPtknhSjD/06/UWYo/D/T/PSWQguovrip
	 +qI1vGXa9QgUw==
Date: Thu, 17 Sep 2026 19:30:54 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/2] ARM: Use type override hacks only in NEON code
Message-ID: <20260918023054.GB1703@sol>
References: <20260909163319.2116279-4-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909163319.2116279-4-ardb+git@google.com>
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

On Wed, Sep 09, 2026 at 06:33:20PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Now that the RAID-6 code can no longer be built for user space, we can
> drop the direct dependency on the arm_neon.h system header, and include
> asm/neon-intrinsics.h instead.
> 
> Since asm/neon-intrinsics.h has all the type overrides needed to include
> arm_neon.h without conflicts in the uintXX_t types, those hacks can be
> dropped from asm/types.h, and so the file can be dropped entirely.
> 
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Arnd Bergmann <arnd@arndb.de>
> 
> Ard Biesheuvel (2):
>   lib/raid6: Switch to Linux's NEON intrinsics header
>   ARM: Remove hacked-up asm/types.h header

Reviewed-by: Eric Biggers <ebiggers@kernel.org>

- Eric

