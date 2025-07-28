Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD35C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 09:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/n2Y6jUtj/p2PorjZw4FleFZNqzHtoA8QQQ55mAjzHM=; b=TcYEYdXf8ffVPUj10xH1CIehty
	WFNNweOlSDhJIS6Hw1XsmvTSkzVjrPzfM27lcAnAp5XnEaMKrnwGDPSndRnaqTrIbt7S05NrysAdh
	/TjzJr63QnSWFen3Owqnz39ckhAP/w0f7Ow0rryqVw2ZEnlCDa7EVSN8hlHEvqJzr2qUPlcWjGRMK
	S1a3fPQ54lbslg3hjNp1BuoxEgUpQws1H6aWyDJtG4wjwFMc6c1EOQI+xDGYLE6Scd8LPGfRAj1BZ
	XWOAxeZeyOILSofmCU/F/aFyJ1y/wLYAbE+jzOru2pppFoMgBSifY+i2Pu1AIu8Q/My8HwyU9/YM3
	OfaiAIoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugK3l-0000000E5nX-1SvC;
	Mon, 28 Jul 2025 09:22:17 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugK1C-0000000E5UA-36Ox
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 09:19:40 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S8jfbS023646;
	Mon, 28 Jul 2025 11:19:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	/n2Y6jUtj/p2PorjZw4FleFZNqzHtoA8QQQ55mAjzHM=; b=ra9i7CSTewtW3PGz
	EVHG77biSbn99acmZdPMO6Luyd2LqgWttWTP6203xfySIexq4wRZRqdPoI87a5XP
	l18sBvBmcntaMlsA8dE/2HrpQ1nTISVpKkTKWYZfIL4H2zSuvXOp0GkF1G+S06UX
	sV8tScxIdCquuTwVi6DwcHNZ1pqxReJleky1vbh5ojubX5Ml4WV0p9hNMl9xEpIy
	72lUATwhtKv6JnGDWiwwL6IeUN7JLurheXysmn3A8AF0FQq4voIsR7FCuvqgvjT/
	5H9FFDF8kop6+gwnpHvnhmx/Djv++vi7dKBcLEADglFIsvFluV/i9LP0TZ5zB/o3
	8+KdhQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484m58y7xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 11:19:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 27ECF4002D;
	Mon, 28 Jul 2025 11:18:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A1520700A0D;
	Mon, 28 Jul 2025 11:18:08 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 11:18:08 +0200
Message-ID: <09384c23-cffe-471c-95b4-82b3d34de4e7@foss.st.com>
Date: Mon, 28 Jul 2025 11:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: sti: rename SATA phy-names
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250713142424.41236-1-rgallaispou@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250713142424.41236-1-rgallaispou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_021939_043579_6F6F1192 
X-CRM114-Status: GOOD (  12.20  )
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



On 7/13/25 16:24, Raphael Gallais-Pou wrote:
> Stick to the documentation and rename both SATA phy-names properties to
> what is expected.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  arch/arm/boot/dts/st/stih407-family.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
> index 35a55aef7f4b..3e6a0542e3ae 100644
> --- a/arch/arm/boot/dts/st/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/st/stih407-family.dtsi
> @@ -669,7 +669,7 @@ sata0: sata@9b20000 {
>  			interrupt-names = "hostc";
>  
>  			phys = <&phy_port0 PHY_TYPE_SATA>;
> -			phy-names = "ahci_phy";
> +			phy-names = "sata-phy";
>  
>  			resets = <&powerdown STIH407_SATA0_POWERDOWN>,
>  				 <&softreset STIH407_SATA0_SOFTRESET>,
> @@ -692,7 +692,7 @@ sata1: sata@9b28000 {
>  			interrupt-names = "hostc";
>  
>  			phys = <&phy_port1 PHY_TYPE_SATA>;
> -			phy-names = "ahci_phy";
> +			phy-names = "sata-phy";
>  
>  			resets = <&powerdown STIH407_SATA1_POWERDOWN>,
>  				 <&softreset STIH407_SATA1_SOFTRESET>,


Hi Raphael

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks

