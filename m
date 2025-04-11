Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B830BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyl4VJ4NFKTvxc57ODEOoVjJmEfMQrs8ZXag1cIaiu0=; b=m3ySBccggPpkO5/Q1XqOkCAame
	78hWKU+tXmCkqIiUG7+Io6gnaVQ3nCYYh9VGDixiH8hwHdwUSKmgGLzqrHRM6pyR3ZUIjcBfVB9Cb
	8Pcoo5dPDCFXhUtw3lifW7+yfV9uD7EiHlQAK8H0ExOlc8lunGBaNUByl/nQ5Fb7macPl+k5sLTKp
	cxWqKwr4kXCTvOJVqzWgwwBVpLxxx1qgW8rKS35gBeB+azu6qbL1OXwuOpqgpQ/3PY96MIcA2jmYH
	fhkPmqu8/Nq0Ktn13M/j2a3VC7seqA0X1uIE6zSw9kwsNbttH4XjsnBIunnfgtRSuD3WuNpiPj81e
	BGESXHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3F9s-0000000E3G4-2NLF;
	Fri, 11 Apr 2025 14:15:04 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Ei2-0000000Dyb9-40vq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:46:20 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BDkB0a2140146
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 08:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744379171;
	bh=dyl4VJ4NFKTvxc57ODEOoVjJmEfMQrs8ZXag1cIaiu0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Gk2uQTcHeH4nzT6Glj0uV8LS0iUAda68IF4ZwTF0mGzcW11qGTDUo24Emn6kLRBpX
	 SWehkYMfkE968s7ORvuFuh0P903Qp2G/RFTtyq1cC6n9wg2WqfZsaKjJK/BZh3/pob
	 QFJTH+KUz9kIz9uawiCPq+jWGG3BNxwZHwU+ub40=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BDkBlG054534
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 08:46:11 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 08:46:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 08:46:10 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BDk6S7109624;
	Fri, 11 Apr 2025 08:46:07 -0500
Message-ID: <6b730f33-9d83-4ced-839d-dc03b2eb8e4c@ti.com>
Date: Fri, 11 Apr 2025 19:16:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm64: dts: ti: am68-sk: Fix regulator hierarchy
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250409134128.2098195-1-y-abhilashchandra@ti.com>
 <20250409134128.2098195-3-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250409134128.2098195-3-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_064619_086339_58C2437C 
X-CRM114-Status: GOOD (  15.28  )
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


On 4/9/2025 7:11 PM, Yemike Abhilash Chandra wrote:
> Update the vin-supply of the TLV71033 regulator from LM5141 (vsys_3v3) to
> LM61460 (vsys_5v0) to match the schematics. Add a fixed regulator node for
> the LM61460 5V supply to support this change.
>
> AM68-SK schematics: https://www.ti.com/lit/zip/sprr463
> Fixes: a266c180b398 ("arm64: dts: ti: k3-am68-sk: Add support for AM68 SK base board")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> index 11522b36e0ce..5fa70a874d7b 100644
> --- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> @@ -44,6 +44,17 @@ vusb_main: regulator-vusb-main5v0 {
>   		regulator-boot-on;
>   	};
>   
> +	vsys_5v0: regulator-vsys5v0 {
> +		/* Output of LM61460 */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vsys_5v0";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vusb_main>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
>   	vsys_3v3: regulator-vsys3v3 {
>   		/* Output of LM5141 */
>   		compatible = "regulator-fixed";
> @@ -76,7 +87,7 @@ vdd_sd_dv: regulator-tlv71033 {
>   		regulator-min-microvolt = <1800000>;
>   		regulator-max-microvolt = <3300000>;
>   		regulator-boot-on;
> -		vin-supply = <&vsys_3v3>;
> +		vin-supply = <&vsys_5v0>;

Looking at schematic page -3

USB PD Controller is giving input to LM61460 , LM5141(3V3), and TPS62177.

Could you please recheck this, vin-supply for 3v3 regulator

Thanks

Udit


>   		gpios = <&main_gpio0 49 GPIO_ACTIVE_HIGH>;
>   		states = <1800000 0x0>,
>   			 <3300000 0x1>;

