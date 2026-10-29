Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829F2606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AoCWCuSU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AdT7vjX9hlZBYeDnKKDlyq+tnX7uZdKaSwbD6yyWOuU=; b=AoCWCuSUWlW5nmEhAqrJfRRb+c
	YX9gqE8crhHR4nsHVxHfKwofoqH/0d9IWQ86zRniJ0doTh+M8qBGfgmssuFXxkqbILdnhVQH+rhvB
	S5I2TQ57RtSMYsJISIACklbb8YN/7GOLywyC/uvQUSYmOG3M+7a5Zg5xxwzgCA8LJIEWujM44YZJE
	KLdcMXNRnj+1blrHH5EAwqR6FHBJA8zyew8Dz5jUuHJKByau3A9WwAoI6/1Gi4bkOW7lhr2YEyJ3q
	Ov0y/pgn7snTWsTKjRCtfxkNqirXay2LVLtU6V1pz0p+eAiCWb0mGd14Ea6fICGh7uaLS1sZtullM
	B3rxoPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOr2-000000096sU-0uhA;
	Thu, 29 Oct 2026 12:03:36 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOqy-000000096rb-2rgE;
	Thu, 29 Oct 2026 12:03:32 +0000
Date: Thu, 29 Oct 2026 05:03:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	Thierry Reding <thierry.reding@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 00/10] Make the 32-bit ARM DMA API work with normal
 IOMMU DMA default domains (+ Tegra PoC)
Message-ID: <auM2FAYVK192RzHb@infradead.org>
References: <20261026-b4-arm32-iommu-dma-cookie-v3-0-3901d74b1ff2@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-b4-arm32-iommu-dma-cookie-v3-0-3901d74b1ff2@nvidia.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 06:19:25PM +0900, Mikko Perttunen wrote:
> Robin suggested [1] that instead of teaching the legacy path about
> groups, we should explore modernizing the 32-bit ARM DMA code a bit by
> making it use domain cookies and have the core code own the domains, as
> is the case on other architectures. Still, ARM's own DMA code is kept to
> support existing drivers and APIs that expect it, and because dma-iommu
> is considered too big and unnecessary for 32-bit ARM.

Now that the different domain handling is gone, what speaks against
just using the generic dma-iommu code for arm32?


