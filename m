Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D08D65C7B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 18:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fmep8Nc1B6kDFyGzd9G2guDjncJ13gNSdPL2Ojo4FKc=; b=EtCe6Hyy2vuy4BTEf1o8VUPuMk
	62erViQ7t5cWu5Hcj/D5rJj/Dqa5GxHFVrtDHUp3pl55dggv4Badky5scqLglqvD3WNDmr3CcA6CH
	8vyfq+5motMu964sMvzqexKMCdHiID8WGyiDDGxZF0ybblMvJJlkbrPEBFOjKl51RN81Xg92K53zk
	AE22QxON/kQOdKSQO4O7PHrjZ+DCMP6pv/7W3m8qRP66Wl1HZHhMPuDTu6IQdYmheUalcQrnTeRKK
	3/PSWcoVshMAM4LotOpxz6DGEP5em8on35cR0At4EQ8tOTOnBMQqrnVF93N6ciQOgXiIRbebp1QaT
	0/MW/pZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVw8F-00000007GIW-2zYR;
	Wed, 17 Dec 2025 18:20:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVw8D-00000007GIC-0yNu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 18:20:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04AE1339;
	Wed, 17 Dec 2025 10:20:05 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F02553F5CA;
	Wed, 17 Dec 2025 10:20:08 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com,
	dev.jain@arm.com,
	yang@os.amperecomputing.com,
	chaitanyas.prakash@arm.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	lorenzo.stoakes@oracle.com,
	ardb@kernel.org,
	jackmanb@google.com,
	vbabka@suse.cz
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 0/2] fix wrong usage of memory allocation APIs under PREEMPT_RT in arm64
Date: Wed, 17 Dec 2025 18:20:05 +0000
Message-Id: <20251217182007.2345700-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_102013_762907_1F6D9D4C 
X-CRM114-Status: UNSURE (   5.46  )
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

Under PREEMPT_RT, calling generic memory allocation/free APIs
(e.x) __get_free_pages(), pgtable_alloc(), free_pages() and etc
with preemption disabled is not allowed, but allow only nolock() APIs series
because it may acquire a spin lock that becomes sleepable on RT,
potentially causing a sleep during page allocation
(See Documentation/core-api/real-time/differences.rst, Memory allocation section).

However, In arm64, __linear_map_split_to_ptes() and
__kpti_install_ng_mappings() called by stopper thread via stop_machine()
use generic memory allocation/free APIs.

This patchset fixes this problem and based on v6.19-rc1

Patch History
==============
from v1 to v2:
  - drop pagetable_alloc_nolock()
  - following @Ryan Roberts suggestion.
  - https://lore.kernel.org/all/20251212161832.2067134-1-yeoreum.yun@arm.com/


 arch/arm64/mm/mmu.c | 235 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 183 insertions(+), 52 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


