Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3C2C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7LGzNNLwJWF/CzbnitNUG/HP630PF8E+kxnU8OFKypI=; b=GirRGu8Z5MHDO+AnybQ+mKwXMb
	y0LBKxDkhpWZX7itxyujwzGwm1L37+v+E8T+XmfdVvBvnUlLwqlmjiVNne8yqW3X7XjlS/GXNUnbV
	9TzHBpc23Oc4W76nEvkpXmUEG4jsTVXhZWPfgLl/eU59kUVIccauP5IIJXgFdYCiNqGJAcVjOLbBL
	5ZefDyad49xms9KzcrSP1JiEX36dE6G40lEvSzi0idSgj8gLzcV5W7bXdjcN1uGUOBwMLtLm6xJsZ
	idPH09EbNvfn2XkPRrfV2JZ1ZvPk4hoHaoxLjOgYQp8vi6WdsvKNyfgO1EcSLPSh0TWVb3q2XGFGA
	moWEsICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3TF-00000005q77-1cKI;
	Tue, 25 Mar 2025 12:33:29 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx386-00000005l6U-3Ij1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 12:11:40 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ZMTG54bqgzHrFd;
	Tue, 25 Mar 2025 20:08:13 +0800 (CST)
Received: from kwepemg100001.china.huawei.com (unknown [7.202.181.18])
	by mail.maildlp.com (Postfix) with ESMTPS id 72AC618006C;
	Tue, 25 Mar 2025 20:11:30 +0800 (CST)
Received: from huawei.com (10.50.165.33) by kwepemg100001.china.huawei.com
 (7.202.181.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 25 Mar
 2025 20:11:29 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <maz@kernel.org>, <oliver.upton@linux.dev>, <yuzenghui@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <wangzhou1@hisilicon.com>,
	<shameerali.kolothum.thodi@huawei.com>, <liuyonglong@huawei.com>,
	<jiangkunkun@huawei.com>, <yangjinqian1@huawei.com>
Subject: [PATCH] KVM: arm64: Make HCX writable from userspace
Date: Tue, 25 Mar 2025 20:11:26 +0800
Message-ID: <20250325121126.1380681-1-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemg100001.china.huawei.com (7.202.181.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_051138_972317_303B14EA 
X-CRM114-Status: UNSURE (   8.63  )
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

Allow userspace to modify guest visible value for HCX in
ID_AA64MMFR1_EL1.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
---
 arch/arm64/kvm/sys_regs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82430c1e1dd0..b105f156bdf6 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2666,7 +2666,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 					ID_AA64MMFR0_EL1_TGRAN16_2 |
 					ID_AA64MMFR0_EL1_ASIDBITS)),
 	ID_WRITABLE(ID_AA64MMFR1_EL1, ~(ID_AA64MMFR1_EL1_RES0 |
-					ID_AA64MMFR1_EL1_HCX |
 					ID_AA64MMFR1_EL1_TWED |
 					ID_AA64MMFR1_EL1_XNX |
 					ID_AA64MMFR1_EL1_VH |
-- 
2.33.0


