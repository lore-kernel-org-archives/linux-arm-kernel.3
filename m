Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A725CE77182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 01:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rhbp94t2OglVLxZeXLyV7NNMxHaahIlNEaaqNrX+KWE=; b=1rbPp8hpwQMzEJ9mL2XDyp/AgT
	O4LNgG15pYznIxv3tXc4Gi4pvxwCB2np3oK5cLsYW2OvwnVFPqI6CRG2oA/GHitzGdZOHRQaLg28Q
	P9DIM/7dT1LtMHuCchs2XGS3RABaM8VXHIxxBN0k4F7YdzUgYdhKBoXZJ/AV/nXDXjy5S58ZbXmqD
	reF70dmqxycLX+3YgIkhAwNN7u1aVD6aIVso7dFK/Xtxmi2g6eoH8A+eJU4v9crB0vC2LjRNmIq6E
	u3u1H2G1GSwuA/xBg/7JmKhHuLF4Xz1MalP8lGf57NJLT2HRpHlmegAOusQsrFSFAiJBnXnxALgzZ
	XTQbDSXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLXZ4-0000000GdsO-1tHY;
	Thu, 12 Dec 2024 01:00:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWNX-0000000GWE6-1OFy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:44:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 000B4A4254B;
	Wed, 11 Dec 2024 23:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F2BC4AF0B;
	Wed, 11 Dec 2024 23:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733960665;
	bh=NhjoOwOjzquX2bXnZzEYItVz/He94fvuHxQEX3N9G6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Loz5Dw5dkLz7Jykt2rrpTouLZH3Gs2C/w+EJHtak+Jf5fXazB1SbzLsbJpNdDRJy0
	 7WNZGb8AsPd0kZ9xWfJOiq6kBzVsce3R76h6EYpxnbBt46GBBm7d/qKfzrWc5i6PT6
	 nxt0d3Omjq38QqbVNnIHZCTx8Ui3jJRd39GMZqHAshT/eX95+Uah3Ic4i7ZvQD1Wwo
	 RMdpx+SAc/VfXWt0VOB1dq8466Ijf9B5iV4xalUTxZA58O4w12gZgdGnHBmEOuvaK4
	 16pOWO7IF3lLGYIr5pZ8YvDT6ifmOIH05g7L2tTzD8Bk22cVbvNn9TMXzkaHxCs7wi
	 pFoRm8rUUl95g==
From: Will Deacon <will@kernel.org>
To: julien.thierry.kdev@gmail.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Alexandru Elisei <alexandru.elisei@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	maz@kernel.org,
	oliver.upton@linux.dev,
	apatel@ventanamicro.com,
	andre.przywara@arm.com,
	suzuki.poulose@arm.com,
	s.abdollahi22@imperial.ac.uk
Subject: Re: [PATCH RESEND kvmtool 0/4] arm: Payload memory layout change
Date: Wed, 11 Dec 2024 23:44:14 +0000
Message-Id: <173395873873.2737640.3783988676491071650.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241128151246.10858-1-alexandru.elisei@arm.com>
References: <20241128151246.10858-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_154427_434960_447F321E 
X-CRM114-Status: GOOD (  15.00  )
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

On Thu, 28 Nov 2024 15:12:42 +0000, Alexandru Elisei wrote:
> (resending because I accidently only sent the cover letter, sorry for that)
> 
> The first 3 patches are fixes to kvm__arch_load_kernel_image(). I've CC'ed
> the riscv maintainer because it looks to me like riscv is similarly
> affected.
> 
> Patch #4 ("arm64: Increase the payload memory region size to 512MB") might
> be controversial. Follows a bug report I received from Abdollahi Sina in
> private. Details in the commit message, but the gist of the patch is that
> the memory region where kernel + initrd + DTB are copied to are changed
> from 256MB to 512MB.  As a result, the DTB and initrd are moved from below
> ram_start + 256MB to ram_start + 512MB to accomodate a larger initrd.  If
> users rely on finding the DTB and initrd at the current addresses, then I'm
> not sure the patch is justified - after all, if someone really wants to use
> such a large initrd instead of a disk image with virtio, then replacing
> SZ_256M with SZ_512M locally doesn't look like a big ask.
> 
> [...]

Applied to arm64 (sina), thanks!

[1/4] arm: Fix off-by-one errors when computing payload memory layout
      https://git.kernel.org/arm64/c/167aa1e
[2/4] arm: Check return value for host_to_guest_flat()
      https://git.kernel.org/arm64/c/ca57fb6
[3/4] arm64: Use the kernel header image_size when loading into memory
      https://git.kernel.org/arm64/c/32345de
[4/4] arm64: Increase the payload memory region size to 512MB
      https://git.kernel.org/arm64/c/9b26a8e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

