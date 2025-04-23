Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C56C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 06:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+s9yV2sIwcnj08bNo807JMzK6QTP7lGfSvtpoETcPk=; b=LEFZAl4T6wCx5Tt9h1v7UMxwdi
	EM7TWAZfADUJSky8v5tHZAKdHecsfQeRPckB192YRzhGG5K7+oFj3DSK6faD68FVsRVhtcVfROBYH
	0lhjX5RxfH1YXa4ZHQLXhAOOhkqTp6+SldlXiOUJGSk9oH3SdSxbOU8dLiYTfsf0dUGm7v4hRKZEI
	mngPI4Lnh1KxUnkQ9cMjkYcd5YXkrxuPsRhXWrz00v3rdFPL/V6ekEE6y6OfluQw97/Z59aI/B5WW
	mPo1i4OauR8h4O2lEXrqC4wfTN+Jyk6/klfWHR8wt30RKTSRlaJerZmYlSi81L6Iq9vF/MLlITqr4
	ZiwYFDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Tz5-00000009Ouo-1nzT;
	Wed, 23 Apr 2025 06:53:27 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TIi-00000009J7D-1g5A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 06:09:42 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKtTll032699;
	Wed, 23 Apr 2025 08:09:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	M+s9yV2sIwcnj08bNo807JMzK6QTP7lGfSvtpoETcPk=; b=T2sxwQtkO0D9uZb4
	PEGQELEWOYNteLnhjU1UUS4dXJhrzRuBpH0jcp4g6kUUvAMwlB4loKNAnE8xrxPJ
	913Uwx2keJR5Wi2xdczaJNMbWYWUvLJt7OP66J5A8nHntqsGFPIpzKh7823iMAL6
	yVBxuC9RQs/nrIr2dBchsjLYmiK+wzhtooM2sMyR6qRKbgEEFd4ZIKdcfQOLR4BW
	mg73XcWMBD/XRmNjsRIWA+u4i2yjQmTPyLSG8kE7HPdS+eATal5FHnaXNHfg8G1f
	9d0kiUY/6wPPpf0mQzeEypn/Io6NivWZVyoRZKwQqb+IYFHbNHLA8L2YHZIzHnqS
	f8sIjg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjv1ewc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 08:09:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F3D7A40050;
	Wed, 23 Apr 2025 08:08:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 913B69DE34F;
	Wed, 23 Apr 2025 08:07:43 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 08:07:42 +0200
Message-ID: <a4efb3d4-f734-4900-9a16-a809908b67ce@foss.st.com>
Date: Wed, 23 Apr 2025 08:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] memory: Add STM32 Octo Memory Manager driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: <alexandre.torgue@foss.st.com>, <catalin.marinas@arm.com>,
        <christophe.kerello@foss.st.com>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <krzk@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <mcoquelin.stm32@gmail.com>, <p.zabel@pengutronix.de>,
        <robh@kernel.org>, <will@kernel.org>
References: <20250422-upstream_ospi_v6-v10-0-6f4942a04e10@foss.st.com>
 <20250422-upstream_ospi_v6-v10-2-6f4942a04e10@foss.st.com>
 <07f67b94-adc1-41a9-b7f7-9e1f8f751290@wanadoo.fr>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <07f67b94-adc1-41a9-b7f7-9e1f8f751290@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_03,2025-04-22_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_230940_945327_69EA5C44 
X-CRM114-Status: GOOD (  18.76  )
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



