Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394DCCD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ecz0b6bkTM2p7VEn/MpGtmMDhbNkBc+vtuAgUH6ZR4w=; b=O/u8YQ9Ps7/WKNVokM5DqroUw/
	8Y59ZivT9pCjmCFWklCSrG5ZQDE1hW+Z/lPqzbsNDVECbUL5XTQWv49hs2+Kvd+Vw7UxeCj74d8Em
	qnf8VRKGXxyYDya89BAQz+E05sEYg5f6iP+k8STJFCLEVlRC1r7QMrn5/sPxogm1bXAzxzfJryjH5
	uXvb5600noqCLwqrxN/lKIFUX+dUgfitBt6grMlgqmjFSFTdlxAcDsAmfYrmkaE0xaAVdvHyLWhz8
	IrERygC7dUmINA8tP7QWrFfdTRpYaOgBX9fB+ZVHwm8iqcJZZ4sc8Ceh3u5vprEBzzwSln+URKPJE
	j6V3T8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIGy-00000001Fst-0iYF;
	Tue, 19 May 2026 11:06:04 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIGv-00000001FsH-0E9g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:06:02 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JB34J73464297;
	Tue, 19 May 2026 11:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ecz0b6
	bkTM2p7VEn/MpGtmMDhbNkBc+vtuAgUH6ZR4w=; b=GiIMYvgyhFpjDjuVLBYEK+
	VFfJCj9AZ/SipTuEMiOt5TgDa5XFwfJ2wGO254jR4nlBXRDHdC18LkWyMRJvMHsq
	SvZd3P0MFV6Y75O3e9NFh2uWjWGuNhkwMpFqfzku2TVmf6mrKw/zWXLDtUkVL44h
	4tkFJRNpokLtY5Zjm3SMiN0lmgTkYEf7+Sx44BeWvCo9N13kNjBMASoqleqzd6Tf
	tgX/k2pekoOQiS3ftcmqV5RChMTL3vbS9YxBizFD3ON8QO/3hl/0khFhaoSh92Ax
	rkmekvyP8GxZvgvAPNDwBV10ZMraNBWIN1caMAOAnUDub3GNw3qMpts/lpm5h9ng
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6h74vjpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 11:05:27 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64JAs6S8005997;
	Tue, 19 May 2026 11:05:26 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e73wk28ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 11:05:26 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64JB5O1u51577158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 May 2026 11:05:24 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1060F20043;
	Tue, 19 May 2026 11:05:24 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 952802004E;
	Tue, 19 May 2026 11:05:23 +0000 (GMT)
Received: from [9.52.200.195] (unknown [9.52.200.195])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 19 May 2026 11:05:23 +0000 (GMT)
Message-ID: <4f429a50-df5d-411f-b40e-048d3cad5133@linux.ibm.com>
Date: Tue, 19 May 2026 13:05:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] unwind, arm64: add sframe unwinder for kernel
To: Dylan Hatch <dylanbhatch@google.com>, Mostafa Saleh <smostafa@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>,
        Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
        Indu Bhagat <ibhagatgnu@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
        Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
        joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
        linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Randy Dunlap <rdunlap@infradead.org>
References: <20260428183643.3796063-1-dylanbhatch@google.com>
 <agcEMEl-QR0g6DgF@google.com>
 <CADBMgpx38SUUuYYCm612STqh01jqv817WnJeeXYTD7Uc1r-fug@mail.gmail.com>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <CADBMgpx38SUUuYYCm612STqh01jqv817WnJeeXYTD7Uc1r-fug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ffCdDUQF c=1 sm=1 tr=0 ts=6a0c43f7 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=1XWaLZrsAAAA:8 a=vi3vIZuo0_P7K9Gr5dYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: FzCaTIywfcKYwO9lGZWeoSmYEglQVNGg
X-Proofpoint-GUID: KSjACJnZ7ULtZHp3LO8CcHya4AwIp6NF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNCBTYWx0ZWRfX3o6f60r+0H0z
 WCwAd+kx3qqdh+yG03cQdB8RPl+5woVIM0plZkhVj5tIXXYLi5CeNvE92eP1fzNfd7Oy/202N1O
 MdAD7c1uhVpLJsR+b084HRAmFBzzgsoOVrruXAEdoLVBLK8WlBpzcGZOVIzZA8Wt7tXgtK7O3sh
 O+YhlX8iWMNqMevbfYx861/E8MY2Qfc62jFA8GPbbdmqQvq8nley8HKWPTTZp2Dm+QYGn2+qtW6
 xIlvDKtf1C0JmzehN6LR2yOyY/A7cV//6kTftU/06XT09PUIR7oFcGdGEUFsIF2QMpvzaaIMxH2
 1feVFB8YUtgFr70PlYz3Z6bpRPuXBBc0vYEEzXJFVp1Yjiu7NSDbiD6Zy8dz9rfHJ9oVMWiiqpP
 +05TNX94AJFB4124JPwhSAEuhWM5p0Vn96sL7kfnePQfyvtMQakZT7ksk0lq2BCyuCju9IggX9w
 as7ag1RxqoQ+UzrF40g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_040601_105314_A4ABAD5F 
X-CRM114-Status: GOOD (  34.02  )
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

Hi Dylan and Mostafa!

