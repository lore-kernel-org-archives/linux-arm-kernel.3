Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94659C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soVyBj6MPIY1VOaKT/v86ILGRdMXLp+19Ble5d58VLs=; b=Y5kcRxq3Kr17fHpby115T/1ubG
	Z6EjoTj6Pk00knbNVVif2rFWWIx3JWyaFLJzESYZBCYKyhES46Wx9/3VsF38Hvk4QQ7DH9RlT826i
	tNrgksZLbUBy0uLRZlzVTvhekAQxi3L9YwaVN5x2/3iGIiGc+80J++LIO9WaQhEzbGqejo+9OcCJx
	v0PRlFxjpDOyyTrWuUe7Tzld/2Poy0JJiU+P8h9ALfzg7Tk1/wwTv8HuiwUVIe9r3DMEUAkZSQ9B1
	pwFVinB0RiuTmzYHX0erjWlKWYyUC0llo8kxSOluWGyXtvn5w6q6JMUQTgoT9H3kcrLnVzH7gf/jP
	iAAmz8hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtb1-00000000BqN-02jn;
	Mon, 21 Jul 2025 16:42:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrB1-0000000HSoW-0D4R
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Jul 2025 14:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=soVyBj6MPIY1VOaKT/v86ILGRdMXLp+19Ble5d58VLs=; b=ahXTFVH38iCg1KqGl0CGeBwOjp
	h5WEJrS0myf50lkhVsObP05H+4Isk/FC6CD2PADqINcZVSDGHif1RTV9dveT6R1PFH30bfLkTziu5
	ekqdp4f4F0BbpFNK46fA/MAtk/Qq5gaVnZZQseQoh9uNMxU9DEf7HiU6tVCTAW4oRJ7SEmKxlNzOf
	xe1yqNhFJLNcslP/1pJergZ42PeRcJMfYl6fughqxoJ5GfboWD5ShT0qgjXVQi0J2KM889nkms4PW
	YAoL5rGcmwZqUDZnse0sX188tP7/nLQhAKOkHwimxSzy5QiDK5eDACUVisSup/Q7MN8VqNZlr994G
	W4T9gRwA==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrAw-0000000B3k2-1hLy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:07:33 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LE7E4X1272907;
	Mon, 21 Jul 2025 09:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753106834;
	bh=soVyBj6MPIY1VOaKT/v86ILGRdMXLp+19Ble5d58VLs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=obiR0xeWBf2p9hVCANQNLf3a+0T/HXSfHfsXNYzwycV/IKWc4nJhiZ/QmgZSUCLh5
	 qRF4HVPAnb1UKRg8fwWiKPFgYvM830GfBur75wkXBwq+3FgFB1fcYC8JN8dkHCEM+d
	 fx19WT+oMxLKuchJUwLdmJIfU3AMRIG1FKeGJ/dY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LE7E6w921270
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 09:07:14 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 09:07:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 09:07:14 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LE7AAR3643505;
	Mon, 21 Jul 2025 09:07:10 -0500
Message-ID: <72545187-4605-40bb-9c68-54670c2e5332@ti.com>
Date: Mon, 21 Jul 2025 19:37:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: ti: k3-j721s2-main: Add interrupts
 property
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
References: <20250714092708.3944641-1-y-abhilashchandra@ti.com>
 <20250714092708.3944641-2-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250714092708.3944641-2-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_150731_027351_43142FFC 
X-CRM114-Status: GOOD (  11.64  )
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


On 7/14/2025 2:57 PM, Yemike Abhilash Chandra wrote:
> Add interrupts property for CDNS CSI2RX. Interrupt IDs are taken from the
> J721S2 TRM [0].
>
> Interrupt Line      | Source Interrupt
> --------------------|----------------------------
> GIC500SS_SPI_IN_153 | CSI_RX_IF1_CSI_ERR_IRQ_0
> GIC500SS_SPI_IN_152 | CSI_RX_IF1_CSI_IRQ_0
> GIC500SS_SPI_IN_157 | CSI_RX_IF2_CSI_ERR_IRQ_0
> GIC500SS_SPI_IN_156 | CSI_RX_IF2_CSI_IRQ_0
>
> [0]: https://www.ti.com/lit/zip/spruj28
>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> index 62f45377a2c9..6f32a2b0c40c 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> @@ -1248,6 +1248,9 @@ ti_csi2rx0: ticsi2rx@4500000 {
>   		cdns_csi2rx0: csi-bridge@4504000 {
>   			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
>   			reg = <0x00 0x04504000 0x00 0x1000>;
> +			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;

Just cosmetic thing, if you are doing v2 then consider 152 first , 
followed by 153.

Otherwise

Reviewed-by: Udit Kumar <u-kumar1@ti.com>

> +			interrupt-names = "error_irq", "irq";
>   			clocks = <&k3_clks 38 3>, <&k3_clks 38 1>, <&k3_clks 38 3>,
>   				<&k3_clks 38 3>, <&k3_clks 38 4>, <&k3_clks 38 4>;
>   			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
> @@ -1301,6 +1304,9 @@ ti_csi2rx1: ticsi2rx@4510000 {
>   		cdns_csi2rx1: csi-bridge@4514000 {
>   			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
>   			reg = <0x00 0x04514000 0x00 0x1000>;
> +			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "error_irq", "irq";
>   			clocks = <&k3_clks 39 3>, <&k3_clks 39 1>, <&k3_clks 39 3>,
>   				<&k3_clks 39 3>, <&k3_clks 39 4>, <&k3_clks 39 4>;
>   			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",

