Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5135CEEF331
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiHEjSZAG4Mqfi9SoOwsJ/RPKZBaqWBE4m83Wyn/ybs=; b=Qv16fFiSL8o0jQ2LQO3wU1gWqC
	Z/AzFoKMBUHtgU4yuukWNjgU+YW3FJ+YNvckRA7cphIQHgg/WrtREb2u+y/9TElwwMoVzPSBhqbQN
	0FRny1b7x7VK/fhNUAxiAouXwJRkHjN6hUmMQeoJajWz26dMGmli7Fm2wAWHeyYoGQa4FAnyMnEQ/
	wCQMaeZxBHlcjfHyWbfTYxDjrv5O9+rO3UYyFqi+qbIAUooJZPVR3czZLTWf8YpejAB2nm4qD2gIi
	rtUyQuouS3/rXRMkKB4bIdbbuzMIzgQ1hIKCtyRv2qeqSTA5mauTEi4+lhgOVgh05mINV70pITxFk
	HPmS5JcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4ZO-00000001GdH-1ld3;
	Thu, 05 Mar 2026 09:00:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4ZM-00000001Gcb-18GA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:00:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BgFb021039
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AiHEjSZAG4Mqfi9SoOwsJ/RPKZBaqWBE4m83Wyn/ybs=; b=P52m3yX2Xvq1ovMd
	xX2lLqrEVfvXZxZEGlfrwt6OtPMkLFtUDIsBR16e3VWXHw5TLGVjwnTL68Z762pH
	izetg/Gt6qaRXjyqXJOfWo5879w4oIVdfyzYle6x9AVbkG//Ik58BhtWYG1Hdj9m
	U4MAOWixwsi03L/GSb2HqojNaKFtoWvWx7LQYMZJb/kRQI0n8RNa9H7JHRexKD6b
	FE+J0ZFRiefZwnDLtpwwkeaVNiQBcuv+Ht51UJ/g4sa+JlUTsq3g4TdRrvS54J/V
	pkISgqbpekr2i72GIzfISCzcjuw+vDabMAyHzdI8cLiuy1MJrBplrMMYC490iEFd
	7DUy/w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptj0pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:00:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7378ffeeacso5779114a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701230; x=1773306030; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AiHEjSZAG4Mqfi9SoOwsJ/RPKZBaqWBE4m83Wyn/ybs=;
        b=M83kXY/kw5qqZmnUYOC23VVq9wNvYYdsgEp4mEZOMmFJY+8fMzjj79kPckszxIItE5
         eJW7fj/l7fKXKgpXT0ZxibZRou/E07RYplneZBzW+WxFWNzm3vbZiNJeOVASSHh4ia5C
         uJOTrBheriSBNnY3170HMFa+l+tNJnWyDEaKlBtg0gLezCBUaqi90rRNMvdh4gjLGbAN
         kTadaSHRajTXah69Zt6nhliwCenwdAWB0kXVFuCYkzjqvr/R+UNm1maZkZpLiWxQve+u
         JYADlozIKQF+ell0NrB08zMXwRprKgf9nzrBvum29NllbMcypWJoSIEDU3SDArYnfoNx
         RETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701230; x=1773306030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AiHEjSZAG4Mqfi9SoOwsJ/RPKZBaqWBE4m83Wyn/ybs=;
        b=gybHGVAh25AYnO998HbDbyHbpst1/LY07YPxNOuuUTjnocsBtibUkudoZFm8Eoi2IM
         KSuD5cu0CRXFgE9981a1CEn9eglhYSSq++lCSuzEGc+cNQyaTo0/xMFUX97UCV79UYGO
         LOih8SJSxMAgglsrpC+SdQXvRxJPMze55uZTq6KwH+zDRIBfF+8akwcrRNXGGTWimhiu
         RRNl0j4RFRRJXglV5xmguS22LoqO1ofxWd8Gytsgsf8IVQGiz3eKMoZ7q8qj356RQqBN
         RSYBObPGG/GCDypgMB/JS7uJa0OM44YBzUEapVm5w0UGYvBTIHb6s+AFOQ7HscZKxICn
         +5lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWapQvPxQLY1VFqnmGJWwmI9EHJ5uv/du723pDruy0AyfzWp69DU8H78HqpkMpJwgbRLnYPzgawtT2NbrcXGRIF@lists.infradead.org
X-Gm-Message-State: AOJu0YzF7Q0P8Fr/pI9taHs5HuVwhqZ1dJqJZcYXFyaEopuVSqpqBbh4
	w/GoqJihIHT3ZueT0hDuq33LSrD6/L1Iy0NdjYRs2mG1zHwdV5rav7TfvyDRq+SEjK8l9SkMlgh
	VgmxSqWp+cPFdEH3syGYG+USR0E62Up6iJkCjJhPa8Ab1nTowg9zHPCmKlJF4Ni4st6wuqL+1BK
	CNgA==
