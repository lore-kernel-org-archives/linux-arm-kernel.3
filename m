Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383D5FEEF29
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 12:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQ/FbsFha5BP0Qq1tyZZGZ3cnWFodwIbFLgBI/EBXAY=; b=Bjg7N+OIJmjeq9RIhsKgWCIE1k
	FNdHAsErZ8ICXN1S0NHdcdV2dTJwKV4hrs6EQFjOmK3MnDeyi1Vvuz0P/DFyB1M2O8jPfVYgqkglq
	CUvV6cy+QIFhBOYqjkF0S56qCsGjfgEsjMrt0HRUTCHtcqnT9hiibc1DAbtV/NKxm2BCG709PDYEP
	fgevK38xb8P6sYabNCkjPX/94V+fkXna55jRZ5mhPAHVBvF68hLOS+vO2CT09n4hgSPZIn84B4GWX
	9NSSo1utMKi5R6JKXbmzHIer86nu5s6jxGxghU8FEMRvPeoK5L09L/Q8CFTm+XBxH3UoL3/5w4WY3
	C4LBOknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5WV-00000006RWa-2SFz;
	Tue, 07 Apr 2026 12:27:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5WT-00000006RWE-1Ryq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 12:27:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376hNgp2580434
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 12:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ/FbsFha5BP0Qq1tyZZGZ3cnWFodwIbFLgBI/EBXAY=; b=KcKAzBGuA+uNFqh1
	GUHpbNgWwIoGNOKORSUj3iVxVDVXXJ1XXA0wQapsFX2AcdjsbZra9geP0hmLaSaR
	V3aroWBEhwHEC3qI4zVaKoFXYq1r82xzdaZarJfxey02dAKR4b6SGQbsywjI9VMG
	gM8tBry3lyZODzTzGOaawTz08sAtd7eOr9djkmht6TahjmhNxomg9NooXhBCBqnW
	hmiNhF+rJ5rijbqYzF8Fra8momDu2k5RPfUA76f1y8ZAPLyWACHY7QzpinaTWT8v
	F45rNtozzpa9okshLJqFFLvv4txyuZ32bipbBkoP4lVfBRL7kBWFKSCQUIuwJKBX
	/R7fvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf2pjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 12:27:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso19409951cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 05:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775564832; x=1776169632; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQ/FbsFha5BP0Qq1tyZZGZ3cnWFodwIbFLgBI/EBXAY=;
        b=WPk4gkZiJ2+FoeN8EfTz3o64UcJvMCJCOGs7p1nhJP17dJP5bKgxKsmqa5AG3eTmPf
         VORYTvOnEfxQofLwmK1wS/s9w04fz/ZPlY9MBi8vYdSzI5jEu+UcQuV4rkGvNJtysieI
         iKFL5OYY46HQKKpz7Qj3iAa6RmTSGkI7leLsmFGELeKDsQiDpynPvxnDlISN5qA90h3W
         KKudAz5Nx2p5HrTYckHtjGY02/apY8sZzmYzeGYqRrIuVgCVZOjW6URha60kO791etbB
         G6J9aU44CBTl1I9VvV3O9YBhwNTK2U35Oot7u8oPqyH07uv9uMtUROE/RiDcQsTD06vf
         SYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775564832; x=1776169632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ/FbsFha5BP0Qq1tyZZGZ3cnWFodwIbFLgBI/EBXAY=;
        b=sKcTHpQqixJwxzf5bClm0skJbAXQNl+N5jmVg6LiqDDELG7Td9wOgwp3ZjV4gShkDj
         NHlo0rbJwt7MWnfHQSOrB42Fruu+wVS9Tqvlj5vPbtO+CEjIpIJ8TSmb9EnafBlFLYzr
         KwDG5G0klOe8YtzKTOwA4iMbea7P8A5wBV0Mh2hq0Gk/8O22ORbcktyBQTxoofYlJlbL
         KUixDX+g2hhc/LoBQ6p+O0j+9uDAxHZOYL938upseT1DeMJxDoV7daVzmwVTgv/JqVoV
         Qig4v2iak5mnVKECc2v3iF9CQqWY080SRxWQmwnXvIi6xD7thImvevqtRaXca2j3dsNS
         xvUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH2CMpaWqEHaH0TkbxGvBrwkLHp1BANHv6aQ5RDdy9mW0PldcZZ/9Olxav6KWjTmA3dOsmNEKbb+4ER+ucIUCB@lists.infradead.org
X-Gm-Message-State: AOJu0YxvJWAqSsoy6wuFVkTouDwbsZoJ9N21n0sQgSoxAE/iVy4fM0+R
	n4vF/6cN26UefHqiMk6hpuFTMdWO6AaJVbX6mWDLhWpigJDAXnazUxydY9vs//DlMHiPviSylLz
	2W3i9RgGl9Kkw0MIZ6zDyfJof8FqIxMHS5KWgkUFmFz++zaA/aM8toc+m2LtIFkrjFTcip1H72P
	nTXQ==
