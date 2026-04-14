Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC370F9D0C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkUG9qjjaISIJwix1JT1s6vqdVV0ZJRpqxMJmKUiFJY=; b=fk+n2LEWVXHcIHJ7qB+Var9NYg
	Owg1KCxdWGCVboA2inUsnK9BjqgQ3B3i8or/YERLkXqBp5qTOAFX2t4IRrlBM1iSlWpcDRzj+NAFK
	RBRYYZ3h60xi6pkiJZ+deS7QAS9Cj/hD2MAd9fKA7PbvHjX1HP7YSTIOWUIgzjxJ+IfiC1Z7/UmRn
	SzYmFLcjlKo3j9Ba8d6jHe9sxSZ0zXnw/e4nABGcUXJxKoK3NlKfhW4+ZsdsViB1/rmlqRSvDf8+5
	3zETtcPyepFkYnx0qAwsBB0nSkr4/h3Dbmg3rzIDtKg66GOCt1mXXm7/hFnMCGDD+82tfgl+Dnb3o
	eQ+Dxr5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCd7h-0000000HJTE-0puC;
	Tue, 14 Apr 2026 12:44:09 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCd7e-0000000HJSp-11vZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 12:44:07 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLI8h21804487;
	Tue, 14 Apr 2026 12:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=KkUG9q
	jjaISIJwix1JT1s6vqdVV0ZJRpqxMJmKUiFJY=; b=PC3OiC9H8rex2LIivHayYX
	AunNJsF/IJB+4T61p+DdJg0n9U9QASLXd5zz/W1bByv/0prck8GUhkdMkxdnrmUs
	MjUJ1rEvTHoc6QWrADC2vndDdEfy178VyNS2gzbn5AsOHgxwbnX5Y16ES3b6ZRBb
	GB7klPj3c+3Qg5uKvPmboXjUlXg5r9hF1kFKengTP40ATkvgnTyx+XBtkzGSNEm0
	Cot997Ce1FS0DVD7Zq/5s/Rr7l53rWMjWSHUIhIZ/285R7HMpG7ypkcA5Br2X8bA
	f1dY9JOhRJRHd6cJKbkIYszSJ4D3T7krCfpFWOIS3n1bX5qt+IGB37vU3vprQTlg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89k2kfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 12:43:49 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63EAfjDo025862;
	Tue, 14 Apr 2026 12:43:48 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dg2ujh9hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 12:43:48 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63EChj1h31523476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Apr 2026 12:43:45 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DD7E2004F;
	Tue, 14 Apr 2026 12:43:45 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCC3720043;
	Tue, 14 Apr 2026 12:43:44 +0000 (GMT)
Received: from [9.52.200.195] (unknown [9.52.200.195])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Apr 2026 12:43:44 +0000 (GMT)
Message-ID: <cc7f741c-41a0-4620-b5d5-3428aaa7648f@linux.ibm.com>
Date: Tue, 14 Apr 2026 14:43:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] arm64, unwind: build kernel with sframe V3 info
To: Dylan Hatch <dylanbhatch@google.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Weinan Liu <wnliu@google.com>, Will Deacon <will@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Indu Bhagat <indu.bhagat@oracle.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jiri Kosina <jikos@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
        Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
        joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
        linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
References: <20260406185000.1378082-1-dylanbhatch@google.com>
 <20260406185000.1378082-3-dylanbhatch@google.com>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <20260406185000.1378082-3-dylanbhatch@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: OPx_h5AuopgC_45bjgFOv4gHcb5E5zwh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDExNSBTYWx0ZWRfX3WPH3xc7kxM/
 FcirnhlN5fpxnpfzld+uB+ChYqY1o4SrwIhpdIT5T2p4MyO+feYhBpPACs75SIWi4YhgFJ6Nr0a
 Bhf2Y+IrtTAsFd45D3TRdhnyer8iCigFoR7WIKK9SEiZZ2cKOftXRBR8zF5u1pFnBvqNFquoESy
 xa7+UTKw28sFrOwvoMkdr4oQWfYfbUGmMP0pKiskgAv/GM7j8wfHL4pSoaK+MqzpG98PLohFvpg
 pBXwmxbAXlHMxRE5CdPmRVSmZ5/rB3Sf+zuAexZW2qr97x0wNm+j/9g0feMih2fmiCVg57dPEhg
 HkJG+8nlIUTsZZIsanK0hVwSRFU0gQWlbr758bOJ8AGBVFEZpsaycL6aWy61JFrzg+X6YQF9pgu
 5gWSiEUhfh/UzDY3fajfghPGWgZGxMHJIt7D0yBS50t9Cl5CSK10QscWwYP/n3ukn4DO9DzzUG1
 ameHCzssHqJi+6Y2LQw==
X-Proofpoint-ORIG-GUID: 7kljJTJRPmMKqwqgm7SFJX_006Z7TXz3
X-Authority-Analysis: v=2.4 cv=W60IkxWk c=1 sm=1 tr=0 ts=69de3686 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=yMhMjlubAAAA:8 a=VwQbUJbxAAAA:8 a=meVymXHHAAAA:8
 a=xJod4J6tRyryzautBPYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2JgSa4NbpEOStq-L5dxp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_054406_401386_39583447 
X-CRM114-Status: GOOD (  29.35  )
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

