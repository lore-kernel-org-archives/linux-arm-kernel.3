Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3728105F787
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gkf4rOT4CFaHfJxJ8D6AnxUn1V1vbCNLe4eo89TKRVk=; b=tyA+1I05M9qE4OD2Z01z2DZaBD
	JcXu49MIXZi3AumllKB5h8UIPZglvf+l7BZG3t6YBIk4DdJ/Gvinq89IsOKB5R+WDdpsdwO/l1J3P
	z11Qs9k4641br7MS6/jD2qiCsoiPksYYoId/Xi+Uvuq/o3qmZ4JIarIzsJkByHuS0jCR7GsX3KOhq
	t/EXkYb4JqElIP2t5ey9vGLAjc/sXpJZTmpt2yJGPJtylnGqel/81EljW9ZgGgiHHH8SLk2J8leyy
	28F7hc6l+E/gJSluOTMWj5mIXFezqPkDjQoMSc9TjkDGUOsz1ErAMjyh8OAoyvgwFtJZf+pBJKuwM
	213bsgTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zUC-0000000HUbe-0rig;
	Fri, 13 Mar 2026 10:11:16 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zU7-0000000HUb7-2WKU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:11:12 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CMOXgx1007198;
	Fri, 13 Mar 2026 10:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Gkf4rOT4CFaHfJxJ8D6AnxUn1V1vbC
	NLe4eo89TKRVk=; b=M3PDeF0gXGFqD48QC2BpkNs1MMLp/DRkX8ixVJrAeH+Y81
	W5LBdFxIMnOijR8IPo+U4OfZ3RJzu81EufLpCnV2umrJMy4W4Xznce+EcTi8oBFt
	MK0TkwABzoihI34EBFwcHOUyC0v6nsSk8OBVH5yTgpXrMJYZtePhsEZa3y/b2f6H
	qNvNaaTu439Owg9EOALvJ69qMo/2kORyEyuS+LSFflGOK8CcemELgnkhF4KlyQ8j
	b13WVQdZlyWMU1VZMA+ZxByLSS5T5uerSNEy/1fyW7N/PlM0ucUP61Qv/xnFqSyt
	O29mnQBIbaUXaxOi7al5ZNdBxiaBitAA4nNaYrYA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cuh91q6mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 10:10:32 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62D5UuVS008897;
	Fri, 13 Mar 2026 10:10:30 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cuha766vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 10:10:30 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62DAAQ1Q53608886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Mar 2026 10:10:26 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD84F2006C;
	Fri, 13 Mar 2026 10:10:26 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3578C2004B;
	Fri, 13 Mar 2026 10:10:24 +0000 (GMT)
Received: from osiris (unknown [9.111.5.66])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 13 Mar 2026 10:10:24 +0000 (GMT)
Date: Fri, 13 Mar 2026 11:10:22 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v13 11/12] arm64: Use generic TIF bits for common thread
 flags
Message-ID: <20260313101022.13729C56-hca@linux.ibm.com>
References: <20260313094738.3985794-1-ruanjinjie@huawei.com>
 <20260313094738.3985794-12-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313094738.3985794-12-ruanjinjie@huawei.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: BCADzvpbkvwpu6qt2LtTmNdZt-NTgdEB
X-Authority-Analysis: v=2.4 cv=E6/AZKdl c=1 sm=1 tr=0 ts=69b3e299 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=i0EeH86SAAAA:8
 a=VnNF1IyMAAAA:8 a=yb_icw7U1PEggasoSeYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3OCBTYWx0ZWRfX204njEZ7La+7
 lopLeqJAvBsdIgcWc7JF7JKlYJi59Je0zliAQV0GcuRR3gN8/wyQtSb5D/ATDtU4sWZjTKpvV/l
 AcZwh/tIq2vjmMDaZTwOouNhNy9OmALovQnv4y/8OVc1k10fK7hCIWjW71P46WpjhsNMvxnoJX8
 ELxU/zlYAj8DS3iG5RHANoiskwvgvoNssJ4Zj2rUgNy64CX7p26+epoqWE7fBG/jpSSPXrNkvE8
 N0LPr9ll7usEul4bSWf48Mko9DwYOBWC2IDjO6WjkJfnM28Dk2cKDO9UE8iC42p2RfBae+FZt88
 6fbwgNuzR84w8Qig2mu4VEY+10CxhBs4B+MJoPOm9wRbPIl6f6lSoJP8qpvKfmEKOhebB6UI/Za
 BnTSAx5nmkxfhFIeEF605P9Wn/XMUWyROrvIxXzdbXmodCskURFIexm+D3qtOVKFbs/laAiG614
 18vCvat/UhZ9R8rwL4g==
X-Proofpoint-ORIG-GUID: jxPi3LKPbFj4QvC6Ms7r0r-sH3yGugOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1011 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_031111_647170_C7035C7C 
X-CRM114-Status: GOOD (  15.02  )
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
Cc: mark.rutland@arm.com, schuster.simon@siemens-energy.com, andreas@gaisler.com, kees@kernel.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, ldv@strace.io, song@kernel.org, linux-kselftest@vger.kernel.org, hpa@zytor.com, agordeev@linux.ibm.com, shuah@kernel.org, jremus@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, gor@linux.ibm.com, will@kernel.org, deller@gmx.de, x86@kernel.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, borntraeger@linux.ibm.com, kmal@cock.li, tglx@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, arnd@arndb.de, anshuman.khandual@arm.com, linux-kernel@vger.kernel.org, kevin.brodsky@arm.com, charlie@rivosinc.com, pengcan@kylinos.cn, broonie@kernel.org, bp@alien8.de, richard.weiyang@gmail.com, dvyukov@google.com, jgross@suse.com, wad@chromium.org, yeoreum.yun@arm.com, oleg@redhat.com, luto@amacapital.net, svens@linux.ibm.com, liqiang01@kylinos.cn, mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, reddybalavignesh9979@gmail.com, macro@orcam.me.uk
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 13, 2026 at 05:47:37PM +0800, Jinjie Ruan wrote:
> Use the generic TIF bits defined in <asm-generic/thread_info_tif.h> for
> standard thread flags (TIF_SIGPENDING, TIF_NEED_RESCHED, TIF_NOTIFY_RESUME,
> TIF_RESTORE_SIGMASK, TIF_SINGLESTEP, etc.) instead of defining
> them locally.
> 
> Arm64-specific bits (TIF_FOREIGN_FPSTATE, TIF_MTE_ASYNC_FAULT, TIF_SVE,
> TIF_SSBD, etc.) are renumbered to start at bit 16 to avoid conflicts.
> 
> This enables RSEQ optimizations which require CONFIG_HAVE_GENERIC_TIF_BITS
> combined with the generic entry infrastructure (already used by arm64).
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/Kconfig                    |  1 +
>  arch/arm64/include/asm/thread_info.h  | 62 ++++++++++++---------------
>  arch/s390/include/asm/thread_info.h   |  7 ++-

Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390

>  arch/x86/include/asm/thread_info.h    |  6 +--
>  include/asm-generic/thread_info_tif.h |  5 +++
>  5 files changed, 38 insertions(+), 43 deletions(-)

FWIW, I guess you want to do the same for loongarch was well?

