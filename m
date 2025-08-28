Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3255FC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zf8R4cRAPWNdmfhyp97wma8/1c9gyToPc7q5r6rl40Y=; b=1rt8+C6C53jmO1NRtcD7O0UC5w
	c4Mni2UKgkG+lO2s4Jvg15iQalXiB/yiRGFhog/GdiKx8m0pQlqTU2Lm/rqS0G7d1Mc5sXdiiM+9i
	i+tdqcUw5jAh+DJkKSM7SFoV6AkU6N9nQwqrtkLxhC9UmpeO540BnfXfz2+uVQzEAEsmwUMRAALhS
	VDt+GqjaMiZXCew4vT8TKXZ/WukiWr/Zg0CEEUPfWx2Olh51Yu+aVEEHUkhmuFFZgMWMwVyRF2fsM
	NPJStvdmZ4E2kP5WMEpZAG8JFyKgtGXsVabv/QV5aJTIknBeWV26wmgyspAZQ+CqphjyozVXLA6xY
	I2D1IB/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhkn-00000002sIJ-3YLo;
	Thu, 28 Aug 2025 18:53:45 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urd6A-00000001nrV-0I4t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:55:31 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SDVqW3002446;
	Thu, 28 Aug 2025 15:55:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zf8R4cRAPWNdmfhyp97wma8/1c9gyToPc7q5r6rl40Y=; b=EVO/iMIX7GfAEX00
	p5TgoxK0mGcrLe0wu60+tA4ZQgYiKonSW4Wz4Nr59A+uqiR40ZJ7ZbJuE5HNDvEd
	Ut4HfHX7vz7SQYUeJc/gNTDjPOL1F8a7bNM9qiNzPpjcRRGevujK/3FtIiHJLP8Q
	kN0aHW3DNCcbJN9TGyQcbssqWEieiP8O58sZ1hz/Y9Iy81cdAo//8RIqFW09V0m1
	nwCM2vnSRfT2p5EkNOxzRLdD6xLd4n7uIScurMP+fqNbMNvOzs8qhTAkTowHU6P+
	kGOWddfmoe67rnkPqgvkoTvGVvGHbfsK6uDAMNbX20IQziu7OC1mD44UktFpTtly
	ebJAVg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48qq74b366-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 15:55:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E87B240045;
	Thu, 28 Aug 2025 15:53:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D247D74F6CE;
	Thu, 28 Aug 2025 15:52:59 +0200 (CEST)
Received: from [10.48.86.145] (10.48.86.145) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 28 Aug
 2025 15:52:58 +0200
Message-ID: <de0c6b86-a26a-f5eb-03e5-e2a4983cc326@foss.st.com>
Date: Thu, 28 Aug 2025 15:52:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 07/13] drm/stm: ltdc: support new hardware version for
 STM32MP25 SoC
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Yannick Fertre
	<yannick.fertre@foss.st.com>,
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
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
 <20250822-drm-misc-next-v5-7-9c825e28f733@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20250822-drm-misc-next-v5-7-9c825e28f733@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.145]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_065530_400544_C82E3581 
X-CRM114-Status: GOOD (  11.51  )
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



On 8/22/25 16:34, Raphael Gallais-Pou wrote:
> From: Yannick Fertre <yannick.fertre@foss.st.com>
> 
> STM32MP25 SoC features a new version of the LTDC IP.  Add its compatible
> to the list of device to probe and implement its quirks.
> 
> This hardware supports a pad frequency of 150MHz and a peripheral bus
> clock.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   drivers/gpu/drm/stm/drv.c  | 12 +++++++++++-
>   drivers/gpu/drm/stm/ltdc.c | 38 +++++++++++++++++++++++++++++++++++---
>   drivers/gpu/drm/stm/ltdc.h |  5 +++++
>   3 files changed, 51 insertions(+), 4 deletions(-)

Hi Raphael,

Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>

Thank you
Philippe :-)

