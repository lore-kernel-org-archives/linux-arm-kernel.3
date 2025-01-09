Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318C2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 07:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87FV4YrIQ7z0jxyKrabSGJYQLHTBVu6L6ppZv7huBcU=; b=vT5AGaeh/oQGt7Zg+n9emWEBbj
	cZgIlYLs4rKeB7ZApY2E/OMCDMRd/RcO/0rhRgyrngE93YgnF6p553lkXtK0tSVSt/i/EosCtGg3O
	c2mJQmyU3c2M+pFcyD5Lzk8vcJozGp3Pno1oDUvFFhiTjJgwglxmtLskIUtK5AHPrMwedJ9nIFyM2
	444mGCE0tJ7GE5oInnyhZ+zHFLkr2jhchwIh5bPrdyATxDIpkV3J+uhZocph8heuTpCf0jw5MjWJf
	dMJg2Eug4kZVlgA3K33NlMjlhf01mjELF14NDUrIiKTk9Zo3Tii5doELaDcFObJ64Ev2iHh8d3syD
	kSJ5LffQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVmcA-0000000AzVp-1smO;
	Thu, 09 Jan 2025 07:05:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVmau-0000000AzI6-42hT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 07:04:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094gd74018333;
	Thu, 9 Jan 2025 07:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	87FV4YrIQ7z0jxyKrabSGJYQLHTBVu6L6ppZv7huBcU=; b=gWcjIkzWjCPQEr/f
	1/XrfyWeVrLrNp9a1kMwPD+PycHjgQmkxj39IVopJdezCZlku10GgeyYYHkDBP4v
	1b7lTSSXYmrxeYmr50SEqOXcatEugwKcA+l/f55/M7Q2wxp1hl0hZya+4aw4Mw7j
	IV5hFY8YmoyxLIdSPnlYRO+DtB6DjN9xG2zMocRwIBlTHano4my0VW0h3vy6RLxE
	RgD6sxA+Yseujey4Z2+Bs3bzT7PiN/4GmQIRe13jIDu/xtx6KjFajmB6Rt3ZA/EB
	NmU7iPU2VC2/XwNAlhF0s5eOxWHxNhoyWy8gKmsuWeDU+3j2GHOxNHR8cMNGvTi3
	Kag6NA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4427nwr996-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 07:04:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50974SLv020305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 07:04:28 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 23:04:24 -0800
Message-ID: <1515dae4-cb53-4645-8c72-d33b27ede7eb@quicinc.com>
Date: Thu, 9 Jan 2025 15:04:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: mm: Populate vmemmap/linear at the page level
 for hotplugged sections
To: Anshuman Khandual <anshuman.khandual@arm.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>
CC: <will@kernel.org>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
        <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        <stable@vger.kernel.org>
References: <20250107074252.1062127-1-quic_zhenhuah@quicinc.com>
 <Z31--x4unDHRU5Zo@arm.com> <406d5113-ff3d-4c2a-81f0-de791bcbeffb@quicinc.com>
 <1c1504a7-3515-48f2-8ca7-15b2379dea22@arm.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <1c1504a7-3515-48f2-8ca7-15b2379dea22@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xy9B2SvRFf9KMrsnmkiTJDZlnOkSlvK1
X-Proofpoint-GUID: xy9B2SvRFf9KMrsnmkiTJDZlnOkSlvK1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=850
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_230441_129550_B70DF3BE 
X-CRM114-Status: GOOD (  13.35  )
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



On 2025/1/8 18:52, Anshuman Khandual wrote:
>> I found another bug, that even for early section, when vmemmap_populate is called, SECTION_IS_EARLY is not set. Therefore, early_section() always return false.
> Hmm, well that's unexpected.
> 
>> Since vmemmap_populate() occurs during section initialization, it may be hard to say it is a bug..
>> However, should we instead using SECTION_MARKED_PRESENT to check? I tested well in my setup.
>>
>> Hot plug flow:
>> 1. section_activate -> vmemmap_populate
>> 2. mark PRESENT
>>
>> In contrast, the early flow:
>> 1. memblocks_present -> mark PRESENT
>> 2. __populate_section_memmap -> vmemmap_populate
> But from a semantics perspective, should SECTION_MARKED_PRESENT be marked on a
> section before SECTION_IS_EARLY ? Is it really the expected behaviour here or
> that needs to be fixed first ?

The tricky part is vmemmap_populate initializes mem_map, that happens 
during mem_section initialization process. PRESENT or EARLY tag is in 
the same process as well. There doesn't appear to be a compelling reason 
to enforce a specific sequence..

> 
> Although SYSTEM_BOOTING state check might help but section flag seems to be the
> right thing to do here.

Good idea, I prefer to vote for this alternative rather than PRESENT 
tag. As I see we already took this stage to determine whether memmap 
pages are boot pages or not in common mm code:
https://elixir.bootlin.com/linux/v6.13-rc3/source/mm/sparse-vmemmap.c#L465

Would like to hear Catalin's perspective ?:)

