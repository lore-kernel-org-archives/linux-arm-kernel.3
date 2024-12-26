Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862DFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HG/2rLZ96lKXoOhm/FE0fLTX6r570qhTekaN5ef5EsQ=; b=WyDRopaXGk3IFkVjmsNlvF8k5Q
	gce9wLPgkbFQrwLiKvON+UPl+Yk93FsOEKKoRKlqMAi3INsKG926NsZmgQrs8pv2fbGI7gjkTk/Sn
	LNqv9xDc1bVqGyjjKDcdoJUJ2AOSnk2TgDci6qu63/E3iZvy0bK249Osie5uXP2cq3pOnMJ38MpLZ
	FsBSb29MJSV6D9yiAyPeSOib/eRQsIgPol9nIm/+IPWdX3e31XHYNGeiJTbcynM/TziOvWGqo/PCJ
	gSTYdZq5K5536VbQGouHttQR4deDhKnTJ8AQcaZ8oxrYM9QtCW33JP+ZT8d/+iSXN2gtlMRLNPrb4
	YDo+WXqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQk83-0000000FWlo-3esY;
	Thu, 26 Dec 2024 09:26:03 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQk6n-0000000FWe5-2y5o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 09:24:46 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ3sI6M008911;
	Thu, 26 Dec 2024 09:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HG/2rL
	Z96lKXoOhm/FE0fLTX6r570qhTekaN5ef5EsQ=; b=heiEhqAJF6PB/bM1AYVNla
	qdsA/8GwzTX2cw241Vmn0g/Xkd3Nz33Q/Nx4b+0CkGOnut3swCeK9PSuTgJgb86M
	czX4dF8uH+WiD3EHrQDjBDgBZHbhojwW0RxOLfzZCbU5MEMKiiaQReAP95Sm4LV4
	K4wBjszYgltx/Ow1KF0vDz6GihRSof57or0r+3RWZKlltzjIDdsXqXYsox/gyte1
	hkY6+4IrlQfv8x4bHHWt8Niapik1p1Kjbbl4wG8kfm0z20eVCQEusd6ZYMDbbgpR
	7kmN0KiFA+4ASmHINbQx6gNYpHJ5eEcMw7XGjGwQzyZmUdKUnWwKpKxdVNm2nh1A
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43rymh12t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 09:23:42 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ5VhGj010570;
	Thu, 26 Dec 2024 09:23:41 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43p90n9eng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 09:23:40 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BQ9NcB856689004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 09:23:39 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE0A52004B;
	Thu, 26 Dec 2024 09:23:38 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C920320040;
	Thu, 26 Dec 2024 09:23:33 +0000 (GMT)
Received: from [9.124.219.96] (unknown [9.124.219.96])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Dec 2024 09:23:33 +0000 (GMT)
Message-ID: <d0e73e64-cdf7-443b-a8e3-7c1f25533000@linux.ibm.com>
Date: Thu, 26 Dec 2024 14:53:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/4] Support SMT control on arm64
To: Yicong Yang <yangyicong@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
        linux-kernel@vger.kernel.org, morten.rasmussen@arm.com,
        msuchanek@suse.de, gregkh@linuxfoundation.org, rafael@kernel.org,
        jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
        linuxarm@huawei.com, yangyicong@hisilicon.com, xuwei5@huawei.com,
        guohanjun@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        sudeep.holla@arm.com, tglx@linutronix.de, peterz@infradead.org,
        mpe@ellerman.id.au, linux-arm-kernel@lists.infradead.org,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        pierre.gondois@arm.com, dietmar.eggemann@arm.com
References: <20241220075313.51502-1-yangyicong@huawei.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20241220075313.51502-1-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TecHftRr10EKN3_ENZX2-3FGtFYZ8j2N
X-Proofpoint-GUID: TecHftRr10EKN3_ENZX2-3FGtFYZ8j2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=904 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_012445_755473_9DC267F4 
X-CRM114-Status: GOOD (  11.99  )
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



On 12/20/24 13:23, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> The core CPU control framework supports runtime SMT control which
> is not yet supported on arm64. Besides the general vulnerabilities
> concerns we want this runtime control on our arm64 server for:
> 
> - better single CPU performance in some cases
> - saving overall power consumption
> 

EAS is disabled when SMT is present.
I am curious to know how power saving happens here.

> This patchset implements it in the following aspects:
> 
> - Provides a default topology_is_primary_thread()
> - support retrieve SMT thread number on OF based system
> - support retrieve SMT thread number on ACPI based system
> - select HOTPLUG_SMT for arm64
> 
> Tests has been done on our ACPI based arm64 server and on ACPI/OF\
> based QEMU VMs.
> 

