Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44914CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 07:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2JiistMyWguTBCrYhx2X5NLWE9VMsmLtXvQuA0ebsM=; b=0H28rp55Cisb467Xy/cniH7voT
	De9BORW6YFAPNG/fKvHrSoG1cwgWAleeSPwE0BkU/3f36MI/iapZO8dzZZzC15t2iPuhIe1nrIv7b
	PFe2pdXa3ybmnV4cbQiNy3Ye36aZM0QCENFcdP63ftHKYGC4TpDQCLFg2QPKguytCLKs8TFiduZ4I
	LHUvZAXi8n8nw0ApQswTJo0T20MarG+3zGD9RhUM/xkq/sLokPIhLh+Q77DrxaW9Uo064pt2SK/50
	RCy/3TCpskQxHh6HKTlsuYdEKPjCrWTKY5RVH+9qYeIe+H03VoV/6fBo6a20GJCNOEUt47zUxCjZr
	Y7MrYsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodWC-0000000CdMa-48gC;
	Wed, 20 Aug 2025 07:46:00 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodRn-0000000Ccvm-1lAf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 07:41:28 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K6jL1B023265;
	Wed, 20 Aug 2025 09:41:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	b2JiistMyWguTBCrYhx2X5NLWE9VMsmLtXvQuA0ebsM=; b=dOhWmhU1/fCHbDHB
	W0nRFLN7IrrAhIGH009ygWfyKYl4MYgCfhjmyVhajF2YyJk3byfpovKNv1TDgiXr
	8G70EHtq2IYZv6IoA844TPnUNUxieaGFq4B2NPUCFQ1oq3Lr82/+tDKtwV9dzw1x
	oIfMIm/tUJy3DRgK51cgEXoy9hpSLjyOlAA9a2dALcBYFaPo+nOsoYrtrmiHu8kZ
	SoruMBQBgysA9apOTNuNP9xk09NM4V3oBbB4YSFuQsuiLE5Bi39ag+Ek3CfF9K3u
	D3RljfLoEgPMydcdt0QvAqCyWuEHOv9J8nDWlC+rw9GMDMlK1GZgcq/bpzEL1B8n
	Kh1NSw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n6uj8us5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:41:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0064B40045;
	Wed, 20 Aug 2025 09:39:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F49C52E39B;
	Wed, 20 Aug 2025 09:38:50 +0200 (CEST)
Received: from [10.252.7.99] (10.252.7.99) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 09:38:49 +0200
Message-ID: <ff91b42e-be8d-4147-b489-c9938a4ab344@foss.st.com>
Date: Wed, 20 Aug 2025 09:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] dt-bindings: display: st: add new compatible to
 LTDC device
To: Rob Herring <robh@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        David Airlie <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Simona Vetter <simona@ffwll.ch>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        <linux-kernel@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        <devicetree@vger.kernel.org>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com>
 <175560127037.3969097.6130940505156039734.robh@kernel.org>
 <e144225c-e0e6-4d3e-a4d8-e4c48cdef3f6@foss.st.com>
 <20250819135851.GA115029-robh@kernel.org>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250819135851.GA115029-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.7.99]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_004127_714669_1656E804 
X-CRM114-Status: GOOD (  15.48  )
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



On 8/19/25 15:58, Rob Herring wrote:
> On Tue, Aug 19, 2025 at 03:17:46PM +0200, Raphael Gallais-Pou wrote:
>>
>> On 8/19/25 13:01, Rob Herring (Arm) wrote:
>>> On Tue, 19 Aug 2025 11:15:54 +0200, Raphael Gallais-Pou wrote:
>>>> The new STMicroelectronics SoC features a display controller similar to
>>>> the one used in previous SoCs.  Because there is additional registers,
>>>> it is incompatible with existing IPs.
>>>>
>>>> Add the new name to the list of compatible string.
>>>>
>>>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>>>> ---
>>>>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 30 ++++++++++++++++++++--
>>>>  1 file changed, 28 insertions(+), 2 deletions(-)
>> Hi Rob,
>>
>> It seems several patches of this series triggered your bot without
>> warnings/errors messages.
>>
>> Did I missed something or is it just a glitch in the matrix ? :)
> 'make dt_binding_check' is broken in linux-next which is used if the 
> base commit is not specified or not found. The latter was the case here. 
> Should be fixed in tomorrow's linux-next.

Indeed, I am based on latest drm-misc-next, which explains the not found base
commit.

Thanks for this info

Raphaël
>
> Rob


