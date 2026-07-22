Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E005AC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YcJTlW57pa2SRNzOBqjpcFzbf2kkrPtxIXQAzYDgTo4=; b=YitunDrWl+HWQ81IWK8YFw2gu9
	NE7/C+uP3zHep5JKRWqkhGIaHcn3hWFpR3voptfDFFy0g7+dyVNcYyDwzvKDXzWZ7KUoEGy+w9qUs
	8T3D37w4hRDTUyi5WgUnQ5xTjJuo1tta8cCJwFIPpvKGP75C2+oznACzKdvyxxM1gbxPa6RxWpzoj
	+PyW5SIxeA/tswtx9rCtCc+pov3aHhhhHgbgWMXGXap69fgrNrdgJ/p/NfHcj9YZIW58mD/L6qFHA
	Dx53TKkys+zYRDH/QqHcyHK1KKVXqWmq8z7mOnOwDOQe5Ck/VSKiDe42/uOR+etG6/dgyyMYGiCv1
	ljPa2IZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmagI-0000000CSAZ-18L2;
	Wed, 22 Jul 2026 17:24:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmagF-0000000CS9h-2W2J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:24:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 076C11595;
	Wed, 22 Jul 2026 10:24:21 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D1AC3F66F;
	Wed, 22 Jul 2026 10:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784741065; bh=5oB/f5ZN6nIXzfIKW5WWeskRkoyN00cWH3ajY24YuCg=;
	h=From:To:Cc:Subject:Date:From;
	b=mg3I3O8UWGl64d/oBvF7JXm1Zu4MC+bLV0oE0Kqo0AEKxxYgEu4UhapRadKwpaaJS
	 rn1iMzlFoRiDD3Gp1jv1nX0TYFpKJVLK3TptrYg94yZUX4Esi7QqZahwHOqo1pqTK/
	 0dDRSEusg3lGtUnKQvC/ZUnv5BKrdhkAiw7wfQHg=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org
Cc: alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] perf: Generic hotplug/cpumask for system PMUs
Date: Wed, 22 Jul 2026 18:24:16 +0100
Message-ID: <cover.1784653319.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_102427_674657_BFFCDC1F 
X-CRM114-Status: UNSURE (   9.98  )
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

Hi all,

Here's my take on finally trying to clean up the longstanding PMUs vs.
CPU hotplug can of worms. Patch #1 is the thing to look at; patch #2
is included as an example of how it simplifies my "favourite" driver
(in fact arm-cmn actually gets one of the least-negative diffstats on
offer, but it's the one I can test on a box under my desk). I'll save
the remaining bulk-conversion noise for a follow-up if and when.

For simplicity I've framed this around the system PMU use-case, since
consolidating their whole cpumask/migration business is the big win
here, and isn't all that easy to do in separate stages. However, the
design does also allow for any driver to now benefit from implementing
the init_cpu/exit_cpu ops in place of managing their own cpuhp state;
only the automatic filtering and context migration is tied to the new
cpumask-specific scope.

Thanks,
Robin.


Robin Murphy (2):
  perf: Generic hotplug/cpumask for system PMUs
  perf/arm-cmn: Switch to generic cpumask

 drivers/perf/arm-cmn.c     | 96 +++++++++-----------------------------
 include/linux/perf_event.h | 19 ++++++++
 kernel/events/core.c       | 76 ++++++++++++++++++++++++++----
 3 files changed, 108 insertions(+), 83 deletions(-)

-- 
2.54.0.dirty


