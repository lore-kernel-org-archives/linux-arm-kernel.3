Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B06FD9E32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 03:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BA6A7leQRevCce304CqKBN+0/oyAnNHxRWwEBqBsG+E=; b=R6p+OGO68ucubVHnTWMxycTvdt
	T3oGDwM5Dp+rEDlO69elWL6fQHiOPFZZcEbREg2iI5L1nKPbl5f9YkSIJUEFOk7QCUyAo2IIixtff
	91YHlTIhW5Ts/J4T146A2FKnt3uY4BlxMzmaw+qI13oze6mIU4HUwGHi6nLp+7GFIYNmVTg6XCbJM
	E1D+u0L6XqBAMh/rIw/PnSgR4Y5LWGclsVJsi5nMFZepXKUbs0Q9zEPPhS8vx3IENJPc46BK/aQmb
	mdc5UpFPpqVTXIqMk4vmj4PDriPkqHXUUIHeTVJSjY9A/USQBAwkIh3+97RaGuJ6xQ+l5VqahGee4
	F4TuLn0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoON-00000007Zyu-0D6d;
	Fri, 27 Feb 2026 03:19:51 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoOJ-00000007ZyK-2Et6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 03:19:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BA6A7leQRevCce304CqKBN+0/oyAnNHxRWwEBqBsG+E=;
	b=RY5AFvJJt8a6Qjfr72rQ2Unt/sLAMtQ7YxvYhYmdX39/yQg9noULFvy3VpvteumVNp7+UzDV4
	QfTi88EjmuoXFx4MURtF2k24cwuzrsZoaB0wgGuQSnbVl5eRFAD7lSOcXfcIFhWZJz9zwp9OFuK
	T/4m0n1ONVNEKJP7e0LAey0=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fMYN45jGwz1prLF;
	Fri, 27 Feb 2026 11:14:44 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 166F240561;
	Fri, 27 Feb 2026 11:19:35 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 27 Feb
 2026 11:19:34 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<broonie@kernel.org>, <yeoreum.yun@arm.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH 0/2] selftests/arm64: Add cmpbr_sigill() and fix sve2p1_sigill() for hwcap test
Date: Fri, 27 Feb 2026 11:19:31 +0800
Message-ID: <20260227031933.4103333-1-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_191948_088666_9A3C1C80 
X-CRM114-Status: UNSURE (   9.91  )
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

This patch series adds and fixes two selftests in the arm64 hwcap
test suite.

Patch 1/2 implements the cmpbr_sigill() test to correctly detect
the presence of the CMPBR extension. The test uses the CBEQ
instruction, which is valid only if the CPU supports the extension.
If supported, a branch is taken and the UDF instruction is skipped,
avoiding a SIGILL. Otherwise, the UDF is executed and a SIGILL
is generated.

Patch 2/2 fixes the sve2p1_sigill() test to correctly detect the
FEAT_SVE2p1 feature. Previously, the test incorrectly assumed that
the presence of FEAT_SVE2.1 implied support for the BFADD
instruction, which actually depends on the FEAT_SVE_B16B16 feature.
The test is updated to use the LD1Q instruction, which is
unambiguously implied by FEAT_SVE2p1.

These changes improve the accuracy and reliability of the selftests
for arm64 hardware capability detection.

References:

CBEQ: https://developer.arm.com/documentation/ddi0602/2025-12/Base-Instructions/CB-cc---register---Compare-registers-and-branch-?lang=en
BFADD: https://developer.arm.com/documentation/ddi0602/2025-12/SVE-Instructions/BFADD--unpredicated---BFloat16-add--unpredicated--?lang=en
LD1Q: https://developer.arm.com/documentation/ddi0602/2025-12/SVE-Instructions/LD1Q--Gather-load-quadwords-?lang=en
ID_AA64ZFR0_EL1: https://developer.arm.com/documentation/ddi0601/2025-03/AArch64-Registers/ID-AA64ZFR0-EL1--SVE-Feature-ID-Register-0?lang=en

Yifan Wu (2):
  selftests/arm64: Implement cmpbr_sigill() to hwcap test
  selftest/arm64: Fix sve2p1_sigill() to hwcap test

 tools/testing/selftests/arm64/abi/hwcap.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.33.0


