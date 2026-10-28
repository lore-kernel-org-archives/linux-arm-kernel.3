Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D2C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 12:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OPs9QZPg;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=YUmINJPV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kWtcaKJ6IQ4bNn/v2x4kVI23f6xFQA7cEBIWxn7bv2E=; b=OPs9QZPgd8RFQfOwjbBKHx/M4n
	vomrqKFUIuldBRbvEeYLG0bxnI8VAcTi/Sl81qcL+qw0pFGP4X+Txz1AYfhxpfgXdSv10VhnzTNvN
	ouAS+nflIVufBuQriUSHR1xb/1c1qjPyXZ4lXFHKws8jV9cJEcAE6oGl0Lol6PryvhGEVFC2rk2OU
	N5uk3T0sqn3T1MNY5EDO01MqtVzP/ENCfN3B9tacn9a75/IoLA8Z8F5j7u7SeAuPmBSpUEVgsvm1+
	Gw9u6O0BRJkSIZQR5PuNTYbuo10x7BBxJyl+Kf9KccVIMQCHK4c0LrRdgr6v0mhp/7V7mmnoZT5x2
	q0Ai5oKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2Xs-00000006wFl-2qD7;
	Wed, 28 Oct 2026 12:14:20 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2Xp-00000006wEe-1MTt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 12:14:19 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kWtcaKJ6IQ4bNn/v2x4kVI23f6xFQA7cEBIWxn7bv2E=;
	b=YUmINJPV+Q3oJwe5jmGuMlVsZ/ZuNKiMnC9t0XtvD097CkYW79EqI75EBOltG/oPpfkRUKLcR
	Ba184Ivdw+AhlrZ5LP230OzitIs6YI7PkgK0pVvu3qnuwje5Nuu+fC2Y5qXazNbNA1z+xJYFKDX
	B4aL0SVTQvFJVxMvNbpeFno=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jF5r55Wpfz1K9CK;
	Wed, 28 Oct 2026 20:13:57 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 34D9F4058A;
	Wed, 28 Oct 2026 20:14:06 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 20:14:04 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<ryan.roberts@arm.com>, <peterx@redhat.com>, <dave.jiang@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH RESEND 0/3] arm64: Add PUD THP support for DAX and pfnmap
Date: Wed, 28 Oct 2026 20:14:01 +0800
Message-ID: <20261028121404.853944-1-tujinjiang@huawei.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_051417_860433_F79B55A6 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds PUD THP support for arm64, enabling PUD THP for DAX
and pfnmap.

Patch 1 moves the identical pudp_invalidate() implementations from x86
and riscv to a generic location so arm64 can reuse it.

Patch 2 is a minor cleanup that simplifies pmd_special/pmd_mkspecial.

Patch 3 adds the necessary PUD page table helpers and selects
HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.

Jinjiang Tu (3):
  mm: define generic pudp_invalidate() implementation
  arm64: simplify pmd_special and pmd_mkspecial
  arm64: Add PUD THP support for DAX and pfnmap

 arch/arm64/Kconfig                           |  1 +
 arch/arm64/include/asm/pgtable.h             | 71 +++++++++++++++-----
 arch/powerpc/include/asm/book3s/64/pgtable.h |  1 +
 arch/riscv/include/asm/pgtable.h             |  3 -
 arch/riscv/mm/pgtable.c                      |  9 ---
 arch/x86/include/asm/pgtable.h               |  3 -
 arch/x86/mm/pgtable.c                        | 12 ----
 include/linux/pgtable.h                      |  7 ++
 mm/pgtable-generic.c                         | 14 ++++
 9 files changed, 77 insertions(+), 44 deletions(-)

-- 
2.43.0


