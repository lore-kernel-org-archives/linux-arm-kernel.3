Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1909BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1HgdGedqFLflmSyTqaih9yVCR93DL2hpGbz6kInKgQ=; b=bnr/j+py4tEtEobSM9zHaQzLw+
	XnI1cz55KCeCC/hCKLDyRJl0OpXoztbP3g3nFVsFeTBAoYNSk93XOxK7e9OhYbum92GAbxsyJPSQL
	FE98d4/QZKNjdNppnx0Pky4wEZDDk5LO1Pb///eAfX/iY4HQLApYEntfN0knW8ZLnQMatcB3dfu7P
	d18mFqGIqo0TRJ0hYJzUVhspitJ8pEkiyjas1DYRzD/Y1Z0grift4lmLtS9/5Tz+0K0xJBp/f94Rc
	9E9teiNLr9A2UAES3kKuc8O1KQBPpa9vgKvH9jJKxTCLKF/HYxG1sQcFoIrI+eKbOQJZzmsn5CWea
	a6vqVKJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7A8m-00000006b96-1VxN;
	Tue, 22 Apr 2025 09:42:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u799v-00000006NYW-1Mcm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 08:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=p1HgdGedqFLflmSyTqaih9yVCR93DL2hpGbz6kInKgQ=; b=Do2RNbZt69QgCBXuc/Gz+H3GyU
	fCwb+rhFB5waUQ6gXhTQPgGNlz4bPA6hzyZAmDRRYVqn9aJ9kLlWqupOYrOwXc/0X4g7G8RemVlqM
	IqKCyR/Cdz4qPRfhCHH1Lh+aayB7KkYMN/+7Mq0Qgh8WUqk3ASxFvKkVPPBwioEog3IRxdlgKDVd2
	twOfz1oiL2utlRiSOJO0jqlPPoPH5BuyeUVIBoGvPEBYOUARnKusEnAa4bqpH4mQ4d7yVR3sbPfGX
	fOotOJvSQcAkkZPF2O8yU+90iUMHmavenP+d5n0yXtcnPZwXbb6k9ZbIPPLWnMYEnwGx2lHmqZjbw
	3w/AJSFQ==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u799r-0000000BA8Q-1u3x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:39:14 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7dHvO023461;
	Tue, 22 Apr 2025 10:39:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	p1HgdGedqFLflmSyTqaih9yVCR93DL2hpGbz6kInKgQ=; b=aC/BBYhR30IsKwaq
	tyXav00NKeBxVSsNoWFNtYcD6H9WlT1jyliHwkZlkjlzTA/WZMWKKmL1deiqVbVt
	htwGqnGex+KHq+8vJt+g2M2eKMEjYxkefrVasUGA+dllSKegRZD+nrgwCVl5xrqO
	28E+zfrbHA4tUUPmN/WDR7Yy7kGKVi1imh1Eb8ZRj9AR4uDs4Z3Zppptoz2grf2E
	KVt0F1ClLRjN/9OxEVWjHE4QFDnJWRS64EP72K59/tWbg483bcB33G2JXE+cKOVq
	JKVfhOSs/rDH8J7y2lEvP5MD4D3mupygVYw9iv1EkuSD2Z7Cydpze78W8zX9iFiN
	rQdc2g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 464nd3y1w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 10:39:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B88C340059;
	Tue, 22 Apr 2025 10:37:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E93E99D6100;
	Tue, 22 Apr 2025 10:37:04 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 10:37:04 +0200
Message-ID: <2bdbee00-07d2-4f6d-830a-1e5e6982d5a6@foss.st.com>
Date: Tue, 22 Apr 2025 10:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] memory: Add STM32 Octo Memory Manager driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250410-upstream_ospi_v6-v9-0-cf119508848a@foss.st.com>
 <20250410-upstream_ospi_v6-v9-2-cf119508848a@foss.st.com>
 <3dd741ef-4589-49cd-967f-8a2d72e75cf4@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <3dd741ef-4589-49cd-967f-8a2d72e75cf4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_093912_373640_EA2E5EC5 
X-CRM114-Status: GOOD (  12.89  )
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



On 4/15/25 08:00, Krzysztof Kozlowski wrote:
> On 10/04/2025 11:27, Patrice Chotard wrote:
>> +	for (i = 0; i < omm->nb_child; i++) {
>> +		idx = of_property_match_string(dev->of_node,
>> +					       "memory-region-names",
>> +					       mm_name[i]);
>> +		if (idx < 0)
>> +			continue;
>> +
>> +		/* res1 only used on second loop iteration */
>> +		res1.start = res.start;
>> +		res1.end = res.end;
>> +
>> +		node = of_parse_phandle(dev->of_node, "memory-region", idx);
>> +		if (!node)
>> +			continue;
>> +
>> +		ret = of_address_to_resource(node, 0, &res);
>> +		if (ret) {
>> +			of_node_put(node);
>> +			dev_err(dev, "unable to resolve memory region\n");
>> +			return ret;
>> +		}
>> +
>> +		/* check that memory region fits inside OMM memory map area */
>> +		if (!resource_contains(omm->mm_res, &res)) {
>> +			dev_err(dev, "%s doesn't fit inside OMM memory map area\n",
>> +				mm_name[i]);
>> +			dev_err(dev, "%pR doesn't fit inside %pR\n", &res, omm->mm_res);
>> +
> 
> I don't understand. I already pointed out that you leak OF reference.
> You fixed it in one place, ignoring all the rest. You must fix it
> everywhere.
> 

Hi Krzysztof

My bad, i will add all missing of_node_put().

Thanks
Patrice

>> +			return -EFAULT;
>> +		}
>> +
> 
> 
> Best regards,
> Krzysztof

