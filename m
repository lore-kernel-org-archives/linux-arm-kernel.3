Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C41ECD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 16:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7o/1HbgL1GCqVfqtMs4C6Ndy3fCGgrPmvK03p5KpjE=; b=VAk70NwaLYaHZnYjNqSeihyUAT
	D3mDzBjlE+IEVZTMbWanetDriRACYXwi2Mbkdj37sDo2LJ7xzRMQaxuX796QepmI4l/S1QqlVyLc2
	Bz2DP1YtadIdxAxCPbycUlMIPjKYbaSMXZWgh/rVmsJ2p6OX1a65gyvpcCo+pN1ORxAZ5CC3zmvME
	HDiI/x1Iw7A/QO613YyKKJINUv3JNOMO0a6YEK+TA3ZDSWPNOVLSgoEJE/he0JFuUr8wtQKI3DK9p
	s6kpyzkQGRCGb8MULQ7QR6YNgOXewygJMp1Q1E8+tXCT6vuEIL90hl09CnvI5YD8swfQR7ommL6wx
	YVXWB6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXdd-00000000vKB-1MGE;
	Fri, 05 Jun 2026 16:43:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXdb-00000000vJH-3RHC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 16:43:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E5A2B601FA;
	Fri,  5 Jun 2026 16:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B04B1F00898;
	Fri,  5 Jun 2026 16:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780677794;
	bh=q7o/1HbgL1GCqVfqtMs4C6Ndy3fCGgrPmvK03p5KpjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R9gal9IKkvPj70Mu6Qw/EDaDMqjI/ozVA1k7tE1tuPzeVfaa5DfnMM3wNfK3pMj/E
	 DYr49ov/lEtW00leOr53Wd4e3CpPyPy2/zWdqghOJrX/xzhbUw/mbexQEgMFs9nuJM
	 b0r6MpktDaonchIeVx2jLCuzsm4EwTe1HdyAAul2TNH2JVOUHcimJKCUr0JgO++n1i
	 pUuPuCf/77B/L7ThKJTeVzOajOHtT77z49xWDN7VbQIbAItOl7lbkbfeHqIl9Odf7Q
	 2IofxpTstdSiUrTcNd8dTbKtydlMx2qOmKF6uryaVTTrY/+gMp7l1krIlr5ptYbvXl
	 7EGydTNwfFmeg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 0/5] fixes for data/bss linear alias unmap series
Date: Fri,  5 Jun 2026 17:43:03 +0100
Message-ID: <178065625154.2113262.3332503693546345283.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604151151.150377-7-ardb+git@google.com>
References: <20260604151151.150377-7-ardb+git@google.com>
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

On Thu, 04 Jun 2026 17:11:52 +0200, Ard Biesheuvel wrote:
> Fixes for the data/bss linear alias unmap series:
> 
> - Fix KASAN related issue reported by Mark, by moving all KASAN page
>   tables out of BSS [on arm64], not just the ones defined under
>   arch/arm64
> 
> - Fix two issues spotted by Sashiko
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/5] arm64: Rename page table BSS section to .bss..pgtbl
      https://git.kernel.org/arm64/c/9c401fa7398f
[2/5] kasan: Move generic KASAN page tables out of BSS too
      https://git.kernel.org/arm64/c/9f7f685758c6
[3/5] arm64: Avoid double evaluation of __ptep_get()
      https://git.kernel.org/arm64/c/568def8e87fc
[4/5] KVM: arm64: Omit tag sync on stage-2 mappings of the zero page
      https://git.kernel.org/arm64/c/2986a6257405
[5/5] arm64: mm: Defer remap of linear alias of data/bss
      https://git.kernel.org/arm64/c/53205d56212c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

