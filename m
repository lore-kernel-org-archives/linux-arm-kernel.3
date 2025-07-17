Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F75BC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 12:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zJiA20n02CH0IN3Mk/SGeDFOe0/UQiK0W5TImLzWHU=; b=HEf51O0pTfYg+UkROUh6WHJ5Bn
	Lekb3KuW2ynMqnWRnfrHYZ8GNEm231Hqy2Omj5Dk5BbbNhw8U5a/ZH+iG/ncBMFZKqp5iC+Yl/qt5
	AbMo3jtm18IKcG/6WimsHKw12/WsMFqAJdf9BCffTU/JL9fQxkDIF2kLtp0tkCX1eTiXpSO/dQqk4
	zYan0sEHmuM81EuJAaRncWB99UmaFZBN0YbEcVxZLyQNoH1ybhsOhc6TxfiiTWAXHBlSH7RG61G/1
	cwEsv5wSlSO09zLxEc8CdxBC9DdJd0+xawgF2ROGvnpZmIAUVHsD8bn/gPK1k8+kdB4LYg3vXc5ks
	4OuK5X0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNVh-0000000A5XL-2sS0;
	Thu, 17 Jul 2025 12:14:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM89-00000009t2R-3mov
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 10:46:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BABE5C689C;
	Thu, 17 Jul 2025 10:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70513C4CEF0;
	Thu, 17 Jul 2025 10:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752749185;
	bh=DkXyeHIa2nF3AOICnuR48ynTr+TBeqyOhPxZL4J6QaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tox3PrHpqhMu4xO+ihUu6MVqf01Sb8Xh3Et3hs89aTklPc3ulrOULXRavXbCqZ/p1
	 6RXdYxCi2isSjHKE3hdICYxsIW4769UOwpBCdLkZHXKRkXL9BvQiQMjfr0zJEw9F9x
	 NJ9vBGiF6p2WFedui28zaJa5VisB4fUHvrRGI8Ld2TCw9/OLAg/9QrhHV5C0pZsZ2r
	 Qz6Lb31ICdq/YJXnAj8/cE3QcQW/P0W1hcygFXWAfWm3hw6ug+LiWm5aIP5VCVA23I
	 cZdhFjk2C+snEYl8nSPiQ5++JdMLl69cJj/JZWwSLbak50C8e4+vBflQ1X4WW+GrRC
	 z+Ka3ZoQBRNbw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: Re: [PATCH V2] arm64/mm: Drop redundant addr increment in set_huge_pte_at()
Date: Thu, 17 Jul 2025 11:46:15 +0100
Message-Id: <175274693707.736549.5663594233250106618.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716035432.293682-1-anshuman.khandual@arm.com>
References: <20250716035432.293682-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034625_988166_0DC63AEB 
X-CRM114-Status: UNSURE (   7.03  )
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

On Wed, 16 Jul 2025 04:54:32 +0100, Anshuman Khandual wrote:
> The 'addr' need not be incremented in the loop because that is not going to
> be used subsequently.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/mm: Drop redundant addr increment in set_huge_pte_at()
      https://git.kernel.org/arm64/c/aa46e18836c0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

