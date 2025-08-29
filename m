Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23B5C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 07:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhcK0scHrUQ3RL614dPfgdhZHypbITDDP2rh3ct8h8g=; b=PZ8NtplLc08w+O00fNmeb+1g9T
	abHVetiGNpXnmaB5WfieLv3aI7GbXmRSfhgZLPh/lVc9WocupUDeRf6Cja8vTEyPdbLfI2r+DjKrM
	4Ns1HwkRJBsgFQYGnhgCnXpc8PgamMNxJan/p98x6rzptgidDhO+yKB+v+wReTsv8vtESwEG+rqqu
	FHsImPWFcRnXW33O/sOeBo62j0scDCJ0NasVFcGj8qZnSaYDyk86Lv1UpUoOgYVcR7DbMMQCnlJFA
	pwFAiKhaTo9OpPHbotURepc3sQIv48Y1gOSNm94grvmmtNwJBw54fWKTKYGEdi0wQHvIic2JP3ReW
	+X8MStTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtaG-00000004mBv-0NYZ;
	Fri, 29 Aug 2025 07:31:40 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtIn-00000004jaJ-0jnb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 07:13:38 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T6Z2OX006185;
	Fri, 29 Aug 2025 09:13:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	FhcK0scHrUQ3RL614dPfgdhZHypbITDDP2rh3ct8h8g=; b=wre0eaCF/stQW3SM
	IXnc9GdY8oSHGeQCwzMi/BEDywKGeIRsKsYFS/rgG/rPbqe8um//+qKxxYBXnuKk
	Jb/ZYDepR18DmvI2ufrJUYgPkC331LdN6w0cEK0Z/PoNDAXDuND7K+N4UbxUiVoz
	HqFrbB66P90/7spdVO+cQcIVRKkhx8ErvQuELXjadb4kPZpX9AYYIPHnnX0g1Ho6
	RZ4hDg4e/pOEKtCDqpWLi9BKjYJxG8ZoGbGpgf7MOXOd6P4m1tOTXKI66ce8dY1D
	cMCkR7/jMvNo5GEH9BsnAiiw89POzUqRr2MjELOYGEPgf96W1kUKLpWgmPzD9uz4
	UGP0Kw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48qrkmw7e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 09:13:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4830E40049;
	Fri, 29 Aug 2025 09:11:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1AC0A78EEA9;
	Fri, 29 Aug 2025 09:10:52 +0200 (CEST)
Received: from [10.252.3.130] (10.252.3.130) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 29 Aug
 2025 09:10:50 +0200
Message-ID: <9d3499b0-be86-4152-ab28-37de81d850a4@foss.st.com>
Date: Fri, 29 Aug 2025 09:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/13] Enable display support for STM32MP25
To: Philippe CORNU <philippe.cornu@foss.st.com>,
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
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
 <4f0d417a-3a57-5ed7-9bbb-758679a9625d@foss.st.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <4f0d417a-3a57-5ed7-9bbb-758679a9625d@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.3.130]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_001337_471459_B17A2C52 
X-CRM114-Status: GOOD (  24.72  )
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



