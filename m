Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D6DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wt/iQvY38SLBB+vliNgUL2Hkrb2gXuog8nLwR89H8Dk=; b=JCaqi5bCp2GbKhXkfYza2GfILj
	pqv0w/2I5PdTdL5NoHoUBC4/1ZYgyfXh67k+vVhlTfcn6Pj/yvZM9DV+uvbbLV6DSJOTcmDPa6l2J
	8PpoOcTNES8WfY9V4vdIvuKNc6O5raDmhahebyvgw/bFU6VNa7zLnPQFOAfLMjRCMvy/fsWVRh7PW
	tskCN9+pnXfJg4UILrPSrSJA1CTrDlGJ2GTaOqDP7smHBmw1tYnuuA0FVnohSuwfQzsqGXrJEMQKJ
	rtuafeDxUV7kNkS7Dg+YGabd1epYvPVzcBnBWZHhPdglvVja/nhqA0/u0gqFo250jEsvjDPFp862i
	XpIuoWcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tisNB-0000000EOfm-3NeK;
	Fri, 14 Feb 2025 09:52:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tisHr-0000000ENfH-2GjY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 09:47:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DLglXM001230;
	Fri, 14 Feb 2025 09:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wt/iQvY38SLBB+vliNgUL2Hkrb2gXuog8nLwR89H8Dk=; b=ZS5/K7f3DQyKDTEt
	fdUCHOK6l8sGrYtcR8xaKtjIzkyizQpGkAYLRwwwuH4uN2DHV1lFPKhVv2DKFVSs
	CkJ81DwTgi3wAAHoKb2F2wM1q3ylQheDCIJ+ZH/iU7u9eLWwsMaFqB6TGw1tfShF
	JuOE55Rin6zz5qK92o9Cjec/uIeKivZkREJYguchI8W9m4p4vswuvqb507oY27JU
	nhJKRt7F+MZp65U+8rBGYCKwrDbUYssjKzGqC9rDL0L+q0Ogc6J8iJvxF6w8PGH/
	3zJp6uAqNBBd27uCmJTRFL+gTI/Cb+YL/qCqa0zQYgKHThhhzB1XecKD6IJvgHYY
	DQ1s7w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44seq0342c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:46:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51E9kqRU027585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:46:52 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 01:46:48 -0800
Message-ID: <f1e61bf3-31b8-4c81-8e6a-5a5f93926663@quicinc.com>
Date: Fri, 14 Feb 2025 17:46:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64: mm: Populate vmemmap/linear at the page level
 for hotplugged sections
To: David Hildenbrand <david@redhat.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>
CC: <anshuman.khandual@arm.com>, <will@kernel.org>, <ardb@kernel.org>,
        <ryan.roberts@arm.com>, <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        <stable@vger.kernel.org>
References: <20250213075703.1270713-1-quic_zhenhuah@quicinc.com>
 <9bc91fe3-c590-48e2-b29f-736d0b056c34@redhat.com> <Z64UcwSGQ53mFmWF@arm.com>
 <b2964ea1-a22c-4b66-89ef-3082b6d00d21@redhat.com> <Z64yZRPpyR9A_BiR@arm.com>
 <e3e62864-f914-4ecd-bd26-0363ea72e991@redhat.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <e3e62864-f914-4ecd-bd26-0363ea72e991@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1xmDfeMpkahF76XFwUCOazOxk1QdiY81
X-Proofpoint-ORIG-GUID: 1xmDfeMpkahF76XFwUCOazOxk1QdiY81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=699 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_014707_696273_F91898D5 
X-CRM114-Status: GOOD (  30.70  )
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



