Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB09E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 06:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9PuvcdJwOfZRRtqfiDwVA80nV3LXQEx4Lzfhz9vGo8=; b=vgVyDjen9NZDYJgWFMQXAYtBfN
	NiInRpUDu/qzevh5+kmYlRpiAj/scSrQj2q/5gr2JrHMzsYNpGAbV1gKIR99ZzCMNoHX1UWwM1jnm
	oyL1gNUeeoEEzi02AZnXRbO4xZ/8U8QyDVnQ37NVOpOibd8RaC//lqWXNl/SF+2Qz54CxMNtgpn8Z
	Nsnb995taK7rwezqTL5V8ah+eaxyQNcadXkz2oWgOZ4jks8IQndL8cto3SmjrVVsrKbMT5U8Mpv8J
	nah+Ub6x/99j8gCRqOXbvTCftGnAlOy573yDio3H2Up0GM3X3eyTWHgFExmRul9TDH7gXQmYiGyq0
	5otYAaJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKWue-00000006Yi9-29mg;
	Mon, 09 Dec 2024 06:06:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKWsk-00000006YQE-0sn4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 06:04:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8MbAle007595;
	Mon, 9 Dec 2024 06:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9PuvcdJwOfZRRtqfiDwVA80nV3LXQEx4Lzfhz9vGo8=; b=EwVdjHkatrI5GG3H
	N73j41v6k6JdMM1M6jCSsmnaSCX9PMvhvR2tlAd6+0VQnqW3oI0MTFnWJn7m5U7q
	84uhVoHBnH2n/qDOQBjYb6Ekc4VieJ+7SurGa6XCkY1KI84if3LWegxO5NSFlEVI
	yI0txNFG27Tpp7l3CKQGUgnzdSLSbQMELZsC4xpKqTYp+EKguaKYWvVPY6e7HR/7
	/ZiSMxKJSf2mU28l4mqXV/PmnT//NcouqEVKF7MqLN4ueay0ooo5Zyir9eMxA7l5
	co51QRFInPP/RgVCETSByJ/CIcZOLzEWDZaWw6j0J2jBH7JUHUChoOtLCOb2Wda2
	GGW1ZQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdc6bk5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 06:04:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B964PZD024630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 06:04:25 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Dec 2024
 22:04:22 -0800
Message-ID: <4d2f42fc-26b3-4924-b855-86bea92c03b0@quicinc.com>
Date: Mon, 9 Dec 2024 14:04:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix subsection vmemmap_populate logic
To: Andrew Morton <akpm@linux-foundation.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <ardb@kernel.org>,
        <ryan.roberts@arm.com>, <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <chenfeiyang@loongson.cn>,
        <chenhuacai@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20241121071256.487220-1-quic_zhenhuah@quicinc.com>
 <eb4d6674-494a-4a84-bade-481b0c89eb93@quicinc.com>
 <b2681eed-d4d5-43c9-90e0-3e706db3e201@quicinc.com>
 <20241206221446.e5e8ea4ed85d0f2884216b82@linux-foundation.org>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <20241206221446.e5e8ea4ed85d0f2884216b82@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gEA3ebkkEJ32vvvchaRD_vnBfXDIDlXW
X-Proofpoint-GUID: gEA3ebkkEJ32vvvchaRD_vnBfXDIDlXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 mlxlogscore=951 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_220434_366782_77891B5D 
X-CRM114-Status: GOOD (  12.90  )
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



On 2024/12/7 14:14, Andrew Morton wrote:
> On Fri, 6 Dec 2024 17:13:39 +0800 Zhenhua Huang <quic_zhenhuah@quicinc.com> wrote:
> 
>>
>>
>> On 2024/11/28 15:26, Zhenhua Huang wrote:
>>>
>>>
>>> On 2024/11/21 15:12, Zhenhua Huang wrote:
>>>> To perform memory hotplug operations, the memmap (aka struct page)
>>>> will be
>>>> updated. For arm64 with 4K page size, the typical granularity is 128M,
>>>> which corresponds to a 2M memmap buffer.
>>>> Commit 2045a3b8911b ("mm/sparse-vmemmap: generalise
>>>> vmemmap_populate_hugepages()")
>>>> optimizes this 2M buffer to be mapped with PMD huge pages. However,
>>>> commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
>>>> which supports 2M subsection hotplug granularity, causes other issues
>>>> (refer to the change log of patch #1). The logic is adjusted to populate
>>>> with huge pages only if the hotplug address/size is section-aligned.
>>>
>>> Could any expert please help review ?
>>
>> Gentle reminder for review..
>>
> 
> 
> MM developers work on the linux-mm mailing list, which was not cc'ed.
> 
> Please address Catalin's review comment
> (https://lkml.kernel.org/r/Z1Mwo5OajFZQYlOg@arm.com) then resend a v2
> series with the appropriate cc's.

Thanks Andrew! Will do. I was realizing I couldn't fully rely on 
get_maintainers script :)

> 
> 


