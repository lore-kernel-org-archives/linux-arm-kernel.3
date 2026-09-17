Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2F3C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WuSM56Hoz16tISafbBQ67/yekGRCtTtY+uMPijQV6U=; b=uIivM0njZxr1s7kG575KyD4PMY
	6xEtg2IXzQip9KcEnTxLFMGaDTCN7JzZNm7WCcdUdIyAhBbqcBZdHOdF1PIwt4IMKisRPg8Fuo3bJ
	6OvOEfVIFubrY8t56bkFxyza+D9M0ajhXUQn2mj2Yh9fBXmRswhxiJw3uvcJVmZd7ELBrdIop6rF7
	FVyU5hKdtM4TjYCZnozUOblbPqKQptnO2f60GUMGET4WX3dRMxws8rtJgw4Q7XcELB69WWp5fUNaq
	gb2R278nOtCGpZw7YaBEB6Ic7ATTaceAQRgdodBSBjn0GtRWKLVj/JxLc72s+uahBoVQqXIXY+uka
	1nu7WDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79yn-0000000B9zQ-3BCE;
	Thu, 17 Sep 2026 11:08:37 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79yW-0000000B9w8-1JBO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:08:21 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HA1bb52232904;
	Thu, 17 Sep 2026 11:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4WuSM5
	6Hoz16tISafbBQ67/yekGRCtTtY+uMPijQV6U=; b=IHSiW0KJ1Uwc7rKvZo/0m9
	CznRcEo1/QD/CiqdWum/JbgRIopRP+Y4qCCrQ/xApMsLbvyPxMPGWDy5aHe259YP
	xlmBgQ1PcLEmbS+eZ3yxf1VOp5dOpOBlggJjXtLiOoVag0zVJ+QHuE9qQv1wphXx
	CJvClFcQ2uRIxBgQ7FD0oDphiFiV2zrT2Gyhs4lqr6FQuxYT9NZwDx6iK6S4K1OT
	CFjIJp8ddmLbobVjgFV1nbaQtXCsj3gKfnM17WT9uU2RrL7QbIQXoWH+Lapa7HQF
	zNTv9EYveIk5zv+NsnGVOcZ9DXuC/rwnCghIQz9OoHlg6WwWv+t8DqvwwmNjHpew
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxcv9dyy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 11:07:53 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9aTbw2917896;
	Thu, 17 Sep 2026 11:07:52 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gr5xa1xy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 11:07:52 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68HB7mVE43319692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Sep 2026 11:07:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFB0920043;
	Thu, 17 Sep 2026 11:07:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC55B20040;
	Thu, 17 Sep 2026 11:07:47 +0000 (GMT)
Received: from [9.224.77.173] (unknown [9.224.77.173])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 17 Sep 2026 11:07:47 +0000 (GMT)
Message-ID: <51286424-e802-4ea9-b958-925fee8025ed@linux.ibm.com>
Date: Thu, 17 Sep 2026 13:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 23/23] KVM: s390: arm64: Add KVM_S390_ARM64 Kconfig and
 Makefile
To: Sean Christopherson <seanjc@google.com>,
        Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter
 <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik
 <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
References: <20260831144802.834315-1-seiden@linux.ibm.com>
 <20260831144802.834315-24-seiden@linux.ibm.com> <aphMx5hsoXwIpNjt@google.com>
 <20260903083857.33034-B-seiden@linux.ibm.com> <apmHrnxRLl9BuVhn@google.com>
 <20260903154317.246414-A-seiden@linux.ibm.com> <apmhX8H-WUc3U4_N@google.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <apmhX8H-WUc3U4_N@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE1MyBTYWx0ZWRfXxvXgm8oqRp19
 nQrhg9EQ/0iT2IXEFt08BHaHhUsgrKyvoPi+NFAeU3UU5WQjtMwZp8b7tXugIn2k7CFo6eFSYwM
 tQwG/muNP2QjgP5jk4v4+zXUwT3/rLA=
