Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B23EC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/22LGD1MGbC96K2zWOrMVz7tCsjDUPU9MbskXggav7I=; b=YcJAbigUxwDM1g8/E9uJME6LEW
	Y/U2BsxQ7IEYt5X1iXCQ9p8BTIgXDW5yRnjckRG0ncxn6P5YieUbxusXygrD4TwQ4BpqLWgIBAMqO
	r4nKdaypIyQgjf86nxpiujUR+tCQG+D6XH61io2MPgJRXQNoZk0RBfTD4ZA3HoZODnd8DJKG3Nywa
	myoJGMJOsZDaVYfwtBLcSrBauIve0q86Cqv437dI+IZkxy0Gm+JG36VcK/oQXRdNuFnDyFJqR+iGW
	8SlGDfe0in+jM/tELwpDr+0CB00lRMPMKlXQmdo0L44WhEeWIoyS7bgNYz0vfHDXzSFtiXoHv+bg3
	lwqruq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dp-00000006Kmd-1i4J;
	Thu, 06 Aug 2026 17:12:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1do-00000006KlB-0HcQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:12:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CD9FD41B45;
	Thu,  6 Aug 2026 17:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E4A1F00A3D;
	Thu,  6 Aug 2026 17:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036343;
	bh=/22LGD1MGbC96K2zWOrMVz7tCsjDUPU9MbskXggav7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aJxprpj/PmeLQcUf+DpkzRl7CnakIvyMWVwJ70+wVwNnKVtFvXGjz9FtIIsqYhKRj
	 2OOcLN+Dxf5yEOIISv5TQstKp20rKTaODyTqJkqNj6cvGudQmR+9xhhp/GhKHGiuuU
	 xWpyYCqfvdnRc0a3kl1pQCUd+JrBvsA9ONkfwP7m/XA55WtNMMZxEEaRLpiR1ck50h
	 rY0hKPyeib0L68BZg6aAvD2PlbZ/Dfn7zjbMcdWWL2PGKq0jq9qw0nX7e4bwVolCL4
	 WGclWlKRboI6O97q8rZ6Dg7dkkRLfrZvAOHMSqogW36MEkwYbZc/gZuyHSYOCgDYXG
	 OqpoYDJhvAjbA==
From: Will Deacon <will@kernel.org>
To: joro@8bytes.org,
	akpm@linux-foundation.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	nicolinc@nvidia.com,
	cychu@google.com,
	hhchung@google.com,
	amitamishra@google.com,
	marscheng@google.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor.lin@realtek.com>
Subject: Re: [PATCH 0/2] lib/sort: Clean up sort_nonatomic() and sort_r_nonatomic()
Date: Thu,  6 Aug 2026 18:11:46 +0100
Message-ID: <178585154950.3657024.3915308246763901818.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730181216.2709088-1-visitorckw@gmail.com>
References: <20260730181216.2709088-1-visitorckw@gmail.com>
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

On Thu, 30 Jul 2026 18:12:14 +0000, Kuan-Wei Chiu wrote:
> Remove the sort_nonatomic() and sort_r_nonatomic() APIs from the kernel
> library.
> 
> Currently, the arm-smmu-v3 driver is the sole in-tree user of
> sort_nonatomic(). Because the array size being sorted is small in
> practice, there is no real risk of triggering a soft lockup. Therefore,
> the periodic cond_resched() calls provided by the _nonatomic variant
> are unnecessary.
> 
> [...]

Applied driver change to iommu (arm/smmu/updates), thanks!

[1/2] iommu/arm-smmu-v3: Replace sort_nonatomic() with sort()
      https://git.kernel.org/iommu/c/340e3c5165d4

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

