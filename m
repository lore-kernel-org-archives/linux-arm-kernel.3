Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624D8CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4pYdqJuAzYUBYGLZvAHsnWM97Hp3xHmy6gGSOZhTl0=; b=Hwj/sdXVJSzBZEdoez2/mBTU8e
	DoiPdY3WOpKavLGtkWotLWdgep/ONaIzmzhRFyYwlKlZays+rBu1i1C3xZpsVh6j4QmZ9xhVfsY5V
	EVe8c4UIhVgYWnHiAxSGlnAtGZGMqE+6mm7cMZyi93JCO/OECXNWWtA7rciNC1xYPvdSXAltU0BYo
	oe0pCjW2K6kbPpJfS23jme8BYwfEh15ajZrwoNtmf0vXce9g3zuCgjsE6trzUwKY1IBtqbS5Bowcq
	F7DKVaHa6lGnrLbqccqhIGP0z0XblFfJdm/tXxb0FHtEf60CTK4Jc9Xna8dhf/8S4x12OuhgRjYS3
	YrekOu7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphlt-00000003ywY-0XoA;
	Sat, 23 Aug 2025 06:30:37 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRY8-00000002aXa-47do
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:11:22 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCCaeX015941;
	Fri, 22 Aug 2025 15:11:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	B4pYdqJuAzYUBYGLZvAHsnWM97Hp3xHmy6gGSOZhTl0=; b=sm++KblT0vJdhu/X
	xpsgsy8lD9wXrhreSVLSBAtXvdBHIfmWKkBS1wuwTe/6PWel5AzEmcLpZMJOAqIP
	lkY1KdnfrzieOgZ09ggEIaWPSdc+TyLimjZjQOq51CN0mfaRzSVtCo+0mE0jB2Xs
	F1bAPglIEIb8MCDtEsyc0DhTZpbtvPvRhb8f+D7jOUS7uF4FwBnaTbXfF8GVt624
	EMgwNxTea9UynQvLx1X+5dfZJmfOfAaahFe3JHRvnAv1mU5Es9shzQdG9LEXMDLh
	Rd789ZhVXr9hQFyCZLJfnHZvj1gmlEH/8blMCP4z+P8JF2lnGlS2RG3jTUT+qBDZ
	uX+evw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n70dk7g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 15:11:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5460840050;
	Fri, 22 Aug 2025 15:09:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 975616CA48F;
	Fri, 22 Aug 2025 15:08:58 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 15:08:57 +0200
Message-ID: <44b7b47d-a42c-499d-a760-f34d2740ff8c@foss.st.com>
Date: Fri, 22 Aug 2025 15:08:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] arm64: dts: st: add lvds support on stm32mp255
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
 <20250821-drm-misc-next-v4-11-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-11-7060500f8fd3@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_061121_321332_0E20E53C 
X-CRM114-Status: GOOD (  14.78  )
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
> The LVDS is used on STM32MP2 as a display interface.
>
> Add the LVDS node.
>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp255.dtsi | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
> index 48a95af1741c42300195b753b710e714abc60d96..433a0aabe72e5a449ec03fb984a8684c5d5d75a2 100644
> --- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
> @@ -12,6 +12,18 @@ &ltdc {
>   };
>   
>   &rifsc {
> +	lvds: lvds@48060000 {
> +		compatible = "st,stm32mp255-lvds", "st,stm32mp25-lvds";
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
> @@ -28,4 +40,4 @@ venc: venc@480e0000 {
>   		clocks = <&rcc CK_BUS_VENC>;
>   		access-controllers = <&rifsc 90>;
>   	};
> -};
> \ No newline at end of file
> +};
>

