Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9E1D3566B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 05:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUPoMpMVlEL3H0ESGc+sM4Kb5NFh5pqIaVsEHs+9/rk=; b=BCJ5VFosMaxH9jhvZMr1yMQMLD
	sZJuIMIqXQbzyvMZeqYT3CL25zTaFM3sZitdsBguNuxCoUR1mtiXskbe9mEpvXMxOoYKkGY2GGk1V
	YT0lXWRep3huU3wwCwshycwWnqTDrREMBUSw2JPIS3T/P4YXexSHFu+52jMXN625ohN+DOfEsTKCn
	b8J26Ks/ilQ45H+6RM84uSXfC4y43NQo7ag1IE0g7gxIHqSKgO4XlZk9L9eQ2KrISKn6GSFP4IWmG
	T+2Zx5qK+l7QSUXHHvsg1NgFNsXc3Jnn8X6zbSyJb0tLGpqqUlaebRh7TWM7cp+hv3IKy24sFtGOY
	fIDiU1ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKVX-0000000HGmm-0Gen;
	Thu, 29 Jan 2026 05:23:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKVU-0000000HGlw-08pc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 05:23:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2om3r2663895
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUPoMpMVlEL3H0ESGc+sM4Kb5NFh5pqIaVsEHs+9/rk=; b=oNMNyL2aRmFPZ1wo
	yrTN5iDhAY4/dtyj3zgDH9VPm8jUxSVPhpGL5eEH0wRi434nONRF+h+PycTToS5o
	HSKzoGvHLTeiwIedB+yx5wGmmBmeicYBc13LMC59ghPiyEnZ7rcaEsjQn9nNy/Yt
	yjrQ1OwOesSSefEslhlXdJhz+NruQFAnxGEsQTxihPZ8czaS5m5gomCSrjFXdzfl
	Wpufcmaa1Rg57/LE6/qrrHsEZ3CMmzrQ+qvIB9xqhBiiFUgeSmE7+BZL4mw8Nsrw
	cccIpmsZVDbJImQ4YSDbMsVq9oqAD1+lhZ8i/wKou0z2HxEiSyOrQh1eh1b/LJ9y
	8OosGw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byphghww3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:23:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a07fa318fdso5640165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 21:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769664230; x=1770269030; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUPoMpMVlEL3H0ESGc+sM4Kb5NFh5pqIaVsEHs+9/rk=;
        b=Y2IHpkJ5INyFqwRdSRyWd1XdjO65RF3EfjMoea5UP7H3wozJhLpebbp6iKvxxy/eFd
         AHMio10FwkT0HhQHPZFIMUX/6WuyuJE5X7tOfJp6irZajrgyomdzIeKUGDAoyCW8qByi
         Cb3OF6OQej+diwXar0SWR7SaWdfZPHgUmtfGXzuTEYEL/4vD6Tv2QJQSzr+yY0gN+YFB
         dWVzYsiDDmV1JxIop6zhH+laGg3Me3OkT5TaXndoPfn3600nzKSA1J2+WvI09x4MIySt
         pSokpYJueeRUPwY3ukelv5LRzZZ3S89504zPBreg/2F3wAnsalKoFHjKiancvsk1fIFO
         ls9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769664230; x=1770269030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUPoMpMVlEL3H0ESGc+sM4Kb5NFh5pqIaVsEHs+9/rk=;
        b=tkAXwxZunb36XfuSBlSSDJqcBkhKWHVLntVD97dARUxZ4xGnV7jAiQEH5SvBa6lNXU
         CDsme/NFJpnrJQCa1/xv2kP0FND1HxktGCL3WlBbFcoYtSNkulUR855KbxpQNczn12gM
         09TCi10GVKYbmJm4F/YgQSROFgKdkStRStUIgnVp7p5AnfdlqKwuaqz1//tCOCib/QHA
         DC7zq38z6ORVU1D9WLB6AZuAxB2nl0MwOfRqZRQK/EAVgUCJGfoW6H/mzyCCpHm74S1a
         zKtbu9EHzXGg7GZCbLzbB/Nd5A9zCfWYTPxTsszkK9oauDl6JWBRW73o+of2XclRLRt/
         xoTw==
