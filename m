Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFD8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 07:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6XJql5m47BXAvrRdSryIG8UjgiG29oVpHXZwXoQr+w=; b=sar3NNyZab2aYZ5qEyUWi9o62m
	mGf8D5LeAmD6vf/f4koX+vDi8TVbyZq5CKp96Jh8bancROlX1FBfAnjy3NfY793BWfs9q3N6jeZwV
	L2dD75uuLSAbrrQi+DEKw2RaDoKmWlskZhgMxuPvIT85iRjRUyQgvQcdbHc5zkvLZ27cwqLRwCw6+
	jttEHNZaCsdT3aMyJYcWGxJga15f29nVhSdDzsfl3mIODDAf3XHh29YnbvAGqmKooC/Aq8Uz0EinU
	q909ttGe/DLkjAumeDYcs9rjiYXbeWCT9v3vkLNa80OJJoZiHpXIR9nMBhXqDdeIKF0Ba87O6p9Vx
	Mv1Ow6mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSWXo-00000006hzj-0G72;
	Tue, 31 Dec 2024 07:20:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSWWc-00000006hlJ-0zOW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 07:18:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV5n5uZ010219;
	Tue, 31 Dec 2024 07:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6XJql5m47BXAvrRdSryIG8UjgiG29oVpHXZwXoQr+w=; b=pR3psg0wQx6hwUQv
	XHenV54hPaE4gIyM1Ed8G2RjRZzVcKHxHsZnk5XoOguQDqpRXa/Xwutt5EkMjdIp
	ovJpOtcWD4+7WTj879BVTG1LAG+qCC5zorOmzOzIz1cD/nB5X6FEdIkg8qWTcOJ8
	7hNa8lp0KtiqhNqxK0zAGeZRxOQf1ravaO1vxNKZXDAHrBUZB4ZjkMUfSvIN4syP
	V9zIEoNmm5y2bmFqrDuJRR5Mzy8kQJn7bYDuhVUKMRMwV5Cf48ft4tqpJUT0PHW1
	RB+H8ZhxxaD2BDJLwELI+DmngsUvteTaNIoK/QnNbOF8WyVQ5wJiYSd4/CdkXmjr
	WribxA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43vasy861v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 07:18:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BV7IWsm004491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 07:18:32 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Dec
 2024 23:18:29 -0800
Message-ID: <19c42e9f-8f61-45d2-9df2-c7f667495b12@quicinc.com>
Date: Tue, 31 Dec 2024 15:18:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: mm: implement vmemmap_check_pmd for arm64
To: Anshuman Khandual <anshuman.khandual@arm.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>
CC: <will@kernel.org>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
        <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-3-quic_zhenhuah@quicinc.com>
 <Z2W5Bs0bZANI6NKv@arm.com> <39a85800-47c5-4529-906d-5a40e58ce136@arm.com>
 <8685ca94-1382-45c0-a3c3-4b5ccf244057@quicinc.com>
 <ff65fb4e-4a7c-443b-b855-e5c3cd22889f@arm.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <ff65fb4e-4a7c-443b-b855-e5c3cd22889f@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: feLxOR_f25bomt_Qth2sIC3sdKgj4HuZ
X-Proofpoint-GUID: feLxOR_f25bomt_Qth2sIC3sdKgj4HuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=445
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412310060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_231846_386049_99F03804 
X-CRM114-Status: GOOD (  17.31  )
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



On 2024/12/31 14:59, Anshuman Khandual wrote:
> A very small nit regarding the subject line. The callback
> vmemmap_check_pmd() is already present on arm64 platform
> which is rather incomplete. Something like this might be
> better.
> 
> arm64/mm: Test for pmd_sect() in vmemmap_check_pmd()
> 
> On 12/30/24 13:18, Zhenhua Huang wrote:
>>
>>
>> On 2024/12/27 10:57, Anshuman Khandual wrote:
>>> However it does not really check the entry to be a section mapping which it should.
>>> Returning pmd_sect(READ_ONCE(*pmdp)) is the right thing, which should have been the
>>> case from the beginning when vmemmap_check_pmd() was added. I guess because arm64's
>>> original vmemmap_populate() checked only for vmemmap_verify() as well. So probably
>>> this does not need a "Fixes: " tag.
>>
>> Hi Anshuman,
>>
>> I agree, will remove "Fixes: " tag in next patchset
> 
> Could you please send a V3 of this patch separately instead
> and not part of this series as they are not really related.

Sure, Thanks Anshuman. Will gather information and update after coming 
back from Holiday!

> 
> But after implementing the following changes
> 
> 1) Use READ_ONCE() as indicated earlier
> 2) Drop the "Fixes: " tag
> 3) Update the commit message explaining why pmd_sect() is
>     required here and how the originally commit missed that
> 4) Update the subject line


