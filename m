Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2569C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uX4XzmuF6ycAEwiMb6Zs36/2UF2kxg6CKDnOjgI5Pw=; b=YhcZhMOU/C36mNQn00Jcsy7zvN
	YKIv5+bJ5OvB5Tif/7JEW9IAIKlAFmyRDV3fNnhwKO6RvxR30CgFbMpCpXZKQeyOiGZyWI0DX48TK
	+qhQJLOkjpf+Xxty9HNP8HZZNYb9oIVe1JljzfAg6WMp4iz6m3tosv/+yMf6rzoKdWxh3e420BdRa
	v1PL8QamfFxB5P+CZSCWhPOOwnyMZraIwQwkorEant3pFjwQK0uOMY4UPkKGX2fXpvILT+Z6llz93
	S5F0ENB6zk5vnghQbav+/qtNAMwU/nstRjRDwxMmZ0FnGYcAztTRM9ERt4O8LUj9+1T1LE1WVTPKq
	Gjf134eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wol24-00000005soW-0Xi3;
	Tue, 28 Jul 2026 16:51:56 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wol21-00000005snr-1fg5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 16:51:54 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SElndC1380297;
	Tue, 28 Jul 2026 16:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=/uX4XzmuF6ycAEwiMb6Zs36/2UF2kx
	g6CKDnOjgI5Pw=; b=bg/H2/WVGhjbTS325vqBEKveSdEU/ITMou/IR3GC+XqH/O
	XtiBzHUN78TIBguqD3ECANYZbn0pupzLtOHWkoAJ8/GaAhl85+HI9ZF/pcncibg8
	tdsBE4u2UFfHAnBZpStPJuuOvzV+egrkL8fgmBaE6hxK/TBZRMRvM0DE4dbArUCr
	f97/BXfbV1VjnPVZTeukka7AZqEdmnILuZaoCM/gqczpgDpAG76SwZBFhgApLmZn
	4ycVvYEq7C5yYwZfCta/s2dPaZ1AbOl1LW1eUbWDSVKXg1K5fJxvSELnj+3fS6A8
	CYThLwUnwnLJcBYGvXprE31C5QMEi84HIUqZoMDQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fmuyj5tet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 16:51:34 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66SGfSAI000878;
	Tue, 28 Jul 2026 16:51:34 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fn8fk2v2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 16:51:33 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66SGpVSx30933388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jul 2026 16:51:32 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE28A20043;
	Tue, 28 Jul 2026 16:51:31 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66B3F2004B;
	Tue, 28 Jul 2026 16:51:31 +0000 (GMT)
Received: from osiris (unknown [9.87.141.62])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 28 Jul 2026 16:51:31 +0000 (GMT)
Date: Tue, 28 Jul 2026 18:51:29 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH 06/13] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <20260728165129.114152B00-hca@linux.ibm.com>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-7-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728123859.2911495-7-mark.rutland@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE0OSBTYWx0ZWRfX17xVmhMgf2Sl
 3OnA98DJHHAYQbMzGy6jLJBVFrkFjhy3b3sVTQzo5QLs+3LaBBYq/EDeSIvfy73TOrqGKSd3M1u
 bCzecrCrbL3GZQXdY20Xq7Gf8Pk363E=
X-Proofpoint-GUID: QjUzlJKJefnkao45My0Vnsi-I7O970OF
X-Proofpoint-ORIG-GUID: QjUzlJKJefnkao45My0Vnsi-I7O970OF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE0OSBTYWx0ZWRfX6BghG3GrWomX
 YffzGvvUn9DPN3hWEWctdNXod4xsvTukuVZcgHisJ9Vo7L9jB4I7rx3dQLIDWrIrUrY2pCKC+dv
 B5Gkie49HF9Wc6FvlBcWBCnuVEpSa/9mlVPC+Et7nHTMbHO5BCmXIrXjPgjky4qYDEiAfhkx3MQ
 /2xfavvs2udCefaO8xMwnd7yMeXvjqeMWYDv0ompjW1tgthacbQ0HtbnFKmkoCuyn00IZOwJ9lk
 XDZYlIh1Ko94cUEYm2P8ETw+lY9wVV4Fxly3nOmn0paGYBrBt99/o4/u40M2y6UlkRr6P5HVsog
 Rbdx3YBxOjBA5b/RoH+PIwUyEgnU7gXjNMVx69eIJIvti2RmxU/BPqFYh8aXk8AN2ZQaC/tVUKX
 m7ulCe33mQYUXmo58yoDo9MPgDujKMkXnHmnjXz7W+Uk9u1sSs9JAc3/xd5i9PmyyQQL/0fJUJ4
 6MFbC0xFcuIoojFkCrA==
X-Authority-Analysis: v=2.4 cv=X5Vi7mTe c=1 sm=1 tr=0 ts=6a68de16 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=LAnJ5zm-ejFWbYYqn8EA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_095153_558070_83B4945A 
X-CRM114-Status: GOOD (  18.61  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, maz@kernel.org, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, yang@os.amperecomputing.com, catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2026 at 01:38:52PM +0100, Mark Rutland wrote:
> This patch adds infrastructure for a scheme where this_cpu_*() ops do
> not need to transiently disable preemption, avoiding the negative
> impacts described above.
> 
> Each operation registers a critical section during which the exception
> return code will adjust the offset and addresses if preemption occurs
> mid-sequence. The critical section is registered/unregistered with a
> small prologue and epilogue which encodes three distinct GPRRs (<pcp>,
> <off>, <addr>) into a new thread_info::pcp_gprs field:
> 
>          // Prologue. Enable fixups for <off> and <addr>.
>          mrs	<tsk>, sp_el0
>          mov	<tmp>, #__VAL_PCPU_GPRS(<pcp>, <off>, <addr>)
>          strh	<tmp>, [<tsk>, #TSK_TI_PCPU_GPRS]
> 
>          // Generate cpu-specific address
>          mrs	<off>, TPIDR_ELx
>          add	<addr>, <pcp>, <off>
> 
>          // Perform access sequence
>          ldr	<val>, [<addr>]
> 
>          // Epilogue. Disable fixups
>          strh	wzr, [<tsk>, #TSK_TI_PCPU_GPRS]
> 
> If an exception is taken from within the critical section, the exception
> return code will adjust <off> to be the current CPU's offset, and will
> adjust <addr> to be (<pcp> + <off>). Distinct registers are used for
> <pcp>, <off>, and <addr>, so that the fixup can be applied safely at any
> point during the critical section.

This looks indeed better than that what I came up with for s390.

It works without comparing instruction pointers, also works out-of-the-box
with kprobes, and hence the fixup is much simpler. I guess I'll try to change
s390 to a similar mechanism and see what the result will look like. It will
use one more instruction to the current version, as far as I can tell now, but
the simplicity is probably worth it.

