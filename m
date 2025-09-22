Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0FCCAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKKmzzmuKG40fuwVyBt/m3UGTsCD1G8VszPdxLZK2HU=; b=WEmtsxCdrYLmxnQd10xau8k0pj
	nSJrRr5EvY2t/WvMD//hCvuB/G+abwKzY3ZQqHfxKr5cCXjSaoPUhB+aNxzOOZN883rgBoqk8dstm
	JloLwc+5djOOj+ju1i99/Q1lqD9tYGtmQUPSVKm7vIHBU7KEb0EnbKrM9cX1d2jDB+q8di5wGW6+r
	XY5Vk6doUYG3/MOEJk6X4QHo2VuTR7uQL0qrT+EevvxkHFUNQ/dCbQiTxV55BLD6Q3A9XLdZDCeJF
	+qnWS9MpQaFocZukpQ7PMveFIZH8aUT/rC+B6BwbqkI5TqZHSGxB8DexEntQDTxztg4W9W0FQ2e+b
	fcPRgeUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gO7-0000000ASM1-47nT;
	Mon, 22 Sep 2025 13:15:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gNt-0000000ASCx-2HgX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF10660210;
	Mon, 22 Sep 2025 13:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D59DC113D0;
	Mon, 22 Sep 2025 13:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758546912;
	bh=aw8d7TQnMiVx3O3D0Yvpldr55/2d+Rct4+8tg2KDwhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P0m+pYkjM6o8XMa09ll5baluyQe+riaZZmoTwY/xyvo8fCoMwqsJlhQNcqbdUp5Pw
	 JvcyVos3WCjGmAnOVu38oX2C5WLJBba9OOHWuuceUHDVB0y1GRydYNLx6ml6Zmx6lj
	 Mjo3uak67QPzPpPWsAvimTU0Uo+ZYPeQgOIYuxSr1Og6H3ZMSNk1x6mAhp7bCKxhMF
	 JN8q8b4JPcEtD4G5StM6kTRx7JavEaKBwrXx1RoVL1S20SQrye44BrfII+6IgyhBaV
	 VPz/YBzzGGXNGSgEmRErePHbag6KaxMfbYAl9CY8/qn15cgD8WXfyyR3AgbxbY3Mfi
	 /t3zB4TvcPbcw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] Workarounds and optimizations for Neoverse-V3AE
Date: Mon, 22 Sep 2025 14:14:50 +0100
Message-Id: <175853683592.1350681.8237584408369869851.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250919145832.4035534-1-ryan.roberts@arm.com>
References: <20250919145832.4035534-1-ryan.roberts@arm.com>
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

On Fri, 19 Sep 2025 15:58:27 +0100, Ryan Roberts wrote:
> I know it's late in the cycle, but I thought I'd try my luck at sneaking this
> in.
> 
> Neoverse-V3AE has a different MIDR value to Neoverse-V3, but qualifies for the
> same workarounds and optimizations ("SSBS not fully self-synchronizing" and
> BBML2_NOABORT) so this just adds Neoverse-V3AE wherever Neoverse-V3 appears.
> Details in the commits.
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

[1/3] arm64: cputype: Add Neoverse-V3AE definitions
      https://git.kernel.org/arm64/c/3bbf004c4808
[2/3] arm64: errata: Apply workarounds for Neoverse-V3AE
      https://git.kernel.org/arm64/c/0c33aa1804d1
[3/3] arm64: cpufeature: add Neoverse-V3AE to BBML2 allow list
      https://git.kernel.org/arm64/c/8fca3852e33d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

