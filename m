Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE509FEEF25
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 11:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7UJQkkG+/fsSZcV3S5WdK7zwrMcxYvVIRINClEe4V0=; b=EHadJc5YCOeUN1yF8DoCRq7r3M
	owzcLLTBuPPZJaM4DyLDssqw+ZiMFJC7zO7NStsRg5AfOlizASr0OADnuaeuRRyWTDuNAP0laEkAA
	M8D8l3QjFnjqjg+PBokYGsBqNhc3mm4JNWR25BKz7sqr7yM6EXKuxR3ITX/lNhMzGLOLIT55dEgKu
	efxvAc6ccZWSbrerxfwE99st2NPspwfYN0IFKh2l5aZQqN7db3BLJD3Knsm0Pe9RFlNqIdkHKBWdg
	c3FHSQhkxA3bF1ncWhG9XbYHMkosov1/F5txRdHSFOARYTATsqin3fyKH0V5tOtASf8mngbDPuiL5
	wKpE+W3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4kR-00000006NoS-0MCW;
	Tue, 07 Apr 2026 11:37:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4kP-00000006No0-0bex
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 11:37:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376e2Ai3536962
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 11:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f7UJQkkG+/fsSZcV3S5WdK7zwrMcxYvVIRINClEe4V0=; b=hW6JDQ8CE4xQnYxT
	qqy31TKUnwhwrXoLkAMm2bSXgIXhPPvHRnBnx6oKcvUpBDB2uCOQQWAeZvAubsDM
	JdGEeDzz142dCXAoL3xA8QxIigULTLuKpiNHlfOC4QmLIcmfqcbOXg858MdVXJ2h
	6GUmGqTKki6pAg77R1kfVZXG6KNDwMRxGRtJ3p3XWBvZT/fYL2uq0Ilk3g+Q5ah8
	NbQ6XwvSDH6CvqPfLv3VVs5iurC6wdxOoyLL9aaAr+a6Cl6qN5GZHaSkJyLWl++/
	ibBtv2UrvXvWpGAUh7SjTLPcDE/cbT5WUEOwZazQooXJf94hKYsRCfioBaJ6cfEn
	vFC31A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra2h2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 11:37:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2471321dcso140082825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 04:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561851; x=1776166651; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f7UJQkkG+/fsSZcV3S5WdK7zwrMcxYvVIRINClEe4V0=;
        b=QZKKDXZwr6lSmquY5u0mkmIbBQkPYt0YuiM9xcVJP/bsX0q95z9Q9It8e9Kq+RUirw
         SjUULOLBMaDDxvieB8EhRth4hfaHFK3r4UoAdSiAaF8tjpNXYwzpTKXP8eeJa+d2/XY4
         qhFrvJx1ohX4tWQOSjLt7w7iwjAR1PKqmnVehNId3FyRyWzjw5lca0PjzU1sMuUH1REv
         gkL7yLf3Y4NNGV5BbluCSsGRWUwkU+NVpXFvf60raIOo2Et6Yn5R4dH5IM0+Df14s6hT
         ednA8QxzJIprMwj7C8KojDnLVasokhSp6C2KzpG4Pusjn85CIp2zC/0AOqtoW9LpBaUv
         wFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561851; x=1776166651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7UJQkkG+/fsSZcV3S5WdK7zwrMcxYvVIRINClEe4V0=;
        b=L9+PvPtQRfDIatnIourGn/42JsBQ6JwFsVN+Yqprf/1FL8D48/qkl7bN1UqsYWNAKB
         0AIv1o5eHWkcI/q+MRjDuYlBpmS7/jexYmID4FYtAD1af4XHdMYgaamn7jgdS0SPZ1d4
         ECs5UgX6mb4mTL7M9InPRzOQpn/CAnmvWoLcatUxNZWjGnL4KvrODPIkr6lP+YR/rP/Q
         oNDNVkYARa9v6RC3sOgmXzoZWcu0olv1M4hcFsd0ZPUVsN9SIcqQAUW+7/yC7Ek6x2AX
         f2EM/liW9XOjLHm+1ozGRr36vhwBLlRela0UFh4BF8Bm2kpoWSBYE88ReSIatRfj5cQH
         KKxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg5nWqUCHuvOWe25+Q+hiq/z8ikqX+j3pDrwAlankJQ34Y0A1bHqbh8//io6e9LEHJJYTpGl/bXsKaW/9MAjmn@lists.infradead.org
X-Gm-Message-State: AOJu0YyUjVivAvGzulDhiF73OezW4hKEPHMpvu7uIbtv+O7CSCMvRdAM
	Uh4i7dfvIwi6A0/Ipljy+Ia+9tdPS11xajoNB62ycUalzVAtubOSlKQYQK57BK6RFeYvhq0b14c
	oSYYvkcxbO4a0uRCRpIzVVms/TD87b767S13a2uY/AEVm1RUkWcfPMbUWPuPuni5n/jNis1vmVV
	zCRQ==
