Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04429E81BC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=opfrnp35dPp83Ydd0CdXth+jzeoQtf0NhQtQp++rgoE=; b=ckI1HROju7ruSOuDcjBdLHwEl8
	YSp1Rwr8KQ87DNEi+74m+Uc1tna1Xxe13Wso0UvyrecB8CVtGUmZ8S/KgOeQ+oxwexJyfB4M5Uwse
	aQJUTQ9J8cJxW5lU4IHb2KUF8TJ/LSuFtE2egMDeQQS61jee+4PWbbaCygqZCzfMcGpQDywm32AUq
	Kpega22+d4qoJzpSED61BW3UzRAwRyaa7tTR+BcB7EMLUXuZaLSeWTttoHLTcMg+wz5cAmt8PDEkT
	AVU/0PsyRbSDNEKqOvLvddiUvEx9QFb/PQJUpodhqeo25+5E9BWoOKFmgVz8/SOUfJ2tuSEdUo5rL
	34EpXwtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpR61-0000000FPlW-2q94;
	Mon, 09 Feb 2026 13:14:33 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpR5w-0000000FPka-3Z9j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 13:14:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=opfrnp35dPp83Ydd0CdXth+jzeoQtf0NhQtQp++rgoE=;
	b=NYOZtJiL6+EKta10OxqGbCO86ppwqOk82YX/vDvIQmWUGWur+16L954RYwLKVuJ9fOyi0g+a2
	4iVvWA9rugiZqKhNWu9uCqWBaf6QbH1YXgSVNyBLHWdRwqJ3Azev21EFoz0C8Tho90ZRPYI9jJo
	pZ2nK0nn6ajwDUWhMJFD0HI=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4f8lQm2hZzz1cyNr;
	Mon,  9 Feb 2026 21:09:36 +0800 (CST)
Received: from kwepemg500007.china.huawei.com (unknown [7.202.181.44])
	by mail.maildlp.com (Postfix) with ESMTPS id 57EBD40565;
	Mon,  9 Feb 2026 21:14:13 +0800 (CST)
Received: from kwepemj500003.china.huawei.com (7.202.194.33) by
 kwepemg500007.china.huawei.com (7.202.181.44) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Feb 2026 21:14:13 +0800
Received: from kwepemj500003.china.huawei.com ([7.202.194.33]) by
 kwepemj500003.china.huawei.com ([7.202.194.33]) with mapi id 15.02.1544.011;
 Mon, 9 Feb 2026 21:14:07 +0800
From: "yezhenyu (A)" <yezhenyu2@huawei.com>
To: "rananta@google.com" <rananta@google.com>, "will@kernel.org"
	<will@kernel.org>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "dmatlack@google.com" <dmatlack@google.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, zhengchuan <zhengchuan@huawei.com>,
	Xiexiangyou <xiexiangyou@huawei.com>, "guoqixin (A)" <guoqixin2@huawei.com>,
	"Mawen (Wayne)" <wayne.ma@huawei.com>
Subject: [RFC][PATCH] arm64: tlb: call kvm_call_hyp once during
 kvm_tlb_flush_vmid_range
Thread-Topic: [RFC][PATCH] arm64: tlb: call kvm_call_hyp once during
 kvm_tlb_flush_vmid_range
Thread-Index: AdyZxXBD7SmLF28zTvuqoGutV5f5rw==
Date: Mon, 9 Feb 2026 13:14:07 +0000
Message-ID: <42bcdd9100bf4c63b79d2b72bd6db951@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [100.102.28.14]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_051429_904926_DCF2DDC2 
X-CRM114-Status: GOOD (  10.18  )
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

From 9982be89f55bd99b3683337223284f0011ed248e Mon Sep 17 00:00:00 2001
From: eillon <yezhenyu2@huawei.com>
Date: Mon, 9 Feb 2026 19:48:46 +0800
Subject: [RFC][PATCH v1] arm64: tlb: call kvm_call_hyp once during
 kvm_tlb_flush_vmid_range

The kvm_tlb_flush_vmid_range() function is performance-critical
during live migration, but there is a while loop when the system
support flush tlb by range when the size is larger than MAX_TLBI_RANGE_PAGE=
S.

This results in frequent entry to kvm_call_hyp() and then a large
amount of time is spent in kvm_clear_dirty_log_protect() during
migration(more than 50%). So, when the address range is large than
MAX_TLBI_RANGE_PAGES, directly call __kvm_tlb_flush_vmid to
optimize performance.

---
 arch/arm64/kvm/hyp/pgtable.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 874244df7..9da22b882 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -675,21 +675,19 @@ static bool stage2_has_fwb(struct kvm_pgtable *pgt)
 void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
 				phys_addr_t addr, size_t size)
 {
-	unsigned long pages, inval_pages;
+	unsigned long pages =3D size >> PAGE_SHIFT;

-	if (!system_supports_tlb_range()) {
+	/*
+	 * This function is performance-critical during live migration;
+	 * thus, when the address range is large than MAX_TLBI_RANGE_PAGES,
+	 * directly call __kvm_tlb_flush_vmid to optimize performance.
+	 */
+	if (!system_supports_tlb_range() || pages > MAX_TLBI_RANGE_PAGES) {
 		kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
 		return;
 	}

-	pages =3D size >> PAGE_SHIFT;
-	while (pages > 0) {
-		inval_pages =3D min(pages, MAX_TLBI_RANGE_PAGES);
-		kvm_call_hyp(__kvm_tlb_flush_vmid_range, mmu, addr, inval_pages);
-
-		addr +=3D inval_pages << PAGE_SHIFT;
-		pages -=3D inval_pages;
-	}
+	kvm_call_hyp(__kvm_tlb_flush_vmid_range, mmu, addr, pages);
 }

 #define KVM_S2_MEMATTR(pgt, attr) PAGE_S2_MEMATTR(attr, stage2_has_fwb(pgt=
))
--
2.43.0






