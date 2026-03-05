Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01331EFCE57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 01:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nrn7dhxHopK9fUC/zHXWFahWmOlp1m/cTtjL8628MMI=; b=WObwrf4qrY0NIo/QI85geHrktc
	rOlESC5sbZkPPtXjaYBlPcuEI0gocb0tkqUhy8AEOu6XOsYgIbxUSlyX4qbQE3BafnCCZSHyNqiP4
	CSbFXjnKJfxTLt+5+qXFIw3XQ4MP+ZNx/wJJTGYxRDYokB41Nng9UwyTT0zE/LhkkCeRRWLc9sZGz
	3aLia1GloJsDhmrbMPmKjD1SlOEHH/M7eoPapixlBzKMZQkMlJYoeZJSjVWebIZ21MNHaFSX6jU1l
	DTUpvUTQR7OQq6772FkPDlIVLYrqCNYa4JndjDAmDVYhXj8kQ62llXWjujO9RYrkickPUcnNoyjbV
	eoI9fJlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxxeQ-00000000kbn-0bkc;
	Thu, 05 Mar 2026 01:37:18 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxxeL-00000000kZq-222v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 01:37:15 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Nrn7dhxHopK9fUC/zHXWFahWmOlp1m/cTtjL8628MMI=;
	b=G79Eu5nqSquaqCpwbtHF19hIncxdaY2ImMju64HKIxgyjHAmCKJXn8Ina10S3JhteiB/M9Q93
	sipw1D1n5XqsgmTZzm/sXj3aJ9lxBldpgH/qeoA4zuxgvrZanK5g0hruK1Ycyxp3PJqXEif9xgc
	fD+hwbM+TqZrWLxd72aYDSA=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fRBqG2q0Wz12LHt;
	Thu,  5 Mar 2026 09:32:26 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 7B9E5202D7;
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
Subject: [PATCH v2 1/2] selftest/arm64: Fix sve2p1_sigill() to hwcap test
Date: Thu, 5 Mar 2026 09:36:37 +0800
Message-ID: <20260305013638.992301-2-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260305013638.992301-1-wuyifan50@huawei.com>
References: <20260305013638.992301-1-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_173713_698423_7DC6FB68 
X-CRM114-Status: GOOD (  11.86  )
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

The FEAT_SVE2p1 is indicated by ID_AA64ZFR0_EL1.SVEver. However,
the BFADD requires the FEAT_SVE_B16B16, which is indicated by
ID_AA64ZFR0_EL1.B16B16. This could cause the test to incorrectly
fail on a CPU that supports FEAT_SVE2.1 but not FEAT_SVE_B16B16.

LD1Q Gather load quadwords which is decoded from SVE encodings and
implied by FEAT_SVE2p1.

Fixes: c5195b027d29 ("kselftest/arm64: Add SVE 2.1 to hwcap test")
Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 9d2df1f3e6bb..c2661a312fc9 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -475,8 +475,8 @@ static void sve2_sigill(void)
 
 static void sve2p1_sigill(void)
 {
-	/* BFADD Z0.H, Z0.H, Z0.H */
-	asm volatile(".inst 0x65000000" : : : "z0");
+	/* LD1Q {Z0.Q}, P0/Z, [Z0.D, X0] */
+	asm volatile(".inst 0xC400A000" : : : "z0");
 }
 
 static void sve2p2_sigill(void)
-- 
2.33.0


