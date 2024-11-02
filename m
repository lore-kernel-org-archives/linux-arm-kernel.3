Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74B7E677F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYOlqLC1vYcc6zw5ew+iIodQLBSrxrmoMpkF4gzHa7U=; b=aPhKzpPcyQm55OIpTR1bFTKY+E
	cc5VnTtxY808KLjq4wKCJ93ccGRakx+nFsFjfvFNn5lwrVEGxPzKhaP5JK7LxM81keLgLe/M87N0y
	5npGGqOf67qgLVxkIoHpgxbInCf+gDsTTNIHosntTVqbiXuu1ZRJ6pX8oSsdbjHeL0mqQ3wT32BSt
	YP6EKlBYlXZFWeX/3Bq3g/axOpIcQqx1KNrmJQR+B6WdG9PIkj5SsmLjaJy5N8lDKHHPAw2YRj+UE
	bvgQW2QEFgAC4UYaHyXVJr9nKB6ATJs22+CWGr+RYKVN6Id7mLkwF2zvX+ZZU9EbXJj83c8Huqqp7
	ZS0x8VNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7BeS-00000009WQ5-1in4;
	Sat, 02 Nov 2024 10:46:40 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Bb8-00000009W2W-32RD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 10:43:17 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XgZ860yZQz1ynt5;
	Sat,  2 Nov 2024 18:43:18 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id CD8981402E2;
	Sat,  2 Nov 2024 18:43:08 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 2 Nov 2024 18:43:08 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<mark.rutland@arm.com>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <oliver.upton@linux.dev>, <ryan.roberts@arm.com>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	<wangkefeng.wang@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH v4 5/5] arm64: pgtable: Warn unexpected pmdp_test_and_clear_young()
Date: Sat, 2 Nov 2024 18:42:35 +0800
Message-ID: <20241102104235.62560-6-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241102104235.62560-1-yangyicong@huawei.com>
References: <20241102104235.62560-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_034314_952186_EAEDA901 
X-CRM114-Status: UNSURE (   9.88  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Young bit operation on PMD table entry is only supported if
FEAT_HAFT enabled system wide. Add a warning for notifying
the misbehaviour.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 5182feabd943..160ca503c99f 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1265,6 +1265,8 @@ static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 					    unsigned long address,
 					    pmd_t *pmdp)
 {
+	/* Operation applies to PMD table entry only if FEAT_HAFT is enabled */
+	VM_WARN_ON(pmd_table(READ_ONCE(*pmdp)) && !system_supports_haft());
 	return __ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
-- 
2.24.0


