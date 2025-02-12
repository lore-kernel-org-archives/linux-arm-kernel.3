Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23385C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 16:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtTH0NF2OZaw1ZQ29k/edA3IlfDQAywZ7oVCTbLG9zs=; b=o0hTUg5vX0Z6OmFwZvQ6bqHpeE
	CjPDzq8lF+syNF9Sz4M2H0xIW9M9ZEdTMh0PFL+cCSu4NyrWI11aaAnzdcEhikgO6Nqy1KBeX0/a6
	kqj9X6yzzBcnlN36r3AIjtoQu/dZfIGzzxEtoGPwrQmrdnApXxWT5mp4i5JHX+VhTxCfGwHbDrAQe
	5Yo6vjByuhPVyRcwQt/4OGcIH1XtIU4lZU7bJ8/v0GMDlN+iE0wgtnhM+aVAadthv9VHWAJlpMVXx
	aATaQl6qccLu+OLFTzzT6TAIB+GKsi0/UNwwkA2kgQnUmrCO9NPYpnzY35xDWy0gHOkN0xJCAnS6K
	fDraYnnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFoA-000000088dK-33lW;
	Wed, 12 Feb 2025 16:41:54 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFUF-000000083HN-02Yh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 16:21:20 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CEZrrx028666;
	Wed, 12 Feb 2025 17:21:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	jtTH0NF2OZaw1ZQ29k/edA3IlfDQAywZ7oVCTbLG9zs=; b=O3oaqEA/I/lcZQ2m
	L4kKOKxdlg+mTI3oe8flHZaFC54+QBIP6ufNUw+9Vug4ge6cvCnybHkvS89vlbua
	nPMOQAcCAmGy0FWs2dVlzwciSyJW4ajOKcbnNyM5Bpayc8byOg+D7owhSaWEG6RC
	kx57t5x5X4/dM/3TTCcwrzvFERdR2KCqI7GqTYPOWcehTB8N0kz6Wry6T9z2SAqH
	z5gKqsQ1izvugw4GN76xM64b52RzsyF9bkVwUKE6AL0igM6V1UAf4MbPsJpZtD4X
	kU5IQJ5oGVFsZ7OE4QS2vHQNBZtMqG4kLlN5SKjBdZHW4yEgQOhNwyA8mUN4GV2a
	3eSXdQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44rrfk295h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 17:21:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E769340045;
	Wed, 12 Feb 2025 17:19:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D05BA2CBC8E;
	Wed, 12 Feb 2025 17:17:56 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Feb
 2025 17:17:55 +0100
Message-ID: <52e74ce3-8ad0-4b42-b959-66ab70ac8501@foss.st.com>
Date: Wed, 12 Feb 2025 17:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] memory: Add STM32 Octo Memory Manager driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: <alexandre.torgue@foss.st.com>, <arnd@arndb.de>, <broonie@kernel.org>,
        <catalin.marinas@arm.com>, <christophe.kerello@foss.st.com>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <mcoquelin.stm32@gmail.com>, <p.zabel@pengutronix.de>,
        <robh@kernel.org>, <will@kernel.org>
References: <20250210131826.220318-1-patrice.chotard@foss.st.com>
 <20250210131826.220318-5-patrice.chotard@foss.st.com>
 <a74c3202-7a64-483d-907e-9a562e9dcd03@wanadoo.fr>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <a74c3202-7a64-483d-907e-9a562e9dcd03@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_05,2025-02-11_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_082119_355871_114DFE60 
X-CRM114-Status: GOOD (  20.12  )
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



On 2/11/25 19:16, Christophe JAILLET wrote:
> Le 10/02/2025 à 14:18, patrice.chotard-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org a écrit :
>> From: Patrice Chotard <patrice.chotard-rj0Iel/JR4NBDgjK7y7TUQ@public.gmane.org>
>>
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
> ...
> 
>> diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
>> new file mode 100644
>> index 000000000000..af69137bfba2
>> --- /dev/null
>> +++ b/drivers/memory/stm32_omm.c
>> @@ -0,0 +1,520 @@
>> +// SPDX-License-Identifier: GPL
> 
> Not sure this SPDX-License-Identifier exists.