On 4/6/2026 8:49 PM, Dylan Hatch wrote:
> Build with -Wa,--gsframe-3 flags to generate a .sframe section. This
> will be used for in-kernel reliable stacktrace in cases where the frame
> pointer alone is insufficient.
> 
> Currently, the sframe format only supports arm64, x86_64 and s390x
> architectures.
> 
> Signed-off-by: Weinan Liu <wnliu@google.com>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> diff --git a/MAINTAINERS b/MAINTAINERS

> @@ -27561,6 +27561,7 @@ STACK UNWINDING
>  M:	Josh Poimboeuf <jpoimboe@kernel.org>
>  M:	Steven Rostedt <rostedt@goodmis.org>
>  S:	Maintained
> +F:	arch/*/include/asm/unwind_sframe.h
>  F:	include/linux/sframe.h
>  F:	include/linux/unwind*.h
>  F:	kernel/unwind/

Good catch!  Should we rather add the following in the series you are
basing on, as there are already arch-specific unwind_user.h and
unwind_user_sframe.h?

F:	arch/*/include/asm/unwind*.h

On the other hand I wonder whether the arch-specific headers should
remain maintained by the respective arch maintainers?  How is that
handled in general?

> diff --git a/arch/Kconfig b/arch/Kconfig

> @@ -520,6 +520,13 @@ config SFRAME_VALIDATION
>  
>  	  If unsure, say N.
>  
> +config ARCH_SUPPORTS_SFRAME_UNWINDER
> +	bool
> +	help
> +	  An architecture can select this if it  enables the sframe (Simple
> +	  Frame) unwinder for unwinding kernel stack traces. It uses unwind
> +	  table that is directly generatedby toolchain based on DWARF CFI information.

Nit: s/sframe/SFrame/

> +
>  config HAVE_PERF_REGS
>  	bool
>  	help

> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig

> @@ -112,6 +112,7 @@ config ARM64
>  	select ARCH_SUPPORTS_SCHED_SMT
>  	select ARCH_SUPPORTS_SCHED_CLUSTER
>  	select ARCH_SUPPORTS_SCHED_MC
> +	select ARCH_SUPPORTS_SFRAME_UNWINDER
>  	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>  	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
>  	select ARCH_WANT_DEFAULT_BPF_JIT

> diff --git a/arch/arm64/Kconfig.debug b/arch/arm64/Kconfig.debug

> @@ -20,4 +20,17 @@ config ARM64_RELOC_TEST
>  	depends on m
>  	tristate "Relocation testing module"
>  
> +config SFRAME_UNWINDER

Why do you introduce this for arm64 (and debug) only?  If s390 were to
add support (as replacement for s390 backchain), this would have to be
moved or duplicated.  It would not suffice to enable
ARCH_SUPPORTS_SFRAME_UNWINDER to also enable SFRAME_UNWINDER.

As mentioned in my feedback on the previous patch in this series:
Would it make sense to align the naming to the existing 
HAVE_UNWIND_USER_SFRAME, for instance:

  HAVE_UNWIND_KERNEL_SFRAME

> +	bool "Sframe unwinder"
> +	depends on AS_SFRAME3
> +	depends on 64BIT
> +	depends on ARCH_SUPPORTS_SFRAME_UNWINDER
> +	select SFRAME_LOOKUP
> +	help
> +	  This option enables the sframe (Simple Frame) unwinder for unwinding
> +	  kernel stack traces. It uses unwind table that is directly generated
> +	  by toolchain based on DWARF CFI information. In, practice this can
> +	  provide more reliable stacktrace results than unwinding with frame
> +	  pointers alone.

Nit: s/sframe/SFrame/

> +
>  source "drivers/hwtracing/coresight/Kconfig"

You are introducing two new Kconfig options (SFRAME_UNWINDER and
ARCH_SUPPORTS_SFRAME_UNWINDER).  I wonder whether they could somehow be
combined into a single new option.  Although I am not sure how an option
can be both selectable and depending at the same time, so that the ARM64
config could select it, but it would also depend on the above.

> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h

> @@ -491,6 +491,8 @@
>  		*(.rodata1)						\
>  	}								\
>  									\
> +	SFRAME								\
> +									\
>  	/* PCI quirks */						\
>  	.pci_fixup        : AT(ADDR(.pci_fixup) - LOAD_OFFSET) {	\
>  		BOUNDED_SECTION_PRE_LABEL(.pci_fixup_early,  _pci_fixups_early,  __start, __end) \
> @@ -911,6 +913,19 @@
>  #define TRACEDATA
>  #endif
>  
> +#ifdef CONFIG_SFRAME_UNWINDER
> +#define SFRAME							\
> +	/* sframe */						\
> +	.sframe : AT(ADDR(.sframe) - LOAD_OFFSET) {		\
> +		__start_sframe_header = .;			\

		__start_sframe[_section] = .;

> +		KEEP(*(.sframe))				\
> +		KEEP(*(.init.sframe))				\
> +		__stop_sframe_header = .;			\

		__stop_sframe[_section] = .;

Unless I am missing something both are not the start/stop of the .sframe
header (in the .sframe section) but the .sframe section itself (see also
your subsequent "[PATCH v3 4/8] sframe: Provide PC lookup for vmlinux
.sframe section." where you assign both to kernel_sfsec.sframe_start
and kernel_sfsec.sframe_end.

> +	}
> +#else
> +#define SFRAME
> +#endif
> +
>  #ifdef CONFIG_PRINTK_INDEX
>  #define PRINTK_INDEX							\
>  	.printk_index : AT(ADDR(.printk_index) - LOAD_OFFSET) {		\

Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


