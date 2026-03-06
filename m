Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD340FCB61C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 16:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+G8YAzU9aZ4wHaSHLLYbGlbpJK697IOJOmxNBpIK2i4=; b=GCvyRVM5ih7evO7jRNNrEZVXFP
	BIF5xMXdmZv0z0XIbp8rtnzCSACvvRlnZjQkHwcGPu+9jxwSuRuLw7UBLo1S/FQ5/HpaoR3IA0KKx
	qtNBxgSKQquXQzrLK5xmZfgx+S3UtpLGkz6h1FE1Ibeh20p4ZBEpkcDayjo1mZJu7f94VIWAZnYQy
	GVGBDlqS7WXI98Y/VLyXz5iil+PQ+D6ku37MimZrkLHBCprqwpQRZF1AEbeJd19dQlbG91ZT7CKd4
	Pfmskv2Ubr5VA/XapwenFXlTfzR5dUBIs6NdUeQolSS5HzB1Nlv5UZVLoCtEAg9Irub6+iDQQuNKX
	xnWunLTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXrC-000000048st-2klI;
	Fri, 06 Mar 2026 16:16:54 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXr9-000000048qS-26p7;
	Fri, 06 Mar 2026 16:16:53 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6263HxfH1457437;
	Fri, 6 Mar 2026 16:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=+G8YAzU9aZ4wHaSHLLYbGlbpJK697IOJOmxNBpIK2
	i4=; b=MWKA3yLdHbUL0Z+CCDv1QCB4T3rbF9uIaHW3wDIXi9GwyeLJa05dtLG6m
	D/XWX4VadkaCcjr/VFcgC8BYJgVFTHrnCQlGWBKZpsp+bZqdPe8HWCKGu5XZOee/
	XyFoSiCGUncOrzAp3PC0iteD+QCIkssWQNsSdimkARZF1Qk5IWtnyiNGm3+ZVTIT
	94FB+vyrdv/teO72Enezf+CKOBVfh8MWVL+q6Rfcfu3diZC4HhDEv2pUxFRXdDMM
	rkOIkl/wHCwEHtAJAMDveQUgLSIQQfyJDfsVg0b37VpbE4eEwtdoK53mlWdfVzBS
	0zPzdC+XfyW8voVjdHKjDs3cFI/7w==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksrjhg6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 16:16:38 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 626ETQ4X010327;
	Fri, 6 Mar 2026 16:16:37 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmc6kgfvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 16:16:37 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 626GGXVv22086118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 16:16:33 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B7692004B;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CEB620040;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 13D53E077D; Fri, 06 Mar 2026 17:16:33 +0100 (CET)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>
Cc: linux-s390@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        x86@kernel.org
Subject: mm/pgtable: Support for page table check on s390
Date: Fri,  6 Mar 2026 17:16:29 +0100
Message-ID: <cover.1772812343.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Rp/I7SmK c=1 sm=1 tr=0 ts=69aafde6 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=WsTHFn69kSnc_5uNAH0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1MyBTYWx0ZWRfXz7XFdJ/VpJJm
 opiQLgcTw3l/dib7koF+ZwarAMZuXE76kXtrZUVa+Pf/c9GCVeg9EO4Lg/eT2AsuLtH/MHzpsGh
 9kSejWQNGueM4b6u4kPv0D21crlPSIPKL5/yszro+QzKd1Phh9jjRo5phDJRgQcebwFNLQfDxPN
 G0gjKxm2EOEiLlM/ZIcyKO2hLIafG7r17rRi10wih2qg3TAseSQ1K2kK6wnmZHsBCjpbBLu9SM1
 d1vpGY257ZVm/u3Hl1Uat779TQCm5c9Yo4KDanQS7qVkunnOtc+iUGEc93EaxQomCr/WB5dVcpd
 x4J8LI2eJpWyMiFuAeJggXqy4xo9so8AcepmuGK6fKgFj2v0X89F+316Ujonxr3Ft4Uf4P90L37
 w+gfcnnveoypMrWN2lj6kx0JLYL67mnB192pj30rqSi3N7I8S+RZUpvEGvZLl7T6PNbl3VZ8YJ9
 MKs7N0dUuyHTDkmBitw==
X-Proofpoint-GUID: WWK__Q3nr7cGNKzcN7KeoYhaVB95iFrP
X-Proofpoint-ORIG-GUID: WWK__Q3nr7cGNKzcN7KeoYhaVB95iFrP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_081651_886031_F39A83B5 
X-CRM114-Status: GOOD (  11.16  )
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

Hi All,

In v7.0-rc1 page table check support for PPC was added, which
conflicted with this series v1. Thus the only change in v2 is
PPC headers update, which still is NOP for non-s390.

I only did compile test for PPC.

Thanks!

Alexander Gordeev (2):
  s390/pgtable: Use set_pmd_bit() to invalidate PMD entry
  s390: Enable page table check for debug_defconfig

Tobias Huschle (2):
  mm/page_table_check: Pass mm_struct to pxx_user_accessible_page()
  s390/pgtable: Add s390 support for page table check

 arch/arm64/include/asm/pgtable.h             |  6 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h |  2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ++--
 arch/powerpc/include/asm/nohash/pgtable.h    |  2 +-
 arch/powerpc/include/asm/pgtable.h           |  4 +-
 arch/riscv/include/asm/pgtable.h             |  6 +-
 arch/s390/Kconfig                            |  1 +
 arch/s390/configs/debug_defconfig            |  2 +
 arch/s390/include/asm/pgtable.h              | 60 +++++++++++++++++---
 arch/x86/include/asm/pgtable.h               |  6 +-
 mm/page_table_check.c                        | 15 ++---
 11 files changed, 80 insertions(+), 34 deletions(-)

--=20
2.51.0


