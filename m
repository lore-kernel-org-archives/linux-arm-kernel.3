Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB16CC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 06:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mn4fYBnBaupyhU+PRGYZIblVqo49GHnq4r1rUCUbn4g=; b=WFEgXHCgWfCvBrprm163j8L3HM
	9wEApjp8sRKAbV2db53XuF7nC1uOJ6fRgX4NO/WANnyNC0rdsqLu5BsEEQSCAP5vLzHNV0mCumq50
	BK8oyIGs4jbSI14Dwj+k8KV3dlyKRccipz4LU3bc8g7rbIfThslIXeUuNo37nC+j41ZypM/avadSj
	6qBqoIzwq0UmmKgb1+xz5sIZ7JIk+CWDfUTtwMpO0XdlQ325PTZKDbuwnozDO5P4v4lKlwCVNxxzg
	JssNVxmx/L8wpLqiQmDd5tR4KWOpvI9f5Bk0n5mcfKQEMsUrzstB8IX9WUgVmGGAW05opq/CUd5uS
	qmzUcz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAdO-000000005OQ-1vy6;
	Sun, 09 Mar 2025 06:59:38 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAaC-0000000056j-0IV8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 06:56:21 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Z9W646yHbz17Nk1;
	Sun,  9 Mar 2025 14:56:44 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B7FB14037C;
	Sun,  9 Mar 2025 14:56:10 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 9 Mar
 2025 14:56:10 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <yuehaibing@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] arm64/fpsimd: Remove unused declaration fpsimd_kvm_prepare()
Date: Sun, 9 Mar 2025 15:07:23 +0800
Message-ID: <20250309070723.1390958-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_225620_265994_6A0278C2 
X-CRM114-Status: UNSURE (   8.55  )
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

Commit fbc7e61195e2 ("KVM: arm64: Unconditionally save+flush host
FPSIMD/SVE/SME state") removed the implementation but leave declaration.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 arch/arm64/include/asm/fpsimd.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index f2a84efc3618..564bc09b3e06 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -80,7 +80,6 @@ extern void fpsimd_signal_preserve_current_state(void);
 extern void fpsimd_preserve_current_state(void);
 extern void fpsimd_restore_current_state(void);
 extern void fpsimd_update_current_state(struct user_fpsimd_state const *state);
-extern void fpsimd_kvm_prepare(void);
 
 struct cpu_fp_state {
 	struct user_fpsimd_state *st;
-- 
2.34.1


