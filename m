Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5DCC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVUf5g9fyW03VI3ChbGjr34YCok6zwGJOsz6gj0N044=; b=ri/rvNzrSJAwC5yEWbIL9KYnRB
	8XDhnHfydcD4czOYUWAsoukurW9LeKYkEuzibsYvMMzdQJONdLpZ9DHYHUdL+6CAHYW+FAmiBLrpa
	jqaxUwh1vNX9ydB5g8aTmhmNP1oCBdVKc9X+IaOH1RUPRbMojugeZQh6okaD3LLge53tF2+t6p7Z0
	P0LskZRI0zfbIMssMr9Wdv8YhWOUU33U61tu0ayyjqmJpgkIfiKAdm9+Um4B3wTxb7TzCPBd5fEiw
	yNM2vZKgdPfPpqc+btZ+6y/NQXTkho4vqs3IVbU2e5U64mccJ/sf5gyTM3f+UEZzrO737Uxn3fij+
	MJSOs5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CPl-0000000DV6a-0971;
	Fri, 11 Apr 2025 11:19:17 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Bsm-0000000DQRm-3XN5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 10:45:15 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id CF96D47D2D;
	Fri, 11 Apr 2025 12:45:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744368311;
	bh=2K2UtTXIu1TLmaoMSN6Rl21RoiWylh/+IQqQ++fQ1oE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xQGjZOiXT4O1vOT67iNfe/6y1h61IBPDdS6R64Pmwrb5MbJI7Uoj0BIGWwSOGxBdM
	 QVTJcnmovZrc8mxAc1n4rRVmEudBfT3HmOGHmclBWH+iSp1NNCzc2F0KxdATVzQfpD
	 PtiwYdmoQdAeilf/MejyRqXLty62Df3wadu8JcqF0yapGWGgfhTkg8Zt+ITklOacTy
	 pNYzZQcNsdoKOlstPqh/kzNZxZafaca+gBACZtj/wRsNxpSiM5QYpbqWU++KF/JuZp
	 9Zu3KLtRmCos8yZUpU7YO+RSai2RKs7jBmYBt3WJM+G7Kc9lm55S5Jwz5RAygaCW72
	 eEPPOKqY+hIGA==
Date: Fri, 11 Apr 2025 12:45:10 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jgg@nvidia.com, thierry.reding@gmail.com,
	vdumpa@nvidia.com, robin.murphy@arm.com, jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH rc v2] iommu/tegra241-cmdqv: Fix warnings due to
 dmam_free_coherent()
Message-ID: <Z_jytpEPKzzKAxKo@8bytes.org>
References: <20250407201908.172225-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407201908.172225-1-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_034513_035245_1B195A67 
X-CRM114-Status: UNSURE (   8.41  )
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

On Mon, Apr 07, 2025 at 01:19:08PM -0700, Nicolin Chen wrote:
> Fixes: 483e0bd8883a ("iommu/tegra241-cmdqv: Do not allocate vcmdq until dma_set_mask_and_coherent")
> Cc: stable@vger.kernel.org
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
> Changelog
> v2
>  * Fail tegra241_cmdqv_init_structures() and let devres take care of the
>    lvcmdq queue memory space
> v1
>  https://lore.kernel.org/all/cover.1744014481.git.nicolinc@nvidia.com/
> 
>  .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 32 +++----------------
>  1 file changed, 5 insertions(+), 27 deletions(-)

Applied, thanks.

