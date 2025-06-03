Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77692C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ar3GGAb+/pAvjf2tv2l9yKeAgpPBlAH6wYuKkop+dTc=; b=qmWcGgwRbj9dheHbaCLTLBbtPK
	NDwQ5+mrar1jhyX7S8cI9VYd0hRmBVgvAm0d1GDeL7XZ9SABl/yPJoLzr0NXlaTydwTkGcuwQ1cz8
	gyQ5m7yoYNb1WMrauNNg1cEvFj/BcLgFlBy7gTqSoRgVECyXVxjSYCcyWQvqWm60FY8jqojpwovPl
	EWpJDQXdtt2a7bArbpLu3+9/mjRKfvNCPR8kY/V1717shELOWJzy+FwMaEdevMy3Sb/NEWSPlwUQ7
	OfMJjtkLnBoboiz2gUUuiK0meVhWCdLuS6QaXid5ezswt+dWHlsW+jGxaG1bNRYdZmD9ga48SPw07
	KHtpHYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMO2W-0000000AXkj-0BNx;
	Tue, 03 Jun 2025 09:34:36 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNuk-0000000AVyf-0aNE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:26:35 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5539QUqM479564;
	Tue, 3 Jun 2025 04:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748942790;
	bh=Ar3GGAb+/pAvjf2tv2l9yKeAgpPBlAH6wYuKkop+dTc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=c6fYdD2Cmg3lp7IfgHeapSSfZ/o9v7TnEqybHqLSreuxzk7dhZJJxNpLsM/jGx+7I
	 6uJJPNybqPuCTx9euftMDYW5ezkSN53LpgNoEoQr8J0T2NeTAKvKyhj6XPqtq2pJGw
	 kdMwUs1EAMtDDXhgkdTCwwjcbOU0amOqE7zVsQTg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5539QUmK1226445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 04:26:30 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 04:26:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 04:26:30 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5539QQrT222532;
	Tue, 3 Jun 2025 04:26:27 -0500
Message-ID: <b6b752c8-020b-47be-a77a-84161f8e7267@ti.com>
Date: Tue, 3 Jun 2025 14:56:26 +0530
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
X-CRM114-CacheID: sfid-20250603_022634_274628_B67032BB 
X-CRM114-Status: GOOD (  14.57  )
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


On 03/06/25 09:54, Udit Kumar wrote:
> From: Bhavya Kapoor <b-kapoor@ti.com>
>
> This commit adds the assigned-clocks and assigned-clock-parents
> properties for wkup_uart0 in J784S4. Specifically, the assigned-clocks
> property is set to reference the clock identified by
> "wkup_usart_mcupll_bypass_out0", ensuring the UART operates with the
> correct clock source.
>
> The assigned-clock-parents property specifies "wkup_usart_clksel_out0"
> as the parent clock. This configuration is critical for establishing
> the proper clocking hierarchy, enabling the UART device to function
> reliably across different baud rates.
>
> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
> ---
> Link to v1: https://lore.kernel.org/all/20241009072056.3511346-1-b-kapoor@ti.com/
>
>  arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi


Also $Subject line needs to be correct for k3-j784s4-j742s2-mcu-wakeup-common.dtsi file.

Thanks,
Beleswar

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

