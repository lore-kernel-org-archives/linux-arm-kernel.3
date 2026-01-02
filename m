Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591C3FA3729
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hFu/Wt+kz5TeV9D0u4FVe6sV6yI+nx5xXApYV33ud6s=; b=sbjIVriQ60JjvyjOqHGJxQ18a5
	p6/zMuos2nMcdXkSWtC6wt3PqSrtwMR8JVp/xY+L5p3Ujea7Pzpj5VOMv8CaEDp03QYe299vDW5A8
	64p1jSGgDaVkCKpqNNm6BexKZN3YRNxrRglyLzyQXQw+Lm0hMXZciMK3BlGx4p8lE0gbywUlkFhdw
	UwEuflPU2QuLjdRJEC+ftdZJbKTlPD2y69TcW/R6PZ+A2eKzik9CSd8UMERAL4YCDeE9/nMngCoig
	1Qsh08NZmkR8Tt6F6fqixXZfeCn9nX6VplLMlUTR2cgVswIvhkrh84fB7JrhLW80fHuueW7WPZFmp
	Ug53KpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgm9-00000008PNW-1UcP;
	Fri, 02 Jan 2026 15:09:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgm6-00000008PMs-1pjq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 15:09:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0BBF497;
	Fri,  2 Jan 2026 07:09:00 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 825D03F5A1;
	Fri,  2 Jan 2026 07:09:04 -0800 (PST)
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
	vbabka@suse.cz,
	mhocko@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v4 0/3] fix wrong usage of memory allocation APIs under PREEMPT_RT in arm64
Date: Fri,  2 Jan 2026 15:07:33 +0000
Message-Id: <20260102150736.1378818-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_070910_516450_B20F724B 
X-CRM114-Status: UNSURE (   6.86  )
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
from v3 to v4:
  - rebase to v6.19-rc3
  - introduce pgtable_alloc_t
  - following several suggestions from @Ryan Roberts
  - https://lore.kernel.org/all/20251218194750.395301-1-yeoreum.yun@arm.com/

from v2 to v3:
  - remove split-mode and split_args.
    pass proper function pointer while spliting.
  - rename function name.
  - https://lore.kernel.org/all/20251217182007.2345700-1-yeoreum.yun@arm.com/

from v1 to v2:
  - drop pagetable_alloc_nolock()
  - following @Ryan Roberts suggestion.
  - https://lore.kernel.org/all/20251212161832.2067134-1-yeoreum.yun@arm.com/


Yeoreum Yun (3):
  arm64: mmu: introduce pgtable_alloc_t
  arm64: mmu: avoid allocating pages while splitting the linear mapping
  arm64: mmu: avoid allocating pages while installing ng-mapping for
    KPTI

 arch/arm64/mm/mmu.c | 243 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 188 insertions(+), 55 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


