Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD95E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 14:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xh7AMjhGBMMRDFnYSTpxG5TBmo/F+SBMLUIfYd7Rnc=; b=WioBtCQCv6YBT/8yxOzjta4h38
	y104edD0eeLMMxpwpPgAFky3898c/yCicWO518k5zSde7qvHNqxrSWnoQ3Ni0H5BPy5jbVDBAAZq3
	RVYJ3nK5yxJj8/2H81QA3gmlB1exiXB8sq3WwG6CeobSeoigHFbdcffBdwk670G9rfCYrGRrL5yvU
	ySj67O8guEgugwINTaLmN6vj3l+NXb7m16Mf6MqA0OYW1m9+rKcRAsYBJsQk8HMnyljAFqFx8frG6
	GnWMprZ5eP2NEwliLvB9C2TiB3A84SGi66BTKSyqHOhwVol4Y63mVDT3zQYG1JMKAwWLAPJZv5a3o
	bJxiTg1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTidm-0000000D6nt-3tcc;
	Fri, 03 Jan 2025 14:27:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTicZ-0000000D6Y9-0IbJ;
	Fri, 03 Jan 2025 14:25:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A7A55C63DF;
	Fri,  3 Jan 2025 14:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B28C4CECE;
	Fri,  3 Jan 2025 14:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735914350;
	bh=nh7JFxsfxQk/ZlfligC+BkTw6ydpwOx0Jol1iFdUeGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ogVam2JWPIRaE878ZGs/aogLDJfox/EtVWaAZuVw+Zxb9KIjuJtCNkoApK4nh8Ab8
	 UGaYuDRkJ1XJIA/Sqf4MOQXazdRELeumYKfDnfWnursfiEB6iWVXWg4kqnwi78aSmv
	 16LiUBac3t1IJ6VaKmA28f60l4aK81WtxgaIS8jVAoNzjazRZyjALUaH1FjVgw/heJ
	 8VwFJKbonb3+b/GHTbjLptdGr5cfHmB+z7DPajd/sPe4PHkQ//GaXhah07pXsPttVF
	 Q6hEq54Nn9bQNVicnILk0MbDI5x3sMk2Dgza2PI/KZ72mvF11p5VGftOKVJOC+tlAb
	 /ijFzh+Zv6LJQ==
Date: Fri, 3 Jan 2025 15:25:45 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
Message-ID: <Z3fzad51PIxccDGX@ryzen>
References: <20240809073610.2517-1-linux.amoon@gmail.com>
 <Z3fKkTSFFcU9gQLg@ryzen>
 <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_062551_195876_4E726E40 
X-CRM114-Status: GOOD (  24.82  )
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

Hello Anand,

On Fri, Jan 03, 2025 at 07:24:07PM +0530, Anand Moon wrote:
> 
> Thanks for testing this patch.
> 
> This patch should have been tested on hardware that includes all the
> relevant controllers,
> such as PCI 2.0, PCI 3.0, and the SATA controller.
> I will test this patch again on all the Radxa devices I have.
> 
> This patch's dependency lies in deferring the probe until the PHY
> controller initializes.
> 
> CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=m


Note that the splat, as reported in this thread, and in:
https://lore.kernel.org/netdev/20250101235122.704012-1-francesco@valla.it/T/

is related to the network PHY (CONFIG_REALTEK_PHY) on the RTL8125 NIC,
which is connected to one of the PCIe Gen2 controllers, not the PCIe PHY
on the PCIe controller (CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY) itself.

For the record, I run with all the relevant drivers as built-in:
CONFIG_PCIE_ROCKCHIP_DW_HOST=y
CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y (for the PCIe Gen2 controllers)
CONFIG_PHY_ROCKCHIP_SNPS_PCIE3=y (for the PCIe Gen3 controllers)
CONFIG_R8169=y
CONFIG_REALTEK_PHY=y


> 
> To my surprise, we have not enabled mdio on Rock-5B boards.
> can you check if these changes work on your end?

I think these changes are wrong, at least for rock5b.

On rock5b the RTL8125 NIC is connected via PCI, and PCI devices should not
be specified in device tree, as PCI is a bus that can be enumerated.


> 
> -----8<----------8<----------8<----------8<----------8<----------8<-----
> alarm@rock-5b:/media/nvme0/mainline/linux-rockchip-6.y-devel$ git diff
>    arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> index c44d001da169..5008a05efd2a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> @@ -155,6 +155,19 @@ vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
>         };
>  };
> 
> +&mdio1 {
> +       rgmii_phy1: ethernet-phy@1 {
> +               /* RTL8211F */
> +               compatible = "ethernet-phy-id001c.c916";
> +               reg = <0x1>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&rtl8211f_rst>;
> +               reset-assert-us = <20000>;
> +               reset-deassert-us = <100000>;
> +               reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> +       };
> +};
> +
>  &combphy0_ps {
>         status = "okay";
>  };
> @@ -224,6 +237,21 @@ &hdptxphy_hdmi0 {
>         status = "okay";
>  };
> 
> +&gmac1 {
> +       clock_in_out = "output";
> +       phy-handle = <&rgmii_phy1>;
> +       phy-mode = "rgmii";
> +       pinctrl-0 = <&gmac1_miim
> +                    &gmac1_tx_bus2
> +                    &gmac1_rx_bus2
> +                    &gmac1_rgmii_clk
> +                    &gmac1_rgmii_bus>;
> +       pinctrl-names = "default";
> +       tx_delay = <0x3a>;
> +       rx_delay = <0x3e>;
> +       status = "okay";
> +};
> +
>  &i2c0 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&i2c0m2_xfer>;
> @@ -419,6 +447,12 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
>                 };
>         };
> 
> +       rtl8211f {
> +               rtl8211f_rst: rtl8211f-rst {
> +                       rockchip,pins = <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +               };
> +       };
> +
>         usb {
>                 vcc5v0_host_en: vcc5v0-host-en {
>                         rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> >
> > Kind regards,
> > Niklas
> 
> Can you check this on your end
> 
> alarm@rock-5b:~$ sudo cat /sys/kernel/debug/devices_deferred
> [sudo] password for alarm:
> fc400000.usb    dwc3: failed to initialize core
> alarm@rock-5b:~$ sudo cat /sys/kernel/debug/devices_deferred

Sure:
# cat /sys/kernel/debug/devices_deferred
fc400000.usb    dwc3: failed to initialize core


Kind regards,
Niklas

