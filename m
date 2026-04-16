Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3251CF8D74B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 14:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bZFO/ATD56HUcWaef/684HTeBS057i0wylAFAirXVc=; b=Sr6oSTvX74egbFkgGuDZPD/ypb
	Nvah7nH4xf7dS8+5PjUodwqHfYTSjkK/qUQsPhYwSqUjk+SFUEKmb2A4z4M6PFlTm0wsoAi8fGBzx
	UmQ1/dTc43+5zQDA68nWDuIqqzqZgNn/xNn3NkTNLHmppOrI+oPvt0/w5DBGXzCn6Fb9JOWdCZ5PK
	5m2/DB9Uka2BZWHV4jOkwsPIAFcjFeBZpmCVoAEeuDabVwbEmrqI6gGWvMk7kLOS3HpbNteMV/x5y
	YLDeUMty9mxoexylmQ8TVKH1+iQsPMcqaZ+opcJpztki3psyn5Ku2+ts+8bD3q4uvIBSa/0bE8kc+
	BX5LavQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDNQ7-00000002Xwc-1pnx;
	Thu, 16 Apr 2026 14:10:15 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDNQ5-00000002XwI-0S0u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 14:10:14 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G9n7TV1833223;
	Thu, 16 Apr 2026 14:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5bZFO/
	ATD56HUcWaef/684HTeBS057i0wylAFAirXVc=; b=RgjVHinU04ToUnjOesbBne
	lYE3sPOTg06LlBCJNZqTr/FnchZKKavVwKUTG2G3LnCSL0nz2WE4BOUEcO3gBAXB
	vWiHN/Tq0djeztB1M4eyGdV7j0I9q7F6tw0WRu4nKFGzMqRgNvynkSimtV3ATiFc
	PNpj1/iA4SPgmNW0Y2e5dFBkSHKWGNgO1QnxkNSvbqMJtUA8e+TXmYMyd6+HUgvR
	g3AJper26ANO0klMGM9Qfy6Q8IefdhnMxG3Z7xXgXZlPRIzURfMuEEs29vY/eSLU
	cmJSYzEjIrov7p9Bx3hyiMh6qDZPQwb+YvtSGXtkKrxYpDXCasGRK7jKcMohbYjQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89rnu06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 14:09:56 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63GAqLum015164;
	Thu, 16 Apr 2026 14:09:55 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dg0msuceh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 14:09:55 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63GE9pV550921886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Apr 2026 14:09:51 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88B1B2004B;
	Thu, 16 Apr 2026 14:09:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A95020040;
	Thu, 16 Apr 2026 14:09:50 +0000 (GMT)
Received: from [9.111.199.83] (unknown [9.111.199.83])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Apr 2026 14:09:50 +0000 (GMT)
Message-ID: <2891ad39-20c2-4c21-8a74-4a09032421e2@linux.ibm.com>
Date: Thu, 16 Apr 2026 16:09:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] arm64: entry: add unwind info for various kernel
 entries
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
        Heiko Carstens <hca@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>
References: <20260406185000.1378082-1-dylanbhatch@google.com>
 <20260406185000.1378082-4-dylanbhatch@google.com>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <20260406185000.1378082-4-dylanbhatch@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzMiBTYWx0ZWRfX7wUwuGzmgzsP
 /KEso6kqsNQqn+I8+hB9aNbbXGrrh/Nv9K9VjMnSfROHSDUWFPIwqvZfeHbtkl0zJVBeAwBuVvA
 15doAB5Y4qG+chKjxZP91ej3OVavcK/0A97+c+SmKDMK8n0VYbw+fIWA0i8QqKVMcTitXOVlFoa
 d/zp0Ws54vAyjl674t9SwDjw5pkTyGItFP84ZPjyaKe2nABPqM/aHc4H15YhKO2QWQ8iwdw2mBO
 AvoyDcx/bf4TGoyFpjHyU0wo2tQSz8MkwEDXG6naCqbQ+dmCawB9KTgGPdMPhxO4pFuOS23CJ25
 B7eZbi77c42hXgeOPmQKlfcWNH0RdonWBTda3FmQv+/O2W/ad9ldoi7Z268SIwq5TSaKzdhcefA
 4DSAV48asEkdp0LF83SYvM9yABibP0opNgS4RQstmE/4KTCMDqWYVVHQurFxAsFF+ttisSaXSXP
 Lf/PV1MNYJe3CryMi7A==
