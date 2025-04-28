Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22B0C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PH8LqPmdzTiyEIRldLyF2ISfaZauzPwN6cosQsO86rM=; b=jnTJmWdhwHT2LBGm/U1wOvc4y2
	KdsT40axFpLQzAU5skZi0Dbrmbb77XbvlTG/G9HDk7EUiRvH2RVxK4npdwFGfTihBejuSZS1ZnAA7
	/x/KJ2BwJZu3rLIJ5dkvQkGZshUHRNaT0KfXTBeG7lA0GOSgPy3NC1PDirfUxYbXAECdp82Jo9Bgl
	P9PL9I5QUFr9PchRzj1gtVFWU/qSaGy/5C266MR54L94yKxZmRFg+W12FUjPdmwsC6V0CUndL3OJo
	0twWSFyXhWrVAWvloxaHyarBnU+RXWeVpMYZGz+VF1iQGCcvOsqLYRZZe9fN5/ebjqHn2TXGmLI8i
	WY3Bqt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RQT-00000006wkD-2DYN;
	Mon, 28 Apr 2025 16:33:49 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9RLK-00000006vsk-1F8u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 16:28:31 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGSQ6C2821463
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 11:28:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745857706;
	bh=PH8LqPmdzTiyEIRldLyF2ISfaZauzPwN6cosQsO86rM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qDV8X6IzH1PUAHkhmVrfhtoObnZWlDkppcKErvmxXxjYVqtbOvT6h2QNCnZ03WwtC
	 W/WDPUTdPSv6VykJ5uNdHmglIhSGoT81YbKXxoy9Epup9XYdRJd7OGvw26d+kHDfvD
	 m54ZRX/DzE6DihLbFJjq49di4VwjCDdZB78LcxCs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SGSQB4025096
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 11:28:26 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 11:28:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 11:28:26 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SGSPa9001778;
	Mon, 28 Apr 2025 11:28:25 -0500
Message-ID: <31b0b9ed-859b-44f7-89b0-26cc6384356d@ti.com>
Date: Mon, 28 Apr 2025 11:28:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/11] arm64: dts: ti: k3-am62a7-sk: Reserve
 main_timer2 for C7x DSP
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
 <20250415153147.1844076-10-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250415153147.1844076-10-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_092830_432108_3027C568 
X-CRM114-Status: GOOD (  15.76  )
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
> C7x DSP uses main_timer2, so mark it as reserved in linux DT.
> 

The set of peripherals used by this C7x core depends on the firmware
running on the core. Long term we should think on a better way of
communicating this from firmware to Linux. Same goes for the next
two patches.

For now since these timers are always used by all firmware, this
will be safe to do, but for other peripherals we will need that
better solution.

Reviewed-by: Andrew Davis <afd@ti.com>

> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index 7d817b447c1d0..8d7645bb90337 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -682,6 +682,11 @@ &main_uart1 {
>   	status = "reserved";
>   };
>   
> +/* main_timer2 is used by C7x DSP */
> +&main_timer2 {
> +	status = "reserved";
> +};
> +
>   &usbss0 {
>   	status = "okay";
>   	ti,vbus-divider;

