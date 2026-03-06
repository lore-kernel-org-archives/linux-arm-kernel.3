Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D709FCB61C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 16:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLTBtbUx77gzumExkwQ+UsZaY5sqhpu/Y8wOE2jbbEc=; b=wCFTy68EhxWYFdbvlsYtGo20TT
	S9T6ZlVA1S/xk+WZCZ9ZX9StD0Ng/AAsDRc9nHFM7lEpTKyfK9L00eew1ln7qNDGPP/juVhInIvYS
	dvYR/Db58BjPTeD3KGUJ25xUNajiECLuOlANjIuSN5erPmctClQgNOEvDqDDgOS0apbDknb1gC4BZ
	1JiYmpWUh6ygsI1kp9xEXpjlIxhTyWTIbVsPSArqY0MRqayrL8s3TUPP/0TWd7uxq6dn178a3vuRF
	J5V1+yXoWJ3ZR/Rb242E1gbrZqYeGJXffYb2TRFZuM7KlMF9m+B+r8DZUJguGZB0dzgFRic93GZhf
	HE3CBxYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXrM-0000000490g-2XIk;
	Fri, 06 Mar 2026 16:17:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXrK-000000048yT-2Bi9;
	Fri, 06 Mar 2026 16:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VLTBtbUx77gzumExkwQ+UsZaY5sqhpu/Y8wOE2jbbEc=; b=WxK/GgWtwNLvCgyhNthJdH2kGd
	rIFCue3nL8zfj0tJMRuImIryiZWl0gmfx4d2iWxu3cNXcMWo/Lrhhog53gxupZ3oWgmKwHJtKlxHG
	zjeBmi05M1R4yQ5QsamZlKdI6Kg/E0lJJZbc10HZbHnFRD2HzalV3TgrS8yITdAm0tJ0JB+puwqCF
	lKjRH6oR7No+yR073HQx8bZgTwZguJkNH37i6yw8/SlgVJfxcH3dnPA0OtbVMwxo6oRfSZrIls8S9
	boBi+UuO4wqKBG8nrfN2jdNC/uVm2X9U6381T5A+gnS2D1PW+davPobzaTQSPtRaos834JjQcGbf6
	O9IjVF7Q==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXrH-00000009CPg-2smH;
	Fri, 06 Mar 2026 16:17:01 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6267lN2m2100389;
	Fri, 6 Mar 2026 16:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=VLTBtbUx77gzumExk
	wQ+UsZaY5sqhpu/Y8wOE2jbbEc=; b=WBTmsmxvk8iyjPHSdlTpr2YTLvS6K+CA0
	PrOilBrKGR9EZ3Yw5wwcGokyjRG4tLnjQm74rXetTcvfcUU4Nbe4VKIKwDxqWLr2
	gI00c0nDm5OGDM528Xw4QPFRYuEUIV4jqBK9N6Ogf5lgO82ft7eUxQWfKHduln1o
	aLPCMRzzqs86GoMc+Ad6nDE2eefM0+Porj3yL1NSPX1PRkLFIBsTRAt8rZktcSjU
	Ch0Iz0PlCHpmW82MKLKQZmLSEJS2pfdkxbnsjhX+nOwYlvdlO9/5YXydeAjac2Lv
	Z8Z+JB7UtbhsEFvvPRYmckfaNYhlu5gyaSYB6a13pxND7D7MD870g==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksk48udd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 16:16:37 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 626EMNp8027692;
	Fri, 6 Mar 2026 16:16:37 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmcwjraae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 16:16:36 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 626GGXVH10354974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 16:16:33 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 653FA2004D;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36A9C20043;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 1EF1CE078F; Fri, 06 Mar 2026 17:16:33 +0100 (CET)
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
Subject: [PATCH v2 4/4] s390: Enable page table check for debug_defconfig
Date: Fri,  6 Mar 2026 17:16:33 +0100
Message-ID: <975007c27f8563e46d66a1fbb4b14ae6a4147edd.1772812343.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1772812343.git.agordeev@linux.ibm.com>
References: <cover.1772812343.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eToHDjTYiyMz7a2sBJeb72YZHB1UF-lQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1MyBTYWx0ZWRfX25ilnaqkZ1mG
 395rxazo4o/xlOSP7O01w3hOCD2fwuHn/hc8XRx+Hh6uLMLfIsh1YZODI6BGMqB4yqnh7PNfATx
 sYO9Epo62gqmbtyYvpE12E2pUTnTzKY0REnmDUodQ/lkC+QdUjoEsTz85lJtj0bSa/7JWbHwUKw
 S4OzB3YkLOzoK5vG4y1AU3bx6TkPZISueCuc3B4/Y/PZwoAecmg8ZTwZRgn94PCGqfaaiP2+tSE
 gYsNd2oE1FXqB1stqpYj+ol8oVQ4VUYvjOAduAEbIWT5wbxteDBUiuoCMtK7Ry6mu4lNeWzjQBr
 F4pediMuqFgritMq+U4u6HQTpEGvzfw/NCtbei3QFKsPK0U1j8OSqRD6YfzdY6nUDV9RcBco5b3
 ufL3p6bKaEkmzi1BhrbNw6cErKGR1CsSps7IhNSzL7vEA0USc818VxE93Z3mKst7K5ghD14yFLh
 e709UMA8iEzOm0G+9sA==
X-Authority-Analysis: v=2.4 cv=csCWUl4i c=1 sm=1 tr=0 ts=69aafde6 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=ll0qgXPPjJRHf6HrCsAA:9
X-Proofpoint-GUID: eToHDjTYiyMz7a2sBJeb72YZHB1UF-lQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_161700_001597_09B951BA 
X-CRM114-Status: GOOD (  10.67  )
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

Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/s390/configs/debug_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_=
defconfig
index 98fd0a2f51c6..12cdaaefb6db 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -929,3 +929,5 @@ CONFIG_PERCPU_TEST=3Dm
 CONFIG_ATOMIC64_SELFTEST=3Dy
 CONFIG_TEST_BITOPS=3Dm
 CONFIG_TEST_BPF=3Dm
+CONFIG_PAGE_TABLE_CHECK=3Dy
+CONFIG_PAGE_TABLE_CHECK_ENFORCED=3Dy
--=20
2.51.0


