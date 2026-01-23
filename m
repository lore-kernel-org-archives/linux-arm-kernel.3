Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F48D7789E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUQ80tT39T4u+sBGcCQr2xBd8jfOQG1EAgviS/fe1Lc=; b=VXM9URjDyjRW6uorqUeoKOSHsi
	q6bIVqj0VU/jbaYsAcrZbQzQ0UydtxlMYnuJOb+kjGdqXFMdi6AIdZu2eoq53tiGhoWW+n4Uv17h9
	6rj3hSegYohIIUB7GHUmKHX8AFQJ7GXpfxytNQPZF7CoY9BRrHNQKfsA79WsKz6FIYN+Divlkimz0
	PRXoNJVlaAAQw8Hi9PpPHRbLM1OUFnpBif261jvjGuAmfVTCJ1okjLwbTD00iCNXcJ8gZ0YnGosKQ
	u7GndySS3h9V07KDprOBgYKcXKR6OvGnQEM43ciy3kIS/p4zuc9+ptcCcQ3Jp6/DO/+IgwL6YyfgX
	6u3h9G5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLIZ-00000009JSz-0JsM;
	Fri, 23 Jan 2026 17:50:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLIT-00000009JRC-3SwF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 17:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88AE243D31;
	Fri, 23 Jan 2026 17:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A758DC4CEF1;
	Fri, 23 Jan 2026 17:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769190613;
	bh=z3Bkw+uCwa+AmqSOg8BkgucGwYEm4VJUl7mTJocV5Vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kls8J8JcGWnLYZ1oI/Gbuulwg2rMGumK3WW/nshCN6eLZwwh+kAqca8tNMthI9M+n
	 bfUVJoInxPWzmg1Iplv3IwMHSa7RbNAFWyQID12LTGLXROthWfvsXArkMrppiKyNLg
	 VGIbhPJqdB6c9srdKrpgyl/9jUHc4XiL18+tvXSb5DhaCTSiz9edo28rzWfxjvQjox
	 GrhRl+m34X3dlZgqrqZuRmm/SRpC08GeGA2eXTsSf4EabE3I/fSct5+x9RoLQlh8do
	 MmwYrb9tcBOzRPm0yProMLQUqgZvZswr4aUro5J8+Z+ppcCczb5wfWLB9tc2lnk35e
	 OY/zFWkpR5c7Q==
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skolothumtho@nvidia.com,
	praan@google.com,
	xueshuai@linux.alibaba.com,
	smostafa@google.com,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH rc v7 0/4] iommu/arm-smmu-v3: Fix hitless STE update in nesting cases
Date: Fri, 23 Jan 2026 17:49:51 +0000
Message-ID: <176917607019.801728.614554722771260022.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768501336.git.nicolinc@nvidia.com>
References: <cover.1768501336.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_095013_888760_D661C492 
X-CRM114-Status: UNSURE (   8.22  )
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

On Thu, 15 Jan 2026 10:23:27 -0800, Nicolin Chen wrote:
> Occasional C_BAD_STE errors were observed in nesting setups where a device
> attached to a nested bypass/identity domain enables PASID.
> 
> This occurred when the physical STE was updated from S2-only mode to S1+S2
> nesting mode, but the update failed to use the hitless routine that it was
> supposed to use. Instead, it cleared STE.V bit to load the CD table, while
> the default substream was still actively performing DMA.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/4] iommu/arm-smmu-v3: Add update_safe bits to fix STE update sequence
      https://git.kernel.org/iommu/c/2781f2a930ab
[2/4] iommu/arm-smmu-v3: Mark STE MEV safe when computing the update sequence
      https://git.kernel.org/iommu/c/f3c1d372dbb8
[3/4] iommu/arm-smmu-v3: Mark EATS_TRANS safe when computing the update sequence
      https://git.kernel.org/iommu/c/7cad80048595
[4/4] iommu/arm-smmu-v3-test: Add nested s1bypass/s1dssbypass coverage
      https://git.kernel.org/iommu/c/a4f976edcb87

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

