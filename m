Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4A6E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcNykSXvZEZH6Z09FdqxCdBH2W9p3k2YZzsg2iWZuw4=; b=HtniTk8ELilXWuiPr4CgO2hjyT
	aRKinhmT3oxSFULBzzXlcIHsiV1N1I5yBlaIzocuinEc82Qk9c/U+5W/6AmAiLmZ7M4sdA5IRFZQn
	X+8S2E7MrCb/W68+utJhujFmHzzw5SugUYIoMAnEuVG5qzyeHVUkKDjZN2Ewqn+flIDQ9v6b9P85k
	b0NUuacDJ8gFgHz+dBoqmH08zSWFnXDo7FutTusoOnWojmNiLP5quBWLnfAeVCVlOa/Q6amVGc8X6
	DRZqwfO6o4moAWP8zIwWWP5uRj/ppIzyRtfkYmTV/x7mSeRIEFSHEj3o9b6WgL6x1RB2qC+V3CH8j
	8EwZ3CZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMb0-00000002uOO-2iVJ;
	Thu, 19 Dec 2024 19:54:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMUo-00000002tUh-0II9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB971A428A9;
	Thu, 19 Dec 2024 19:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C22C4CED6;
	Thu, 19 Dec 2024 19:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734637661;
	bh=dkp8ipPFDwPUJsG40zHLmUUIeVPvehlts/Xx6kkeFyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M+RbjNAv2y635UX58SLCFa7dknjWuDxCP0P9jtGl+RfoHw0+nqdGZBBWIA/RkU7tp
	 09rdOAravATsThubSsycjvc8O9IDCHbQlxb2L5VsvNvN/aWds2bG4bVPXEXv9xrCDJ
	 XwBjOqAd8I/H2rk3D1PL86W+NFomYCnfBx1DvnnOn5o8ZGYlauLtrXpKi4xUaxg8lL
	 63bQQlmIpbpASNjj+SgM9BYE4mt0obyrOgci41xnD4KvDvbV7WqoqEzOKk27pVucLP
	 KAsfpyWi3EkCCzj5TF3+kiMSHREncZHTIhG/kWJFaUaW+k2k8QdBIU+CI7CHdLrYEM
	 QhWvaKABIeTqg==
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Mostafa Saleh <smostafa@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	joro@8bytes.org
Subject: Re: [PATCH] iommu/io-pgtable-arm: Fix cfg reading in arm_lpae_concat_mandatory()
Date: Thu, 19 Dec 2024 19:47:13 +0000
Message-Id: <173462288874.3912129.4288094387004225028.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241215200412.561400-1-smostafa@google.com>
References: <20241215200412.561400-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_114742_167051_49C3309A 
X-CRM114-Status: UNSURE (   8.97  )
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

On Sun, 15 Dec 2024 20:04:11 +0000, Mostafa Saleh wrote:
> I messed up the newly introduced function arm_lpae_concat_mandatory()
> where ias/oas are read from the io_pgtable_cfg copy in arm_lpae_io_pgtable.
> 
> However, this copy is set later in alloc_io_pgtable_ops() after alloc()
> function was called.
> 
> I didn’t catch that with my selftesting as arm_lpae_io_pgtable is
> allocated from kmalloc, which was caching old configs.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/io-pgtable-arm: Fix cfg reading in arm_lpae_concat_mandatory()
      https://git.kernel.org/will/c/b7b8a6305557

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

