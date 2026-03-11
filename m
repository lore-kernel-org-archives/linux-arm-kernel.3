Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2879F104BEC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wssJRSaVcN+5qE2KCGqgv0+kxSxQXPx6DovUJ5O4+Xk=; b=umAh+2hIVmymITqI+RJPQVS1DE
	0Kbr2OqSchm/GrO8pQurG97FNVLvAkbXVYQiFPBaoTLdHD69r0429FQkNbbmyOjoe9/uK5jmfocML
	rBiq0jNHLAtUHwXT+O0yGCSso0nnD/En2+1fugp/sxTM4WLBPugn95Ct1ttzVKY7JuH0r1lST/gpW
	ej6/WGDZX1O0klox9pyDJdS/hHarNM++dRBqyefH6Y8G6OKV6SBSzjUbcND8PNMFzki9ODHBgwxwq
	ev3Fq/yXQQ2c8nQvGRKYvAY6UuduGkfHP+wZeJSw6yc9l1AQJVgNPzobrWPi0rOF8DqwKRb9CUQzy
	IqXpGPcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MgE-0000000BwSw-4AOi;
	Wed, 11 Mar 2026 16:45:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MgD-0000000BwSV-2Ln5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:45:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B1E060054;
	Wed, 11 Mar 2026 16:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091D8C4CEF7;
	Wed, 11 Mar 2026 16:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773247504;
	bh=SD4n4+pj8XcH479hZhXzdSKjpc+/gopJhmi6ag6zuSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ulp4sUOUcBjpM7gp7bp8fwfOnHjk0a8bUAYTm433Evz0RqnUP6MSEmWH3ZN66uNin
	 QMPKIDFz71ahhNkbh5apRNvzByGWdzGbIqw+5D4qPIrz3O/dyYuABgX5KkAe5DFmiZ
	 n1aZKGe177Bp4jssapp2tjsst8u07zm1FKkOyrYtN/1+/nqa4/LrKBObkxM4EckL3H
	 5nSm5rd4dOVFA1/SRccM9ZvRe0grGVSI3DpDi5fks/rXQShISs8w2NO6fr+7LvcfY3
	 y2aYs/bewOUtcoDsi+N7JWNqa7H1HU6H7754t+MV+6mw/A6QAJuqVTXzaqLznyY0dt
	 zzu51gZ9MlhQQ==
Date: Wed, 11 Mar 2026 11:45:03 -0500
From: Rob Herring <robh@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] arm64: zynqmp: Switch Versal NET to firmware clock
 interface
Message-ID: <20260311164503.GA4041143-robh@kernel.org>
References: <cover.1772725183.git.michal.simek@amd.com>
 <78c6e51f0a648b42dffa4d23778b0c1caf4a5f68.1772725183.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78c6e51f0a648b42dffa4d23778b0c1caf4a5f68.1772725183.git.michal.simek@amd.com>
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

On Thu, Mar 05, 2026 at 04:39:50PM +0100, Michal Simek wrote:
> Switch Versal NET from using fixed clocks (versal-net-clk.dtsi) to the
> firmware-based CCF clock interface (versal-net-clk-ccf.dtsi). This
> enables proper clock management through the platform firmware instead
> of relying on static fixed-clock definitions.
> 
> Add DT macro headers for Versal NET and base Versal clocks, power
> domains and resets that are required by the CCF clock dtsi.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> 
> ---
> 
>  .../boot/dts/xilinx/versal-net-clk-ccf.dtsi   | 378 ++++++++++++++++++
>  .../xilinx/versal-net-vn-x-b2197-01-revA.dts  |   3 +-
>  arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h  | 123 ++++++
>  .../boot/dts/xilinx/xlnx-versal-net-clk.h     |  78 ++++
>  .../boot/dts/xilinx/xlnx-versal-net-power.h   |  38 ++
>  .../boot/dts/xilinx/xlnx-versal-net-resets.h  |  53 +++
>  .../arm64/boot/dts/xilinx/xlnx-versal-power.h |  54 +++
>  .../boot/dts/xilinx/xlnx-versal-resets.h      | 105 +++++
>  8 files changed, 831 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/xilinx/versal-net-clk-ccf.dtsi
>  create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
>  create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
>  create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
>  create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
>  create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
>  create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h

