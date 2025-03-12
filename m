Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86EBC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 14:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtPAvR/3Y7aFKJ4mRVD7vcQ0a3v2nIeiOVDxnLYyFmA=; b=rCjbO3WueczWiMNp5vYJV59ekG
	MNsjqV1NxekblWgCg7H/9s6qJ/XiB679rBOtky7jIi9r68uQonEbfHoOULGnsaW5Dvk1cWL0Y/yPV
	U0hZcZJPZvvYgy3VVgv3xiguuVmEkT4TPblrn1o8wYe4UBn8zjp+rIDJRq5XIQ7Js1sLQBSC/tFV9
	4f00oxWQQinpAyiAUV+R0Rxtc2ZzRQqV5Lsy6V4cNuP54TnoMoF2upLKxUgEXoBGp9cSCDLUGRHsA
	TheYWMmDuhBEO+RFNealBsdYCPyA8GGt9f2pELd6XmLgI9RrMQEjk7XfAqiuEVflVhgBjIf3q4VQf
	zy/eZ8cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsN4i-00000008hHV-3EpL;
	Wed, 12 Mar 2025 14:28:48 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsN32-00000008h5l-1Pl1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 14:27:06 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CAtfkd001246;
	Wed, 12 Mar 2025 15:26:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dtPAvR/3Y7aFKJ4mRVD7vcQ0a3v2nIeiOVDxnLYyFmA=; b=JWTfsbL2wJVoTwtI
	Q/cDZZMauQIv2hl8/KhXSr0sSjjxTGZ6GVtWs+83z69mTIQs7UJRm/kM+LReTS7x
	+lyxJcHy+r7aJOstZ9iZt/oSIAAWGdIyNc+TZlptyCXYXH2gZN7a+zT9T7H73jph
	yW1Yaep6CZwEQor35HCDAnerAwB8nNPifPGpuUzXyJxIAI8xSdnGPpjpdNBhKZPP
	2/8NT60tm2Y2Pxi1NLCvjkcaI69lyurPmbVvZIlhx5z4fFwy5Q8ea66TiaJcatVI
	krpTo1c27ShbKliG/LATrM2Cbgsa4f46C8A21CFCzdGQjdmMCorwZlCmBz4DQiz1
	+PhDBg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45au3q46gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 15:26:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 11B5B4002D;
	Wed, 12 Mar 2025 15:24:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D429539096;
	Wed, 12 Mar 2025 15:23:26 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 15:23:25 +0100
Message-ID: <8b1b7df5-07f4-4f95-88e7-4e95ee909ffd@foss.st.com>
Date: Wed, 12 Mar 2025 15:23:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] memory: Add STM32 Octo Memory Manager driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>
References: <20250219080059.367045-1-patrice.chotard@foss.st.com>
 <20250219080059.367045-5-patrice.chotard@foss.st.com>
 <eaf1ecca-4fde-4128-8590-6013c3a13a04@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <eaf1ecca-4fde-4128-8590-6013c3a13a04@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_05,2025-03-11_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_072705_055072_039D323B 
X-CRM114-Status: GOOD (  41.67  )
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



On 3/11/25 17:04, Krzysztof Kozlowski wrote:
> On 19/02/2025 09:00, patrice.chotard@foss.st.com wrote:
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
> Incorrect chain. You sent it, so you must be the last person signing it.

ok

