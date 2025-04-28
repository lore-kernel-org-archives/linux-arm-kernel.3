Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8067DC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 11:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6i1+kwzH69/5wVeJf8qTRV8wonsDzXoe1Tx23mhMQRE=; b=lAR5Y8SCWjSafYF7xQJqYdq+3+
	8LzHo5aLQvIDlkqKLiz6Yndgbnk1RP/bTgnTzU8no3gX8dpFVdSVx78C4s9akxhr0lk0iMxjGeswN
	N+h8yoPX6kbi5OwVnWf3DijAl4hHaPPrRq9DAO92KlaWeTd6yo9vHa6bxGxl6fQRMRLUR1lHecXqs
	bh5XA3C8C8vXhsDZF5XnrW8iuMaBlqcvFU/XSg1tsT0nzty3J7F/tIlTSkpO3hFNNr7zUgDAAxalb
	0MXbPSsX3aGjw67/VI8pHLbl1UpKYv7JOyM1CUe7JvSCJ0uvQLqlanEjKL9ygN135+XHf0ZN7yVOB
	BlVQT2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9N3T-0000000630O-0FCj;
	Mon, 28 Apr 2025 11:53:47 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MYN-00000005wA7-0Ptz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:21:40 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E970549624;
	Mon, 28 Apr 2025 13:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1745839298;
	bh=jFrsfwfTYQ7dXpFsD3Sru6Up31GNZknEmTipo/HFJpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SEGxtmmik/K6fkhQ4NI7uolht/jxJ7Ow0ZNIw3eNPKa8pjma84lXMpx/iXv2B86PQ
	 JSJlW+c1oBtgwt6dbQucGX8vwX1GDzZApHdak3F2/jwrdVDBKANcA0q2/73qlZZqsw
	 SMxUZMOQch6JXX+1xunhxpCEH6h4Opx7sfEp61vCetlgFNS6BodM0F2vGnjfO+HPDZ
	 vUgIgAPLhkTLSZXOcwwtnptLaLxVvNqACg0Z/VWxtj//g579KADmF/6DcS21NvSBVA
	 s6mhQ9zZ8ikEBXHQ2HqE1a+6JZLrVC3kZFM6/az/rdGTyXQAdGGWi+qWCjJVkx1m+T
	 TpHLA1UysTlIg==
Date: Mon, 28 Apr 2025 13:21:36 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Lu Baolu <baolu.lu@linux.intel.com>,
	Rob Clark <robdclark@chromium.org>,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] iommu/io-pgtable-arm: dynamically allocate selftest
 device struct
Message-ID: <aA9kwHff-88QVkLa@8bytes.org>
References: <20250423164826.2931382-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423164826.2931382-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_042139_286179_027A57AA 
X-CRM114-Status: GOOD (  16.48  )
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

On Wed, Apr 23, 2025 at 06:48:16PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> In general a 'struct device' is way too large to be put on the kernel
> stack. Apparently something just caused it to grow a slightly larger,
> which pushed the arm_lpae_do_selftests() function over the warning
> limit in some configurations:
> 
> drivers/iommu/io-pgtable-arm.c:1423:19: error: stack frame size (1032) exceeds limit (1024) in 'arm_lpae_do_selftests' [-Werror,-Wframe-larger-than]
>  1423 | static int __init arm_lpae_do_selftests(void)
>       |                   ^
> 
> Change the function to use a dynamically allocated faux_device
> instead of the on-stack device structure.
> 
> Fixes: ca25ec247aad ("iommu/io-pgtable-arm: Remove iommu_dev==NULL special case")
> Link: https://lore.kernel.org/all/ab75a444-22a1-47f5-b3c0-253660395b5a@arm.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: use faux device instead of platform_device, as Robin suggested.
>     The faux device is more appropriate here since the is no actual physical
>     device, though on the other hand the v1 patch had the advantage of not
>     actually needing to register the device.
> ---
>  drivers/iommu/io-pgtable-arm.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Applied, thanks.