Right, i will fix that.

> 
>> +/*
>> + * Copyright (C) STMicroelectronics 2024 - All Rights Reserved
> 
> ...
> 
>> +    pm_runtime_enable(dev);
>> +
>> +    /* check if OMM's resource access is granted */
>> +    ret = stm32_omm_check_access(dev, dev->of_node);
>> +    if (ret < 0 && ret != -EACCES)
>> +        goto err_clk_release;
> 
> Should we call, here and below, pm_runtime_disable() in the error handling path, as done in the remove function?

right, i will add it.

> 
>> +
>> +    if (!ret && child_access_granted == OMM_CHILD_NB) {
>> +        /* Ensure both OSPI instance are disabled before configuring OMM */
>> +        ret = stm32_omm_disable_child(dev);
>> +        if (ret)
>> +            goto err_clk_release;
>> +
>> +        ret = stm32_omm_configure(dev);
>> +        if (ret)
>> +            goto err_clk_release;
>> +    } else {
>> +        dev_dbg(dev, "Octo Memory Manager resource's access not granted\n");
>> +        /*
>> +         * AMCR can't be set, so check if current value is coherent
>> +         * with memory-map areas defined in DT
>> +         */
>> +        ret = stm32_omm_set_amcr(dev, false);
>> +        if (ret)
>> +            goto err_clk_release;
>> +    }
>> +
>> +    /* for each child, if resource access is granted and status "okay", probe it */
>> +    for (i = 0; i < omm->nb_child; i++) {
>> +        if (!child_access[i] || !of_device_is_available(omm->child[i].node))
>> +            continue;
>> +
>> +        vdev = of_platform_device_create(omm->child[i].node, NULL, NULL);
>> +        if (!vdev) {
>> +            dev_err(dev, "Failed to create Octo Memory Manager child\n");
>> +            for (j = i; j > 0; --j) {
>> +                if (omm->child[j].dev)
>> +                    of_platform_device_destroy(omm->child[j].dev, NULL);
>> +            }
>> +
>> +            ret = -EINVAL;
>> +            goto err_clk_release;
>> +        }
>> +        omm->child[i].dev = &vdev->dev;
>> +    }
>> +
>> +err_clk_release:
>> +    for (i = 0; i < omm->nb_child; i++)
>> +        clk_put(omm->child[i].clk);
>> +
>> +    return ret;
>> +}
>> +
>> +static void stm32_omm_remove(struct platform_device *pdev)
>> +{
>> +    struct stm32_omm *omm = platform_get_drvdata(pdev);
>> +    int i;
>> +
>> +    for (i = 0; i < omm->nb_child; i++)
>> +        if (omm->child[i].dev)
>> +            of_platform_device_destroy(omm->child[i].dev, NULL);
>> +
>> +    if (omm->cr & CR_MUXEN)
>> +        stm32_omm_enable_child_clock(&pdev->dev, false);
>> +
>> +    pm_runtime_disable(&pdev->dev);
> 
> Should we have:
>     for (i = 0; i < omm->nb_child; i++)
>         clk_put(omm->child[i].clk);
> as done in the error handling path of the probe?

no need, as child's clock are always freed in stm32_omm_probe() in all cases.

> 
>> +}
>> +
>> +static const struct of_device_id stm32_omm_of_match[] = {
>> +    { .compatible = "st,stm32mp25-omm", },
>> +    {},
> 
> Nitpick: Unneeded , after a terminator.

ok

> 
>> +};
>> +MODULE_DEVICE_TABLE(of, stm32_omm_of_match);
> 
> ...
> 
> CJ
> 
> 
> 

