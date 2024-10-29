Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94226D3A679
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkDktSYrjXNPZMAtxoSkcXW+d4aBH8F1X5a432npQX8=; b=bN+omuIRE57QTqqoD0U+VNFCQd
	2u1TJ5IW5b8uT1hBCAVnP5s0SWWQOStuP4ZZho5cHBDOSvOmmyH1wxzYdwn4IVP0tudCB9LkuWHgu
	LGiUi1Mx2jLqe2gMLtZhMLEeI6LLMUNCcO5ZU746BDSBswq+/m9SYMCt386HweZnWzqFa0ENZdnX4
	VBbz0b6PqZUNSy5ygzoQbcOY3TnQub8XXfyVIHF527ePRbK55BEVVsLRJR1Qj88CeWb7bIW3U5wTg
	BjZgKhYJscp5Wjk/G3kTEnS4PVGICOeBlTmb3HIqf52myUxOFYL+SDfv+ERSDPs+2U8TZF7bRkeob
	cocHuzaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5q9k-0000000FJ5H-2Aa1;
	Tue, 29 Oct 2024 17:37:24 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ooR-0000000F4gB-1kun
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:11:21 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TCDCcJ003448;
	Tue, 29 Oct 2024 17:11:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	MkDktSYrjXNPZMAtxoSkcXW+d4aBH8F1X5a432npQX8=; b=V3PYjkVLwMqzXB4l
	CS/mON3AaOAapVnS8zQmnPVjM8PM41HaPZhQEr/F7k/lLm57SdoOUf2BS4lN3PRc
	Iu/owBTh0qL7ljgwinFl3hWtRdX7v/3ezMfe3HA9n008mD6Z1NkWHAvxSs0OiZ5a
	aWW/usqEB9fVMehHEZ9UUY+NFXzjAuGjN5io+tTzFBH9nqkCGw/oVoPTTOM2jqzw
	ZfPxcJ0VEEMY77vT3ONE7V7yQdszow1ZvxpaF0pxfZwWBw5Nj/amT/PTuUko4xWT
	kDJbaftv2kJFX24ob+StWReNIA3aMx4wkBPSjQhnri8o4MklCG0eczaO/K1zOsS/
	O8MLyg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42ha00w283-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 17:11:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B122B40049;
	Tue, 29 Oct 2024 17:10:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 061332649E7;
	Tue, 29 Oct 2024 17:09:26 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 29 Oct
 2024 17:09:25 +0100
Message-ID: <f091f532-f6b0-429c-9fde-c952c9c26382@foss.st.com>
Date: Tue, 29 Oct 2024 17:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] STM32 DMA3 updates for STM32MP25
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <dmaengine@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20241016-dma3-mp25-updates-v3-0-8311fe6f228d@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241016-dma3-mp25-updates-v3-0-8311fe6f228d@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_091119_793430_F5DFA76A 
X-CRM114-Status: GOOD (  17.73  )
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

Hi

On 10/16/24 14:39, Amelie Delaunay wrote:
> The HW version of STM32 DMA3 inside STM32MP25 requires some tunings to
> meet the needs of the interconnect. This series adds the linked list
> refactoring feature to have optimal performance when addressing the
> memory, and it adds the use of two new bits in the third cell specifying
> the DMA transfer requirements:
> - bit[16] to prevent packing/unpacking mode to avoid bytes loss in case
> of interrupting an ongoing transfer (e.g. UART RX),
> - bit[17] to prevent linked-list refactoring because some peripherals
> (e.g. FMC ECC) require a one-shot transfer, they trigger the DMA only
> once.
> It also adds platform data to clamp the burst length on AXI port,
> especially when it is interconnected to AXI3 bus, such as on STM32MP25.
> Finally this series also contains STM32MP25 device tree updates, to add
> DMA support on SPI, I2C, UART and apply the tunings introduced.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
> Changes in v3:
> - Refine commit description of patch 4 about preventing
>    additionnal transfers, as per Rob's suggestion.
> - Link to v2: https://lore.kernel.org/r/20241015-dma3-mp25-updates-v2-0-b63e21556ec8@foss.st.com
> 
> Changes in v2:
> - Reword commit title/message/content of patch 4 about preventing
>    additionnal transfers, as per Rob's suggestion
> - Rework AXI maximum burst length management using SoC specific
>    compatible, as pointed out by Rob
> - Drop former patches 6 and 8, which are no longer relevant
> - Link to v1: https://lore.kernel.org/r/20241010-dma3-mp25-updates-v1-0-adf0633981ea@foss.st.com
> 
> ---
> Amelie Delaunay (9):
>        dt-bindings: dma: stm32-dma3: prevent packing/unpacking mode
>        dmaengine: stm32-dma3: prevent pack/unpack thanks to DT configuration
>        dmaengine: stm32-dma3: refactor HW linked-list to optimize memory accesses
>        dt-bindings: dma: stm32-dma3: prevent additional transfers
>        dmaengine: stm32-dma3: prevent LL refactoring thanks to DT configuration
>        dmaengine: stm32-dma3: clamp AXI burst using match data
>        arm64: dts: st: add DMA support on U(S)ART instances of stm32mp25
>        arm64: dts: st: add DMA support on I2C instances of stm32mp25
>        arm64: dts: st: add DMA support on SPI instances of stm32mp25
> 

Patches [7], [8], and [9] applied on stm32-next.

Thanks
Alex



>   .../bindings/dma/stm32/st,stm32-dma3.yaml          |   6 ++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi             |  75 +++++++++++++
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |   2 +
>   drivers/dma/stm32/stm32-dma3.c                     | 119 +++++++++++++++++----
>   4 files changed, 182 insertions(+), 20 deletions(-)
> ---
> base-commit: 76355c25e4f71ee4667ebaadd9faf8ec29d18f23
> change-id: 20241015-dma3-mp25-updates-d7f26753b0dd
> 
> Best regards,

