Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C82EEF32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3eDqJ6jpq/KisFt7ksH/4aFqk3PdilfLAwISDAZsjU=; b=MY1EowcTS54uJk8Ghk4W487xh0
	RNyKuyoto9W2H9Pj1CKNt7p6rm9LMJUmIR8VAcAJ5cW2nsJebaok3J4c7crP7394twj2qnQMFsffZ
	YIkXktqpTcx2XuEdDGN5/ggM33L+lNidq5Xb8eg2+ZmGsQersmxDpfIuqhro00zfettlBXfLE4V7K
	QcGFHeEi6OCz3t1+C8x7rXMgT/n4vOf4t7MM48epJxyA1w0GCoHvJRrbfbCFKoZ4Kh/nlAsi4yKzs
	j6iCvf7UuTPebymi59++EuOp6lB98A2HVyniwGr8x90+RJ89n8PBrHfjbz/ivVUGhL9OJ3JckoaLy
	QowtJ6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4VW-00000001GDa-2QES;
	Thu, 05 Mar 2026 08:56:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4VT-00000001GD9-3tRK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 08:56:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BVeE2665033
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 08:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V3eDqJ6jpq/KisFt7ksH/4aFqk3PdilfLAwISDAZsjU=; b=jLlZPU/X1OCwF0wF
	1UcdeX6avnQUDkUN05L8dAbQAN9kQJSjq1JuhbrHdM+l0bcNeZdPLU8AeldOtikO
	ZVO/yTrlt5W9h0Rhr0Ny8zDx8jqgypT4tpQcyCWAGhLTewI+FGp36qDakLgCIFNU
	crO9KULtNdiuY7AZUmPC2gP4iHSR3OMBCC3I8ZFsrcccbimQiZOOAdq0czBVP85e
	0OIkIVYunJZcU3D2vRJ3hh/P6IiYn++rOdPecUFwau2+hGYGmKNgti0f1qqf1uiJ
	Ub14ovt9Eag1EA9ugWUu2vNHof1rl9P147S+TtZn9m0rEiYP6MlRne/HpCcAWgpJ
	9gQimg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb217v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 08:56:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae44db60c2so45614505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 00:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772700990; x=1773305790; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V3eDqJ6jpq/KisFt7ksH/4aFqk3PdilfLAwISDAZsjU=;
        b=RhPhPG8GeqKrTgAFLzTX9hzqrh2TtFMviEaBa0UyS0sQFRyoZhpBBon2CUS7Vwq+vQ
         ld5dQn8LjGkXNmqGrIXnqrF4T0dYt9Jc1H72oPfo1dOB10DOPWPB2bseaegLnovtCSx1
         yewMRfg4pzTInEJcm9/1cqG80P+DdXg67HGAlNFYlthunka36h4pJ6iuoD8DxLE4Vh/z
         F0DnoUNaD+Xo3iWWWtVNC19PYfT0boRDb/rz4ZYmJT8Wce9FKwJviOpPBrzSO9b8WZrU
         s5Jut0fi706rfXszCDUGIMKnNXaGUteHtJ+2Msn2A+GFyigx0aMr4AHoRBYr+2pFx6VS
         CWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700990; x=1773305790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3eDqJ6jpq/KisFt7ksH/4aFqk3PdilfLAwISDAZsjU=;
        b=jnMksbwhhLSHJVjN6AdAUYGPIqdpVvSK+1dQmAi5nCjTMqLUQIaby8sZwAFgPbYHj5
         Le6fY7qPq0hWiYzlDWF3PuQd78QT2lpfeR2diC068FhyY+nQNvXskMMIC69Xgm4EKHJY
         JmWxpZfSrhtGaCvFHqImK57eNMgx+bDyw71pYRVWv0V+kSp7A0EeohAdBfn8SpIR69qt
         oSPMnmdnbrECu7S7nEWPldmPZv41mIneF9UhzPpgD8hPbrCwTOLiEpPp7JQ5juyA7cK/
         O01FRuA0/D06Imj1ndJKPamkdZ7hvbUGLdBr1poJ6fJG8Sh6JIpoWcBHWhtmBUaF7FqU
         KLUw==
X-Forwarded-Encrypted: i=1; AJvYcCWlvnibO0K+zn/9+zpC5twIwpjN/gSg7UtidJNwonBEtXWqoiWZjFUKdMsA4V1NYTz4dksjrgC1h30cirLKgh2F@lists.infradead.org
X-Gm-Message-State: AOJu0YzrLBZdIQc1p6XuWoUQf1qhJ1dB8cDc6m2e9uCQQGHQpQ9PsZRJ
	PyhNdXugp5yVEPdXVyr7z8bse010Q6nZzGrdA2aJ6jl+pphbhIfG00LMCOePmK0k4Jo+vQoFfmJ
	wjicRmlgIq4ud8QJ5QIADvhYBJrLHsCF5Sf74CABBdrAmhVK0ikRs31JQ90M3c/C6zdBsQm5ivW
	ftGepGwt5Xcw==