On 4/22/25 19:55, Christophe JAILLET wrote:
> Le 22/04/2025 à 10:44, Patrice Chotard a écrit :
>> Octo Memory Manager driver (OMM) manages:
>>    - the muxing between 2 OSPI busses and 2 output ports.
>>      There are 4 possible muxing configurations:
>>        - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>>          output is on port 2
>>        - OSPI1 and OSPI2 are multiplexed over the same output port 1
>>        - swapped mode (no multiplexing), OSPI1 output is on port 2,
>>          OSPI2 output is on port 1
>>        - OSPI1 and OSPI2 are multiplexed over the same output port 2
>>    - the split of the memory area shared between the 2 OSPI instances.
>>    - chip select selection override.
>>    - the time between 2 transactions in multiplexed mode.
>>    - check firewall access.
> 
> Hi,
> 
> 2 small questions below.
> 
>> +static int stm32_omm_disable_child(struct device *dev)
>> +{
>> +    struct stm32_omm *omm = dev_get_drvdata(dev);
>> +    struct reset_control *reset;
>> +    int ret;
>> +    u8 i;
>> +
>> +    ret = stm32_omm_toggle_child_clock(dev, true);
>> +    if (!ret)
>> +        return ret;
>> +
>> +    for (i = 0; i < omm->nb_child; i++) {
>> +        /* reset OSPI to ensure CR_EN bit is set to 0 */
>> +        reset = omm->child_reset[i];
>> +        ret = reset_control_acquire(reset);
>> +        if (ret) {
>> +            dev_err(dev, "Can not acquire resset %d\n", ret);
> 
> Should stm32_omm_toggle_child_clock(dev, false);
> be called here?

Hi Christophe

Right, stm32_omm_toggle_child_clock(dev, false) can be called here too.

> 
>> +            return ret;
>> +        }
>> +
>> +        reset_control_assert(reset);
>> +        udelay(2);
>> +        reset_control_deassert(reset);
>> +
>> +        reset_control_release(reset);
>> +    }
>> +
>> +    return stm32_omm_toggle_child_clock(dev, false);
>> +}
> 
> ...
> 
>> +static int stm32_omm_probe(struct platform_device *pdev)
>> +{
>> +    static const char * const resets_name[] = {"ospi1", "ospi2"};
>> +    struct device *dev = &pdev->dev;
>> +    u8 child_access_granted = 0;
>> +    struct stm32_omm *omm;
>> +    int i, ret;
>> +
>> +    omm = devm_kzalloc(dev, sizeof(*omm), GFP_KERNEL);
>> +    if (!omm)
>> +        return -ENOMEM;
>> +
>> +    omm->io_base = devm_platform_ioremap_resource_byname(pdev, "regs");
>> +    if (IS_ERR(omm->io_base))
>> +        return PTR_ERR(omm->io_base);
>> +
>> +    omm->mm_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory_map");
>> +    if (IS_ERR(omm->mm_res))
>> +        return PTR_ERR(omm->mm_res);
>> +
>> +    /* check child's access */
>> +    for_each_child_of_node_scoped(dev->of_node, child) {
>> +        if (omm->nb_child >= OMM_CHILD_NB) {
>> +            dev_err(dev, "Bad DT, found too much children\n");
>> +            return -E2BIG;
>> +        }
>> +
>> +        ret = stm32_omm_check_access(child);
>> +        if (ret < 0 && ret != -EACCES)
>> +            return ret;
>> +
>> +        if (!ret)
>> +            child_access_granted++;
>> +
>> +        omm->nb_child++;
>> +    }
>> +
>> +    if (omm->nb_child != OMM_CHILD_NB)
>> +        return -EINVAL;
>> +
>> +    platform_set_drvdata(pdev, omm);
>> +
>> +    devm_pm_runtime_enable(dev);
>> +
>> +    /* check if OMM's resource access is granted */
>> +    ret = stm32_omm_check_access(dev->of_node);
>> +    if (ret < 0 && ret != -EACCES)
>> +        return ret;
>> +
>> +    for (i = 0; i < omm->nb_child; i++) {
>> +        omm->child_reset[i] = devm_reset_control_get_exclusive_released(dev,
>> +                                        resets_name[i]);
>> +
>> +        if (IS_ERR(omm->child_reset[i]))
>> +            return dev_err_probe(dev, PTR_ERR(omm->child_reset[i]),
>> +                         "Can't get %s reset\n", resets_name[i]);
>> +    }
>> +
>> +    if (!ret && child_access_granted == OMM_CHILD_NB) {
>> +        ret = stm32_omm_configure(dev);
>> +        if (ret)
>> +            return ret;
>> +    } else {
>> +        dev_dbg(dev, "Octo Memory Manager resource's access not granted\n");
>> +        /*
>> +         * AMCR can't be set, so check if current value is coherent
>> +         * with memory-map areas defined in DT
>> +         */
>> +        ret = stm32_omm_set_amcr(dev, false);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    ret = devm_of_platform_populate(dev);
>> +    if (ret)
>> +        dev_err(dev, "Failed to create Octo Memory Manager child\n");
> 
> Should something like the code in the remove function be called here?

Good catch, yes if MUXEN bit is set, that means child's clock are still enable,
in this case we must disable these child clocks as well.

> 
> Also, maybe return dev_err_probe() and return 0; below?

Yes , dev_err_probe() can be added.

Thanks
Patrice

> 
>> +
>> +    return ret;
>> +}
> 
> ...
> 
> CJ
> 

