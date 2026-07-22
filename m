Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C972C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtAILz1mcVabOpEujo5Y/+sqsk9d8o+pd+qfRrcg/ks=; b=CLGinHw+9OjGYAbakx1/40ywRx
	GWAra3fLefgwGYcGgU7yfBljMu+I/8SUI8Gupc4+EalL3vgWDoVB4gdnuGT8tEr0CFkFQBfFBpSnU
	P362Mj1TmzW3Pm1mM8bcWTaH/sRtSu70bAO0U7ukte0UTtnWyoJixSmGxL8MAGAvTrERsX22q+YmX
	Aq7p08vhEbU8VU6oUlwYQ5MFW5F2MxzLq9LIb+DHFCzFItZAIKx9/5f+oSNjMAGq90zyO4EkuOUqC
	nUWvFmegIwzBcaS8JHu2C9KsltDplUIknOWUqjY/Orap0lQLcDBrl0pNYKiK0AnURoqsc6c92gaNc
	LBOdMc+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmegz-0000000Cpyz-31gl;
	Wed, 22 Jul 2026 21:41:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeg3-0000000CpbJ-3piu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:40:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AE8C600AB;
	Wed, 22 Jul 2026 21:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD3A1F00A3A;
	Wed, 22 Jul 2026 21:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756431;
	bh=gtAILz1mcVabOpEujo5Y/+sqsk9d8o+pd+qfRrcg/ks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hTPhaHby/AKYHnmkWim05EyEk8bneEdeyKktrwhUMP6hNXSngWDC8TKkwZvzZJcrT
	 HO/re99KKiviIHRa/AfW0xEVlTaKjFUuuH3tfaCP9NUZpbWi2IBQyxtrNpALzePCP7
	 9NKOKS1mXMG1T9gBrSLWrOaAsBVIEcvUlmsoIoTAmNzI7m3HBy1AGREVQLjSJMuG55
	 8AfK184rNyphRpCyubu1bfcJeGH4e44hlZRgpuDTw99RNobpH5rOQR5zNDafH05Xf6
	 HsuB6XZRJBlY2n8NWNk6sJVgK/t8yw3viZaXaZZO90abol7cVcWu6oMa8RDBi7x70V
	 wX40zJfl3aObw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v5] arm64: errata: work around NVIDIA Olympus device store/load ordering
Date: Wed, 22 Jul 2026 22:39:31 +0100
Message-ID: <178475249728.3277623.8138156958776808199.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715204856.3707449-1-sdonthineni@nvidia.com>
References: <20260715204856.3707449-1-sdonthineni@nvidia.com>
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

On Wed, 15 Jul 2026 15:48:56 -0500, Shanker Donthineni wrote:
> On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
> observed by a peripheral before an older, non-overlapping Device-nGnR*
> store to the same peripheral. This breaks the program-order guarantee
> that software expects for Device-nGnR* accesses and can leave a
> peripheral in an incorrect state.
> 
> The erratum can occur only when all of the following apply:
> 
> [...]

Applied to arm64 (for-next/errata), thanks!

[1/1] arm64: errata: work around NVIDIA Olympus device store/load ordering
      https://git.kernel.org/arm64/c/12aab25ca56e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

