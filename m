Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51FCC0219C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LshTTg7rs/CWUs5QRsTb+R10VEhXLnv8hJc6hzk7bx0=; b=4+0njoQxKnFTH0uSoR88FcqX30
	5muEjHOsZRnKx3uUDWuab54IbuiSD+OZkswrs/SN+gYPjpXSVilU74Db6T0EQqnKbFAUksahbGzLL
	smZpgMtDWxJWP4iBgE82c/dAHhWfMrDNqvhQrpNWMM1aJ2eCy3afms+oPLhe3AWRTTPO0T+beWYiP
	IxWEa7JajhG+yJL5Q5ZfsO1eRMugDqRgijFnKaxNUVeVIx2HKmTp7QDjdLPXUKnMtdofHPr+A9eTP
	wlDGqzr6zMKNKblm4MycS9uL87R9tyHdqosUh2U2m/nnovgaJdL+IqC9jBS3sUEShewnqrF474rwM
	YKcXym9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQqt-0000000ADAn-412x;
	Fri, 07 Feb 2025 16:05:11 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQj1-0000000ABES-1ze4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 15:57:04 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 517Fuwv13030315
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Feb 2025 09:56:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738943819;
	bh=LshTTg7rs/CWUs5QRsTb+R10VEhXLnv8hJc6hzk7bx0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nzcorFtUyqjQcAVRJSOSktqBEI8g7TYqdULE2yefIxNbtSOfQ0tNpqMX4V/ERNpci
	 9IGvMEFW1Zaag7QxsLHmmLGYd5gHimRgpXGOR7If3QGlC/WplQTg3ZG+5XWIFmP2qK
	 +EhK1BypHV0WCZbeUG27NVrabkwDB9obe/SZCvfM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 517Fuwix000435
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Feb 2025 09:56:58 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Feb 2025 09:56:58 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Feb 2025 09:56:58 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 517FuvdQ030041;
	Fri, 7 Feb 2025 09:56:58 -0600
Message-ID: <9572caa4-fc17-4531-be68-8466753b70bc@ti.com>
Date: Fri, 7 Feb 2025 09:56:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>
References: <20250206235200.3128163-1-jm@ti.com>
 <20250206235200.3128163-6-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250206235200.3128163-6-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_075703_775729_DFDBCCD8 
X-CRM114-Status: GOOD (  18.83  )
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

On 2/6/25 5:51 PM, Judith Mendez wrote:
> From: Devarsh Thakkar <devarsht@ti.com>
> 
> For each remote proc, reserve memory for IPC and bind the mailbox
> assignments. Two memory regions are reserved for each remote processor.
> The first region of 1MB of memory is used for Vring shared buffers
> and the second region is used as external memory to the remote processor
> for the resource table and for tracebuffer allocations.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changes since v3:
> - No change
> ---
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 90 +++++++++++++++++++++++--
>   1 file changed, 84 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index a6f0d87a50d8a..eaffbab093cc1 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -49,6 +49,42 @@ linux,cma {
>   			linux,cma-default;
>   		};
>   
> +		c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x99800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		c7x_0_memory_region: c7x-memory@99900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x99900000 0x00 0xf00000>;
> +			no-map;
> +		};
> +
> +		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b900000 0x00 0xf00000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c900000 0x00 0x1e00000>;
> +			no-map;
> +		};
> +
>   		secure_tfa_ddr: tfa@9e780000 {
>   			reg = <0x00 0x9e780000 0x00 0x80000>;
>   			alignment = <0x1000>;
> @@ -60,12 +96,6 @@ secure_ddr: optee@9e800000 {
>   			alignment = <0x1000>;
>   			no-map;
>   		};
> -
> -		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0x01e00000>;
> -			no-map;
> -		};
>   	};
>   
>   	opp-table {
> @@ -737,3 +767,51 @@ dpi1_out: endpoint {
>   		};
>   	};
>   };
> +
> +&mailbox0_cluster0 {

Odd, these mailboxes should have been disabled by default as
they are incomplete without this extra board-level info below.

I'll have to fix that later. For now, could you add
status = "okay"; here. That way they are already here and
I don't have to modify this DT file later (which could
cause a conflict if I do it this cycle).

Andrew

> +	mbox_r5_0: mbox-r5-0 {
> +		ti,mbox-rx = <0 0 0>;
> +		ti,mbox-tx = <1 0 0>;
> +	};
> +};
> +
> +&mailbox0_cluster1 {
> +	mbox_c7x_0: mbox-c7x-0 {
> +		ti,mbox-rx = <0 0 0>;
> +		ti,mbox-tx = <1 0 0>;
> +	};
> +};
> +
> +&mailbox0_cluster2 {
> +	mbox_mcu_r5_0: mbox-mcu-r5-0 {
> +		ti,mbox-rx = <0 0 0>;
> +		ti,mbox-tx = <1 0 0>;
> +	};
> +};
> +
> +&wkup_r5fss0 {
> +	status = "okay";
> +};
> +
> +&wkup_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> +			<&wkup_r5fss0_core0_memory_region>;
> +};
> +
> +&mcu_r5fss0 {
> +	status = "okay";
> +};
> +
> +&mcu_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
> +	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
> +			<&mcu_r5fss0_core0_memory_region>;
> +};
> +
> +&c7x_0 {
> +	mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
> +	memory-region = <&c7x_0_dma_memory_region>,
> +			<&c7x_0_memory_region>;
> +	status = "okay";
> +};

