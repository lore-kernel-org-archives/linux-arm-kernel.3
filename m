Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F18ACA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXR6l5zH9EuL6ygVcZdx0q8KXP/yLgdiG12ZI87yuuE=; b=GHPFYAFlYEPLcS1oeYnO07U74H
	8RQfo6T8BrrT9EprK0sdJthOeyfJEhjv81sHK+AyhL3tSC9J6n+dtTKgRoSxxbDM8zVIdfROVyWub
	xe2k/TYhl38QfP0VJOgzXbhAHPOG+axeNuyy+lzjErVutIaXR3vh69Kosaju3blDtOP/KMR9+wnGi
	jnAoCN5G/RuP0gAtafqf0Olq8/GMh4jk5WE07pBIozOYiIQSgETFkd8XAj39kWt6sKqAS5tLjpldB
	dHHspDk0oHRnlHZ/ppxLCTNcsrJUsXRTD5clJRkywnM++LtVz3StgaxOgvm3Ji56A5VIVnFzEJCVW
	SwQAKENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqIo-000000073eU-0yzb;
	Wed, 03 Sep 2025 16:25:42 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnIv-00000006XbY-0Prv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:13:38 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Cav0x002331;
	Wed, 3 Sep 2025 15:13:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	RXR6l5zH9EuL6ygVcZdx0q8KXP/yLgdiG12ZI87yuuE=; b=1XAqNyxb4d0nLr+5
	/nhC7xFCng4Jy7BmFmFwA/fpX3aQlJxJ5gqJ9vIIptA1g7UdVjnJkMSizX/xx1yt
	uJqY1ad5BbFYKSNncLqKqzBvnraO1r5QNIjc/JtP59wmhkFekHmeVArisrcVmAmd
	Mi4FpTXOJ8JLMyAlzf+J7sMUXkz8BrXcYvjkRr5/g2CKbLF0ASzOGFqDTZFyNzvL
	zWWLtppycLqkRe0PccSj0f7qAByaCMOIMD8/KNC4vqvdA1hS0mOTjjpnG0Ykbz/y
	Sc6Iy/gcH20DLowj/lHthmw5rXjWUAAz3BgYUCLzlGBttwwFTlmHbG6ZkxIQLX8N
	okP9Og==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48ur6frhek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:13:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DD40540045;
	Wed,  3 Sep 2025 15:11:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D9020290800;
	Wed,  3 Sep 2025 15:10:43 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 15:10:43 +0200
Message-ID: <59f25804-d310-4492-b95f-19c42cf3cd42@foss.st.com>
Date: Wed, 3 Sep 2025 15:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: dts: stm32: add resets property to m_can
 nodes in the stm32mp153
To: Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Chandrasekar Ramakrishnan
	<rcsekar@samsung.com>,
        Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel@pengutronix.de>, <linux-can@vger.kernel.org>
References: <20250807-stm32mp15-m_can-add-reset-v2-0-f69ebbfced1f@pengutronix.de>
 <20250807-stm32mp15-m_can-add-reset-v2-2-f69ebbfced1f@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250807-stm32mp15-m_can-add-reset-v2-2-f69ebbfced1f@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_061337_410966_779C3D4B 
X-CRM114-Status: GOOD (  12.87  )
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

On 8/7/25 08:09, Marc Kleine-Budde wrote:
> On the STM32MP153 the m_cam IP cores (a.k.a. FDCAN) have an external
> shared reset in the RCC. Add the reset to both m_can nodes.
> 
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
>   arch/arm/boot/dts/st/stm32mp153.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp153.dtsi b/arch/arm/boot/dts/st/stm32mp153.dtsi
> index 4640dafb1598..92794b942ab2 100644
> --- a/arch/arm/boot/dts/st/stm32mp153.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp153.dtsi
> @@ -40,6 +40,7 @@ m_can1: can@4400e000 {
>   		interrupt-names = "int0", "int1";
>   		clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
>   		clock-names = "hclk", "cclk";
> +		resets = <&rcc FDCAN_R>;
>   		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
>   		access-controllers = <&etzpc 62>;
>   		status = "disabled";
> @@ -54,6 +55,7 @@ m_can2: can@4400f000 {
>   		interrupt-names = "int0", "int1";
>   		clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
>   		clock-names = "hclk", "cclk";
> +		resets = <&rcc FDCAN_R>;
>   		bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
>   		access-controllers = <&etzpc 62>;
>   		status = "disabled";
> 

How those reset are handled at driver side ?

regards
alex

