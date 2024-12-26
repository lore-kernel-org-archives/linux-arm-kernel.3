Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE1AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zwpLnjl9L3WRLyxVo7AONhy8GcwJmaoi/rjBNSpGfo=; b=MfdttqgqClrNy+glcVtVa8RvcI
	oLp91ndwslgPR8Rn81vcxEleu5sFDXiwlrDjVGZ0kOMbmhe2cyh4V4oPSY9BhSusYkZwnpfzui9Xh
	S21iDDAjuWKCZxiUnBmXjsilG9tRe4RVasgbXjpPDO96mzaUzLfxyf5Fe9sZRCALy0Jfo/AMKUho2
	fRqWlp1wMW8GzV2knoUF+Wa/S+aBenmSHa6XjDCzVlLqPdOpLAmehIokRcMWNFfaEnfzEUfbCE36K
	LOGmWg9MfL2EPyWaJwOKHeaZicXmMtKGlh/Ti/miI5omZl49ZWnDXMYAjRaZA5mRxYFN7t5MyzZgW
	xgFVUkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQn07-0000000Fldh-3TKo;
	Thu, 26 Dec 2024 12:30:03 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQmyv-0000000FlTj-1FwY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 12:28:50 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ85Yft020270;
	Thu, 26 Dec 2024 12:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+zwpLn
	jl9L3WRLyxVo7AONhy8GcwJmaoi/rjBNSpGfo=; b=QC/XxmNWGm9U9Kba8THLNZ
	ut8UYwZnI4JdWOoqRdpqUqxFVB7jvaV/dS2yZGvqDTXB8WHZJ05rcV9e4jqQ1ubh
	1dtBaMIsdEEk1Tg3jc6ZbAPCiz96qSg5WHrdcVzBK8ccXyY2PVQoQ3Q1DAKx06mf
	Q0NBo65sNixuZAUaRyLhC6WgDYOBeQgpToMAESrAGN7Pgjb/E6mtQJfNatfOjNuT
	Mdk6svKbnZIhS2bC2gFWeQ4ZBZ/EnR3zWB+bBK43Su94Zp4ESf1JTWZ1iNK6LeH6
	Nm76+P3hjXWIc/neP+EhZydLLzm6usUhOyDC51lp2Gi6GFeVvAtyGxDmzDfqiy3Q
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43s3b2rr14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 12:28:10 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQAUg8E010617;
	Thu, 26 Dec 2024 12:28:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43p90n9wxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 12:28:09 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BQCS7sU38470100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 12:28:07 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E9962004B;
	Thu, 26 Dec 2024 12:28:07 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC20620040;
	Thu, 26 Dec 2024 12:28:01 +0000 (GMT)
Received: from [9.124.219.96] (unknown [9.124.219.96])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Dec 2024 12:28:01 +0000 (GMT)
Message-ID: <04c9757c-98e9-4c5d-9759-8a9ac9d6a803@linux.ibm.com>
Date: Thu, 26 Dec 2024 17:58:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/4] Support SMT control on arm64
To: Yicong Yang <yangyicong@huawei.com>
Cc: yangyicong@hisilicon.com, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
        linux-kernel@vger.kernel.org, morten.rasmussen@arm.com,
        msuchanek@suse.de, gregkh@linuxfoundation.org, rafael@kernel.org,
        jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
        linuxarm@huawei.com, xuwei5@huawei.com, guohanjun@huawei.com,
        catalin.marinas@arm.com, will@kernel.org, sudeep.holla@arm.com,
        tglx@linutronix.de, peterz@infradead.org, mpe@ellerman.id.au,
        linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, pierre.gondois@arm.com,
        dietmar.eggemann@arm.com, "Nysal Jan K.A." <nysal@linux.ibm.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
 <d0e73e64-cdf7-443b-a8e3-7c1f25533000@linux.ibm.com>
 <a9e19d83-cfc4-910c-7bca-b2dd17647c5f@huawei.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <a9e19d83-cfc4-910c-7bca-b2dd17647c5f@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RnwgPUKSd5jtFDJmCXbPrRtXbk406JvN
X-Proofpoint-ORIG-GUID: RnwgPUKSd5jtFDJmCXbPrRtXbk406JvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=935 clxscore=1015 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_042849_458040_3ADE6398 
X-CRM114-Status: GOOD (  15.33  )
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



On 12/26/24 17:20, Yicong Yang wrote:
> On 2024/12/26 17:23, Shrikanth Hegde wrote:
>>
>>
>> On 12/20/24 13:23, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>
>>> The core CPU control framework supports runtime SMT control which
>>> is not yet supported on arm64. Besides the general vulnerabilities
>>> concerns we want this runtime control on our arm64 server for:
>>>
>>> - better single CPU performance in some cases
>>> - saving overall power consumption
>>>
>>
>> EAS is disabled when SMT is present.
>> I am curious to know how power saving happens here.
> 
> EAS shouldn't work on non-asymmetic systems, so it's not the case here.

Ok. so this is a symmetric system then?

> System wide power consumption comes down from the CPU offlining here.
> 

Ok. So SMT is enabled by default and then at runtime disable it to save 
power by off-lining the sibling threads?


Note: When enabling SMT, current behavior differs when a core is fully 
offline on different archs. You may want to see which is behavior you 
need in that case. i.e either online or skip.

PowerPC change where we are skipping a fully offline core.
https://lore.kernel.org/all/20240731030126.956210-1-nysal@linux.ibm.com/

> Thanks.
> 
>>
>>> This patchset implements it in the following aspects:
>>>
>>> - Provides a default topology_is_primary_thread()
>>> - support retrieve SMT thread number on OF based system
>>> - support retrieve SMT thread number on ACPI based system
>>> - select HOTPLUG_SMT for arm64
>>>
>>> Tests has been done on our ACPI based arm64 server and on ACPI/OF\
>>> based QEMU VMs.
>>>
>> .


