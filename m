Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D07CCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 08:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZliozmQXErzdVbcAEuuYA4ioP0OwjHLAmQUHqa27MI0=; b=acUGadAPZndwV0yiM2IM0wP0DN
	SUU5ftvoTl5iOEU6HnF7ul9aD+dpzyFNi8djwHauinD5u2sVgkvMwUqZtrfpxvTa08iE9Lp2TcpNH
	1E6Zl0L4r4APyAQxgkbynZxOLI/BLa9ootb76AP/O8gBCSmBvgT6Z3WAP6oy1qTFgWvGsI4SeBr1c
	pLITasZXorfwpM5wYP/Sp/RZSTPPcxzwqk85JvPzz0Yt+uIwUFbiy8oEXeWxptJYZ1S5CFKiReqXB
	dEy1gmtUtNStJ+OYBjOidySlZNanLSS9vwYfvKDE+BsiEwOTu+WqGrdM5zPN18ZEDa/JgqLt5AstK
	zd5Y9nhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLbx-0000000AF3d-0eNb;
	Fri, 22 May 2026 08:52:05 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLbt-0000000AF2m-2Sbx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 08:52:03 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LJrT3i605415;
	Fri, 22 May 2026 08:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Zliozm
	QXErzdVbcAEuuYA4ioP0OwjHLAmQUHqa27MI0=; b=lxr+QvKf0Mr+x1s4RoBO5e
	+CjsR8A03QtXAUozeaGWXD/q89CAGn2JAe50fADep9NyL/5qYj9HE+h6GZkrw0WW
	O0oKiuAWCIYSszNCdsbRAN7cjQZrmZVm8WvxBcdp3QifjSk9hZa9t38IkAYwZnHw
	yY+y+Ur+wKGyvSRyK1e+Da8VGhjUQc+Ilqa70YhP3Au+niqfoqpBnCJQXbz06sQj
	jkmGyXAfhlwqbx5PChCgBHVmv768A1Y1jHSYgRFN0j4BskjQcMjD2SZ+iwpIqCbM
	vQP2UFMnP30u8Qj3tVuJbB1e/cfwQe9quuTH3JtDWhfLhC17LhyOqMImZLyT1OOQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6h75b4aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 May 2026 08:51:39 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64M8OVcx001628;
	Fri, 22 May 2026 08:51:38 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4e75kyfvxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 May 2026 08:51:38 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64M8pYtc50069792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 May 2026 08:51:34 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE5B420040;
	Fri, 22 May 2026 08:51:34 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C52C20043;
	Fri, 22 May 2026 08:51:34 +0000 (GMT)
Received: from [9.111.153.207] (unknown [9.111.153.207])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 22 May 2026 08:51:34 +0000 (GMT)
Message-ID: <48871045-9ec8-4e62-a2c5-809e3070d671@linux.ibm.com>
Date: Fri, 22 May 2026 10:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] arm64/vdso: Enable SFrame generation in vDSO
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Steven Rostedt <rostedt@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Indu Bhagat <ibhagatgnu@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>, Weinan Liu <wnliu@google.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
References: <20260417150827.1183376-1-jremus@linux.ibm.com>
 <20260417150827.1183376-4-jremus@linux.ibm.com>
 <CADBMgpwCuYCYPSOCvcm0-rXS=cvFZ-GsP5V1GJFEhghF5JMUDg@mail.gmail.com>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <CADBMgpwCuYCYPSOCvcm0-rXS=cvFZ-GsP5V1GJFEhghF5JMUDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ffCdDUQF c=1 sm=1 tr=0 ts=6a10191b cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=1XWaLZrsAAAA:8 a=mv227vhjM3TcytF6RtgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Pb1y7cZCRYls4quKbWNkbbw4xsnDxH-q
X-Proofpoint-GUID: Cj74AwLONlCGr28kjSP8-X0zND79HmN8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA4NSBTYWx0ZWRfXz6NHKHZBmSqJ
 sljGP2a6wYcUMEGSWkBjp8X7vvLBZQRHDgMIQEjodd3Z7uTdQqbNNQ54W3ocxHJYFif1XEfhOWR
 o1YN8FQazCA8ffEHrOExovKwR2Tw746iHY/bYUx5wuGGImTSUxs9dxeBenq3N84dO4Y0faHo7Ds
 RFoo+tvnFvJGJ2HqDsJR/T5WhxKWtwt808peIL3VH5l7XAWSOsKzLAD4HJFllXcu8a1f2aLIfBK
 5U5LpEKszKpuyPJ+8YQBj8TvV1UQyyKyUjyDpHCW2/kAjyLFDLjG2S9gTLazYsyGf/MCkO2Nh/Y
 QuS1hxi0JcVoU+anAv94dutHglg3IDK8yzgxNrqphuNiGl/sTjb6/eUORWroX34rwNCB8z9yX4J
 YJrgCMKcURfB78u63sHdBMjdEDFL9vIRP4ZvQstC89BlewsbGmwhGfwHu36cbtBv0I5WD85cJB7
 lxUDZOQ9d+MKiETnq9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_015201_633871_9C7D16A8 
X-CRM114-Status: GOOD (  30.68  )
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

Hello Dylan,

thank you for the feedback!

