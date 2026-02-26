Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03E6FD45F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 00:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFPNML9p0fU9X2KobrUBzBTGV3ZxAMWtnYuifYdFCAc=; b=OCgfBF7A6zgM8j2vRt/ThnGOlQ
	OLb8MCDojfNc85BgIHmHhenYCNFx0hQIFWxfLv8ZLKGwHkaHmYLDlejGmkVK5WBcYgeFyckMAE5jG
	kjmCI3QPrgdY1+UaYLw2zkbWuP+nRUAnFPFF8nv/sbLWe/nwgUSUWiporxh6xrsBvk5wbOUnJDWdM
	ctd6ARfdcgpSzqrk4yM0UKwE6UpYHK3coCvksE2TOPTl13uvuNz2vGXJYF9bh5tqqWPvGgTlaqBU7
	FeMMQ1Frh6LgCsN2npITi7DFwNy3buMkkcMYM8NpPHO1uh5RnjXfkPlrevYmS3ZiDPJU2FTUm9j05
	9OtDRLgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvOuO-00000005730-0goa;
	Thu, 26 Feb 2026 00:07:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvOuK-0000000571z-23vB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 00:07:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5BAD60097;
	Thu, 26 Feb 2026 00:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D07C19423;
	Thu, 26 Feb 2026 00:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772064427;
	bh=5yuBK1+XvBaPJ/ZcwP5F9sNSIw7nxYaObwz8LIn0pQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DrZeJNuAVOWlKWNK4zIuOXuZcJfbb/w1HeiYxvmqcvvNceL8WuKH53rePV+/Tso4O
	 K0N/L7wloD32k3a7IbTcnb8mEiOa0GaGqnsOjrcffguIMs0+62gcO+SZWPPTbgKoB7
	 E4J8fEZIjyzVvFhcOjfXGbdbQYr3tH01fbYv/lv6S60LQaCTMGaTJO4qKpZRlEdGL0
	 R6Oh02rasdtfQx5EjLja/KARBH6Nd8quuGUfGJDVFB3Zi7b+mA78TPiOijArK3jMt+
	 Hjv0K4UnVxgsZ6sjcrlxjk8qY5ywg/TaEze64zHhRqFNBHL9CsbruOHLauA9QxzKTK
	 qoP26r0Gyyotg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Zeng Heng <zengheng4@huawei.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 0/2] arm64: Fix syzkaller splat in ioremap_prot()
Date: Thu, 26 Feb 2026 00:06:54 +0000
Message-ID: <177204899339.3241227.7058884566583084388.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223221012.31962-1-will@kernel.org>
References: <20260223221012.31962-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 23 Feb 2026 22:10:09 +0000, Will Deacon wrote:
> These two patches aim to resolve the syzkaller splat reported by
> Jinjiang at [1].
> 
> Rather than introduce a new arch hook, as was proposed in [1], this
> series instead augments the existing ioremap_prot() hook on arm64.
> 
> Cheers,
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/2] arm64: io: Rename ioremap_prot() to __ioremap_prot()
      https://git.kernel.org/arm64/c/f6bf47ab32e0
[2/2] arm64: io: Extract user memory type in ioremap_prot()
      https://git.kernel.org/arm64/c/8f098037139b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