On 2025/2/14 2:20, David Hildenbrand wrote:
> On 13.02.25 18:56, Catalin Marinas wrote:
>> On Thu, Feb 13, 2025 at 05:16:37PM +0100, David Hildenbrand wrote:
>>> On 13.02.25 16:49, Catalin Marinas wrote:
>>>> On Thu, Feb 13, 2025 at 01:59:25PM +0100, David Hildenbrand wrote:
>>>>> On 13.02.25 08:57, Zhenhua Huang wrote:
>>>>>> On the arm64 platform with 4K base page config, SECTION_SIZE_BITS 
>>>>>> is set
>>>>>> to 27, making one section 128M. The related page struct which vmemmap
>>>>>> points to is 2M then.
>>>>>> Commit c1cc1552616d ("arm64: MMU initialisation") optimizes the
>>>>>> vmemmap to populate at the PMD section level which was suitable
>>>>>> initially since hot plug granule is always one section(128M). 
>>>>>> However,
>>>>>> commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
>>>>>> introduced a 2M(SUBSECTION_SIZE) hot plug granule, which disrupted 
>>>>>> the
>>>>>> existing arm64 assumptions.
>>>>>>
>>>>>> Considering the vmemmap_free -> unmap_hotplug_pmd_range path, when
>>>>>> pmd_sect() is true, the entire PMD section is cleared, even if 
>>>>>> there is
>>>>>> other effective subsection. For example page_struct_map1 and
>>>>>> page_strcut_map2 are part of a single PMD entry and they are hot- 
>>>>>> added
>>>>>> sequentially. Then page_struct_map1 is removed, vmemmap_free() 
>>>>>> will clear
>>>>>> the entire PMD entry freeing the struct page map for the whole 
>>>>>> section,
>>>>>> even though page_struct_map2 is still active. Similar problem exists
>>>>>> with linear mapping as well, for 16K base page(PMD size = 32M) or 64K
>>>>>> base page(PMD = 512M), their block mappings exceed SUBSECTION_SIZE.
>>>>>> Tearing down the entire PMD mapping too will leave other subsections
>>>>>> unmapped in the linear mapping.
>>>>>>
>>>>>> To address the issue, we need to prevent PMD/PUD/CONT mappings for 
>>>>>> both
>>>>>> linear and vmemmap for non-boot sections if corresponding size on the
>>>>>> given base page exceeds SUBSECTION_SIZE(2MB now).
>>>>>>
>>>>>> Cc: <stable@vger.kernel.org> # v5.4+
>>>>>> Fixes: ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
>>>>>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>>>>>> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
>>>>>
>>>>> Just so I understand correctly: for ordinary memory-sections-size 
>>>>> hotplug
>>>>> (NVDIMM, virtio-mem), we still get a large mapping where possible?
>>>>
>>>> Up to 2MB blocks only since that's the SUBSECTION_SIZE value. The
>>>> vmemmap mapping is also limited to PAGE_SIZE mappings (we could use
>>>> contiguous mappings for vmemmap but it's not wired up; I don't think
>>>> it's worth the hassle).
>>>
>>> But that's messed up, no?
>>>
>>> If someone hotplugs a memory section, they have to hotunplug a memory
>>> section, not parts of it.
>>>
>>> That's why x86 does in vmemmap_populate():
>>>
>>> if (end - start < PAGES_PER_SECTION * sizeof(struct page))
>>>     err = vmemmap_populate_basepages(start, end, node, NULL);
>>> else if (boot_cpu_has(X86_FEATURE_PSE))
>>>     err = vmemmap_populate_hugepages(start, end, node, altmap);
>>> ...
>>>
>>> Maybe I'm missing something. Most importantly, why the weird subsection
>>> stuff is supposed to degrade ordinary hotplug of dimms/virtio-mem etc.
>>
>> I think that's based on the discussion for a previous version assuming
>> that the hotplug/unplug sizes are not guaranteed to be symmetric:
>>
>> https://lore.kernel.org/lkml/a720aaa5-a75e-481e-b396- 
>> a5f2b50ed362@quicinc.com/
>>
>  > If that's not the case, we can indeed ignore the SUBSECTION_SIZE> 
> altogether and just rely on the start/end of the hotplugged region.
> 
> All cases I know about hotunplug system RAM in the same granularity they 
> hotplugged (virtio-mem, dax/kmem, dimm, dlpar), and if they wouldn't, 
> they wouldn't operate on sub-section sizes either way.
> 
> Regarding dax/pmem, I also recall that it happens always in the same 
> granularity. If not, it should be fixed: this weird subsection hotplug 
> should not make all other hotplug users suffer (e.g., no vmemmap PMD).
> 
> What can likely happen (dax/pmem) is that we hotplug something that 
> spans part of 128 MiB section (subsections), to then hotplug something 
> that spans another part of a 128 MiB section (subsections). 
> Hotunplugging either should not hotplug something part of the other 
> device (e.g., rip out the vmemmap PMD).
> 
> I think this was expressed with:
> 
> "However, if start or end is not aligned to a section boundary, such as 
> when a subsection is hot added, populating the entire section is 
> wasteful." -- which is what we should focus on.
> 
> I thought x86-64 would handle that case; it would surprise me if 
> handling between both archs would have to differ in that regard: with 4k 
> arm64 we have the same section/subsection sizes as on x86-64.
> 

Thanks David and Catalin. From your discussion, I understand that 
hotplug/unplug sizes are guaranteed to be symmetric ? Therefore, it 
should be straightforward to populate to base pages if (end - start < 
PAGES_PER_SECTION * sizeof(struct page)) ? I will write patch and verify.
Please correct me if my understanding is incorrect.


