Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB8FC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzPpkd7fGwIRjZRAoG5yJ4Ndb/6L/1LmPkoxW6u5lRw=; b=b055fMswLYVcvhrG+QNJHcWDi2
	3jABagKS37lI2AfHevKoEnS7yhmnNZOS1NwbUscW/avfvIIAbSLIBc838nR7rl3MLg0Af75SaSqxe
	fkRh2Fg4KGo/OXzLHVgdHiZO0VnQAR1fFEt27y4cBlSs3SxDDdpAHxMlhKhFhXyiEj8etzv3unefO
	Cn6LENfhjRfE433SdbJt2O66Ko7TqThBJOHQLVE/Xli7vJa7PGU5htUnYpVxqvTsPCp7671A2FLs5
	qtNHHx5/FOBv0ZR4iV2vmy41bUgGhtrnF1cpemBM2lUE58zyLmNtPUu9yrUjnRGjBv51jCSZ50Twl
	YxuFypXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RGD-0000000DXOA-48i2;
	Thu, 17 Apr 2025 15:34:41 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QQu-0000000DMKp-3z2w;
	Thu, 17 Apr 2025 14:41:42 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 27BAA48658;
	Thu, 17 Apr 2025 16:41:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744900900;
	bh=nkD3Ai6sPz5TId+HbEZ4D9DCKviA/qssHMxlH8W2gus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJ1C4mMExs/+iMj/0PL47U2PCET7Lrv1LMiNjzWbVOBN49hZ4phcYRRCLj7idVIW1
	 +z6O3QEoGeg5dpfa9orG1FqGULOe7JmiR53JRPKnDnyrfTJS50JRrK1DQwB/lHNGe9
	 BcaZ1qX7mObOJh83jIgXLF/UjUzd57nF2ARQ2Yp1eTNNR4lnBfWHiPGp4p+JT2GOuw
	 JzSrnu28992HH0TH72xQQbF6TO6yWWdvEuvLM33oZ99GT+0k803ZHbrNz5FGXGoytF
	 mkHXsjH1CnifDZpMUT1oVZkST9EmTLnWYXWQsz8m07tHjAjIrEoY7IeCTNHhlGAJpH
	 IGgIIHdC8iK6w==
Date: Thu, 17 Apr 2025 16:41:39 +0200
From: Joerg Roedel <joro@8bytes.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: yong.wu@mediatek.com, will@kernel.org, robin.murphy@arm.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 0/2] MediaTek Dimensity 1200 - Add IOMMU support
Message-ID: <aAETI0hrOiQZDKh2@8bytes.org>
References: <20250410144008.475888-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410144008.475888-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_074141_213380_E9F5352F 
X-CRM114-Status: GOOD (  10.42  )
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

On Thu, Apr 10, 2025 at 04:40:06PM +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the IOMMU found in
> the MediaTek Dimensity 1200 (MT6893) SoC.
> 
> AngeloGioacchino Del Regno (2):
>   dt-bindings: iommu: mediatek: Add binding for MT6893 MM IOMMU
>   iommu/mediatek: Add support for Dimensity 1200 MT6893 MM IOMMU
> 
>  .../bindings/iommu/mediatek,iommu.yaml        |   4 +
>  drivers/iommu/mtk_iommu.c                     |  37 ++-
>  .../memory/mediatek,mt6893-memory-port.h      | 288 ++++++++++++++++++
>  3 files changed, 318 insertions(+), 11 deletions(-)
>  create mode 100644 include/dt-bindings/memory/mediatek,mt6893-memory-port.h

Applied, thanks.

