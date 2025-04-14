Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75190C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2v2YqDM9wvESESnYHXaNZpR11dPLsmv6R7Z15lYtSc=; b=j/HMwprxZyK+CAvJCPc4qThQZu
	zfG9NNhUBCCJ7t9eqxnklG2jDnhsGkJMxeF9QJ7GWMcFxszg4PYLQ2OCpopkK7rV9K4Wp0nXkpGII
	2dsI/qaiGIdkv6CBylw9qWHqN12HMfgnXIN571TzPuyRRZwbtVVdD5ToTqohUqOXHk7nzBVCjM6UH
	1LgC9K9i2XntGfOPiotzjoHpradRI/5OBX+Wwe6Oxpzz5+pba4K8jUYUyqtsOQtZ9EQXNHC/eDo8k
	T3rvle8gLNaJvX1TrtRZNNasnaRfgGaysmQFOi67+RftR2PMrWL+PdK0XK4g2HOL0YAjtuQzDhECr
	uF60PBjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ILU-00000001q9Q-1PON;
	Mon, 14 Apr 2025 11:51:24 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IBa-00000001nzQ-2dYv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 11:41:12 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53EBekXw2046321
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 06:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744630846;
	bh=z2v2YqDM9wvESESnYHXaNZpR11dPLsmv6R7Z15lYtSc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xfUZB7npYQOpoB54c4TURLLSpjiSlMy8CTSi5P27KH4fLe3UbByHjGqDXcxWveT6W
	 cUClb1Xcl+4td+jDQzvDUzL4rEz70rsnu5gtBYjIp6FjXN5maISUSsHe0UXO5fZusg
	 gvrTGJjo3JO+CEq5C7QbtGbQQpF9FZAvUepIjfRk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53EBekMm102049
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Apr 2025 06:40:46 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 06:40:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 06:40:45 -0500
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53EBefOi038625;
	Mon, 14 Apr 2025 06:40:42 -0500
Message-ID: <28fa61b8-15a6-40c6-96b8-268939226a03@ti.com>
Date: Mon, 14 Apr 2025 17:10:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: ti: k3-j721e-sk: Add requiried voltage
 supplies for IMX219
To: "Francis, Neha" <n-francis@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <stable@vger.kernel.org>
References: <20250409134128.2098195-1-y-abhilashchandra@ti.com>
 <20250409134128.2098195-5-y-abhilashchandra@ti.com>
 <16713a1b-1e74-4b08-bd4c-12dc0a9d32df@ti.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <16713a1b-1e74-4b08-bd4c-12dc0a9d32df@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_044110_807013_39AD52E9 
X-CRM114-Status: GOOD (  17.49  )
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

Hi Neha,

On 11/04/25 19:08, Francis, Neha wrote:
> On 4/9/2025 7:11 PM, Yemike Abhilash Chandra wrote:
>> The device tree overlay for the IMX219 sensor requires three voltage
>> supplies to be defined: VANA (analog), VDIG (digital core), and VDDL
>> (digital I/O). Add the corresponding voltage supply definitions to avoid
>> dtbs_check warnings.
>>
>> Fixes: f767eb918096 ("arm64: dts: ti: k3-j721e-sk: Add overlay for IMX219")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   .../dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso  | 33 +++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
>> index 4a395d1209c8..4eb3cffab032 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
> 
> The link to the schematics seems to need updation, would like to see where these
> regulators are mentioned, can't find them in [0] which I assume is the latest link.
> 

Yes, It seems that the link to the schematics has been changed.
I will submit a separate patch to fix that.

While the regulators are not clearly documented in the schematics,
the voltage levels can be observed in the top-right corner of the 
schematics.

However, the required regulators are explicitly described in the device 
tree bindings.
Please refer: ./Documentation/devicetree/bindings/media/i2c/imx219.yaml

Thanks and Regards
Yemike Abhilash Chandra


>> @@ -19,6 +19,33 @@ clk_imx219_fixed: imx219-xclk {
>>   		#clock-cells = <0>;
>>   		clock-frequency = <24000000>;
>>   	};
>> +
>> +	reg_2p8v: regulator-2p8v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "2P8V";
>> +		regulator-min-microvolt = <2800000>;
>> +		regulator-max-microvolt = <2800000>;
>> +		vin-supply = <&vdd_sd_dv>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	reg_1p8v: regulator-1p8v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "1P8V";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		vin-supply = <&vdd_sd_dv>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	reg_1p2v: regulator-1p2v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "1P2V";
>> +		regulator-min-microvolt = <1200000>;
>> +		regulator-max-microvolt = <1200000>;
>> +		vin-supply = <&vdd_sd_dv>;
>> +		regulator-always-on;
>> +	};
>>   };
>>   
>>   &csi_mux {
>> @@ -34,6 +61,9 @@ imx219_0: imx219-0@10 {
>>   		reg = <0x10>;
>>   
>>   		clocks = <&clk_imx219_fixed>;
>> +		VANA-supply = <&reg_2p8v>;
>> +		VDIG-supply = <&reg_1p8v>;
>> +		VDDL-supply = <&reg_1p2v>;
>>   
>>   		port {
>>   			csi2_cam0: endpoint {
>> @@ -55,6 +85,9 @@ imx219_1: imx219-1@10 {
>>   		reg = <0x10>;
>>   
>>   		clocks = <&clk_imx219_fixed>;
>> +		VANA-supply = <&reg_2p8v>;
>> +		VDIG-supply = <&reg_1p8v>;
>> +		VDDL-supply = <&reg_1p2v>;
>>   
>>   		port {
>>   			csi2_cam1: endpoint {
> [0] https://datasheets.raspberrypi.com/camera/camera-module-2-schematics.pdf
> 