X-Proofpoint-ORIG-GUID: 4Gha3kbwBkiKeqQfF-mKgAuzYTE4yDcp
X-Proofpoint-GUID: Y3Vo8Hhn1UhIuSvCotDIhk7Si54VAtsB
X-Authority-Analysis: v=2.4 cv=fYidDUQF c=1 sm=1 tr=0 ts=69e0edb4 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=bLnNlr2ELYzO25Cx3yEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_071013_153697_0CD4A10C 
X-CRM114-Status: GOOD (  20.82  )
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

Hello Dylan and Weinan!

On 4/6/2026 8:49 PM, Dylan Hatch wrote:
> From: Weinan Liu <wnliu@google.com>
> 
> DWARF CFI (Call Frame Information) specifies how to recover the return
> address and callee-saved registers at each PC in a given function.
> Compilers are able to generate the CFI annotations when they compile
> the code to assembly language. For handcrafted assembly, we need to
> annotate them by hand.
> 
> Annotate CFI unwind info for assembly for interrupt and exception
> handlers.

It took me a while to figure, why CFI annotations are uncommonly only
added to selected instruction (ranges) and not the whole functions.  I
guess you only want to enable stacktracing using SFrame through
el1*_64_*() (from el1*_64_*_handler()) and call_on_irq_stack(), that is
why the added CFI annotations start after the bl/blr instructions, so
that whenever an unwound return address points after those bl/blr
SFrame can recover the stack pointer, frame pointer, and return address.

Wouldn't that be worth to be documented in the commit message?

> Signed-off-by: Weinan Liu <wnliu@google.com>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S

> @@ -575,7 +575,12 @@ SYM_CODE_START_LOCAL(el\el\ht\()_\regsize\()_\label)
>  	.if \el == 0
>  	b	ret_to_user
>  	.else

	/* Minimal DWARF CFI for unwinding across call above. */

> +	.cfi_startproc
> +	.cfi_def_cfa_offset PT_REGS_SIZE
> +	.cfi_offset 29, S_FP - PT_REGS_SIZE
> +	.cfi_offset 30, S_LR - PT_REGS_SIZE
>  	b	ret_to_kernel
> +	.cfi_endproc
>  	.endif
>  SYM_CODE_END(el\el\ht\()_\regsize\()_\label)
>  	.endm

> @@ -889,6 +894,10 @@ SYM_FUNC_START(call_on_irq_stack)
>  	add	sp, x16, #IRQ_STACK_SIZE
>  	restore_irq x9
>  	blr	x1

	/* Minimal DWARF CFI for unwinding across indirect call above. */

> +	.cfi_startproc
> +	.cfi_def_cfa 29, 16
> +	.cfi_offset 29, -16
> +	.cfi_offset 30, -8
>  
>  	save_and_disable_daif x9
>  	/*
> @@ -900,6 +909,7 @@ SYM_FUNC_START(call_on_irq_stack)
>  	scs_load_current
>  	restore_irq x9
>  	ret
> +	.cfi_endproc
>  SYM_FUNC_END(call_on_irq_stack)
>  NOKPROBE(call_on_irq_stack)

While above minimal DWARF CFI works for your use case, the following
minor issue should probably be better corrected (excerpt from
call_on_irq_stack with your patch applied):

	blr	x1
	.cfi_startproc
	.cfi_def_cfa 29, 16   <-- CFA is defined as FP + 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8

	save_and_disable_daif x9
	/*
	 * Restore the SP from the FP, and restore the FP and LR from the frame
	 * record.
	 */
	mov	sp, x29
	ldp	x29, x30, [sp], #16   <-- FP is restored, so that the CFA definition is no longer valid
[CORRECTION]
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa 31, 0
[/CORRECTION]
	scs_load_current
	restore_irq x9
	ret
	.cfi_endproc
SYM_FUNC_END(call_on_irq_stack)


Would it alternatively make sense to add complete DWARF CFI annotations
to call_on_irq_stack()?  I think the following would do:

SYM_FUNC_START(call_on_irq_stack)
	.cfi_startproc
...
	/* Create a frame record to save our LR and SP (implicit in FP) */
	stp	x29, x30, [sp, #-16]!
	mov	x29, sp
	.cfi_def_cfa 29, 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
...
	/*
	 * Restore the SP from the FP, and restore the FP and LR from the frame
	 * record.
	 */
	mov	sp, x29
	ldp	x29, x30, [sp], #16
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa 31, 0
...
	ret
	.cfi_endproc
SYM_FUNC_END(call_on_irq_stack)

Thanks and regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


