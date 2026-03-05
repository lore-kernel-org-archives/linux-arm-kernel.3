Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220BFF30920
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLqXdZqeswd7bsIzFoL7/R/GTqsNqM60xS7hO8DhIjg=; b=Ej1Ko0Hm/BzcLdFAyOXVi46DUL
	zcONEMytyortolTUINzn8AblFSX4DHgggbaaqraZG7tNFSmC6HCL3pLZkdagHUfZATOM77U0NCCTo
	d10zmoUBc2NitR6USgo4IQfbU37Fj+lnOv/n8m4qYaMBAXdADXA1oNi4ZHGqzlIh1h9QKHKNE3M8L
	acTqwfmUTqgZFXvlZT06oPF8qn7vGOxJSHVmOMujtzFypQsEyl5lxf5bP1Vtq0UkQ4iGQA2a4AwFo
	FRkXh5zG0LHZ5R1DqkXH9y6O5o4J5c/4zLcZpNdONAn9WSb8q36JIXKn7WJSvn4Wkpz3kL8ophvMU
	uur463MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4xd-00000001NIj-20pf;
	Thu, 05 Mar 2026 09:25:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4xb-00000001NHa-1kKV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:25:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6259GAjA3482651
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YLqXdZqeswd7bsIzFoL7/R/GTqsNqM60xS7hO8DhIjg=; b=ePdi+N8Xes+9wQkc
	6yZ0QDYqIIMXACoK9fbxHTQffU9rP2Wdo+80WOSu+U2NErCpzJN/hSdhQsp0V6X9
	VjcUuG7wpMOAkMRs1eFiuNtjnUY9GSaIsCzQjN1JfUZ7oIKl+JaUybbkWHxN5rC+
	h5G3frbFl8iNp7lwjvbqfEmNe/83Ru3KYiBNS14JCZ82a2GVnZkPl0p1kOclzf/s
	4un5oWtnu9TmqYwDLBtDFt+f7LnFZQzthQZ+2wuoZFBfOwY7TM/9r60xkaMdlQy9
	k9THT4tfBsGu0Ro5enixdKEFblCbGcTpSyZN+7m+gaoj1kwQy83UiiOKPUg7OTTh
	nBKCAA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wjnpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:25:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82971e944c6so749997b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772702733; x=1773307533; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YLqXdZqeswd7bsIzFoL7/R/GTqsNqM60xS7hO8DhIjg=;
        b=ZDoByr9QqIfOXr4kRUv6yZafpYLAiX4YjjRwhq2VRGvQKXSrG3AdFp4Hr9dSMnRVD5
         dLF9GMwWgTwowH3OCmQQG2NMVCHDPRkJDuAhvLHyj8SZcWegJsLGz9D8g/gyn/MrWUkD
         GF/+nHGpXPidAKxCSHqDLckynu7EroLELW/k01dGW1fdmND7B4BwYmoFTpyRx3urOx6g
         LMRvNK4AuUtkOHzAew6wTm8/ca8iTbDCFSX3nYPjDfKU3+4h/dj5Fld6c/FkL+GbNZG/
         e1s4MCOdFitZkK/AIxkh/rVybhr3iXa6uc2Z0ogkQdW3MMXoPS03be2kRPi/RObWIS+4
         QXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702733; x=1773307533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YLqXdZqeswd7bsIzFoL7/R/GTqsNqM60xS7hO8DhIjg=;
        b=OkSSBznLkub1tz9o9sRfawv+/OGO7pBKsG799116AsgPnv8xsY9wN8vahbqcLqslKM
         tRSn+saMyxuXEuiGecYYmtKri1p6gtvzZD4Ej1dLblp27ghzAtbikCgqsKPY2HKHf+fZ
         aZ5O+ISqrfWH0A52EquurI53nHG2x5gTz0Euusz3a75QmRiny4gYQCsGwqEfCLY+8/v/
         7tQzd7DaLKEaDI1Kkacjvi+zAPMJ0OLxlKSc28AhShfBI0NJO4Wh1QUGcNhlsEXdCvE+
         ZKQdLL5KcrnwnyR/4ryOE3WGoPa+M4zrk4GdrVBfSUE5mOlH7Lv71d0kzkv9Pn8jZnwd
         ubZw==
