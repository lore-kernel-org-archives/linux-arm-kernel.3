Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FE6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 06:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXHEQAwy2838+sD/OZQIzYqAfJtKf+/jaHkz6cs6G78=; b=xHf75JGHFLWJ6Ce3N0aC9KBnu6
	uCkvrRI8zqd/sH1R3Apsdfhs+Lm6VAmdqEPZ+Nk4RMo5+GEzYWyQZB1qilAzBq2LcA9sRC5TXdB9B
	/LUkNQk7gxp/mq0rA7yezwuPKDSg4bRR4PUeXe8QBDxNeYteocGk8Xa0O5ui+VKbjdf7jEn2LRt5o
	aBZ+trdVUWvDb07Mi6vOYw8vpo/OVeQlos2xv7B0rJ8VbL5nTEIMAlaiD27tl05L2kkfCUIvHBSDk
	LpKClTqmntwb6q65qW4cZsf7ek1d35baaldUBkmTcwAVGzTgtNFlx5hVzptmPdjNLx3kFWchu4UvA
	4VkGcbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37qQ-0000000CiZx-1mMS;
	Fri, 11 Apr 2025 06:26:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37Bg-0000000CaSr-13R5;
	Fri, 11 Apr 2025 05:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pXHEQAwy2838+sD/OZQIzYqAfJtKf+/jaHkz6cs6G78=; b=Zr17MtKZ8xAO10Qb13STJNLfHi
	t2mK05KeWKNzV6eYGdWkTD33nvObvueRCcTF0HO/cZfg14VZOv6LDnqoF2ebmHDI2oLNNvg+uQa56
	STBUX1jsJ/Z+FX7FexxIbNmnQ/lsJuNF6nPzJCY8S6Gp1+CHCmnsYOAvYzNQMy1tbuoPECq4VG53k
	oOkSOmnXJDm1IR6mNbnn5Er2kptg9zW6xIyaVll8J2zGLtULfbum5L8KXRPxGsdv+VLHPmuEOEDkf
	mcL3Dj5GH1Os7Bf1CNp931D2rNDYKyp0VJbz+c1+pQ/8NFXAiiN+722ADjKoi2SdrxiWSO1UID2rd
	Cf6zM4EQ==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u37Bc-00000008vPG-0d22;
	Fri, 11 Apr 2025 05:44:22 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AKcj3q012294;
	Fri, 11 Apr 2025 05:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=pXHEQAwy2838+sD/O
	ZQIzYqAfJtKf+/jaHkz6cs6G78=; b=FxVJpOg8SNZT/2cxvnjl1HJq/DrAGVl0j
	K6tjjnmoX5qVzXg/90m2DrIkIUu8QNNAu8BQjzDpwJShIOi4umUfOmK/YAXh8AUr
	oaGWaZ1Ecs4pO17ZtasIrbWEgVR9MzAviVpCstjbMi7TyhZuQOwuKoNtX6OREKwW
	92cDDEFD2dm/M7/J5zvJv/pGLn65XINTB/lCjfxFAamHRkQ+ag+hPa9QUTRrHnaw
	fWqwYm0+1EM65M/MM+DshdCVehhX4/tPmKA6o4xVDmX5xHngunDc+CdwqTnbg1+V
	OPwUteOMhAJ+bjMaX2nRw4IaMYyMkUwucq/uKUQBcmVzZNM3lJFPw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45xn719q9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:44:06 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4o4ax024577;
	Fri, 11 Apr 2025 05:44:05 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45ueutss7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 05:44:05 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53B5i3Sf52691408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:44:03 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D1D22004B;
	Fri, 11 Apr 2025 05:44:03 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FD1620040;
	Fri, 11 Apr 2025 05:44:03 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 11 Apr 2025 05:44:03 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7D6AF60AC6;
	Fri, 11 Apr 2025 15:43:57 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu
Subject: [PATCH v14 08/11] powerpc: mm: Add pud_pfn() stub
Date: Fri, 11 Apr 2025 15:43:51 +1000
Message-ID: <20250411054354.511145-9-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411054354.511145-1-ajd@linux.ibm.com>
References: <20250411054354.511145-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qeYb2ZWF7f9W0iY0WlxIQ3hsXopxTV9z
X-Proofpoint-GUID: qeYb2ZWF7f9W0iY0WlxIQ3hsXopxTV9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=772 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_064420_802393_D3856650 
X-CRM114-Status: GOOD (  14.08  )
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

From: Rohan McLure <rmclure@linux.ibm.com>

The page table check feature requires that pud_pfn() be defined
on each consuming architecture. Since only 64-bit, Book3S platforms
allow for hugepages at this upper level, and since the calling code is
gated by a call to pud_user_accessible_page(), which will return zero,
include this stub as a BUILD_BUG().

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/include/asm/pgtable.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 2f72ad885332..bb43e4f46367 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -215,6 +215,15 @@ static inline bool arch_supports_memmap_on_memory(unsigned long vmemmap_size)
 
 #endif /* CONFIG_PPC64 */
 
+#ifndef pud_pfn
+#define pud_pfn pud_pfn
+static inline int pud_pfn(pud_t pud)
+{
+	BUILD_BUG();
+	return 0;
+}
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
-- 
2.49.0