X-Gm-Gg: AeBDieuNxVdDZAp51NoDizsdeV3D40XhID591Lh5aW/orT6SEx4jTt6qY7qoVnA5r8I
	9NM44L032mxZMUN+/IHV1bchGDRWvxz0ocagMcgaCkoKFodv2/eNHyOp3zteIgRRRaNYHPN1+0q
	fH+jKg9tUGWY31eeGrkM3peU3m57NV4AiSKtsWGKava3d8eo4nZnDWrAULy8zLC5pcQb1IZ2M1I
	Z1Ud/J7GmK7lMP0ERywy0Hbq91z3liIulUOnAHxiVP6iGnTWskYV+DA7hvZeBR3iC5FEMjkscGr
	uTc+BjZOD12lJZgU2P/9/+8jt5Has/OkeL3pwrEnc62RvZBqZ/i1wXcCoY8z1IApppNbltkfNIi
	WDJW0MUIRoUMwoWKkiu7pgdEhJqTqCY0MxmoYb3uQ8al17tQBS8LMiwAqJ3+xVroahMIp7J5Ea9
	leAgE=
X-Received: by 2002:a05:622a:15d3:b0:501:4767:a6f with SMTP id d75a77b69052e-50d62c47a06mr180545831cf.3.1775564831695;
        Tue, 07 Apr 2026 05:27:11 -0700 (PDT)
X-Received: by 2002:a05:622a:15d3:b0:501:4767:a6f with SMTP id d75a77b69052e-50d62c47a06mr180545411cf.3.1775564831264;
        Tue, 07 Apr 2026 05:27:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff19c0sm547473366b.48.2026.04.07.05.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 05:27:10 -0700 (PDT)
Message-ID: <7223c10f-6298-472f-97df-8753b8935598@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 14:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add D3cold support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
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
 <2d193ac6-619c-4cd7-b0f1-39f5aa1ec02b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2d193ac6-619c-4cd7-b0f1-39f5aa1ec02b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDExNiBTYWx0ZWRfX/ktFfwYY0cX/
 lUEUoc9KzkodegE6UtSPfXh9QBbgyLoFiqOYrQLG1+6EL5KdPGTPSV6AmCzDaibJJCPfIciWXkZ
 pHxFJt3D2q5ik1i9SWxpr0xR9Wdp7+8BwpWxYq6y7mff3wC1US1UxbPSs/Z0XnoaIvJcYJHhIO1
 nLhS/rs1+hJVxgDNtW7B/sV+kdlr1Je+9UXI9kehO0lyuXhERfE6ANnG/L95/0UODIsIU+UMm+x
 VgzSWhGyzNz6z4s4dI3XnGHpXK7jnsHcuWtMEA07XSDqs4VmSjWPQcayFysSxdGoxhcsqy8NCOH
 5VuLOALBru7f6lMtxEoZ+fnV4RLMv/PUDaZjFPmcXpF3HOB6ZRLRnu2FsYtU/CP4WNK82ULXqbj
 8+jGb+ZGIU7S7lax0ZHKkRgfbcZgEsAYfrIoNONhqOs3Y4uHMhjHTjdI7A3EmNYpwRlPn+EGoGo
 39pVAIDzHRE6HmJo9nw==
X-Proofpoint-ORIG-GUID: D-qY7kw3t_refN1kHNMBalkTwYqX6PNo
X-Proofpoint-GUID: D-qY7kw3t_refN1kHNMBalkTwYqX6PNo
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d4f820 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZCbfbMl1FPzj5El2ZOUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_052713_572261_72EDEDE0 
X-CRM114-Status: GOOD (  13.34  )
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

On 4/7/26 1:37 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 4/7/2026 5:06 PM, Konrad Dybcio wrote:
>> On 4/6/26 11:08 AM, Krishna Chaitanya Chundru wrote:
>>>
>>> On 3/17/2026 2:45 PM, Konrad Dybcio wrote:
>>>> On 3/11/26 11:26 AM, Krishna Chaitanya Chundru wrote:
>>>>> Add support for transitioning PCIe endpoints & bridges into D3cold by
>>>>> integrating with the DWC core suspend/resume helpers.
>>>>>
>>>>> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
>>>>> into the DWC host operations so the controller follows the standard
>>>>> PME_TurnOff-based power-down sequence before entering D3cold.
>>>>>
>>>>> When the device is suspended into D3cold, fully tear down interconnect
>>>>> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
>>>>> by keeping the required interconnect and OPP votes.
>>>>>
>>>>> Drop the qcom_pcie::suspended flag and rely on the existing
>>>>> dw_pcie::suspended state, which now drives both the power-management
>>>>> flow and the interconnect/OPP handling.
>>>>>
>>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>>> ---
>>>> [...]
>>>>
>>>>>           ret = icc_disable(pcie->icc_cpu);
>>>>>           if (ret)
>>>>>               dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
>>>>>             if (pcie->use_pm_opp)
>>>>>               dev_pm_opp_set_opp(pcie->pci->dev, NULL);
>>>> Does calling .suspend not drop the vote by itself?
>>> No, unlike genpd framework for power domains, opp votes will not removed as part of suspend.
>> Hm, I would imagine the power vote goes down.. is that the ICC vote
>> that's still hanging if we don't do this?
> yes, ICC votes are still present

OK, thanks for confirming

Konrad

