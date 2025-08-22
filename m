Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8B9CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBUcXlxzscyorCoaJ9iJ2kd5UTgHKRJLd4Iov/cXDBI=; b=4d4unwvqNGCaxW4vzECDEdoHKG
	57Buwo1FJVczM4F33EKAnSIuCSLU73pWjCmyavfCpFGqj9uURwDvhgSLdpF4GZAs2L0P2O5OuGlpx
	d7T855u3mDcFPrXH425mW+EXgRok57GbgkW9GmeKI3PVnO+3N22thVqYUISJp3L/3NTHS71LZUPA7
	sPw4G1pdFbjwAHbTaSSJa6bWu8H4zwNr3NhCsH8VXhVWXSpkOm4uGy46PXEzDiDeHAAvJWk8cBd+n
	2ZKMYZinz9KI2S3H/LI5yjU2JqkPR7wjorOQeccaVtETyV2atI/Wdoza3YyLORjJ5+/M1W/xpFjDZ
	gD7khOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphl3-00000003xca-1eQB;
	Sat, 23 Aug 2025 06:29:45 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRCx-00000002XS4-2tLH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 12:49:29 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCkkEZ009011;
	Fri, 22 Aug 2025 14:49:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	BBUcXlxzscyorCoaJ9iJ2kd5UTgHKRJLd4Iov/cXDBI=; b=dRbXqxYFHYZu0NTY
	BCOn6XSFf1YRiKYIGJnepLQpmrq2iyKf65fxTTXn3aH5Nbqc+k/14vp1sLsJyMwe
	ArTs1NeZShJYPrcuVExX22ntyt7ztOQ+4MhjL0z/Q1/n+l6GRtadpTlUfbKyuTZz
	ptr0qVOL3Z2+WiPS6hKrrCIhJLVzohLYDuc/Dpw2+n6+Fj8V7sKFQmqvsvPwk6nn
	z8IOq6SPx/8GWvdMzq3XNzhEmxVQwNzxwuMRaiDpuNBLMzDevzud4FKnSA5BWjJz
	H2hCyxdQjRisapgF+YuRvw+B72ydhRJ2RBTS+sU1MSb94ewt3U46kIMSKn2gqUJ1
	Ce3V5A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48nj3v87d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 14:49:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EE9284004B;
	Fri, 22 Aug 2025 14:47:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9057A71CEF9;
	Fri, 22 Aug 2025 14:46:52 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 14:46:51 +0200
Message-ID: <ee21d95d-31fe-40e8-ab89-06ce3a44b4bb@foss.st.com>
Date: Fri, 22 Aug 2025 14:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/13] dt-bindings: display: st,stm32mp25-lvds: add
 power-domains property
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
 <20250821-drm-misc-next-v4-5-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-5-7060500f8fd3@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_054928_070572_4D4704BA 
X-CRM114-Status: GOOD (  11.54  )
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
> STM32 LVDS peripheral may be in a power domain.  Allow an optional
> single 'power-domains' entry for STM32 LVDS devices.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
> index 05a73bbc246a8994b6aabf7c2cd9dca773232be4..14e042156179cb2f2d906422eaff6840da3c91ea 100644
> --- a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
> @@ -62,6 +62,9 @@ properties:
>     access-controllers:
>       maxItems: 1
>   
> +  power-domains:
> +    maxItems: 1
> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
>

