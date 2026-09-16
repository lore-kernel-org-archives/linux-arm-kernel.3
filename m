Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BB3C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 06:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dmq9AZ1vIHHYBfJ/kR1wgFXYb1HSX0N4D1w5gRdEoaA=; b=t3OMuzK3/RhzxF0L+4442OK/dY
	2/VmQbbNYEIgvHoCGECriA9hD3kUQYUN3l74+pIoNmK9c5bcfO6cdkt0LZu1SPMPr5BMNflnHqKr2
	53z1i3FGgDd9tSIJzdy857qAUNMsqgu0hf9MmIRoHuqGcA6KoOwBeWTqPkNkTWj6O+OFtWvlcMEQM
	k9uZqANezAr9ObFj3LQV/W7CWg3W2hyPA9jOlRdabksku61v+s8EJ9yJLSYxVKDOxrNNt1jeMdspk
	f1D/zcSxBRAc4fX5VqkKbncmaiHb7CBMYEdTmlsidCEqssy+IKUWYtXaTlWsiEN28nFS8VJEeRYWF
	qperDp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jYg-00000008XBl-0C8z;
	Wed, 16 Sep 2026 06:55:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jYb-00000008XAr-0ZrJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 06:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Dmq9AZ1vIHHYBfJ/kR1wgFXYb1HSX0N4D1w5gRdEoaA=; b=WP+EDuFQ5fvTv59rAASAoktyY8
	i9g0XKLWmQStyl7jiQsIUul+eoyjt1EZS3+Xz+k4XRg96JbN6TOzSQz1cEOxmaPpXzcJp54g3Wbz9
	aIjvMsiy+AcxqB444AcLFV7VO2s4VFDd8lo66YECP2UFApMb5dpktKHi6ywdTd9ZIib4s/VSC90/6
	NHdYgVjaWjFngX2DT7P1lJBJvXEMSn3ACgfcv948TkK43iYcgFXP/uh5PVmqWynvRfo3hB//9poG+
	Chybx388hYtkePLd768zymyc/fj6b9FxxtaI2xTXdaMXdU0nFzpdyjuhHuShfTkMaPMVwyBieVkXJ
	Nd91Vydg==;
Received: from mailout4.samsung.com ([203.254.224.34])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6jYX-00000007YtL-0AtH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 06:55:47 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260916065534epoutp04de39e1c91998b369898f697b0275b01b~Vurn-CUXA0338903389epoutp049
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 06:55:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260916065534epoutp04de39e1c91998b369898f697b0275b01b~Vurn-CUXA0338903389epoutp049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789541735;
	bh=Dmq9AZ1vIHHYBfJ/kR1wgFXYb1HSX0N4D1w5gRdEoaA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=sN29VXdR2j2bHvRXpPTbj65RGugMMyVibw4Cu63eA28RRhMrNqI0nPBPvmSnvDR5x
	 gP6nnnf8gREha+A1Ic3cb+oXm+ZsDuAs4r29tPDWqiGZ/cwIwQd1+NbHqICNrggcYE
	 wcMP9LcNSs4xbG6HRoWfXxv9I4rIQan2LaNPgUSs=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260916065534epcas5p3a129d4f73b4e4d18ce8fb3af12881fb3~VurnU534m1719117191epcas5p3p;
	Wed, 16 Sep 2026 06:55:34 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.86]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hl8m50R9Bz3hhT7; Wed, 16 Sep
	2026 06:55:33 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260916065532epcas5p3bac23ebb76d7f13815042d4e89821649~Vurln5I_T1987819878epcas5p3u;
	Wed, 16 Sep 2026 06:55:32 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260916065529epsmtip129833710e6fe28286b722fa81fb5efef~Vuri6XZjm1077810778epsmtip18;
	Wed, 16 Sep 2026 06:55:29 +0000 (GMT)
Message-ID: <0faf2d75-3b0c-4b89-ab89-d5f93eb26821@samsung.com>
Date: Wed, 16 Sep 2026 12:25:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] usb: dwc3: Add Exynos8855 to the generic platform
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, peter.griffin@linaro.org,
	alim.akhtar@samsung.com, gregkh@linuxfoundation.org, robh@kernel.org,
	conor+dt@kernel.org, Thinh.Nguyen@synopsys.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <9969f6d6-71ee-4c22-9b37-a0f6bac97169@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260916065532epcas5p3bac23ebb76d7f13815042d4e89821649
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260903071322epcas5p2a40e3299b0954dd880c9b3651555760c
References: <20260903071250.3421499-1-selvarasu.g@samsung.com>
	<CGME20260903071322epcas5p2a40e3299b0954dd880c9b3651555760c@epcas5p2.samsung.com>
	<20260903071250.3421499-4-selvarasu.g@samsung.com>
	<9969f6d6-71ee-4c22-9b37-a0f6bac97169@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_075545_984024_7BE279E6 
X-CRM114-Status: GOOD (  16.84  )
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


On 9/5/2026 12:49 PM, Krzysztof Kozlowski wrote:
> On 03/09/2026 09:12, Selvarasu Ganesan wrote:
>> Add the "samsung,snps-dwc3" compatible string to dwc3-generic-plat so
>> the Exynos8855 USB3 DWC3 controller can probe through the generic DWC3
>> platform glue.
>>
>> The "samsung,snps-dwc3" string is used as a generic fallback to support
>> any Exynos SoC that utilizes a flattened model instantiation. This
>> fallback allows multiple Exynos SoCs to be supported by the generic
>> platform driver simply by adding the fallback compatible to their
>> respective device tree nodes.
>>
>> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
>> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> ---
>>   drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
>> index ca69ac0eb07c..33a76c37d15d 100644
>> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
>> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
>> @@ -237,6 +237,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
>>   	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>>   	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
>>   	{ .compatible = "starfive,jhb100-dwc3", },
>> +	{ .compatible = "samsung,snps-dwc3", },
> Why not in alphabetical order?

You're right, it's not in alphabetical order. I'll fix this in the next 
version.

Thanks,
Selva
>
> Best regards,
> Krzysztof

