Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C5FC61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftKn+49W8yK1HAHXVqh6PcSXmf+Z7/mnV4iNORjKKA4=; b=LpJVyoFES8E7i+r0wnM9gTEa2M
	azB0zXqcn3KGDh4HN05Q/DxHjGRxpAuo4HIy0kvZFtHEafdhZUzTBGLjjtGyQqYDd0DZxUSvGVaZP
	jNOZZJbkMKe/cDccmf4ytptl71rgbNHih18mB21lr4mIsQ6c61H+WfycZyKAhOKcz1vcqwlT2yu0/
	rNzn48E/+r7k3hvheflCklKkMpgfPHQtVmB+AcHivIUHO7Telm+y9xjNsGfUK8xWWjINmkohk4TdS
	IsSgHsDPvFsX58PCFkBnoKShVJst1oFW1iYKUqcI9W5qTS4xAwd86K8/ymvcmZ1m52o0D4EWG6BBT
	WSr3Q1aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcvX-00000004Ktm-0bLS;
	Thu, 27 Aug 2026 16:26:07 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuI-00000004JlT-3hnn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:24:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ftKn+49W8yK1HAHXVqh6PcSXmf+Z7/mnV4iNORjKKA4=;
	b=To0G6wcEbxhMZWTK5DME5yHn/K70A7erPo6Vqiwugi/mKREl4Ejl8JHdOMkCXABbkqafCNh4j
	ECKo1G8HoT75N7J7N+yHuE5w1okfaAs4WC6+f/fxaPQwgHlmeNsruHPfm7iqHhU5lc4FldADO1v
	FZMO8OtdNCCJ+DMl+6mVL8w=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KX1Sd7zJ46Yq;
	Fri, 28 Aug 2026 00:24:16 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id BBD2540570;
	Fri, 28 Aug 2026 00:24:37 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:37 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 14/18] arm64: add correct alignment to kimage in efi code
Date: Fri, 28 Aug 2026 00:11:54 +0800
Message-ID: <20260827161158.3618409-15-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.66.11]
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_092451_134508_94F9FB0B 
X-CRM114-Status: GOOD (  10.17  )
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
Reply-To: artem.kuzin@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
Acked-by: Denis Darvish <darvish.denis@huawei.com>
Signed-off-by: Nikita Panov <panov.nikita@huawei.com>
---
 arch/arm64/include/asm/efi.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index e8a9783235cb..08ec4d8b48cd 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -87,8 +87,6 @@ static inline unsigned long efi_get_max_initrd_addr(unsigned long image_addr)
 
 static inline unsigned long efi_get_kimg_min_align(void)
 {
-	extern bool efi_nokaslr;
-
 	/*
 	 * Although relocatable kernels can fix up the misalignment with
 	 * respect to MIN_KIMG_ALIGN, the resulting virtual text addresses are
@@ -97,7 +95,23 @@ static inline unsigned long efi_get_kimg_min_align(void)
 	 * 2M alignment if KASLR was explicitly disabled, even if it was not
 	 * going to be activated to begin with.
 	 */
+
+#ifdef CONFIG_KERNEL_REPLICATION
+	/* If kernel replication is enabled, the special alignment is necessary.
+	 * Due to this fact for now we map kernel by huge pages even
+	 * in case of KASLR enabled. Ugly but works.
+	 */
+#ifdef CONFIG_ARM64_4K_PAGES
+	return HPAGE_SIZE;
+#else
+	return CONT_PTE_SIZE;
+#endif
+
+#else
+	extern bool efi_nokaslr;
+
 	return efi_nokaslr ? MIN_KIMG_ALIGN : EFI_KIMG_ALIGN;
+#endif
 }
 
 #define EFI_ALLOC_ALIGN		SZ_64K
-- 
2.34.1


