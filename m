Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904E2EFCE58
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 01:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v4C33E1hX+Vidxc1X+jNPqKj3AvWKe8bmB8EyKplG3U=; b=IaGKeCO/Tvya2Dy4trg02aFmrw
	EOf8N7VuOLHDDdZSPK728cS1BzwR5aUHY2c7X8Urdn5BPZV2vCS9/JlSA7bdg4OOygJj/318WmUWQ
	MFL4S4ru6Wo8dPx+9n3nsz2RBXJZ+qldwerQWb48W/pAoB6KT1eU5uGr5NFKXv7COzehLbdkXptlP
	90JtLY89i/2TSbWB4Zo2Jgz9ylEW5bZESDFWEun88pMue2NYIft3FxGdM12QmG6FtKBGzev/7nxVP
	J+02i3p9YRiJwGCSrkAhmfLIx3bn/7BRqLE2z3X5KPL3adH5SsfcdbbWOAach24YPv0++vuv8hSXE
	Xp3yBtCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxxeO-00000000kb2-1Upo;
	Thu, 05 Mar 2026 01:37:16 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxxeL-00000000kZo-1zuq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 01:37:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=v4C33E1hX+Vidxc1X+jNPqKj3AvWKe8bmB8EyKplG3U=;
	b=IinlKN/cVzrSW9tkjALJJ2POGRlDb+TE/+BY10frgaprTHA0kZ4DR2hS57NBAhWgIHS35VOC+
	Z+Mz7Ci3+YiP8X0pWzsM7l2ETiiC16MiHjpy//EqN4+Uz2BdQN7e6rlEbctqJ1CXYNHE0LIe/wM
	3J22aNA5sf895TU1nLsjY58=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fRBqF5PL1znTbP;
	Thu,  5 Mar 2026 09:32:25 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 0780240565;
	Thu,  5 Mar 2026 09:37:02 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 5 Mar
 2026 09:37:01 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<broonie@kernel.org>, <yeoreum.yun@arm.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH v2 0/2] selftests/arm64: Fix sve2p1_sigill() and add cmpbr_sigill() for hwcap test
Date: Thu, 5 Mar 2026 09:36:36 +0800
Message-ID: <20260305013638.992301-1-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_173713_684608_71C99BA7 
X-CRM114-Status: GOOD (  10.98  )
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

This patch series fixes and adds two selftests in the arm64 hwcap
test suite.

Patch 1/2 fixes the sve2p1_sigill() test to correctly detect the
FEAT_SVE2p1 feature. Previously, the test incorrectly assumed that
the presence of FEAT_SVE2.1 implied support for the BFADD
instruction, which actually depends on the FEAT_SVE_B16B16 feature.
The test is updated to use the LD1Q instruction, which is
unambiguously implied by FEAT_SVE2p1.

Patch 2/2 implements the cmpbr_sigill() test to correctly detect
the presence of the CMPBR extension. The test uses the CBEQ
instruction, which is valid only if the CPU supports the extension.
If supported, a branch is taken and the UDF instruction is skipped,
avoiding a SIGILL. Otherwise, the UDF is executed and a SIGILL
is generated.

These changes improve the accuracy and reliability of the selftests
for arm64 hardware capability detection.

References:

CBEQ: https://developer.arm.com/documentation/ddi0602/2025-12/Base-Instructions/CB-cc---register---Compare-registers-and-branch-?lang=en
BFADD: https://developer.arm.com/documentation/ddi0602/2025-12/SVE-Instructions/BFADD--unpredicated---BFloat16-add--unpredicated--?lang=en
LD1Q: https://developer.arm.com/documentation/ddi0602/2025-12/SVE-Instructions/LD1Q--Gather-load-quadwords-?lang=en
ID_AA64ZFR0_EL1: https://developer.arm.com/documentation/ddi0601/2025-03/AArch64-Registers/ID-AA64ZFR0-EL1--SVE-Feature-ID-Register-0?lang=en

Change Log:
v1:
Fixes the sve2p1_sigill() in patch 1.
Implements cmpbr_sigill() by the single asm volatile statement.
Updated the comments.

v1 can be found at:
https://lore.kernel.org/all/20260227031933.4103333-1-wuyifan50@huawei.com/

Yifan Wu (2):
  selftest/arm64: Fix sve2p1_sigill() to hwcap test
  selftests/arm64: Implement cmpbr_sigill() to hwcap test

 tools/testing/selftests/arm64/abi/hwcap.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.33.0


