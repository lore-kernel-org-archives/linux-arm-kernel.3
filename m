Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE102C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 08:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uJ79qPzp8tIhAiU3rMgJbhgxhoX8UnanAQA0Qwctxmg=; b=JhY0GD8mnwgIP9ntdAbUO294Z1
	FbSHjkLOAMxZ3nFowIJhY4eMVxRMZNhwUQvebXbQiOT6e6F6pcEARzAW2Bic/tZdlQqVQIVq/8wEe
	tK9oYI/eebyps1sa1HtxHFu0V1Z+n68DZx2gvSTGLaJCbHBsXhoZg2Yas048djXAD/2qSgqd15F8K
	mGxQ6L5Nxc4wk+txh4fpjlxWdBngCtHNgtfo3tPkqXSUo8e1TjBubXzZL0jXgcA6RsF2+fMp1Zen8
	16m+Go1059RWsxjnk18VXhkrhYUehMu3xm+8Z04HqD3rJp7H3cE5fUSot9RX0wqcjOA0dYm3SzqgQ
	7E+AdjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljiv-00000006Eq6-3YeU;
	Mon, 20 Jul 2026 08:51:41 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljir-00000006Ep9-2eRd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 08:51:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uJ79qPzp8tIhAiU3rMgJbhgxhoX8UnanAQA0Qwctxmg=;
	b=y59Qo9ELPLHaCjmtQS81az0HA0Er+BT/T4LY5yq7gfu0/V6q5t80pOUq50pJRwrwdDkhuhiSZ
	IhSNIoT3cI8tyF/yxZGEgzag9JgRhU8M6AcQLnKOhXZQ63rm9g6pVSCRjEdYhHLv3W/oDb5w6ZO
	rp2/03W+Wa30WZLPRhgP4zk=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4h3Ysv4HTbzRhWS;
	Mon, 20 Jul 2026 16:42:11 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id CB1844056E;
	Mon, 20 Jul 2026 16:51:31 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 20 Jul
 2026 16:51:28 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 0/2]  kselftest/arm64: Add two arm64 kselftests for orig_x0 issue
Date: Mon, 20 Jul 2026 16:51:43 +0800
Message-ID: <20260720085145.247690-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_015138_137983_147F161B 
X-CRM114-Status: UNSURE (   9.04  )
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

Recently, a security issue related to orig_x0 was discovered and fixed
in arm64, but there are still no test cases covering it. Seccomp,
tracepoints, and audit can observe a stale value for x0 after a ptracer
or SECCOMP_RET_TRACE modifies x0.

As Kees suggested, this series adds two kselftests for arm64 that validate
the orig_x0 re-synchronisation fix in ptrace, the first one is for ptrace
update, the second one is for SECCOMP_RET_TRACE update.

Link: https://lore.kernel.org/all/20260717182758.17111-1-will@kernel.org/
Link: https://lore.kernel.org/all/20260716120640.6590-1-will@kernel.org/
Link: https://lore.kernel.org/all/202607152004.DEA95D63@keescook/

Changes in v2:
- Update the 2st testcase to cover the corner case pointed out by Sashiko[1].

[1]: https://sashiko.dev/#/patchset/20260716120640.6590-1-will@kernel.org

Jinjie Ruan (2):
  kselftest/arm64: Add seccomp ptrace x0 bypass test
  kselftest/arm64: Add testcase for SECCOMP_RET_TRACE orig_x0 bypass

 tools/testing/selftests/arm64/abi/.gitignore  |   2 +
 tools/testing/selftests/arm64/abi/Makefile    |   2 +-
 .../arm64/abi/seccomp_ptrace_x0_bypass.c      | 181 ++++++++++++++++
 .../arm64/abi/seccomp_ret_trace_x0_bypass.c   | 196 ++++++++++++++++++
 4 files changed, 380 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
 create mode 100644 tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c

-- 
2.34.1


