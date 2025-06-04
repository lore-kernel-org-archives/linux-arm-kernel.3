Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5A0C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BbnVS9D20ezMI4EQTDWMDtbyTWlsW9ZoYQZlC7MMog=; b=TRCUDxNGil8w5uPlomuPt8J7+g
	+du09ixriVkpFho/0wGzAPE5KmTIoZtL/cty8XKlqx5Efu5hNEYJfKYG37JJEtFbJgQmhyr4aB5Kk
	JCiARJ4gqtst79BzKIbcuaz08Y+6NfNKMD0RanLkeGRsfEqy8wxgROJLKxcYv++PTVAP+SeaAKlae
	5dbn9ckPt8kH6sjocfW7Xk2oNyPFqtH5pRgx4Be4FXN1ixjvPcQInNd4oDxrACLQ1OG4mIjrPitvw
	vExp0fXZDTK4Si/0Q45QRkcQjA/McIapi+k8imi5Ro23z/lChp4MfbKueJ5SWWdJY47nmnT60IsOW
	YTGqeXcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrBe-0000000DoR6-3leU;
	Wed, 04 Jun 2025 16:41:58 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMr9Z-0000000DoGj-0zyR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 16:39:50 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554F7slN011211;
	Wed, 4 Jun 2025 18:39:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	0BbnVS9D20ezMI4EQTDWMDtbyTWlsW9ZoYQZlC7MMog=; b=mSugKeI2mDPxVCh1
	HeGvrpJFummrgU1JBzlCbO6Inv6ABcTf1xTboAGXebQ4Va750dqiRf4t7gDXvgcp
	WylEgtUpxhieyEkf9TNCZeZoPe6Oc0DQBD9JmAUCQhNLPztUPazCLOGgUSCwHoFx
	2DEIoVPRSjgIfJOTjizbCsMG3KTVl44wQGE/Czla21dwM++eZZ3DCb6d+lJIvmbe
	7mk7Y+PWPbC9AyIhOGtgRr6A9yIhAfXzbVA3BODhITE/zm00qhRKH0LI8SVW+PEU
	arW8pHI5Jvm538mPnHgbSljWUwKisScM0COJ7pIgjE2Zslf6i4LMPz9yNWd4H4ug
	qgA7Lg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g8vanv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 18:39:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B11B840049;
	Wed,  4 Jun 2025 18:37:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 45605B4A8DE;
	Wed,  4 Jun 2025 18:35:51 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 18:35:50 +0200
Message-ID: <3c7da784-e58e-4acd-a37f-93020796c0e7@foss.st.com>
Date: Wed, 4 Jun 2025 18:35:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
Subject: Re: [PATCH v8 2/9] PCI: stm32: Add PCIe host support for STM32MP25
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <lpieralisi@kernel.org>, <kw@linux.com>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <thippeswamy.havalige@amd.com>,
        <shradha.t@samsung.com>, <quic_schintav@quicinc.com>,
        <cassel@kernel.org>, <johan+linaro@kernel.org>,
        <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250423090119.4003700-1-christian.bruel@foss.st.com>
 <20250423090119.4003700-3-christian.bruel@foss.st.com>
 <gzw3rcuwuu7yswljzde2zszqlzkfsilozdfv2ebrcxjpvngpkk@hvzqb5wbjalb>
 <c01d0d72-e43c-4e10-b298-c8ed4f5d1942@foss.st.com>
 <ec33uuugief45swij7eu3mbx7htfxov6qa5miucqsrdp36z7qe@svpbhliveks4>
 <7df0c1e5-f53b-4a44-920a-c2dfe8842481@foss.st.com>
 <q4rbaadr7amsrtwaeickdjmcst77onuopir5rzpvixa7ow7udk@txwsmidjs3im>
Content-Language: en-US
In-Reply-To: <q4rbaadr7amsrtwaeickdjmcst77onuopir5rzpvixa7ow7udk@txwsmidjs3im>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_093949_764027_5C9A7841 
X-CRM114-Status: UNSURE (   7.13  )
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



>>>>>> +
>>>>>> +	ret = devm_pm_runtime_enable(dev);
>>>>>> +	if (ret < 0) {
>>>>>> +		dev_err(dev, "Failed to enable runtime PM %d\n", ret);
>>>>>> +		return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	pm_runtime_get_noresume(dev);
>>>>>> +
>>>>>
>>>>> I know that a lot of the controller drivers do this for no obvious reason. But
>>>>> in this case, I believe you want to enable power domain or genpd before
>>>>> registering the host bridge. Is that right?
>>>>
...
Runtime PM was broken in version 6.6 without pm_runtime_get_noresume()

On the 6.15 baseline, without this call, pm_genpd_summary reports the 
correct information: active when a device is plugged, and suspended when not

So, I can proceed without pm_runtime_get_noresume(), as you mentioned in 
your review.
I suspect the other platforms might have this call for the same 
historical reasons.

thank you,

Christian

