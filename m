Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4438E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSP1i4Lkz0rGvHcNwMWUKOJJ90fMoethAw45GkcmGoY=; b=eiEzYAKtG6zmKoS9/eD+88ROdM
	y3R7Qddpk0goMYwkY1u2fkPw19tKJajart5TYCd0fTA1Zy2IgW3q23/HHwA1Plmwvgn4GYXuQjD51
	+Aci/ZNDnrRlE2A4h82XqTxrIphmXpbV1aTI1XKwQlo48ikRhWjVF7Fomz5a/rp5sLs0IRnclux3s
	FbemjvnSYNNd912u5W+foL2zqq1BzK0uARMNg3jJp0O2I1WOS1C0qyrXc+R8YIchCu1I9AGt8ayWQ
	DAYy/3Lmk2YhDy45tUs9KQrMIqC4jsTbCoabXEQEx+S1+pFg9gL9YGCLJSn/DAkAwR/QjzUX9MWLo
	I+eaXAOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCKy-00000001L1M-1CNm;
	Thu, 19 Dec 2024 08:56:52 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCJr-00000001Krn-0T9r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 08:55:44 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ74BUE030261;
	Thu, 19 Dec 2024 09:55:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	XSP1i4Lkz0rGvHcNwMWUKOJJ90fMoethAw45GkcmGoY=; b=r0NPr/UaypnBGk7b
	xeNvFt3gt2Omw8BekjKcBxFdzXl9HdlxmDA12apbeeCi7NswXrZdvwJy9nRda9bQ
	8dKQGTJjZ6uvEJjfiyRfg39DcwX6uH9DINFDiUvwypbFaJSB9g5EeHyOHSopChOc
	IQjZhXDxf/yJ5jLoAd6Kv60wPgVzCmTDax2S6qrmxM00L9xxt5iVXNTBq14hRWHw
	p/V1jhnNVn1yuuV7GQEb1w7ptRVymrpJj6s1GqvMWprDkBF1Gf4f9RcACOawIT6Q
	rtR6P7n6/6YwvQTm//eJ9XQepRme6k9zpvvEBC4+a3tYiwjgHJWs+2oOWj7skpYx
	PGe82g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43mes98g5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 09:55:29 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1062F4004B;
	Thu, 19 Dec 2024 09:54:29 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B594825F51B;
	Thu, 19 Dec 2024 09:53:59 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 09:53:59 +0100
Message-ID: <11ea410e-a7df-4f1e-87df-8487b5532229@foss.st.com>
Date: Thu, 19 Dec 2024 09:53:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] ARM: dts: stm32: add counter nodes on stm32mp13 and
 stm32mp15
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <olivier.moysan@foss.st.com>
References: <20241216153908.3069548-1-fabrice.gasnier@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241216153908.3069548-1-fabrice.gasnier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_005543_669841_99A70FF1 
X-CRM114-Status: UNSURE (   8.14  )
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

Hi Fabrice

On 12/16/24 16:39, Fabrice Gasnier wrote:
> Counter driver originally had support limited to quadrature interface
> and simple counter. It has been improved[1], so populate and enable
> stm32 timer counter nodes on stm32mp13 and stm32mp15.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20240307133306.383045-1-fabrice.gasnier@foss.st.com/
> 
> Fabrice Gasnier (5):
>    ARM: dts: stm32: populate all timer counter nodes on stm32mp13
>    ARM: dts: stm32: populate all timer counter nodes on stm32mp15
>    ARM: dts: stm32: add counter subnodes on stm32mp135f-dk
>    ARM: dts: stm32: add counter subnodes on stm32mp157c-ev1
>    ARM: dts: stm32: add counter subnodes on stm32mp157 dk boards
> 
>   arch/arm/boot/dts/st/stm32mp131.dtsi      | 40 ++++++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts   | 12 +++++++
>   arch/arm/boot/dts/st/stm32mp151.dtsi      | 41 +++++++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp157c-ev1.dts  |  9 +++++
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 18 ++++++++++
>   5 files changed, 120 insertions(+)
> 

Series applied on stm32-next.

Thanks!
Alex