X-Gm-Gg: AeBDiesVVewSzBu87tgKSgVuIIecMBXAsZ2UC1ay/10OaLs8bJCTeiDGFszgbTkAbKb
	XI6z4kP5u/NHz3ivjUfBuQRrGsoogFqDJwZnB5VCDMsoCo8JzL0pPqk8/3UkIkxFyeeoXGNJ/kl
	JpipvbNdjVAPQxVtSK762ZvGDZCfUUkKgH3NrGiSe0WG4k3TRiw8ymWCucm06/R0sg9o3r6w+FZ
	sC6GvlCfGPtTaXPlaR33q/i5r+OqiBBt5xWBdw8FCLQ/4xTCAPX6YqYEpvM7sAzMRYUGXn8nSGu
	hF+Kf8U/PPIDh58A3h4UWQum1PLtp4nPWBgoAiJqlKgdYG8kxgcOQAyh/5+d3hP00AzQ1luG2R2
	ylgZUTJOCTePsprKFZyrQqBvw3aSj9X8oWQUWdOCCCT0n5nOC2+HJ8g==
X-Received: by 2002:a17:903:2c05:b0:2b2:5840:809c with SMTP id d9443c01a7336-2b281828136mr176408845ad.1.1775561851213;
        Tue, 07 Apr 2026 04:37:31 -0700 (PDT)
X-Received: by 2002:a17:903:2c05:b0:2b2:5840:809c with SMTP id d9443c01a7336-2b281828136mr176408545ad.1.1775561850792;
        Tue, 07 Apr 2026 04:37:30 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2af067a59sm22227085ad.10.2026.04.07.04.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:37:30 -0700 (PDT)
Message-ID: <2d193ac6-619c-4cd7-b0f1-39f5aa1ec02b@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 17:07:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add D3cold support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com
References: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
 <20260311-d3cold-v3-5-4d85dc7c2695@oss.qualcomm.com>
 <f3344006-5511-4f1b-aea3-7dc81a091cd8@oss.qualcomm.com>
 <4a18abf4-32b0-40c0-bdd1-81ea819c4089@oss.qualcomm.com>
 <38f51e0a-fef4-46b5-84e3-0138cc5f79c5@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <38f51e0a-fef4-46b5-84e3-0138cc5f79c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TXbpWezM8xSrbZg7z5lxKlNs16Z-z-Sj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwOSBTYWx0ZWRfX/KYrwKzIeo0e
 WUJ35xPNIYk90Mlixjq2uEWe2rWPbYRTnwyNXAjsx9EnfpRTTznGqYKtqzbmA4ZRNOEqQ0eXWvT
 3uymbY37eHJ5t5LjILG4c8F+2scdaTU9aT2m+pyPIFDjGnp1+k4XmjnhtFlzQgBmJlzVGJ3e4gc
 g3wrn/MjFUOjQLRYtpMuh8sMfgaTWtBcLDIVL+rPYFwW6xq1EU7feDwBP74MnbhOAQ4KymYFNoQ
 kiacsLTR/yXW9b6hvPgCYaF0jgByEReqFF7du9SJ9W5VQ5Ocbr9eExwzapXH4I3Qe0TKvXcNOoD
 pV3cqZ5EHuM+EF5E6IZ0rSM6Vv3KY3EuTe8s88m2WwVXl7cDRqT7Dvh3kxZ5i+2iw9kPTKjYQAe
 sUB6Ug3vLHvmADU/T8tFbGImPYYZVN8R8o/kIDWFNhYWxgBD0ja2It1qruAMQ1ElUwCsg3HrDxv
 4FaA+muMSF7vK+21sJw==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d4ec7b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MaFP3Q4kykvwS0bM9pgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: TXbpWezM8xSrbZg7z5lxKlNs16Z-z-Sj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_043733_188475_0FD52AC0 
X-CRM114-Status: GOOD (  13.97  )
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



On 4/7/2026 5:06 PM, Konrad Dybcio wrote:
> On 4/6/26 11:08 AM, Krishna Chaitanya Chundru wrote:
>>
>> On 3/17/2026 2:45 PM, Konrad Dybcio wrote:
>>> On 3/11/26 11:26 AM, Krishna Chaitanya Chundru wrote:
>>>> Add support for transitioning PCIe endpoints & bridges into D3cold by
>>>> integrating with the DWC core suspend/resume helpers.
>>>>
>>>> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
>>>> into the DWC host operations so the controller follows the standard
>>>> PME_TurnOff-based power-down sequence before entering D3cold.
>>>>
>>>> When the device is suspended into D3cold, fully tear down interconnect
>>>> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
>>>> by keeping the required interconnect and OPP votes.
>>>>
>>>> Drop the qcom_pcie::suspended flag and rely on the existing
>>>> dw_pcie::suspended state, which now drives both the power-management
>>>> flow and the interconnect/OPP handling.
>>>>
>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>>           ret = icc_disable(pcie->icc_cpu);
>>>>           if (ret)
>>>>               dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
>>>>             if (pcie->use_pm_opp)
>>>>               dev_pm_opp_set_opp(pcie->pci->dev, NULL);
>>> Does calling .suspend not drop the vote by itself?
>> No, unlike genpd framework for power domains, opp votes will not removed as part of suspend.
> Hm, I would imagine the power vote goes down.. is that the ICC vote
> that's still hanging if we don't do this?
yes, ICC votes are still present

- Krishna Chaitanya.
> Konrad


