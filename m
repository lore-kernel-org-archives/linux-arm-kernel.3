Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8DDC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMNXiGVHT3EYByl9G4cAVqtYt7CJdPa0zfJuctou39g=; b=KAAP5E8EFNHiD3Hgyx5TVp0C+6
	y5u/s4Pzh2hl88Q1b9809OQ0YyGhOTb7A2ENhvamAb2O25HK6hOW+oMOkdFK3/oIdyhla6gw4d3N/
	NybHTBBkSaKZCpHe89AxQDlVWIwC+sIA5ZpTO9UkxQNL8fS6BlWCmx6iCL145ZKe9lhlJmdjHvOFF
	al1S/48bxZAkJ9GMqgx/J7QMBVJZHGWrxlP2dfvuYrOAXewy3Af+52aSyMd9pRw7R5Mq1z8Gp2nS1
	NfB4OYaKhFmnm/Vevs0agDKcPp31nuSqShMmk3o2tc6r7Mz2jd1EnlBswKvPAhiSPQbWUQpVarfhw
	yBxmY8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA22o-0000000C1Lw-1YLV;
	Wed, 30 Apr 2025 07:39:50 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1oa-0000000Byop-1vl8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:25:09 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLZWv9026619;
	Wed, 30 Apr 2025 09:24:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	mMNXiGVHT3EYByl9G4cAVqtYt7CJdPa0zfJuctou39g=; b=RsAXGOcvtG5MYhS+
	rru5trvRuMubkIcK6u0oQXAofMrzyj79QTwYYJzzwbwVD9t6J+00aLFJH/PwdvA7
	f9NJQmsyy6ucrBEmyMfKS77MfzUczatFemBIiDp+Weyk+MWeITViBTz+nX2rWvvN
	4AUxvfFaTDS9CYsiqQJvtm68cFMk9tYPUCAmZydDLHhaXIdEzrhPrqyiNP/N/9rJ
	4obxzM+9HQu+buVk/2MV32waJxAJjTUQunoDNaMlx99kzZ95CwCW5wmp0YV24NPT
	pzsS/kE4Hnoc4sXbRWsLf17Yico7FZfQHB4GD+IH8q3+dRxmCIINZtj/0Os04F+C
	1iM8jQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tmsmeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 09:24:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 597974004A;
	Wed, 30 Apr 2025 09:23:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 080D7A54117;
	Wed, 30 Apr 2025 09:21:51 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 09:21:50 +0200
Message-ID: <bf7eddfa-ca7f-49a6-a3f9-574f2c4fe972@foss.st.com>
Date: Wed, 30 Apr 2025 09:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Support STM32h747i-disco board
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        <linux-kernel@vger.kernel.org>
CC: <linux-amarula@amarulasolutions.com>,
        Amelie Delaunay
	<amelie.delaunay@foss.st.com>,
        Conor Dooley <conor+dt@kernel.org>, David
 Jander <david@protonic.nl>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
        Marc Kleine-Budde
	<mkl@pengutronix.de>, Marek Vasut <marex@denx.de>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Roan van Dijk <roan@protonic.nl>, Rob Herring <robh@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Stephen
 Boyd <sboyd@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_002508_780119_ACA2DBD5 
X-CRM114-Status: GOOD (  14.09  )
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

Hi Dario

On 4/27/25 09:43, Dario Binacchi wrote:
> The series adds support for STM32h747i-disco board
> 
> The board includes an STM32H747XI SoC with the following resources:
>   - 2 Mbytes Flash
>   - 1 Mbyte SRAM
>   - LCD-TFT controller
>   - MIPI-DSI interface
>   - FD-CAN
>   - USB 2.0 high-speed/full-speed
>   - Ethernet MAC
>   - camera interface
> 
> Detailed information can be found at:
> https://www.st.com/en/evaluation-tools/stm32h747i-disco.html
> 
> 
> Dario Binacchi (8):
>    ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins phandles
>    dt-bindings: arm: stm32: add compatible for stm32h747i-disco board
>    ARM: stm32: add a new SoC - STM32H747
>    clk: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
>    ARM: dts: stm32: add uart8 node for stm32h743 MCU
>    ARM: dts: stm32: add pin map for UART8 controller on stm32h743
>    ARM: dts: stm32: add an extra pin map for USART1 on stm32h743
>    ARM: dts: stm32: support STM32h747i-disco board
> 
>   .../devicetree/bindings/arm/stm32/stm32.yaml  |   4 +
>   arch/arm/boot/dts/st/Makefile                 |   1 +
>   arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi     |  34 ++++-
>   arch/arm/boot/dts/st/stm32h743.dtsi           |   8 ++
>   arch/arm/boot/dts/st/stm32h743i-disco.dts     |   2 +-
>   arch/arm/boot/dts/st/stm32h743i-eval.dts      |   2 +-
>   arch/arm/boot/dts/st/stm32h747i-disco.dts     | 136 ++++++++++++++++++
>   arch/arm/boot/dts/st/stm32h750i-art-pi.dts    |   6 +-
>   arch/arm/mach-stm32/board-dt.c                |   1 +
>   include/dt-bindings/clock/stm32h7-clks.h      |   4 +-
>   10 files changed, 187 insertions(+), 11 deletions(-)
>   create mode 100644 arch/arm/boot/dts/st/stm32h747i-disco.dts
> 

Series applied on stm32-next. I changed patch 4 commit title according 
to Krzysztof comment.

Cheers
Alex

