Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22623F588C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tCcUWC6qU6uPWXsn+OVIrVIIYDS6Dmo/IclqbbHj8k=; b=tNeAww9nEcRZKwghO+G87W2dav
	Hnw8oqr3anPQl+/fK9lPOmnaD7VX+2YOctNxfcyAHhHz9uBBZlyNG4EMcubKzAQddAQW8DfHIZOJt
	KAD6pbB+8KwzEmRKrmGkGOEsnp2EgTNwSt7Tn0zP2MckObVU7MHswhSdugMeidJEMYOsX6f92nvTc
	YgMLADpmw2VGjyIvL1fHyk3pLz2elOkaqFQMp8/+oHSHAg3Fhp0FTplTxXUrL4+KpL3zk/ihqEREr
	CT0gy7jMoCAKrcyJ814IYudT5/K0PhwhSOU9wiGyfV3YYvOyngJ4Ur22tu142j+4xckI3K1fUHdDz
	fFXyF0aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnzR-00000006tzV-2c9a;
	Mon, 20 Apr 2026 12:44:37 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnzN-00000006tz8-2F8y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:44:36 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JLe1or3165898;
	Mon, 20 Apr 2026 12:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1tCcUW
	C6qU6uPWXsn+OVIrVIIYDS6Dmo/IclqbbHj8k=; b=bhyxUwi3mMc4MAzmrWfdc7
	kWuuGTKGxH8sxb5mnYZ+KNzbiyaDO8UiZdESopktQYgaF6DWoYD0LEgqUcULtLM+
	SAhPMTTWv0jNwwG7/yRM9MK3ypa21c7uYmdyZDo7CeiXOYildXIudifhhywP8pk0
	WoBYI0uuJaaFKf6THPSsp+FbUUQxhieI7WH1YBHER+JLSi2BbjtsKvTYHBf4rcok
	xUptjBcHZ9kcn2rO1P2rDgAIWT9KHiNglLKuWEWd2UpIEvI5IRx7YmtHBUJepVZY
	JdiJk+nedzFPE6M9s3K+xZW1Myt+fYf59SKtm2A0H8uZD71VostajtU+EyaAebwQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dm2k4ys6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Apr 2026 12:44:17 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63KCZX6i019696;
	Mon, 20 Apr 2026 12:44:16 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dmm9pvvym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Apr 2026 12:44:16 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63KCiEdD37093846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Apr 2026 12:44:14 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADF312004B;
	Mon, 20 Apr 2026 12:44:14 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F124920049;
	Mon, 20 Apr 2026 12:44:12 +0000 (GMT)
Received: from [9.111.165.155] (unknown [9.111.165.155])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Apr 2026 12:44:12 +0000 (GMT)
Message-ID: <b526aeae-4243-4dca-907c-1f90b57e9cb7@linux.ibm.com>
Date: Mon, 20 Apr 2026 14:44:12 +0200
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
        Heiko Carstens <hca@linux.ibm.com>
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
X-Proofpoint-GUID: sYb2gOO-Kty_hcHJ4lggRM0jGT1GRwgl
X-Proofpoint-ORIG-GUID: N0mT8Q_-HvWlkK3pou6GvGjoGn0eYW_j
X-Authority-Analysis: v=2.4 cv=VP7tWdPX c=1 sm=1 tr=0 ts=69e61fa1 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=yMhMjlubAAAA:8 a=ArCyXBQMZrod6OsQSOkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMSBTYWx0ZWRfX70pvcDTs/5Fc
 Z4vrNYCmOf8wb89We6H2dW95tzwZuREzf5DAE7Cc1ReDjcbpNu7Y1Aisap+RYg0pW/wfOcc1ezg
 AKypvWmbIoigyi81EtHGrMPZYB8po7uuSVWZnVR4gjEXjVcYeP7IX2+h949i/23Ji7TsrDWhoNW
 3Lra4fs3xUqvYvN+CJU7TYhn+fNPw0wczl9EQU+3om+5X5CZyrE2NceAUyZQw6TGRCAABZi6Eyd
 lvLJcdvNGErwYSzfGTGa+lF+UaEFZ0nXphNSkmZglegaZmN5/XfJtSrKakT+SdSjW+ShSreuCzQ
 9IxyMusxMfpapu6jjfe4v5qCIOICJZjtuUtOXhJKr+S0lFmeXX4a3aUK/NHKLZMAVndxa5ibbuS
 q0GmAXlwPvSJFStVr8czU1mbaj73r0G4h+t/zgVTcx0XSgdEWmF6peSv3Pt0+/Df4AS9wXUqFvd
 MZlHVt5uuzCBpgcgRLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_054435_729043_83402C99 
X-CRM114-Status: GOOD (  14.60  )
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

> diff --git a/arch/arm64/include/asm/unwind_sframe.h b/arch/arm64/include/asm/unwind_sframe.h

> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_ARM64_UNWIND_SFRAME_H
> +#define _ASM_ARM64_UNWIND_SFRAME_H
> +
> +#ifdef CONFIG_ARM64

Nit: If I am not mistaken above guard for CONFIG_ARM64 is superfluous,
as this resides in arch/arm64/ anyway.

x86 needs to guard with CONFIG_X86_64, as only x86 64-bit supports
SFrame (and not x86 32-bit nor x86 X32).

> +
> +#define SFRAME_REG_SP	31
> +#define SFRAME_REG_FP	29
> +
> +#endif
> +
> +#endif /* _ASM_ARM64_UNWIND_SFRAME_H */
Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


