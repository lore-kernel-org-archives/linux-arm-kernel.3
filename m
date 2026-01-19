Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C7CCCF2DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTcJSDPIuXc2BRXtTdktb3sp/gm8014rK/KaO9PcsTs=; b=SOKKNYxd3tEs/slT1EgtjkU9yn
	Vfw4YdMCrY1nnhgTgQ7u++s3rTfgNgUOaVbr+iFy8p2uboK63zW8Cd7AnjTQVzybreHw5G5drheiR
	gR5fxBpi58I114q/LFhm/U51dopFlHVSC2d9pS49y31VuVtvyTm9C+yT9/pA4lSTwiOIB0K2qkwvl
	AI4wRt233g+hu8j+guOXyFs/TcERBVkZ2VW7E2zrXWjuuCQ8EYZZJ+CGpjCCTKThX1Tw391fOlkaV
	VzD4T/B98e/APbjhNnc9xuW4tr83d1gxI3Lga7+bJl63rVZGukVwVO886enkb+K2+/IFtujxByfGe
	zl6DS2bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn5k-00000001qje-3weM;
	Mon, 19 Jan 2026 11:06:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn5g-00000001qjR-49wy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:06:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 586136014E;
	Mon, 19 Jan 2026 11:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567EEC116C6;
	Mon, 19 Jan 2026 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820796;
	bh=vH6Vlkg2BY1oUWpSb3QdiyQ62uOlof27g0kCxt0BO8E=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=CLLu2TkfsudAo/bZ7JuCbtFNh8LcOSZNlfBRZvzcdm5D/xVD2rH81SrtkypRhLLnO
	 UqT0CH4uHuPPzxJDmSrXnwfUtWK+OC047MUKYp1nsHBz97lHPXlzt/x+hN8y/gp0MP
	 UYmeS8ASB6B4UXk6GqFIRKD5+A5JIGkDVL7/2b5x7nzBpq/NZtntetCRW5EyU9TSBN
	 q64nfm73xVcfypAej5Iu8oOkpB6EbjW9v9+cz/iGU79FRsBHhn4arUae+a9kp9mNYv
	 up9PwtgEsBkDdHkH92WL0RJjiY4LHT+feX8z+w3nooL2Hb9ZY+eAZ8gtbeEqslJxBC
	 Hg/xhyFbkLSdg==
Message-ID: <d6986e8a-e3d6-4974-acda-962e1c240121@kernel.org>
Date: Mon, 19 Jan 2026 12:06:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: [PATCH 4/8] soc: fsl: guts: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-4-32a0fa9a78b4@oss.qualcomm.com>
Content-Language: fr-FR
In-Reply-To: <20260119-soc-of-root-v1-4-32a0fa9a78b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 19/01/2026 à 11:40, Bartosz Golaszewski a écrit :
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Acked-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   drivers/soc/fsl/guts.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index 6bf3e6a980ffc67c21ed7b62b5b638e37f27454e..88ba32a40f6a27f8ffd13624e940aa0edf48586f 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -186,7 +186,6 @@ static int __init fsl_guts_init(void)
>   	const struct fsl_soc_data *soc_data;
>   	const struct of_device_id *match;
>   	struct ccsr_guts __iomem *regs;
> -	const char *machine = NULL;
>   	struct device_node *np;
>   	bool little_endian;
>   	u64 soc_uid = 0;
> @@ -217,13 +216,9 @@ static int __init fsl_guts_init(void)
>   	if (!soc_dev_attr)
>   		return -ENOMEM;
>   
> -	if (of_property_read_string(of_root, "model", &machine))
> -		of_property_read_string_index(of_root, "compatible", 0, &machine);
> -	if (machine) {
> -		soc_dev_attr->machine = kstrdup(machine, GFP_KERNEL);
> -		if (!soc_dev_attr->machine)
> -			goto err_nomem;
> -	}
> +	ret = soc_device_get_machine(soc_dev_attr);
> +	if (ret)
> +		of_machine_get_compatible(&soc_dev_attr->machine);
>   
>   	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
>   	if (soc_die) {
> @@ -267,7 +262,6 @@ static int __init fsl_guts_init(void)
>   err_nomem:
>   	ret = -ENOMEM;
>   err:
> -	kfree(soc_dev_attr->machine);
>   	kfree(soc_dev_attr->family);
>   	kfree(soc_dev_attr->soc_id);
>   	kfree(soc_dev_attr->revision);
> 


