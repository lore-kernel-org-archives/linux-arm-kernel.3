Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03564C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3h/ZSOBQq4p7/VYCUqu8pLi2T/O9RoNHeBynGSWXSo=; b=dpcLJS2pyYQ54tU17smfcGFqGi
	Hl4B/KqoWhtcNJK1XAvbWkn4BGWC1HPRkslXG35M1j1Kwl0yb8wR7COtfaeuP/3shbRA4tqL3nk/V
	pEpDy1IM7M+QzEa5ETT7f+sgbxnvFmk3/UemhSe133nXTS6SbhH97in9j10njEV3RH0T7+BF/tE0R
	KbeWuBa3A0amzcDO9jVCvJbYe8mQlkXwhqSiuzJqDZkI4xg27O5mBWojSe4VcB9muaJTGksqDPA9H
	kAp+SGU48I2dCH3Z3jxpvO1RTRbv8guniR3piThHGQsZffKHiKEdQURiuV9/oVR+6waDpZ+YMTHfc
	ECf299Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thd2d-00000001omk-1IfD;
	Mon, 10 Feb 2025 23:18:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcjf-00000001lVH-2CJF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 22:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D3h/ZSOBQq4p7/VYCUqu8pLi2T/O9RoNHeBynGSWXSo=; b=IL3utW2/pscjs/qqqmbI5mDxKy
	naKYxlYpz+S5GxpOwabVk2RFsClGsTrZNkRXp7pBzsNeP3prqfyMyXKF3wF+IoX90w9et3mN5Q9bE
	ZdCVA0f2YMs+DiPKbL8rGwMFNJhOyH1xHuePuJjv3SuLuLmr6EOBqFjAgbsSj8+Kf1YQQWvhsSccK
	TLMfFjlYJ9L7zbWHH9mhqEHt2CcnrPnfQ6NsTsAtYCIhfxz9j3iLk7x8BwbaROuzxmk8HKESf4NEW
	OqDNehX3s2c9yKEvYe/gbCINTXMxUBJUK5p/MD9N+Ep62zJ2Wkw1uGNpKZ74DFBK4D/5Cb4J8glAW
	MZN8eObg==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcjc-00000000LZu-0KcU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 22:58:38 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMwSG53582840
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 16:58:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739228308;
	bh=D3h/ZSOBQq4p7/VYCUqu8pLi2T/O9RoNHeBynGSWXSo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vm/z2t/28tMfK8icNbCZ8S0BYoH64C/ZIo9cEONNXJkHaVtbrXPOLb2aJ3UIGM3S9
	 aKylijCt+GCCkCFoKhBMhtxqdytLwx2K5Y5Ix7kzVRxtFWH4hI11h0bYB41aHMGpXf
	 wDNT8zvAqNYlkSadnOv74tOINGE3idf13Au7EpQ0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMwSO8008376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 16:58:28 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 16:58:28 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 16:58:28 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AMwR4K052593;
	Mon, 10 Feb 2025 16:58:27 -0600
Message-ID: <2491d950-4a1c-497c-a3a8-d322e1021031@ti.com>
Date: Mon, 10 Feb 2025 16:58:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] arm64: dts: ti: k3-am62a-mcu: Add R5F remote
 proc node
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>
References: <20250210221530.1234009-1-jm@ti.com>
 <20250210221530.1234009-3-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250210221530.1234009-3-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_225836_520049_0953463A 
X-CRM114-Status: GOOD (  13.21  )
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

On 2/10/25 4:15 PM, Judith Mendez wrote:
> From: Hari Nagalla <hnagalla@ti.com>
> 
> AM62A SoCs have a single R5F core in the MCU voltage domain.
> Add the R5FSS node with the child node for core0 in MCU voltage
> domain .dtsi file.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

> Changes since v4:
> - Drop SRAM node for am62ax MCU R5fSS0 core0
> ---
>   arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 25 ++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> index 0469c766b769e..1178cc6a9be8c 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> @@ -175,4 +175,29 @@ mcu_mcan1: can@4e18000 {
>   		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
>   		status = "disabled";
>   	};
> +
> +	mcu_r5fss0: r5fss@79000000 {
> +		compatible = "ti,am62-r5fss";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x79000000 0x00 0x79000000 0x8000>,
> +			 <0x79020000 0x00 0x79020000 0x8000>;
> +		power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
> +		status = "disabled";
> +
> +		mcu_r5fss0_core0: r5f@79000000 {
> +			compatible = "ti,am62-r5f";
> +			reg = <0x79000000 0x00008000>,
> +			      <0x79020000 0x00008000>;
> +			reg-names = "atcm", "btcm";
> +			ti,sci = <&dmsc>;
> +			ti,sci-dev-id = <9>;
> +			ti,sci-proc-ids = <0x03 0xff>;
> +			resets = <&k3_reset 9 1>;
> +			firmware-name = "am62a-mcu-r5f0_0-fw";
> +			ti,atcm-enable = <0>;
> +			ti,btcm-enable = <1>;
> +			ti,loczrama = <0>;
> +		};
> +	};
>   };

