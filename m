Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D29AF8D762
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 16:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOBA/ecx2eCKMkJHXKtcQXKpMOvkUxYywK3jmjjKQPk=; b=udG2nfXr3pOB0r6wFY66XihmCb
	8DM9oYSamwjUYDEYlD+mhNiZpzaOGE2yvVCcg3ZCTlwU46yFcqr8nBsdg8ExQo4XhbIEfldDAa3JB
	BjikMchsai9uzIP/dKWZq0cdqxsRQEeZ9PYMrzzqJMudKs3NPWH1v+9Mkjz93eH/dr6fyabJVfmoR
	ATay2ez0hJ16ihDDzOykh9LHvbAY9Z2t9GBE/rNDoOaerRo8H6/6RkiwVZkBMS0sf8ixS6tzKLnzj
	ylld/SetZxvM0do5rHZyGcm/RRovC4UYv9hN0eO7gSzyHUJywIchP4u1IxaPlO1OQWBuNrsD3ax4y
	ClKvibWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDPur-00000002gKz-14KL;
	Thu, 16 Apr 2026 16:50:09 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDPuo-00000002gKb-3MjE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 16:50:08 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6ixHV1859973;
	Thu, 16 Apr 2026 16:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fOBA/e
	cx2eCKMkJHXKtcQXKpMOvkUxYywK3jmjjKQPk=; b=d+M9Rgz888B/XQZxitoFm7
	jNnyYJ+3TLoyN2P3boVOVxyyphFer1CtX3USVpoMPe8FNkhNDbu+Csq4p6OFJNvx
	DuA4o1ICupxpDhmy86JqM6iwGkrTyHAPibdUwQJYPRizVP6fp1lc/Gv81B6HN9a8
	ImsHnJIKKvN54AhaTSXNOlNpvV4bn3XefW0QRzPV5YBm2ORmTUeoxKQRykiReH7h
	1BtWsNdS4MUJgpq+ih/S+VG1oGGRp7ZWSSbdQaiWK9EwkAk0fGbW2SyB1+V6281q
	zQl/zjyucIF5a79GcqH6NP7rcV6SWkLLCBhcIjgkNrLX6J3vqMPbvYPPF4xQra8Q
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89pnkx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 16:49:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63GFg0Xs031138;
	Thu, 16 Apr 2026 16:49:34 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dg10yku3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 16:49:34 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63GGnWjB14221730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Apr 2026 16:49:32 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B1C220043;
	Thu, 16 Apr 2026 16:49:32 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D850B20040;
	Thu, 16 Apr 2026 16:49:30 +0000 (GMT)
Received: from [9.111.199.83] (unknown [9.111.199.83])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Apr 2026 16:49:30 +0000 (GMT)
Message-ID: <72b893e7-e923-440f-8d24-776c7962ac71@linux.ibm.com>
Date: Thu, 16 Apr 2026 18:49:28 +0200
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
        Heiko Carstens <hca@linux.ibm.com>
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
X-Proofpoint-GUID: y2x_ftf0F9XmeCuxF9mPez9_GjRH2WPg
X-Proofpoint-ORIG-GUID: Lvt1QMgcEijiTBznQ7XlYmMVD_g2jV4H
X-Authority-Analysis: v=2.4 cv=WbE8rUhX c=1 sm=1 tr=0 ts=69e1131f cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=lKmbvdJDYgI8s-_BAhYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE2MCBTYWx0ZWRfXznP5/Iy7wkBa
 s3w8qIvqQr8Ist0jjIeQ87JSjB4Sxqf7EdQRB3hXxTLrS82DAMq+jV4p73bLXRGtEqAMvBc9SUI
 776yNDC/n05C1aW58vI7K/Ind9ZY+bBsan+IkbBENYYp4DOIFvPXFs7s4PWDGhRUETCbLj53c1P
 TnugmDuPKdnTLJrGc6fmbeavn41drm+5Qw4z3OdRkmPkAoWudq07/uffXIklHT9dLrir3QvXZ3Y
 dw/CnJhktOP70d/zmPFLxS702hVzoa8LN9uAhjrv2Yx3zIsrQ/GXa/vBLflz9ws5EHQxxu2czMr
 aGpAqvbkjq6q0j0zFp1uCZExdUq8u4dqft/QeKzDg8C3XLOiyz1gQrCB0Rha91k20RbYK4aimjW
 WnBcYbOB664rpAPm7CdaZbCnUTGZaQSbPluE8KT83+zbGK4ZXIsW2fGAEA4H6M7T7XqGPXc9Ql3
 NfNPpyn0SQLerakHKdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_095006_974342_C496C051 
X-CRM114-Status: GOOD (  18.51  )
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
> 
> Signed-off-by: Weinan Liu <wnliu@google.com>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> ---
>  arch/arm64/kernel/entry.S | 10 ++++++++++
>  1 file changed, 10 insertions(+)

The added CFI directives somehow cause .eh_frame (instead of
.debug_frame) to be generated in addition to .sframe.  This causes the
following warning when linking vmlinux (.tmp_vmlinux1, .tmp_vmlinux2,
and vmlinux.unstripped):

  LD      vmlinux.unstripped
aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `arch/arm64/kernel/entry.o' being placed in section `.eh_frame'

I don't think this can be controlled using compiler options
-fno-asynchronous-unwind-tables -fno-unwind-tables, as entry.S is
only preprocessed and then fed into the assembler.

The following at the top of entry.S would resolve the issue:

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
@@ -30,6 +30,12 @@
 #include <asm/asm-uaccess.h>
 #include <asm/unistd.h>

+/*
+ * Do not generate .eh_frame.  Only generate .debug_frame and optionally
+ * .sframe (via assembler option --gsframe[-N]).
+ */
+	.cfi_sections .debug_frame
+
	.macro	clear_gp_regs
	.irp	n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
	mov	x\n, xzr

Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


