Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE13FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 07:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcTob5oZFnz2hmotCzRccMJz27ChyKAtIlI+k/LYPsU=; b=OHQg6LVcOY62KJ5uSPJ6tvPP2p
	snM3wmZkipFg8EAfofuKy1mTv7m0HHrInWuXmbAr0ERDIv+DpC7jn9k4AzxFb+9Buw7hWZ//N8b0b
	ka1hTKRjW3TnRZWPu3QE79wRD2oMwsucnmrGu2p14t7HzTRbjGjZo/oKiH1d4IppLnrltr5wXPIcn
	x1NYfZyvqrse+Qgg6V0T2mv2KPMdOL8pGA9PgR3rvtTO6RmN7XYaiTaCo8kXRWKZEs2m33nepa2jz
	RVhIuuLP4Ves+DoWJaj6uUPeGtWcyUzQ3pbDcDBzlFA3Cp5zjDnSbbQepFn3CAdnrdza6oJ0+BFkt
	Groy1wYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy3PM-000000030c8-1ACd;
	Mon, 15 Sep 2025 07:13:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy3PK-000000030b5-0cua
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 07:13:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6E4143BE2;
	Mon, 15 Sep 2025 07:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EF1C4CEF1;
	Mon, 15 Sep 2025 07:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757920429;
	bh=RBstruI8aqugkuKemrcCOfrfs1zaZlQtORPCGRJvYzc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c/Y1rC2RXw5SHanCMfXuzcRpXdyyZbTe3o+eCac2xnhgaJJhUHQahwsK4bjh6uurl
	 xFwWBUJE5QxdUV/Y57+UZVXbOmaaaQcEUJvpgI9s8VzbGMhKrUSAPNcxvBCYq28Xrh
	 wMzYcKrdQZ3HmVEtydAqCFL2v/pQ0q1l/4lSEtS3n+KxJXyEK0zsl9S+4vRpVHudEa
	 mR+gT+ljkgnoHnoXnm6jq2NzZtAbJq0elpa5HeMOacW2JbJdMQk1y7gV+kB72yeHA7
	 CQRs0e3Kvw9+NfjW7kfeJ7zcdBRgTKb4oXmN93oGtUnKRcOq5NqO4kOClDq1yaXP09
	 9FLOT3xeB0Oqg==
Message-ID: <1c16121a-36a6-4101-9a2c-d45547c6ea0a@kernel.org>
Date: Mon, 15 Sep 2025 09:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iommu/exynos: Implement register set and fault
 handling on SysMMU v9
To: "myunggeun.ji" <myunggeun.ji@samsung.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
Cc: Jongho Park <jongho0910.park@samsung.com>,
 kiisung lee <kiisung.lee@samsung.com>
References: <20250915051320.3378957-1-myunggeun.ji@samsung.com>
 <CGME20250915051106epcas2p1c1bdb06ec2ec65aad8a96ffe155ed8b6@epcas2p1.samsung.com>
 <20250915051320.3378957-2-myunggeun.ji@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250915051320.3378957-2-myunggeun.ji@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_001350_232027_D8568F37 
X-CRM114-Status: GOOD (  15.80  )
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

On 15/09/2025 07:13, myunggeun.ji wrote:
> +
>  static struct exynos_iommu_domain *to_exynos_domain(struct iommu_domain *dom)
>  {
>  	return container_of(dom, struct exynos_iommu_domain, domain);
> @@ -522,19 +571,26 @@ static void __sysmmu_get_version(struct sysmmu_drvdata *data)
>  	ver = readl(data->sfrbase + REG_MMU_VERSION);
>  
>  	/* controllers on some SoCs don't report proper version */
> +

Please clean up your patch before posting.

>  	if (ver == 0x80000001u)
>  		data->version = MAKE_MMU_VER(1, 0);
>  	else
>  		data->version = MMU_RAW_VER(ver);
>  
> -	dev_dbg(data->sysmmu, "hardware version: %d.%d\n",
> -		MMU_MAJ_VER(data->version), MMU_MIN_VER(data->version));
> +	if (data->version != 0x91)
> +		dev_err(data->sysmmu, "hardware version: %d.%d\n",
> +			MMU_MAJ_VER(data->version), MMU_MIN_VER(data->version));
> +	else if (data->version == 0x91)
> +		dev_err(data->sysmmu, "hardware version: %d.%d\n",
> +			MMU_MAJ_VER_V9(data->version), MMU_MIN_VER_V9(data->version));
>  
> -	if (MMU_MAJ_VER(data->version) < 5) {
> +	if (data->version == 0x91) {
> +		data->variant = &sysmmu_v9_vm_variant;
> +	} else if (MMU_MAJ_VER(data->version) < 5) {
>  		data->variant = &sysmmu_v1_variant;
>  	} else if (MMU_MAJ_VER(data->version) < 7) {
>  		data->variant = &sysmmu_v5_variant;
> -	} else {
> +	} else if (MMU_MAJ_VER(data->version) < 9) {
>  		if (__sysmmu_has_capa1(data))
>  			__sysmmu_get_vcr(data);
>  		if (data->has_vcr)
> @@ -763,10 +819,9 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->pclk))
>  		return PTR_ERR(data->pclk);
>  
> -	if (!data->clk && (!data->aclk || !data->pclk)) {
> -		dev_err(dev, "Failed to get device clock(s)!\n");
> -		return -ENOSYS;
> -	}
> +	/* There is no clock information after v9 */

There is, you just missed to implement it.

> +	if (!data->clk && (!data->aclk || !data->pclk))
> +		dev_warn(dev, "Failed to get device clock(s)!\n");
>  
Best regards,
Krzysztof

