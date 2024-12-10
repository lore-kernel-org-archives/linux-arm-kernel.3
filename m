Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2165AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTMNPKp9Javw7QGcnqA0o3v+GDe3cl06vv45gRAkrrk=; b=Vk4fSDcEvP5JZvtpdVh+d1wzXp
	I2ZXCPb3P7O9cf+uolmvtq/3FbbwUlkN7nsVgt2C/QyLrhaHaMxQuEO4Ixm34sJ0Wrv07P0OdPnO+
	13y5g4o6P2zpy/2p9PBCB2qR1tcBxUmrkJWMQtNGUjQn2wDudT2xL2Pcd2K48ref6unXafr3katew
	bWKR42hSlLF9nhhBtm+QzgGO4J2PBiRh4A4PTmA24JrpXbWBPm4Ousio2R+ijeqi1yJViWc+/IJDZ
	MAMFdQ14/D/PLwu9Hi+JXyGuaHc61yBigEqiq/LGPpcdmy+teMhwsaHJng6k7e5cjtkOIZZFYO5cP
	zChSKsBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvwS-0000000AmJn-1Ljy;
	Tue, 10 Dec 2024 08:50:04 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvvN-0000000Am6d-3uZv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 08:48:59 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA4YK5t005427;
	Tue, 10 Dec 2024 09:48:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	wTMNPKp9Javw7QGcnqA0o3v+GDe3cl06vv45gRAkrrk=; b=3CNt1mlFNJBQQrSq
	8C+DRiW76FX6sGs18gKLWQF0izrAHU8JA7XbqwBgVOr4A9s1lss0r9KQNNNaHoqF
	3cA3EZaWfbg0mIx5AiRT1Nf/waVQB036t5GEehmkhv2vuBAxBAXG3y42fKMUMXHr
	jVKGcOvObJZlxPVHtdBZVl/1xZbWvun7OrPAOgnMgmlXWvNDWXt1T1d3L28Gxb9e
	WYXUSwls9B2BRrNjgYED3Nqy3t0hjSpkrTncD79xb0vwpJj6m4Sd4Hu//wNbNc3x
	r6ydB+pJgc6ifcjzUBMSEJeTHJzSGVlpYGhyQ5/Yes9IiJ8AmevTSAvz+9OLUwEB
	ySLEtQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccc8uhgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 09:48:51 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D0F0140090;
	Tue, 10 Dec 2024 09:47:42 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE05C22E20A;
	Tue, 10 Dec 2024 09:46:34 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Dec
 2024 09:46:34 +0100
Message-ID: <8cda7859-523c-4850-8b89-9d9c9bf07cb6@foss.st.com>
Date: Tue, 10 Dec 2024 09:46:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] ARM: dts: stm32: lxa-tac: fix gen{1,2} boards and add
 gen3 board
To: Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <kernel@pengutronix.de>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_004858_260284_5E395677 
X-CRM114-Status: GOOD (  13.24  )
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

Hi Marc

On 11/19/24 12:34, Marc Kleine-Budde wrote:
> Hello,
> 
> this series fixes some problems found in the lxa-tac generation 1 and
> 2 boards and add support for the generation 3 board. It's based on an
> STM32MP153c, while the generation 1 and 2 are based on the
> STM32MP157c.
> 
> regards,
> Marc
> 
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
> Leonard Göhrs (6):
>        ARM: dts: stm32: lxa-tac: disable the real time clock
>        ARM: dts: stm32: lxa-tac: extend the alias table
>        ARM: dts: stm32: lxa-tac: adjust USB gadget fifo sizes for multi function
>        dt-bindings: arm: stm32: add compatible strings for Linux Automation LXA TAC gen 3
>        ARM: dts: stm32: lxa-tac: move adc and gpio{e,g} to gen{1,2} boards
>        ARM: dts: stm32: lxa-tac: Add support for generation 3 devices
> 
>   .../devicetree/bindings/arm/stm32/stm32.yaml       |   7 +
>   arch/arm/boot/dts/st/Makefile                      |   1 +
>   arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dts  | 267 +++++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts  |  84 +++++++
>   arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts  |  84 +++++++
>   arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi      | 100 +-------
>   6 files changed, 455 insertions(+), 88 deletions(-)
> ---
> base-commit: b0191a5cbc222fc7af3f9511b44d1f330ef980e9
> change-id: 20241112-lxa-tac-gen3-8dbc3481ce7a
> 
> Best regards,

Series applied on stm32-next.

Thanks!
Alex

