Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97B4C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 08:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tg2d+uSxSfnEQ+/wwkTn7ftgs1qXWrlfLkCgiC/frqc=; b=irVhibmOZeYiVwTjFpMjgXr1ta
	fWfl2WLL0r7SedRrEQTeoOfQvG8ibA05d9FkeNHj8TZC6LFFHShTRIpKUmHOX/+lE+TO9FH8LyisF
	Rn95QM+8TcY9PBESo/lm3mKW+W4ElbTc5k6ivQ//xSb2KzE3TdBB7P8lLf9+PVS2O3PQP7jPjPvzz
	UD1pH0ifeGRYS2f9jl+/bDnCDftMboFxJGyMR8LA2kO0ZqIyfHrS4MGDTPZwWg6/CIgaQ0L0xaKqu
	xuHeLXCxtGLAbY4cM1k7VL8IDedQiDV3rMSQJD8easQ86OIVddh+c9fWhGfXvg6Rm0zvBKlAx9cb/
	vOfxz3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4B1-0000000FdPS-2k0r;
	Wed, 12 Aug 2026 08:19:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4B0-0000000FdPM-3qg5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 08:19:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B7F961878;
	Wed, 12 Aug 2026 08:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256A71F000E9;
	Wed, 12 Aug 2026 08:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786522746;
	bh=tg2d+uSxSfnEQ+/wwkTn7ftgs1qXWrlfLkCgiC/frqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bf1R0GNVZA16GWAATXUlPxuJ4mfMJXiDCQdYgqoD7y80q/FqN0jKELPlZTl9YTSrq
	 pLpN5vvXrB/Hpwb2Qie70vFXzOaEtxgUQfwS1VvVVj/ntwWHq8sJ4V7c4wUqra+tJl
	 Yu7Hd+z0rnMOw9KFYuMF/fE7zPPyOoJJ+gE0mIJ27Q1qkAQ1YstVhugQlPW/8W8DAF
	 AbLBTUPp2Un1B907c7J1kcG/3mPgE6+afRtmm6eywgjLeY/vvyoDNRVwK1xLJYBz8l
	 BdoJ382q3izk1A2BvnJTdmKd9ULzUj4G1OsjAwisEQrhF8vecaPPNkpzWjNr7I1jAb
	 wPgPPC2subyLA==
Date: Wed, 12 Aug 2026 09:18:56 +0100
From: Lee Jones <lee@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, mfd@lists.linux.dev,
	Srinivas Kandagatla <srini@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v24 08/12] mfd: psci-mfd: Add psci-reboot-mode child cell
Message-ID: <20260812081856.GF1072730@google.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-8-889281373870@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-8-889281373870@oss.qualcomm.com>
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

On Mon, 03 Aug 2026, Shivendra Pratap wrote:

> The PSCI "reboot-mode" node does not define a compatible because it is a
> configuration of boot-states provided by the underlying firmware. With
> the new firmware-node based cells in mfd-core, this node can now be
> exposed as a proper child cell.
> 
> Add the psci-reboot-mode child cell to the psci-mfd driver with a
> named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
> reboot-mode failures.
> 
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/mfd/psci-mfd.c      | 27 ++++++++++++++++++++++++++-
>  drivers/power/reset/Kconfig |  2 +-
>  2 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
> index 7affd6bb09dd..7befc4fa86f5 100644
> --- a/drivers/mfd/psci-mfd.c
> +++ b/drivers/mfd/psci-mfd.c
> @@ -14,10 +14,35 @@ static const struct mfd_cell psci_cells[] = {
>  	},
>  };
>  
> +static const struct mfd_cell psci_reboot_mode_cell[] = {
> +	{
> +		.name = "psci-reboot-mode",
> +		.named_fwnode = "reboot-mode",
> +	},
> +};
> +
>  static int psci_mfd_probe(struct platform_device *pdev)
>  {
> -	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
> +	int ret;
> +
> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>  				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
> +	if (ret)
> +		goto out;
> +
> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				   psci_reboot_mode_cell,
> +				   ARRAY_SIZE(psci_reboot_mode_cell),
> +				   NULL, 0, NULL);
> +	if (ret) {
> +		if (ret == -ENOMEM)
> +			goto out;
> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);

Okay Yoda, but why is this okay?

Needs a comment.

> +		ret = 0;
> +	}
> +
> +out:
> +	return ret;
>  }
>  
>  static const struct of_device_id psci_mfd_of_match[] = {
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index 143f3260f04a..1810482d52e6 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -362,7 +362,7 @@ config NVMEM_REBOOT_MODE
>  
>  config PSCI_REBOOT_MODE
>  	bool "PSCI reboot mode driver"
> -	depends on ARM_PSCI_FW || COMPILE_TEST
> +	depends on (ARM_PSCI_FW && MFD_PSCI) || COMPILE_TEST
>  	select REBOOT_MODE
>  	help
>  	  Say y here will enable PSCI reboot mode driver. This gets
> 
> -- 
> 2.34.1
> 

-- 
Lee Jones

