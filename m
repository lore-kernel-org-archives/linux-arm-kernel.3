Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B5AD6B6A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//sF470+Tkq6k0wKRFler8mAmUf59mCiwnt3NwRL9+U=; b=TC+/n1LOGSySlojc0brwoUkkoH
	jIp6nt3oLZnO/N3Dx8loq6eXU00MfUTOMicHwlWXvxH/OpUXTuKxC8oAhZyKBtIrRS81oTRcf/zkM
	ucxEWrQ7O7mlVQ1J9BROzXr23526vH8Fr3umQUVHxkITNONeeUzpEnSeoVPdTNMwuevHbPqJauP7M
	UaISHMs8+1jAXSAoAWz4oceUW+ygRHgwEZwXsgwx+/T7tX6SJRVn79E1gYbiSjr/gvv5uE0zm3zyJ
	NUd9xPEhvVNZszXJ55QAHtIP4iRu/+2ze/0TLvBv/q/7E/oxfUPcnh8GE9mYDeig8vW1Cn1aME5cT
	radS62TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UCI-00000003VqQ-3Ezu;
	Thu, 31 Oct 2024 12:22:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6U8r-00000003VV6-27Fc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:19:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 865261063;
	Thu, 31 Oct 2024 05:19:38 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70F783F66E;
	Thu, 31 Oct 2024 05:19:05 -0700 (PDT)
Date: Thu, 31 Oct 2024 12:18:55 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar
 <vireshk@kernel.org>, Parthiban <parthiban@linumiz.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 12/13] cpufreq: sun50i: add a100 cpufreq support
Message-ID: <20241031121855.179b44a0@donnerap.manchester.arm.com>
In-Reply-To: <20241031070232.1793078-13-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
	<20241031070232.1793078-13-masterr3c0rd@epochal.quest>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_051909_671464_3F9E5457 
X-CRM114-Status: GOOD (  22.35  )
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

On Thu, 31 Oct 2024 04:02:25 -0300
Cody Eksal <masterr3c0rd@epochal.quest> wrote:

> From: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> 
> Let's add cpufreq nvmem based for allwinner a100 soc. It's similar to h6,
> let us use efuse_xlate to extract the differentiated part.
> 
> Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> [masterr3c0rd@epochal.quest: add A100 to opp_match_list]
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>

Looks good to me, and seems to work on my Teclast P80 tablet, so:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
> Changes in V2:
>  - Add the A100 to the cpufreq-dt-platdev blacklist.
> 
>  drivers/cpufreq/cpufreq-dt-platdev.c   |  1 +
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 28 ++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 18942bfe9c95..2a3e8bd317c9 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -103,6 +103,7 @@ static const struct of_device_id allowlist[] __initconst = {
>   * platforms using "operating-points-v2" property.
>   */
>  static const struct of_device_id blocklist[] __initconst = {
> +	{ .compatible = "allwinner,sun50i-a100" },
>  	{ .compatible = "allwinner,sun50i-h6", },
>  	{ .compatible = "allwinner,sun50i-h616", },
>  	{ .compatible = "allwinner,sun50i-h618", },
> diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> index 293921acec93..3a29c026d364 100644
> --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> @@ -22,6 +22,9 @@
>  #define NVMEM_MASK	0x7
>  #define NVMEM_SHIFT	5
>  
> +#define SUN50I_A100_NVMEM_MASK	0xf
> +#define SUN50I_A100_NVMEM_SHIFT	12
> +
>  static struct platform_device *cpufreq_dt_pdev, *sun50i_cpufreq_pdev;
>  
>  struct sunxi_cpufreq_data {
> @@ -45,6 +48,23 @@ static u32 sun50i_h6_efuse_xlate(u32 speedbin)
>  		return 0;
>  }
>  
> +static u32 sun50i_a100_efuse_xlate(u32 speedbin)
> +{
> +	u32 efuse_value;
> +
> +	efuse_value = (speedbin >> SUN50I_A100_NVMEM_SHIFT) &
> +		      SUN50I_A100_NVMEM_MASK;
> +
> +	switch (efuse_value) {
> +	case 0b100:
> +		return 2;
> +	case 0b010:
> +		return 1;
> +	default:
> +		return 0;
> +	}
> +}
> +
>  static int get_soc_id_revision(void)
>  {
>  #ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
> @@ -108,6 +128,10 @@ static struct sunxi_cpufreq_data sun50i_h6_cpufreq_data = {
>  	.efuse_xlate = sun50i_h6_efuse_xlate,
>  };
>  
> +static struct sunxi_cpufreq_data sun50i_a100_cpufreq_data = {
> +	.efuse_xlate = sun50i_a100_efuse_xlate,
> +};
> +
>  static struct sunxi_cpufreq_data sun50i_h616_cpufreq_data = {
>  	.efuse_xlate = sun50i_h616_efuse_xlate,
>  };
> @@ -116,6 +140,9 @@ static const struct of_device_id cpu_opp_match_list[] = {
>  	{ .compatible = "allwinner,sun50i-h6-operating-points",
>  	  .data = &sun50i_h6_cpufreq_data,
>  	},
> +	{ .compatible = "allwinner,sun50i-a100-operating-points",
> +	  .data = &sun50i_a100_cpufreq_data,
> +	},
>  	{ .compatible = "allwinner,sun50i-h616-operating-points",
>  	  .data = &sun50i_h616_cpufreq_data,
>  	},
> @@ -291,6 +318,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
>  
>  static const struct of_device_id sun50i_cpufreq_match_list[] = {
>  	{ .compatible = "allwinner,sun50i-h6" },
> +	{ .compatible = "allwinner,sun50i-a100" },
>  	{ .compatible = "allwinner,sun50i-h616" },
>  	{ .compatible = "allwinner,sun50i-h618" },
>  	{ .compatible = "allwinner,sun50i-h700" },


