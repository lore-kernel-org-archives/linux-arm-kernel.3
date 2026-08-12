Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984D4C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 17:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtGhBIH6rBiQb6jAGz2MNon2CVl6n919ow/5bNoh5e8=; b=fWDcYWRaLXEC4LzWv4VXYGu4Nf
	dM98hq98h7Oyqv/Nv4JYPNP0zVaFWFe6iiP4EgAudQphwdD54i7anF6FnNPLjHJuEtDLvduZMbrFK
	ErqZAVgQ3DEEDfg3DEzkDu6CgCgkrBokFfwsgJEY2hySbL6BpuYoH1VUkrgBqG7ACpHMtkSq6Qu6H
	5xvXJ3ATiH1+HDyr8zh4UyXNsuHO5CtM0ndgqFCamccDYQQAq1e39pgiKcMlFRns7NEeGwpIwCow7
	Y7ZtGp9FsfmYtuxmr3Y+6NG4JuSoadlAZtuxB9np7/86QJY3/PYMK3sGK34fNcYHiXvc335EVCCpC
	kTbQp88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCWl-0000000GeLg-1zHU;
	Wed, 12 Aug 2026 17:14:07 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCWi-0000000GeLL-3PQU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 17:14:05 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CH1h3o2218045;
	Wed, 12 Aug 2026 17:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=vtGhBI
	H6rBiQb6jAGz2MNon2CVl6n919ow/5bNoh5e8=; b=Ujm0rMUr8QiUCxLoOKm5tx
	L6rcAZD5yYYmeL0jkDSwK/9tLoC16QeexXC7ADmInrEtUttmYhmapiD7IYSwoPwu
	pVmT/F/EPFAWRFZ1Ve/cmgskFKWxLs28YNc33i2wSNk8WRg0iUdvDlXIujT+uHQ9
	5tEu8HR+KsBM1tQ/YRgTVjBUhAxCj3Xa2Ux5Fef2dq++WzPhPESYcwCuAzYlKGda
	SnFZHDUDQzyNWV4qniNSFt8OQREHielEQ00VaVsT5F9m9S5VejHxYxkuVw1k+ITM
	/VnrIuP1ly6oL0+8iumSE4mhxI314hZGk2MYBuGePrT33kWTazcOnrmnfBXThv8Q
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvk03pn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 17:13:53 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67CHBQuu028259;
	Wed, 12 Aug 2026 17:13:52 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fxfsjy46w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 17:13:52 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67CHDmlW39780696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2026 17:13:48 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1092720040;
	Wed, 12 Aug 2026 17:13:48 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A75620043;
	Wed, 12 Aug 2026 17:13:45 +0000 (GMT)
Received: from [9.111.47.51] (unknown [9.111.47.51])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Aug 2026 17:13:45 +0000 (GMT)
Message-ID: <c4c6e007-b6b8-4c6d-adda-1d9cb2cb06fa@linux.ibm.com>
Date: Wed, 12 Aug 2026 19:13:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/33] KVM: s390: Extract gmap tracing to a separate
 header
To: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org,
        kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
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
        Sean Christopherson <seanjc@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik
 <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
References: <20260812153631.3376090-1-seiden@linux.ibm.com>
 <20260812153631.3376090-13-seiden@linux.ibm.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20260812153631.3376090-13-seiden@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEzOCBTYWx0ZWRfXyJJKj2LKb6We
 o4N9biqjZvpXXw8Yw4+v/gKHeqImGQQGstIihglG6g4H7WCNln76fEl1fyXzStOfVxKSNHG53pk
 kF7/QiIi2Hetc+aL81rFr8X8BsFePOKFFNgshrTXHnkJ2l2QZGqqe7wMsuo9vWXfu2/Cb26XAgH
 8ZYPQgVYiW0tW+P4pRrCezg1UA1vCV6Tr/oCdPgUIWjRTK/CDYkzSjlz/IsKmM3nKCz2EuwuuSW
 ys2n+2L4J1CwiWwpcSK0Vd2K0Bd9xdgrqxUtGUCqhNIOQ0vgfYhQVWxmt4GWuyQ9WDrgsEtLi83
 fGDHX9qVshbNMIzmrTjYI/6lltVKXlTEGoEmA6kIglfkYcFZRAf5EKSfAYLPK1rAbFRA17lR/hU
 5xNOyO2oWRgjQZO9orxArvYjw7NXkbdFECj197SzLSRA14C+HuxlpL9ImHoSyG10KY7TwhjL6AA
 LoOXkbmYzam3z6fcC/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEzOCBTYWx0ZWRfX8A2GiiyzOeze
 2WXNVIBk9XvXLKyElb8lMTXWX8eQcf2M6l+Ie2csDnk/rZ0EdftSn7JRG5vED9s7pxcd4UYoD1K
 OKlutzfD18rKIeLGxb/HYqHIZaThMRQ=