X-Forwarded-Encrypted: i=1; AJvYcCU+FxdHsLzQ10/D0IfCeVvOf4R7vqOWVv1hTue0HjXomYTvM7YN2fIZXZTH6Snl8idAAddH6eFwh6rmVw2tAIwk@lists.infradead.org
X-Gm-Message-State: AOJu0YyRNXs3VJu/CmgD+GzAKSP3NjEu8wqd95holCMEOYeXfDvuHUIv
	vFzn2WfzG7wW0ILqokM4l1c6BaqOIyHcMLL6yp7o/MkAG9I0sRLvV2D7mqZeZTV6BguXahp/h63
	LSRdmn5qHHxEjI02jfN8ampUiCyEU3BzRE1CVbhS3RPT2sNrp6DnXfDemmHlbiql20d3iAXT/oF
	RXfQ==
X-Gm-Gg: ATEYQzx1ETXluVTn0QhLP/BR5pHBmQVD1+ArAgJUaBdwrrTQmta3AceXA/01G/xxK+x
	pDBNuQQlCtgkelImEdT7c+TPHZJnIkaeKek39aL6P0kKjUM3ccU19uXPywUL8MmXNw9AhWddiVP
	IFEnoO95pulhQNmxyzmsrhK/OiQqyRbewnMNGYReLfo2paVcV2Na735Iw5bnDq7+xEMJ06Sg0L1
	+MP3qqA2Q1Kqtbzv9H7NOnApE9TdGVtc+LEEDe1QKjMKQlbT60g/GR1TUau3hYJ3W/XbzbnTFht
	SD8wY4IqpJQzqaaQXVVvbf+2eJpDAqJtKWVcVE/DzyPj0vHMtvHnGy+7qumghPXlRIiGtHufMOj
	gr7VXn0Xq/GvYVQA6ZB4cxbRChpDmY9xRy8VnhE4EBKsL9fF1fKp+Ow==
X-Received: by 2002:a05:6a00:1144:b0:81f:4a0c:c584 with SMTP id d2e1a72fcca58-82972b61defmr4432212b3a.1.1772702732589;
        Thu, 05 Mar 2026 01:25:32 -0800 (PST)
X-Received: by 2002:a05:6a00:1144:b0:81f:4a0c:c584 with SMTP id d2e1a72fcca58-82972b61defmr4432193b3a.1.1772702732107;
        Thu, 05 Mar 2026 01:25:32 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829722d0045sm4521429b3a.23.2026.03.05.01.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:25:31 -0800 (PST)
Message-ID: <9327c6a7-b2af-420d-bb1e-f2829ddaef7f@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 14:55:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] PCI: qcom: Add D3cold support
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com,
        bjorn.andersson@oss.qualcomm.com
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-5-89b322864043@oss.qualcomm.com>
 <om6t5hlnxadpmet5i2gochjmfjw6mdfllrdbgewiz4u6vj3zot@nse5rbl3je64>
 <c0cb73d6-262e-4529-8b07-4c545c76015b@oss.qualcomm.com>
 <miorzejq4sxcl7pucaa7fq7fplbs7bqcnflawnw4qnvntxohmf@xyttdgbfllvy>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <miorzejq4sxcl7pucaa7fq7fplbs7bqcnflawnw4qnvntxohmf@xyttdgbfllvy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ib0pFdzpZTXJLkL1VpXtmaoDyv4v6ghK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3NSBTYWx0ZWRfX9gbXlpzPBgsQ
 CMdUCOt5S8epN3UA95SWDtkZMxxD8yPdkQOD40qIUN5rYsFDJS/EEUY3HaBSUEqOamVC28m/JzT
 6NwtrqaRXMItiOuJk0m/M5kH8eRnU5zxRPf8FtmeMQm56OP5cCCthziso4+xRpNbAjr1UoZheH2
 DMTe4HlZGWnvnjqLxshPnbmAAov3Te1KfNbP5MZiQ4ssdFdVLyDfFaKo63li+YdRJTeuMrZELdU
 n1BAYIKbKS5kEKVdab6UjPYASyJefXz7ej1Vt/2/jcg6nbLv0TS+3zNFnHGTfK9GUBJLM/fFxsc
 tylIucbrOf1ff+kbXgAXOPemtzZU7W2KwSMPQ2Apa6ph45jDz7wstmLfKKlruLo28rpIPp2dG2/
 tl6uV1IF7yNT05bviWoxxYreKxQG3Ln5UuoS7gHLzzar5yesBJnmU5r/ynNL7J3k9oFXRGLLjqK
 fH9nZLQDdbrexjj9MEQ==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a94c0d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uIgEQj9WjdynuVTCvEgA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Ib0pFdzpZTXJLkL1VpXtmaoDyv4v6ghK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_012535_581775_4A1D74CF 
