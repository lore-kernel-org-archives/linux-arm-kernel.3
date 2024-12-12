Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB07E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 21:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gY8FI4zcSFBM0guyga7Q8nya1Km07C9q49GtO180Vbw=; b=oun6xFaLjPQNzyRkKH+4EJE8XW
	ZdCST3wzhDmJrL4zPiz++cuzEl7xZD0j51YNZd1no6XpCDQzjO0P09Mmk9THCX0Hzv84t65AxbaZ3
	DwDwtoBUAY3G3myo7MQBq55jYIcZtA8uJf64PDZtDDDGm22qFnvIXb+Z9vD9+9qDe8hpZa2gpatha
	7bY3mA4bjufXUpmJ4LEFQ4YTZK4Ew54seYDJVs+u84ZcaLZREz0XDSzX1m+ic314f2D3E6Iq8kbnN
	BYht6AW7sKFoH5Ov2ka1OU+5yk3SQU9a+pjy3jdHViYkoZodgmHSx/2ouYEJSURoyzzWK/2Y0UqNu
	fEg3EJvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqsk-00000001zIS-3YjQ;
	Thu, 12 Dec 2024 21:38:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqrf-00000001z1Y-0Dau
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 21:36:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22037A42A91;
	Thu, 12 Dec 2024 21:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2649C4CECE;
	Thu, 12 Dec 2024 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734039414;
	bh=PHriXmjed1B69c3djyjvkmAXWJdj4dHw/YPneJYuUAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MH2/FhwShqp7EWFFC3jfr4d+2oZCa20/FnZU5iVe0RANd6fKcEAOyDhg0LLQyaNdv
	 pmcO1UA39z9T58KNzm3XqDgKZLt9DANUUG/t5ExAKz614iBk5RIziVkypwNC13qWI/
	 2jgx8/jNKF8KHoU70DoOStCkXzsY2DWe7Gy7xhwaxyfEWC7lCkz0hzy7gfwWy8zmlh
	 sfPlm+mOSKY2gWzBbJ//8l/5F8fh0C+09QXwhbUwyN/4/yF50D7F95w1IcIXPfDq5o
	 Rmn0xSAZwOmoInwAfNONVB8zNVzZ3YOg+2vIxg41k5G5rU83HUMrYl+rOEe76FzOCW
	 MmzPg4mkgbLrQ==
Date: Thu, 12 Dec 2024 13:36:52 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org, Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 00/12] Wire up CRC-T10DIF library functions to
 arch-optimized code
Message-ID: <20241212213652.GA39696@sol.localdomain>
References: <20241202012056.209768-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202012056.209768-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_133655_153266_361E4549 
X-CRM114-Status: GOOD (  16.34  )
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

On Sun, Dec 01, 2024 at 05:20:44PM -0800, Eric Biggers wrote:
> This patchset is also available in git via:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-t10dif-lib-v2
> 
> This patchset updates the kernel's CRC-T10DIF library functions to be
> directly optimized for x86, arm, arm64, and powerpc without taking an
> unnecessary and inefficient detour through the crypto API.  It follows
> the same approach that I'm taking for CRC32 in the patchset
> https://lore.kernel.org/lkml/20241202010844.144356-1-ebiggers@kernel.org/
> 
> This patchset also adds a CRC KUnit test suite that covers multiple CRC
> variants, and deletes some older ad-hoc tests that are obsoleted by it.
> 
> This patchset applies to v6.13-rc1 plus my CRC32 patchset.  It can be
> retrieved from git using above command.  This is targeting 6.14.
> 
> Changed in v2:
>   - Rebased onto v6.13-rc1.
>   - Tweaked crc_t10dif_arch() for arm32 and arm64 to not call
>     crypto_simd_usable() more times than is necessary.
>   - Added patch removing redundant crc16_kunit.c which got added in v6.13-rc1.
>   - Made some small tweaks to crc_kunit.c.
>   - Listed Ard as a reviewer in the MAINTAINERS entry.
>   - Dropped scripts/crc from MAINTAINERS entry, as it hasn't been added yet.
>   - Clarified a commit message.
>   - Added Reviewed-by and Acked-by's.

FYI, this patchset is now in linux-next via the crc-next branch in my repo.
Additional reviews and acks would always be appreciated, of course.

- Eric

