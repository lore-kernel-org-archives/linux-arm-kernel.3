Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCB8C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fnWWKY3jUyvFAVGnDhy667vWqgMgOhf/RxaMoH5KneI=; b=wk9FnecwtTJL0nEdkIYqjuthZR
	GwmXVWrNB5NKPvL+3QWZV8HPVVx2Vyg/kUaIwiMQ3sfGUU8D4icYzV9rAkFgqM3rG9fWktI0g+9Oc
	GNbOrM38n5OgR+abKrxPJDi3ZJuvbDyC4ba8IwLfo0Qbsu73iLEqfpdQTa+sN45jmPgbjDNKZfOXB
	0zNFwJB9isBmXBMZiehE73WOWXFqqe54NRfN604DFLML38MgPyW/IxbmQ6RZ4m+6VpjchCLA2GSgr
	0YcXjlPSn0ko+oVjLWlaTSXTWXe3bNZX2tn8Xc1fWoYuXpXTlydGZ2E3gXuXoAMBd5hzfQdmByE4B
	NAuDcjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeNb-00000001kha-1MOj;
	Fri, 17 Jul 2026 08:57:11 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeNV-00000001ked-0LF7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:57:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fnWWKY3jUyvFAVGnDhy667vWqgMgOhf/RxaMoH5KneI=;
	b=hyXUlhrFwbquaS8RoR87XIRNROzKPpzzdr+iK2dVUPXUc2UyDJwfa06aM+cVQI27IQowhZBIk
	hHvXfd0jygON+SrJxlCnf/Iyoprgl6hytUQUxlc5gTzyXoeCxaiOihrL+PSQd4KJprzhrF6VUYr
	LD/GMhcvOgKkzR9Nxy8ENs8=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4h1k7R15KqzRhQR;
	Fri, 17 Jul 2026 16:47:31 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7F31620333;
	Fri, 17 Jul 2026 16:56:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 17 Jul
 2026 16:56:48 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 0/2] kselftest/arm64: Add two arm64 kselftests for orig_x0 issue
Date: Fri, 17 Jul 2026 16:56:55 +0800
Message-ID: <20260717085657.3600248-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_015705_283780_E8870398 
X-CRM114-Status: UNSURE (   7.99  )
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

Link: https://lore.kernel.org/all/20260716120640.6590-1-will@kernel.org/
Link: https://lore.kernel.org/all/202607152004.DEA95D63@keescook/

Jinjie Ruan (2):
  kselftest/arm64: Add seccomp ptrace x0 bypass test
  kselftest/arm64: Add SECCOMP_RET_TRACE x0 bypass test

 tools/testing/selftests/arm64/abi/.gitignore  |   2 +
 tools/testing/selftests/arm64/abi/Makefile    |   2 +-
 .../arm64/abi/seccomp_ptrace_x0_bypass.c      | 181 +++++++++++++
 .../arm64/abi/seccomp_ret_trace_x0_bypass.c   | 249 ++++++++++++++++++
 4 files changed, 433 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
 create mode 100644 tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c

-- 
2.34.1


