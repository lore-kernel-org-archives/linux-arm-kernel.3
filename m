Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42178C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 12:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIqra39FwyGHX2IBVRB5giqoWceascBFIqyv6tet87s=; b=4NLci3sRdZb8y+XScoGqeyR0OI
	T8ObOJwr5EuZLmLevxHU6Yx0xAJz3tW6h6clT+KBJ0HGIYXaBqzH0BPHboXFObwMemC57nsBOhBTI
	jGWc4it0/ihnv688sKYBjCOvrWjwBqaD7Y4B0jEr08I/uXvFyOuY79XkZhnllZFfqrptRX31LolCJ
	dc0aS1cSrudlVRvW3frG0byE7X8RDg6AFES1H0wfXq8Y6nj2LVwPumlOBTuDKjC33aGOv5SUokCmr
	NspVuqlj3zzm2qRpD7sNj9vgQXHkJleZ3ZSWQdr0inFl0HaZNDibzSOdT6DgHlEo8OazMu+/nRcu+
	UuqVAbng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ls5-00000000LJO-3pTY;
	Mon, 07 Apr 2025 12:46:37 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1li1-00000000HWc-2Yju
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 12:36:15 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537CZwPw915930
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 07:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744029358;
	bh=ZIqra39FwyGHX2IBVRB5giqoWceascBFIqyv6tet87s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wPhcHSfkvXDW05Uv+Wg56S8G1rDINJtfYXmbcnaxa1Oi8f+UyxXNbiJmRvSpAzxAO
	 7gp7cepdfvoGd1X3Zx71ysgd4sCOv+R40T0ciAhqs99x4CffV6iwmpDMiB5C40khlQ
	 57Hz4oBrRIWyPOviRdoBA+MiGgf0dyYV0PCVaBX0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537CZwqV113614
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 07:35:58 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 07:35:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 07:35:57 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537CZvmS006892;
	Mon, 7 Apr 2025 07:35:57 -0500
Message-ID: <956c0598-9934-4295-87af-ef86f4eabd94@ti.com>
Date: Mon, 7 Apr 2025 07:35:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] arm64: dts: ti: k3-am64: Reserve timers used by
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
 Padhi <b-padhi@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>
References: <20250405001518.1315273-1-jm@ti.com>
 <20250405001518.1315273-12-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250405001518.1315273-12-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_053613_769415_D5B883CE 
X-CRM114-Status: GOOD (  14.86  )
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

On 4/4/25 7:15 PM, Judith Mendez wrote:
> From: Hari Nagalla <hnagalla@ti.com>
> 
> AM64x device has 4 R5F cores in the main domain. TI MCU firmware uses
> main domain timers as tick timers in these firmwares. Hence keep them
> as reserved in the Linux device tree.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am642-evm.dts | 17 +++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 17 +++++++++++++++++
>   2 files changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> index f8ec40523254b..68bd6b806f8f0 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
> @@ -796,6 +796,23 @@ &mcu_m4fss {
>   	status = "okay";
>   };
>   
> +/* main_timers 8-11 are used by TI MCU FW */

Can you make this comment per-core and explain which core
each timer is reserved for? Makes it easier on me in Zephyr
to point out why we use the timers that we do, something
like:

/* main_timer8 is reserved for mcu_r5fss0_core0 */

Andrew

> +&main_timer8 {
> +	status = "reserved";
> +};
> +
> +&main_timer9 {
> +	status = "reserved";
> +};
> +
> +&main_timer10 {
> +	status = "reserved";
> +};
> +
> +&main_timer11 {
> +	status = "reserved";
> +};
> +
>   &serdes_ln_ctrl {
>   	idle-states = <AM64_SERDES0_LANE0_PCIE0>;
>   };
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> index 33e421ec18abb..07fbdf2400d23 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
> @@ -710,6 +710,23 @@ &mcu_m4fss {
>   	status = "okay";
>   };
>   
> +/* main_timers 8-11 are used by TI MCU FW */
> +&main_timer8 {
> +	status = "reserved";
> +};
> +
> +&main_timer9 {
> +	status = "reserved";
> +};
> +
> +&main_timer10 {
> +	status = "reserved";
> +};
> +
> +&main_timer11 {
> +	status = "reserved";
> +};
> +
>   &ecap0 {
>   	status = "okay";
>   	/* PWM is available on Pin 1 of header J3 */

