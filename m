Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4814BCA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8oH1Fi/Ld5hAhuB1dTiEaQRtEACoBcCrfBpjFkiric=; b=eoE8mI18BnGB6L1uASqcpsl1Wx
	YaKCXVj6as3SgyfSfYE2V5XCWK9HwvPkQ+UTxa22qHeveITWPXmpzUJfWVhh/xNdJvHW4G2RcXCgq
	QQHB8S4uHCnKbfuSKDIKBR9GP4GX8tXacpIOnS8fk6JVoHFzGnOGehkJICTOa/WC59nEGCOup6Evg
	OY8QXna5j6JvV0Xw9go3h9DWqNR313TcCwalb8MGVzfnf4tj37r1T7PSc3C2wGNJ1Bn+qLK8nkbEF
	oEW7SiLAGtPu6bAQtidAILZ24Xe8ICyIE/2nxr/GekPwIv8I7YjBnGKgLbWY5yU0yw/KYM9RhcyFY
	A8qm4wrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp3b-00000005Kfc-2Mdr;
	Wed, 30 Sep 2026 07:48:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp3Z-00000005Ket-1dWZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:48:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C03CA60236;
	Wed, 30 Sep 2026 07:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E571F00893;
	Wed, 30 Sep 2026 07:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790754528;
	bh=W8oH1Fi/Ld5hAhuB1dTiEaQRtEACoBcCrfBpjFkiric=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YuOJKYJq22XVYvSATU7UyMhkbwLBasyBFeHMOjwtF4d6iiPCiQohQwEXa4287dvTE
	 /LsLoJNZT6G4y0MEFW2wCFiLd+hmFAZCYywN3p1MQnlATCPhgfLRK6SK1WZoUy6JgE
	 k/uLTWT3sGu36vNsoy9IFpuUJmXD/6PqE6zKK7LPno/LxxuPN5kK9FugikBP/Q4z1Q
	 hSOmzrNNlY2TMFGXNb1af8wK1hUDtpUFvoOKTakkunvcTXesBLjBY4GIaKBx4ZQlAx
	 al4pFuQA9JBuTzanSrs/VFUO0gBJYVyrA1YYUvnNRi/M/nVgD1d+RaUr0dHqj5F5sd
	 31T/8Yfsu/P/A==
Date: Wed, 30 Sep 2026 08:48:42 +0100
From: Will Deacon <will@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Billy Laws <blaws05@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Ryan Houdek <sonicadvance1@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [RFC PATCH v3 1/1] arch: arm64: Implement unaligned atomic
 emulation
Message-ID: <ary-2rOs_b2IY6M1@willie-the-truck>
References: <20260930020138.2377090-1-andrealmeid@igalia.com>
 <20260930020138.2377090-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260930020138.2377090-2-andrealmeid@igalia.com>
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

On Tue, Sep 29, 2026 at 11:01:38PM -0300, André Almeida wrote:
> Implement support for emulating unaligned atomic operations on arm64.
> User applications that wish to enable support for this should use the
> pctrl() flag `PR_ARM64_UNALIGN_ATOMIC_EMULATE`.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  arch/arm64/Kconfig                   |   6 +
>  arch/arm64/include/asm/exception.h   |   1 +
>  arch/arm64/include/asm/processor.h   |   5 +
>  arch/arm64/include/asm/rwonce.h      |  14 +-
>  arch/arm64/include/asm/thread_info.h |   1 +
>  arch/arm64/kernel/Makefile           |   3 +-
>  arch/arm64/kernel/process.c          |  15 +
>  arch/arm64/kernel/unaligned_atomic.c | 521 +++++++++++++++++++++++++++
>  arch/arm64/mm/fault.c                |  10 +
>  include/uapi/linux/prctl.h           |   5 +
>  kernel/sys.c                         |   7 +-
>  11 files changed, 579 insertions(+), 9 deletions(-)
>  create mode 100644 arch/arm64/kernel/unaligned_atomic.c

No.

I already explained to you why this doesn't work:

https://lore.kernel.org/r/aV1YnOetDHhKe4hz@willie-the-truck

Will