On 5/22/2026 3:31 AM, Dylan Hatch wrote:
> On Fri, Apr 17, 2026 at 8:08 AM Jens Remus <jremus@linux.ibm.com> wrote:
>>
>> This replicates Josh's x86 patch "x86/vdso: Enable sframe generation
>> in VDSO" [1] for arm64.
>>
>> Enable .sframe generation in the vDSO library so kernel and user space
>> can unwind through it.  Keep all function symbols in the vDSO .symtab
>> for stack trace purposes.  This enables perf to lookup these function
>> symbols in addition to those already exported in vDSO .dynsym.
>>
>> Starting with binutils 2.46 both GNU assembler and GNU linker
>> exclusively support generating and merging .sframe in SFrame V3 format.
>> For vDSO, only if supported by the assembler, generate .sframe, collect
>> it, mark it as KEEP, and generate a GNU_SFRAME program table entry.
>> Otherwise explicitly discard any .sframe.
>>
>> [1]: x86/vdso: Enable sframe generation in VDSO,
>>      https://lore.kernel.org/all/20260211141357.271402-7-jremus@linux.ibm.com/
>>
>> Signed-off-by: Jens Remus <jremus@linux.ibm.com>
>> ---
>>
>> Notes (jremus):
>>     @Dylan:  Adding -Wa,--gsframe-3 to the VDSO CC_FLAGS_ADD_VDSO (and
>>     AS_FLAGS_ADD_VDSO) may clash with your patch [1] that adds likewise
>>     to the CC_FLAGS_REMOVE_VDSO.  Any idea how to resolve?
>>
>>     [1]: [PATCH v3 2/8] arm64, unwind: build kernel with sframe V3 info,
>>          https://lore.kernel.org/all/20260406185000.1378082-3-dylanbhatch@google.com/
> 
> In a kernel tree with both your patch and my [1] patch merged, I
> believe we'd want to hold two invariants true:
> 
> 1. If HAVE_UNWIND_KERNEL_SFRAME=n, we must not build the kernel with .sframe.
> 2. If AS_SFRAME3=y, we must build vDSO with .sframe.
> 
> Since HAVE_UNWIND_KERNEL_SFRAME=y implies AS_SFRAME3=y, I wonder if we
> should be able to drop CC_FLAGS_SFRAME from CC_FLAGS_REMOVE_VDSO and
> move some definitions:
> 
> diff --git a/Makefile b/Makefile
> index 227fda16deb1..ef059bccb8c1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1147,12 +1147,15 @@ endif
>  # Ensure compilers do not transform certain loops into calls to wcslen()
>  KBUILD_CFLAGS += -fno-builtin-wcslen
> 
> +ifeq ($(CONFIG_AS_SFRAME3),y)
> +CC_FLAGS_SFRAME := -Wa,--gsframe-3
> +export CC_FLAGS_SFRAME
> +endif
> +
>  # build with sframe table
>  ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
> -CC_FLAGS_SFRAME := -Wa,--gsframe-3
>  KBUILD_CFLAGS  += $(CC_FLAGS_SFRAME)
>  KBUILD_AFLAGS  += $(CC_FLAGS_SFRAME)
> -export CC_FLAGS_SFRAME
>  endif
> 
>  # change __FILE__ to the relative path to the source directory
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index e90427a8d0f6..f03cac27857c 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -15,10 +15,6 @@ obj-vdso := vgettimeofday.o note.o sigreturn.o
> vgetrandom.o vgetrandom-chacha.o
>  targets := $(obj-vdso) vdso.so vdso.so.dbg
>  obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
> 
> -ifeq ($(CONFIG_AS_SFRAME3),y)
> -  SFRAME_CFLAGS := -Wa,--gsframe-3
> -endif
> -
>  btildflags-$(CONFIG_ARM64_BTI_KERNEL) += -z force-bti
> 
>  # -Bsymbolic has been added for consistency with arm, the compat vDSO and
> @@ -42,12 +38,12 @@ ccflags-y += -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
>  CC_FLAGS_REMOVE_VDSO := $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) \
>                         $(RANDSTRUCT_CFLAGS) $(KSTACK_ERASE_CFLAGS) \
>                         $(GCC_PLUGINS_CFLAGS) \
> -                       $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) $(CC_FLAGS_SFRAME) \
> +                       $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
>                         -Wmissing-prototypes -Wmissing-declarations
> 
> -CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables
> $(SFRAME_CFLAGS)
> +CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables
> $(CC_FLAGS_SFRAME)
> 
> -AS_FLAGS_ADD_VDSO := $(SFRAME_CFLAGS)
> +AS_FLAGS_ADD_VDSO := $(CC_FLAGS_SFRAME)
> 
>  CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_vgetrandom.o = $(CC_FLAGS_REMOVE_VDSO)
> 
> 
> If done this way I think we will add the -Wa,--gsframe-3 twice when
> HAVE_UNWIND_KERNEL_SFRAME=y, but maybe that's not a problem? This
> could probably be folded into either this patch or mine [1], depending
> which is applied first. I'm happy to rebase my unwind-for-kernel
> patches onto this series, or we can do the other way around if that
> works better.
> 
> What do you think?

I like that approach.  Go ahead.

Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


