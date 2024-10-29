Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DA3D3A66D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 16:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHF2No7iOZp8TUj0QQhR03fdH9pB3iJrECaVT7vr+7s=; b=d/KxivBt2lm3tEo0Dzfi8kBJJ8
	5hhB6EjnVRoV5Z91MJrGljTUoXLnObDuqpMyVuIAHOZb3EAgtgqRcYb+nw8cN18ui7di60TcMCiIp
	irbSBgdoM0TIZ+Ac0gXvTmV1ilbjzwSluVjNZ80BnwqAhcQeUw4ja2HT2TXF1mNPl0iykD4AAfaq5
	DsGyarPPKmYH3clUjr4JyhsAG7dmd+ZjmHdqtsC/GMGa0WoKgdirVJ3BsGRfWhF1BDg1s5sDTaSC0
	A9zOo2e0UOsbiYw52e8VddNa6oIhSs/x1zhmFGOV/HXMsjuYt1D9NWd7TR2lu1zYq+v491phVRpWK
	iPRAedWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ofe-0000000F2xB-2svo;
	Tue, 29 Oct 2024 16:02:14 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oM3-0000000Exhc-1qiy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:42:01 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TC3TTF003918;
	Tue, 29 Oct 2024 16:41:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zHF2No7iOZp8TUj0QQhR03fdH9pB3iJrECaVT7vr+7s=; b=BieAHnzsKphMUEH6
	a/0gYtOzBijwl1r2EFJO4ams2ZnNA4CAEzqbhrWFm6jCw1ZBzgl20tRmeQ7myjpW
	4mP8Fzov9Pr9Lfop1NyLAc26rVw73mX/8kpiOeJP0K1u6sn2pe+PoCOSofMjhZTa
	Gi5GbIn4K8iYYP3aytoKhk2yKdVOcEa3CiNmjdxtg3pFdPP6VN/BVPvI5NESlG47
	Q9UtwuOcglETPhBOhqTv+gvhY8X8U+dOkONbAAQB9wxiAZBNxNun8tVCN4Njiz4N
	S5IYgugpVrh/PCNM4BUiCeLTaw8u13vJXzK8pv2uEoThDn8gjIwmzEIx3YdAZzpS
	TByXEw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42gqacqdhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 16:41:50 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AEDA040044;
	Tue, 29 Oct 2024 16:40:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA74426B638;
	Tue, 29 Oct 2024 16:39:41 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 29 Oct
 2024 16:39:41 +0100
Message-ID: <a483fb50-f978-4e48-b38e-6d79632540f1@foss.st.com>
Date: Tue, 29 Oct 2024 16:39:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm: dts: st: stm32mp151a-prtt1l: Fix QSPI
 configuration
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Oleksij Rempel
	<o.rempel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@pengutronix.de>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20240806120517.406714-1-o.rempel@pengutronix.de>
 <20dc2cd4-7684-4894-9db3-23c3f4abd661@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20dc2cd4-7684-4894-9db3-23c3f4abd661@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_084159_804912_F410EF78 
X-CRM114-Status: GOOD (  25.70  )
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

Hi Ahmad

On 8/7/24 11:38, Ahmad Fatoum wrote:
> Hello Oleksij,
> 
> On 06.08.24 14:05, Oleksij Rempel wrote:
>> Rename 'pins1' to 'pins' in the qspi_bk1_pins_a node to correct the
>> subnode name. The previous name caused the configuration to be
>> applied to the wrong subnode, resulting in QSPI not working properly.
>>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> ---
>>   arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi b/arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi
>> index 3938d357e198f..4db684478c320 100644
>> --- a/arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi
>> @@ -123,7 +123,7 @@ flash@0 {
>>   };
>>   
>>   &qspi_bk1_pins_a {
>> -	pins1 {
>> +	pins {
> 
> As you have seen such device tree overriding is error prone and would
> be entirely avoidable if specifying full board-specific pinctrl groups
> was allowed for the stm32 platforms instead of override-and-pray.
> 
> Anyways, there's better syntax for such overriding now:
> 
>    &{qspi_blk1_pins_a/pins}
> 
> which would cause a compilation error if pins was renamed again.
> 
>>   		bias-pull-up;
> 
> There's bias-disable in stm32mp15-pinctrl.dtsi. You may want to add
> a /delete-property/ for that to make sure, it's not up to the driver
> which one has priority.
> 
>>   		drive-push-pull;
>>   		slew-rate = <1>;
> 
> These are already in qspi_bk1_pins_a. If repeating those is ok, why
> not go a step further and just duplicate the pinmux property and stay
> clear of this issue altogether, provided Alex is amenable to changing
> his mind regarding pinctrl groups in board device trees.

I still prefer to have pin configuration defined in pinctrl dtsi file 
and I'll continue like this for ST board. The reason is that we try to 
reuse as much as possible pins when we create a new board and so it is 
easier to maintain if we declare them only one time.

But, I'm not blocked for "other" boards based on STM32 SoC. I mean, if 
it is simpler for you and above all if it avoid issues/complexities 
then, you can declare some pin groups in your board dts file. In this 
case we need to take care of the IO groups label name.

regards
alex

> 
> 
> Cheers,
> Ahmad
> 

