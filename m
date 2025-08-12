Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAE7CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9At5tv3cJeGG02vJennkpDit1USF3bblhEJUu5EABg=; b=rRm/6ba6vAR5GZkqEclrojbWQv
	tJJNJ5P7PXHnsd12sQr1lhr8+5aF8pfWaY7cwct1pmtFK2JYKPr6ze9Zkv1ggP9B4GsQy+dkkCSog
	GQFqK17nrtcuMKKDb9wD58ze8sXMGUNLMVlL/6918kL7+XewWNhoo5wUuhEbOyfWYgqmHGZrj+Vdy
	iVN6reTg6BPCInoKxuRzyTULKNKV7vmXMufKgLvuOK1+zxeQZ+DcC/UR8T5p/t3VCP4UrIAuIUDIX
	9jJMm1Y/Bzmz3/zJBuml3KfQjQTjth9jvRy12kgFcNvi0A0OCqq4JHIjqstiR31TNI/OnQ41G+LSV
	Wp5WsYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ult3H-0000000BdJG-0RZ1;
	Tue, 12 Aug 2025 17:44:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulpmc-0000000B1aI-20y8;
	Tue, 12 Aug 2025 14:15:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99CEE44533;
	Tue, 12 Aug 2025 14:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B94BC4CEF0;
	Tue, 12 Aug 2025 14:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755008120;
	bh=w7+yVouNu4e07ndbQI5R/ESPidCEgnhCvVvoIskNZ1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVSkDOp7TGFY8qTzD3/ueAnokWbRqIhNjIf3yT3tGKpLWBAQfhe1eHdSUVH4A9aNf
	 43nKMj+QoXfD4N5hbUkiHsEBUoGx/2Xj8/DU/kmIK3MtV48P0FC3JH32upqd48Et6r
	 RLTFstH59k/O49ndEKOrP4NQ5VDlVnatFOEZsJvj1cukwZ0p1vDngo+jkRTU01PNMs
	 A4l9hJsevQ5hPr8XIR451S/yrJqwEg+YmC51nsVhxTS2qKPnfP57LH1OW61ofV5FIS
	 V4lya1lyIousHF2WpRvfPynjoffb8bspyTT522Z/hkexyupY233NV+YLEiH20F3ZTR
	 RFN1LZPbuAFGg==
Date: Tue, 12 Aug 2025 19:45:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
	igor.belwon@mentallysanemainliners.org, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v5 2/6] phy: exynos5-usbdrd: support HS phy for
 ExynosAutov920
Message-ID: <aJtMdHcidETZyiIp@vaman>
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
 <CGME20250805114310epcas5p459aa232884d22501f5fefe42f239fecc@epcas5p4.samsung.com>
 <20250805115216.3798121-3-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805115216.3798121-3-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_071522_561095_0A972760 
X-CRM114-Status: GOOD (  16.53  )
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

On 05-08-25, 17:22, Pritam Manohar Sutar wrote:
> Enable UTMI+ phy support for this SoC which is very similar to what
> the existing Exynos850 supports.
> 
> Add required change in phy driver to support HS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c    | 123 ++++++++++++++++++++
>  include/linux/soc/samsung/exynos-regs-pmu.h |   2 +
>  2 files changed, 125 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index dd660ebe8045..5400dd23e500 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -2054,6 +2054,126 @@ static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
>  	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>  };
>  
> +static int exynosautov920_usbdrd_phy_init(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
> +	if (ret)
> +		return ret;
> +
> +	/* Bypass PHY isol */
> +	inst->phy_cfg->phy_isol(inst, false);
> +
> +	/* UTMI or PIPE3 specific init */
> +	inst->phy_cfg->phy_init(phy_drd);
> +
> +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
> +
> +	return 0;
> +}
> +
> +static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
> +	int ret = 0;

Superfluous init..

> +
> +	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
> +	if (ret)
> +		return ret;
> +
> +	exynos850_usbdrd_phy_exit(phy);
> +
> +	/* enable PHY isol */
> +	inst->phy_cfg->phy_isol(inst, true);
> +
> +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
> +
> +	return 0;
> +}
> +
> +static int exynosautov920_usbdrd_phy_power_on(struct phy *phy)
> +{
> +	int ret;
> +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);

Reverse chrsitmas tree pls

-- 
~Vinod

