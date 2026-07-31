Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6846C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyOLfXapGVCMFCK80B76KNSUZOfJcE7IYnSc6LvcL50=; b=jzydZIOgKUqFLrOOoa9ywFT+9F
	luALITwNL21lPyGeJljfbGIvW7mIXq2jvn6eTEGcnsRwu3If8nCGdGBp8Zve5n+kSiBYeWqvQ0ybr
	gxCQOsY8cAeQgrQ9U6KP4ok9quroFv4Squ0RxTcoDbr8ONH8eSZzVg+MQhIm+gHFxPInxmF/9UcnY
	cG/iMDjM8j6PbFzB1N2xRgOdUaA0VQzsL+YMb4pT9MEOGFQOvXE1KH2tOTvTHGpc3ZdAh/2aQ057z
	rfdE6qGcEb/w7pyHVPYpCDs8IzbdmF9HMnIUHzeaZYhg9jXmYla4xRYP2kBRlJUo/h2k0mQV5UKtV
	BhOhXB/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpodb-0000000CqU4-1ksS;
	Fri, 31 Jul 2026 14:55:04 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpodY-0000000CqSq-2Kzz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:55:02 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBluWX1670964;
	Fri, 31 Jul 2026 14:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=wyOLfXapGVCMFCK80B76KNSUZOfJcE
	7IYnSc6LvcL50=; b=jJsawE+qvRTZfRljcoXav7lVBBplcQ2kVqnu2wquX/fAJv
	ErH+1Ayz1US8ie2AsQTC+J+3yL8U2eGWx6Js5FzRT5PRgNUa45aqFdD56sDkYNZ4
	+ozfCjuoBCzYl6U/pM0aXMM/udHacYrW4iLw15UqKRv9LYxqWAvRvMII5PSdZuLg
	VTuRMpEA7dpupU+ThZeQj0ovbST02BsQ2aHXkdDnOEOexmvAm/FBft9i5AQt/9HH
	jHiF63EEvEzpMgmLq/GwUjxraf/cUdndlaQh+8Y6aRlpqMyfo6bR4rVB2kGbnKK1
	651ebOPQ3fYVaCTj87wqldwV0jXfa1jsbCZC1OFA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fmuyjmjqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 14:54:43 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66VEfGuj024182;
	Fri, 31 Jul 2026 14:54:42 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fn9pgr5km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 14:54:42 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66VEsc9L30736658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jul 2026 14:54:38 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F32A62004D;
	Fri, 31 Jul 2026 14:54:37 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D27502004F;
	Fri, 31 Jul 2026 14:54:36 +0000 (GMT)
Received: from osiris (unknown [9.111.39.121])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 31 Jul 2026 14:54:36 +0000 (GMT)
Date: Fri, 31 Jul 2026 16:54:35 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
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
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v5 01/31] vfio: Use file-based reference counting for KVM
Message-ID: <20260731145435.1016137-B-seiden@linux.ibm.com>
References: <20260731130902.654679-1-seiden@linux.ibm.com>
 <20260731130902.654679-2-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731130902.654679-2-seiden@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExMyBTYWx0ZWRfX4hv35tlDuMVM
 F3TXRYLy4XQkf8bKrgeOqkZm8c6XRwqSoYVNvYSvleEg8wS4D5URwBB98Jb7iE9aJkGst/R1dz+
 BW/bYeAx9EjmdIK40TJ57PN0Ihl9Ias=
X-Proofpoint-GUID: jwhUHEZPuOYg88dhNDAhOGsqrR0YX0rG
X-Proofpoint-ORIG-GUID: FDr6UuFMO9qRKFTSC5NpcgYL8jFU-QrO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExMyBTYWx0ZWRfXwkD7c0jWNzi6
 bnBgGVovJ7pze0ug+D4hmokKx4LE7ns0bc3TM9Vh6A3YJv0jJ6eOVZh0ZNBRgbYAzqcwlm8ybjw
 TwhpYqm15MqiGWPxV127CFfJlRy/DwdrA2fOV/h2XXFrXyBA7laayrb5AB5qBePnFWuua/h0AUC
 Cj09HAExdd4yNt0narsKYtFcc3bYVujyJi11qGI1vflttyF8nPzPMqk3W3r5oKRnOQfoz6/ZCet
 lTiy4RLKkpfx9JwvrstRQl4U1aMFrH8TIWuTl7XgadrzS6KPOiqha3WSxSbZIqfLtYzAFD74jaA
 d2ix93j3tlByr4I4JEhSxmhURNcr1I/MCsjoB+SQaBsHPFcyUJ36EpntoWdDGjybkqzZsdwbC9U
 qpbPeoYWf8lsvw0xbyymoPfWM4VTlkp3C3b1XrXcgohtmoogjATDUJLUbHBL/Y5t55BPlmimdzD
 J9NcraK8Xf9O2jDZpVA==
X-Authority-Analysis: v=2.4 cv=X5Vi7mTe c=1 sm=1 tr=0 ts=6a6cb733 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=Ikd4Dj_1AAAA:8 a=VnNF1IyMAAAA:8 a=1c9xuZXCCkOUJ1rrCtEA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_075500_742036_44618B05 
X-CRM114-Status: GOOD (  17.84  )
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

On Fri, Jul 31, 2026 at 03:08:29PM +0200, Steffen Eiden wrote:
> Replace manual module reference counting with file-based reference
> counting for KVM integration. Previously, VFIO used symbol_get() to
> obtain function pointers for kvm_get_kvm_safe() and kvm_put_kvm(),
> then manually tracked module references through these symbols. This
> approach required storing the put_kvm function pointer in each device
> and carefully managing symbol references.
> 
> Pass struct file pointers instead of struct kvm pointers throughout the
> VFIO-KVM interface. This leverages the kernel's existing file reference
> counting mechanism via get_file_active() and fput(), eliminating the
> need for manual module reference tracking. The file->private_data field
> provides access to the underlying struct kvm when needed.
> 
> This simplifies the code and removes all remaining externally exported
> symbols for KVM, paving the path for a second concurrent KVM module.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
> ---
>  arch/x86/include/asm/kvm_page_track.h |  8 ++---
>  arch/x86/kvm/Makefile                 |  3 --
>  arch/x86/kvm/mmu/page_track.c         | 16 +++++----
>  drivers/s390/crypto/vfio_ap_ops.c     | 24 ++++++++++---
>  drivers/vfio/group.c                  |  2 +-
>  drivers/vfio/pci/vfio_pci_zdev.c      |  7 +++-
>  drivers/vfio/vfio.h                   | 10 +++---
>  drivers/vfio/vfio_main.c              | 49 ++++++---------------------
>  include/linux/kvm_host.h              |  2 ++
>  include/linux/vfio.h                  |  4 +--
>  virt/kvm/kvm_main.c                   | 23 ++++++++++---
>  virt/kvm/vfio.c                       |  8 ++---
>  12 files changed, 81 insertions(+), 75 deletions(-)

@sean: This is based on your draft in https://lore.kernel.org/all/adkFk3ZN4HJtpLA3@google.com/
do you want another/more attribution? If yes which?

	Steffen

