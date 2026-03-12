Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F0D106ACF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 22:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8zOmmY8eeeaXFLebTpNVG/LsQlaEOKJAHWnrIeNJVA=; b=fDmTeqTL4djemKvA8FjWUdiP5g
	yUO9q57cR/4i4EW+K9LTdK73j4GM3bWW+6D/ewPKTG0FgqgxeYZPZoLr/PgH3qw7UwR/jmJMWVfZ/
	6lkr6plQck4RE1Dz1A29AhnTaU9q0Z17XGJyc95t5Mzpr4Zsn8jnCZl3ik4C05Ks5YK1MzSeABwTy
	KpMJBRzCj20D9gtBQBOmPq3LhjPmbdjyunfBKKATnT3eyPnHhXdnEfN1jz7aaIMsrC8tQSax40LWE
	A2lht0FSLAR+lRApU/s4p6pyWTNbVap8a/n74hVRQtQ+AXBm466ak3H6mUqtABcMLXvf+SeqkQ+Da
	V1bqIhbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0onk-0000000FgfE-2ViB;
	Thu, 12 Mar 2026 22:46:44 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0onh-0000000FgdP-1rOw;
	Thu, 12 Mar 2026 22:46:42 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CDgn1g2259751;
	Thu, 12 Mar 2026 22:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=D8zOmmY8eeeaXFLebTpNVG/LsQlaEO
	KJAHWnrIeNJVA=; b=d5n+sU79eoOn9F5TNsG+WjiggtWrEcbsRVXkeBYiV5vWYm
	ivMwqxRtuuKxHBJLTmN0R/EqcQKgePNMaxtoFO/195J0uARNgOoPFezHGAkG79Gb
	tnIL4WjD+hjdGThr2+ba0V1/7vl0opoBJ8EpxzsOcustk/WNZ9IiGR5jekM04X2M
	X3SY1v3FwdqCrjDcUcaePqQc6Uy9a6NrXfEvRVJp3bjvg5L4B6paFgbVwJSrz05M
	wFsopL+3T8BfZuZN/7q/6aPP6SOL9qSDoFDPzWQDVaNcRJ/y/UFkdI4+tt9KHvUd
	Fw9mNp3mxrlnWGv8acyW3h8aS65PyJpXirrQulfA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cuh92d53m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 22:46:29 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62CITFZx025686;
	Thu, 12 Mar 2026 22:46:28 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cuha8capw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 22:46:28 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62CMkPHL16449894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 22:46:25 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B0192004F;
	Thu, 12 Mar 2026 22:46:25 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 279A32004E;
	Thu, 12 Mar 2026 22:46:24 +0000 (GMT)
Received: from localhost (unknown [9.111.83.60])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 12 Mar 2026 22:46:24 +0000 (GMT)
Date: Thu, 12 Mar 2026 23:46:22 +0100
From: Vasily Gorbik <gor@linux.ibm.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: mm/pgtable: Support for page table check on s390
Message-ID: <ttbt5xa@ub.hpns>
References: <cover.1772812343.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1772812343.git.agordeev@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XSb0EpCLqP-VvERd6yxhMyLpIuUmwWro
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE4MSBTYWx0ZWRfX1dmLEh8veiIG
 JPH+TX+SKowHwqfzMq52we/QWAIDL+ZWYZX2jNbNGdZowW55EvpX8g/DRRACVzpVxsDhn+zENCd
 kt+vKYAw/S0oFGmt301uYKsD8hvRqZ8fzz7zhkSDwM+JaLyyhRiAgeGOnJ3hPl8tMmJ3cimrUTc
 QxD42P4vOhD0rEmJgmsyoBM6UnZ2cuDggfUF1CvtrrM+0LTZMLXqib5gODqi8G5g5/v7TOrtO19
 BcefUJ3xyGScJjhjkOzB/bUvD0msMt3gV9bVz0N7NvXQvpjkMyIFQG1IzgLmoPzrwhMTNoxMVFn
 Y0+8Amm8ExMPHkvoKIs8uraV6X8nzMyL0sT+rQUB8TJBgiVffvSrLfCwlAF1YfotN+3Js3OLFLS
 gs6mYwnnXZwsfG731r2xvnOUuIsc631T935DNRics0rmn4wCRiCXWx3KSKEofuyW7vZfthOAG16
 0tM/zg+0I6iru1bvr5w==
X-Proofpoint-GUID: XSb0EpCLqP-VvERd6yxhMyLpIuUmwWro
X-Authority-Analysis: v=2.4 cv=XNk9iAhE c=1 sm=1 tr=0 ts=69b34245 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=euGEXw6tGDjZIu8w7pwA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_154641_482707_1B65BCEF 
X-CRM114-Status: GOOD (  16.34  )
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

On Fri, Mar 06, 2026 at 05:16:29PM +0100, Alexander Gordeev wrote:
> Hi All,
> 
> In v7.0-rc1 page table check support for PPC was added, which
> conflicted with this series v1. Thus the only change in v2 is
> PPC headers update, which still is NOP for non-s390.
> 
> I only did compile test for PPC.
> 
> Thanks!
> 
> Alexander Gordeev (2):
>   s390/pgtable: Use set_pmd_bit() to invalidate PMD entry
>   s390: Enable page table check for debug_defconfig
> 
> Tobias Huschle (2):
>   mm/page_table_check: Pass mm_struct to pxx_user_accessible_page()
>   s390/pgtable: Add s390 support for page table check
> 
>  arch/arm64/include/asm/pgtable.h             |  6 +-
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  2 +-
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ++--
>  arch/powerpc/include/asm/nohash/pgtable.h    |  2 +-
>  arch/powerpc/include/asm/pgtable.h           |  4 +-
>  arch/riscv/include/asm/pgtable.h             |  6 +-
>  arch/s390/Kconfig                            |  1 +
>  arch/s390/configs/debug_defconfig            |  2 +
>  arch/s390/include/asm/pgtable.h              | 60 +++++++++++++++++---
>  arch/x86/include/asm/pgtable.h               |  6 +-
>  mm/page_table_check.c                        | 15 ++---
>  11 files changed, 80 insertions(+), 34 deletions(-)

Applied to the s390 tree, thank you!

