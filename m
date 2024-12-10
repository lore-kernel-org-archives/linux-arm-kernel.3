Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D20E77182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07Fd8DkwCPGnXqaDXNFNioTlMvSHdNYm3+AlnpXUsyU=; b=0MKDs1eSCYZfunE8t6gJHEKWGy
	eKRq+iE6leeYU1WmqPWnPQa71uCOLjOWQIiah+QmQeFnxsf/N+xhOEz+I1lDJJCcs3jhw3rL2Bj3d
	8DA962RdYaWjyDGgPXkAGrMfc3n4d+MMyET6b0o9jWvzZJ0RjjogvvU10ZXn+wnKkZHGH4tsA69DY
	MSjOXW3DSkzzDwTvrZXRovgdFzLTL5DOi3alEbLtLLqZOHc57ASl28V2B2cAcUXcCaonHMpgIB5jc
	eZMAwUkJzw5QtQCTpNBLRzi4bgAfIp3eCjzxxBmZ6LFlOXZXAaFpMmkTj00caJPGdtBLsRuCQSvX0
	qe2qilSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvUz-0000000Agl9-3K0o;
	Tue, 10 Dec 2024 08:21:41 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvTv-0000000Agbh-2wPp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 08:20:37 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA1j9qH011970;
	Tue, 10 Dec 2024 09:20:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	07Fd8DkwCPGnXqaDXNFNioTlMvSHdNYm3+AlnpXUsyU=; b=j8KEIdASWSUHpF4z
	jd0uFUpTuHZ18OSkyat11UB6tfPsMrMuYGGVefLXkbjNPdkOJlaLHNaADNpHHZrV
	PT/H2yE7F+qOO8HfMwMb9mc/miQ/CyoqqrkBTxZPNnqxzRHLlRjCgyrbxRwofIc+
	UFAFGkhxXdBKslAFP3OwbefvLfZ+sq/7kE38n4D/iY0v7Ye9P7RvhlLPBUXWBE72
	aoh80H6uULVoUf8MARzXouXotk6os6qnU6YlxQ1CFaP+oJUYHJ5lafrfycCxYZii
	ejodAnpCvshi4bjjrYW817twNqgzU29y/nxCSLdlXqLc4vswmScUScL9P/bXjTi1
	4tCzxg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43e2w9jwp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 09:20:17 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6214E40044;
	Tue, 10 Dec 2024 09:18:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 953E422AA44;
	Tue, 10 Dec 2024 09:16:00 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Dec
 2024 09:16:00 +0100
Message-ID: <ce05c6db-7baa-4268-96c5-fbefeee2e77f@foss.st.com>
Date: Tue, 10 Dec 2024 09:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: stm32: Fix IPCC EXTI declaration on stm32mp151
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Fabien
 Dessenne <fabien.dessenne@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241206171759.135342-1-arnaud.pouliquen@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241206171759.135342-1-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_002036_196319_34479B41 
X-CRM114-Status: GOOD (  17.74  )
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

Hi Arnaud

On 12/6/24 18:17, Arnaud Pouliquen wrote:
> The GIC IRQ type used for IPCC RX should be IRQ_TYPE_LEVEL_HIGH.
> Replacing the interrupt with the EXTI event changes the type to
> the numeric value 1, meaning IRQ_TYPE_EDGE_RISING.
> 
> The issue is that EXTI event 61 is a direct event.The IRQ type of
> direct events is not used by EXTI and is propagated to the parent
> IRQ controller of EXTI, the GIC.
> 
> Align the IRQ type to the value expected by the GIC by replacing
> the second parameter "1" with IRQ_TYPE_LEVEL_HIGH.
> 
> Fixes: 7d9802bb0e34 ("ARM: dts: stm32: remove the IPCC "wakeup" IRQ on stm32mp151")
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>   arch/arm/boot/dts/st/stm32mp151.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
> index b28dc90926bd..e7e3ce8066ec 100644
> --- a/arch/arm/boot/dts/st/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
> @@ -129,7 +129,7 @@ ipcc: mailbox@4c001000 {
>   			reg = <0x4c001000 0x400>;
>   			st,proc-id = <0>;
>   			interrupts-extended =
> -				<&exti 61 1>,
> +				<&exti 61 IRQ_TYPE_LEVEL_HIGH>,
>   				<&intc GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "rx", "tx";
>   			clocks = <&rcc IPCC>;

Applied on stm32-next.

Alex