X-Gm-Gg: ATEYQzxHidvH/EpbTPwNif6mmg/5AmyqeF48Z95qinXpIxuusCbghGYPlVOx0SbXJX8
	XcvzKhc2ISzBLhiwr4E6etWbLTHETqVNzaRfLXdVrHFtvtl6mIU201PyhyhJWjjwjmVsDbfQj8d
	CYdzqEyW9CL9k/QxIxoT3EnYUPrIoK4vsndaIfJsoF/DyPdbYOjeA5o8jICB5TG4rwEEkL8Aw5R
	3JXWRRPWx2wWWSLdVNCQVywWPyF7y4+QhQCteTgEqUadoQW3mb9F+YczJHuBh+oYJvZ6LcItWcT
	tdGVe+uJWEPuD08/uJNLb83KdG29966HfGMZd92GSnU845xNxP2YuIju8tn1h5lyPvjpyJjnEdU
	Ydy86cP1xevEGsgMmtLrUB4zUL6xTJmFMuy+Vqiy3F0fnPfwEZ/8m5A==
X-Received: by 2002:a17:903:388e:b0:2ad:ba80:df62 with SMTP id d9443c01a7336-2ae6aae8d8amr47956855ad.37.1772700990107;
        Thu, 05 Mar 2026 00:56:30 -0800 (PST)
X-Received: by 2002:a17:903:388e:b0:2ad:ba80:df62 with SMTP id d9443c01a7336-2ae6aae8d8amr47956585ad.37.1772700989632;
        Thu, 05 Mar 2026 00:56:29 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6bb5b2sm224434525ad.69.2026.03.05.00.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:56:29 -0800 (PST)
Message-ID: <313d2262-56e4-49b0-8455-2b46d0966976@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 14:26:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL before
 disabling rails/clocks
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
 <20260217-d3cold-v2-4-89b322864043@oss.qualcomm.com>
 <to6p7yf2oo5qh37hsye4zpputrc7p4bwgqvjc2plieuyapjdhp@7xshxghi4tzd>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <to6p7yf2oo5qh37hsye4zpputrc7p4bwgqvjc2plieuyapjdhp@7xshxghi4tzd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MSBTYWx0ZWRfX744NH/LWOOfj
 0Iz5c3N0oE8ngHGbE9+zMFWm+fPPprjzd5ugYCvNYpQcgotmvOG+ujkffWsAkyqeKiSmd21YUGT
 Mz0p2/sVxmhQ8bT8KUanpzReDRNwf4nDwds0UMF6VTVkUjbzs+0X2bL1yNyMy/Ifj2lFbnjQhlI
 r/CVnp23s4swqzYn4jbPMB/a9ic0O+buvIV0m61HQsnK17A+TnMGoHgt6aupRrlYo4OaNqrqQFK
 E/9WAyZxhrNRy75CAipIWJ3EcVKZrp4x/Ddan3tFIUKn2HvweycqUCJE+tUNj7kufL0AhI5EzPV
 CYryih3uSYk8YeFvw5SNZsCSGaQfY1HVSEDSVvgeOz6Fxjf49jqIHsIMBix+X3fnBDCX0mI1/ig
 ZAQCqxu9zZ+o4i09T4hd/I5CzpU67DfsjwHYl3TXmi+IuiAGRdUY5VVi9YKH8DYMHYJs/cLVN2P
 /5w1OKlXFwsthhKmQBA==
X-Proofpoint-GUID: WvRaO4MSXOb7MegYSXRvFXFhKLl_rkpV
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a9453f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kJBpcOZ6olZWUerAqwAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: WvRaO4MSXOb7MegYSXRvFXFhKLl_rkpV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_005631_973329_AE0E26B4 
X-CRM114-Status: GOOD (  22.08  )
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



