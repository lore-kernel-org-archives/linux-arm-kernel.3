Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E99C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 08:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymwqf1Ux8HEhhD/Gs4JvP7qiKjBY5vzdVHC3KcdUKDA=; b=Hgo0lcwGPPuijrTOLeH+ApOGVD
	yDfJjftnxGtr4jIMuC2Nq7ZlpvenhAjpZIsjeQMf54dCTH/95yiZmeLJcKHwe1sT9GR8sxvUsCF+C
	SQUm5zANAJu3o03ycjboKai7V6fFdU8i9qIXLmRsO9lhoFJdHOWzVXLImz9ky8RzWmhEMk+jDhld4
	IGm4Xs5b7recKEdHmP5H2QTFshcWWiZGXOR8XVd1UhNdo0d727hcXki4qdveq7T5J0bp8AG5FnZqz
	ApRho8QI6rYIu0F2RvbGbsAasOcvp0wVKKXHawWFeiMTsynMVCDjw83K/BD2DgRpGqgZhK7UrL7wu
	DHHVceQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHA9-00000009MFn-3WMi;
	Wed, 11 Jun 2025 08:50:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPH80-00000009Lq2-0nac
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 08:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ymwqf1Ux8HEhhD/Gs4JvP7qiKjBY5vzdVHC3KcdUKDA=; b=bBd6DSdnVHEcT8JwnA8uJDyyPF
	ya5UfMscOLaVgbvdMYjryn23uP+26MfQIBTBeMRv62PRkf88a5fOTdNBNPLA493XLxjXGlzi760RS
	YR3T4/Se8hvX7vazemPqA98iySbLRwBTsm37AcdVpMIfJtc5kP4GcaKUPblidDTDqMy27AwVz/KK+
	N//I/BG6Sa2e/fE34NzRgltzsUN+fmhOgPW70AruM9wGX9WpMFx7uAghW5vKpNC0Qr2Z4/RWH3hNI
	/Lh7JKTsTBpLjQXznDUW3UTVyhmLIGfOA5sm4SoLJKc7fR0c9+KZBHtbtDNAOSDiK7PH/Zc3ODyZ1
	fam8W4cg==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPH7w-00000002Cmx-43cw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 08:48:11 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55B8lsB01314105;
	Wed, 11 Jun 2025 03:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749631674;
	bh=ymwqf1Ux8HEhhD/Gs4JvP7qiKjBY5vzdVHC3KcdUKDA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=S2oePBf6TLDhKKN47idjuh6FAgoEtZSrWTOX4qd6tgr+4irKqhG4tHkYNL4gcOTSk
	 PtsmVNvq+dmJNY9h9YyFFME8KS/ZsQY11E3NAAJqVVfawAn46ZRNQ7SEiyHszsQvEU
	 eRJ2U+m8SomwOCpTMEvcFmIxQokmVLdrWsmuKKpI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55B8lsIn2740090
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 03:47:54 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 03:47:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 03:47:53 -0500
Received: from [172.24.227.4] (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55B8lnqS071485;
	Wed, 11 Jun 2025 03:47:50 -0500
Message-ID: <b24a97fc-8dac-443b-aec7-317b9e393f2d@ti.com>
Date: Wed, 11 Jun 2025 14:17:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am642-evm-pcie0-ep: Add boot phase
 tag to "pcie0_ep"
To: Vignesh Raghavendra <vigneshr@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <danishanwar@ti.com>, Hrushikesh Salunke <h-salunke@ti.com>
References: <20250610054920.2395509-1-h-salunke@ti.com>
 <98e04654-a693-494d-9f60-930b6a4cd84a@ti.com>
Content-Language: en-US
From: Hrushikesh Salunke <h-salunke@ti.com>
In-Reply-To: <98e04654-a693-494d-9f60-930b6a4cd84a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_094809_364216_76778630 
X-CRM114-Status: GOOD (  13.95  )
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



On 11/06/25 14:14, Vignesh Raghavendra wrote:
> 
> 
> On 10/06/25 11:19, Hrushikesh Salunke wrote:
>> AM64X SoC has one instance of PCIe which is PCIe0. To support PCIe boot
>> on AM64X SoC, PCIe0 needs to be in endpoint mode and it needs to be
>> functional at all stages of PCIe boot process. Thus add the
>> "bootph-all" boot phase tag to "pcie0_ep" device tree node.
>>
>> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
>> ---
>> This patch is based on commit
>> 475c850a7fdd Add linux-next specific files for 20250606
>>
>> Changes since v1
>> As per feedback from Nishanth, changed the position of "bootph-all"
>> tag, according to ordering rules for device tree properties.
>>
>> v1 : https://lore.kernel.org/all/20250609115930.w2s6jzg7xii55dlu@speckled/
>>
>>   arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
>> index 432751774853..a7e8d4ea98ac 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
>> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
>> @@ -46,6 +46,7 @@ pcie0_ep: pcie-ep@f102000 {
>>   		max-functions = /bits/ 8 <1>;
>>   		phys = <&serdes0_pcie_link>;
>>   		phy-names = "pcie-phy";
>> +		bootph-all;
>>   		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
>>   	};
>>   };
> 
> Are the patches for PCIe boot support merged to U-Boot or such other
> bootloader repo?
> No, they are not in the U-Boot yet. I will be posting patches for PCIe
boot support for U-Boot this week.

Regards,
Hrushikesh

