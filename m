Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E59C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 14:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpPjlk2ErtF9jhExCxs6+w5cdDLWs7hni4w+bm7g3dI=; b=lBd6AfkNNfwjBJY2zb+l+VCeC+
	fWRe4MjgmcuqgOMX2bDTGjVvCldoGbvkEMywseVZpL6yJAdZCvlJtQz9TL3j6PkZo2SNM81rK9h/Z
	v1DLs72Ropa330V2MYAw47kejm5gQsuR2a1FaMZWAQs+yGdm2Y8EKjM2WdRPZTcSQecJSdYiI1M/V
	k9H2eOgCDxOT/i8wjL3nRQITOcfywC0Z26UPTU6n8tGiVsr5PDMOl6XqJCw9x1nTIIzLJzILhoDD8
	+pOIlJbF/t/+V9lfE/6fFRWHTkaPCySjwBLzrPXFQnmPsMJoXTtLEKdDz2wyxzxOIIntuTvyX3mHb
	WAJkn5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9gG-00000005fWV-2Hfh;
	Tue, 08 Jul 2025 14:52:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9Yg-00000005e4b-3EdX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 14:44:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56D5A4686F;
	Tue,  8 Jul 2025 14:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B93EC4CEEF;
	Tue,  8 Jul 2025 14:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751985874;
	bh=QridMkOK0YqX6hbQPzkAyoXJEIuvYn2g0pFiuRfJKVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EmjvtRUWWWf3iWW3ILgSBf2/s4y1eAK92Dya5s0xzZhUyBO7SI9+S72UjV2o4lLsN
	 LtB8AKyx70rrPyKShARWj0sMRhHeSL4/C5g96uAc97flRWmlhlI+BhR0T1oAwRkSP4
	 6/50eLOZetfzfck250nSp65pr+TAfSgtaU8d/xwnD7JIcr4WsD81gFi7V25pcFxnI+
	 pmSrMzm2bVyL0WJSQQZCqFon5qPDiW+UEnmrHtXinILcROfTEi7Lv0Wto/+vRvNk3f
	 vm0hgqpcXJ83wlLffPb7bGnRiFJDSM43oJtKwUAA/X+Gb+8UTS0gzUgD9hm+7qLyxV
	 B02ZJ1vjbLpAQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: fix unnecessary rebuilding when CONFIG_DEBUG_EFI=y
Date: Tue,  8 Jul 2025 15:44:22 +0100
Message-Id: <175197993018.4066442.18264778907908818556.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250625125555.2504734-1-masahiroy@kernel.org>
References: <20250625125555.2504734-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_074434_840443_7ED935C3 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

On Wed, 25 Jun 2025 21:55:20 +0900, Masahiro Yamada wrote:
> When CONFIG_DEBUG_EFI is enabled, some objects are needlessly rebuilt.
> 
> [Steps to reproduce]
> 
>   Enable CONFIG_DEBUG_EFI and run 'make' twice in a clean source tree.
>   On the second run, arch/arm64/kernel/head.o is rebuilt even though
>   no files have changed.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: fix unnecessary rebuilding when CONFIG_DEBUG_EFI=y
      https://git.kernel.org/arm64/c/344b65804724

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

