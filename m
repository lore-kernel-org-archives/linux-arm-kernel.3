Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B2ECFA474
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 06:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lhXmYSd6erwiZvnGvy2iwChEIsqDQNKFKNb+gkFQP2c=; b=40KvzuMK9hQsEzIKxZk2s78UMf
	AQJDBGNM44A1THhkrOTNGbUBO1r2mYQ/LTxEJbHhrcIEEp6MgA/hsAEHABricRH84nXEwjWLEyuIC
	2y6hf+g3e6HtzvwRUHJwv3rK5c/XUsomJ5chbRSzTHdHlv4mb0KkiccHeO5UBlfIeiK3N0vzRyGDM
	eyXfoWZhB8zVktmdeh3J7X3aljgCRpOScpp7emxgm7tSNPJfekZfSo5rkPyU7kPwZMkAFfgU0g72l
	HiMJtsc91ObMGOBxltQ0RuTGPFugOD8M9nhCO/QCTjSfUY0hCNylDLbsrFerHk9oTGwuHsvaRU3Lc
	8RBbj0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKMT-00000007tbw-1KOh;
	Fri, 21 Nov 2025 06:11:13 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMKMP-00000007tbG-20Kq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 06:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=lh
	XmYSd6erwiZvnGvy2iwChEIsqDQNKFKNb+gkFQP2c=; b=NrsqQCe1XZ1ieb/F8c
	3VgUiRIRdyk4CsHhSFHDw7jfxSR8YYiLq8zSdNpHKxzT7QV0Utd0SCiCgjkBlYGz
	1EhRhhcrXFf3/nDLYduPEJ9XIkTMQVivBIYRrU3WIbwpLI6818ikHT7qDuV4Jf2C
	rsp3kysoxJp5jmYWVACYFW78U=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wCnD2dbAiBpMctlBw--.981S2;
	Fri, 21 Nov 2025 14:10:37 +0800 (CST)
From: Gongwei Li <13875017792@163.com>
To: christophe.leroy@csgroup.eu
Cc: wangfushuai@baidu.com,
	frederic@kernel.org,
	ligongwei@kylinos.cn,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] soc/qman: use kmalloc_array() instead of kmalloc()
Date: Fri, 21 Nov 2025 14:10:22 +0800
Message-Id: <20251121061022.114609-1-13875017792@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnD2dbAiBpMctlBw--.981S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr48ZF13tw4fArW8Gw43GFg_yoWfWFb_uF
	WUXrsruryDArZIqrnru39rZFyava18Ww4v9anFvrnxXw4UtwsxGa4DZr4rZFsxWr4Yvrya
	9wsxJryftFnFyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUny5lUUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: rprtmlyvqrllizs6il2tof0z/1tbiXRsNumkgAekKiwAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_221109_964308_0E4711D1 
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

From: Gongwei Li <ligongwei@kylinos.cn>

Replace kmalloc() with kmalloc_array() to prevent potential
overflow, as recommended in Documentation/process/deprecated.rst.

Signed-off-by: Gongwei Li <ligongwei@kylinos.cn>
---
 drivers/soc/fsl/qbman/qman_test_stash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/qman_test_stash.c b/drivers/soc/fsl/qbman/qman_test_stash.c
index 6f7597950aa3..6009e8b32c44 100644
--- a/drivers/soc/fsl/qbman/qman_test_stash.c
+++ b/drivers/soc/fsl/qbman/qman_test_stash.c
@@ -219,7 +219,7 @@ static int allocate_frame_data(void)
 
 	pcfg = qman_get_qm_portal_config(qman_dma_portal);
 
-	__frame_ptr = kmalloc(4 * HP_NUM_WORDS, GFP_KERNEL);
+	__frame_ptr = kmalloc_array(4, HP_NUM_WORDS, GFP_KERNEL);
 	if (!__frame_ptr)
 		return -ENOMEM;
 
-- 
2.25.1


