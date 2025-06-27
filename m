Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62882C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMqd+BBoz7kvsHjCriqfP2k/6EZyYnSTeVs3fwmu+Qs=; b=Cn072tZcg5IgOij5vS5pSvLibP
	l/aU5kD+0fHDHsrVc5ZsBe5+AWzaaYSY9H9ta9oO+A6LnxEgFqnFW0M9pTAN4ZD/0xnOkgBIv6iUO
	pQkAhgaEXSzlvDZmf1wQGPptM053+1IjIoqYBn3o3ge7+la6o1mnUeYInMAStvDbUEmzX+CNTrWlN
	YmGzvgwRjXQ4brZFFQuvIgWvVx+AMqkxqMZj9upy1mAJSHT9kjJvMDZELTub/DDUS6POIVDCvo3oB
	ZIwP5L2eFah1b4U6lmH+5B28F25kSrQ3ko87cZhVnI8Wz6VYjEow5nm5Iguo+tWKQEuGlazpzITZw
	qE8SJVvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3Jq-0000000Do8m-1a0t;
	Fri, 27 Jun 2025 07:16:18 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3Fu-0000000Dnbv-40Kf;
	Fri, 27 Jun 2025 07:12:16 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 382E94D686;
	Fri, 27 Jun 2025 09:12:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751008333;
	bh=hViMdqb6dxMsSc22iEs4gFV/W3OyUowtbhavaS4N2C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=os8eh9OmTEn/Dx1LHcwVX5y/zK9/DPU+4gdnpJKgvmO8zgLCFp6UyZQzhdVu/eTB5
	 ymyVzF6dt2XSAV1mvIVjI4FKvk41lONyZrMBQn4PxkBdn1BcFwrjk/vusMYrkdD0+t
	 b4IEj9E5srjbXb25KOIHy0R+93xNZ1Hp+3MskKXm6EyeWCW/Myweg9idpwczBK5DIU
	 5UIc1k7ayRmlhP+3k0Yp1KlD3ld/piGG2aRMG6PjylYIXcPeC6+G8+jwYAjKQOlAD/
	 U7ACVw6okT+2NBBXG0Nx+ZNTUt18dp9sVNkVpInqzvcmgrKjHyI8oS+0vwQhkOXQub
	 +76+NJjhyQ8GQ==
Date: Fri, 27 Jun 2025 09:12:12 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Simon Xue <xxm@rock-chips.com>
Cc: will@kernel.org, heiko@sntech.de, robin.murphy@arm.com,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] iommu/rockchip: prevent iommus dead loop when two
 masters share one IOMMU
Message-ID: <aF5ETB6HEGywYKS9@8bytes.org>
References: <20250623010532.584409-1-xxm@rock-chips.com>
 <20250623020018.584802-1-xxm@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623020018.584802-1-xxm@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_001215_209180_40CA3644 
X-CRM114-Status: GOOD (  12.35  )
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

On Mon, Jun 23, 2025 at 10:00:18AM +0800, Simon Xue wrote:
> When two masters share an IOMMU, calling ops->of_xlate during
> the second master's driver init may overwrite iommu->domain set
> by the first. This causes the check if (iommu->domain == domain)
> in rk_iommu_attach_device() to fail, resulting in the same
> iommu->node being added twice to &rk_domain->iommus, which can
> lead to an infinite loop in subsequent &rk_domain->iommus operations.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 25c2325575cc ("iommu/rockchip: Add missing set_platform_dma_ops callback")
> Signed-off-by: Simon Xue <xxm@rock-chips.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> 
> v3:
>    Add missing `Cc: stable@vger.kernel.org` in commit message.
>    No functional changes.
> v2:
>    No functional changes.
> ---
>  drivers/iommu/rockchip-iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied for -rc, thanks.

