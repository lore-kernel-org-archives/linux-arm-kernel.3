Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5819EE6F090
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYNVhpmO2lMnuQh+OvDz1PNLpzGoqWIemwE4aq251Ag=; b=nGCMzGF28a+ACb1ajK5zpHjYeA
	OuA9L4x5H25B3PImGqQ3bSw/XVX3A74Jgkw0LQsR/3H4I7ueB4h24O8uh6I5LOKhDg3LqTQC/V5+4
	SjS4qomwqUOxJ71ZkOZVmexOheAMj2e0xROCsVYiOXlfRur3OrYwlmKBz+nRv/x3TU+dQyHuCX+Ad
	UmRAdb5mbc7ZTzGr82CC2jg1Q6J1STQ4bA9vE5/G7Gmr3al3YZ6IUEbO1BNe+4lzoEUpreCUbrGld
	aFdtEVm4NrKl0iL9Zt3EOzvBs7+xIxXH/TU+r+9TihrvsSrw3M945xkuvj7IZLeGFotOjQ/31iIzZ
	ldFqd+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3Qq-0000000FcLS-0B2C;
	Tue, 23 Dec 2025 14:32:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3Qo-0000000FcKc-0YKO;
	Tue, 23 Dec 2025 14:32:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A25340BF5;
	Tue, 23 Dec 2025 14:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3FBC113D0;
	Tue, 23 Dec 2025 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766500329;
	bh=7StZ2MsJgp6eerhY0+TgSoLxxhzbXurWyNMGpuZCvos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PgFtEb4Pc/pLYa36reynve3IHGYEqF5RCn2tbRSi9LzdqZc7BIuL5eECEoS+PROe0
	 8m0lX5W7YTLDd80neJaRDrlbfHiV1xjC8v79FjHykawNnu8Fn1ssKnt3K4ugV4MCH3
	 lenlFwC2p+NbjYEs0/2fAUs8BC+hRO0S+/U+YsDfRmkfKq0uAfzUeb4NJ5NHzOwYYX
	 /Hxlahm7nCIW/Xn+P7QuxGHSpYeZGf8Or16GJVxCzn78CbPXmoaTMO2wFPMx1R3o8k
	 NJ/aCawVEYoKTtWd+lPOqZZPwTBMu4zYIQhBRQjwB5GZUN2Xt16od+UrlLf6IA3W6V
	 plgTw3YIkMT5A==
Date: Tue, 23 Dec 2025 15:32:06 +0100
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
Subject: Re: [PATCH 2/8] phy: axiado: add Arasan eMMC-PHY for Axiado
Message-ID: <20251223-grumpy-daft-loon-6a6186@quoll>
References: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com>
 <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-2-5457d0ebcdb4@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-2-5457d0ebcdb4@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_063210_236847_3885E2D0 
X-CRM114-Status: GOOD (  24.65  )
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

On Mon, Dec 22, 2025 at 04:45:01PM +0800, Tzu-Hao Wei wrote:
> @@ -15,6 +15,7 @@ obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
>  obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o


Where is maintainers file update in this patch? Why shall we take
unmaintained code?

>  obj-y					+= allwinner/	\
>  					   amlogic/	\
> +					   axiado/	\
>  					   broadcom/	\
>  					   cadence/	\
>  					   freescale/	\
> diff --git a/drivers/phy/axiado/Kconfig b/drivers/phy/axiado/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..824114e6068da327308321b9884552ad33db9efc
> --- /dev/null
> +++ b/drivers/phy/axiado/Kconfig
> @@ -0,0 +1,15 @@
> +#
> +# PHY drivers for Axiado platforms
> +#
> +

Missing menuconfig or other if-block for groupping this with your ARCH
and COMPILE_TEST dependency.

Look how other NEW and MAINTAINED platforms did it.

> +config PHY_AX3000_EMMC
> +	tristate "Axiado eMMC PHY driver"
> +	select GENERIC_PHY
> +	help
> +	  This enables support for the eMMC PHY block found on the
> +	  Axiado AX3000 SoCs. The PHY provides the physical layer
> +	  interface used by the Arasan SDHCI host controller for emmc
> +	  signaling and timing adjustment.
> +
> +	  If you are building a kernel for AX3000 platform with
> +	  eMMC storage, say Y or N.

...


> +static void arasan_emmc_phy_write(struct axiado_emmc_phy *ax_phy, u32 offset, u32 data)
> +{
> +	writel(data, ax_phy->reg_base + offset);
> +}
> +
> +static int arasan_emmc_phy_read(struct axiado_emmc_phy *ax_phy, u32 offset)

Useless wrappers. Just use readl/writel directly. You are not making
code more readable.

