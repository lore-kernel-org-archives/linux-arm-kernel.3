Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F666E73151
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBJJhJREsNh8CWkiUDSE8PFblratOfsrYUrY/9+hbA4=; b=bW9HXf9Hf3FWMUCZBQ7V998kKX
	od/uqQbGhrbgUvxO5akEpqokGALmL2iZvCRcZ4XxitMbGWfH+J4ow0JKrceIaNU9NHITUTXVAQdmz
	Xz3t0XjsgqXMziKNQ/1i2bWRzKHvmCEL3uTmVkCdcM/bh1nv3MJSgtLcph4gfQ/Hi0Vo3YOt8EmAy
	pWKKMWcjWRNpF4i/4DzMIxXqcnBHTvE8mKXzKMisi7eKICLh71S7+zNBVcJxFg50RMGfZ+O/USD2D
	p2JzdFyDG7YBGVahMPjTCJ31P/VdB5sx6ISXAPeoqFGPL2Svz40XbAXIchy6BmZ85CqYy4loXFUxY
	+U3LQ/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqeB-00000004kPJ-0EYg;
	Mon, 02 Feb 2026 09:55:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqe9-00000004kOj-0zUb;
	Mon, 02 Feb 2026 09:55:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA44A60125;
	Mon,  2 Feb 2026 09:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4ACC116C6;
	Mon,  2 Feb 2026 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770026103;
	bh=lsw0eR4c5APt/3xcULKgpWlgBGnITGXccb/xcCY4y9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XKgtmkwvenC5rUOPJx/d/zVCRcKWIeYzY4mwq7El18fBm9iOqhm30DX3MCOsrO5oX
	 se2xbggP8B2krp/yrQfnJe48CUZ7EC6IerR03YirktkzOFNDsibrgdqhLM+2Ac2UxR
	 o1zC6Mj6FilVouTWnZrQ1+Dae769Kkhsk7FKMIVNcxktW8y8UcAyqCSFpfOi+f8EXt
	 nmE5+PiosYWXFE/oHIuOQD2YLGLoJbIaN7RWeGIAufjdFPKTc9QsqAHzbNkQh3P9O1
	 NQ1s+T1Zw4hbfb4EBWR4ykXyZbCrC5mZoM24rzNjgchmpswb9GAgGD4jxZDFquiFR+
	 GndESMf1gY/cQ==
Date: Mon, 2 Feb 2026 10:54:58 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Grimmauld <grimmauld@grimmauld.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
Message-ID: <aYB0ctHF1ZeIIzbq@ryzen>
References: <20240809073610.2517-1-linux.amoon@gmail.com>
 <aXtpg0V_sifQEWHJ@grimm-nixos-ssd-2>
 <aXyHITrZ89Mmn8_J@ryzen>
 <CANAwSgTQ-cdyzd2WjHMYCY33p7um3CpjMeTzRO7vcd0fTF6X9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANAwSgTQ-cdyzd2WjHMYCY33p7um3CpjMeTzRO7vcd0fTF6X9Q@mail.gmail.com>
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

On Sat, Jan 31, 2026 at 03:08:42PM +0530, Anand Moon wrote:
> >
> I’ve attempted to reproduce the warning but was unable to trigger it locally.
> 
> I have tested with the built-in module
> CONFIG_R8169=y
> CONFIG_R8169_LEDS=y
> 
> As well as the module
> CONFIG_R8169=m
> CONFIG_R8169_LEDS=y
> 

I'm running with:
CONFIG_R8169=y
CONFIG_PHYLIB=y
CONFIG_REALTEK_PHY=y
CONFIG_REALTEK_PHY_HWMON=y

CONFIG_PCIE_ROCKCHIP_DW=y
CONFIG_PCIE_ROCKCHIP_DW_HOST=y
CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y
(PHY for the PCIe 2x)

$ cat /proc/cmdline
root=/dev/nfs nfsroot=192.168.1.10:/srv/nfs/rootfs_rc,nfsvers=4 ip=dhcp earlycon rootwait loglevel=8

Considering that all PHY drivers (for both Ethernet and PCIe),
and drivers (for both Ethernet and PCIe) are built as built-in,
having nfsroot= on the kernel command line should be no issue.

But, perhaps that is the reason why you cannot reproduce it?


> >
> > Having async probing for the Rockchip PCIe controller driver, which is
> > used a LOT of rockchip based SoCs, is a good thing, so I don't think it
> > is right to avoid enabling async probing just because it results in a
> > splat on a single rockchip based board (rock5b).
> >
> Yes, this could help in the module probe pci module.
> 
> Earlier, I thought gmac will control the r8169 module, but I was wrong.
> Could you please try these changes at your end? These changes are
> related to MIMO..
> 
> $ git diff ./arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> index b3e76ad2d869..fb3a8ba4085a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> @@ -477,7 +477,6 @@ &pcie2x1l0 {
>  &pcie2x1l2 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&pcie2_2_rst>;
> -       reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
>         vpcie3v3-supply = <&vcc3v3_pcie2x1l2>;
>         status = "okay";
>  };
> @@ -535,6 +534,12 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
>                 };
>         };
> 
> +       rtl8211f {
> +               rtl8211f_0_rst: rtl8211f-0-rst {
> +                       rockchip,pins = <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +               };
> +       };
> +
>         usb {
>                 usbc0_int: usbc0-int {
>                         rockchip,pins = <3 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
> @@ -550,6 +555,19 @@ &pwm1 {
>         status = "okay";
>  };
> 
> +&mdio0 {
> +       rgmii_phy0: ethernet-phy@1 {
> +               /* RTL8211F */
> +               compatible = "ethernet-phy-id001c.c916";
> +               reg = <0x1>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&rtl8211f_0_rst>;
> +               reset-assert-us = <20000>;
> +               reset-deassert-us = <100000>;
> +               reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> +       };
> +};
> +
>  &rknn_core_0 {
>         npu-supply = <&vdd_npu_s0>;
>         sram-supply = <&vdd_npu_s0>;
> 

I tried your patch above, but I still see the splat.

But as I said, I don't think the splat should be a showstopper.


Kind regards,
Niklas