X-Forwarded-Encrypted: i=1; AJvYcCWf7gpPdkRd0QoT0emJvN5XAgjGnuOTlzXWPPn04YUHvVlDelmS2k5p08fBe9ReT8w93rsQ2LKmpO6Uj+zYyzsS@lists.infradead.org
X-Gm-Message-State: AOJu0YxH6unV8y44iljyAdi2SfPljDOwWmiIkoIMZ/+BCUqK/Owgojx6
	ZgE0liIkR/cidQNNUe2f4YmdbZhww8PieuKQUB7w9zIVIy5FPc0kgCZtZ/anc68ftqGZnKDLYbk
	Sjb7Lj90Nr6idq+XUTs1qdazOLqccxbqckvibpeS2gYJhrTAv+nSXr0O1QFuqxCnJeplRmRHDkg
	PpCg==
X-Gm-Gg: AZuq6aJbd+j2/o3b6o9h/qk8A/RgCMLxMuGKEiZWSSxlmwQ9NKBebLAY6+e4SY6A+Dc
	ApQatLnLzSlABapqQHK73PhevONTJyV71ZlCaOUKpJrOXdSE4Gk8SrDFLlgAhZ79WCNof0+VWv6
	KGz/u7B55GBue9c3Wyp01VEQ2ZIBejWqrsLVmUqWdqRwapA9Ah8MVRj7uRXuRJPFDSSZH/qlIke
	G1RNNjdH2vAoMLem7yhl+2QL6IKSfg2Zv589S7J2IgAxX+wmfHk++UQ+Ec3uHO5IvRPltQGU4Aj
	eluuSyuyUq1F4dqoO1W/IS7/ngxiJ7qwyvTuu/kjjU5PTlHWq1dtGoFJ5/mg+C04AlovyNmB4mt
	giUZGukxlHqb738sn/lVqb9Xgr3SKOPGBWBs5p14bvg==
X-Received: by 2002:a17:903:2291:b0:28e:a70f:e879 with SMTP id d9443c01a7336-2a870d49b23mr64884085ad.1.1769664229793;
        Wed, 28 Jan 2026 21:23:49 -0800 (PST)
X-Received: by 2002:a17:903:2291:b0:28e:a70f:e879 with SMTP id d9443c01a7336-2a870d49b23mr64883845ad.1.1769664229201;
        Wed, 28 Jan 2026 21:23:49 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3ddfsm38873735ad.66.2026.01.28.21.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 21:23:48 -0800 (PST)
Message-ID: <1787b076-a07f-4ac2-bd50-55914c70461a@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 10:53:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] PCI: qcom: Add D3cold support
To: Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <leonjtaswjzgibn4p5rmgegtad4fhi2y47qwtagilewebm3o4y@pc6eydqfujm4>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <leonjtaswjzgibn4p5rmgegtad4fhi2y47qwtagilewebm3o4y@pc6eydqfujm4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Lm7ABB_CX0EVsd4akoG4KYXI9gZLR_p0
X-Proofpoint-GUID: Lm7ABB_CX0EVsd4akoG4KYXI9gZLR_p0
X-Authority-Analysis: v=2.4 cv=J/inLQnS c=1 sm=1 tr=0 ts=697aeee6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FNQ6HaZGGcLT-iQI5j0A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzMiBTYWx0ZWRfX9nLyvQggyJsW
 4LLWoi2WQDW+CohKieSYjWiQioidRIw7Yzge3GBXGavX17R1WO0rs4Ynw4/d7mLQhpKM0mPh6MI
 mB2dQk1jvBdJjA+WjUUY6MwMxBqavz3hPMzJdyv1kKu9PkfjfCR8tXpAqDPP039Y/JHCwuglS2f
 6vNThodeva86ahFeg0GfCIhoZ7D1hugz+KBiaKeIomQ2rjLBzFMOFiBDd3UwelGK93Oha0MMK+e
 53mcXYIrBXrPgsYfKX5MQLfTVO9S0LgUdp681hb9tpBOEcetqc9bpQpbgzl3cjkrnOzkfjNyIkb
 c924a3pC7fvQkXvkjSe/6lhg94mRez1ceYTfXQPz9sj/ArHboabwaUDmUf1kgnnH8kk0qONoVKo
 L58MDCaRKokmxH2FuTsHnh+gpvx97o7HaONPgnUc32TmYrWXLz0+M40aUVLvs05gvKjUSV2Ne6m
 NB/ROk4rYRPPuzo2fEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_212352_204913_CDF16364 
X-CRM114-Status: GOOD (  36.93  )
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



