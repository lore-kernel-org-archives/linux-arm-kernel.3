Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDBCC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXRozEPyRdFmB/eFiZ72fgSP/FDKUih11M+CkhAYU/k=; b=we66syDR3Qhbjs9+lK4mk5hSvR
	Wxek71EsbNWI6eA2xZNDQVEuDLRrPTHvMRlxSNiDpy34DQfbEymtqmtJR88WEBjFT+dppPbbYNWwY
	rdbHCOzVDUfoYkOfUQCj9ROvHFAVaDowCrGXMIa2Nv5/AIXy1s+SaTGeqEaMn8hs+SpFcTUhdra4p
	/JWH/9nty6qjPejoobrHfx0E6B3TQWwzcXXIf02yeGYvrRx8LiodvLJLW/jD3Bhkmw4CpNaKCdeIG
	XOdRyQxGqbO2P7LSi0cur6swDFRaZaeJo9CJVPmKEwwvOoZCapFZWkMqhIcHoHQOG4vbE5atDwLuK
	EalokcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7Rd-00000004Ymr-0qax;
	Fri, 10 Jul 2026 09:22:53 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7Ra-00000004YmD-3RZK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 09:22:52 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7mm8w606167;
	Fri, 10 Jul 2026 09:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=FXRozE
	PyRdFmB/eFiZ72fgSP/FDKUih11M+CkhAYU/k=; b=oaqXSSYsaFqf+O5qsWdd58
	SL/+3fQ4F7lJ9kEtq7G8rkeSeaZN7vs1Q/Z188unlRXOWgEI1S010R8/HMstq8XG
	FLxUdjn+K9MwN+t55WNjt+BScO9bfAPjiyiGo6DRdOv1SIExOadOes4m5vu5u27S
	CooNR/CHgHSG2fs93ZA/IKj1pP1XYVCj8J8plVGAy8I1XJL9cGtlw2QTGWhiGzhE
	Jn6hvplzVUrJybCE+dEYDi4bft07fz4RE88pmI8MJQz0jSN805x3QoLRDjIKdIKB
	GutQYC+RA8yYBWCc1lC/EBuNqtiBfg6yEqPloIIcazgomwEJdXl/Om/BWvb6uBOw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6qknwacf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 09:22:36 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66A9JdkT005563;
	Fri, 10 Jul 2026 09:22:36 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7e0hs6ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 09:22:35 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66A9MUPH52953514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jul 2026 09:22:30 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D5572004B;
	Fri, 10 Jul 2026 09:22:30 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADA4020040;
	Fri, 10 Jul 2026 09:22:29 +0000 (GMT)
Received: from [9.224.77.173] (unknown [9.224.77.173])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jul 2026 09:22:29 +0000 (GMT)
Message-ID: <857debcd-3e44-4844-8abc-b26b892d3d7c@linux.ibm.com>
Date: Fri, 10 Jul 2026 11:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/27] KVM: s390: Prepare KVM/s390 for a second KVM
 module
To: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org,
        kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter
 <fritz@linux.ibm.com>,
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
References: <20260706085229.979525-1-seiden@linux.ibm.com>
 <20260706085229.979525-14-seiden@linux.ibm.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20260706085229.979525-14-seiden@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Q/XiJY2a c=1 sm=1 tr=0 ts=6a50b9dc cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=4ICgCYz_5eq5xHeZtxMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: -o4KQjMcDjW9IuVLEIRKcNyJghPFvYRL
X-Proofpoint-ORIG-GUID: -o4KQjMcDjW9IuVLEIRKcNyJghPFvYRL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5MSBTYWx0ZWRfX2ecZOaa89DVV
 gssTNZtsp6kCWQh3BZpnJBCXe2DvQYdq75vW9N5pArjyKm8u48rPcWepb+44q9RQXKSEN5TRyEh
 xRiW/37z37sshT/ABKTWAwi0OYKN3hY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5MSBTYWx0ZWRfX/l5xUK8u3CMN
 qUhQPgpmqH+LJR1SEuw6Fcxo+bGOzFeRYoNrT3dh6Lj7egsG5Ion6v85xELlib2BSDRlyae36Zt
 laK7fIsIJmNv1g7iL4rdH8SxCyYhn/sico5xnGsuHdfuGeZITWl+XzWCNPUszap18Mm2d4ITyA4
 ncrycSr/SlFUlH8fkMJVk8MfySO4fFRfTqMDU+eKGx4KhssgiIcJFkWkcbN/Ep5djq2q87WZnBk
 9uy1obn6eG7fAmNDe73hMH6VoFnixXal8GvpwRBDOj0ITgST3pYeeKXnuQySlBkuc0cyGS93iUR
 n3t2vodJZNBpzsTlwKunDIWfTLpFYEDvys3BjhVoMXNInUZqh31qRJrVnMHOl/NQwBgZw6xARQj
 JcIFdrch2H5TnWvuBdXuZuo37tV1QRl75Vc6ejJhJSITvcn06loCIEX7I4dMnrx5Q945Fid/Z2+
 pOE/sXfNswEOVDTdskA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_022250_989842_214EC604 
X-CRM114-Status: GOOD (  14.27  )
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



Am 06.07.26 um 10:52 schrieb Steffen Eiden:
> Lay the groundwork for a second KVM module. Guard KVM/s390 behind the
> KVM_S390 config and turn CONFIG_KVM on if selected. Move all the
> kvm_host definitions to _s390 postfixed headers. Prepare local header
> include guards for a new location. Move gamp related tracing into a
> separate file. While at it, rename the main KVM/s390 files from
> s390-kvm.{c,h} to just s390.{c,h} to match the naming scheme of other
> architectures.
> 
> No functional change.

[...]
>   arch/s390/include/asm/kvm_host.h              | 774 +-----------------
>   .../asm/{kvm_host.h => kvm_host_s390.h}       |   6 +-
>   arch/s390/include/asm/kvm_host_types.h        | 347 +-------
[...]
>   copy arch/s390/include/asm/{kvm_host.h => kvm_host_s390.h} (99%)
>   copy arch/s390/include/asm/{kvm_host_types.h => kvm_host_s390_types.h} (98%)
This is just an "almost" rename only in the end. Maybe we can convince git to show a better diffstat to reflect that?

In any case, I guess we can handle patch 13 and patch 14 pretty soon upfront so that the patch series gets smaller and is easier to review.

