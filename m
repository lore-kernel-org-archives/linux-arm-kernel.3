Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40AECA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 22:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q26Q+ekksGKEwhnH7ILghZQnmCPvicAfclZHAIY3oOU=; b=IVCaGLXCNbKxo8+boLEb6Mgz+q
	COEG0HsrcRcvzOw+6A/rWgQqkHLl9H5rAQc28mYjfWSlvyTNZOy+EccqNa4oYxmxxPeStQU8/ewDR
	u4dIPjRXVAGpsL5ciKYvX7j2gqflSuYq6yM0RWajPSbxxKUlD8grz5QAScbFrNZSMxGdhAUmaNx1l
	HymKQlP6sw7xBHiiM6tlLMJoVygB8KSz+pa0NXr81K+zpUyt5PgjlC+Kne+MteMSdK5o9IZh5TsSu
	vrKui0eNK+ijcpxLCQbhWNUvSs2m9Ru7Xr+0hbi4zF+LuJ3N0mLRVd7+zjKDvwUNCda1tJVaQFboh
	GPHU951w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJlB-0000000F8Zd-25J3;
	Wed, 13 Aug 2025 22:15:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJN6-0000000F5AD-1hIs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 21:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Q26Q+ekksGKEwhnH7ILghZQnmCPvicAfclZHAIY3oOU=; b=gepYDc8I5Px0UdpOGmKamcDVoZ
	2T0oJRQbg5EOt8Zh2RQtu8p/iwP6qXjr4UreOqMBO6pnzh+G2OgkPYvwcjFyZ2z/EoKYHWy81b1xn
	CHHkGDoveFXWaBZwOTiPCOYMYLoiuBljjZiQn6lK0EPTCBJ5okkpTKS39MyMA5XiLpxIqyzBSACj8
	lFKWbLMtL6MPcR5INtQOCGtxRl8WMSPG/kT3XDomZrHGz4I5RiQ1lzm6Ql7ACyvdJOs2CvtFirx/J
	NywePuSY5ichy+OhrYPkEKTrh+HgJm1HKd3oCwFN9FJDUSD9eSBN/hj39gnGIPZb0331wkqE2ls/X
	eMnHsO9Q==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJN1-0000000GDDU-02xM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:50:57 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DLok371738293;
	Wed, 13 Aug 2025 16:50:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755121846;
	bh=Q26Q+ekksGKEwhnH7ILghZQnmCPvicAfclZHAIY3oOU=;
	h=From:To:CC:Subject:Date;
	b=E+VfenYNF7AsJdVz/1vTGkcQ3zgZH/C4/m3/A1KJDP3xYur4NZ57+DxkereeE2/Wy
	 fH871ColrjISBzB/Id2mEKPqNG2RGJyE0jJgXxYtFkuIjvrT43ERfmlGz0MnhiHouv
	 njv4blOwIOCnIfJC4XlatyOBk+vS9TboQaMzW0G8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DLok3E357657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 16:50:46 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 16:50:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 16:50:46 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DLoj9r2619389;
	Wed, 13 Aug 2025 16:50:45 -0500
From: Andrew Davis <afd@ti.com>
To: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis <afd@ti.com>
Subject: [PATCH] ARM: setup: Use register_sys_off_handler(SYS_OFF_MODE_RESTART)
Date: Wed, 13 Aug 2025 16:50:45 -0500
Message-ID: <20250813215045.543957-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_225055_999593_EEF058EC 
X-CRM114-Status: GOOD (  12.81  )
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

Function register_restart_handler() is deprecated. Using this new API
removes our need to keep and manage a struct notifier_block.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 arch/arm/kernel/setup.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 0bfd66c7ada05..8e21634109ef8 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -1081,18 +1081,12 @@ void __init hyp_mode_check(void)
 
 static void (*__arm_pm_restart)(enum reboot_mode reboot_mode, const char *cmd);
 
-static int arm_restart(struct notifier_block *nb, unsigned long action,
-		       void *data)
+static int arm_restart(struct sys_off_data *data)
 {
-	__arm_pm_restart(action, data);
+	__arm_pm_restart(data->mode, data->cmd);
 	return NOTIFY_DONE;
 }
 
-static struct notifier_block arm_restart_nb = {
-	.notifier_call = arm_restart,
-	.priority = 128,
-};
-
 void __init setup_arch(char **cmdline_p)
 {
 	const struct machine_desc *mdesc = NULL;
@@ -1160,7 +1154,7 @@ void __init setup_arch(char **cmdline_p)
 
 	if (mdesc->restart) {
 		__arm_pm_restart = mdesc->restart;
-		register_restart_handler(&arm_restart_nb);
+		register_sys_off_handler(SYS_OFF_MODE_RESTART, 128, arm_restart, NULL);
 	}
 
 	unflatten_device_tree();
-- 
2.39.2