X-Gm-Gg: ATEYQzyPr3dZsN8QheAhGBAGKeaXYakBLnu8SDw6qv9uIL0EjyXnA1alRuf1WhAorwj
	/vKIVxs9OASK5enjoP5YTvRuwAmyah5Leov2O5+qw9gdlIMUXVUBrrfCcWfPamMIfKgCIKZpSdv
	MxCO5YYXSr02rDGTLFT1gfSdGeiBhQkZL+BN9SLqiIq0Vk3XyrvMhwjCdetPKWcCzmY0pUXwvky
	Y85fl1gM/5JRlN0oygEdTm8w3vlWFmmW9U13LDml3BRz7oNni5ZLcHrTv3AdIIstVavHb5CEMTj
	ybQ0cMADlYEZdCZuUEz8p1nDmJ9GXtUG8ZMcR442vJZeHBiJFQ6a4MdEZ6fjByaZP1MuTnaPqUz
	hM8FEKHdahSYnk3FLHdkwCXhwjfjsXKmp8KeAC6fEuQ5tCoBQkBL8tQ==
X-Received: by 2002:a05:6a00:1ca2:b0:81f:5f49:6913 with SMTP id d2e1a72fcca58-82972c326aemr4406457b3a.30.1772701225507;
        Thu, 05 Mar 2026 01:00:25 -0800 (PST)
X-Received: by 2002:a05:6a00:1ca2:b0:81f:5f49:6913 with SMTP id d2e1a72fcca58-82972c326aemr4406402b3a.30.1772701224928;
        Thu, 05 Mar 2026 01:00:24 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8297ef26eb1sm2222701b3a.49.2026.03.05.01.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:00:24 -0800 (PST)
Message-ID: <c0cb73d6-262e-4529-8b07-4c545c76015b@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 14:30:17 +0530
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
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <om6t5hlnxadpmet5i2gochjmfjw6mdfllrdbgewiz4u6vj3zot@nse5rbl3je64>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MSBTYWx0ZWRfXy+b5Y3fwMI6l
 yg9cVSOoFnQBGKG6p7p+pj5JvzTxQSZE9zZlA8NaDi3ajLv05/u/hiaB8Y3b4BMawR1zjlBDqCE
 gFp10R3Ys88hxfqVZl9BllnoJBRcJ8Qhwqa0geZI2aLsO+tYWY/5D6Fv3pnmCXfGVamlU4mkvHc
 hi1zZZvgp/ZljbJ9Gq4MylFrHTYc31P/jYPkQZpAEAGErP0OqqzZiJhDDLfFT8XP/vn85hQJc05
 TejmvT3pY5PmPHQLs4PRWv0Oay0Xz9Qspp03osR8bfq4gb0H/bphPp8igrOpJ7O83bCAxeDPmQd
 KzlEIFdfZw2AzOztCHBhuptfpHxGFIqBLwjpFQU4sa6aPKlZPu2BJWOpEOiZsaVyfD1txyayQm7
 YC+xdM4aVDixPpTQg6wZatJ8dM5mG3VEqOC2JP45r2gtYquIaGWh06/lDM7u8tvw3nl1gm5bF1n
 jtJwy8Xgo7YWoV/1nNA==
X-Proofpoint-ORIG-GUID: b3EyiNhNu8ZmP13Cyc6jDTMhpW2gDEKr
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a9462f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cbGetAF2pF-RjulI4vsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: b3EyiNhNu8ZmP13Cyc6jDTMhpW2gDEKr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_010032_323674_C5BCC880 
X-CRM114-Status: GOOD (  24.65  )
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



On 3/5/2026 1:28 PM, Manivannan Sadhasivam wrote:
> On Tue, Feb 17, 2026 at 04:49:10PM +0530, Krishna Chaitanya Chundru wrote:
>> Add support for transitioning Qcom PCIe controllers into D3cold by
> You cannot transition a 'PCIe controller' to D3Cold state, but only the
> endpoints and bridges.
>
>> integrating with the DWC core suspend/resume helpers.
>>
>> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
>> into the DWC host operations so the controller follows the standard
>> PME_TurnOff-based power-down sequence before entering D3cold.
>>
>> When the link is suspended into D3cold, fully tear down interconnect
> You cannot suspend a link into D3Cold. Link and D-State are different.
>
>> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
>> by keeping the required interconnect and OPP votes.
>>
>> Drop the qcom_pcie::suspended flag and rely on the existing
>> dw_pcie::suspended state, which now drives both the power-management
>> flow and the interconnect/OPP handling.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 121 ++++++++++++++++++++-------------
>>   1 file changed, 74 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index b02c19bbdf2ea5db252c2a0281a569bb3a0cc497..37442bbe588c36b0b0414cc4d0016da2d8424a87 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -145,6 +145,7 @@
> [...]
>
>> -	if (pcie->suspended) {
>> -		ret = qcom_pcie_host_init(&pcie->pci->pp);
>> -		if (ret)
>> -			return ret;
>> +		ret = icc_enable(pcie->icc_mem);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);
>> +			goto disable_icc_cpu;
>> +		}
>>   
>> -		pcie->suspended = false;
>> +		/*
>> +		 * Ignore -ETIMEDOUT here since it is expected when no endpoint is
>> +		 * connected to the PCIe link.
>> +		 */
>> +		ret = dw_pcie_resume_noirq(pcie->pci);
>> +		if (ret && (ret != -ETIMEDOUT))
> No, dw_pcie_resume_noirq() was reworked to return -ETIMEDOUT to indicate a hard
> failure. If the device is not found, it will return -ENODEV. So you should
> fail the resume if -ETIMEDOUT is returned.
Ack, didn't noticed the reworked changes, I will change -ETIMEDOUT to 
-ENODEV.

- Krishna Chaitanya.
> - Mani
>


