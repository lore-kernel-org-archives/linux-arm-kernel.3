Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB71EC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeeRZsoebfQ2LxiwKDM/TfxLahtf9YWY0xhqzs6a0rM=; b=QaClBcpQWRZGiNJGWE3Q1qzHiw
	Tzk5Ekt6JiLxvVaq9xk8rBbOa3xXSl1dpcy4dw42GgKKRUlWel6r/rB/cd7tNeY9tWpxDsCfN0+jJ
	svh+vQWWz7YA9l2neTtCUrSJxFB+MxdkIB7MVOVXaGyFsHQld2wcjlA/L/4O92zwvaZi+ioYQu1m7
	oYtPFXVWTBGXb1yF8IESy9pBS1jC7PEmGiH+uj7Qinox0aRK6VmGe7zGDD/dEgCMfjeNYdF9cDrOM
	9ss5u20BuLcUb1fAbDRCgLTS4DzKqagkQepqSV/oIjifBIu5UZJJu+Cn6kBoUjXfOXLR3to5DEQa4
	rbj1UfkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0MB-00000001GuO-0PuK;
	Sun, 26 Jul 2026 15:01:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0M0-00000001Gq7-05Ga;
	Sun, 26 Jul 2026 15:01:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 771A26004E;
	Sun, 26 Jul 2026 15:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0351F00A3D;
	Sun, 26 Jul 2026 15:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785078083;
	bh=JeeRZsoebfQ2LxiwKDM/TfxLahtf9YWY0xhqzs6a0rM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e+icZZzhRnqNEVXQx7tAkDFpNqQ0rCP6S0VMqLk5icQk3btu7VzjWcLrA6vH6+nYm
	 wCBGguf+2O4Q8qPWnIOACJGK1Dq1yYAm9jBwknxSa30Gtuv/xYzJesiIWXeCTt+STt
	 +saFrHPdqArTgCJqKzxb+5OLNgNH6hH7thr3egPI2xSCWDLTLQaYkTco23npmOav5F
	 8PYI4eufV7qTdH+oHgJAP6vJrFqJ+5WvAm5lj1u8eq9QvkNgcYji5IOHWr8lfw5vwH
	 9hJ6f2H4RHJHPMy5GFsN+kxHQOTJtargqFdvoU43zglewEj6yUhX59IGPPtqxTpXm8
	 iYeSlV/PbPjFg==
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>,
	ZhaoJinming <zhaojinming@uniontech.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/rockchip: Fix silent probe success when all MMU resources fail
Date: Sun, 26 Jul 2026 16:00:56 +0100
Message-ID: <178506936105.2042687.4098031706954883028.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723132643.2853525-1-zhaojinming@uniontech.com>
References: <20260723132643.2853525-1-zhaojinming@uniontech.com>
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

On Thu, 23 Jul 2026 21:26:43 +0800, ZhaoJinming wrote:
> When all MMU register mappings fail in rk_iommu_probe(), the error
> path returns PTR_ERR(iommu->bases[0]). However, bases[0] can be NULL
> if the first platform_get_resource() also returned NULL, causing
> PTR_ERR(NULL) to evaluate to 0 and the probe to succeed silently.
> 
> Return -ENODEV directly instead.
> 
> [...]

Applied to iommu (rockchip), thanks!

[1/1] iommu/rockchip: Fix silent probe success when all MMU resources fail
      https://git.kernel.org/iommu/c/ea0a9d453f60

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

