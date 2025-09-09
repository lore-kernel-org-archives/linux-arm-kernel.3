Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95095CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 11:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8EealqgrpCzZz7qOCOIQ+4P/4Y4XtWwcjzoer4drJU=; b=khSuoU/hYnZq8UDENeiqCQrW7z
	geMFCf8Kiy/p0bHQxa275IfUCRap4jOiRGjFIb/R/r8aiUOo0lWQFBy6blhwD9sXv21xyqiMyoK0p
	nIHVAaQChLH+Y9wDYylFK0WhoFsTZxStA3F1EgMSQt/vjybO8Kq7EGFDsO8OcLtzQiTvKvdSCHUca
	V+u7A51k5l3JaEBWUBSFUhWw0odVlwz1KmLvJupS47lRWZW4eF7y72eXHTvfHdLYwQHK2itoiZuvU
	IdyGc/cP3RUPQEXv2va+aJZQUnV3Oq5fPgW3MgJp3zkU88FeNBTjdsG5ErpJ9zAe8T4x078WCckZd
	OIRqwqdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwAq-00000006b73-1cfy;
	Tue, 09 Sep 2025 11:06:08 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuRo-00000005sLO-3DO4;
	Tue, 09 Sep 2025 09:15:34 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896MAwd024164;
	Tue, 9 Sep 2025 09:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=N8EealqgrpCzZz7qO
	COIQ+4P/4Y4XtWwcjzoer4drJU=; b=jXkJo6zY/xPfZ7kUBjK+/42+5GgfOCDBs
	YbiJsn72dYagjfrullVNcHKr7lWiThgeuhEdLTN3H5tE/9tLeSrDtlaBXAdt32go
	sz+fGgE++l79hGO10WAHUhnQg9wOZEG9S5ZifVcNc6hlsl8NQ1BOFNEJxkeD4hmv
	9r2AdOR6tj8HRwv6hqIaaGf0dsG/XRxMyzlEQgIVFsm0Lm0mgyJaMaToh8fJN/HN
	QouvFVjVgOQBP05zCcoxKFReRAmUxYm9d7Qtiy57sR9zCEX0Lty9aODgzbegArT4
	Sk80u3PLqQZVU7QBmCvrYIjtwMOW1bZS1rlN3uWpkUmgVF4JIfFdg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcspgy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 09:15:24 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5896nDeV010666;
	Tue, 9 Sep 2025 09:15:23 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4910smt9qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 09:15:23 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5899FMQ731785654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 09:15:22 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D15958043;
	Tue,  9 Sep 2025 09:15:22 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B13EE5805E;
	Tue,  9 Sep 2025 09:15:16 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.2.198])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Sep 2025 09:15:16 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        nicholas@linux.ibm.com, christophe.leroy@csgroup.eu,
        alexghiti@rivosinc.com, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v17 10/12] powerpc: mm: Implement *_user_accessible_page() for ptes
Date: Tue,  9 Sep 2025 19:13:33 +1000
Message-ID: <20250909091335.183439-11-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909091335.183439-1-ajd@linux.ibm.com>
References: <20250909091335.183439-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfX2FBiHo7uUFP7
 5z0hL8pcUkziaGtBtP8TW2gXO9LmWpZpxofnp7QPVpI0a24zlAYmnDchlSKfSw7owvrhJR2cD9y
 GbK6NBo6L23LNZ81GpdqascUBOiLf/NJf7p8CsoSuwh67cQuh6FmpJePaMNDTnaLhZdG24JXp5z
 oXP7Ku7mh60Y8/zZuJGfuX+nOOX2xbYTmSlj8o7TVwFfNwUnNY3jeWxGTSjUD00amn/LR7XwDQE
 Ck3Nlp2LiAyOKtZzjV6644Yj+irpUyrBTaCstYJwGlqBRSzjV9ZiGyxxzzuPpE12k8ByUrQtGyC
 HhhJfmVzA3dNbNvYVHxjfzByCEH/PepH/vqbKwdYf4R8A8t52LsHotVNY6Dg4AWyVQ7mR3AIi+/
 ccsTaTim
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68bff02c cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=7ipKWUHlAAAA:8 a=a65a1E2n8xkc5m_RgcEA:9
 a=gpc5p9EgBqZVLdJeV_V1:22
X-Proofpoint-GUID: TM3YhvqpwbcLDevaIpBzNiayhoybwUdn
X-Proofpoint-ORIG-GUID: TM3YhvqpwbcLDevaIpBzNiayhoybwUdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021532_926129_42BE2C2B 
X-CRM114-Status: GOOD (  16.23  )
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

Page table checking depends on architectures providing an
implementation of p{te,md,ud}_user_accessible_page. With
refactorisations made on powerpc/mm, the pte_access_permitted() and
similar methods verify whether a userland page is accessible with the
required permissions.

Since page table checking is the only user of
p{te,md,ud}_user_accessible_page(), implement these for all platforms,
using some of the same preliminary checks taken by pte_access_permitted()
on that platform.

Since commit 8e9bd41e4ce1 ("powerpc/nohash: Replace pte_user() by pte_read()")
pte_user() is no longer required to be present on all platforms as it
may be equivalent to or implied by pte_read(). Hence implementations of
pte_user_accessible_page() are specialised.

[ajd@linux.ibm.com: rebase and fix commit message]
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h |  5 +++++
 arch/powerpc/include/asm/book3s/64/pgtable.h | 17 +++++++++++++++++
 arch/powerpc/include/asm/nohash/pgtable.h    |  5 +++++
 arch/powerpc/include/asm/pgtable.h           |  8 ++++++++
 4 files changed, 35 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 92d21c6faf1e..b225967f85ea 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -437,6 +437,11 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 	return true;
 }
 
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
+{
+	return pte_present(pte) && !is_kernel_addr(addr);
+}
+
 /* Conversion functions: convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
  *
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index c19800365315..48f3a41317dd 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -539,6 +539,11 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 	return arch_pte_access_permitted(pte_val(pte), write, 0);
 }
 
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
+{
+	return pte_present(pte) && pte_user(pte);
+}
+
 /*
  * Conversion functions: convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
@@ -1381,5 +1386,17 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
 	return false;
 }
 
+#define pmd_user_accessible_page pmd_user_accessible_page
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
+{
+	return pmd_leaf(pmd) && pte_user_accessible_page(pmd_pte(pmd), addr);
+}
+
+#define pud_user_accessible_page pud_user_accessible_page
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
+{
+	return pud_leaf(pud) && pte_user_accessible_page(pud_pte(pud), addr);
+}
+
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_PGTABLE_H_ */
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 7d6b9e5b286e..a8bc4f24beb1 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -243,6 +243,11 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 	return true;
 }
 
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
+{
+	return pte_present(pte) && !is_kernel_addr(addr);
+}
+
 /* Conversion functions: convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
  *
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index d8f944a5a037..fa43f663e615 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -202,6 +202,14 @@ static inline bool arch_supports_memmap_on_memory(unsigned long vmemmap_size)
 
 #endif /* CONFIG_PPC64 */
 
+#ifndef pmd_user_accessible_page
+#define pmd_user_accessible_page(pmd, addr)	false
+#endif
+
+#ifndef pud_user_accessible_page
+#define pud_user_accessible_page(pud, addr)	false
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
-- 
2.51.0


