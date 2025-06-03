Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AB4C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVhScCl/ySrhmCIKK5C9I68RfupOpu9IvG2U/nACFOQ=; b=k6xLaLA5i2h5GL2a6goBtVN8+Z
	MGCbM1AnjGRZALI/zd8KDLs/ZIWvxJwmOo4a5Wh3247xVfwb8ukDc4FfuHcboVD500wJQ27ExV5pG
	UoZAEE9hjlcmduQXUFH/P3RZxaCXTYv0aNj6Z+BpdfUMiq5elTZSqwMB4l0afB2hk05bGBHtPtCHS
	QWh8b/ZW+16th32EWheOlP1KPaL7UcV9fgjp9ipVCbPzfMpBcnZGvfBEy/WZAeJJIEWIjhv2mNpex
	8Tzodgo8Ral1g9IGMA058h67QfxecIF0L1E820INJGik6U+o6PWaCc7KZ0n31mp4jQczZqTZU9Haf
	7Pb0drUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNw1-0000000AWGp-3MsG;
	Tue, 03 Jun 2025 09:27:53 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNrE-0000000AUow-3zsg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:22:58 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5539MjG13464820;
	Tue, 3 Jun 2025 04:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748942565;
	bh=BVhScCl/ySrhmCIKK5C9I68RfupOpu9IvG2U/nACFOQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eHXwwhZOh7Yg13i27tP/qmAg3sFMCxCOzdsVz89qaz3xHjKqztK8gabfni2CtTV2N
	 xI9GXOkM4J7vr2oCxDJlgX9OR8hQkGHwOWXHphwKEiM47yhdcpTHYT4gDhwplLrK+Q
	 j0NfmAH8qGH1aQzf+w4yoWXDCdu1Ec9l8yaaucX0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5539MjKo3430686
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 04:22:45 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 04:22:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 04:22:45 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5539Mfwx130991;
	Tue, 3 Jun 2025 04:22:42 -0500
Message-ID: <1af4a2a5-2d06-4955-8840-ba0d7226d3a6@ti.com>
Date: Tue, 3 Jun 2025 14:52:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] arm64: dts: ti: k3-j784s4-mcu-wakeup: Configure
 wkup_uart0 with clock settings
To: Udit Kumar <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250603042448.783956-1-u-kumar1@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250603042448.783956-1-u-kumar1@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_022257_084852_906457AF 
X-CRM114-Status: GOOD (  14.60  )
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

Hi Udit,

On 03/06/25 09:54, Udit Kumar wrote:
> From: Bhavya Kapoor <b-kapoor@ti.com>
>
> This commit adds the assigned-clocks and assigned-clock-parents
> properties for wkup_uart0 in J784S4. Specifically, the assigned-clocks
> property is set to reference the clock identified by
> "wkup_usart_mcupll_bypass_out0",


Documentation says "WKUP_UART0_FCLK_CLK" for device id 397 and clock id 0...?
https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j784s4/clocks.html

>  ensuring the UART operates with the
> correct clock source.
>
> The assigned-clock-parents property specifies "wkup_usart_clksel_out0"
> as the parent clock. This configuration is critical for establishing
> the proper clocking hierarchy, enabling the UART device to function
> reliably across different baud rates.
>
> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>


Do you need to add your Sign off?

Thanks,
Beleswar

> ---
> Link to v1: https://lore.kernel.org/all/20241009072056.3511346-1-b-kapoor@ti.com/
>
>  arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> index 52e2965a3bf5..1146bc5990ea 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> @@ -310,6 +310,8 @@ wkup_uart0: serial@42300000 {
>  		interrupts = <GIC_SPI 897 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&k3_clks 397 0>;
>  		clock-names = "fclk";
> +		assigned-clocks = <&k3_clks 397 0>;
> +		assigned-clock-parents = <&k3_clks 397 1>;
>  		power-domains = <&k3_pds 397 TI_SCI_PD_EXCLUSIVE>;
>  		status = "disabled";
>  	};

