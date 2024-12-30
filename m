Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FF8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lBMs0Ul5wQCiw8Sc7Z2zieC30Xesh+V0rLSxzovXSk=; b=kPq3xTQaoZbDwLqa/b0jldUvRl
	KB+rwlZ8E3FnnAWt+sv/zDBwN0mU0qsmxsef3OPOzvU9YzC9YbKgCaBQSDrW3QfHl4IqaETHJeeSP
	HiHmMQGkvcqEc1YenY8v6hos7q9A49xEmBLRI8b1je5oJTWiJABFMbMQ8n1qHfFxDxXUI+zcdyeat
	OeKMADIcJqpq3XVhenRz0/4NZSZ6dG+3/gRYMF8LKvE48xA1AS5OjoelDrIsT/vN/0+ZAnPEdwr6+
	LUhMi9c7Fx89o9Ss2vjl/jWwCmcE0tGSbMBhQPto85yHX49LbAccGqhBYZBXUSCAGeROEM7zb0Q3J
	MFH53KYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSAYG-00000004lLC-2pzW;
	Mon, 30 Dec 2024 07:51:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSAW7-00000004l4y-40lR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 07:48:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU7G9EF027922;
	Mon, 30 Dec 2024 07:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9lBMs0Ul5wQCiw8Sc7Z2zieC30Xesh+V0rLSxzovXSk=; b=eEKagQuoKHFeLYmv
	+5rAlpvEkTrmQJKObjSHAQvteoakjIEOD1R452rvBxZho5m0BjdB0C04K1ALX4rQ
	9o433NgW368Y5MpuLea0TOH8sqgZByi3EVpTXM8l+F4E5Qu4zKzgAWu9dk43O79k
	oSSlGiRm9VbJ8r72IKU8c2icP2lapDpOG33wEmW+IbNWjGsJmVj5uowwvzxepy81
	dmiiDWjyLoqVKAogFlvRDvMmCNs7WwfzQAxPr6UQHEA5zpf3wiXQsOT0lnXWhTmP
	TlwLKVdw8zoacdocd9jgWq3KHNTPP+gbXgUww1bZWLheau8hAbpNvAIXsl631JUY
	cn3Iog==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43upyr81tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 07:48:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BU7mbds012157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 07:48:37 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 29 Dec
 2024 23:48:34 -0800
Message-ID: <8685ca94-1382-45c0-a3c3-4b5ccf244057@quicinc.com>
Date: Mon, 30 Dec 2024 15:48:32 +0800
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
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <39a85800-47c5-4529-906d-5a40e58ce136@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 05vQ5z3ocu6WtEGIJq_QrSThdYzcr5BL
X-Proofpoint-ORIG-GUID: 05vQ5z3ocu6WtEGIJq_QrSThdYzcr5BL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=396 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_234848_022229_1B850CBC 
X-CRM114-Status: GOOD (  10.49  )
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



On 2024/12/27 10:57, Anshuman Khandual wrote:
> However it does not really check the entry to be a section mapping which it should.
> Returning pmd_sect(READ_ONCE(*pmdp)) is the right thing, which should have been the
> case from the beginning when vmemmap_check_pmd() was added. I guess because arm64's
> original vmemmap_populate() checked only for vmemmap_verify() as well. So probably
> this does not need a "Fixes: " tag.

Hi Anshuman,

I agree, will remove "Fixes: " tag in next patchset