On 5/18/2026 7:55 PM, Dylan Hatch wrote:
> On Fri, May 15, 2026 at 4:32 AM Mostafa Saleh <smostafa@google.com> wrote:
>> On Tue, Apr 28, 2026 at 06:36:35PM +0000, Dylan Hatch wrote:
>>> Implement a generic kernel sframe-based [1] unwinder. The main goal is
>>> to improve reliable stacktrace on arm64 by unwinding across exception
>>> boundaries.
>>>
>>> On x86, the ORC unwinder provides reliable stacktrace through similar
>>> methodology, but arm64 lacks the necessary support from objtool to
>>> create ORC unwind tables.
>>>
>>> Currently, there's already a sframe unwinder proposed for userspace: [2].
>>> To maintain common definitions and algorithms for sframe lookup, a
>>> substantial portion of this patch series aims to refactor the sframe
>>> lookup code to support both kernel and userspace sframe sections.
>>>
>>> Currently, only GNU Binutils support sframe. This series relies on the
>>> Sframe V3 format, which is supported in binutils 2.46.
>>>
>>> These patches are based on Steven Rostedt's sframe/core branch [3],
>>> which is and aggregation of existing work done for x86 sframe userspace
>>> unwind, and contains [2]. This branch is, in turn, based on Linux
>>> v7.0-rc3. This full series (applied to the sframe/core branch) is
>>> available on github: [4].
>>>
>>
>> Not sure if related, but after updating my toolchain
>> (aarch64-linux-gnu-gcc (Debian 15.2.0-4) 15.2.0), I hit link errors:
>> ld.lld: error: arch/arm64/kernel/vdso/vgettimeofday.o:(.sframe) is being placed in '.sframe'
>> ld.lld: error: arch/arm64/kernel/vdso/vgetrandom.o:(.sframe) is being placed in '.sframe`
> 
> Previously when developing against the SFrame V2 format, I had fixed
> these warnings with the VDSO Makefile change currently in this series:
> 
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index 7dec05dd33b7..c60ef921956f 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -38,7 +38,7 @@ ccflags-y += -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
>  CC_FLAGS_REMOVE_VDSO := $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) \
>                         $(RANDSTRUCT_CFLAGS) $(KSTACK_ERASE_CFLAGS) \
>                         $(GCC_PLUGINS_CFLAGS) \
> -                       $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
> +                       $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) $(CC_FLAGS_SFRAME) \
>                         -Wmissing-prototypes -Wmissing-declarations
> 
>  CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables
> 
> But the warnings seem to have returned after upgrading my toolchain,
> possibly due to SFrame V3 or some confounding change in GCC. The
> --gsframe in the assembler should be set to 'no' by default, so
> perhaps GCC is providing an override --gsframe internally?

Could it be that your build of binutils was configured with
--enable-default-sframe, so that the GNU assembler defaults to generate
.sframe?  AFAIK this configure option was meant for distributors and
package maintainers.

You can check as follows whether --gsframe defaults to "no" or "yes":

$ as --help | grep -A1 gsframe
  --gsframe[={no|yes}]    whether to generate SFrame stack trace information
                          (default: no)
...

> 
>>
>> I applied this series hoping that fix it, but it doesn't, so far I
>> have this hack :
>> diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
>> index 52314be29191..53bdf757ee44 100644
>> --- a/arch/arm64/kernel/vdso/vdso.lds.S
>> +++ b/arch/arm64/kernel/vdso/vdso.lds.S
>> @@ -77,7 +77,7 @@ SECTIONS
>>         /DISCARD/       : {
>>                 *(.data .data.* .gnu.linkonce.d.* .sdata*)
>>                 *(.bss .sbss .dynbss .dynsbss)
>> -               *(.eh_frame .eh_frame_hdr)
>> +               *(.eh_frame .eh_frame_hdr .sframe)
>>         }
>>  }
>>
>> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
>> index 60c8c22fd3e4..759903acd6fc 100644
>> --- a/include/asm-generic/vmlinux.lds.h
>> +++ b/include/asm-generic/vmlinux.lds.h
>> @@ -1064,6 +1064,7 @@
>>         /* ld.bfd warns about .gnu.version* even when not emitted */    \
>>         *(.gnu.version*)                                                \
>>         *(__tracepoint_check)                                           \
>> +       *(.sframe)                                                      \
>>
>>  #define DISCARDS                                                       \
>>         /DISCARD/ : {                                                   \
> 
> Since this series only handles kernel stacktrace, I believe it's
> better to omit the .sframe section entirely in the case where only
> ARCH_SUPPORTS_UNWIND_KERNEL_SFRAME is enabled. I think this hack may
> work better for this purpose:
> 
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index c60ef921956f..29f802bfedb1 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -41,7 +41,7 @@ CC_FLAGS_REMOVE_VDSO := $(CC_FLAGS_FTRACE) -Os
> $(CC_FLAGS_SCS) \
>                         $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) $(CC_FLAGS_SFRAME) \
>                         -Wmissing-prototypes -Wmissing-declarations
> 
> -CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables
> +CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables
> -Wa,--gsframe=no
> 
>  CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_vgetrandom.o = $(CC_FLAGS_REMOVE_VDSO)
> 
> Though, I don't understand why it is necessary to provide --gsframe=no
> explicitly. If this approach seems ok to other folks/maintainers, I
> can fold this into my series.

Maybe build the VDSO separately with V=1 to see what assembler/compiler
options are effectively used (e.g. for vgettimeofday.o and vgetrandom.o
mentioned in the linker error message above)?

$ make mrproper
$ make defconfig
$ ./scripts/config --enable HAVE_UNWIND_KERNEL_SFRAME   # enable kernel sframe unwinder
$ make arch/arm64/kernel/vdso/ V=1

> 
> On the topic of SFrame for VDSO, Jens has a patch adding support for
> this as part of a series to support userspace SFrame unwinding for
> arm64:
> 
> https://lore.kernel.org/lkml/20260417150827.1183376-4-jremus@linux.ibm.com/

Any feedback is very welcome. :-)

Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