> 
> I was waiting for any ST review... did not happen, so if you wonder how
> to speed things up, you got a hint. Anyway, many questions futher.
> 
> 
>> +
>> +		if (i == 1) {
>> +			mm_ospi2_size = resource_size(&res);
>> +
>> +			/* check that OMM memory region 1 doesn't overlap memory region 2 */
>> +			if (resource_overlaps(&res, &res1)) {
>> +				dev_err(dev, "OMM memory-region %s overlaps memory region %s\n",
>> +					mm_name[0], mm_name[1]);
>> +				dev_err(dev, "%pR overlaps %pR\n", &res1, &res);
>> +
>> +				return -EFAULT;
>> +			}
>> +		}
>> +	}
>> +
>> +	syscfg_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "st,syscfg-amcr");
>> +	if (IS_ERR(syscfg_regmap)) {
>> +		dev_err(dev, "Failed to get st,syscfg-amcr property\n");
>> +		return PTR_ERR(syscfg_regmap);
> 
> Same comments as usual, see further.

ok, will use dev_err_probe()

> 
>> +	}
>> +
>> +	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 1,
>> +					 &amcr_base);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 2,
>> +					 &amcr_mask);
>> +	if (ret)
>> +		return ret;
>> +
>> +	amcr = mm_ospi2_size / SZ_64M;
>> +
>> +	if (set)
>> +		regmap_update_bits(syscfg_regmap, amcr_base, amcr_mask, amcr);
>> +
>> +	/* read AMCR and check coherency with memory-map areas defined in DT */
>> +	regmap_read(syscfg_regmap, amcr_base, &read_amcr);
>> +	read_amcr = read_amcr >> (ffs(amcr_mask) - 1);
>> +
>> +	if (amcr != read_amcr) {
>> +		dev_err(dev, "AMCR value not coherent with DT memory-map areas\n");
>> +		ret = -EINVAL;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int stm32_omm_enable_child_clock(struct device *dev, bool enable)
>> +{
>> +	/* As there is only 2 children, remember first child in case of error */
>> +	struct clk *first_child_clk = NULL;
>> +	struct stm32_omm *omm = dev_get_drvdata(dev);
>> +	u8 i;
>> +	int ret;
>> +
>> +	for (i = 0; i < omm->nb_child; i++) {
>> +		if (enable) {
>> +			ret = clk_prepare_enable(omm->child[i].clk);
>> +			if (ret) {
>> +				if (first_child_clk)
>> +					clk_disable_unprepare(first_child_clk);
> 
> Function is called stm32_omm_enable_child_clock() but you disable.
> Confusing. Probably should be called toggle.

Agree, i will rename it to stm32_omm_toggle_child_clock

> 
>> +
>> +				dev_err(dev, "Can not enable clock\n");
>> +				return ret;
>> +			}
>> +		} else {
>> +			clk_disable_unprepare(omm->child[i].clk);
>> +		}
>> +
>> +		first_child_clk = omm->child[i].clk;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int stm32_omm_configure(struct device *dev)
>> +{
>> +	struct stm32_omm *omm = dev_get_drvdata(dev);
>> +	struct reset_control *rstc;
>> +	unsigned long clk_rate, clk_rate_max = 0;
>> +	int ret;
>> +	u8 i;
>> +	u32 mux = 0;
> 
> That's one big mess. Do not mix initialized declarations with
> non-initialized in the same line. Then group initialized ones together
> and use some reverse christmas tree.
> 
> Then the rest also should be organized.

ok

> 
>> +	u32 cssel_ovr = 0;
>> +	u32 req2ack = 0;
>> +
>> +	omm->clk = devm_clk_get(dev, NULL);
> 
> So here devm_clk_get, but later of_clk_get...
> 
>> +	if (IS_ERR(omm->clk)) {
>> +		dev_err(dev, "Failed to get OMM clock (%ld)\n",
>> +			PTR_ERR(omm->clk));
>> +
> 
> No. There is no such code anywhere. Please don't upstream downstream,
> but take upstream as template.
> 
> It is *always* return dev_err_probe. You are flooding dmesg in deferral
> for no reason.

ok, will use dev_err_probe()

> 
>> +		return PTR_ERR(omm->clk);
>> +	}
>> +
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* parse children's clock */
>> +	for (i = 0; i < omm->nb_child; i++) {
>> +		clk_rate = clk_get_rate(omm->child[i].clk);
>> +		if (!clk_rate) {
>> +			dev_err(dev, "Invalid clock rate\n");
>> +			pm_runtime_disable(dev);
>> +			goto err_clk_disable;
>> +		}
>> +
>> +		if (clk_rate > clk_rate_max)
>> +			clk_rate_max = clk_rate;
>> +	}
>> +
>> +	rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
>> +	if (IS_ERR(rstc)) {
>> +		ret = dev_err_probe(dev, PTR_ERR(rstc), "reset get failed\n");
>> +		pm_runtime_disable(dev);
> 
> Why? It was not enabled in this function. I cannot follow the logic,
> feels like random set of calls. Each of your function is supposed to
> reverse ONLY what it done so far.

right, i will move pm_runtime_disable() outside stm32_omm_enable_child_clock()

> 
>> +		goto err_clk_disable;
>> +	}
>> +
>> +	reset_control_assert(rstc);
>> +	udelay(2);
>> +	reset_control_deassert(rstc);
>> +
>> +	omm->cr = readl_relaxed(omm->io_base + OMM_CR);
>> +	/* optional */
>> +	ret = of_property_read_u32(dev->of_node, "st,omm-mux", &mux);
>> +	if (!ret) {
>> +		if (mux & CR_MUXEN) {
>> +			ret = of_property_read_u32(dev->of_node, "st,omm-req2ack-ns",
>> +						   &req2ack);
>> +			if (!ret && !req2ack) {
>> +				req2ack = DIV_ROUND_UP(req2ack, NSEC_PER_SEC / clk_rate_max) - 1;
>> +
>> +				if (req2ack > 256)
>> +					req2ack = 256;
>> +			}
>> +
>> +			req2ack = FIELD_PREP(CR_REQ2ACK_MASK, req2ack);
>> +
>> +			omm->cr &= ~CR_REQ2ACK_MASK;
>> +			omm->cr |= FIELD_PREP(CR_REQ2ACK_MASK, req2ack);
>> +
>> +			/*
>> +			 * If the mux is enabled, the 2 OSPI clocks have to be
>> +			 * always enabled
>> +			 */
>> +			ret = stm32_omm_enable_child_clock(dev, true);
>> +			if (ret) {
>> +				pm_runtime_disable(dev);
>> +				goto err_clk_disable;
>> +			}
>> +		}
>> +
>> +		omm->cr &= ~CR_MUXENMODE_MASK;
>> +		omm->cr |= FIELD_PREP(CR_MUXENMODE_MASK, mux);
>> +	}
>> +
>> +	/* optional */
>> +	ret = of_property_read_u32(dev->of_node, "st,omm-cssel-ovr", &cssel_ovr);
>> +	if (!ret) {
>> +		omm->cr &= ~CR_CSSEL_OVR_MASK;
>> +		omm->cr |= FIELD_PREP(CR_CSSEL_OVR_MASK, cssel_ovr);
>> +		omm->cr |= CR_CSSEL_OVR_EN;
>> +	}
>> +
>> +	omm->restore_omm = true;
>> +	writel_relaxed(omm->cr, omm->io_base + OMM_CR);
>> +
>> +	ret = stm32_omm_set_amcr(dev, true);
>> +
>> +err_clk_disable:
>> +	pm_runtime_put_sync_suspend(dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static int stm32_omm_check_access(struct device *dev, struct device_node *np)
>> +{
>> +	struct stm32_firewall firewall;
>> +	int ret;
>> +
>> +	ret = stm32_firewall_get_firewall(np, &firewall, 1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return stm32_firewall_grant_access(&firewall);
>> +}
>> +
>> +static int stm32_omm_disable_child(struct device *dev)
>> +{
>> +	struct stm32_omm *omm = dev_get_drvdata(dev);
>> +	struct reset_control *reset;
>> +	int ret;
>> +	u8 i;
>> +
>> +	for (i = 0; i < omm->nb_child; i++) {
>> +		ret = clk_prepare_enable(omm->child[i].clk);
>> +		if (ret) {
>> +			dev_err(dev, "Can not enable clock\n");
>> +			return ret;
>> +		}
>> +
>> +		reset = of_reset_control_get_exclusive(omm->child[i].node, 0);
>> +		if (IS_ERR(reset)) {
>> +			dev_err(dev, "Can't get child reset\n");
> 
> Why do you get reset of child? Parent is not suppposed to poke there.
> You might not have the reset there in the first place and it would not
> be an error.

By ressetting child (OSPI), we ensure they are disabled and in a known state.
See the comment below.

> 
> 
>> +			return PTR_ERR(reset);
>> +		};
>> +
>> +		/* reset OSPI to ensure CR_EN bit is set to 0 */
>> +		reset_control_assert(reset);
>> +		udelay(2);
>> +		reset_control_deassert(reset);
> 
> No, the child should handle this, not parent.

Octo Memory Manager can only be configured if both child are disabled.
That's why here, parent handles this.

> 
>> +
>> +		reset_control_put(reset);
>> +		clk_disable_unprepare(omm->child[i].clk);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int stm32_omm_probe(struct platform_device *pdev)
>> +{
>> +	struct platform_device *vdev;
>> +	struct device *dev = &pdev->dev;
>> +	struct stm32_omm *omm;
>> +	struct clk *clk;
>> +	int ret;
>> +	u8 child_access_granted = 0;
> 
> Keep inits/assignments together

ok

> 
>> +	u8 i, j;
>> +	bool child_access[OMM_CHILD_NB];
>> +
>> +	omm = devm_kzalloc(dev, sizeof(*omm), GFP_KERNEL);
>> +	if (!omm)
>> +		return -ENOMEM;
>> +
>> +	omm->io_base = devm_platform_ioremap_resource_byname(pdev, "regs");
>> +	if (IS_ERR(omm->io_base))
>> +		return PTR_ERR(omm->io_base);
>> +
>> +	omm->mm_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory_map");
>> +	if (IS_ERR(omm->mm_res))
>> +		return PTR_ERR(omm->mm_res);
>> +
>> +	/* check child's access */
>> +	for_each_child_of_node_scoped(dev->of_node, child) {
>> +		if (omm->nb_child >= OMM_CHILD_NB) {
>> +			dev_err(dev, "Bad DT, found too much children\n");
>> +			ret = -E2BIG;
>> +			goto err_clk_release;
>> +		}
>> +
>> +		if (!of_device_is_compatible(child, "st,stm32mp25-ospi")) {
>> +			ret = -EINVAL;
>> +			goto err_clk_release;
>> +		}
>> +
>> +		ret = stm32_omm_check_access(dev, child);
>> +		if (ret < 0 && ret != -EACCES)
>> +			goto err_clk_release;
>> +
>> +		child_access[omm->nb_child] = false;
>> +		if (!ret) {
>> +			child_access_granted++;
>> +			child_access[omm->nb_child] = true;
>> +		}
>> +
>> +		omm->child[omm->nb_child].node = child;
>> +
>> +		clk = of_clk_get(child, 0);
> 
> Why are you taking children clock? And why with this API, not clk_get?

I need children's clock to reset them.
Why of_clk_get() usage is a problem here ? i can't get your point ?

> This looks like mixing clock provider in the clock consumer.
> 
>> +		if (IS_ERR(clk)) {
>> +			dev_err(dev, "Can't get child clock\n");
> 
> Syntax is always return dev_err_probe (or ret = dev_err_probe).

ok

> 
>> +			ret = PTR_ERR(clk);
>> +			goto err_clk_release;
>> +		};
>> +
>> +		omm->child[omm->nb_child].clk = clk;
>> +		omm->nb_child++;
>> +	}
>> +
>> +	if (omm->nb_child != OMM_CHILD_NB) {
>> +		ret = -EINVAL;
>> +		goto err_clk_release;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, omm);
>> +
>> +	pm_runtime_enable(dev);
>> +
>> +	/* check if OMM's resource access is granted */
>> +	ret = stm32_omm_check_access(dev, dev->of_node);
>> +	if (ret < 0 && ret != -EACCES)
>> +		goto err_clk_release;
>> +
>> +	if (!ret && child_access_granted == OMM_CHILD_NB) {
>> +		/* Ensure both OSPI instance are disabled before configuring OMM */
>> +		ret = stm32_omm_disable_child(dev);
>> +		if (ret)
>> +			goto err_clk_release;
>> +
>> +		ret = stm32_omm_configure(dev);
>> +		if (ret)
>> +			goto err_clk_release;
>> +	} else {
>> +		dev_dbg(dev, "Octo Memory Manager resource's access not granted\n");
>> +		/*
>> +		 * AMCR can't be set, so check if current value is coherent
>> +		 * with memory-map areas defined in DT
>> +		 */
>> +		ret = stm32_omm_set_amcr(dev, false);
>> +		if (ret)
>> +			goto err_clk_release;
>> +	}
>> +
>> +	/* for each child, if resource access is granted and status "okay", probe it */
>> +	for (i = 0; i < omm->nb_child; i++) {
>> +		if (!child_access[i] || !of_device_is_available(omm->child[i].node))
> 
> If you have a device available, why do you create one more platform device?
> 
>> +			continue;
>> +
>> +		vdev = of_platform_device_create(omm->child[i].node, NULL, NULL);
> 
> Why you cannot just populate the children?

I can't use of_platform_populate(), by default it will populate all OMM's child.
Whereas here, we want to probe only the OMM's child which match our criteria.  

> 
>> +		if (!vdev) {
>> +			dev_err(dev, "Failed to create Octo Memory Manager child\n");
>> +			for (j = i; j > 0; --j) {
>> +				if (omm->child[j].dev)
>> +					of_platform_device_destroy(omm->child[j].dev, NULL);
>> +			}
>> +
>> +			ret = -EINVAL;
>> +			goto err_clk_release;
>> +		}
>> +		omm->child[i].dev = &vdev->dev;
>> +	}
>> +
>> +err_clk_release:
>> +	for (i = 0; i < omm->nb_child; i++)
>> +		clk_put(omm->child[i].clk);
>> +
>> +	return ret;
>> +}
>> +
>> +static void stm32_omm_remove(struct platform_device *pdev)
>> +{
>> +	struct stm32_omm *omm = platform_get_drvdata(pdev);
>> +	int i;
>> +
>> +	for (i = 0; i < omm->nb_child; i++)
>> +		if (omm->child[i].dev)
>> +			of_platform_device_destroy(omm->child[i].dev, NULL);
>> +
>> +	if (omm->cr & CR_MUXEN)
>> +		stm32_omm_enable_child_clock(&pdev->dev, false);
>> +
>> +	pm_runtime_disable(&pdev->dev);
>> +}
>> +
>> +static const struct of_device_id stm32_omm_of_match[] = {
>> +	{ .compatible = "st,stm32mp25-omm", },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, stm32_omm_of_match);
>> +
>> +static int __maybe_unused stm32_omm_runtime_suspend(struct device *dev)
>> +{
>> +	struct stm32_omm *omm = dev_get_drvdata(dev);
>> +
>> +	clk_disable_unprepare(omm->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused stm32_omm_runtime_resume(struct device *dev)
>> +{
>> +	struct stm32_omm *omm = dev_get_drvdata(dev);
>> +
>> +	return clk_prepare_enable(omm->clk);
>> +}
>> +
>> +static int __maybe_unused stm32_omm_suspend(struct device *dev)
>> +{
>> +	struct stm32_omm *omm = dev_get_drvdata(dev);
>> +
>> +	if (omm->restore_omm && omm->cr & CR_MUXEN)
>> +		stm32_omm_enable_child_clock(dev, false);
> 
> Why do you enable child clock for suspend?

The child clock is disbaled here, but as you indicated earlier in this patch,
stm32_omm_enable_child_clock() will be renamed stm32_omm_toggle_child_clock() 
to avoid confussion.

Thanks
Patrice

> 
>> +
>> +	return pinctrl_pm_select_sleep_state(dev);
>> +}
>> +
> 
> 
> Best regards,
> Krzysztof

