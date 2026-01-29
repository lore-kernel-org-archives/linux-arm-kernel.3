Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FDDD3569F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 05:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKoXPY18PiXfeWMbOYFRoh1FOM50vlwPkV1H+RANrjM=; b=kJFXdau9rkJilVGEbCeTJ2JhgA
	5xJ64J2QC96KhE0DLL5Jq/YyulYU7IEPwQVX5vlTfS7MPpKT951A+6naM7vyU5R7LCBld2pFGv7y0
	3N7bN1D86z2rL8SEfvz19egdEODTkICW13+gCyIVXFKGVsIaqHJ9yOT+2ErAyEBKu2EWvEZw+JXzc
	btd0iiZYLWaZqh65y0NKYyvaOKMx4Vr9zvAK+BtCU7/5FyOHQJ0wMlltJGO8LTE+SfEzMqs+fPxz+
	5srz9FtTYxpNMAqsuZ8uX7Ilq+I16nfzBNq1yEmf4Fq1hRqjqDXq2+v1Owhabi72N5r3cIBjn3Sxi
	HDa0mmgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKc0-0000000HHGv-2tUt;
	Thu, 29 Jan 2026 05:30:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKbx-0000000HHG0-49M5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 05:30:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2otAH2060683
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yKoXPY18PiXfeWMbOYFRoh1FOM50vlwPkV1H+RANrjM=; b=nkGaXqoaF9w9whPY
	fEBH3bMtELejZwf9rNUBnzaHis3LwfitrizVnxrNhNqr+onU/86dTrKrXbL/sg7j
	Dz541WvgmktnuUvPV2Upc9+PSX8DNC/Ql7ZGhuUkfrtOYSXhll/QOxDtCc8HUvO2
	lUfaXCy309J4zYHgTQJd6AXcv5rKP/GH3+Q5MPLwMsb2+I1m98nCR8X0T2ep9Nro
	vDph9PwU6dWTcii5bcCTzkf0V1MZayTokXAYShRfmSbJzf4C4F0by4WB9ru6uBZS
	Zjzly3/CSBseW6YThVTwS8vEIX6QD5m4Jm1d3XbBtiFf3i21L76FFR9q34HOKuoB
	S6JENw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypgrj2h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:30:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c704d5d15so1036412a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 21:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769664633; x=1770269433; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yKoXPY18PiXfeWMbOYFRoh1FOM50vlwPkV1H+RANrjM=;
        b=GW1jb0fvkZJZQTBWAr5ktL6sEVRGfWdByTQckxPscEHzIsLy2/9kWkq54/w94X8Ikt
         PYMdoUsqRyVgZVfsXDY9wvoOASnEQMDMiji9jPdDIdy4F7h3kSYkh2tPaGKqHNBa2HXq
         5acrE5AyBy5xZwzogteEZ1pT2EZoHleIRjj2HTZF5REuKkyZFQldYotK1hPCl/qgdo0Z
         thTUrmv+BMplDb9rj7y+CBioYZ/PbFl2pWiqrWYXBmw1tnCTByG4tZBv8Yeb+MYkQkGB
         WhWrqHe8dBT/PZZmkbSD7mARNntzmKzU4m+DuAtAPR8flBvoQM2szYCrw0sOuGyvH3Ao
         dkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769664633; x=1770269433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKoXPY18PiXfeWMbOYFRoh1FOM50vlwPkV1H+RANrjM=;
        b=GAJvu+afJYd8MlNsqJUnMaub7+Qg08lIydLq7zz+hmlpE/zgS6482egKIULwUJ3yE0
         WAZTQaQlFQBUkMQQNGENhGvrKlWFdktxZBStA1n7Lr1p4aKz+ZRBVeQ5pU3mGBUFAkeP
         g4/wrRHQvO55iOzi2Ev8lLix0VAaTkqRVZFlf/cSQifiJwpkcNoTkiMPQnuxdnyHG6mM
         5VJ7uieXoOLI3ZwzXBQOppR5sjpC7J/c8roT8GCvrq/aWSPfo7n21TubsziK8YxPQGeT
         7asWtaisDyEVrFXtoWE1N4twrW7KZkODx0L8dcQ2CYO5iBdqZr5cl2xe8ldixiP1qzoH
         jukQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf77VUCsxGwkOISlh/ixvsL5AbLnaHuPGQJSFOxTacl28X5q6F/5D22kwrgPAKDGjTsPub2uHg1JmDDLF5wB1d@lists.infradead.org
X-Gm-Message-State: AOJu0YzvOeYDTSGDbqfRsEdCrCkOExW3/dHKvBLpWKXnguTzq24fn/Jk
	XKptmHxxUgsxG2AMslEdUU4Kw6swNEyrwGnt7MrKOpil97MGi9jVM9xnvOA/EkzZ9v+oqYWan5m
	eUtACVPGTw5WfdAk2ekYCSg0ElJdk1ySLHtwuPZB76C2/0wdV6bKJTFAfZRLqS1PSqcGnGDcPgR
	UX1A==
X-Gm-Gg: AZuq6aLWvgDbTkRjHvd0ox6gtL8hHAo7bKFt+ADO0/Rh8jKbk1Uq2YL+GxBox3ls8Fs
	AHm3fT2/KCkUUxLrtzdC018JpW3gPlYHQluS2wCY97Msp62JiM60fRLM1lOrLVhgfw0+zq7iQmW
	ZAp5BWlJBq4snFjcRUxBjIZhXma7z4vTJPP+JqMXTT8daK+HKGfigTUCO67t3/aekxmxgPWvPVW
	lpzthZrFhFe1e33yW/qNlHffY8dWA+rcZUm6W1nueWzOM05Lut4fKK+fWKtKM/j4KyiPcBYFenp
	Xb7ex/xJ7H9CB/XQCOYAX6pQ+GwVFZgPbjG+mTj1wCzVcW5gAsxvnGa+hEmNNnRK/rsfNeHcycw
	+gIp7/D1BwDbn9P+rxUMSIYlvCGMou08aa3/Br2Sx7w==
