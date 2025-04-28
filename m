Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A354C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NR/28dcL7nI8hDkC2wwHs3MBlvJxD46kc5grX9UascQ=; b=WstumTzUnqw+KJHxKGQSlbALUG
	NgI+/N4tBJqW+Z1dDM56I97zBAkFv8QlYA5lx6bWsJl8Cp6P9MCRdVRedvjKMVyiFu7Xa25MbTm9+
	NIb0kVANQe9bSRb6NvcAZu9cuQM2w+Uxzx/oJMhuuQ+h11LPKWkQnLfL74X+63xTFSkJ47PuYOXX1
	zhyCqpXfInic1BYBp0ti39xFZeRSGDuYulJIPqk6QIznorHtL6yX0IhgUo22tgxhIEVWmUIux7g1D
	eZxt7zaL8FnUjY6iDYbjM+Eal7vDU0NtLDMAeh46NgXyjNGHMmbB0Jn7lO/w3zdIxhs/idjgl6X5h
	OfIznzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RUL-00000006xM0-3l73;
	Mon, 28 Apr 2025 16:37:49 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RMY-00000006w5m-1xkt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 16:29:47 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGTh9h2821787
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 11:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745857783;
	bh=NR/28dcL7nI8hDkC2wwHs3MBlvJxD46kc5grX9UascQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TTrhAMw7/g1RHLGOcrk7iKNETSZPA/PPgo9nReedoXOC61UWUZSWF1ZDXREsK7lp3
	 jr5exOZ0pW7pUpczKqqzJ4RPs4jyQj7kKKyeRm5g46aQK15B90s7OpI5FMZ5/Ty8G2
	 rWB4eg5Jb1iwczdHh51Nhth33DFIpB6RPpAobLzk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGTgJ8111210
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 11:29:43 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 11:29:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 11:29:42 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SGTgit003059;
	Mon, 28 Apr 2025 11:29:42 -0500
Message-ID: <795d9fb3-a9d7-41b2-84e5-a3a6f25754a1@ti.com>
Date: Mon, 28 Apr 2025 11:29:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/11] arm64: dts: ti: k3-am64: Reserve timers used by
 MCU FW
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Prasad <b-padhi@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Devarsh Thakkar <devarsht@ti.com>
References: <20250415153147.1844076-1-jm@ti.com>
 <20250415153147.1844076-12-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250415153147.1844076-12-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_092946_608517_BBD9FADD 
X-CRM114-Status: GOOD (  14.16  )
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

On 4/15/25 10:31 AM, Judith Mendez wrote:
> From: Hari Nagalla <hnagalla@ti.com>
> 
> AM64x device has 4 R5F cores in the main domain. TI MCU firmware uses
> main domain timers as tick timers in these firmwares. Hence keep them
> as reserved in the Linux device tree.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---

Reviewed-by: Andrew Davis <afd@ti.com>

>   arch/arm64/boot/dts/ti/k3-am642-evm.dts | 20 ++++++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 20 ++++++++++++++++++++
>   2 files changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> index f8ec40523254b..5623ab354a1d5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> @@ -796,6 +796,26 @@ &mcu_m4fss {
>   	status = "okay";
>   };
>   
> +/* main_timer8 is used by r5f0-0 */
> +&main_timer8 {
> +	status = "reserved";
> +};
> +
> +/* main_timer9 is used by r5f0-1 */
> +&main_timer9 {
> +	status = "reserved";
> +};
> +
> +/* main_timer10 is used by r5f1-0 */
> +&main_timer10 {
> +	status = "reserved";
> +};
> +
> +/* main_timer11 is used by r5f1-1 */
> +&main_timer11 {
> +	status = "reserved";
> +};
> +
>   &serdes_ln_ctrl {
>   	idle-states = <AM64_SERDES0_LANE0_PCIE0>;
>   };
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> index 33e421ec18abb..1deaa0be0085c 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> @@ -710,6 +710,26 @@ &mcu_m4fss {
>   	status = "okay";
>   };
>   
> +/* main_timer8 is used by r5f0-0 */
> +&main_timer8 {
> +	status = "reserved";
> +};
> +
> +/* main_timer9 is used by r5f0-1 */
> +&main_timer9 {
> +	status = "reserved";
> +};
> +
> +/* main_timer10 is used by r5f1-0 */
> +&main_timer10 {
> +	status = "reserved";
> +};
> +
> +/* main_timer11 is used by r5f1-1 */
> +&main_timer11 {
> +	status = "reserved";
> +};
> +
>   &ecap0 {
>   	status = "okay";
>   	/* PWM is available on Pin 1 of header J3 */