X-CRM114-Status: GOOD (  22.04  )
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



On 3/5/2026 2:44 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 05, 2026 at 02:30:17PM +0530, Krishna Chaitanya Chundru wrote:
>>
>> On 3/5/2026 1:28 PM, Manivannan Sadhasivam wrote:
>>> On Tue, Feb 17, 2026 at 04:49:10PM +0530, Krishna Chaitanya Chundru wrote:
>>>> Add support for transitioning Qcom PCIe controllers into D3cold by
>>> You cannot transition a 'PCIe controller' to D3Cold state, but only the
>>> endpoints and bridges.
>>>
>>>> integrating with the DWC core suspend/resume helpers.
>>>>
>>>> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
>>>> into the DWC host operations so the controller follows the standard
>>>> PME_TurnOff-based power-down sequence before entering D3cold.
>>>>
>>>> When the link is suspended into D3cold, fully tear down interconnect
>>> You cannot suspend a link into D3Cold. Link and D-State are different.
>>>
>>>> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
>>>> by keeping the required interconnect and OPP votes.
>>>>
>>>> Drop the qcom_pcie::suspended flag and rely on the existing
>>>> dw_pcie::suspended state, which now drives both the power-management
>>>> flow and the interconnect/OPP handling.
>>>>
>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>>>    drivers/pci/controller/dwc/pcie-qcom.c | 121 ++++++++++++++++++++-------------
>>>>    1 file changed, 74 insertions(+), 47 deletions(-)
>>>>
>>>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>>>> index b02c19bbdf2ea5db252c2a0281a569bb3a0cc497..37442bbe588c36b0b0414cc4d0016da2d8424a87 100644
>>>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>>>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>>>> @@ -145,6 +145,7 @@
>>> [...]
>>>
>>>> -	if (pcie->suspended) {
>>>> -		ret = qcom_pcie_host_init(&pcie->pci->pp);
>>>> -		if (ret)
>>>> -			return ret;
>>>> +		ret = icc_enable(pcie->icc_mem);
>>>> +		if (ret) {
>>>> +			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);
>>>> +			goto disable_icc_cpu;
>>>> +		}
>>>> -		pcie->suspended = false;
>>>> +		/*
>>>> +		 * Ignore -ETIMEDOUT here since it is expected when no endpoint is
>>>> +		 * connected to the PCIe link.
>>>> +		 */
>>>> +		ret = dw_pcie_resume_noirq(pcie->pci);
>>>> +		if (ret && (ret != -ETIMEDOUT))
>>> No, dw_pcie_resume_noirq() was reworked to return -ETIMEDOUT to indicate a hard
>>> failure. If the device is not found, it will return -ENODEV. So you should
>>> fail the resume if -ETIMEDOUT is returned.
>> Ack, didn't noticed the reworked changes, I will change -ETIMEDOUT to
>> -ENODEV.
>>
> No, that's what not I meant. I meant, you should do:
>
> 	if (ret == -ETIMEDOUT)
> 		goto fail;
there can be other failures also right, where we should fail,
like pci->pp.ops->init(&pci->pp); can return different error other than 
-ETIMEDOUT in that case we should fail here. - Krishna Chaitanya.
> - Mani
>