X-Proofpoint-ORIG-GUID: 6Ugh16w0kSKYc6k82HwIr7iH6p4aBU1L
X-Proofpoint-GUID: pYhdyPFgJVLZ4pZZ3Lh06XuplLJMgZjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE1MyBTYWx0ZWRfX/J3l0K/K4T4/
 k1Qu9iTB8gKSi3qzkVLZPgP5TuALabaJDnd0MM3f5Gfs6A3UuW2z5HRDT37VSdiByJGRkKXsnt/
 XOynhvAAg3kUEdrZQAY9MefMR0mynOoSp0QD+EiQJsNr8q3FYo0H2f9/gwmBogBuA7yIZWL7vXa
 2OdgbCkRNP6cGH52IOdVvccZYRJr+ZGXqtsHoQzsIKw0y06Uxy20/0kbI6c71TV/3pkRUS/xPpp
 aYFNvov7S/8RkhmCAX8Wd5caY/2pU2zltPV9DvQjkG3v1RUDfNSlPLSdq+i19bOaDJ3R7dbeZGJ
 a2XzEvBlGSfRqWfT3/Yytvo4VkqO6/KSzA0ca6GBLbLuLDPYODZTwW1N+kLnoXRCKAtTK3Ari4L
 Boxt4IoBYN6InRSXQuM1d7iJT+Gsl0k1gKTlXbDsX+JifTUSAMxeYELUMQKy9/uWQw77Vpwc87J
 J/UxAnI0um8eOvNI4wg==
X-Authority-Analysis: v=2.4 cv=F+7C5ahN c=1 sm=1 tr=0 ts=6aabca0a cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=nRLfC78URy_-QQUzUV8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_040820_479409_75FA82DE 
X-CRM114-Status: GOOD (  23.72  )
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



Am 03.09.26 um 18:33 schrieb Sean Christopherson:
> On Thu, Sep 03, 2026, Steffen Eiden wrote:
>> On Thu, Sep 03, 2026 at 07:43:58AM -0700, Sean Christopherson wrote:
>>> And FWIW, while it might seem daunting, from my perspective it's not actually that
>>> much churn to do things "right".  Provide KVM_S390_NATIVE, and then have KVM reflect
>>> the "weakest" of S390_NATIVE vs. S390_ARCH.  I.e. make KVM=m if either of the "real"
>>> KVMs will be a module.  That requires some creative shenanigans, but it's not hard,
>>> just weird.
>>
>> FYI the first versions of this series had a 3 configs approach very
>> similar to yours.
>>
>> IIRC it was not so much the churn we have in (upstream) kernel code but
>> more on the distro side and to everyone building the kernel in their
>> favourite architecture (s390 :))
> 
> How many people are running distro kernels on s390 hardware?  And how many distros
> actually change the default KVM settings, e.g. to build KVM as a module instead of
> baking it into the kernel?  My guess is "not many" and "almost none", i.e. the
> actual impact on downstream users is likely miniscule.
> 
>> Suddenly the KVM config changed its behaviour (effectively becoming a noop)
> 
> Not really, because "KVM" itself is inaccessible (well, unless someone is hand-
> editing .configs or generating them by script, but that's their own fault).
> E.g. upgrading to a new kernel will explicitly prompt the user to choose for both
> KVM_S390_NATIVE and KVM_S390_ARM64 (or whatever they get called).
> 
>> I am starting to think that having no separate config option for arm on
>> s390 might be the easisest way. Just KVM and guard both modules behind
>> it. It reduces the config space bloat and I do not see a reason why somoeone
>> should only compile one KVM module but not the other. kvm-arm64 won't
>> load if you do not have the hardware anyways.
> 
> Because there may be an unforseen need down the road?  Smushing things together
> after the fact is generally easy, pulling things apart without breaking everything
> is usually much, much harder.
> 
>> But I am not opposed to the x86 approach. Just thinking loud.
>>
>> Anyways, I am off for vacation expect a reduced reply frequency from my
>> side :)
Yet another option
I think there is value in keeping the config space simpte for users.
Why not simply keep CONFIG_KVM and it will disable, module build, compile-in
both variants.

