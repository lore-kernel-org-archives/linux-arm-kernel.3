Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC873CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAck9Emf81sVRE5nj2gy4fdVLzPWbRvHowUZM2d4qh8=; b=OQYTVN+9/lOoWZ95ALV4wslrJw
	mmQHFyEbxfiSHYDYZTjuodf6euu+ARHvVgODZh5mMZN/p0UI21QpflsCWZvyufwwjyiqAMLXujCU4
	muPET5prr/NnScc21aPoT6Sda5wOhfv/+GbFvkKjr/p3gVxNeve/i6/ZfLE9LeDueGw6J9y17Dpry
	gkxnpUpigfieqK1Wec2eOhNriuftm7WTOEO8SNPRFmPA3FGLvT5wuScw6iqdkt0fjEq/eTEfoito8
	Ca66r4z6C39yI7ViBs/Lcii5IqANdawoqL8PIQtzREbNedQ/9J2Qv9Wzsmr/IhtJRReZJTwTkzwjP
	RNOvmf5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0YM-00000007hQX-0IQQ;
	Mon, 18 Aug 2025 14:09:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0TG-00000007gjr-04ru
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 14:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AAck9Emf81sVRE5nj2gy4fdVLzPWbRvHowUZM2d4qh8=; b=XAYNS0zPPssMl2q8CCEAkgzsVm
	KqR7o9oYU7vp3M61zDENkIVHz9CBxCJuu/Jd0gyTd6f9XBGzF+ChnJP4Llkhi6FvxHB9otjO5/u+8
	Jmnp4r9bTGExn574mG3xRiE4unwv+jmCBnwyRwMVgs3fjfE3eotKJwH4u9uDqQ1NkrC+luZ1NfI+G
	0ALe/kVFFS3NwEQOEPdfUEzSTvIrqq8Kprs1Kp/C05gchhdX9UXKMP706qPPQPSk+ZDlTCcrUuWQo
	BVcJrbKkd2GHeZE67RHqfu6rofi1jSaTI4cJWwDrL6ZjSWkXdlRhXM3JAV68v0UFSxVUMHlrtHFVS
	N5n6uPTw==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0TC-0000000HOcp-49ZS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 14:04:20 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IDFlne021385;
	Mon, 18 Aug 2025 16:04:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	AAck9Emf81sVRE5nj2gy4fdVLzPWbRvHowUZM2d4qh8=; b=qAQivGCfs+YIegmc
	vwKsUSpLAfc8MDhwwG8yN39iyE5sNALBW52MNHaNPhR+Ph9h73iLE1xc6oR7QG86
	ajcM+xltusUsf47Knmr64s59rv1at2WmnAjD40hsajRm2uETmVyzYkorx5qVlflH
	fTR543oVIh8AGN7rzn43qmINyLrCmaAJVB5o4KVTULYBuRxs8Ocw7q7jjOxVNWYo
	c58lNaS4X0rwiHPT3ASKLQ4MgredTdL81QRAFH6CicxkTe151uRU51ofdaN2BhkV
	erP2hbSJVO4vUa5rBtrOZ8QvP3pXUOn1PGcKdjtyBXJwBYIMcJPnAOqyPZmbIa7a
	dWR2pQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48k4xmmeg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 16:04:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7000B40049;
	Mon, 18 Aug 2025 16:03:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EBFE0726262;
	Mon, 18 Aug 2025 16:03:11 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Aug
 2025 16:03:11 +0200
Message-ID: <ce3edd3b-4d42-4a2c-b163-a9aac59466ae@foss.st.com>
Date: Mon, 18 Aug 2025 16:03:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: sti: rename SATA phy-names
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250713142424.41236-1-rgallaispou@gmail.com>
 <09384c23-cffe-471c-95b4-82b3d34de4e7@foss.st.com>
Content-Language: en-US
In-Reply-To: <09384c23-cffe-471c-95b4-82b3d34de4e7@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_150419_180802_B6EAE39D 
X-CRM114-Status: GOOD (  11.86  )
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



On 7/28/25 11:18, Patrice CHOTARD wrote:
> 
> 
> On 7/13/25 16:24, Raphael Gallais-Pou wrote:
>> Stick to the documentation and rename both SATA phy-names properties to
>> what is expected.
>>
>> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
>> ---
>>  arch/arm/boot/dts/st/stih407-family.dtsi | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
>> index 35a55aef7f4b..3e6a0542e3ae 100644
>> --- a/arch/arm/boot/dts/st/stih407-family.dtsi
>> +++ b/arch/arm/boot/dts/st/stih407-family.dtsi
>> @@ -669,7 +669,7 @@ sata0: sata@9b20000 {
>>  			interrupt-names = "hostc";
>>  
>>  			phys = <&phy_port0 PHY_TYPE_SATA>;
>> -			phy-names = "ahci_phy";
>> +			phy-names = "sata-phy";
>>  
>>  			resets = <&powerdown STIH407_SATA0_POWERDOWN>,
>>  				 <&softreset STIH407_SATA0_SOFTRESET>,
>> @@ -692,7 +692,7 @@ sata1: sata@9b28000 {
>>  			interrupt-names = "hostc";
>>  
>>  			phys = <&phy_port1 PHY_TYPE_SATA>;
>> -			phy-names = "ahci_phy";
>> +			phy-names = "sata-phy";
>>  
>>  			resets = <&powerdown STIH407_SATA1_POWERDOWN>,
>>  				 <&softreset STIH407_SATA1_SOFTRESET>,
> 
> 
> Hi Raphael
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
Applied to sti-next

Thanks
Patrice

