Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BD2D3EE92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hhc3I3a02gAF7Y2SEs85YJYgHnvzTB5GosZcnrbfzB0=; b=0liPQuahP/7dFZbgvlntrNCNT6
	3nwEO8rxHXVnu8N8jn2l9YIgwJRnxIBdDsbo8nbVgkROOaJFWrw3cnvTiILAcn+zhDGQcix/ncggi
	7p5ZYW8tGLmN6j3+BVO34I90hb7oVLO/eEVjnRNJ88PaoXD52cIMhuTBA2p4Boz9KYz7nsBHXhVvd
	QoX24AFIRGVAVZRi3WNUZIA3dARz06GpVb8uqwLel2Y49YDXOUBVxolYymwPbQ3KCfNhKFS6bimvp
	SoedyzpzGcyUBintkEUX6e2ESm0wKHWSM/ZSKcov0jwaCuTGQmNXh8Wt1blvaSkyhk7xovB/I1dMd
	htUygn4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy2Y-00000007WGY-0Rib;
	Thu, 22 Jan 2026 17:00:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy2S-00000007WEp-1pKu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 17:00:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DAA856012A;
	Thu, 22 Jan 2026 17:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA2CC19423;
	Thu, 22 Jan 2026 17:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101207;
	bh=/kVRH7OmN6EDRj9qO26TDaI1PWDz6NtgN64FPwIvgqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X6WtaTXS+RGPqz3QNaE5Z975zw7cbweVuLPVUBi3sjk5fgA4wSwQzRSiNmj2RmftH
	 5cFVLOJj7VkznY2vRcU7F1/MWr0RINqXQLrZNhlc9O1iYCQ1lWIvQlfoudkGLYnGSs
	 Bw6sxvcNOBJ2f3i3RzUd4aCq3oDT3duvCP3hkpn04iDVYROxBeSwmyHCIjjeB+GKdi
	 bRfULfJk0UF7HYJX+LsS6qd+evo3dx+jEjeQwVqNJ8WHF8RbmpHZgSEgeSNvacjz2Z
	 5RXLg+I9uwiHsZkIIMXjPrOwtZ1+8nf2SQnWu6RKyyjRkKGFJKF+1WiLSaZihOtXpj
	 nEYVQ+aekpsOw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 0/3] arm64: Unconditionally compile LSE/PAN/EPAN support
Date: Thu, 22 Jan 2026 16:59:44 +0000
Message-ID: <176907700325.2035103.13197425164234703706.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107180701.2858276-1-maz@kernel.org>
References: <20260107180701.2858276-1-maz@kernel.org>
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

On Wed, 07 Jan 2026 18:06:58 +0000, Marc Zyngier wrote:
> FEAT_LSE and FEAT_PAN have been around for a *very* long time (ARMv8.1
> was published 11 years ago), and it is about time we enable these by
> default. The additional text is very small, the advantages pretty
> large in terms of performance (LSE) and security (PAN), and it is very
> hard to find a semi-modern machine that doesn't have these (even the
> RPi5 is ARMv8.2...).
> 
> [...]

Applied first two to arm64 (for-next/cpufeature), thanks!

[1/3] arm64: Unconditionally enable LSE support
      https://git.kernel.org/arm64/c/6191b25d8bd9
[2/3] arm64: Unconditionally enable PAN support
      https://git.kernel.org/arm64/c/018a231b0260

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

