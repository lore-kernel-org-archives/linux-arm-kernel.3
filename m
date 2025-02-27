Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7B8C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 08:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/BrDT6HDNlhYIGawveZn0l9RzyImOeLlokPy7GIcsk=; b=JaahFyAWRL9xKHnvA2hlB3AKtL
	8sf/MYk2H5YLIIBYRqXf+UoJBjuXKyEEem8uQmdGqK01AbRz0kHq1nlDmDRBd8WUqOTnO3OQjoqyP
	r7edTXwvYwMTCDrCQbBTO23FNkHvjEQasoe1IB+t+eeyCKq01Jo3Ydf47pG4P3Q+6NFbj1yAZMlRV
	o776i5atiZtTMWKOKzGRUuW5Ic/l2E9bQUw5O/sKbDnO6r7QEDw0aKG2v+2Am1vQh99Tv1TlbhnOI
	VSoxUycuc1vmPvAfdid1uNL9eyXOnczed2Pg8Roduwa0F+XPUrAL2Rv/duJAg4YdotTy1lvl1s92f
	NWbKl0Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZTo-00000006jRz-0Iql;
	Thu, 27 Feb 2025 08:42:52 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZRM-00000006j3s-28rb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 08:40:21 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R53Rw5015424;
	Thu, 27 Feb 2025 09:40:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	s/BrDT6HDNlhYIGawveZn0l9RzyImOeLlokPy7GIcsk=; b=xdkbs63L8r9z0AqE
	J4UQC6e18L4aiHVcmWoO3+lareNu5cZoaFGEGXAah1u0BJATczOMLc/ShqGg01zq
	W7frUBh2zrelobq2bNiGwlmbSlNuB1xnn1BZ565h+Qau/JKv6L6PS3oV0xzNyKnB
	bj8xRRWxdVwTil/6zHhvcpXcKeCvF4JldJDuTVDUWHRGgBzqMLlkxI6wcG+5ZrMS
	cDjHZ4FKBt8cYGY3qXPEaSnKfA4z9k5VUM9BDlLAPM0RR+vr1C5HjqXvKhknyxM7
	Olw6W9SJA8716YWaX2Wf3Lxrtle5Ric+C9a3cX3Rms+hNOg4PeOoy5lQCAZpYCnu
	hsvJ0w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psuh1he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 09:40:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1E65D40050;
	Thu, 27 Feb 2025 09:39:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 15873381A90;
	Thu, 27 Feb 2025 09:38:29 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 09:38:28 +0100
Message-ID: <ea295010-136c-419a-80ff-3cdd0701fbd8@foss.st.com>
Date: Thu, 27 Feb 2025 09:38:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: stm32: add usr3 LED node to stm32f769-disco
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        <linux-kernel@vger.kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob
 Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250217114513.1098844-1-dario.binacchi@amarulasolutions.com>
 <20250217114513.1098844-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250217114513.1098844-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_04,2025-02-26_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_004020_839438_ADB590B5 
X-CRM114-Status: GOOD (  12.07  )
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



On 2/17/25 12:45, Dario Binacchi wrote:
> As indicated by the board silkscreen, there are three user LEDs.
> Add the missing one.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   arch/arm/boot/dts/st/stm32f769-disco.dts | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
> index d52e36aedcfb..535cfdc4681c 100644
> --- a/arch/arm/boot/dts/st/stm32f769-disco.dts
> +++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
> @@ -86,6 +86,9 @@ led-usr2 {
>   		led-usr1 {
>   			gpios = <&gpioj 13 GPIO_ACTIVE_HIGH>;
>   		};
> +		led-usr3 {
> +			gpios = <&gpioa 12 GPIO_ACTIVE_HIGH>;
> +		};
>   	};
>   
>   	gpio-keys {

Series applied on stm32-next.

Thanks
Alex