On 1/28/2026 8:25 PM, Bjorn Andersson wrote:
> On Wed, Jan 28, 2026 at 05:10:40PM +0530, Krishna Chaitanya Chundru wrote:
>> This series adds a common helper to determine when a PCIe host bridge
>> can safely enter D3cold, converts the DesignWare host driver to use that
>> helper, and enables D3cold support for Qualcomm PCIe controllers.
>>
> You only modify qcom_pcie_deinit_2_7_0() so which targets is this
> expected to work on and which targets have you tested it on. How can I
> test it and what outcome should I expect?
we modified qcom_pcie_deinit_2_7_() because we are trying to undo what 
we are doing as part of init for other platforms, in init() we are just 
turning on the resources. I tested this on lemans evk device. After this 
series we can expect PCIe link will go to D3cold(provided there is no 
NVMe attach), and cxpc can be achieved. For NVMe devices, mani is 
working on, in which requires some psci changes[1]
>> The first patch introduces pci_host_common_can_enter_d3cold() in
>> pci-host-common. The helper walks all devices on the bridge's bus and
>> only allows the host bridge to enter D3cold if all PCIe endpoints are
>> already in PCI_D3hot. For devices that may wake the system, it
>> additionally requires that the device support PME wakeup from D3cold
>> (via WAKE#). Devices without wakeup enabled are not restricted by this
>> check and may be left in D3cold.
>>
>> The second patch updates the DesignWare host driver to use this common
>> helper in dw_pcie_suspend_noirq(). Previously, the driver skipped
>> putting the link into L2 / device D3cold whenever L1 ASPM was enabled,
>> since some devices (e.g. NVMe) expect low resume latency and may not
>> tolerate deeper power states. However, such devices typically remain in
>> D0 and are already covered by the helper's requirement that all
>> endpoints be in D3hot before the host bridge may enter D3cold. Using the
>> shared helper removes this coarse heuristic and centralizes the D3cold
>> eligibility policy.
>>
>> The third patch enables D3cold support for Qualcomm PCIe controllers. It
>> adds pme_turn_off() support and switches to the DesignWare common
>> suspend/resume methods for device D3cold entry and exit. If the
>> controller is not kept in D3cold, the existing paths are used so that
>> ICC votes, OPP votes, and other resources remain managed as before. In
>> addition, qcom_pcie_deinit_2_7_0() is updated to explicitly disable
>> PCIe clocks and resets in the controller, and the now-unused "suspended"
>> flag is removed from struct qcom_pcie.
>>
> This is effectively just duplicating the commit messages. Lacking from
> both is a good explanation of the problem statement, but that might just
> be me not getting it?
We are adding support for D3cold for qcom controllers, this is a PCIe 
feature,
I haven't added reference to qcom internal power state like CXPC since 
this alone
will not achieve this. But I should have added to this as ultimate 
purpose is to
have CXPC and main blocking is currently PCIe.
>
> Could you please help me understand what the actual outcome of this
> series is? I was under the impression that this work would lead us
> towards unblocking CXPC, but the other patch you sent will prevent CXPC.
This will keep PCIe in D3cold and achieve CXPC if there is no NVMe 
endpoints.

No other patch is not preventing CXPC, it is just trying to tell genpd 
framework that
don't turn off GENPD, if the controller is not suspended. if we don't 
have that patch
when device is not suspended i.e not kept in D3cold the gdsc is getting 
turned off
and PCIe link is going down. Until PCIe state is in D3cold, gdsc should 
not be off
even in cxpc case.

Mani,
To avoid the confusion, can I club this patch[2] to this series in next 
verision

[1] 
https://lore.kernel.org/all/20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com
[2] [PATCH] PCI: qcom: Prevent GDSC power down on suspend - Krishna 
Chaitanya Chundru 
<https://lore.kernel.org/all/20260128-genpd_fix-v1-1-cd45a249d12f@oss.qualcomm.com/>

- Krishna Chaitanya.
>
> Regards,
> Bjorn
>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>> Krishna Chaitanya Chundru (3):
>>        PCI: host-common: Add shared D3cold eligibility helper for host bridges
>>        PCI: dwc: Use common D3cold eligibility helper in suspend path
>>        PCI: qcom: Add D3cold support
>>
>>   drivers/pci/controller/dwc/pcie-designware-host.c |   7 +-
>>   drivers/pci/controller/dwc/pcie-designware.h      |   1 +
>>   drivers/pci/controller/dwc/pcie-qcom.c            | 114 +++++++++++++---------
>>   drivers/pci/controller/pci-host-common.c          |  29 ++++++
>>   drivers/pci/controller/pci-host-common.h          |   2 +
>>   5 files changed, 101 insertions(+), 52 deletions(-)
>> ---
>> base-commit: 590a64365d9bcc13ee644a3e73ffdc3df26cf23c
>> change-id: 20251229-d3cold-bf99921960bb
>>
>> Best regards,
>> -- 
>> Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>
>>


