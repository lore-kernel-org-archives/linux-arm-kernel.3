Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA896C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACv2VOH/xxdFNoF7jiMQ/aQN4wqlwfwjlxw4nb24u7g=; b=TluZdF9KoT/FOoIkXXpeOXWr1U
	Ybz3HnPgFnwYgbXztItLCriep6NxxbLug5jfzQ7WSxeMNkWzvGUbyyoe/yLNqfbeiIdEq6gbvZjap
	I/n0b442/avLHaAN7qLwHZqoH+hOi/JdcFJWPidWb3uwg+w73xwpMaqpDleB0V0XldR4yRDbjTwRK
	kYzasiJ+8kaCfGN6fSME+9MRoCxJ/IB8HSamnUyNxhN1Nll8M94uBDTl3z5E3v8yz2vdQWLHAgTGR
	uPqVMDf2gWvOE39tRD4XQBaEJTByuBfU4F6MbhQSxgCoFcB59WD1tRDLK9KAxrQ1bT0c1GaA3ry0L
	smTsjTng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P3o-00000001Lau-323t;
	Fri, 04 Sep 2026 08:14:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P3l-00000001LZz-41Gc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:14:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72A16153B;
	Fri,  4 Sep 2026 01:13:58 -0700 (PDT)
Received: from [10.57.5.232] (unknown [10.57.5.232])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C18A83F673;
	Fri,  4 Sep 2026 01:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788509642; bh=e/2Zgoy8BfvbUfTRtX2XvZNXp5wxQdtS8OcL1cqVA2s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZnVDL3lxB4KG0sAC/ySibkg6SA6GeGr++WJKM4KH+X3PQbetFI2zGxmmxvVx6HDte
	 Dong/aBR7nVJhIRALQ5YbEtqwhI+bc/6pBNXtYftnwk/PvY8ldJRAlSIqL+NjXtYt8
	 78BceKMBMgGrknc8J/q2NKn+ckGcxGMKUQaIsFyc=
Message-ID: <92153d54-e7aa-4fe3-8317-0060b4078d6c@arm.com>
Date: Fri, 4 Sep 2026 09:14:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: exynos5422-dmc: handle clock enable failures
To: Jiawen Liu <1298662399@qq.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org,
 Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <tencent_405FF24AB67AAAA26BC85ADD092710C0BB07@qq.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <tencent_405FF24AB67AAAA26BC85ADD092710C0BB07@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_011406_032657_FDDD41AC 
X-CRM114-Status: GOOD (  12.33  )
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



On 8/18/26 14:19, Jiawen Liu wrote:
> Check clock-enable failures during probe.
> 
> If a later clock cannot be enabled, unwind clocks already enabled on
> that path before returning the error.
> 
> Signed-off-by: jiawen <1298662399@qq.com>
> ---
> diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
> --- a/drivers/memory/samsung/exynos5422-dmc.c
> +++ b/drivers/memory/samsung/exynos5422-dmc.c
> @@ -1297,8 +1297,15 @@
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
> 

As other folks mentioned, please align to the procedures for
sending the patches.

The change itself looks good, so looking forward for the proper
v2.

Regards,
Lukasz

