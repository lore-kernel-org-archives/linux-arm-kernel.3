Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0C2E6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeLo5zWCs+flW/CSS+BHV7x4PMTPbMrBIfPuZN4DcpI=; b=yl5QbsTfdAq/AI7n+qN1/wq8Hn
	I6QiyQPbE7ZQe8fxlZOfYiTeYF2KU78b1aDSn0JVmB+6IXkRg0mzT+VsH07IKniR9QrR+uFMEd1Fx
	N3BfwFUe1sXuE5GNJ17dzNtrFawMx8grEDp5b3gzkV1UeqRuWQ6GjyGqff+ZbvrOEzCSGjzmSS6h7
	C4jwCbeJ8g9KpFLFNMP5yhLVdRCtk+6FZ/Dd4GDg29dlOQ2g9Iq5uu3U1bprTRoZtYh9qs6aYK+VV
	IQUgvXHJ3JSMiDVXyacaftJtr4gueViSa0VG8XBQjqojj9xnSUAFz0UG5/uwrh+4RjrVM/L+gwViF
	kd3pAmvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3Sk-0000000FcaM-14EC;
	Tue, 23 Dec 2025 14:34:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3Sj-0000000FcZx-2vUH;
	Tue, 23 Dec 2025 14:34:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF6A660139;
	Tue, 23 Dec 2025 14:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C85EC113D0;
	Tue, 23 Dec 2025 14:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766500448;
	bh=/WkCZpcjC5bw20Uuag2CiawKOzwJcdpsoXAnM2eGkLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZc2WNwRe5BY6dEFOqXYosiONReBdWsxoeFfucODmACjHaOSmpdo9b9r3QahCF8TV
	 CDH9TYhuALO1FriHVG4lY74lmjhvE235sCsINPCCicWqAPVq2FCo/jyfgBavtLz6ab
	 DbluFXKUtUgDI5yy3licU5ECnLqVcd5H9Lxcg/pmKoq0rysWLVNZNcskSDVbWKsRLV
	 rwSiTzN41vNo3YMq2Z4ULM+iB2BHONgefBzB0k2wiZKkOcp1Wbz0lcynuu5zgr/zpw
	 Eq4p17nTRn6tfmq+I+W8uyGSSN2XkQKPqA1zNua5QFdKs2aKDWvcAiUb78+H9hFR+o
	 M4PHPbIX14oQw==
Date: Tue, 23 Dec 2025 15:34:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: SriNavmani A <srinavmani@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Michal Simek <michal.simek@amd.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 6/8] mmc: host: axiado: add AX3000 eMMC PHY support to
 sdhci-of-arasan
Message-ID: <20251223-optimal-ochre-kestrel-a8cb1c@quoll>
References: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com>
 <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-6-5457d0ebcdb4@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-6-5457d0ebcdb4@axiado.com>
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

On Mon, Dec 22, 2025 at 04:45:05PM +0800, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> Add support for the external eMMC PHY used on the AX3000 SoC in the
> sdhci-of-arasan driver. The default Arasan host driver operates at
> 25 MHz, but with the external PHY support, the controller can achieve
> HS200 mode operation at 200 MHz.
> 
> This change integrates the AX3000 eMMC PHY driver with the existing
> sdhci-of-arasan host controller driver to enable high-speed eMMC
> operations.
> 
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
>  drivers/mmc/host/sdhci-of-arasan.c | 20 +++++++++++++-------

Why do you mix mmc, phy and soc into one patchset?

>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index ab7f0ffe7b4f007a58eb0a26868b08b0b02b40f3..2d4f64e9014ae168957113478edc11209cd76b64 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -1547,6 +1547,10 @@ static const struct of_device_id sdhci_arasan_of_match[] = {
>  		.compatible = "arasan,sdhci-5.1",
>  		.data = &sdhci_arasan_generic_data,
>  	},
> +	{
> +		.compatible = "axiado,ax3000-sdhci-5.1-emmc",
> +		.data = &sdhci_arasan_generic_data,
> +	},
>  	{
>  		.compatible = "arasan,sdhci-4.9a",
>  		.data = &sdhci_arasan_generic_data,
> @@ -2019,15 +2023,17 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
>  			goto unreg_clk;
>  		}
>  
> -		host->mmc_host_ops.hs400_enhanced_strobe =
> +		if (!of_device_is_compatible(np, "axiado,ax3000-sdhci-5.1-emmc")) {

No, don't sprinkle compatibles all around. You should use driver match
data for this.

Best regards,
Krzysztof


