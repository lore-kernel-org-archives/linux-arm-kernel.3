Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EF6FED2E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yQLPhF/8tvYIDT5F8gEZIM1Lj5cCvoGcEOmMxBZOxo=; b=RQchb6tEm8fIy+BTM+Gdj3SohG
	Y908mo5bfk+xZY04khMCxnUIKSGm7izuz/akzojpWrpMQRrguCw26izKBF5xIz00fUA/vJp/5dt4b
	X1gzYTX8HHM7UG7wdfHUh7Fs4juvhdBiyum3JD1A5xM2rqRKGp38ZUFSuzIB+91HvJoxib2EdhZ+F
	qEpGbJmsE1ilPgY+OI0oGXVKPUA5ozDMTxzU6O+nxafVcsGruoH91+rDtFtbVZqIpnPTkRDeKa/0J
	aXMh+6oBRIMFVjFgVwAEAR7i8bSt5dVfgaP/t/wtrKOyvPFeBQ6QOoY3gf9OQ+865X7wCSsM+vZZQ
	Koim5Kjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hZ2-0000000EIQl-2YZe;
	Thu, 12 Mar 2026 15:03:04 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hYz-0000000EIN5-0OxK;
	Thu, 12 Mar 2026 15:03:02 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CEYoAI2256683;
	Thu, 12 Mar 2026 15:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=9yQLPhF/8tvYIDT5F8gEZIM1Lj5cCv
	oGcEOmMxBZOxo=; b=MC0pt+PeqJ/Fx0rQPpGYhy4twD3b2Kc3SyGf6uydq7veOf
	8wSyVumxfYcS/RzLsLeDh8kl9tD8R4upozst/SCAgDPTqUvZAmWAxmio9y7OUnuT
	z+9VkyVr2PtgAtjQ0Lx8hCSh12XXatgaPxqxwMvKJXGxkJkYajZHeGG8FFjLWuwt
	A8sSjHM0AL5l7/rGDzvXX3n/TnC1GNUMHMp8KZgOej48GZLIJZLI1hfjuva/1XP4
	1J3vzIqfnclM5Nt7mo5XR2o0alAXT63fVux788NDDz7JkbrDWVUnoTDzw6dMHvhx
	oQjkY8po5xcP4wjIRBxqWDT9CJV+bVyXkR6qLRFw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cuh92b9bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 15:02:48 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62CEN16g025674;
	Thu, 12 Mar 2026 15:02:47 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cuha8as0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 15:02:47 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62CF2hgt59965898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 15:02:43 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 613C32004E;
	Thu, 12 Mar 2026 15:02:43 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80C7120043;
	Thu, 12 Mar 2026 15:02:42 +0000 (GMT)
Received: from localhost (unknown [9.111.83.60])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 12 Mar 2026 15:02:42 +0000 (GMT)
Date: Thu, 12 Mar 2026 16:02:40 +0100
From: Vasily Gorbik <gor@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH v2 1/4] mm/page_table_check: Pass mm_struct to
 pxx_user_accessible_page()
Message-ID: <ttbskgg@ub.hpns>
References: <cover.1772812343.git.agordeev@linux.ibm.com>
 <ca77f3489453c2fe01b25e50e53b778929e0dfc5.1772812343.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca77f3489453c2fe01b25e50e53b778929e0dfc5.1772812343.git.agordeev@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1KsyIx1BDwTPWaT_bYuVWvLadqDOw4WH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfX9FVH7vrUmovR
 J4ljyZrodPGRPdSk7n1B/Cu0G49IAvTOnb9rnFhx7k/ZMkrjauFEAfl9mgAdqYFQ5AIeON+I65L
 aBHB+xoH0lQifsBvM+fDapqU7iShTN1mwz6wfd4HDoQHyRNUuL3SE4S+xE7l9cxyu/+VssBqPe8
 FtomLZUnwBdwc6mhzgyI+QBRIj0VvjIIMzoW/dhIAaRL2RNh8URukhOHG2aIpg3TrvdODgERw94
 bu/MNsCRkWPsIKbo7rlefYFNmgpmKQz9p4ndZ+DRs20cVYl1l6HF2M4uoujYP0HyT7PBzGeqfT+
 8NU/fKpq9pAf5Ac3EfQsegHyszKU98eJp54aJoGeN2WHCSsZHn/zujIQWl+iQTzwRz4TdtyIETZ
 5GC2PliLsfoRSNNNxjHHjgzxZZUP16hgpTMMKnK5UhAY3UAhROBg9q4VyPk1g6GDwAdF7Qhb7JE
 ektOqp8PyzdLfyWK8Og==
X-Proofpoint-GUID: 1KsyIx1BDwTPWaT_bYuVWvLadqDOw4WH
X-Authority-Analysis: v=2.4 cv=XNk9iAhE c=1 sm=1 tr=0 ts=69b2d598 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=Z4Rwk6OoAAAA:8 a=qw9MI_8u0g6XvTY13mQA:9 a=QEXdDO2ut3YA:10
 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_080301_479758_93B752FF 
X-CRM114-Status: GOOD (  17.06  )
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

On Fri, Mar 06, 2026 at 05:16:30PM +0100, Alexander Gordeev wrote:
> From: Tobias Huschle <huschle@linux.ibm.com>
> 
> Unlike other architectures, s390 does not have means to
> distinguish kernel vs user page table entries - neither
> an entry itself, nor the address could be used for that.
> It is only the mm_struct that indicates whether an entry
> in question is mapped to a user space. So pass mm_struct
> to pxx_user_accessible_page() callbacks.
> 
> [agordeev@linux.ibm.com: rephrased commit message, removed braces]
> 
> Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  arch/arm64/include/asm/pgtable.h             |  6 +++---
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  2 +-
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 10 +++++-----
>  arch/powerpc/include/asm/nohash/pgtable.h    |  2 +-
>  arch/powerpc/include/asm/pgtable.h           |  4 ++--
>  arch/riscv/include/asm/pgtable.h             |  6 +++---
>  arch/x86/include/asm/pgtable.h               |  6 +++---
>  mm/page_table_check.c                        | 15 ++++++---------
>  8 files changed, 24 insertions(+), 27 deletions(-)

Andrew, may I get your Reviewed-by or Ack-by for v2 so I can take it
via the s390 tree as well?

Thank you.

