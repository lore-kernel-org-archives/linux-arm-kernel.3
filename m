Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315D8CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twVR4aLcjBcIxVR1vTBIjLNrHaf5X700fq4KHmsJOG0=; b=0DQ1pscu7W+DLp5U/DG4LBEHPR
	YdSNs71QYoEiZocrG3gtrlgMLIM7r2bcuewpggECX2e86ybNSs7tA9h7vQ5rCfO1iYWvKGFok4fsk
	GlwpI5yWrkWayVDUtEjxrGi/P6BtrTqIJvubBzhJwGEhpWoffdCueJTzS0Uo+NLTeXDrAGUkunLYz
	1yjYQTA9uIQ4z2Q7DgqCmlXKuK8rJuj+yOhQUO3ClC2pIZrXFM9G6ZKaz4mAKr7rKPLwNEFlR3Uws
	hLySG8jlazZ8fY+Cry6+JkvOYEZjMK85F03VVHUMSyp7ryMoMQ0ZXw+H6ySV+ltJ6I0azQpigx3fK
	ZPrX1EqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphkd-00000003x6m-2406;
	Sat, 23 Aug 2025 06:29:19 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upR6N-00000002WOR-2sR9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 12:42:41 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MAlQTX029436;
	Fri, 22 Aug 2025 14:42:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	twVR4aLcjBcIxVR1vTBIjLNrHaf5X700fq4KHmsJOG0=; b=DWOSEnndEyapOE0z
	yWh2HktcvWlWZHVAPSNECRWV9xXMgfYF7sqZT8Z2rsta6lW0rXJw8LNtyBfBr88I
	EjmcFYbHkTQo1adZ3IoFV9EbKceqAGe/Is5mk+s+UtPf1Ul4dnJ7R4gX8CLtAUaz
	6D3xgF49WDwaxSKr1YsRUa1iAjNXnrMaaAk1UymjBCxqK7L+cIk/m2IDKOzMD/nR
	t3xoV8acdLP+gFoBMdoEuih82fSSX6v+FFgzkvFqkDrPrrFr1mRGnwWl9n3s+Pnc
	EokqKutOd6JyCkITN1c4i1AomgidgH6dX8ZFXPjoyKmFMFc/d9aecxFkeBwuf4Rh
	33Q5/A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48np7n7656-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 14:42:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3126F4004A;
	Fri, 22 Aug 2025 14:41:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DC5F71CEE0;
	Fri, 22 Aug 2025 14:40:14 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 14:40:13 +0200
Message-ID: <e2a69447-a34c-4e2e-9bbc-3975b9ef08b7@foss.st.com>
Date: Fri, 22 Aug 2025 14:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/13] dt-bindings: display: st,stm32-ltdc: add
 access-controllers property
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
 <20250821-drm-misc-next-v4-2-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-2-7060500f8fd3@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_054239_987690_53DB1FCD 
X-CRM114-Status: GOOD (  14.36  )
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


Le 21/08/2025 à 13:08, Raphael Gallais-Pou a écrit :
> access-controllers is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
>
> This property is added when the peripheral is under the STM32 firewall
> controller.  It allows an accurate representation of the hardware, where
> the peripheral is connected to a firewall bus.  The firewall can then check
> the peripheral accesses before allowing its device to probe.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> index bcedcfef5427f5725a0473c09628e70d172c8f58..e27347acee5dacf56cb3971d4b62c34dfc64d7e2 100644
> --- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> +++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> @@ -41,6 +41,9 @@ properties:
>     resets:
>       maxItems: 1
>   
> +  access-controllers:
> +    maxItems: 1
> +
>     port:
>       $ref: /schemas/graph.yaml#/properties/port
>       description: |
>

