Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC6DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7PPrERAdht9tlxv/xVeZk5zWfuWmo4pCFcm1v1cFEU=; b=zx6Trh3CZ8yiARP2hcew8TZ23N
	o/7T8GuyV+69ygBwBefXChMY+2oNubipcocIv2qm2tcM5xlO3mhh+IJh9hBu/Jur34AeyJi8PVVSk
	Yfk34v4sls7V6t0eUSE83QGOB9ewwuvDUKO0I5t1YxgDC14GF5t3i6sdLhLqgA2d6Yke4xi5Tncei
	goauGmfZbcOLFhtao4tzUCR4J5YfYpBw5HahsZUhi3zTj8xMJecgjF6vrfF9HAi9W452kYjwnYigx
	OxkHh6jedSJNHlpu/PdHxB+I3IRoTemihqpFwntLpzjI2XB126ktvJaMx1YL8RmcJc7iFmi9Jo0+l
	etIm0kcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhn0-00000008lYW-17KI;
	Mon, 09 Dec 2024 17:43:22 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhly-00000008lTK-1Z4J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:42:19 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9GD8a2003740;
	Mon, 9 Dec 2024 18:42:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	k7PPrERAdht9tlxv/xVeZk5zWfuWmo4pCFcm1v1cFEU=; b=6VyUfRMol3Ii9cZX
	v4hjddSd3Ygg+U3ZMLb6sBBvC8Ak3CSPomkFZ1mw+QkbAJ+gkBstImDnfoyJkUmz
	hdZ5J72JNS7uP5MEMlv93VdN2e40K9QkBJpEkux3qNgRHLJTMSDPeoT/i5vaJCQq
	5kp49oZV8mJ25uC1XtW0x/NXKnhG5CtPuX93Y6mX9N0LtB1KXDqLadLbHoIGKMok
	/DfGG7RZkbG212VUpJw/SA+Yi/FsK52XkBqEsMQUSV6uPNn6xI1PJxS7+YJ9nL71
	f3B/JVF/8FNZ8bB4lQgE2IJDSjoOHY6ZT4gDcEQnrs7abEarHlHj930fqDgzx8Eg
	R2NCvw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccnm18yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 18:42:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 874204004A;
	Mon,  9 Dec 2024 18:40:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55A362A2FD8;
	Mon,  9 Dec 2024 18:39:31 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 9 Dec
 2024 18:39:30 +0100
Message-ID: <4a5ce71f-bdb1-473d-8fea-9c07389b47ca@foss.st.com>
Date: Mon, 9 Dec 2024 18:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: stm32: Deduplicate serial aliases and chosen
 node for STM32MP15xx DHCOM SoM
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob
 Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
        <kernel@dh-electronics.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20241105233026.161463-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241105233026.161463-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_094218_932445_9A316C93 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

Hi Marek

On 11/6/24 00:29, Marek Vasut wrote:
> Deduplicate /aliases { serialN = ... } and /chosen node into
> stm32mp15xx-dhcom-som.dtsi , since the content is identical
> on all carrier boards using the STM32MP15xx DHCOM SoM. No
> functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi   | 12 ------------
>   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi    | 10 ----------
>   arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi | 10 ----------
>   arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi     |  7 +++++++
>   4 files changed, 7 insertions(+), 32 deletions(-)
> 

Applied on stm32-next.

Thanks!

Alex

