Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8FBC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 08:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bE+ezz8/1kN8C+fO/tDpjHY4MLBY7DZOCsepy+TpG5M=; b=PoJqTT4JSxd1XNGz/4qx9TY4+S
	EDDV46tTpEjcOa1uOy2D08Uf9CYOhX0Re+edQpDzoY/dYrspMB5BsvxL10iwY794RyCgFCXMaq0NO
	NyqtsP6nnaxhT/y9EiwH8/SDjFDWqmIJxljwXCA5897eM/1OB+sLy5ae2e8pZJZdukNxt6KCSFywy
	n1uiwJ6WqlAcCIh//QlLYveOoA4YrTbbiCyuLdN2zx6nMgMZBImxoCSTo0+thhNHyvbM+ODN1jwn8
	oWtMFljNb7KM+FB0G4Sml4bGheWQ5Zub2fmXFQSs78KlygImWz8t2uX8064UsPTucdEgbYiyT3hOq
	Yuvc8rTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Uwp-00000006IdF-0iie;
	Mon, 07 Sep 2026 08:43:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Uwm-00000006Ic1-2uBF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 08:43:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FCFC1477;
	Mon,  7 Sep 2026 01:43:17 -0700 (PDT)
Received: from [10.57.7.146] (unknown [10.57.7.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F5CB3F7D8;
	Mon,  7 Sep 2026 01:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788770601; bh=jDZRY+Lx5bEFpVHpCIz1x9CSgZ17ilNf6ybGRTwCLp4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UMoYdUxsWdugSNSpYCTIWpIWDXM2xQXWaGjgMikS3nTyyylqDtfV7Np8zfLyAeobj
	 U9OzJZITthZTTIDifX5GjyPibwFKxuzAPHdKURQXto7G07aWEpjGb6BVl0UKgQqVaa
	 hM5eMBd9y35CVWUJxzipqNLa9QtAPHpcJ9l2wpa0=
Message-ID: <b7b1b199-08a6-4685-9def-d4d6eb396cdc@arm.com>
Date: Mon, 7 Sep 2026 09:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] memory: exynos5422-dmc: handle clock enable failures
To: Jiawen Liu <1298662399@qq.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>, stable@vger.kernel.org
References: <tencent_B0189529F550458590E3BA614EAB800FBF08@qq.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <tencent_B0189529F550458590E3BA614EAB800FBF08@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_014324_778085_53A5EF17 
X-CRM114-Status: GOOD (  17.28  )
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



On 9/4/26 11:01, Jiawen Liu wrote:
> Check the return values of clk_prepare_enable() for fout_bpll and
> mout_bpll.
> 
> If enabling fout_bpll fails, propagate the error. If enabling mout_bpll
> fails, disable fout_bpll before returning. This keeps the clock enable
> count balanced on probe error paths.
> 
> Fixes: 6e7674c3c6df ("memory: Add DMC driver for Exynos5422")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiawen Liu <1298662399@qq.com>
> ---
> Changes in v2:
> - Use the full author name in From and Signed-off-by.
> - Add Fixes and Cc stable tags.
> - Generate the submission with git format-patch.
> 
>   drivers/memory/samsung/exynos5422-dmc.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
> index 788d49c688b1..98c319552583 100644
> --- a/drivers/memory/samsung/exynos5422-dmc.c
> +++ b/drivers/memory/samsung/exynos5422-dmc.c
> @@ -1297,8 +1297,15 @@ static int exynos5_dmc_init_clks(struct exynos5_dmc *dmc)
>   	if (ret)
>   		return ret;
>   
> -	clk_prepare_enable(dmc->fout_bpll);
> -	clk_prepare_enable(dmc->mout_bpll);
> +	ret = clk_prepare_enable(dmc->fout_bpll);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(dmc->mout_bpll);
> +	if (ret) {
> +		clk_disable_unprepare(dmc->fout_bpll);
> +		return ret;
> +	}
>   
>   	/*
>   	 * Some bootloaders do not set clock routes correctly.

This one looks good.

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