> +
> +#include "xlnx-versal-net-clk.h"
> +#include "xlnx-versal-net-power.h"
> +#include "xlnx-versal-net-resets.h"
> +
> +/ {
> +	ref_clk: ref-clk {

Preferred node name is clock-33333333.

> +		bootph-all;
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <33333333>;
> +		clock-output-names = "ref_clk";
> +	};
> +
> +	rtc_clk: rtc-clk {

clock-32768

> +		bootph-all;
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "rtc_clk";
> +	};
> +
> +	can0_clk: can0-clk {
> +		#clock-cells = <0>;
> +		compatible = "fixed-factor-clock";
> +		clocks = <&versal_net_clk CAN0_REF_2X>;
> +		clock-div = <2>;
> +		clock-mult = <1>;
> +		clock-output-names = "can0_clk";
> +	};
> +
> +	can1_clk: can1-clk {
> +		#clock-cells = <0>;
> +		compatible = "fixed-factor-clock";
> +		clocks = <&versal_net_clk CAN1_REF_2X>;
> +		clock-div = <2>;
> +		clock-mult = <1>;
> +		clock-output-names = "can1_clk";
> +	};
> +
> +	firmware {
> +		versal_net_firmware: versal-net-firmware {
> +			compatible = "xlnx,versal-net-firmware", "xlnx,versal-firmware";
> +			bootph-all;
> +			method = "smc";
> +			#power-domain-cells = <1>;
> +
> +			versal_net_reset: reset-controller {
> +				compatible = "xlnx,versal-net-reset";
> +				#reset-cells = <1>;
> +			};
> +
> +			versal_net_clk: clock-controller {
> +				bootph-all;
> +				#clock-cells = <1>;
> +				compatible = "xlnx,versal-net-clk", "xlnx,versal-clk";
> +				clocks = <&ref_clk>, <&ref_clk>, <&ref_clk>;
> +				clock-names = "ref", "pl_alt_ref", "alt_ref";
> +			};
> +
> +			versal_net_power: power-management { /* untested */
> +				compatible = "xlnx,zynqmp-power";
> +				interrupt-parent = <&gic>;
> +				interrupts = <0 57 4>;
> +				mboxes = <&ipi_mailbox_pmu1 0>,
> +					 <&ipi_mailbox_pmu1 1>;
> +				mbox-names = "tx", "rx";
> +			};
> +		};
> +	};
> +
> +	zynqmp-ipi {
> +		compatible = "xlnx,zynqmp-ipi-mailbox";
> +		interrupt-parent = <&gic>;
> +		interrupts = <0 57 4>;
> +		xlnx,ipi-id = <2>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		ipi_mailbox_pmu1: mailbox@eb3f0440 {
> +			compatible = "xlnx,zynqmp-ipi-dest-mailbox";
> +			reg = <0 0xeb3f0440 0 0x20>,
> +			      <0 0xeb3f0460 0 0x20>,
> +			      <0 0xeb3f0280 0 0x20>,
> +			      <0 0xeb3f02a0 0 0x20>;
> +			reg-names = "local_request_region", "local_response_region",
> +				    "remote_request_region", "remote_response_region";
> +			#mbox-cells = <1>;
> +			xlnx,ipi-id = <1>;
> +		};
> +	};
> +};
> +
> +&cpu0 {
> +	clocks = <&versal_net_clk ACPU_0>;
> +};

This structure is unusual and not great for readability. Imagine if we 
did a .dtsi for each provider with all the consumer properties.