On 3/5/2026 1:19 PM, Manivannan Sadhasivam wrote:
> On Tue, Feb 17, 2026 at 04:49:09PM +0530, Krishna Chaitanya Chundru wrote:
>> Some Qcom PCIe controller variants bring the PHY out of test power-down
>> (PHY_TEST_PWR_DOWN) during init. When the link is later transitioned
>> towards D3cold and the driver disables PCIe clocks and/or regulators
>> without explicitly re-asserting PHY_TEST_PWR_DOWN, the PHY can remain
>> partially powered, leading to avoidable power leakage.
>>
>> Update the init-path comments to reflect that PARF_PHY_CTRL is used to
>> power the PHY on. Also, for controller revisions that enable PHY power
>> in init (2.3.2, 2.3.3, 2.7.0 and 2.9.0), explicitly power the PHY down
>> via PARF_PHY_CTRL in the deinit path before disabling clocks/regulators.
>>
>> This ensures the PHY is put into a defined low-power state prior to
>> removing its supplies, preventing leakage when entering D3cold.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 30 +++++++++++++++++++++++++++---
>>   1 file changed, 27 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index 2c4dc7134e006d3530a809f1bcc1a6488d4632ad..b02c19bbdf2ea5db252c2a0281a569bb3a0cc497 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -513,7 +513,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
>>   	u32 val;
>>   	int ret;
>>   
>> -	/* enable PCIe clocks and resets */
>> +	/* PHY power ON */
> This comment is confusing since we already have phy_power_on() API. What does
> really happen in the 'test power down' case?
QCOM PCIe controller wrapper has way to force the entire PHY into lowest 
power
state by turning everything off, without this bit being cleared the phy 
will not be
powered on even after phy_power_on(), we can think this as a kind of switch
from the controller side to power on phy.

- Krishna Chaitanya.
> - Mani
>
>>   	val = readl(pcie->parf + PARF_PHY_CTRL);
>>   	val &= ~PHY_TEST_PWR_DOWN;
>>   	writel(val, pcie->parf + PARF_PHY_CTRL);
>> @@ -680,6 +680,12 @@ static int qcom_pcie_get_resources_2_3_2(struct qcom_pcie *pcie)
>>   static void qcom_pcie_deinit_2_3_2(struct qcom_pcie *pcie)
>>   {
>>   	struct qcom_pcie_resources_2_3_2 *res = &pcie->res.v2_3_2;
>> +	u32 val;
>> +
>> +	/* PHY Power down */
>> +	val = readl(pcie->parf + PARF_PHY_CTRL);
>> +	val |= PHY_TEST_PWR_DOWN;
>> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>>   
>>   	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>>   	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
>> @@ -712,7 +718,7 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
>>   {
>>   	u32 val;
>>   
>> -	/* enable PCIe clocks and resets */
>> +	/* PHY Power ON */
>>   	val = readl(pcie->parf + PARF_PHY_CTRL);
>>   	val &= ~PHY_TEST_PWR_DOWN;
>>   	writel(val, pcie->parf + PARF_PHY_CTRL);
>> @@ -844,6 +850,12 @@ static int qcom_pcie_get_resources_2_3_3(struct qcom_pcie *pcie)
>>   static void qcom_pcie_deinit_2_3_3(struct qcom_pcie *pcie)
>>   {
>>   	struct qcom_pcie_resources_2_3_3 *res = &pcie->res.v2_3_3;
>> +	u32 val;
>> +
>> +	/* PHY Power down */
>> +	val = readl(pcie->parf + PARF_PHY_CTRL);
>> +	val |= PHY_TEST_PWR_DOWN;
>> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>>   
>>   	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>>   }
>> @@ -994,7 +1006,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>>   	/* configure PCIe to RC mode */
>>   	writel(DEVICE_TYPE_RC, pcie->parf + PARF_DEVICE_TYPE);
>>   
>> -	/* enable PCIe clocks and resets */
>> +	/* PHY power ON */
>>   	val = readl(pcie->parf + PARF_PHY_CTRL);
>>   	val &= ~PHY_TEST_PWR_DOWN;
>>   	writel(val, pcie->parf + PARF_PHY_CTRL);
>> @@ -1065,6 +1077,12 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
>>   static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
>>   {
>>   	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
>> +	u32 val;
>> +
>> +	/* PHY Power down */
>> +	val = readl(pcie->parf + PARF_PHY_CTRL);
>> +	val |= PHY_TEST_PWR_DOWN;
>> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>>   
>>   	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>>   
>> @@ -1169,6 +1187,12 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
>>   static void qcom_pcie_deinit_2_9_0(struct qcom_pcie *pcie)
>>   {
>>   	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
>> +	u32 val;
>> +
>> +	/* PHY Power down */
>> +	val = readl(pcie->parf + PARF_PHY_CTRL);
>> +	val |= PHY_TEST_PWR_DOWN;
>> +	writel(val, pcie->parf + PARF_PHY_CTRL);
>>   
>>   	clk_bulk_disable_unprepare(res->num_clks, res->clks);
>>   }
>>
>> -- 
>> 2.34.1
>>


