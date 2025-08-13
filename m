Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6C6CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:CC:To:From:Message-ID:Date:Content-Type:Content-Transfer-Encoding:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lL/86upWP/+8sXqyxr7nH0Vq0QlFJa/4K+UatKQhu1c=; b=pUsMMv6uVw2wOodIkQ30lyLXZx
	csCAIvAkuD44EopulIdp5oBq7HGcE4KzgZaTUBU/5ofug1pDtumKQ2F+PhJFvrSu6IBxqpALjqP27
	NrxFrqGbTwsge2korDLGIHC+aIm/cSV+K78XZW5/by0q01zfw9pPj+TnBskSftm8UXpTiIs5Yyoy2
	n1W3n+WhWTPmfpLwEV8eVXjxDs5vZFaNPJPGhqkuL0aRrhwsjM3AFfpI45q3WRTaTCf0XUUbmTNc1
	XTK7dK9gQqqpNZiMO4i178mjE0mYPve6O9ik4p26mQjPvNx3Kk7S8FIWbxThRPi4LF/zasnkl1geA
	q4IMPjQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHPZ-0000000Eqsk-0Dm5;
	Wed, 13 Aug 2025 19:45:25 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFkZ-0000000EdJm-0rCe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 17:59:00 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DHwoNs2128852;
	Wed, 13 Aug 2025 12:58:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755107930;
	bh=lL/86upWP/+8sXqyxr7nH0Vq0QlFJa/4K+UatKQhu1c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=e2Hz9dNHPEhPLQ0CnK8fClA+7gQy4WdM9Uadnl7xfSxkx1LHu6ASr6nKgjcZVpnK2
	 eUwUkhd/R2AY/tKQI2Z32IpG69pGrKxIgZxbFoIYu4+RBBQtqm2QSfstGxg/wVT9is
	 FXfMvnW/bsfUa8LGrENMQlR3d6NK6BhtKKkcU+Cg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DHwoJp239179
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 12:58:50 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 12:58:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 12:58:50 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DHwo7Z2676660;
	Wed, 13 Aug 2025 12:58:50 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 13 Aug 2025 12:58:50 -0500
Message-ID: <DC1HU458W3QA.YLONSMYKK0C4@ti.com>
From: Randolph Sapp <rs@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <d-gole@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <detheridge@ti.com>, <matt.coster@imgtec.com>
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-j784s4-j742s2: enable the
 bxs-4-64
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250808232522.1296240-1-rs@ti.com>
 <20250808232522.1296240-3-rs@ti.com>
 <20250813151819.5rthljjrpryfwezz@skinning>
In-Reply-To: <20250813151819.5rthljjrpryfwezz@skinning>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_105859_332280_733FC718 
X-CRM114-Status: GOOD (  12.93  )
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

On Wed Aug 13, 2025 at 10:18 AM CDT, Nishanth Menon wrote:
> On 18:25-20250808, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> Add the relevant device tree node for Imagination's BXS-4-64 GPU.
>>=20
>> These devices uses a similar MSMC configuration to the J721S2. As such,
>> they also require the use of the dma-coherent attribute.
>>=20
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>  .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/=
arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>> index 7c5b0c69897d..a44ca34dda62 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>> @@ -2691,4 +2691,18 @@ bist_main14: bist@33c0000 {
>>  		bootph-pre-ram;
>>  		ti,sci-dev-id =3D <234>;
>>  	};
>> +
>> +	gpu: gpu@4e20000000 {
>> +		compatible =3D "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
>
> Following  https://lore.kernel.org/linux-arm-kernel/DBE4UO2RGAYX.17V1DAF8=
MQYJM@kernel.org/
> Is it worth having ti,j784s4-gpu here? Are there any SoC specific quirks
> that driver will need to handle?

No SoC specific quirks, aside from those already being tracked through the
dma-coherent attribute. If we actually want to register SoC specific
compatibility entries as advised by the kernel docs, just let me know. I've=
 seen
this opinion toggle a few times.

>> +		reg =3D <0x4e 0x20000000 0x00 0x80000>;
>> +		clocks =3D <&k3_clks 181 1>;
>> +		clock-names =3D "core";
>> +		assigned-clocks =3D <&k3_clks 181 1>;
>> +		assigned-clock-rates =3D <800000000>;
>> +		interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>> +		power-domains =3D <&k3_pds 181 TI_SCI_PD_EXCLUSIVE>,
>> +				<&k3_pds 182 TI_SCI_PD_EXCLUSIVE>;
>> +		power-domain-names =3D "a", "b";
>> +		dma-coherent;
>> +	};
>>  };
>> --=20
>> 2.50.1
>>=20