X-Received: by 2002:a17:90b:2f04:b0:340:ad5e:cb with SMTP id 98e67ed59e1d1-353fecdcfabmr6603864a91.8.1769664632720;
        Wed, 28 Jan 2026 21:30:32 -0800 (PST)
X-Received: by 2002:a17:90b:2f04:b0:340:ad5e:cb with SMTP id 98e67ed59e1d1-353fecdcfabmr6603840a91.8.1769664632180;
        Wed, 28 Jan 2026 21:30:32 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2cb0a7sm4092295a91.2.2026.01.28.21.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 21:30:31 -0800 (PST)
Message-ID: <f6f860b7-71fe-4fea-84ed-a93b9598ce06@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 11:00:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <20260128-d3cold-v1-2-dd8f3f0ce824@oss.qualcomm.com>
 <oygssx4tnd7uwofk4ucqj2ypok2zssnzbauzar2f65lzougr3a@vp6b7y4j56k3>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <oygssx4tnd7uwofk4ucqj2ypok2zssnzbauzar2f65lzougr3a@vp6b7y4j56k3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d7T4CBjE c=1 sm=1 tr=0 ts=697af079 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nF4YfsMlPaNBOkUFFLkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: nJhlhuA4vLrGirOkU4DYeEW7IifHPISD
X-Proofpoint-ORIG-GUID: nJhlhuA4vLrGirOkU4DYeEW7IifHPISD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzMyBTYWx0ZWRfX4kvZ5BADymQ2
 ZxrzHXt5i/C1BPuVtO3DgggxVh8mssvOB+kdPO3UdR7khuOo/tGFphyIk9sEfcnpkbkzX2GEiNo
 ykCnvA21JUz8SfpjUZaa7M8gsy4jzKh/nXlGnYpKuCea4AD6LC+OqMA9m0WeqiFBVmUOXDAKVqX
 +FsnoWmm8ssJ/c0KzidbqE8OFb/VdXcekZZs2LUGnAlY5tziPXrSxiHvVLGiETzKL9oOEYISc9H
 eB/I9F9/OvjGW9DOUJx8s3txAdhNPBhvj+DvaUycn8mCz846bmZGoN0i6v+w2o3AYfEKBTit9ZH
 wGlHvkfcQe8HYOyH4VuUu6jlgjEfQyerSC8cfSb3CrHApCTEHzz6os1zR30k+hqYw5hfhl6wZJQ
 Bcq2FoOUZw5Ah79naJ0/KVA8rJ/NiSY6w1cf7JIEIyzn70xXDI9vfrG9tqGwvOygfIXUQtWz3uE
 yXDWAL2Axv722LpNzJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_213034_068371_269986B8 
X-CRM114-Status: GOOD (  22.32  )
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



On 1/28/2026 7:58 PM, Bjorn Andersson wrote:
> On Wed, Jan 28, 2026 at 05:10:42PM +0530, Krishna Chaitanya Chundru wrote:
>> Previously, the driver skipped putting the link into L2/device state in
>> D3cold whenever L1 ASPM was enabled, since some devices (e.g. NVMe) expect
>> low resume latency and may not tolerate deeper power states. However, such
>> devices typically remain in D0 and are already covered by the new helper's
>> requirement that all endpoints be in D3hot before the host bridge may
>> enter D3cold.
>>
>> So, replace the local L1/L1SS-based check in dw_pcie_suspend_noirq() with
>> the shared pci_host_common_can_enter_d3cold() helper to decide whether the
>> DesignWare host bridge can safely transition to D3cold.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-designware-host.c | 7 +------
>>   drivers/pci/controller/dwc/pcie-designware.h      | 1 +
>>   2 files changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
>> index 372207c33a857b4c98572bb1e9b61fa0080bc871..2c8056761addf7febc1b0e06ddf8ba4dd4ad1684 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>> @@ -1157,15 +1157,10 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>>   
>>   int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>>   {
>> -	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>>   	u32 val;
>>   	int ret;
>>   
>> -	/*
>> -	 * If L1SS is supported, then do not put the link into L2 as some
>> -	 * devices such as NVMe expect low resume latency.
>> -	 */
>> -	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>> +	if (!pci_host_common_can_enter_d3cold(pci->pp.bridge))
>>   		return 0;
>>   
>>   	if (pci->pp.ops->pme_turn_off) {
>> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
>> index 31685951a080456b8834aab2bf79a36c78f46639..18d8f7d5d23088b2fa177e84a21d900c98850fcd 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware.h
>> +++ b/drivers/pci/controller/dwc/pcie-designware.h
>> @@ -26,6 +26,7 @@
>>   #include <linux/pci-epc.h>
>>   #include <linux/pci-epf.h>
>>   
>> +#include "../pci-host-common.h"
> Why doesn't this include go in the c file? I don't see that all c files
Ack, will do this in v2.

- Krishna Chaitanya.
> including pcie-designware.h now needs this.
>
> Regards,
> Bjorn
>
>>   #include "../../pci.h"
>>   
>>   /* DWC PCIe IP-core versions (native support since v4.70a) */
>>
>> -- 
>> 2.34.1
>>
>>


