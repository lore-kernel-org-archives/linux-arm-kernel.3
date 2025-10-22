Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC075CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvzr1Y8dpMAUvoEFP57Gz835wHqBYze10hbyZJeYU3g=; b=wHojbENxPOkM4+Cd0Dnei4lyi3
	Y9gPUrsbyMwjoGZLdwmRXb8UZZMDfvkdGbfGpTvc0l33sTF5Yv/HlD/D8WR4/gVr1ZGrJ6fyxSvJD
	RaH0P0/ohJR1KZos56NAlUlTixrr+W0IUezNhuJAQ0JfXn0iGJaA44OSw9oxJhNDf1ySaorwyUjn8
	iVAO2dk3G6i+V2FZSrbqclUq5zVZ5tt7uxSBMMllOF6YgiUT0T75zwY6H09pRGtcSkLWJ5lp5nNVN
	u39vzJnZ9GQyEr9U6bIxXbFXLu3qkg1reom5uu5l8+2UJWeJldaJ7/2Gzc3QF5XbN+bEdBJPEtvuL
	/suyC0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBaLX-00000003Jcz-48oT;
	Wed, 22 Oct 2025 15:01:53 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBaLU-00000003JaI-15th;
	Wed, 22 Oct 2025 15:01:50 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M6xCmW014219;
	Wed, 22 Oct 2025 15:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=xvzr1Y8dpMAUvoEFP57Gz835wHqBYz
	e10hbyZJeYU3g=; b=p96rpe+8jnIvJcnNRSXnoAPg+2bPFvo3QYoRkE9XzhXOuf
	zPU2HkzEcM1nDb3BKO3LYcNgZpWcrbVplnyT48p0FCkoweL8zrwPAlHB5CYbQm+x
	HNS/LhTF//xKum9vf1Ddjh6D2+WHxMY+liq50P7+j32lWdYGNBWfdW5SHxC5hDcB
	V8raLaY6GqWjC1UlIT8pdrRl3Z7fXa59vsnZeU3JQhoMYwSqKerwp8gyyf2ztLq6
	StSUFLh4QdrGLaMAOjU/zguLq9XCZ7NAvPi5iMUMgpC5sYJB2DoYjpjZhl++qSpB
	owKG4AFDsdS58ufnQkUH4OnqUUKl5DwfXesfF92g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v30vuxtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 15:00:25 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59MEpIdh002378;
	Wed, 22 Oct 2025 15:00:24 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v30vuxta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 15:00:24 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59MES37T032103;
	Wed, 22 Oct 2025 15:00:23 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49vp7n0wah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 15:00:23 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59MF0JRG61211024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Oct 2025 15:00:19 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33AEA2004B;
	Wed, 22 Oct 2025 15:00:19 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B81C2004D;
	Wed, 22 Oct 2025 15:00:18 +0000 (GMT)
Received: from osiris (unknown [9.155.211.25])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Oct 2025 15:00:18 +0000 (GMT)
Date: Wed, 22 Oct 2025 17:00:16 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        David Laight <david.laight.linux@gmail.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        linux-fsdevel@vger.kernel.org
Subject: Re: [patch V4 06/12] s390/uaccess: Use unsafe wrappers for ASM GOTO
Message-ID: <20251022150016.37430Aa6-hca@linux.ibm.com>
References: <20251022102427.400699796@linutronix.de>
 <20251022103112.232389777@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022103112.232389777@linutronix.de>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8rtbyt9zSskKlv_nEpWKeIuOG0eXKSER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX7mGSdj579bLq
 8bxKzWQ1s8+btHn0jwgAP2J3vX/A4EDg/HYeBH4RsyA5X+zGAdGIwFDsszFuA+Rn1v01A0G6Yjs
 vO6A8wck2DPsUU69VTxABi+r3WoXEdameL5QVo/RksBPiR+jb6D+2UrRoVIg2Iq/O6AsFY3wYT5
 PNCbILR1buB2fxPv51m4yPgFagoOjPret48aJLEeRSls7plxINKeU5yrx6Yk/cvBYbkFpLuEv+2
 cC6SaFGy3Zn+mHF6qUaOg4lQzCotveGK2C59n1pbfL63Z+o6dqfDill8gmsksaHpgwTwW2wrpK9
 bs5ltJsCCgMlLBlcLq8bAga6P/bzqpPOPPxNDA9reMNdOvsKvMKrYr3xNsBpe4DhuMlrzQLF2L1
 QwLoubNXcqjQwkWg6G6TPxJxCDvB2g==
X-Authority-Analysis: v=2.4 cv=MIJtWcZl c=1 sm=1 tr=0 ts=68f8f189 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=l-w2ndfUCpChbJJzmvYA:9 a=CjuIK1q_8ugA:10
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: uK_G6Z0fHMdC8Ou7HEH28NKPmNT2Wfej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_080148_471910_31E38D3B 
X-CRM114-Status: GOOD (  19.20  )
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

On Wed, Oct 22, 2025 at 02:49:09PM +0200, Thomas Gleixner wrote:
> ASM GOTO is miscompiled by GCC when it is used inside a auto cleanup scope:
> 
> bool foo(u32 __user *p, u32 val)
> {
> 	scoped_guard(pagefault)
> 		unsafe_put_user(val, p, efault);
> 	return true;
> efault:
> 	return false;
> }
> 
> It ends up leaking the pagefault disable counter in the fault path. clang
> at least fails the build.
> 
> S390 is not affected for unsafe_*_user() as it uses it's own local label
> already, but __get/put_kernel_nofault() lack that.
> 
> Rename them to arch_*_kernel_nofault() which makes the generic uaccess
> header wrap it with a local label that makes both compilers emit correct
> code.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: linux-s390@vger.kernel.org
> ---
>  arch/s390/include/asm/uaccess.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Heiko Carstens <hca@linux.ibm.com>

