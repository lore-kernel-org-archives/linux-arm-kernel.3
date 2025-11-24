Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39032CFD351
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 19:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/UwH1jsKinaf1hwpT3Iy/pMl+8ucNNAlPKump0V6d0=; b=3YE2JvcQTAsrU7ODtcGna+Zlq9
	gRifQ+3DxmjA9lU7NnZ1R6VhEJwKPgQ3d1yc40nG9ntP+bbcuWAGKQUNuoGaxcsXrxokZ+YTYAw35
	R2TqW/Mr9W3Sk8cExb7HEjnznaPuuRU0a120Tuv8nwsJIdTsRCg96kHvxBhT4Ur2+UxIFrxAtEQpP
	dDSbY1D3I8WCYqIAtG3qzFjgsekJCq2SqejCBXcrGI5RR3SS5NJmWvVzzpXGyorSj18pN1oY5fcQD
	gXqFKiQxVcNZwtjqQjUJN5O7YBOGV6RBFGpyKspLPZ/gaDRuvM2vNJ8kHvzpodi/c4Ts8O1ozfjqW
	meSZ/2xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNc5U-0000000CEc8-3GN4;
	Mon, 24 Nov 2025 19:19:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNc5P-0000000CEaQ-2YA1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 19:18:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4897943BF5;
	Mon, 24 Nov 2025 19:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E519C4CEFB;
	Mon, 24 Nov 2025 19:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764011935;
	bh=0SWLtqnL9JapMsCqWqiF0dNUjHQzXBqEndXCdl0ZK74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iFcWAxR0D4KqPU7UM5btKxayO1W2pBfkK19/oFLILBaqhMwTYruBfJu0E56jbmR82
	 P0hVzzGvDzQUgVCF2CVQLB0EH1i/MuL9wbdAtYpKUQBR2EPOXA3IRYV+miWG4DQKFL
	 UVN2wpAZ7Ll5NMqfWltdsSlAC31TaJFJxBBtYr7/qeErd1hM4atyyjojqqOcSRBeVt
	 KbdhcMe5wABf8gubRZgaNHb+ie5AeGImdnzQNxbwrmD3Wd6JzIE0xPnMI9al9G4tJO
	 n+ChkrwVjU0lDZuzeOVZgutzxyR/duo8QgwflQT6kOGYDdom+FzN9XG4wVSeIUHmCx
	 vtIEHObvqF0SQ==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Ryan Huang <tzukui@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Daniel Mentz <danielmentz@google.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Fix error check in arm_smmu_alloc_cd_tables
Date: Mon, 24 Nov 2025 19:18:33 +0000
Message-Id: <176400339226.703452.83509466898335553.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251107190917.2858684-1-tzukui@google.com>
References: <20251107190917.2858684-1-tzukui@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_111855_669092_3622DCD0 
X-CRM114-Status: UNSURE (   8.47  )
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

On Fri, 07 Nov 2025 11:09:17 -0800, Ryan Huang wrote:
> In arm_smmu_alloc_cd_tables(), the error check following the
> dma_alloc_coherent() for cd_table->l2.l1tab incorrectly tests
> cd_table->l2.l2ptrs.
> 
> This means an allocation failure for l1tab goes undetected, causing
> the function to return 0 (success) erroneously.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Fix error check in arm_smmu_alloc_cd_tables
      https://git.kernel.org/iommu/c/5941f0e0c1e0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

