Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600BCC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ouWQ1x5BptL+bLefbMgQWs0qcrX8av3cV4qFuWVpFM=; b=bjoYoYNah6KRU08AWISLMjSD98
	dGSwcIztA/rKNvlAbBGkZgkdd32UIH+pl73/lUeum+JcpdLxWqq2hzWKggaUILYlkarYf1aP15jW8
	IVG3JexMhQ8AinpxVdtVg46ekumelyhisvn5HOzZL2lXxN3nph8v/7Psblzgl1eAjx554s0ERzVdQ
	/hrwrMNgM1H12ObpWsc/s91tMnylN+qA3uMuPLC+PalEVGYp64EjUHYBZq69xjY5FW5NuP5FXQeqj
	vKNG2OA2SEpbyKkkGlgF9Xg4uPJjHcunQeTb96VMkDzz8tIrFQiXbPeWO5VYUtC7ubEbpJIRoK8Tm
	Ac8U/1rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHyG-000000027Qt-0xhe;
	Mon, 14 Jul 2025 12:07:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHlj-000000024lV-3krs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 11:54:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98A844630F;
	Mon, 14 Jul 2025 11:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B100C4CEF4;
	Mon, 14 Jul 2025 11:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752494091;
	bh=d0joSu+CYHb5OJCnlRZ4ebbkZ3bY9fgZjzT8Cp/Aqi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XpQXCszR2pubUtIf+QwsIjfF08bbyU/kiEshe5/ToEoj4I7WHAtOf3/89BFTUK+8w
	 BXsvNNrLhOtKrNb7CaGBrBlb5wC5CYcLKz6EYDC4NFwyN1WCrBh75LOK9jS/JFeSft
	 f1SvUOAs/EOcb7eIjVBMssLHTUv/Uq5DrzobyTKdn1h2HdXGdP7KihK5moScSCwTxn
	 uUcrNQQfIlr9kSJcah84/q79DgGR5rOoM5KfXzaJEJOc9nvNhahZokQDP3ML14QopM
	 bQX9erDnWxVFiV8B4U9Wi2q1S1dHUYGVDbNd11KDGJHD9lCPJxDe2fgVLPXa62PTYp
	 ieMOEgyJjAVzg==
From: Will Deacon <will@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/exynos: add support for reserved regions
Date: Mon, 14 Jul 2025 12:54:31 +0100
Message-Id: <175249276902.1459797.13570182845894865373.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250712-exynos-sysmmu-resv-regions-v1-1-e79681fcab1a@disroot.org>
References: <20250712-exynos-sysmmu-resv-regions-v1-1-e79681fcab1a@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_045451_952454_8678C122 
X-CRM114-Status: GOOD (  11.45  )
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

On Sat, 12 Jul 2025 17:19:30 +0530, Kaustabh Chakraborty wrote:
> The bootloader configures a reserved memory region for framebuffer,
> which is protected by the IOMMU. The kernel-side driver is oblivious as
> of which memory region is set up by the bootloader. In such case, the
> IOMMU tries to reference the reserved region - which is not reserved in
> the kernel anymore - and it results in an unrecoverable page fault. More
> information about it is provided in [1].
> 
> [...]

Applied to iommu (samsung/exynos), thanks!

[1/1] iommu/exynos: add support for reserved regions
      https://git.kernel.org/iommu/c/2d70fdd9b5c9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

