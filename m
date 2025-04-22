Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAAAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rpxuqVYs16DDgSDLQ6yHr2HIDalRpwpz+2n7O3fnI8=; b=MDbiwhQPN181xLrMQ5O1QEKb+p
	5rAkhdVoo19qz44X7QtuMp/EiGqNINRya2gGraYExDEZeI+pO4SCd5ICnyR7TCRzxETvKo4oZYQ9S
	vnNNw8Gi+jGA+8LD2BVSQ3oqBjODaMYyK4+pHcHbe8OIe/KPDN7QBSdef+ZIOF9Zkh4AiuJH8Dijw
	BAldGlCI7RWslUWyUhSwKi7Y1rMprkrAWyowe7WGb5N1CRCfe/YRJ9DeRQBiV+0SP2SCDlU79l1cM
	NBv0agD6K9piKHM6rsSAQwSAEXHJ6AIcqSsS4ZXXskPhCyOnVCf43oY556GcobOYf4aenzyTMiNu2
	h+kPUd7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FYw-00000007is3-3ns7;
	Tue, 22 Apr 2025 15:29:30 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ENj-00000007Ro8-3K1h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:13:53 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEDl0q1235359
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 09:13:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745331227;
	bh=3rpxuqVYs16DDgSDLQ6yHr2HIDalRpwpz+2n7O3fnI8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VDYv4upMO674o/eoamlkWPy8my8boATpeMY4/7ZlplMgLNS5uiGzunowDwWU7wjh5
	 Lckuso00gm8haJdpZNB2wMed2ICjnFimbPuJJeQO5KIJY3lZyrwnLKvs3HKdcJfWZo
	 eNJDkd+GpHwzleBbkdAZ6+RvOZQtWbr/vkNHtLD4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEDldC086402
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 09:13:47 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 09:13:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 09:13:46 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MEDgoD114512;
	Tue, 22 Apr 2025 09:13:43 -0500
Message-ID: <87b9ab38-48e8-4e51-8485-16e944ee0d57@ti.com>
Date: Tue, 22 Apr 2025 19:43:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: k3-j784s4-j742s2-evm-common:
 enable ACSPCIE0 output for PCIe1
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <parth105105@gmail.com>,
        <parth.pancholi@toradex.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250422123218.3788223-1-s-vadapalli@ti.com>
 <20250422123218.3788223-3-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250422123218.3788223-3-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_071351_923910_1A195247 
X-CRM114-Status: GOOD (  18.67  )
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

Thanks for fixing at board level

On 4/22/2025 6:02 PM, Siddharth Vadapalli wrote:
> The PCIe reference clock required by the PCIe Endpoints connected to the
> PCIe connector corresponding to the PCIe1 instance of PCIe on J784S4-EVM
> and J742S2-EVM is driven by the ACSPCIE0 module. Add the device-tree
> support for enabling the same.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> The previous versions of this series were a single patch. Based on the
> feedback received on previous versions, the SoC and Board support has
> been split in order to allow reuse for other Boards based on the same
> SoC.
>
> v2 patch:
> https://lore.kernel.org/r/20250411121307.793646-1-s-vadapalli@ti.com/
> Changes since v2 patch:
> - The SoC and board changes have been split across:
>    k3-j784s4-j742s2-main-common.dtsi and k3-j784s4-j742s2-evm-common.dtsi
>    respectively.
>
> Regards,
> Siddharth.
>
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> index 2664f74a9c7a..fa656b7b13a1 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> @@ -5,6 +5,9 @@
>    * EVM Board Schematics(j784s4): https://www.ti.com/lit/zip/sprr458
>    * EVM Board Schematics(j742s2): https://www.ti.com/lit/zip/SPAC001
>    */
> +
> +#include <dt-bindings/phy/phy-cadence.h>
> +
>   / {
>   	chosen {
>   		stdout-path = "serial2:115200n8";
> @@ -1407,10 +1410,13 @@ &main_mcan4 {
>   
>   &pcie1_rc {
>   	status = "okay";
> +	clocks = <&k3_clks 333 0>, <&serdes0 CDNS_TORRENT_REFCLK_DRIVER>;
> +	clock-names = "fck", "pcie_refclk";
>   	num-lanes = <2>;
>   	reset-gpios = <&exp1 2 GPIO_ACTIVE_HIGH>;
>   	phys = <&serdes0_pcie1_link>;
>   	phy-names = "pcie-phy";
> +	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x1>;

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   };
>   
>   &serdes1 {

