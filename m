Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DD0D3E77A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 20:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rjbkPcVP0OMpZpi8LdPrRUTAr5HeJYf1Gz4mbFbmRk=; b=IqinYkihImg2ytRqmoDHfzpQao
	Z3EATY66Wnad59YP8vCeFreyvRZJ/WOVM0fojk5A5Cb4Jnn6kLVfOABhhUPAx6+kGxIBwgEMkRVEm
	7a6KfZN8IwqUOAN0qfg/3LZfAQFIyTFT1GlqzXB+vyZnhywAyaECMwguyR2+DEnCAH0cKUySF1U/7
	FmTbCk2KX79Mfo3VB8mrBvcWn5q7J+hrKa2zKATdpCijQRxGuvdfk0inCXnPmHVvrUculPqf6YZUd
	tsnHbFpnDIdlX57adi/MjFcYt4miNpeKz6CA6RlqtRAT6fXExQIHynmNEzerxWLk6WIWYCsRYSLxQ
	+34+cAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQbz-0000000Fp03-2zB6;
	Wed, 10 Dec 2025 20:16:35 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30] helo=mx0a-00082601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQbw-0000000FozS-31UN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 20:16:34 +0000
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 5BAGc7rT1440445
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 12:16:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=s2048-2025-q2; bh=0rjbkPcVP0OMpZpi8LdP
	rRUTAr5HeJYf1Gz4mbFbmRk=; b=EwKVj+0Kzpgw7dNcpjReyvLVKcZ4q39qhEKy
	Y2DZbrBSjE9ybhppnX2GV/5rx3JWZNihWa7ouK8PIvdWXuYrChcX/jsuRyrwhNCv
	wAOWu1WKnu/TmjKyQWuWYOg8Rg2lcQH+biURffNYTru8UBmPYk0FOQKkj2MXSf3J
	LT3Bt0UUS01T3CPmyxPLIGKqxYO6UOmT5BgSJC0KIEb+VZ4cTPaQQr6/wQWdeOiC
	yOKqId7EmYxiIbLQbJwViUiNdE6aVPf5A79BKGc0hqaIXilHEpX7hLIFTcsvUdk0
	EN3g9WyJuEMbR4U1h9Apo2lhbLv2jK0jp70LrmTlHcsBjeIrbQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by m0089730.ppops.net (PPS) with ESMTPS id 4aycjba04x-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 12:16:31 -0800 (PST)
Received: from twshared36991.31.prn2.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Wed, 10 Dec 2025 20:16:28 +0000
Received: by devbig071.cco5.facebook.com (Postfix, from userid 704538)
	id E1A5BB4BEF15; Wed, 10 Dec 2025 12:16:17 -0800 (PST)
Date: Wed, 10 Dec 2025 12:16:17 -0800
From: Ben Niu <BenNiu@meta.com>
To: Mark Rutland <mark.rutland@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <tytso@mit.edu>,
        <Jason@zx2c4.com>, <linux-arm-kernel@lists.infradead.org>,
        <niuben003@gmail.com>, <benniu@meta.com>,
        <linux-kernel@vger.kernel.org>
Subject: Withdraw [PATCH] tracing: Enable kprobe tracing for Arm64 asm
 functions
Message-ID: <aTnVEdv2j5ur48aF@meta.com>
References: <20251027181749.240466-1-benniu@meta.com>
 <aQIltqoIVDwh4A6p@J2N7QTR9R3>
 <aQKpDIYwO9VTP7qM@meta.com>
 <aQNbjap69C6inZwb@J2N7QTR9R3>
 <aQOpd14RXnyQLOWR@meta.com>
 <aRr6Ll7h29dpt7zz@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRr6Ll7h29dpt7zz@J2N7QTR9R3>
X-FB-Internal: Safe
X-Proofpoint-ORIG-GUID: w-EdEUuhiP8gMfALc0RyB056DgtgA8U6
X-Authority-Analysis: v=2.4 cv=QcVrf8bv c=1 sm=1 tr=0 ts=6939d51f cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VabnemYjAAAA:8 a=oWcT_wZofUWEQ4_KjLkA:9 a=CjuIK1q_8ugA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE2NiBTYWx0ZWRfX789Onk2OzVPF
 oqP94+ly5ysDBgAPEh9WmSVGkWk2LnktyPgKsqYeYKPMv4w4oVElHcL7MoKLzHdbA1KIRQ6ZPg4
 IQqn9lnAJ+cAJ8VFtw59ntzkuSsPpyNCdh5c2b9T+htqEJoRq4J8TVSje9KIwpMkgYdmryMP5Ci
 n0+zppBkhsgwIrrMtsTHJTBWawf2iLPBZWaZNQpbkEf9idFhQUT5XgB+qIiZgtkAiMd4hSyLocF
 Igt/sjhI8oRP25M2Tt4aRcO+llJ7IbT+Pln6CI0VtrNKjRVEeZG36qBeJ3+rKtILId3I8ZhsQbu
 jdieRboja4ZFMS6tNINmfC6Rj8evXI9Uf02jNtQAUUzmJfsk/CJr9KKKUdsU2uOEXgaQNQqRzYX
 mCAp9biDPs1KStcLam3GpeOr73dcsg==
