Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2357FC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uD/le38L7H4MWPEqTkCfnYrHEznDm74M/5CQRYxFSEw=; b=MuhVaYwnufJNl15viiQ+ER9gmB
	H+zkAfnE+yFPTfDbaHIS98Crd90FDngpfCbFuf264aJhNPBNuXuGsRFHRVxcYwemKnrdvzxLozLWt
	4KlB/fDmmGhgHoszjrIOYChh2PMz3ksM1IMf5VxYmc7WuYHtLzM3hePeUr3ecifmjQjCqIMVCsIHU
	sEFwge3LJLInsoQIA+2rVUsikvGde6KHGODRw6QzR9SqJx8kJQrghuFPE1/TPySUUvXC7FtDorXjm
	IpkrVnbn0YI4kSS5e3kZ61K5ONr4sQLMd5XOFDDoAetMzb3JX7X5ODTs+mb/kKdwdTbN4bGnErgFy
	KrSd7BGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ebk-0000000BIDv-0noq;
	Wed, 09 Sep 2026 09:28:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ebi-0000000BIBO-41vf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 09:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=uD/le38L7H4MWPEqTkCfnYrHEznDm74M/5CQRYxFSEw=; b=ZpHdn+RYV1zAPZIcgsu2Ie0D0p
	Plr4T3LFWOt+1v4rTgfZOBAqh/xIgmd4W7MHxcsJdKuJK/VO0L9QosHhy7QSn02QjtebZVWDeqaz4
	N6MaNdGporxsTm44QtytbX29lTXIRSIJsYqvWzO3BCbiJzIqIFAHXMJ1c62M645p22p8zrJhC2BaJ
	0dLl98mX7uahPHuQE1LzEVeqsyNE3OZKeYb2BOG6v3mDHTcWAYrCVp9fENO/SFZa1YiRtw3piLLWV
	3jphkKUlGIvpGaIcQ7DvrvRdHhTbz3qbSqh82ytwQfgDNieDLkhftBqTz1qD+9v7OUBZHDTd90JCz
	NrgCg7lQ==;
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Ebg-00000000zof-0CHi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:28:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uD/le38L7H4MWPEqTkCfnYrHEznDm74M/5CQRYxFSEw=;
	b=ldFaxn2U3xz8nsmyFbzrsh4qQ6czzb/jEGiOl8c/LzX2rZ6q7TMtvticJzcTl847AE6rxoOKO
	Ae0y15A+0xqy5c3moeVm/5+m9Vu1ncHjgMaoUM4MeE20xIOio5xgiLsfWnpmanQhXVxUn2pMtCQ
	CV+sHlpS63nq3Hg1f49vzJo=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hfwDL75Tsz1T4Fq;
	Wed,  9 Sep 2026 17:16:50 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 7D78040575;
	Wed,  9 Sep 2026 17:28:22 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 17:28:21 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<ryan.roberts@arm.com>, <peterx@redhat.com>, <dave.jiang@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH 0/3] arm64: Add support for PUD THP
Date: Wed, 9 Sep 2026 17:00:15 +0800
Message-ID: <20260909090018.1991485-1-tujinjiang@huawei.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.85.135]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_102840_483646_0A48F6D2 
X-CRM114-Status: UNSURE (   8.71  )
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
  arm64: Add support for PUD THP

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


