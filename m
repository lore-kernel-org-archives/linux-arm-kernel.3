Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8994F9EDD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 14:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBprrZ6eKIHk++rrBYzLzxOMt1w4ppVybUIbzLKqRoo=; b=zRkg2yRW3zYspkITnHGqio6eeP
	1Y40Ly/buB5zEEnf0cIyr/ySM0GELhcfCCeeRyuLb7o5/xTzpM3vsI3foHtYtMsyiEG85TRwjUXSG
	W9tU2rF3xwYnp6xW322TsNT5l95rGBRRjTANqGEl2Rw0ZAeQBsNd9gFUpQoCPhfixyQVsfiAkr3IF
	VCiBldlb1HzlVCAUZgmL8aYAW3f7kMGwPxRpYNxckNLheAiwEbxSIr6jtnarMPhMxVq6DLMXxXI3C
	kGdcA6U86NRP/BS14NcR1+2poxKrmqpxfoz30BAoJ0rlCy21GcwYisXPiDZ5w3apHCXM0yFnyZtHT
	UcOlKw1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYJN-0000000ALJq-0RQf;
	Wed, 22 Apr 2026 14:12:17 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYJE-0000000ALI8-3jFa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 14:12:15 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MArv2H680898;
	Wed, 22 Apr 2026 14:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=iBprrZ
	6eKIHk++rrBYzLzxOMt1w4ppVybUIbzLKqRoo=; b=M+L8bbl5WscNzV3a9zCWVt
	hCcckUkQEtLzdTxX0Fyy39b3b4K4+jy7E/2gPpKFtfsNfFt9nyhADBc49O7edGDY
	1CcHbGAG2fs8BfXGvu8a1RyEoyMRsXGcqFvqmU07qy4RdjqY0KTAy8yhfIof2r1o
	4P85GAQOWT4EwvWCeYit1IfcfP/zRnF4AIZUtIy060p4QLvUL0ZV3IZw7ULqzccm
	jJIred3iuBUOdxag93t7ggWNXfL+Pi5wGj7f94/29J3SHH4t5YYKhaxvBdxPbhfX
	i54PRoLYCbJbhECvV7NPCjXKE9kNX1N78eqII3Go6ItwCFXAEDeK7cEth1d9gb/A
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dpeu7kk54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Apr 2026 14:11:17 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63ME5VF6005991;
	Wed, 22 Apr 2026 14:11:16 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dpjky2hc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Apr 2026 14:11:16 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63MEBE3n40042832
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Apr 2026 14:11:14 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BF8120043;
	Wed, 22 Apr 2026 14:11:14 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3870120040;
	Wed, 22 Apr 2026 14:11:14 +0000 (GMT)
Received: from [9.52.200.195] (unknown [9.52.200.195])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Apr 2026 14:11:14 +0000 (GMT)
Message-ID: <73e99161-c246-467d-96c2-46911ffc0bff@linux.ibm.com>
Date: Wed, 22 Apr 2026 16:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] sframe: Introduce in-kernel SFRAME_VALIDATION
To: Dylan Hatch <dylanbhatch@google.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Weinan Liu <wnliu@google.com>, Will Deacon <will@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Indu Bhagat <ibhagatgnu@gmail.com>,
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
        Randy Dunlap <rdunlap@infradead.org>,
        Heiko Carstens <hca@linux.ibm.com>
References: <20260421225200.1198447-1-dylanbhatch@google.com>
 <20260421225200.1198447-8-dylanbhatch@google.com>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <20260421225200.1198447-8-dylanbhatch@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: _DoY1WMJM1i2En8WsHPlxJrHiE4hUwJb
X-Authority-Analysis: v=2.4 cv=Ksp9H2WN c=1 sm=1 tr=0 ts=69e8d705 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=LFt20mCCc4CE-LtB3JUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: _cCGz1_An0ZbsNzmrmsx3c9mP0RHxaLs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEzMyBTYWx0ZWRfX9VUwGJuKKCGO
 3sUXKccE06d4FjNT8OI3/VtERQCx5iEk/lZ9QpvrEAS+Mi05cxDG6jm+2acwz+TvIZOB1iVvGvX
 VbcHqlx1Sad3Dd9V4ffOEVv9qmtrVi5kh6Si+B1prPGlqoTDOzZHs3MfJLAwMp8vCuzxp1Xqn0F
 v224CtXwAlPNYtzflIyN9g8aFsxOTOfpSMQT7porCm7n3AShgx0B171k9FsEC42XbEsEVN5j5JZ
 FgRz4mpEaP/rgJVVIWUj7AecGD/gRxNZhf6cDyNcrkiisoivrYMFk6/BcekfXJgeQRpZGh3xPEK
 goMiTdgg7qORKINe7h7Vnlo+5/22hYwt0nclE84TFeqh2GiecbEMkHLfMPYU/ESEO9oPbPmNMAs
 gO2QlwkwuORCALStWcNjeHGg4bP5YRFo/zzt8HN9CCdld83FwJTiOk0j+C/QUA+HXOEz8oYXme+
 9PcZgNB7lkSpN+48Ghw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_071209_047588_E417DC49 
X-CRM114-Status: GOOD (  21.90  )
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

On 4/22/2026 12:51 AM, Dylan Hatch wrote:
> Generalize the __safe* helpers to support a non-user-access code path.
> 
> This requires arch-specific function address validation. This is because
> arm64 vmlinux has an .rodata.text section which lies outside the bounds
> of the normal .text. It contains code that is never executed by the
> kernel mapping, but for which the toolchain nonetheless generates sframe
> data, and needs to be considered valid for a PC lookup.
> 
> This arch-specific address validation logic is only necessary to support
> SFRAME_VALIDATION for the vmlinux .sframe, since these .rodata.text
> functions would never be encountered during normal unwinding.
> 
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> Suggested-by: Jens Remus <jremus@linux.ibm.com>

With the minor nit below fixed:

Reviewed-by: Jens Remus <jremus@linux.ibm.com>

> ---
>  arch/Kconfig                           |  2 +-
>  arch/arm64/include/asm/sections.h      |  1 +
>  arch/arm64/include/asm/unwind_sframe.h | 21 +++++++++++++++++++++
>  arch/arm64/kernel/vmlinux.lds.S        |  2 ++
>  include/linux/sframe.h                 |  2 ++
>  kernel/unwind/sframe.c                 | 25 +++++++++++++++++++++++--
>  6 files changed, 50 insertions(+), 3 deletions(-)

> diff --git a/arch/Kconfig b/arch/Kconfig
> @@ -503,7 +503,7 @@ config HAVE_UNWIND_USER_SFRAME
>  
>  config SFRAME_VALIDATION
>  	bool "Enable .sframe section debugging"
> -	depends on HAVE_UNWIND_USER_SFRAME
> +	depends on SFRAME_LOOKUP

	depends on UNWIND_SFRAME__LOOKUP

>  	depends on DYNAMIC_DEBUG
>  	help
>  	  When adding an .sframe section for a task, validate the entire

Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