X-Proofpoint-GUID: w-EdEUuhiP8gMfALc0RyB056DgtgA8U6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_121632_938688_93141A23 
X-CRM114-Status: GOOD (  25.01  )
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

On Mon, Nov 17, 2025 at 10:34:22AM +0000, Mark Rutland wrote:
> On Thu, Oct 30, 2025 at 11:07:51AM -0700, Ben Niu wrote:
> > On Thu, Oct 30, 2025 at 12:35:25PM +0000, Mark Rutland wrote:
> > > Is there something specific you want to trace, but cannot currently
> > > trace (on arm64)?
> > 
> > For some reason, we only saw Arm64 Linux asm functions __arch_copy_to_user and
> > __arch_copy_from_user being hot in our workloads, not those counterpart asm
> > functions on x86, so we are trying to understand and improve performance of
> > those Arm64 asm functions.
> 
> Are you sure that's not an artifact of those being out-of-line on arm64,
> but inline on x86? On x86, the out-of-line forms are only used when the
> CPU doesn't have FSRM, and when the CPU *does* have FSRM, the logic gets
> inlined. See raw_copy_from_user(), raw_copy_to_user(), and
> copy_user_generic() in arch/x86/include/asm/uaccess_64.h.

On x86, INLINE_COPY_TO_USER is not defined in the latest linux kernel and our
internal branch, so _copy_to_user is always defined as an extern function
(no-inline), which ends up inlining copy_user_generic. copy_user_generic
executes FSRM rep movs if CPU supports it (our case), otherwise, it calls
rep_movs_alternative, which issues plain movs to copy memory.

FSRM is vectorized internally by the CPU and Arm FEAT_MOPS seems similar to
what FSRM does, but Neoverse V2 does not support FEAT_MOPS so the kernel
resorts to sttr to copy memory.

> Have you checked that inlining is not skewing your results, and
> artificially making those look hotter on am64 by virtue of centralizing
> samples to the same IP/PC range?

As mentioned above, _copy_to_user is not inlined on x86.

> Can you share any information on those workloads? e.g. which callchains
> were hot?

Please reach out to James Greenhalgh and Chris Goodyer at Arm for more details
about those workloads, which I can't share in a public channel.

By bpftracing, we found that most of __arch_copy_to_user calls are against size
2k-4k. I wrote a simple microbenchmark to test and compare the performance of
copy_to_user on both x64 and arm64, see
https://github.com/mcfi/benchmark/tree/main/ku_copy
Below were data collected. You could see that Arm64 ku copy speed had a dip
when the size hits 2K-16K.

Routine	        Size	Arm64 bytes/s / x64 bytes /s
copy_to_user	8	203.4%
copy_from_user	8	248.5%
copy_to_user	16	194.6%
copy_from_user	16	240.6%
copy_to_user	32	195.0%
copy_from_user	32	236.5%
copy_to_user	64	193.2%
copy_from_user	64	240.4%
copy_to_user	128	211.0%
copy_from_user	128	273.0%
copy_to_user	256	185.3%
copy_from_user	256	229.3%
copy_to_user	512	152.9%
copy_from_user	512	182.4%
copy_to_user	1024	121.0%
copy_from_user	1024	141.9%
copy_to_user	2048	95.1%
copy_from_user	2048	108.7%
copy_to_user	4096	78.9%
copy_from_user	4096	85.7%
copy_to_user	8192	69.7%
copy_from_user	8192	73.5%
copy_to_user	16384	65.9%
copy_from_user	16384	68.8%
copy_to_user	32768	117.3%
copy_from_user	32768	118.6%
copy_to_user	65536	115.5%
copy_from_user	65536	117.4%
copy_to_user	131072	114.6%
copy_from_user	131072	113.3%
copy_to_user	262144	114.4%
copy_from_user	262144	109.3%

I sent out a patch for faster __arch_copy_from_user/__arch_copy_to_user. Please
see this message ID 20251018052237.1368504-2-benniu@meta.com for more details.

> Mark.

In addition, I'm withdrawing this patch because we found a workaround to trace
__arch_copy_to_user/__arch_copy_from_user through watchpoints. This message ID
aTjpzfqTEGPcird5@meta.com should have all the details. Thank you for reviewing
this patch and all your helpful comments.

Ben

