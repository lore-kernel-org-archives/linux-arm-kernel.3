Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051D1D3940B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGpvBlpPC7q1Fp7UtYpvAoI0Gq9YHSFZavDLiI3s1Dw=; b=1z3o/mw/eiuMO4EHSTPscq3aJa
	NQXzBmu+cba0oZYEXO8o0PllrXlxNEMJKGQgVZPVzsPmYkSO1OSGSLZuho/he5Xx16g9FFbC2cRC6
	BrXTl9WhLpAgAm5X0+9nyOUP6uDe5AWqW71n2ehsp3pmHDbg7SdE+pmXRRUtuGtmfpqOBSKDGZzTu
	2Nbto+iTLNrBx4PvFOMWWrLBhlkAKqFOp5cmepv3mcu/l8jWIaTstaazsfjscH0/1O0sP3b4nhHq8
	m+lguobvnJ9rpfPfzZRWEaRfT4/aDtsSSiT0rC63/iyVdwUCHzueCZqEsr0FcZ7jxuWwAadHFKH6s
	fUILeNyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Exp-0000000HLsa-1ePU;
	Thu, 02 Apr 2026 10:07:49 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Exm-0000000HLrK-2gSg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:07:48 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631LlIav138974;
	Thu, 2 Apr 2026 10:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=VGpvBl
	pPC7q1Fp7UtYpvAoI0Gq9YHSFZavDLiI3s1Dw=; b=Y3QQHFtUVzBSnb4IllhOnA
	+4OMcbDp6x3GxyIm7MYAqqNc81yjOCihRWr7HY6xTDJj42t6YWq3+VCjkPRqolqv
	ta78VJH8tTqsVuzdE6JXSzu/WlNEQCE4YutAMuh826ASr6SyaWLfFlSRLo3OV+EF
	/2SnJNfh8EnASirNIn9DoE92sUMHDYFI41CCZZIZZYkYF/j+nRzcDyTZxjG6U7Fo
	U8QGKtIDpfRhStxUKWUUxJvy7WfzqkYuOm64hOtyO8FsePPWzfDeBWJNXK5UViSm
	jAGSZh7wSm/vgSMiwRR7/KVM/OAepnxNMP/TIZRm8e1FzOcE685PPgsXJ0mxhNfA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4d64dguj4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 10:07:29 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6326no4u013898;
	Thu, 2 Apr 2026 10:07:29 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4d6ttksghd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 10:07:28 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 632A7OTK15860164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Apr 2026 10:07:24 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8062C20063;
	Thu,  2 Apr 2026 10:07:24 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA90A20067;
	Thu,  2 Apr 2026 10:07:23 +0000 (GMT)
Received: from [9.52.200.39] (unknown [9.52.200.39])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Apr 2026 10:07:23 +0000 (GMT)
Message-ID: <23d8ef83-3eb1-4f25-9a62-504122a60a8e@linux.ibm.com>
Date: Thu, 2 Apr 2026 12:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/27] KVM: s390: Introduce arm64 KVM
To: "David Hildenbrand (Arm)" <david@kernel.org>,
        Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org,
        kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Cc: Andreas Grapentin <Andreas.Grapentin@ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Gautam Gala
 <ggala@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
References: <20260402042125.3948963-1-seiden@linux.ibm.com>
 <3898bcc1-f02d-44ae-b13a-4ea52a5a998d@kernel.org>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <3898bcc1-f02d-44ae-b13a-4ea52a5a998d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4OCBTYWx0ZWRfX+bYnSu0+H2Co
 TU8XGRT++5AI1juBC9wFKULMZwylTGyHVVJbXlel4T+PWP9VIUw1vPeDk0liS5ZM7ChcaeRnOwk
 ZBD4T78z5DBXH/ALiZh1S11bEaUNojbY8TnDr3jxQiGOconGZaol3G3YhZLFmPp7Fmqt19/y9A9
 QKey66/gHFgvFqjhooc1efpoFoFNH6zlZsSQBMRTgKgNlREgnrzWJ2a89k9a90QxgyTG+yNEKjD
 B4oOb8CcR6FRYvX/Vmss81mT1rkkPB3etH33a3n8ckWPgIHGueQT0mKRv+A12Miva2gfmf32DLv
 uNCk/KGnEE9K9Cxj9N+Pb6v4qNSW9t4bTaYC8qK4VbiSm31ppZ/GYom6k6JUuA1923GHPUXWWBt
 hhly6TvcfK8zst5TJvOWZT4DtwCkI0KbsZinkZCSCMBzvpnzYelwbHG5bbiXIdEK5f3vYp92CvW
 qLu1wSNNpTqvFwZFi7g==
X-Authority-Analysis: v=2.4 cv=QKZlhwLL c=1 sm=1 tr=0 ts=69ce3fe1 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=BrXnhqggJEmLmTzRH7MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: s_1pDfN2Mgrr-03qGQR_plhnaoiW23lU
X-Proofpoint-ORIG-GUID: s_1pDfN2Mgrr-03qGQR_plhnaoiW23lU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1011
 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_030746_805125_1B55F693 
X-CRM114-Status: GOOD (  12.87  )
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

Am 02.04.26 um 10:53 schrieb David Hildenbrand (Arm):
>>
>> KVM on s390:
>> 	The SAE (Start Arm Execution) instruction is introduced as the
>> 	s390 mechanism for running Arm64 guests, and a new kvm-arm64 module is
>> 	built up incrementally.
>>
>> Upcoming patch series will introduce system-register handling, interrupt
>> support, hypercalls, and additional features such as PMU.
> 
> Pretty cool stuff.
> 
> What's the rough timeline for the other work?

Over the next months. The idea was to split this into consumable chunks and start
with those things where a lot of people have to agree (code movement, code sharing
and shared maintainership). This will certainly evolve depending on patch feedback
and merge progress.

> 
> Regarding I/O, I guess it is primarily VIRTIO (VIRTIO_PCI) for these VMs
> only?

yes, virtio-pci.


