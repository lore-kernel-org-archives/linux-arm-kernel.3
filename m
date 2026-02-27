Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F36FD9E34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 03:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPGb2TyziU/dFBTeP5RkyLgux5odcZyBVzlNY4Qr1LU=; b=W+IgGV9vRkKDqopZu5g+9aRba+
	bdQSzKYt0gNwIFFrATkKWMPv1QhrbVzhy1qfuWwWdAF1/3hddOIgO0v/0OL8LhPY4CqjaEkCBNQrn
	UkMw9rD/KrcNXwymD3hwCM7lnuABd/DyJtJnhgPQD9pKjdNIqM4AHwM7d9fKRjOsM0s33ODGl8vUU
	rwFOlXutSwGs9xfriWp049k/q0F60NszEmBf42WSnk2cEpo5J1B1EahITVO6UmewY9b2MVjRXgaX/
	VcZRLR9DsfjopIxgHGuGUiMVovFzM6ftHF7dBJK8cYTZamDiJeeLjkLOmYUf11fkS0Go6XUIZTvCy
	KB6d+W8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoOQ-00000007a06-3hTa;
	Fri, 27 Feb 2026 03:19:54 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoOL-00000007ZyJ-2EdA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 03:19:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rPGb2TyziU/dFBTeP5RkyLgux5odcZyBVzlNY4Qr1LU=;
	b=e7fARSYa0gdt+SsWCzmzPUHlRZsLyb9i/tsKWQjus+9yiNH901v1LAcYIUXt3f4+6VynEk/fK
	9QESlMdenpqs8MYl1GaKrVt0Dka3AvsbLn55WnJHAet9SJWwKcl2e0YdiorTv912fdCeeN0kXv4
	JnMaHCdtswyVdhqOG2bgnpM=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fMYNJ4gd2znTXc;
	Fri, 27 Feb 2026 11:14:56 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 5483640539;
	Fri, 27 Feb 2026 11:19:36 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 27 Feb
 2026 11:19:35 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<broonie@kernel.org>, <yeoreum.yun@arm.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH 2/2] selftest/arm64: Fix sve2p1_sigill() to hwcap test
Date: Fri, 27 Feb 2026 11:19:33 +0800
Message-ID: <20260227031933.4103333-3-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260227031933.4103333-1-wuyifan50@huawei.com>
References: <20260227031933.4103333-1-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_191949_730437_DDC0A384 
X-CRM114-Status: GOOD (  10.92  )
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
---
 tools/testing/selftests/arm64/abi/hwcap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 0d229804a857..e8b22a60326c 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -478,8 +478,8 @@ static void sve2_sigill(void)
 
 static void sve2p1_sigill(void)
 {
-	/* BFADD Z0.H, Z0.H, Z0.H */
-	asm volatile(".inst 0x65000000" : : : "z0");
+	/* LD1Q Z0.Q, P0/Z, Z0.D, X0 */
+	asm volatile(".inst 0xC400A000" : : : "z0");
 }
 
 static void sve2p2_sigill(void)
-- 
2.33.0


