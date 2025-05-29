Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FC7C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 20:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TtaMd1HywfsuyRcNH/42AXM3iz/qus8mLnXbozVUkA=; b=X14aTM4eW+lsc9voTa09DSj6zP
	cZkoLmA4MGxv/TDCrjH1lNZ/1xZp3bOg2NAP7Hr77Vl/fUJO/eOYps/mGg/fJE5wq00jLYL4O6gPF
	AXX/H/kdV+u4fza2RczRpxjisWbyiRi6N8QMdVRewJhqioOvqN619TBcAYSSI8VvI04DwaeoqpQni
	BpQsWeTjVPKnRU4MO4NpKavXnakmpLL6qkl+3/EmDvowme1/q42Ps/ODOHfCJ6e5bpN1TvWtj7QrJ
	hXyk1KM09DknvUux6t92UK0uXaZHHjgtyXz51SeDS47tH29BemrUq1a7CtDKJJPTzWxfjmJHP1wrG
	NQLIBrWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKkB2-0000000GWKB-0ovx;
	Thu, 29 May 2025 20:48:36 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKk8s-0000000GW2I-2wwN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 20:46:24 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b1f7357b5b6so884369a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 13:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748551581; x=1749156381; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6TtaMd1HywfsuyRcNH/42AXM3iz/qus8mLnXbozVUkA=;
        b=dFjq2NiEPa1X5/bqSSOd6mWIbuLalfC2PpJYw2cED5pRguLkl7EjaX1LRnWE6aaNP/
         AYo4CiK28/U5j1cP4al3TDlx+dm1KJCJ0+UyW3BLO+py1ergg28tAKE984fKpbzmeJyd
         nTleKsnvpeHtHdWgPHUgE0sf6+hw9Y0f3TTWuK841ExFeX5FY5z46k3qSX197gSrGkJO
         +dHYtz/Gn/pU7Wyf56zsh9mp4FKEGrMR6N4KenHSQ3JyotkUrVmI5HhbFSBCWiroj8Lj
         4XRXiCjlZcflwv3Tk+OTZ8OTTZ27NKkAR1qJpRr4KL31uJ7QtUZbnkzXtcQKd6M+BNaL
         bHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748551581; x=1749156381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TtaMd1HywfsuyRcNH/42AXM3iz/qus8mLnXbozVUkA=;
        b=nMR5sK0wbpiDTV1DpCAid2V9Kj8L05oM8m23iwqykIRKSL8+rZhaXyguW9IMPOsKn8
         pbTu8n59o+V6FeVLYovrdk9Es7TK1PDN+YC/3wDO1kKRZFxsawgQGoaZ49oaaLjR+fJ3
         D2rFHkRr65odg3tPvcGlsgQX7tDRWY/R0hk/0IR0hfit5HmzxaA0L7HUQbrKWqj/JIGG
         haiBFDMfD1DGK7y24EQaiDVj0X96Jwz9kcWtiADa5izWokTeaUGPjMINBuOx+rMCG+/E
         ayXSAe7mbmCxdsr4rPIakXlqW8734Yo+J9AQKp/3J1o6F3TiG8BQ503NwyBPVLGtAxoK
         +0OQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2MBFq+E+vViEUDJ8iA6Py/Umzd0q1aKHr6cSscCJGlp9Tfn0nr0h4chzC0gX92+OIZCmoxuu+oqqt5OzUb6UZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxtqB0tBSwGRBtYkU0z62Yx3mh8ephtQ+DFNRglSV7z5v9R/yIO
	YnPe8hKbO3cDm8xJQ4AXdtm4AjIk7LQ8vsRZNLfQ5GTVXisvBMkMwGDjtFTh7iisCxc=
X-Gm-Gg: ASbGncva9v7ziL9Qm/BLK0wzmFH7rhSNDGaoQBXltWL4kyJo3iyIk5onTy05sO6J80k
	GXOgkghLDLNpobTsivlcp3BTI59Qe8WA6h0KJ6KSFdSghYk17/KVYQnV9t3Vm4ibNjd24j+igyC
	IYzjoKqp05cYTKnQVQYDCcAOTf+GyDprkaEcKn3U8QQRsbKG5RF4FwM1uSTYQq9Z7lRzRwvKxgP
	tO0a6cSNvzg3jvFAdht3v1dYbnTyjE7rw18vUOJRDDJEJTPGcUNMLm4Q+JWuoUj8H+zWxWXH8QZ
	lcvLmnYfXa+x54oNdGce2utDwx6JpYdC45KN4qf5VrjkRj5XGJxwiUrydaEPHWTHmOEiiw==
X-Google-Smtp-Source: AGHT+IEO8HwssTrnrLL8DGNfi7UDT2JfkJIUURFRStahz0gCmflYidew8g3m8w3QvBPF+GZDsBP2sw==
X-Received: by 2002:a17:90b:1d89:b0:311:f99e:7f51 with SMTP id 98e67ed59e1d1-312415329famr1432137a91.18.1748551581341;
        Thu, 29 May 2025 13:46:21 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd9486sm16245345ad.67.2025.05.29.13.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 13:46:20 -0700 (PDT)
Date: Thu, 29 May 2025 13:46:17 -0700
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 3/7] iommu: Remove ops.pgsize_bitmap from drivers that
 don't use it
Message-ID: <aDjHmR7ZVTbsSITO@tjeznach.ba.rivosinc.com>
References: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_134623_008338_87327EBD 
X-CRM114-Status: GOOD (  18.99  )
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

On Tue, Apr 29, 2025 at 11:34:13AM -0300, Jason Gunthorpe wrote:
> These drivers all set the domain->pgsize_bitmap in their
> domain_alloc_paging() functions, so the ops value is never used. Delete
> it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/apple-dart.c       | 1 -
>  drivers/iommu/intel/iommu.c      | 1 -
>  drivers/iommu/iommufd/selftest.c | 1 -
>  drivers/iommu/riscv/iommu.c      | 1 -
>  drivers/iommu/virtio-iommu.c     | 6 ++----
>  5 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index bb57092ca90110..2d0d31ba28860a 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1533,7 +1533,6 @@ static void riscv_iommu_release_device(struct device *dev)
>  }
>  
>  static const struct iommu_ops riscv_iommu_ops = {
> -	.pgsize_bitmap = SZ_4K,
>  	.of_xlate = riscv_iommu_of_xlate,
>  	.identity_domain = &riscv_iommu_identity_domain,
>  	.blocked_domain = &riscv_iommu_blocking_domain,

Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com> # for RISC-V

Sorry for the delayed response.
- Tomasz

