Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7ADCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4dfZmBKti9e9DTCpNwBo1wF53VJMOGIMax06H7HFHE=; b=TrRNfoDQUAFsUNUN+M0jx5a+d1
	2IuLQ3YiLXDKoZCRlRQUaXuLaWrhyIqmajqDr+bh0g4EFUcT4Z6WWW6QiIG2uTd2uBB0lyc/nnKiD
	PQVfFCATrrVdvGxk2UlH2C22KBKXyCRlVz4MsW+g0ttcqFax7y4G3VHD/UTdwT9IRd1W/Ni1rEfs3
	3HQwGk/vfLoY3Vf6fKS6ZoGU4A1zCVMX8W2VWREk7V9ecA9TuEiY+kOK5+1UE/cl478E6Cd0uC1Mb
	c9p6Dc10F7Wa/sT43sPL6EMvTsYD94VY8Wuo1096hJCLzuPVhGP7ar9llntKc667IK7P8st2Uk3eU
	RJ0idN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTz-00000004Lj4-0K4U;
	Sat, 23 Aug 2025 08:20:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRUm-00000002aBK-1i8K
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 13:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=y4dfZmBKti9e9DTCpNwBo1wF53VJMOGIMax06H7HFHE=; b=NP11bE+aMhOq4GUGBJV+49V9lw
	8UZTUBWrNOE009I2QKiCclEAlgY+wNwai9kLgJt1D37QPuvkPLDFqImNyj9Vv/S7+SnGmOCu5T5TM
	CwFJzj5ZuXv6Gc06hZ9QrCovuwWOGse+xKR75nB/v5x+DL/+/RIKWhFwb/T34YYnsH4PpTKapqrdG
	K54PLSS5njKMeeHcwrVWkAI/26dwAzkXuMuQy2WmjBRbvCSRD7p8SYSNtUykZb4jjogMwMXGjX8wq
	j5+8tI4GH5EW9lGtzowgkS4XEB4nHyE+W1EluxLPboKBlCIE/+K3U4UaHr4YCEHKBLsF+cwTMkbhu
	2pcTGQeA==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRUj-00000000v4Y-08VB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:07:51 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MBCtNP004015;
	Fri, 22 Aug 2025 15:07:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	y4dfZmBKti9e9DTCpNwBo1wF53VJMOGIMax06H7HFHE=; b=fyuJccF/s7ggC7Ys
	XJTR9QPRN0IY/FWb5RFoJbpn7uySk9I5631NtBvMrBOFbAEhXLjcjg7+OjAN/jhz
	gg5kdf51Xz1wSV1t+152tqzPW5lie+cUeyz3auDWM1RdGUJU5wqRgrm9kqJl2WQO
	eCNHizL9rENpsgDW4UtPzjCgSnLzfPnJp7tK8oVihy7JAf7jtg5T82N9qUKlnVuG
	FPFcpjnb5OlxYF3+mtVSkFhBVnSGBpmmqI/GsAn967R8wjjXtK9FQOQUnut76wFn
	PW0KlPDut6fXdxXt/8BDVpeOMDq1llQoBBaFDwel/WfDeQBbHruoy8hsWkqPCs8s
	+4KGyg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48np7n78s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 15:07:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9DEB840050;
	Fri, 22 Aug 2025 15:06:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6BEFB71CE44;
	Fri, 22 Aug 2025 15:05:26 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 15:05:25 +0200
Message-ID: <6dc308d7-9b31-4b6d-ba68-69a91c8fcd32@foss.st.com>
Date: Fri, 22 Aug 2025 15:05:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] arm64: dts: st: add ltdc support on stm32mp255
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
 <20250821-drm-misc-next-v4-10-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-10-7060500f8fd3@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_140749_450866_30218B6C 
X-CRM114-Status: GOOD (  15.66  )
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

Hi Raphael,

Thanks for the patch.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>

Le 21/08/2025 à 13:09, Raphael Gallais-Pou a écrit :
> Add the LTDC node for stm32mp255 SoC and handle its loopback clocks.
>
> ck_ker_ltdc has the CLK_SET_RATE_PARENT flag.  While having this flag is
> semantically correct, it for now leads to an improper setting of the
> clock rate.  The ck_ker_ltdc parent clock is the flexgen 27, which does
> not support changing rates yet.  To overcome this issue, a fixed clock
> can be used for the kernel clock.
>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 6 ++++++
>   arch/arm64/boot/dts/st/stm32mp255.dtsi | 6 ++++++
>   2 files changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 372a99d9cc5c3730e8fbeddeb6134a3b18d938b6..b44ff221e0da968be104ff8195f9bef79c90c57a 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -52,6 +52,12 @@ clk_rcbsec: clk-rcbsec {
>   			compatible = "fixed-clock";
>   			clock-frequency = <64000000>;
>   		};
> +
> +		clk_flexgen_27_fixed: clk-54000000 {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <54000000>;
> +		};
>   	};
>   
>   	firmware {
> diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
> index f689b47c5010033120146cf1954d6624c0270045..48a95af1741c42300195b753b710e714abc60d96 100644
> --- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
> @@ -5,6 +5,12 @@
>    */
>   #include "stm32mp253.dtsi"
>   
> +&ltdc {
> +	compatible = "st,stm32mp255-ltdc";
> +	clocks = <&clk_flexgen_27_fixed>, <&rcc CK_BUS_LTDC>, <&syscfg>, <&lvds>;
> +	clock-names = "lcd", "bus", "ref", "lvds";
> +};
> +
>   &rifsc {
>   	vdec: vdec@480d0000 {
>   		compatible = "st,stm32mp25-vdec";
>

