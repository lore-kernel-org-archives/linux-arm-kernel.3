Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B40FEE4C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOSDprgL0d5fs/XXHSWHAOQEs7sQM/PZoje0g5bejM4=; b=yO2jt3GPA0xHRUd5VyJWNWqIAg
	TovudW/D5fG+l9PcP/g+Alf7QOO3QAxVRy+MqejZjE4c3pGK5/i6hhhO8uLb4xWOEUQQU8aOEJdTj
	KxAdkiq9bZuOfDkWVzQ/ixNEN6Z9TaGCpo9Xcjcpl1gOmfpQ+qIdJYc5WRUSKmYarRWFiirsPw71B
	qHwu7RI/oyfX0QvtARZceXq8fhZLcQZhFwGfpMRUVKBR8Q6N+4lySW0mITBix3o+K0SVb4cwMy7JF
	TJ+Hu0Mfl75obtnWIRs6GMHyh9B60aQhWvzL51aCtXxyTlyZ3mwO4ckSAkRYIn9A3/ICI3kUJI5mv
	gjEs7xYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwEYL-00000009b92-0lbZ;
	Sat, 28 Feb 2026 07:15:53 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwEY3-00000009b2m-2IPa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 07:15:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SOSDprgL0d5fs/XXHSWHAOQEs7sQM/PZoje0g5bejM4=;
	b=b221ls319orrwaq2qXPX2X0zO6JRk7cd5joqvN2G2Lw2Z1N4/h1DK7lO7egszzySI87F0+NCZ
	O0HVVtR/kXiJ5iHfgXHC74jXTGkIoz4xJ2UEd7vIeGKxB7f9+6BZDG0zz6yp0mKfUcKwuVer6nW
	1joxT8IUuxM8Vaj5HB3NzDQ=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fNGYh4GDDzLlT6;
	Sat, 28 Feb 2026 15:10:32 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 1684A40565;
	Sat, 28 Feb 2026 15:15:21 +0800 (CST)
Received: from huawei.com (10.50.87.63) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 28 Feb
 2026 15:15:19 +0800
From: Yin Tirui <yintirui@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <willy@infradead.org>,
	<david@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <luto@kernel.org>,
	<peterz@infradead.org>, <akpm@linux-foundation.org>,
	<lorenzo.stoakes@oracle.com>, <ziy@nvidia.com>,
	<baolin.wang@linux.alibaba.com>, <Liam.Howlett@oracle.com>,
	<npache@redhat.com>, <ryan.roberts@arm.com>, <dev.jain@arm.com>,
	<baohua@kernel.org>, <lance.yang@linux.dev>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<anshuman.khandual@arm.com>, <rmclure@linux.ibm.com>,
	<kevin.brodsky@arm.com>, <apopple@nvidia.com>, <ajd@linux.ibm.com>,
	<pasha.tatashin@soleen.com>, <bhe@redhat.com>, <thuth@redhat.com>,
	<coxu@redhat.com>, <dan.j.williams@intel.com>, <yu-cheng.yu@intel.com>,
	<yangyicong@hisilicon.com>, <baolu.lu@linux.intel.com>, <jgross@suse.com>,
	<conor.dooley@microchip.com>, <Jonathan.Cameron@huawei.com>,
	<riel@surriel.com>
CC: <wangkefeng.wang@huawei.com>, <chenjun102@huawei.com>,
	<yintirui@huawei.com>
Subject: [PATCH RFC v3 3/4] x86/mm: Remove pte_clrhuge() and clean up init_64.c
Date: Sat, 28 Feb 2026 15:09:05 +0800
Message-ID: <20260228070906.1418911-4-yintirui@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228070906.1418911-1-yintirui@huawei.com>
References: <20260228070906.1418911-1-yintirui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.63]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_231538_593129_82444199 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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

With `pfn_pte()` now guaranteeing that it will natively filter out
huge page attributes like `_PAGE_PSE`, the `pte_clrhuge()` helper has
become obsolete.

Remove `pte_clrhuge()` entirely. Concurrently, clean up the ugly type-casting
anti-pattern in `arch/x86/mm/init_64.c` where `(pte_t *)` was forcibly
cast from `pmd_t *` to call `pte_clrhuge()`. Now, we can simply extract
the pgprot directly via `pmd_pgprot()` and safely pass it downstream, knowing
that `pfn_pte()` will strip the huge bit automatically.

Signed-off-by: Yin Tirui <yintirui@huawei.com>
---
 arch/x86/include/asm/pgtable.h | 5 -----
 arch/x86/mm/init_64.c          | 4 ++--
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index a4dbd81d42bf..e8564d4ce318 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -483,11 +483,6 @@ static inline pte_t pte_mkhuge(pte_t pte)
 	return pte_set_flags(pte, _PAGE_PSE);
 }
 
-static inline pte_t pte_clrhuge(pte_t pte)
-{
-	return pte_clear_flags(pte, _PAGE_PSE);
-}
-
 static inline pte_t pte_mkglobal(pte_t pte)
 {
 	return pte_set_flags(pte, _PAGE_GLOBAL);
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index d65f3d05c66f..a1ddcf793a8a 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -572,7 +572,7 @@ phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
 				paddr_last = paddr_next;
 				continue;
 			}
-			new_prot = pte_pgprot(pte_clrhuge(*(pte_t *)pmd));
+			new_prot = pmd_pgprot(*pmd);
 		}
 
 		if (page_size_mask & (1<<PG_LEVEL_2M)) {
@@ -658,7 +658,7 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 				paddr_last = paddr_next;
 				continue;
 			}
-			prot = pte_pgprot(pte_clrhuge(*(pte_t *)pud));
+			prot = pud_pgprot(*pud);
 		}
 
 		if (page_size_mask & (1<<PG_LEVEL_1G)) {
-- 
2.22.0