> +
> +&cpu100 {
> +	clocks = <&versal_net_clk ACPU_0>;
> +};
> +
> +&cpu200 {
> +	clocks = <&versal_net_clk ACPU_0>;
> +};
> +
> +&cpu300 {
> +	clocks = <&versal_net_clk ACPU_0>;
> +};
> +
> +&cpu10000 {
> +	clocks = <&versal_net_clk ACPU_1>;
> +};
> +
> +&cpu10100 {
> +	clocks = <&versal_net_clk ACPU_1>;
> +};
> +
> +&cpu10200 {
> +	clocks = <&versal_net_clk ACPU_1>;
> +};
> +
> +&cpu10300 {
> +	clocks = <&versal_net_clk ACPU_1>;
> +};
> +
> +&cpu20000 {
> +	clocks = <&versal_net_clk ACPU_2>;
> +};
> +
> +&cpu20100 {
> +	clocks = <&versal_net_clk ACPU_2>;
> +};
> +
> +&cpu20200 {
> +	clocks = <&versal_net_clk ACPU_2>;
> +};
> +
> +&cpu20300 {
> +	clocks = <&versal_net_clk ACPU_2>;
> +};
> +
> +&cpu30000 {
> +	clocks = <&versal_net_clk ACPU_3>;
> +};
> +
> +&cpu30100 {
> +	clocks = <&versal_net_clk ACPU_3>;
> +};
> +
> +&cpu30200 {
> +	clocks = <&versal_net_clk ACPU_3>;
> +};
> +
> +&cpu30300 {
> +	clocks = <&versal_net_clk ACPU_3>;
> +};
> +
> +&can0 {
> +	clocks = <&can0_clk>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_CAN_FD_0>;
> +};
> +
> +&can1 {
> +	clocks = <&can1_clk>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_CAN_FD_1>;
> +};
> +
> +&gem0 {
> +	clocks = <&versal_net_clk LPD_LSBUS>,
> +		 <&versal_net_clk GEM0_REF>, <&versal_net_clk GEM0_TX>,
> +		 <&versal_net_clk GEM0_RX>, <&versal_net_clk GEM_TSU>;
> +	power-domains = <&versal_net_firmware PM_DEV_GEM_0>;
> +};
> +
> +&gem1 {
> +	clocks = <&versal_net_clk LPD_LSBUS>,
> +		 <&versal_net_clk GEM1_REF>, <&versal_net_clk GEM1_TX>,
> +		 <&versal_net_clk GEM1_RX>, <&versal_net_clk GEM_TSU>;
> +	power-domains = <&versal_net_firmware PM_DEV_GEM_1>;
> +};
> +
> +&gpio0 {
> +	clocks = <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_GPIO>;
> +};
> +
> +&gpio1 {
> +	clocks = <&versal_net_clk PMC_LSBUS_REF>;
> +	power-domains = <&versal_net_firmware PM_DEV_GPIO_PMC>;
> +};
> +
> +&i2c0 {
> +	clocks = <&versal_net_clk I3C0_REF>;
> +	power-domains = <&versal_net_firmware PM_DEV_I2C_0>;
> +};
> +
> +&i2c1 {
> +	clocks = <&versal_net_clk I3C1_REF>;
> +	power-domains = <&versal_net_firmware PM_DEV_I2C_1>;
> +};
> +
> +&i3c0 {
> +	clocks = <&versal_net_clk I3C0_REF>;
> +	power-domains = <&versal_net_firmware PM_DEV_I2C_0>;
> +};
> +
> +&i3c1 {
> +	clocks = <&versal_net_clk I3C1_REF>;
> +	power-domains = <&versal_net_firmware PM_DEV_I2C_1>;
> +};
> +
> +&adma0 {
> +	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_ADMA_0>;
> +};
> +
> +&adma1 {
> +	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_ADMA_1>;
> +};
> +
> +&adma2 {
> +	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_ADMA_2>;
> +};
> +
> +&adma3 {
> +	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_ADMA_3>;
> +};
> +
> +&adma4 {
> +	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_ADMA_4>;
> +};
> +
> +&adma5 {
> +	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_ADMA_5>;
> +};
> +
> +&adma6 {
> +	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_ADMA_6>;
> +};
> +
> +&adma7 {
> +	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_ADMA_7>;
> +};
> +
> +&qspi {
> +	clocks = <&versal_net_clk QSPI_REF>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_QSPI>;
> +};
> +
> +&ospi {
> +	clocks = <&versal_net_clk OSPI_REF>;
> +	power-domains = <&versal_net_firmware PM_DEV_OSPI>;
> +};
> +
> +&rtc {
> +	clocks = <&rtc_clk>;
> +	clock-names = "rtc";
> +	power-domains = <&versal_net_firmware PM_DEV_RTC>;
> +};
> +
> +&serial0 {
> +	clocks = <&versal_net_clk UART0_REF>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_UART_0>;
> +};
> +
> +&serial1 {
> +	clocks = <&versal_net_clk UART1_REF>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_UART_1>;
> +};
> +
> +&sdhci0 {
> +	clocks = <&versal_net_clk SDIO0_REF>, <&versal_net_clk LPD_LSBUS>,
> +		 <&versal_net_clk SD_DLL_REF>;
> +	power-domains = <&versal_net_firmware PM_DEV_SDIO_0>;
> +};
> +
> +&sdhci1 {
> +	clocks = <&versal_net_clk SDIO1_REF>, <&versal_net_clk LPD_LSBUS>,
> +		 <&versal_net_clk SD_DLL_REF>;
> +	power-domains = <&versal_net_firmware PM_DEV_SDIO_1>;
> +};
> +
> +&spi0 {
> +	clocks = <&versal_net_clk SPI0_REF>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_SPI_0>;
> +};
> +
> +&spi1 {
> +	clocks = <&versal_net_clk SPI1_REF>, <&versal_net_clk LPD_LSBUS>;
> +	power-domains = <&versal_net_firmware PM_DEV_SPI_1>;
> +};
> +
> +&ttc0 {
> +	clocks = <&versal_net_clk TTC0>;
> +	power-domains = <&versal_net_firmware PM_DEV_TTC_0>;
> +};
> +
> +&ttc1 {
> +	clocks = <&versal_net_clk TTC1>;
> +	power-domains = <&versal_net_firmware PM_DEV_TTC_1>;
> +};
> +
> +&ttc2 {
> +	clocks = <&versal_net_clk TTC2>;
> +	power-domains = <&versal_net_firmware PM_DEV_TTC_2>;
> +};
> +
> +&ttc3 {
> +	clocks = <&versal_net_clk TTC3>;
> +	power-domains = <&versal_net_firmware PM_DEV_TTC_3>;
> +};
> +
> +&usb0 {
> +	clocks = <&versal_net_clk USB0_BUS_REF>, <&versal_net_clk USB0_BUS_REF>;
> +	power-domains = <&versal_net_firmware PM_DEV_USB_0>;
> +	resets = <&versal_net_reset VERSAL_RST_USB_0>;
> +};
> +
> +&dwc3_0 {
> +	clocks = <&versal_net_clk USB0_BUS_REF>;
> +};
> +
> +&usb1 {
> +	clocks = <&versal_net_clk USB1_BUS_REF>, <&versal_net_clk USB1_BUS_REF>;
> +	power-domains = <&versal_net_firmware PM_DEV_USB_1>;
> +	resets = <&versal_net_reset VERSAL_RST_USB_1>;
> +};
> +
> +&dwc3_1 {
> +	clocks = <&versal_net_clk USB1_BUS_REF>;
> +};
> +
> +&wwdt0 {
> +	clocks = <&versal_net_clk FPD_WWDT0>;
> +	power-domains = <&versal_net_firmware PM_DEV_FPD_SWDT_0>;
> +};
> +
> +&wwdt1 {
> +	clocks = <&versal_net_clk FPD_WWDT1>;
> +	power-domains = <&versal_net_firmware PM_DEV_FPD_SWDT_1>;
> +};
> +
> +&wwdt2 {
> +	clocks = <&versal_net_clk FPD_WWDT2>;
> +	power-domains = <&versal_net_firmware PM_DEV_FPD_SWDT_2>;
> +};
> +
> +&wwdt3 {
> +	clocks = <&versal_net_clk FPD_WWDT3>;
> +	power-domains = <&versal_net_firmware PM_DEV_FPD_SWDT_3>;
> +};
> +
> +&lpd_wwdt0 {
> +	clocks = <&versal_net_clk LPD_WWDT0>;
> +	power-domains = <&versal_net_firmware PM_DEV_LPD_SWDT_0>;
> +};
> +
> +&lpd_wwdt1 {
> +	clocks = <&versal_net_clk LPD_WWDT1>;
> +	power-domains = <&versal_net_firmware PM_DEV_LPD_SWDT_1>;
> +};
> diff --git a/arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts b/arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts
> index 06b2301f48a0..322ef8f6340d 100644
> --- a/arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts
> @@ -11,8 +11,9 @@
>  /dts-v1/;
>  
>  #include "versal-net.dtsi"
> -#include "versal-net-clk.dtsi"

Now this is unused and should be removed.

> +#include "versal-net-clk-ccf.dtsi"

Or perhaps reuse the filename because what does Common Clock Framework 
have to do with DTS file names?

>  #include <dt-bindings/gpio/gpio.h>
> +#include "xlnx-versal-net-power.h"

