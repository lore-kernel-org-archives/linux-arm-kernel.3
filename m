Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDD8C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 14:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDgu/7+GOlU7oW9geJEPCy6Ik6pjzN8DtRgX5YXRAsI=; b=DTafZp44RKsPIXTBIfTISrF2Yp
	kSculLcfxPGUs/92FTqgOxrpq/VYS7VD3ZpvWAsUZ7O492i6FQkd0ZHISCo6D+TsEDMMUXAq/Xnck
	3F8zV3gmnJZU7id+p/oxV/IM14QGihYF4Bq0f4X//ytV189aS3H3f/56+7AcNtXYts+1UcljVaIjP
	ERTzvRTQkbnVNiwJv5oiuve+1KCKJF1HkHGB2RhbFKAKY7q8xnYyHayOwwBgyGlzuGr/9EKAoKzTV
	NjfwDVik5kVZ/lZ02fKqtTaXHneNgwrGKtzWaq6JlvYpQxPi9Qy5t0w6y78IvCfy+D3ofxTne5Fox
	X7GOggRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLTQ-00000008GAv-1KlP;
	Fri, 07 Aug 2026 14:23:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLTO-00000008G9o-31DF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 14:22:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 00221600D8;
	Fri,  7 Aug 2026 14:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6821F000E9;
	Fri,  7 Aug 2026 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786112576;
	bh=hDgu/7+GOlU7oW9geJEPCy6Ik6pjzN8DtRgX5YXRAsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bAH4zkK3uH8w1Smo1l6rXwRTmOTL31Cg5tPvcFUELH3FLKNWBk5fvgAK6EYxVpYKj
	 VQMNYVXEBnhhvBZ6+k0eK1T2tq260lSTel7EUKZA4Sz5Vuar9YWHDdTIGX0V8DFnX6
	 xIC5yFu/B8ZRppFa7IFFokOaEMZ+VQch/iN/GspZ3381/UQjef/CW3HyTyQtvo88lG
	 VzhTkpaDA5cD7f4h/TLEMyXuj2Pq1+ZD6YdmqnVLY0IUlsD8Ln0vVFdcHeXwFn4V5q
	 lECgnhFTuGk0wzdgsr7AWmrbGjM/Ma1txq/H00UIGy4nbqIXatusY3hyGQ0N4vARGL
	 D06/Guo7tLQXQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Liz Prucka <lizprucka@google.com>,
	Seth Jenkins <sethjenkins@google.com>,
	Kees Cook <kees@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH v8] arm64: mm: Unmap kernel data/bss entirely from the linear map
Date: Fri,  7 Aug 2026 15:22:46 +0100
Message-ID: <178610348593.1066050.1374603166096806542.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803163346.3490089-2-ardb+git@google.com>
References: <20260803163346.3490089-2-ardb+git@google.com>
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

On Mon, 03 Aug 2026 18:33:47 +0200, Ard Biesheuvel wrote:
> The linear aliases of the kernel text and rodata are also mapped
> read-only in the linear map. Given that the contents of these regions
> are mostly identical to the version in the loadable image, mapping them
> read-only and leaving their contents visible is a reasonable hardening
> measure.
> 
> Data and bss, however, are now also mapped read-only but the contents of
> these regions are more likely to contain data that we'd rather not leak.
> So let's unmap these entirely in the linear map when the kernel is
> running normally.
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64: mm: Unmap kernel data/bss entirely from the linear map
      https://git.kernel.org/arm64/c/fb0f3ef5601a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

