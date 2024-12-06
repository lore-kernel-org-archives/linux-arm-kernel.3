Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3862FE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 09:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5Uix+VCsP1VBVV3kQGGxY0VSVw2QtLTARl47+MKnGM=; b=n2uIPq13v9p+v+pUHeuYrXc4ej
	7SHtY2CRKy1dt9yoSOFyNlGRRhx6G1wjDMMatGZMg9WtEY/VRDL3q3qUC2i0Vaeh77htioCcY9EZx
	WM4/8TCvO7NAihzGopzcbiD3ewPTn5T0nyVV3OMlH4yWVqpFTCixlz9Pb82t3VcIy8UIb282rK8+/
	1MhmKdPhMHcvugJuaex37Ntl9HsUo2z6of6LIViISyrnq1Gs3ljdKpLLuuBhJSu/nOtuefavXmNe4
	FVUZ0AUMgwWvINO7bCgpO9E/8WPuSELFGVQVaFBl9G5yFk9CrinP5iJCgJzcF/epcLYzzZ2pHn8IB
	QjeIqVrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUQr-00000001317-35tP;
	Fri, 06 Dec 2024 09:15:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUPK-000000012l8-1rLT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 09:13:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B62S3aU004109;
	Fri, 6 Dec 2024 09:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5Uix+VCsP1VBVV3kQGGxY0VSVw2QtLTARl47+MKnGM=; b=cfnX3sLHE10bV914
	Uuk0L0LgU9C6mkCBRPgzi7YSnF+M0uT/nnGWZVe+yaUV/s/AGrB23zmrWFyjaH+e
	XiLz3UMjB9O3qxP5nvkCMa9SK1HikSY5JAiFjAELGMPcTKQZrZfGzs7YMCw0oNz5
	vKlDZHjjgWTlw87yAVhjj6sezfUcbqiKwWdhiJGVE1hCoCZvW0i/OV74GxuoDS+U
	BtI8lHCaYAqu3bYU8kbH+sJ2BrmMpzUcRjaZHXxc+0k/16zQyZW0YtMmFpfUMo/f
	Mob9y+QdFUiT3OsAswbVb6SBehrv82n7Y336VrTxpFBz39iMLeACwZYb1E2rtcHQ
	NRIK/Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43brgp0ywa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 09:13:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B69Di28011160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 09:13:44 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 01:13:41 -0800
Message-ID: <b2681eed-d4d5-43c9-90e0-3e706db3e201@quicinc.com>
Date: Fri, 6 Dec 2024 17:13:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix subsection vmemmap_populate logic
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <ardb@kernel.org>,
        <ryan.roberts@arm.com>, <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241121071256.487220-1-quic_zhenhuah@quicinc.com>
 <eb4d6674-494a-4a84-bade-481b0c89eb93@quicinc.com>
Content-Language: en-US
In-Reply-To: <eb4d6674-494a-4a84-bade-481b0c89eb93@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ke0QfRXNNZCzln0AqyLBSOkfZUD_FBEX
X-Proofpoint-ORIG-GUID: ke0QfRXNNZCzln0AqyLBSOkfZUD_FBEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 mlxlogscore=866
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_011354_496464_46BE13CA 
X-CRM114-Status: GOOD (  10.79  )
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



On 2024/11/28 15:26, Zhenhua Huang wrote:
> 
> 
> On 2024/11/21 15:12, Zhenhua Huang wrote:
>> To perform memory hotplug operations, the memmap (aka struct page) 
>> will be
>> updated. For arm64 with 4K page size, the typical granularity is 128M,
>> which corresponds to a 2M memmap buffer.
>> Commit 2045a3b8911b ("mm/sparse-vmemmap: generalise 
>> vmemmap_populate_hugepages()")
>> optimizes this 2M buffer to be mapped with PMD huge pages. However,
>> commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
>> which supports 2M subsection hotplug granularity, causes other issues
>> (refer to the change log of patch #1). The logic is adjusted to populate
>> with huge pages only if the hotplug address/size is section-aligned.
> 
> Could any expert please help review ?

Gentle reminder for review..

> 
>>
>> Zhenhua Huang (2):
>>    arm64: mm: vmemmap populate to page level if not section aligned
>>    arm64: mm: implement vmemmap_check_pmd for arm64
>>
>>   arch/arm64/mm/mmu.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
> 


