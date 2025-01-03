Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71037E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 02:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3aeWnL+12/YsEuMWwQA9FCOS4/Unmsm+NwfFhN0+ws=; b=LZUbYfOWAdKOh8ZoR1idlzRIrS
	THrQcj/iCbS1R3MjpUNHwsbUlz4ux96EB42zfouvxj/ZaVWANHxZHJne8WAPI4kW1/A1sJjhtMdZj
	ml2UzmAlonF3MgIZfScw+oFyN1TMBobZ2KXIFnXo4VZhBhZ0pxfXe2E5tDLBXGtODwal1BJqv7nyl
	ipU5XiEjoYVvASuOTm7qXc47NLAbC03B4L7oUz7MlGy96aHrNfEuNspStoA22OngorRS6A+ydrLPJ
	YRddWQ2PwsQ4Ignh2wY6RA+S03QMuWh8+tysVSZyAHs4oCcR9+HG+eY4pqSrNEvmpWbLARkL3KnYq
	i9t/1mAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTX22-0000000BscG-3tyg;
	Fri, 03 Jan 2025 02:03:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTX0t-0000000BsU7-0oc2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 02:02:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502MjGrv030058;
	Fri, 3 Jan 2025 02:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L3aeWnL+12/YsEuMWwQA9FCOS4/Unmsm+NwfFhN0+ws=; b=X+l/p2UMoNpaqmYP
	5xWNr+7/MLxdD+aHtA4kJpy1D0nvMZSRPxSNQdX6F6+pk40NPQHRUg2Ju+D+bheF
	tE4biI11kWpm35nwh40hDkMvxP+Ut9NaejZXOlPyC63QOwxfgCco5i0Rx3u2fDgs
	38dImeKU6UER4dZVBZCM0xJSiIZjF5KCcUY5lZnR9yuypvXMZTw0t4Dn7ROXsxn0
	rVwBqCFzTt5jlVZ4sojNpD+7ylLqNXhUeueuhd4bZe/2WA8EZxcuaNuJgOoc+K9b
	XgNS+eKIF/+Bvz0OLnbcPio0QSHwKrpoZSVjhPwn2AcnGaban++KEaRPB1frBvPr
	q2Qydw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wvrbs7n1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 02:01:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50321vWO016498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 02:01:57 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 Jan 2025
 18:01:54 -0800
Message-ID: <6731e921-8ebd-4e98-a582-ca87f2a25d16@quicinc.com>
Date: Fri, 3 Jan 2025 10:01:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: mm: vmemmap populate to page level if not
 section aligned
To: Catalin Marinas <catalin.marinas@arm.com>,
        Anshuman Khandual
	<anshuman.khandual@arm.com>
CC: <will@kernel.org>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
        <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-2-quic_zhenhuah@quicinc.com>
 <Z2W3qA7wbBTaq6DQ@arm.com> <a720aaa5-a75e-481e-b396-a5f2b50ed362@quicinc.com>
 <Z2rAr9APkgpkwOl8@arm.com> <971b9a05-4ae0-4e6c-8e48-e9e529896ecf@arm.com>
 <Z3bh74I1YhGWLU4M@arm.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <Z3bh74I1YhGWLU4M@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hDiWL_UumTYIOeHeMpZYw2bGtgztivbf
X-Proofpoint-ORIG-GUID: hDiWL_UumTYIOeHeMpZYw2bGtgztivbf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_180211_230771_90E8D413 
X-CRM114-Status: GOOD (  15.22  )
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



On 2025/1/3 2:58, Catalin Marinas wrote:
> On Fri, Dec 27, 2024 at 01:19:30PM +0530, Anshuman Khandual wrote:
>> On 12/24/24 19:39, Catalin Marinas wrote:
>>> On Tue, Dec 24, 2024 at 05:32:06PM +0800, Zhenhua Huang wrote:
>>>> I have two ideas:
>>>> 1. Completely disable this PMD mapping optimization since there is no
>>>> guarantee we must align 128M memory for hotplug ..
>>>
>>> I'd be in favour of this, at least if CONFIG_MEMORY_HOTPLUG is enabled.
>>> I think the only advantage here is that we don't allocate a full 2MB
>>> block for vmemmap when only plugging in a sub-section.
>>
>> Agreed, that will be the right fix for the problem which can be back ported.
>> We will have to prevent PMD/PUD/CONT mappings for both linear and as well as
>> vmemmap for all non-boot memory sections, that can be hot-unplugged.
> 
> I haven't read your diffs below yet but why not allow PMD mappings of
> the hotplugged memory (not vmemmap)? SUBSECTION_SHIFT is 21, so we can
> have 2MB blocks in a 4KB page configuration.
> 
Oh, Understood. We discussed the topic and I shared the same concern, 
Anshuman actually preferred to wait for your decision.

See discussion:
https://lore.kernel.org/lkml/3aadda40-c973-4703-8ed8-9cf2d3eb70a0@quicinc.com/

I see your favor now and will post V3 based on that.


