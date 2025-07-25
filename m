Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47799C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 11:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EIFICZ6PcSv8Dm1Wx1IcEsY2QkDaiXmUkaUpQzq2mw=; b=t9Knwn181VzeK0mUUvUqRjD5BZ
	y31dwJlGtvOs0K0tmUO/+4izLp9fP3ernebQ5AKlxLh5LO7C4C3Y/2R6dedR8apV9NFJOE5XbJpGx
	pMAGc7uC0gL2tpJrqoFvCwAriPVsTyEji7iU1w5uQlSaFKHrO7iL/azlSHo1LHfmSIwEZ4xrqEFKe
	dVZUNMmsjJCgub+sUJiRdFCJu8qia+9g8QRoV48askGn0hFyjDfjz3LM21x6w1jBqVcp5bJSsONcs
	FkAu7JslKDSzyXrqumDwAll+Bgu2BgWTyB8fDhE5co4RJnVLxxAwAeQ0OpvoQmm/sKKJ9uL2tXeQo
	z5xAFFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufH3t-00000009lX4-2bWZ;
	Fri, 25 Jul 2025 11:58:05 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGL0-00000009gTw-1LwN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 11:11:44 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PA7CB4004324;
	Fri, 25 Jul 2025 13:11:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	7EIFICZ6PcSv8Dm1Wx1IcEsY2QkDaiXmUkaUpQzq2mw=; b=N3M2Egl7vTiFztE5
	eWo2u9sUVXirJiniHCzcbmnm41xHXf33B3ctG5RtYCk9GRh++0Sz5JzTNNeOUard
	sPyHLHT1ipV3o770xZa2wnlHs2zl6ex/6pM3+PIhbuFun/95aqW3xttHRUDWEjQc
	DaXeKT7wLq6SpwVUaIo+qyhjkUj8aPtzFqqW67TZSFfRyJd7MjaOZGgO+r3uBnOd
	hJnDkqU+UvTrpxhWQFe4XxEgHYjeHOTcub0B/q+CpnKVWhc5GBlpBK0cakMJg1iY
	vo427FXrD3VPZtlgCF9U+oQsmx3WXVAC92qSFtQQ11nZn/zqjDW4Lcp7h9saIfPZ
	Lwyx9Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 483w3ett17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jul 2025 13:11:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 03F9B4004D;
	Fri, 25 Jul 2025 13:10:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE05C22306A;
	Fri, 25 Jul 2025 13:09:00 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 13:08:59 +0200
Message-ID: <85673db7-d311-47cc-be52-291d94e136e4@foss.st.com>
Date: Fri, 25 Jul 2025 13:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH 09/12] arm64: dts: st: add lvds support on
 stm32mp255
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Yannick Fertre
	<yannick.fertre@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-9-a59848e62cf9@foss.st.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250725-drm-misc-next-v1-9-a59848e62cf9@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_041142_870930_1E89932E 
X-CRM114-Status: GOOD (  16.06  )
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

On 7/25/25 12:04, Raphael Gallais-Pou wrote:
> The LVDS is used on STM32MP2 as a display interface.
> 
> Add the LVDS node.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp255.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
> index f689b47c5010033120146cf1954d6624c0270045..a4d965f785fa42c4597494010855aec7e1b9fdd1 100644
> --- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
> @@ -6,6 +6,18 @@
>   #include "stm32mp253.dtsi"
>   
>   &rifsc {
> +	lvds: lvds@48060000 {
> +		compatible = "st,stm32mp25-lvds";

For the compatible you now need one comaptible per SoC.
It means your compatible should look like : "st,stm32mp251-lvds".
This way, if on the 253 or 255 there is an issue you are able to easily 
add match data in the driver with compatible "st,stm32mp253-lvds" or 
"st,stm32mp255-lvds".
A prior discussion on this subject has been raised on my V1 of HDP 
involving Krzysztof and Alexandre :
https://lore.kernel.org/all/418a80a9-8c08-4dd1-bf49-1bd7378321aa@kernel.org/

> +		#clock-cells = <0>;
> +		reg = <0x48060000 0x2000>;
> +		clocks = <&rcc CK_BUS_LVDS>, <&rcc CK_KER_LVDSPHY>;
> +		clock-names = "pclk", "ref";
> +		resets = <&rcc LVDS_R>;
> +		access-controllers = <&rifsc 84>;
> +		power-domains = <&CLUSTER_PD>;
> +		status = "disabled";
> +	};
> +
>   	vdec: vdec@480d0000 {
>   		compatible = "st,stm32mp25-vdec";
>   		reg = <0x480d0000 0x3c8>;
> 

Best regards,
Clément

