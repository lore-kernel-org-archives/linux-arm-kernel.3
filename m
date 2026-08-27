Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785AEC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMZ5AFZhqeXmEWrdBGYUKt+USNzuDSrHR09vQq45iZE=; b=JPRIsf7mgSJmQ30kLpul09IQAS
	h3knw9BaCSJErnodqV2k6+lIk3sqZcgYetK3+xW/gqKQ7/cZXZ49aD3d7wq2oF+FLoKBZ1n2p4aLr
	Uc3H6xaKREJrxJsiajxMl9/wcyTzk86kDDVKSpaGbZ2X2em810bRS8a0ZUQAcrf6S9bwlXOYl6fb7
	q1SOathwmSPC+mF2+DgHCT16p7kZOW8koN+zK9M3Z0LmLOBeqRusFNg57tN4Vw6iVqGOINNHODiwF
	B1s03LMDLjuw8Q8ZKnKH85Zr542HIQ6aNEkxXAQuAu8m+0ekvfejLdp0mdJssYyz6KkXK4Z7eveKF
	dCAcz+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuF-00000004JkG-3P2n;
	Thu, 27 Aug 2026 16:24:48 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuC-00000004JhF-1eNS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:24:46 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=oMZ5AFZhqeXmEWrdBGYUKt+USNzuDSrHR09vQq45iZE=;
	b=rrMP/6IgeCyguD1XBUymEDs46U3PH2nQcOVjRM7NWTwXIBiKAc+v2wRktTvtj3dnhx+/A68o2
	ujUyEiKFJ0FYG9oClz7vuPt/2Wbq9ooYp17fibHkCYasLVZkNzjTArv/0GTYFmcY9o+umZmAbaw
	okn+6XU8oRhyoEmAUSQddQg=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KC66nqzHnH5L;
	Fri, 28 Aug 2026 00:23:59 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id D785540570;
	Fri, 28 Aug 2026 00:24:35 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:35 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 02/18] arm64: align kernel text and rodata
Date: Fri, 28 Aug 2026 00:11:42 +0800
Message-ID: <20260827161158.3618409-3-panov.nikita@huawei.com>
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
X-CRM114-CacheID: sfid-20260827_092444_918267_3FF6BFCF 
X-CRM114-Status: GOOD (  10.36  )
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

In order to comply with AArch64 page table entries type -
table and block descriptor format, we need to use correct alignment
for replicated memory areas. Physical blocks allocated for replicated areas
must have the same offset for all replicas and same relative offset
to the virtual address.
For simplicity, we just use an explicit alignment for kernel sections.
If 4K pages are used,  2MB alignment should be applied.
Otherwise CONT_PTE_SIZE alignment is used.

Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
Acked-by: Denis Darvish <darvish.denis@huawei.com>
Signed-off-by: Nikita Panov <panov.nikita@huawei.com>
---
 arch/arm64/kernel/vmlinux.lds.S | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index af1d72020976..aaf07e926c54 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -192,6 +192,13 @@ SECTIONS
 		_text = .;
 		HEAD_TEXT
 	}
+#ifdef CONFIG_KERNEL_REPLICATION
+#ifdef CONFIG_ARM64_4K_PAGES
+	. = ALIGN(PMD_SIZE);
+#else
+	. = ALIGN(CONT_PTE_SIZE);
+#endif
+#endif
 	.text : ALIGN(SEGMENT_ALIGN) {	/* Real text segment		*/
 		_stext = .;		/* Text and read-only data	*/
 			IRQENTRY_TEXT
@@ -207,10 +214,25 @@ SECTIONS
 	}
 
 	. = ALIGN(SEGMENT_ALIGN);
+#ifdef CONFIG_KERNEL_REPLICATION
+#ifdef CONFIG_ARM64_4K_PAGES
+	. = ALIGN(PMD_SIZE);
+#else
+	. = ALIGN(CONT_PTE_SIZE);
+#endif
+#endif
 	_etext = .;			/* End of text section */
 
 	/* everything from this point to __init_begin will be marked RO NX */
+#ifdef CONFIG_KERNEL_REPLICATION
+#ifdef CONFIG_ARM64_4K_PAGES
+	RO_DATA(PMD_SIZE)
+#else
+	RO_DATA(CONT_PTE_SIZE)
+#endif
+#else
 	RO_DATA(PAGE_SIZE)
+#endif
 
 	HYPERVISOR_RODATA_SECTIONS
 
-- 
2.34.1


