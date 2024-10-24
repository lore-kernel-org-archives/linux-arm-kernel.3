Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787D2D0BB73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0KIq6H+sLRJ/UfOiEmP/wyvWKbbqENDHiWJ9Zlh2hDo=; b=lJLwGDpbDrCZJOLtxEDX2K+LF8
	/nBuXEM+SDkm94cZW+HadY4YOCbmSK8zZo54yTG5yzG7SsbUelHHwG/LwPXgbNsDPh518AwlUawSt
	lTOyEYzIi0yTSYuzdmX6FnpeYasCqhYoMe0io/Th5XFZZJpCb2xJBWzbCnRxLW6h+DsHrVz2AaCet
	I5vl7E2ahHWC9IyQnS+plCO3g2qR80G1jyALgeM+ujVDKKi4etgrI83HrQCNxtIN7JoPBODV/+eB2
	Z20Eb+2P0OHwP6ZUkR8XDq9IhxTFBMpcuhTAya3WzHAVw4b8B/xwWEMZsNHThsaUD9NIVFVO1MUOM
	9OfgWNPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tW2-0000000HLmr-2P7t;
	Thu, 24 Oct 2024 08:48:22 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tI6-0000000HIxr-2kyX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 08:34:00 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XYzgG6FtPz1SD3Z;
	Thu, 24 Oct 2024 16:32:26 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id C39301A016C;
	Thu, 24 Oct 2024 16:33:51 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 24 Oct 2024 16:33:51 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <maz@kernel.org>, <oliver.upton@linux.dev>, <joey.gouly@arm.com>,
	<suzuki.poulose@arm.com>, <yuzenghui@huawei.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <sebott@redhat.com>, <cuigaosheng1@huawei.com>,
	<wangweiyang2@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>
Subject: [PATCH -next] KVM: arm64: Fix possible null-ptr-deref in idregs_debug_show
Date: Thu, 24 Oct 2024 16:33:50 +0800
Message-ID: <20241024083350.2828920-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200011.china.huawei.com (7.221.188.251)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_013358_887933_6118CC92 
X-CRM114-Status: GOOD (  10.04  )
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

The idregs_debug_show() maybe return nullptr, we need to check desc
before dereference it to avoid possible null pointer dereferences.

Fixes: 410db103f6eb ("KVM: arm64: Make idregs debugfs iterator search sysreg table directly")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/arm64/kvm/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ff8c4e1b847e..b1c59773b9c0 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4135,7 +4135,7 @@ static int idregs_debug_show(struct seq_file *s, void *v)
 
 	desc = idregs_debug_find(kvm, kvm->arch.idreg_debugfs_iter);
 
-	if (!desc->name)
+	if (!desc || !desc->name)
 		return 0;
 
 	seq_printf(s, "%20s:\t%016llx\n",
-- 
2.25.1


