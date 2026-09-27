Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A916DC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 18:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTGkk6MKJYEzG3GcMmmmeg6WnVpHww0g7NA09ykyC/4=; b=Bo8G19UvhqdWEz1PAFvvutFsJe
	dZnlNx+lwIAYBqVSjL1LWul+xEfA5YMVdxOCG13gS7srrAGFQALco5vNQ0yDXkHISBt+DKnWV/Pj/
	VGEqgv4QNb3dFG78/JaJHIBvngK0lBTviy8AW/Hk7Tal7k2sVrfJpWsjLAF+gomKRgFlxvBQV37j8
	IKMXanCUn4GJpKsgySIGVcPxXlKe1oHXWazG6LQ7PZsGqh+uu6y3kWbghiFHRYc/7jnIzBFmpN/Xo
	URglKg2suamjuV9W4A6Frn6h1mBrm8oqYS/25pt1D34R+WjA5iIFzHq6J7JLZ1eCrIE5lPLt9egU4
	xXfAjTSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAtuZ-0000000GiDv-2Yx6;
	Sun, 27 Sep 2026 18:47:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAtuY-0000000GiDo-3sRU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 18:47:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 12EBF601F7;
	Sun, 27 Sep 2026 18:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C85C1F000FF;
	Sun, 27 Sep 2026 18:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790534861;
	bh=rTGkk6MKJYEzG3GcMmmmeg6WnVpHww0g7NA09ykyC/4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XiouCllzQ8ykayo10Wtw+WZ9XUHvKJYxIdOip1YinuSyngXjM6haeQeLkKxhkYMWh
	 TEz97N/hVI+VL6sO9QCwcl0Hv2/P2G8FIsgYsoeBBCujZIwMrpMfkogK0OX77JosxG
	 872EwwComyyYJvmkAxQaDjK2Z1y/jNw6UYUXQltl7Kw4goXb+9PPH7XPg6diolzM8d
	 CtoHzhvC3dsG1UjptevwG1lfIp7eASokpg+hub9c1h1AawVUeGVtPBxxt8V3bWnZhT
	 tey8FMJLq52mxDjR4COhdZNzCbsQ94N4WYx4riJmDIgbe9ALxgAoiq9M8NPYxdgko7
	 h4J6/NSUw0vUA==
Date: Sun, 27 Sep 2026 19:47:34 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, <linux-iio@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Cheick Traore <cheick.traore-ext@st.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH] iio: adc: stm32: fix minimum sampling time values
Message-ID: <20260927194734.7bc017a2@jic23-hlaptop>
In-Reply-To: <20260924-adc-fix-sampling-v1-1-13814954d8d7@foss.st.com>
References: <20260924-adc-fix-sampling-v1-1-13814954d8d7@foss.st.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 24 Sep 2026 11:53:56 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> From: Cheick Traore <cheick.traore-ext@st.com>
> 
> - On stm32mp15: vddcpu and vddq_ddr are not connected to internal
> channel, so their sampling time shouldn't be set.
> 
> - On stm32mp13: vddcpu and vddq_ddr are connected to internal channels
> and the value for vddcore was not correct. Values from the datasheet
> are 1us (e.g. 1000ns) for ts_vddcore, ts_vddcpu and ts_vddq_ddr.
> 
> Fixes: 7cb2303dd024 ("iio: adc: stm32: manage min sampling time on all internal channels")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cheick Traore <cheick.traore-ext@st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Hi Cheick, Fabrice

Given we are fairly late in the cycle and that we have Fabrice's
other series poking at this same driver I've queued this up on
the testing branch of iio.git rather than taking a (possibly) faster
path.  That means it will go upstream in the next merge window.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-adc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 90f0e257e6d1..b024326775ae 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -2734,7 +2734,7 @@ static const struct stm32_adc_cfg stm32h7_adc_cfg = {
>  	.set_ovs = stm32h7_adc_set_ovs,
>  };
>  
> -static const unsigned int stm32_adc_min_ts_mp1[] = { 100, 100, 100, 4300, 9800 };
> +static const unsigned int stm32_adc_min_ts_mp1[] = { 100, 0, 0, 4300, 9800 };
>  static_assert(ARRAY_SIZE(stm32_adc_min_ts_mp1) == STM32_ADC_INT_CH_NB);
>  
>  static const struct stm32_adc_cfg stm32mp1_adc_cfg = {
> @@ -2756,7 +2756,7 @@ static const struct stm32_adc_cfg stm32mp1_adc_cfg = {
>  	.set_ovs = stm32h7_adc_set_ovs,
>  };
>  
> -static const unsigned int stm32_adc_min_ts_mp13[] = { 100, 0, 0, 4300, 9800 };
> +static const unsigned int stm32_adc_min_ts_mp13[] = { 1000, 1000, 1000, 4300, 9800 };
>  static_assert(ARRAY_SIZE(stm32_adc_min_ts_mp13) == STM32_ADC_INT_CH_NB);
>  
>  static const struct stm32_adc_cfg stm32mp13_adc_cfg = {
> 
> ---
> base-commit: 182c47735554925da9605dc9dd90a8c15a1bbae5
> change-id: 20260924-adc-fix-sampling-526f0f26829b
> 
> Best regards,
> --  
> Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> 


