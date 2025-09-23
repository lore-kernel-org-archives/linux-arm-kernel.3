Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B56CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 18:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kQZdYtmLgeO7HVe3TJI/wyYZG/yCXy6uR7Y9L+JxWM=; b=D+rplQOVxb0pWWUGFvpovEaUsS
	zzR6wdKy+l1OXI4EoLtvjIz9uC+nEXuvKwj7oRkNdKsqyKJePeotCuKJ9T7DGyWBFCGAKurBjJWg4
	uPNQHaI+hqIp0iVtZ4eRD6FXCX9tqKz6uYLTJnMjbYwc0Sjky3cH4DlVSL0OH/xQMzp0R6frs1fgX
	ei9kbUMUnjf0qUeZB9nGnhhv+/Z8nprBLSr77M1+PdqieRmkqbzqozSCd/hiL78EQ9bCcP0Legoxd
	2kjhmrN0X0m+PVreRW7QXZidRHy0lrkEp4BOWk4cAgQ5wn/ojhCDJUfGrltFViro613MDKGzTA/1r
	yI7KwQoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v17M8-0000000EV2S-3k9M;
	Tue, 23 Sep 2025 18:03:12 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v17M6-0000000EV1K-09je
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 18:03:11 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NI36hW1528658;
	Tue, 23 Sep 2025 13:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758650586;
	bh=6kQZdYtmLgeO7HVe3TJI/wyYZG/yCXy6uR7Y9L+JxWM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rRv9AYN6qyYUSYa4Jy5uWY3rTjphWK+wwJR0hlU/1KOsVju+rXVHraxJdOnt3cdZZ
	 hn39h/KYu0VQYDVZuUSVu3JCZy+toJ3OE7lw6lihglTze+26FwgdVzEN4aetffrw+V
	 mSokbRjqc3A8iymUaDYSq1AWLiXYfpAV97mm4eZQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NI35sd2156284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 13:03:05 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 13:03:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 13:03:05 -0500
Received: from localhost (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NI35iK698776;
	Tue, 23 Sep 2025 13:03:05 -0500
Date: Tue, 23 Sep 2025 13:03:05 -0500
From: Kendall Willis <k-willis@ti.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vishal Mahaveer <vishalm@ti.com>,
        Kevin
 Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
        Sebin Francis
	<sebin.francis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>
Subject: Re: [PATCH v2 2/7] arm64: dts: ti: k3-am62: Define possible system
 states
Message-ID: <20250923180305.qmgjilxhujgkvfcp@uda0506412>
References: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
 <20250812-topic-am62-dt-partialio-v6-15-v2-2-25352364a0ac@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250812-topic-am62-dt-partialio-v6-15-v2-2-25352364a0ac@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_110310_165881_BF2843EB 
X-CRM114-Status: GOOD (  15.52  )
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

On 11:15-20250812, Markus Schneider-Pargmann wrote:
> Add the system states that are available on am62 SoCs.
>

nit: Change "am62 SoCs" to "TI AM62x SoCs"

Additionally, it would be nice to add what sleep states are supported in
the commit message.

These comments also go for the other two patches that are titled
"Define possible system states".

Best,
Kendall Willis

> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62.dtsi b/arch/arm64/boot/dts/ti/k3-am62.dtsi
> index 59f6dff552ed40e4ac0f9c7077aa25d68d3b5283..b08b7062060ca12ecae83917a831ee779f1a288f 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62.dtsi
> @@ -46,6 +46,28 @@ pmu: pmu {
>  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  
> +	system-idle-states {
> +		system_partial_io: system-partial-io {
> +			compatible = "system-idle-state";
> +			idle-state-name = "off-wake";
> +		};
> +
> +		system_deep_sleep: system-deep-sleep {
> +			compatible = "system-idle-state";
> +			idle-state-name = "mem";
> +		};
> +
> +		system_mcu_only: system-mcu-only {
> +			compatible = "system-idle-state";
> +			idle-state-name = "mem-mcu-active";
> +		};
> +
> +		system_standby: system-standby {
> +			compatible = "system-idle-state";
> +			idle-state-name = "standby";
> +		};
> +	};
> +
>  	cbass_main: bus@f0000 {
>  		bootph-all;
>  		compatible = "simple-bus";
> 
> -- 
> 2.50.1
> 