X-Authority-Analysis: v=2.4 cv=RqD16imK c=1 sm=1 tr=0 ts=6a7ca9d2 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=yzJRou8Qdc9NfXe1HyYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: BnQ2_1V_LArLz89TSAuwglc3jzb5nbJL
X-Proofpoint-ORIG-GUID: YNJaABLtzoFps6WA75Y1q49bgrbDj74z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_101404_868857_08C23895 
X-CRM114-Status: GOOD (  19.80  )
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



Am 12.08.26 um 17:36 schrieb Steffen Eiden:
> Move the kvm_s390_major_guest_pfault trace event from trace.h to a new
> trace_gmap.h header. This separates gmap-specific tracing from general
> KVM/s390 tracing, preparing for code sharing between multiple KVM
> implementations.
> 
> The trace event definition is updated to use local defines for
> parameters so that they can be replaced later with ease for when another
> KVM implementation uses these traces.
> 
> No functional change.
> 
> Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>

Reviewed-by: Christian Borntraeger <borntraeger@linux.ibm.com>

> ---
>   arch/s390/kvm/faultin.c    |  3 ++-
>   arch/s390/kvm/trace.h      | 14 ------------
>   arch/s390/kvm/trace_gmap.h | 47 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 49 insertions(+), 15 deletions(-)
>   create mode 100644 arch/s390/kvm/trace_gmap.h
> 
> diff --git a/arch/s390/kvm/faultin.c b/arch/s390/kvm/faultin.c
> index 3cc45f7f5b2d..1dc79807012c 100644
> --- a/arch/s390/kvm/faultin.c
> +++ b/arch/s390/kvm/faultin.c
> @@ -9,10 +9,11 @@
>   #include <linux/kvm_host.h>
>   
>   #include "gmap.h"
> -#include "trace.h"
>   #include "faultin.h"
>   
>   bool kvm_arch_setup_async_pf(struct kvm_vcpu *vcpu);
> +#define CREATE_TRACE_POINTS
> +#include "trace_gmap.h"
>   
>   /*
>    * kvm_s390_faultin_gfn() - handle a dat fault.
> diff --git a/arch/s390/kvm/trace.h b/arch/s390/kvm/trace.h
> index dd2685c7df5b..3d2fffb1555a 100644
> --- a/arch/s390/kvm/trace.h
> +++ b/arch/s390/kvm/trace.h
> @@ -45,20 +45,6 @@ TRACE_EVENT(kvm_s390_skey_related_inst,
>   	    VCPU_TP_PRINTK("%s", "storage key related instruction")
>   	);
>   
> -TRACE_EVENT(kvm_s390_major_guest_pfault,
> -	    TP_PROTO(VCPU_PROTO_COMMON),
> -	    TP_ARGS(VCPU_ARGS_COMMON),
> -
> -	    TP_STRUCT__entry(
> -		    VCPU_FIELD_COMMON
> -		    ),
> -
> -	    TP_fast_assign(
> -		    VCPU_ASSIGN_COMMON
> -		    ),
> -	    VCPU_TP_PRINTK("%s", "major fault, maybe applicable for pfault")
> -	);
> -
>   TRACE_EVENT(kvm_s390_pfault_init,
>   	    TP_PROTO(VCPU_PROTO_COMMON, long pfault_token),
>   	    TP_ARGS(VCPU_ARGS_COMMON, pfault_token),
> diff --git a/arch/s390/kvm/trace_gmap.h b/arch/s390/kvm/trace_gmap.h
> new file mode 100644
> index 000000000000..a3cad705021b
> --- /dev/null
> +++ b/arch/s390/kvm/trace_gmap.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#if !defined(GMAP_TRACE_KVM_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define GMAP_TRACE_KVM_H
> +
> +#include <linux/tracepoint.h>
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM kvm
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE trace_gmap
> +
> +#define __KVM_FIELDS \
> +	__field(unsigned long, pswmask) \
> +	__field(unsigned long, pswaddr)
> +#define __KVM_ASSIGN ({\
> +	__entry->pswmask = vcpu->arch.sie_block->gpsw.mask; \
> +	__entry->pswaddr = vcpu->arch.sie_block->gpsw.addr; \
> +	})
> +#define __KVM_PRINT \
> +	__entry->pswmask,\
> +	__entry->pswaddr
> +
> +TRACE_EVENT(kvm_s390_major_guest_pfault,
> +	    TP_PROTO(struct kvm_vcpu *vcpu),
> +	    TP_ARGS(vcpu),
> +
> +	    TP_STRUCT__entry(
> +		__field(int, id)
> +		__KVM_FIELDS
> +		),
> +
> +	    TP_fast_assign(
> +		__entry->id = vcpu->vcpu_id;
> +		__KVM_ASSIGN
> +		),
> +	    TP_printk("%02d[%016lx-%016lx]: major fault, maybe applicable for pfault",
> +		__entry->id,
> +		__KVM_PRINT
> +		)
> +	    );
> +
> +#endif /* GMAP_TRACE_KVM_H */
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>


