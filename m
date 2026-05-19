Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D89CCD5BAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URxS2UGIX6LTgmvyaFxWJEc5Nd2zhGKeo0SFBoUdJL8=; b=Iiiolmgo/Iqane/md4sDOtI90V
	7FkeqxaJvDMVmgm9lfRPcr4EMzSSlkKwszfuojW8kDvqu0cx5WyYvzFeoUJ0+Tv0ZUpm3s0THUNH2
	LT2SzXDGIq9YhSXLJMjFGh4RYZKhgaEZs2bWOJa4dDgzxpz/emVLWCKAarsR62v9hm7M/r1mhdN6H
	8FnOJyzouaa+1YnDdw9X9xGXKI6HhYqUoFtcUwkz6VfflgyhbNyDeMmjEp76nqpgLTVJum8Rcm8NU
	G4IxqYRZ/GNUS5Q+fGkFbiNOHh1xLzftCWskvLzXzboDpllqfXEZTYfqQbmW12JWACqur2hzHbgYN
	35YeLuRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJV-000000021cJ-16Ws;
	Tue, 19 May 2026 15:24:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIs-0000000215n-3f3m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:24:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 993C6406D0;
	Tue, 19 May 2026 15:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C66C2BCB8;
	Tue, 19 May 2026 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204258;
	bh=WFSF8Bu9R2fWrWkPUVMtmNOhuTJlzJ38NfbwWlpjOi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BMlcohLdEZrL13xN6TLZmNmot8IWhR8rpzqEtvnwz0KvBIb2zctMIZkpyTbZo4ZjG
	 g/b2jtcsz57OhJiK1zZ7j8WjUqpD0qP503F585lLBRqykSIYRrW4SZVMw+vtUvscTJ
	 +RcoSMRdTw+ApyLdzjz9N1O2ONBEKQApZ/0tPT/8YLLso8s0nD341bkJFWsp0h4RYr
	 UwgJNwxbCT1tmXAysbevooLOy7ETaDZmPS6IG6CZDSEsqb1lW5ubLFh+pHCEblFHvw
	 t8vc4tN6xZAKn7/k3KYXH2Pfj9z+kWA5BINzHqOKJSa0P3FbXLrLRKLkxKeBfFRujz
	 Ic+20zJ1M4FWA==
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Pranjal Shrivastava <praan@google.com>,
	=?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Enable Hardware Access and Hardware Dirty bits
Date: Tue, 19 May 2026 16:23:07 +0100
Message-ID: <177919969031.1013920.6454574496615860619.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260503135413.1108138-1-nicolinc@nvidia.com>
References: <20260503135413.1108138-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_082420_150160_7B823F4B 
X-CRM114-Status: UNSURE (   9.90  )
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

On Sun, 03 May 2026 06:54:12 -0700, Nicolin Chen wrote:
> HTTU is introduced by utilizing the Dirty Bit Modifier (DBM) in the PTE.
> When kernel maps a clean but writable page, it will set PTE_READONLY and
> PTE_DBM (aka PTE_WRITE) at the same time. When a write occurs, an HTTU-
> capable MMU will automatically clear the PTE_RDONLY bit without software
> intervention.
> 
> On the other hand, SMMU has the same HTTU feature, yet it is not enabled
> in the SVA CD. As a result, SMMU will not clear the PTE_RDONLY bit while
> sharing the CPU page table, resulting in unnecessary stalls.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3-sva: Enable Hardware Access and Hardware Dirty bits
      https://git.kernel.org/iommu/c/74fa4c177ad0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

