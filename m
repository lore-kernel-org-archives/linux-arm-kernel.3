Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19A7CA0EE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:CC:Message-ID:Date:Content-Type:Content-Transfer-Encoding:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFJX7ROmMlHtgiQ3gBewH9Q1Os88jQwB6NXsXPrawN0=; b=hyIAQhSfiTZBzoRY6nk/mOYtWf
	hgAqEKsVpwlZbsVH3c0rMqGakEWAfnFcTO34Hn3PEYZv3xu18pKb91LYY8dSF0ePzELO8zMnMfgBl
	0/MQsX8V5mn4DhcdLJy+c3lpUKw5SmbjsE35eGGuy2sfX07/NqeLXgSLLbFJHy0Za4Fn1DdjCR056
	EPS2KUt9QAXWhBWm2SzcGMYGbtbxesrs2Nb0Z9/UYlRc3qS9deKp0WqeYeCvi8ZbqH4vG8kAPwc75
	rNC9Qq4UcUT6wXbadIUy56M9zawN/XmXKcX7H8n/YL8K6D8UXBYpKqk0hnEyaw5j0vbFZFumdEELV
	WAX+hufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPX-0000000EqqM-3Nyx;
	Wed, 13 Aug 2025 19:45:23 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFiB-0000000Ed4E-02TM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 17:56:32 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DHuNSX2202385;
	Wed, 13 Aug 2025 12:56:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755107783;
	bh=QFJX7ROmMlHtgiQ3gBewH9Q1Os88jQwB6NXsXPrawN0=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=YummBlmY7ttSy6IpyHWe6VEDzxGUSkFPK8eiiTitKq+WZDKcVLTyW5PWF4SJr5WaU
	 azDgclvEJyZk5o4fM/0UBa0OEZwkr5hmttGCswZ5wAdDRQTX6wkuP0y4TQt5LutIU4
	 H3uVI2Iq1X+tvjKG3Ksmshmfz0Kj3kziSN9sWV9Y=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DHuNtZ565346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 12:56:23 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 12:56:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 12:56:22 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DHuMO82674221;
	Wed, 13 Aug 2025 12:56:22 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 13 Aug 2025 12:56:22 -0500
Message-ID: <DC1HS8D8KLIF.2MN7D9EXGQQ45@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <d-gole@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <detheridge@ti.com>, <matt.coster@imgtec.com>,
        Michael Walle
	<mwalle@kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62p-j722s: enable the bxs-4-64
From: Randolph Sapp <rs@ti.com>
To: Nishanth Menon <nm@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250808232522.1296240-1-rs@ti.com>
 <20250808232522.1296240-2-rs@ti.com>
 <20250813151721.nc5fr3qmro5grlda@steam>
In-Reply-To: <20250813151721.nc5fr3qmro5grlda@steam>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_105631_137052_F253F176 
X-CRM114-Status: GOOD (  13.74  )
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

On Wed Aug 13, 2025 at 10:17 AM CDT, Nishanth Menon wrote:
> On 18:25-20250808, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> Add the relevant device tree node for Imagination's BXS-4-64 GPU.
>>=20
>> These devices specifically do not set the dma-coherent bit because they
>> do not use the same MSMC configuration as other BXS-4-64 enabled TI
>> platforms.
>>=20
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>  .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi     | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/ar=
ch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>> index 2e5e25a8ca86..a51db8f9dff8 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>> @@ -690,6 +690,19 @@ ospi0: spi@fc40000 {
>>  		};
>>  	};
>> =20
>> +	gpu: gpu@fd80000 {
>> +		compatible =3D "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
>
> Note the discussion in https://lore.kernel.org/linux-arm-kernel/DBE4UO2RG=
AYX.17V1DAF8MQYJM@kernel.org/
>
>> +		reg =3D <0x00 0x0fd80000 0x00 0x80000>;
>> +		clocks =3D <&k3_clks 237 1>;
>> +		clock-names =3D "core";
>> +		assigned-clocks =3D <&k3_clks 237 1>;
>> +		assigned-clock-rates =3D <800000000>;
>> +		interrupts =3D <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
>> +		power-domains =3D <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>,
>> +				<&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
>> +		power-domain-names =3D "a", "b";
>> +	};
>> +
>>  	cpsw3g: ethernet@8000000 {
>>  		compatible =3D "ti,am642-cpsw-nuss";
>>  		#address-cells =3D <2>;
>> --=20
>> 2.50.1
>>=20
>
> Is the issue that Michael reported
> https://lore.kernel.org/linux-arm-kernel/20250716134717.4085567-3-mwalle@=
kernel.org/
> resolved?

Define resolved. If by resolved you mean using the same hack we have had on=
 the
out of tree module for years, then yes it is resolved.

