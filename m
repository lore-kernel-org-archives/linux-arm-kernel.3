Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BC5C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlSeBSkQjEiAOqVJNxRfOEuimUO18o/411bIydKZxM0=; b=3As52X5XXPu9wvRRrE/um0fygk
	SccSUzw40fFh94XxxSM+Kak7011r6JW5RomSy9FtDGhsGP6LXdubVwtUCzAjSm9VaWo/KY2xjyfYZ
	Px1NN9aqVaT3HKS7L7Bmeso5UKX1vYmSUyrTsn4lf8fXuu/snTyQryDxC9zwcrGWXE1tnCCm237n/
	Kjeey667pJ6HmaOqTUAZc11heyi+uWoqbOUpk8bu3qmH2KOg9O0wNxRsveFR/WtaGpe512zuOvPSw
	bcPbJdkJ9ghjAOfID8cO6HOZL47MOOZThDk2d0dgQTKHE2JnWDL5XDFadsvKpRX4Ffbp21QptlNvJ
	kp3yxMrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Qy9-00000006qy4-30ue;
	Mon, 28 Apr 2025 16:04:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QwB-00000006ql1-23pn;
	Mon, 28 Apr 2025 16:02:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 915D944810;
	Mon, 28 Apr 2025 16:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE4BC4CEE4;
	Mon, 28 Apr 2025 16:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745856149;
	bh=+F0aVRE/fg2cXsJEag0GSt3k1+oaEiHh7xyT0ADeQLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lak2ghekf9IwpvNw+4iqdf4xfsEY5Nf4Us9kuj/97WrdrGRHp0J3qTNy3euMa9p+y
	 LJV5omJuB8I35eAT0FHrnfyhcFsn7xk+qoZg1b4ccWIErsCZVbN7B8A8iGPM5llymD
	 RH9GzhZgZAA8fG1hHedgK37evt0yOKKD3GlK/44uU13bPO019zjAEgxwYbKc4Qr5pO
	 4Gbx4cP9YQEKq352qKATJjERjf58sW7HSCCGzQ8E9wYxeCfiLrkTNGsule4ZJva9qS
	 +hXyDH79pbBgjP6nFRrEHsA7mXYwEABGEu2HofPHuSifXHKUnRvB1/vIKytbr6Yp0C
	 FAtQlXV61XXsQ==
Date: Mon, 28 Apr 2025 11:02:27 -0500
From: Rob Herring <robh@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	yong.wu@mediatek.com, will@kernel.org, robin.murphy@arm.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 0/2] MediaTek Dimensity 1200 - Add IOMMU support
Message-ID: <20250428160227.GA1322286-robh@kernel.org>
References: <20250410144008.475888-1-angelogioacchino.delregno@collabora.com>
 <aAETI0hrOiQZDKh2@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAETI0hrOiQZDKh2@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_090231_545863_FAF01088 
X-CRM114-Status: GOOD (  14.02  )
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

On Thu, Apr 17, 2025 at 04:41:39PM +0200, Joerg Roedel wrote:
> On Thu, Apr 10, 2025 at 04:40:06PM +0200, AngeloGioacchino Del Regno wrote:
> > In preparation for adding basic support for the OnePlus Nord 2 5G
> > DN2103 smartphone, this series adds support for the IOMMU found in
> > the MediaTek Dimensity 1200 (MT6893) SoC.
> > 
> > AngeloGioacchino Del Regno (2):
> >   dt-bindings: iommu: mediatek: Add binding for MT6893 MM IOMMU
> >   iommu/mediatek: Add support for Dimensity 1200 MT6893 MM IOMMU
> > 
> >  .../bindings/iommu/mediatek,iommu.yaml        |   4 +
> >  drivers/iommu/mtk_iommu.c                     |  37 ++-
> >  .../memory/mediatek,mt6893-memory-port.h      | 288 ++++++++++++++++++
> >  3 files changed, 318 insertions(+), 11 deletions(-)
> >  create mode 100644 include/dt-bindings/memory/mediatek,mt6893-memory-port.h
> 
> Applied, thanks.

It looks like you missed the binding change for this.

Rob

