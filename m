Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4B5CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 20:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZroQC62pHVMggAwIg6iHVKyZU+nfKercSdcNoeuJTA=; b=l42Csv6p0EE9wPVmFkd/3VO0HO
	4/rBwryBM14fgA8f2rNJvIlrqYwh+E0hKQEQwCrgazeMUaaaFsnq+hat8tuPx3ORJRKaxmwH7Escz
	Il5B9SXeGOOvQjs9iOx3rt1vq+Yi5WSgCKhFErQM6XjqjAG9bvfvm7C21mJnOZ0QTMTMw4gvkSgwo
	5h7pE6iwPEKHzfPf6P3ZjKaHYmuTXSoY1esEBFVcyrt4Z2yiuEt9TD43UXjaCLOPPzoFUYDf4tAw5
	kMhJJPvzPkvEmXCMiZkdQgt6gwgC7NGJUIA3R8zQNJoG1JsN0obMHmWbTC2tD0vsx7YS1h/LJQlu8
	FTQGMbng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMAok-0000000Ba4u-3wF7;
	Sun, 10 May 2026 20:32:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMAoh-0000000Ba47-3pgX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 20:32:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E470143D19;
	Sun, 10 May 2026 20:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238C6C2BCB8;
	Sun, 10 May 2026 20:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778445117;
	bh=5+omLs6aw5YAFKvXf4wxEHdVkViLr1pexGF10vcNR6I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NT4ZQTd0bA4lGgJmRczinaL05ertC9FB/x6ABepIKLRyWfmA4AUE6sT2zIdKZXMFg
	 pE9UE6V5ktsoFmlFge10/xyy1Hy977VTGITHjqA1uE8xgzy9Hl1EbMrTxL6D6nH/aD
	 07KU493LlBm4UimKfmTkIX39IwR0qmKWP8zxJ+diUgCajhf9CGQqURlY3ygKDlIBEt
	 LXQVwRV0boBNnhaTRdUyyku55wexo1R0BDDH/CQrVnYksyBHV8GeEpFGaK5dBljZy+
	 MGvoHDJ/weJa8uB8hOLLCEK7VWoEUVoA89esthp+Kkn0uFzafJya6hrJ+Ao1W6j7L9
	 WRo7hMAUAilmA==
Message-ID: <59ce1037-b6fb-4af7-a213-d605ba5c9a3d@kernel.org>
Date: Sun, 10 May 2026 15:31:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: altera_edac: Fix OCRAM ECC init for warm reset
Content-Language: en-US
To: muhammad.nazim.amirul.nazle.asmade@altera.com, bp@alien8.de,
 tony.luck@intel.com
Cc: linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260509143803.7500-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260509143803.7500-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_133159_983246_D2CBCE83 
X-CRM114-Status: GOOD (  17.70  )
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



On 5/9/26 09:38, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> The OCRAM ECC is always enabled either by the BootROM or by the
> Secure Device Manager (SDM) during a power-on reset on SoCFPGA.
> 
> However, during a warm reset, the OCRAM content is retained to
> preserve data, while the control and status registers are reset to
> their default values. As a result, ECC must be explicitly re-enabled
> after a warm reset.
> 
> Signed-off-by: Niravkumar L Rabara <nirav.rabara@altera.com>
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
>   drivers/edac/altera_edac.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index 103b2c2eba2a..9e6a9786a881 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -1186,8 +1186,14 @@ altr_check_ocram_deps_init(struct altr_edac_device_dev *device)
>   
>   	/* Verify OCRAM has been initialized */
>   	if (!ecc_test_bits(ALTR_A10_ECC_INITCOMPLETEA,
> -			   (base + ALTR_A10_ECC_INITSTAT_OFST)))
> -		return -ENODEV;
> +			   (base + ALTR_A10_ECC_INITSTAT_OFST))) {
> +		if (!ecc_test_bits(ALTR_A10_ECC_EN,
> +				   (base + ALTR_A10_ECC_CTRL_OFST)))
> +			ecc_set_bits(ALTR_A10_ECC_EN,
> +				     (base + ALTR_A10_ECC_CTRL_OFST));
> +		else
> +			return -ENODEV;
> +	}
>   
>   	/* Enable IRQ on Single Bit Error */
>   	writel(ALTR_A10_ECC_SERRINTEN, (base + ALTR_A10_ECC_ERRINTENS_OFST));

This patch fails to apply to both v7.1-rc1 and linux-next. Please base 
your patch to the latest and resend.

Thanks,
Dinh


