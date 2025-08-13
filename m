Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCFFC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 07:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsQJsGaxcqmvsVIG5QO45P6Jy0ZaCP+miqd9jeaLu1A=; b=JGZmwLLmmPQxyjdO9MUyrlzShK
	pWIjB1Wo1fh4CHJNV2R6t/HZ1Zaz8s+Mxd8Uc4TrP3MIN9My8HXo/OuBT51oQzvpndfIllyJya1Mt
	sd5SqijvTc0hYiH+ahXe5Rkm9wBG3E3Zw9H5vLvnJSHMaiFCpc/pwo2/Qw8uOg4wNJHFyKcI9crFo
	WICA9Urs4wY56mZuqrYaaohADb3x7OsACEaLHflUhWoBCv1EvEka+BNK/EIzUc3jfsgF9x1yC7AS2
	dlNxbfA33tHixMTnLB08O14w6tIk8VKhiLAeMRhqHLY4f5ZTD+wujKPfalnLV/wrJSq8cRDbLknXR
	yQZTkzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um5hE-0000000Ctvo-1dFC;
	Wed, 13 Aug 2025 07:14:52 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4xt-0000000Cml2-3up1;
	Wed, 13 Aug 2025 06:28:03 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CNQEj0008385;
	Wed, 13 Aug 2025 06:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=BsQJsGaxcqmvsVIG5
	QO45P6Jy0ZaCP+miqd9jeaLu1A=; b=CID4lWrm0wGGcKXYczdkZ6A4WoNsFRUG2
	P7ZoHlfkVjMcE514h7Z7Xu73WM8jMyH71BJ6IoUbQd6jwYnEO+So6NNTOsphvBPr
	8XvBgb14JZ6rpy+3Zq/hLnmkAF2qzyGtfJGoHVlukPkmcg3HrSI43emfQV4W9dUv
	e5NeznnQ5e54qunUAQCN6rdPEjWx/6rBl/KkeAsrB3ekeqDRQ13sdNcn1qExVlSq
	UaZpwlEFMa60hkXpdT5GphW8kv5RCg5eUtWbLuqttz2Q7DBzH8sbQE+swrfWA6n+
	OzaX/ZEt7NPpB4cDFtpkvKmLNe7NUApjPIUIzlyT5MMNR+gs6FPGA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48duruavc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 06:27:54 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57D1gaat026377;
	Wed, 13 Aug 2025 06:27:53 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48eh21659n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 06:27:53 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57D6RqUD30999048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Aug 2025 06:27:52 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E67315805B;
	Wed, 13 Aug 2025 06:27:51 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D440E58067;
	Wed, 13 Aug 2025 06:27:45 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.10.70])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Aug 2025 06:27:45 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        nicholas@linux.ibm.com, christophe.leroy@csgroup.eu,
        Rohan McLure <rmclure@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v16 10/13] powerpc: mm: Add pud_pfn() stub
Date: Wed, 13 Aug 2025 16:26:11 +1000
Message-ID: <20250813062614.51759-11-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813062614.51759-1-ajd@linux.ibm.com>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6p78tIu4d1GxeDYW0_yoMYEY7Uv1CVko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIyNCBTYWx0ZWRfX7SEwZJR9uMEo
 twnLAjMn1uDuQyNZFvA5mghsluXsrnnNXzdlUz6WtiuS1mzji4hMRYhDtFXzKdsF1+dii5tv0OK
 BXF3GJhRE4Y31srrKALkZx8xNOBm23JXu/foFaUhocmzOkUk8WWqGvVm77BftHaXkfhZ32Na2EN
 yNGLCWhCqEBpUzlnE3kSKahcHr+OemUixZd+rxh6kXeHWoIEKfLtMNfa7vMpjD5zkrgTYDKoJBa
 /G+mhmgKee31fJSwJtZqqRwu5G2dUHERaHLdGVfNOddfx64sKo8ruZRfrSDufbwcUmwYso2UXCF
 5tAN90eLLoWhejCdoXT2qTEnPXyeG2HHqlMFJumDS3tekxkh1Jb/YEkrLSN0IgLCfZuQz8iC6+F
 mV3/I3lB
X-Authority-Analysis: v=2.4 cv=QtNe3Uyd c=1 sm=1 tr=0 ts=689c306a cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=7ipKWUHlAAAA:8 a=qzKveJzcHEAUI94IIBQA:9
 a=gpc5p9EgBqZVLdJeV_V1:22
X-Proofpoint-ORIG-GUID: 6p78tIu4d1GxeDYW0_yoMYEY7Uv1CVko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_232802_084625_DFC8E170 
X-CRM114-Status: GOOD (  12.61  )
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
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/include/asm/pgtable.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 93d77ad5a92f..0f73a9ade0ed 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -214,6 +214,15 @@ static inline bool arch_supports_memmap_on_memory(unsigned long vmemmap_size)
 
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
2.50.1


