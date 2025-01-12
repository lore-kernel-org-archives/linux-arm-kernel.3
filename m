Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96951E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QO3RztPZkCFDs5GuDcMkH2fRDOHXj32L+L7NG6jybn8=; b=Jyv5gHbWINvOzBVqWmwAApw3tf
	7mw8DD1PD9EBZsC2w/Y0meKSExFpxNpy1QvRiSUNe0pAX9OD5jBStBDmXCAiYwUrTJok/XpPmepzg
	sJcis3HXR9AnCb/C95KA6ITTA8XFqsI3CGyUnWMD4QklfB/GeTg9N6J0EqS3CcIKt5mUthxfyZJZM
	I7x8630L3LCQBlxhyCAD2jro2X61ISnfTe2y2OKC7V/Ovd9fh9f/wXKkqS/Y/6IV2hlZ0mtZGKMwT
	+BmVFOj58PZ4uHb7tMbBLEYiYBJ9G4V0NbXYatArshs131FWtgnqDUFkwzCqBhBOW+wXWN8Dgu276
	WXDhZHwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWzsx-00000002xtZ-1wVZ;
	Sun, 12 Jan 2025 15:28:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWzrh-00000002xXp-14R2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 15:27:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C18C65C41F2;
	Sun, 12 Jan 2025 15:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B44C4CEDF;
	Sun, 12 Jan 2025 15:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736695620;
	bh=oQB4d3mtZNWze0IAzdVih8xUg0nziFR7hFNGRVfmzgE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kXvUmjwYxKBceJrH7aU+jE3oW4MizvS+7TZOOGhRVef3y974AtqDgPhhSbN5MHvZ/
	 lNT3GFCnRq9q9j2ahjyqJXyLI5jTEN0bX3pKN6jqsPC/Ovmg86d2l8Sn2ARdOGBeNd
	 VxLvnzWvHhRW+it2C6E0v/8hG8d8b8pVfn8iMvaYCIzr7qWP6Pr4wtX72D0uV0LyDV
	 m9NcJ7bppwlg/g9ZhIMZdAWcniFm7wcCZMJO0ZyBIsY3qpcnxFKX0ZJjpioldI+jH9
	 p7qgS44K0n2rHjrHf3yVJCp+Cm2Xbbwix4fhCm1sUr2O9J8z+O7hkGAHl0ieVwyRfg
	 3ezxYbJcuTH+w==
Date: Sun, 12 Jan 2025 15:26:51 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: stm32: Drop unnecessary DT property presence
 check
Message-ID: <20250112152651.30b343dd@jic23-huawei>
In-Reply-To: <20250109182325.3973684-2-robh@kernel.org>
References: <20250109182325.3973684-2-robh@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_072701_344244_20181225 
X-CRM114-Status: GOOD (  18.40  )
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

On Thu,  9 Jan 2025 12:23:25 -0600
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> There's no reason to check for regulator supply property presence before
> calling devm_regulator_get_optional() as that will return -ENODEV if
> the supply is not present.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> The diff context doesn't show it, but the next line returns on error 
> other than -ENODEV.
Thanks for that. Saved me opening the file.

Applied to the testing branch of iio.git. Probably next cycle material now.

Jonathan

> 
>  drivers/iio/adc/stm32-adc-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index 2201ee9987ae..0914148d1a22 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -615,8 +615,7 @@ static int stm32_adc_core_switches_probe(struct device *dev,
>  	}
>  
>  	/* Booster can be used to supply analog switches (optional) */
> -	if (priv->cfg->has_syscfg & HAS_VBOOSTER &&
> -	    of_property_read_bool(np, "booster-supply")) {
> +	if (priv->cfg->has_syscfg & HAS_VBOOSTER) {
>  		priv->booster = devm_regulator_get_optional(dev, "booster");
>  		if (IS_ERR(priv->booster)) {
>  			ret = PTR_ERR(priv->booster);
> @@ -628,8 +627,7 @@ static int stm32_adc_core_switches_probe(struct device *dev,
>  	}
>  
>  	/* Vdd can be used to supply analog switches (optional) */
> -	if (priv->cfg->has_syscfg & HAS_ANASWVDD &&
> -	    of_property_read_bool(np, "vdd-supply")) {
> +	if (priv->cfg->has_syscfg & HAS_ANASWVDD) {
>  		priv->vdd = devm_regulator_get_optional(dev, "vdd");
>  		if (IS_ERR(priv->vdd)) {
>  			ret = PTR_ERR(priv->vdd);