> +{
> +	u32 val = readl(ax_phy->reg_base + offset);
> +
> +	return val;
> +}
> +
> +static int axiado_emmc_phy_init(struct phy *phy)
> +{
> +	u32 val;
> +	ktime_t timeout;
> +
> +	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
> +
> +	val = arasan_emmc_phy_read(ax_phy, PHY_CTRL_1);
> +	arasan_emmc_phy_write(ax_phy, PHY_CTRL_1, val | RETB_ENBL | RTRIM_EN);
> +
> +	val = arasan_emmc_phy_read(ax_phy, PHY_CTRL_3);
> +	arasan_emmc_phy_write(ax_phy, PHY_CTRL_3, val | PDB_ENBL);
> +
> +	/* Wait max 3000 ms */
> +	timeout = ktime_add_ms(ktime_get(), LOOP_TIMEOUT);
> +
> +	while (1) {
> +		bool timedout = ktime_after(ktime_get(), timeout);
> +
> +		if (arasan_emmc_phy_read(ax_phy, STATUS) & CALDONE_MASK)
> +			break;
> +
> +		if (timedout) {
> +			dev_err(&phy->dev, "CALDONE_MASK bit is not cleared.");
> +			return -ETIMEDOUT;
> +		}
> +		udelay(TIMEOUT_DELAY);
> +	}
> +
> +	val = arasan_emmc_phy_read(ax_phy, PHY_CTRL_1);
> +
> +	arasan_emmc_phy_write(ax_phy, PHY_CTRL_1, val | REN_CMD_EN | PU_CMD_EN);
> +
> +	val = arasan_emmc_phy_read(ax_phy, PHY_CTRL_2);
> +	arasan_emmc_phy_write(ax_phy, PHY_CTRL_2, val | REN_STRB);
> +
> +	val = arasan_emmc_phy_read(ax_phy, PHY_CTRL_3);
> +	arasan_emmc_phy_write(ax_phy, PHY_CTRL_3, val | MAX_CLK_BUF0 |
> +			MAX_CLK_BUF1 | MAX_CLK_BUF2);
> +
> +	val = arasan_emmc_phy_read(ax_phy, CAP_REG_IN_S1_MSB);
> +	arasan_emmc_phy_write(ax_phy, CAP_REG_IN_S1_MSB, CLK_MULTIPLIER);
> +
> +	val = arasan_emmc_phy_read(ax_phy, PHY_CTRL_3);
> +	arasan_emmc_phy_write(ax_phy, PHY_CTRL_3, val | SEL_DLY_RXCLK |
> +			SEL_DLY_TXCLK);
> +
> +	return 0;
> +}
> +
> +static int axiado_emmc_phy_power_on(struct phy *phy)
> +{
> +	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
> +
> +	u32 val;
> +	ktime_t timeout;
> +
> +	val = arasan_emmc_phy_read(ax_phy, PHY_CTRL_1);
> +	arasan_emmc_phy_write(ax_phy, PHY_CTRL_1, val | RETB_ENBL);
> +
> +	val = arasan_emmc_phy_read(ax_phy, PHY_CTRL_3);
> +	arasan_emmc_phy_write(ax_phy, PHY_CTRL_3, val | PDB_ENBL);
> +
> +	val = arasan_emmc_phy_read(ax_phy, PHY_CTRL_2);
> +	arasan_emmc_phy_write(ax_phy, PHY_CTRL_2, val | OTAP_SEL(OTAP_DLY));
> +
> +	arasan_emmc_phy_read(ax_phy, PHY_CTRL_2);
> +
> +	val = arasan_emmc_phy_read(ax_phy, PHY_CTRL_1);
> +	arasan_emmc_phy_write(ax_phy, PHY_CTRL_1, val | DLL_TRM(DLL_TRM_ICP));
> +
> +	arasan_emmc_phy_write(ax_phy, STATUS, 0x00);
> +
> +	val = arasan_emmc_phy_read(ax_phy, PHY_CTRL_3);
> +	arasan_emmc_phy_write(ax_phy, PHY_CTRL_3, val | DLL_FRQSEL(FRQ_SEL));
> +
> +	/* Wait max 3000 ms */
> +	timeout = ktime_add_ms(ktime_get(), LOOP_TIMEOUT);
> +
> +	while (1) {

You proper read_poll loop.

> +		bool timedout = ktime_after(ktime_get(), timeout);
> +
> +		if (arasan_emmc_phy_read(ax_phy, STATUS) & DLL_RDY_MASK)
> +			break;
> +
> +		if (timedout) {
> +			dev_err(&phy->dev, "DLL_RDY_MASK bit is not cleared.");
> +			return -ETIMEDOUT;
> +		}
> +		udelay(TIMEOUT_DELAY);

...

> +static int axiado_emmc_phy_probe(struct platform_device *pdev)
> +{
> +	struct axiado_emmc_phy *ax_phy;
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	const struct of_device_id *id;
> +	struct phy *generic_phy;
> +	struct resource *res;
> +
> +	if (!dev->of_node)
> +		return -ENODEV;
> +
> +	ax_phy = devm_kzalloc(dev, sizeof(*ax_phy), GFP_KERNEL);
> +	if (!ax_phy)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +

Use proper wrapper to combine get resource and ioremap.

> +	ax_phy->reg_base = devm_ioremap_resource(&pdev->dev, res);
> +

Drop blank line, there's never such.

> +	if (IS_ERR(ax_phy->reg_base))
> +		return PTR_ERR(ax_phy->reg_base);
> +
> +	id = of_match_node(axiado_emmc_phy_of_match, pdev->dev.of_node);
> +	if (!id) {
> +		dev_err(dev, "failed to get match_node\n");

What is the point of this? You do not use this match at all, no other
devices. How can your device bind and still fail the match?

Drop

> +		return -EINVAL;
> +	}
> +
> +	generic_phy = devm_phy_create(dev, dev->of_node, &axiado_emmc_phy_ops);
> +	if (IS_ERR(generic_phy)) {
> +		dev_err(dev, "failed to create PHY\n");
> +		return PTR_ERR(generic_phy);

Syntax is - return dev_err_probe.

Didn't Axiado receive this feedback before? Are you sure that you have
procedures set inside to avoid repeating same mistakes?

Best regards,
Krzysztof


