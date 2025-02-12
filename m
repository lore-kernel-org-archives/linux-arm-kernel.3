Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EB6C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sa7ZmXyMmD7WcyKboADT8XwFx6T5S7FVc7f0sxyt4WM=; b=y8tzSm9HIkQG15c8HElfxvTly0
	Yi3e6yURk4aJHAD42ir8xIbybd7JjGaMt9ZxvyoylbQ/Zn6lGtcI8MStCuahY9If7RTl+Vw9kAH41
	fPSpEjEYDaKwuP0CDAnOOsC4zaxNrr+qb0Me0l55xlLGN06WvkaBL+hBbhshRjFHRpvcnMY5PBsj7
	ilgbnGZf14FUUmqpC3qcHEkfK/4+SRdKyoCZbwYfl5WddgHj+s8+yoJo2UVEZgEpSpWEGtZDU5y0R
	ypbPtntpdLE+InP7uodthepiO0EYmEZAezXKX3XHie9ZyN0wWgftMGEm7y5SuuDODI89F5TIsKVQP
	4V3pEk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFmm-000000088FX-04YY;
	Wed, 12 Feb 2025 16:40:28 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFU9-000000083Dy-0EhL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 16:21:14 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CEa3AK022172;
	Wed, 12 Feb 2025 17:20:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	sa7ZmXyMmD7WcyKboADT8XwFx6T5S7FVc7f0sxyt4WM=; b=5Ob/TXI07szMEjQ9
	13+9jqgYT94rSOsgLS0jiUmB4CtlsdR53GUayWFFeCIfc6+7EVtWFRI76E+9bB08
	ZNsS/pimmI7ucJQjBh/GfqvRXJD1tLAhb+INylLuw+Y2TdsvR7RlEKNFEZ99j9Uk
	vfjG9cP7Ew3eK01SJuqcZUNqa8cCLOT2zMK7JoQ+VjXaD1MCIT1QvhKBhWhczAuJ
	g0jcLw84oV22ZcdcvyraG0QPcusClbKqveJSNRthw3RhXKIuOmiPFTbcViT85QOI
	ir4a4ST7WIljKj1OwORrLCBfmMMmJMU4W998qPc8QgQ2zTx6z+CEPOODjuMm10w9
	sK9sMA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0q01s2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 17:20:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E62D740044;
	Wed, 12 Feb 2025 17:19:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A05732BE712;
	Wed, 12 Feb 2025 17:18:31 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Feb
 2025 17:18:30 +0100
Message-ID: <f56ae1b6-657a-4809-b95c-e318462d4270@foss.st.com>
Date: Wed, 12 Feb 2025 17:18:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] memory: Add STM32 Octo Memory Manager driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>
References: <20250210131826.220318-1-patrice.chotard@foss.st.com>
 <20250210131826.220318-5-patrice.chotard@foss.st.com>
 <CAMuHMdVkFym-3byZkszsi9tRoZ6zNOMCT79c2EgQQjn5xd19ig@mail.gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAMuHMdVkFym-3byZkszsi9tRoZ6zNOMCT79c2EgQQjn5xd19ig@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_05,2025-02-11_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_082113_622727_C93C5330 
X-CRM114-Status: GOOD (  24.82  )
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



On 2/12/25 13:51, Geert Uytterhoeven wrote:
> Hi Patrice,
> 
> On Mon, 10 Feb 2025 at 14:21, <patrice.chotard@foss.st.com> wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Octo Memory Manager driver (OMM) manages:
>>   - the muxing between 2 OSPI busses and 2 output ports.
>>     There are 4 possible muxing configurations:
>>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>>         output is on port 2
>>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>>         OSPI2 output is on port 1
>>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>>   - the split of the memory area shared between the 2 OSPI instances.
>>   - chip select selection override.
>>   - the time between 2 transactions in multiplexed mode.
>>   - check firewall access.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/memory/Kconfig
>> +++ b/drivers/memory/Kconfig
>> @@ -225,6 +225,23 @@ config STM32_FMC2_EBI
>>           devices (like SRAM, ethernet adapters, FPGAs, LCD displays, ...) on
>>           SOCs containing the FMC2 External Bus Interface.
>>
>> +config STM32_OMM
>> +       tristate "STM32 Octo Memory Manager"
>> +       depends on SPI_STM32_OSPI || TEST_COMPILE
> 
> COMPILE_TEST

 good catch 

> 
>> +       help
>> +         This driver manages the muxing between the 2 OSPI busses and
>> +         the 2 output ports. There are 4 possible muxing configurations:
>> +         - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>> +              output is on port 2
>> +         - OSPI1 and OSPI2 are multiplexed over the same output port 1
>> +         - swapped mode (no multiplexing), OSPI1 output is on port 2,
>> +              OSPI2 output is on port 1
>> +         - OSPI1 and OSPI2 are multiplexed over the same output port 2
>> +         It also manages :
>> +           - the split of the memory area shared between the 2 OSPI instances.
>> +           - chip select selection override.
>> +           - the time between 2 transactions in multiplexed mode.
>> +
>>  source "drivers/memory/samsung/Kconfig"
>>  source "drivers/memory/tegra/Kconfig"
> 
>> --- /dev/null
>> +++ b/drivers/memory/stm32_omm.c
> 
>> +static int stm32_omm_set_amcr(struct device *dev, bool set)
>> +{
>> +       struct stm32_omm *omm = dev_get_drvdata(dev);
>> +       struct regmap *syscfg_regmap;
>> +       struct device_node *node;
>> +       struct resource res, res1;
>> +       resource_size_t mm_ospi2_size = 0;
>> +       static const char * const mm_name[] = { "ospi1", "ospi2" };
>> +       u32 amcr_base, amcr_mask;
>> +       int ret, i, idx;
> 
> unsigned int i

ok

> 
>> +       unsigned int amcr, read_amcr;
>> +
>> +       for (i = 0; i < omm->nb_child; i++) {
>> +               idx = of_property_match_string(dev->of_node,
>> +                                              "memory-region-names",
>> +                                              mm_name[i]);
>> +               if (idx < 0)
>> +                       continue;
>> +
>> +               /* res1 only used on second loop iteration */
>> +               res1.start = res.start;
>> +               res1.end = res.end;
>> +
>> +               node = of_parse_phandle(dev->of_node, "memory-region", idx);
>> +               if (!node)
>> +                       continue;
>> +
>> +               ret = of_address_to_resource(node, 0, &res);
>> +               if (ret) {
>> +                       dev_err(dev, "unable to resolve memory region\n");
>> +                       return ret;
>> +               }
>> +
>> +               /* check that memory region fits inside OMM memory map area */
>> +               if (!resource_contains(omm->mm_res, &res)) {
>> +                       dev_err(dev, "%s doesn't fit inside OMM memory map area\n",
>> +                               mm_name[i]);
>> +                       dev_err(dev, "[0x%llx-0x%llx] doesn't fit inside [0x%llx-0x%llx]\n",
>> +                               res.start, res.end,
>> +                               omm->mm_res->start, omm->mm_res->end);
> 
> As reported by the kernel test robot, this fails to build when
> resource_size_t differs from unsigned long long.  However, you can
> easily print the full resource instead:
> 
>     dev_err(dev, "%pR doesn't fit inside %pR\n", &res, omm->mm_res);
> 
> https://elixir.bootlin.com/linux/v6.13.2/source/Documentation/core-api/printk-formats.rst#L206

OK, thanks for this tips

Patrice

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

