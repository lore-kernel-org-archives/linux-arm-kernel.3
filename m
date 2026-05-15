Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A935CCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAJ3Kv1cmTBvGz4q9yatUm4EO8KI/UpVjjO3D+OPvQc=; b=0efo2mtrDElEwUo1HlDH5KLXWq
	zBnJTnbuPpueLva6U6dTJlQACuLa1oJNpBbAJvTbctMgn8TnxF7UfmtpgpPDes3dOaZboi1phaRNO
	iEKmG5MHuAPTBSSMawiRimeiU5MN8IGXCfQEIcgr5uNoAZuq4PqvJaZQjjeWSzJkx7tJe/xHnOBxD
	pEoXeVfeZc9RI1MtYs+hixSSUdXlw6qpwUln60LGqBQkAHgjZbR6f9ms9cS58yKwmNwsesZtGpmZ8
	CbxCYHeQDJXi91LO3oUWjKJTjd4277q7jcQChNQhCX59hsCZ2VZv8Iqx4Ukfg3MjWhyhKHlZgG3M7
	Phc4E+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNquk-00000008Dm7-0P7Q;
	Fri, 15 May 2026 11:41:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqui-00000008Dlj-0apO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:41:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 400C660008;
	Fri, 15 May 2026 11:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69617C2BCB0;
	Fri, 15 May 2026 11:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778845266;
	bh=ojliKxLIPyVmRn0hRYANGJp+DlbHEI4KeA3aCrfNQQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uc3uJqkKVO7ex+RfZyjahBG30iwryxXAvCYbs2oAFy8UGftPt0m3rHQ0A0gcWw20P
	 TEAZKaZ6zYJlx5vNaeTDyRuYTr73Q56xqa+s4zxBH0aylRiwEjj93jbry/C5WOtl8U
	 GYHCET2xyoTPhh2TkbcuAMOMbRarao+jsXDWyH0P/+JAQ5eu9Lvi3XW6zUyoKoAlnY
	 wKzAD+PC4h0MEfaX+pJl75ZZi6Qrir0bWQvFfaJXPwxmPTB4PwOJvqrIzfTARGmveu
	 pZe2rHSGnHjsGk/MJPdtBJ+EgYBgtTClMagqNHdIGSDhUOOTi2+0oT4yxIP7ZbcwBn
	 pgUXMK3Z4vr0A==
Message-ID: <c3af86b8-7187-4299-973a-d89ca0d52e9a@kernel.org>
Date: Fri, 15 May 2026 06:41:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] EDAC/altera: Guard SDRAM irq2 retrieval for Arria10
 only
Content-Language: en-US
To: muhammad.nazim.amirul.nazle.asmade@altera.com, bp@alien8.de,
 tony.luck@intel.com
Cc: linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260515050444.10380-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260515050444.10380-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 5/15/26 00:04, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Guard the irq2 retrieval with an of_machine_is_compatible() check so
> that platform_get_irq(pdev, 1) is only called on Arria10 platforms.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
> v3: Fix commit header formatting to follow EDAC/altera: prefix
>      convention as per maintainer feedback.
> v2: Move irq2 = platform_get_irq(pdev, 1) inside the existing
>      of_machine_is_compatible("altr,socfpga-arria10") block instead of
>      adding a separate duplicate guard around it.
> ---
>   drivers/edac/altera_edac.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index 4edd2088c2db..ee6ced033f2c 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -347,9 +347,6 @@ static int altr_sdram_probe(struct platform_device *pdev)
>   		return irq;
>   	}
>   
> -	/* Arria10 has a 2nd IRQ */
> -	irq2 = platform_get_irq(pdev, 1);
> -
>   	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
>   	layers[0].size = 1;
>   	layers[0].is_virt_csrow = true;
> @@ -395,6 +392,9 @@ static int altr_sdram_probe(struct platform_device *pdev)
>   
>   	/* Only the Arria10 has separate IRQs */
>   	if (of_machine_is_compatible("altr,socfpga-arria10")) {
> +		/* Arria10 has a 2nd IRQ */
> +		irq2 = platform_get_irq(pdev, 1);
> +
>   		/* Arria10 specific initialization */
>   		res = a10_init(mc_vbase);
>   		if (res < 0)

Acked-by: Dinh Nguyen <dinguyen@kernel.org>