On 8/28/25 17:27, Philippe CORNU wrote:
>
>
> On 8/22/25 16:34, Raphael Gallais-Pou wrote:
>> This series aims to add and enable sufficient LVDS display support for
>> STM32MP257F-EV1 board.
>>
>> LVDS is the default use case to drive a display panel on STM32MP257F-EV,
>> even though DSI panels will be supported in the near future.
>>
>> The LTDC needs a pixel rate in sync with the bridge currently in use.
>> For that both DSI and LVDS bridges need to declare an internal clock and
>> become clock provider to the mux. The mux then selects the reference
>> clock for the LTDC pixel rate generation.
>>
>> For now this mux is handled internally in the LTDC, while waiting for
>> the STM32 clock framework to merge a 'clk-mux' based on the SYSCFG.
>> This explains the link done in the patch [7/8] between the LVDS,
>> providing the reference clock for the LTDC internals.
>>
>>    +----------+              |\
>>    |  DSI PHY |------------->| \           +------------+
>>    |          |ck_dsi_phy    |  |          |            |
>>    +----------+              |  |--------->|    LTDC    |
>>    +----------+              |  |pixel_clk |            |
>>    | LVDS PHY |------------->|  |          +------------+
>>    |          |clk_pix_lvds  |  |
>>    +----------+              |  |
>>                              |  |
>>     ck_ker_ltdc ------------>| /
>>                              |/|
>>                                └- SYSCFG
>>
>> Clock selection applies as follow:
>> - 0b00: Selects ck_dsi_phy
>> - 0b01: Selects clk_pix_lvds
>> - 0b10: Selects ck_ker_ltdc (for parallel or DSI display).
>> - 0b11: Reserved
>>
>> The reset value of the register controlling the mux is 0b01, meaning
>> that the default clock assigned is the clk_pix_lvds.  This causes two
>> things:
>>
>> - In order to get basic display on the LVDS encoder, like intended,
>> nothing has to be done on this mux within the LTDC driver (which for now
>> explains the unused syscfg phandle on the LTDC node in the device-tree).
>>
>> - 'pixel_clk' is dependent from 'clk_pix_lvds' because of the LTDC clock
>> domains.  They also need to be sync to get a coherent pixel rate though
>> the display clock tree (which explains the LVDS phandle on the LTDC node
>> in the device-tree).
>>
>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>> ---
>> Changes in v5:
>> - Documentation:
>>    - LTDC: Clamp correctly min/maxItems value (again)
>> - Add Yannick's trailers where relevant except in patch [01/13] which
>>    has been modified
>> - Link to v4:
>> https://lore.kernel.org/r/20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com
>>
>> Changes in v4:
>> - Documentation:
>>    - LTDC: Add "st,stm32mp255-ltdc" compatible.  After internal
>>      discussion, we came to the solution that the LTDC on STM32MP255 SoC
>>      needs its own compatible, since it does have the same amount of
>>      clocks than on STM32MP251 SoC.
>> - Devicetree:
>>    - Add "st,stm32mp255" compatible on corresponding dtsi
>> - Drivers:
>>    - LTDC: Handle "st,stm32mp255" compatible
>> - Remove Rob's r-b from patch [01/13] since it was modified.
>> - Link to v3:
>> https://lore.kernel.org/r/20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com
>>
>> Changes in v3:
>> - Rebased on latest drm-misc-next
>> - Documentation:
>>    - LTDC: Clamp correctly min/maxItems value
>>    - LVDS: Remove second 'items' keyword
>> - Add Krzysztof's trailer where relevant
>> - Link to v2:
>> https://lore.kernel.org/r/20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com
>>
>> Changes in v2:
>> - Documentation:
>>    - Add support for new compatible "st,stm32mp255-lvds"
>>    - Change LTDC compatible for SoC compliant one
>>    - Make clearer LTDC clock-names property
>> - Devicetree:
>>    - Change compatible according to the documentation
>>    - Change clock and clock-names order to match documentation (and avoid
>>      warnings)
>> - Drivers:
>>    - Change LTDC compatible
>> - Add Rob's trailer where relevant
>> - Link to v1:
>> https://lore.kernel.org/r/20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com
>>
>> ---
>> Raphael Gallais-Pou (11):
>>        dt-bindings: display: st: add two new compatibles to LTDC device
>>        dt-bindings: display: st,stm32-ltdc: add access-controllers property
>>        dt-bindings: display: st: add new compatible to LVDS device
>>        dt-bindings: display: st,stm32mp25-lvds: add access-controllers property
>>        dt-bindings: display: st,stm32mp25-lvds: add power-domains property
>>        dt-bindings: arm: stm32: add required #clock-cells property
>>        arm64: dts: st: add ltdc support on stm32mp251
>>        arm64: dts: st: add ltdc support on stm32mp255
>>        arm64: dts: st: add lvds support on stm32mp255
>>        arm64: dts: st: add clock-cells to syscfg node on stm32mp251
>>        arm64: dts: st: enable display support on stm32mp257f-ev1 board
>>
>> Yannick Fertre (2):
>>        drm/stm: ltdc: support new hardware version for STM32MP25 SoC
>>        drm/stm: ltdc: handle lvds pixel clock
>>
>>   .../bindings/arm/stm32/st,stm32-syscon.yaml        | 31 ++++++---
>>   .../devicetree/bindings/display/st,stm32-ltdc.yaml | 55 ++++++++++++++-
>>   .../bindings/display/st,stm32mp25-lvds.yaml        | 13 +++-
>>   arch/arm64/boot/dts/st/stm32mp251.dtsi             | 19 ++++++
>>   arch/arm64/boot/dts/st/stm32mp255.dtsi             | 20 +++++-
>>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         | 79 ++++++++++++++++++++++
>>   drivers/gpu/drm/stm/drv.c                          | 12 +++-
>>   drivers/gpu/drm/stm/ltdc.c                         | 58 +++++++++++++++-
>>   drivers/gpu/drm/stm/ltdc.h                         |  6 ++
>>   9 files changed, 275 insertions(+), 18 deletions(-)
>> ---
>> base-commit: c8cea4371e5eca30cda8660aabb337747dabc51d
>> change-id: 20250617-drm-misc-next-4af406c1c45f
>>
>> Best regards,
>
> Hi Raphael,
> Thank you for these great patches.
>
> If you agree, I think you can merge 01-08 in misc.

Hi Philippe,

Applied patches [01/13] -> [08/13] on drm-misc-next.

Thanks,
Best regards,
Raphaël
>
> Best regards
> Philippe :-)


