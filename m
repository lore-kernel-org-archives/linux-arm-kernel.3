Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAEECA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 18:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UlTu2YpLab0/pa6q4pnPYbb7UfqHxugcQ+IeQKpoe8=; b=J26hWRi/aJg5/xnEo6hBcbcp0Z
	r+7sgc32tR07X/uSHIrdsc+4QYN+DXZOSz2YKt6tC+w8xo9tjCkkqB1KGXePHQO2jR4Z4tkejK81V
	CFBmvllKNTgt0+WItrB4VBPoIbDEEXGBesNdgULbMZ/WO12Uk1BiL9CmMw8VmEG+Z61ujuooUbaFM
	rfsSD8LeziiH+fYDX5oeJKF/buiCY7lO8LQ89Ofr/0o/cHWDaxMTYkQlhQpu8vK7Mr6K5DY6DvKir
	t1LOwLvvtEVGY/rljBHfHseRdFF0zcK2RnCk5KB0xBKXk0TO2v2Ld9h+zkC8hAebQYAtZ5k14TJ2N
	BiLtH4tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uts0P-00000007Gst-06QO;
	Wed, 03 Sep 2025 18:14:49 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uto0R-00000006fRx-04YD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:58:36 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BRm9D016232;
	Wed, 3 Sep 2025 15:58:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	4UlTu2YpLab0/pa6q4pnPYbb7UfqHxugcQ+IeQKpoe8=; b=dv+aGAmrdVz2+GR7
	WbDwiJvebx2c1PJDxXNLuofMlIPs+uPWjzRncV3nJtg529P2gJ38/DUXZI5R9qSl
	q8xEuxTcsC9GTw6bAT8OWdgHd3mqQU6mCLGHVvl0PL58yezEUoff4wlMfedUl7GQ
	vC/SuSvFwhMjOZFIc1uHi8dyse+ZOpaGzp5Pa4DJNAQ1vdb0tKxq0S0/pWyKN15W
	pyt+LdVjNuT6NCU6m/f5aKVTgN1ywevniL28nsQgnW/MkdlHiL+O1bqP5fR9QXOL
	nb44vr2wn/jF/Z5r9DgZBr9Qg9YoPCRFChnxVQnDZ+wpd34L4sO44ppHbMbvgcad
	k+rH0g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48ur6frr2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 44DEE40048;
	Wed,  3 Sep 2025 15:57:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64962399931;
	Wed,  3 Sep 2025 15:56:57 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 15:56:56 +0200
Message-ID: <66a94f4b-2efa-4671-9668-71995a9c1ac4@foss.st.com>
Date: Wed, 3 Sep 2025 15:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 0/5] STM32 pinctrl: Add mux function RSVD
To: Antonio Borneo <antonio.borneo@foss.st.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Fabien Dessenne
	<fabien.dessenne@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250610152309.299438-1-antonio.borneo@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_065835_322065_77C34A10 
X-CRM114-Status: GOOD (  13.73  )
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

Ciao Antonio

On 6/10/25 17:23, Antonio Borneo wrote:
> This v2 is a subset of the v1, split-out to simplify the review.
> 
> This subset:
> - introduces the pinctrl mux function RSVD,
> - adds two use cases requiring RSVD,
> - minor re-format of the dt-bindings.
> 
> Changes v1 -> v2 subset:
> - rebased on v6.16-rc1,
> - added use cases of the new mux function RSVD,
> - added Reviewed-by: on 2/5 (former 04/14 in v1),
> - added commit to re-format the dt-bindings,
> - Link to v1: https://lore.kernel.org/lkml/20241022155658.1647350-1-antonio.borneo@foss.st.com/
> 
> 
> Antonio Borneo (3):
>    ARM: dts: stm32: Add pinmux for CM4 leds pins
>    ARM: dts: stm32: Add leds for CM4 on stm32mp15xx-ed1 and
>      stm32mp15xx-dkx
>    dt-bindings: pinctrl: stm32: Add missing blank lines
> 
> Fabien Dessenne (2):
>    pinctrl: stm32: Handle RSVD pin configuration
>    dt-bindings: pinctrl: stm32: Add RSVD mux function
> 
>   .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 25 +++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   | 14 +++++++++++
>   arch/arm/boot/dts/st/stm32mp157c-ed1.dts      |  2 ++
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi     |  2 ++
>   drivers/pinctrl/stm32/pinctrl-stm32.c         |  9 +++++++
>   drivers/pinctrl/stm32/pinctrl-stm32.h         |  3 ++-
>   include/dt-bindings/pinctrl/stm32-pinfunc.h   |  1 +
>   7 files changed, 55 insertions(+), 1 deletion(-)
> 
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

DT patches applied on stm32-next.

Thanks!!
Alex

