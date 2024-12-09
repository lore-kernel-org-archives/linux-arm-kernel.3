Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D908E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 06:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Hk53dlOnxFhT175Tc9odzckpkKVFY8lcT0L264X/Vo=; b=LOERUR7huFwPfRjsRDZ82nkz48
	b8d3spfOYwj2ghMnsFEY2VzS2uP47Lk0S77ufvJodSLx6iPH+9V3MDiATjG9s1PH1+XjfQVTlE1gg
	0CLVHFc6esXgmhqTjDqF2CfBvbik+Bo4OHVvzwTNPk7T8Q1S6mI3kBSZiS85eKNErBVocIiODk1SZ
	LF436ktIZnW0pvzUQQ2EJgttIltvWtOxnvDxQNRyyRskfAjewMMLQ+dO0XgTD71IqAw4s+19JDHt2
	5DidXqe8WtBrikj4RF8xszmX7Kwp0dMYIybUBFCVNH9qT/EC6o0pj0526i6BHRCbN2vgFLlKkDZQX
	mfMUI0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKWte-00000006Ycg-3uDs;
	Mon, 09 Dec 2024 06:05:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKWsc-00000006YPf-1vG7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 06:04:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8NYlwF019615;
	Mon, 9 Dec 2024 06:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Hk53dlOnxFhT175Tc9odzckpkKVFY8lcT0L264X/Vo=; b=XW0tSkW2BirxZJ4c
	BKX1M8OCmbGQ8HcC/xn2gxe0uz98f9M7iMekT/TRMGkdrS6DbPmNL1iUnnUDu6tS
	+C1yGR5nq9cTRcBfgZcZbn/p8SLOQR7yHVSntjEy3r9iTevwbrrLpON32DqtP8ss
	+JrMKsQhhznHR33kiFyE6YhCTuCreP0gbjyrq1x/ROydVs+8aKWczG/EyFrWEGpe
	/9dK0EOp7EtBTtGu4R87Ydi4urwEgQDNaRM2LRSOR6wlam0UGDSslqnyu4M5rUAj
	M8Zp/rYG8ASD99L/GxV0v9OiFuGc8qdV8bWm+GhhcLDWDmFZqsHE1qeAS19VK5w5
	mQGn0g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cek1ug9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 06:04:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B964Haf026792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 06:04:17 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Dec 2024
 22:04:13 -0800
Message-ID: <fe47b1ad-b1e7-4f26-8973-f3c8568e15b8@quicinc.com>
Date: Mon, 9 Dec 2024 14:04:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: mm: vmemmap populate to page level if not
 section aligned
To: Catalin Marinas <catalin.marinas@arm.com>
CC: <will@kernel.org>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
        <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>
References: <20241121071256.487220-1-quic_zhenhuah@quicinc.com>
 <20241121071256.487220-2-quic_zhenhuah@quicinc.com>
 <Z1Mwo5OajFZQYlOg@arm.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <Z1Mwo5OajFZQYlOg@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gzo9auymSZHfx25bjhj8O0q5nRMo4w0N
X-Proofpoint-ORIG-GUID: gzo9auymSZHfx25bjhj8O0q5nRMo4w0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_220426_508710_A6DE28D9 
X-CRM114-Status: GOOD (  20.68  )
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

Thanks Catalin for review!

On 2024/12/7 1:13, Catalin Marinas wrote:
> On Thu, Nov 21, 2024 at 03:12:55PM +0800, Zhenhua Huang wrote:
>> Commit 2045a3b8911b ("mm/sparse-vmemmap: generalise vmemmap_populate_hugepages()")
>> optimizes the vmemmap to populate at the PMD section level.
> 
> Wasn't the above commit just a non-functional change making the code
> generic? If there was a functional change, it needs to be spelt out. It
> also implies that the code prior to the above commit needs fixing.
> 

Oh... right. I looked up your change from over a decade ago, identified 
by commit c1cc1552616d ("arm64: MMU initialisation").
However, at that time, there was no support for subsection hotplug, 
which was later introduced by commit ba72b4c8cf60 ("mm/sparsemem: 
support sub-section hotplug").

>> However, if start
>> or end is not aligned to a section boundary, such as when a subsection is hot
>> added, populating the entire section is inefficient and wasteful. In such
>> cases, it is more effective to populate at page granularity.
> 
> Do you have any numbers to show how inefficient it is? We trade some
> memory for less TLB pressure by using huge pages for vmemmap.

I see.. thanks, yeah. TLB efficiency will benefit.
I want to express even one subsection hot-added, current code logic 
still populate 2M backup metadata, although only 2M/64 = 32K needs.

> 
>> This change also addresses misalignment issues during vmemmap_free(). When
>> pmd_sect() is true, the entire PMD section is cleared, even if only a
>> subsection is mapped. For example, if subsections pagemap1 and pagemap2 are
>> added sequentially and then pagemap1 is removed, vmemmap_free() will clear the
>> entire PMD section, even though pagemap2 is still active.
> 
> What do you mean by a PMD section? The whole PAGE_SIZE *
> PAGES_PER_SECTION range or a single pmd entry? I couldn't see how the

I am referring to a single pmd entry, but the buffer it points to manage 
whole PAGE_SIZE * PAGES_PER_SECTION physical memory. for arm64,4K pages:
pmd entry(2M, struct page metadata) -> PAGE_SIZE * 
PAGES_PER_SECTION(128M physical memory)

pagemap1(Where a subsection equals to 2M/64 = 32K) and pagemap2 are part 
of a single PMD entry. When pagemap1 is removed, vmemmap_free() will 
clear the entire PMD section. IOW, total 128M physical memory will 
become unusable.

> former happens in the core code but I only looked briefly. If it's just
> a pmd entry, I think it's fair to require a 2MB alignment of hotplugged
> memory ranges.

Agree that 2MB alignment of hotplugged memory is fair, commit 
ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug") supported it. 
The issue here I want to address is for its backup struct page metadata.

> 


