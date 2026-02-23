Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5441EEC280
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 21:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XRjfZu1Hr90ss3ioz6xOX+blIxYMM+Mlko4KD2NgAUw=; b=QwgvBOnJglcu6wMR7H+O2U9L9B
	eq5pb4kot/g2LuBPmp6z0S8qFQmIrWCk4a3AX2dQRdB5SAy8Ptf+8mZ10flUHa2ce4BGuetUxVdB8
	/x9SXi8rR5kCzs3Gw/YqfE+xsG3YUzXPm99c+I0UfSHgNbhq1nBrttCsOsEKn54u8nlDQ5CW6Zw1q
	5CiQ8mvSz3Mq9uWFeEuQUaZnw2pDQrzl9LqtbHG5kzlf4dfNkMH0GEKSLlnXpAjzsMBDLTuyE6+Ma
	Ub8vOi22VDx/8v5WtHYJyNToNrLVv7MYdzqhfKMkqyTPeoelSgQZqM+lNh9RzmJuYGtyJsBzNw026
	coYisarQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vudEG-000000013DH-45lF;
	Mon, 23 Feb 2026 21:12:32 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vudED-000000013Cy-25Zu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 21:12:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771881144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XRjfZu1Hr90ss3ioz6xOX+blIxYMM+Mlko4KD2NgAUw=;
	b=Ou0+Rmnr3JxP5kw4e40+7uW1Z3hOgVc6DgGXnJkusn+qXZby88wnxi/c7qOpMKBRU5FgE+
	WheUDgCgFgsJaTbiECpnz5qr/9/GgIUDSZbnE8ZTW2xG7wprzA+HUV21b/Pw+OGashToaN
	KVAIMBtnSlCLaX/tHFd+/BV/5KW9jbU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bus: rifsc: Replace snprintf("%s") with strscpy
Date: Mon, 23 Feb 2026 22:12:11 +0100
Message-ID: <20260223211212.344855-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_131229_679717_C6BA9F3A 
X-CRM114-Status: UNSURE (   8.34  )
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

Replace snprintf("%s", ...) with the faster and more direct strscpy().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/bus/stm32_rifsc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
index debeaf8ea1bd..ba65ad21434b 100644
--- a/drivers/bus/stm32_rifsc.c
+++ b/drivers/bus/stm32_rifsc.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/string.h>
 #include <linux/types.h>
 
 #include "stm32_firewall.h"
@@ -450,7 +451,7 @@ static void stm32_rifsc_fill_rimu_dbg_entry(struct rifsc_dbg_private *rifsc,
 	const struct stm32_rifsc_resources_names *dbg_names = rifsc->res_names;
 	u32 rimc_attr = readl_relaxed(rifsc->mmio + RIFSC_RIMC_ATTR0 + 0x4 * i);
 
-	snprintf(dbg_entry->m_name, sizeof(dbg_entry->m_name), "%s", dbg_names->initiator_names[i]);
+	strscpy(dbg_entry->m_name, dbg_names->initiator_names[i]);
 	dbg_entry->m_cid = FIELD_GET(RIFSC_RIMC_MCID_MASK, rimc_attr);
 	dbg_entry->cidsel = rimc_attr & RIFSC_RIMC_CIDSEL;
 	dbg_entry->m_sec = rimc_attr & RIFSC_RIMC_MSEC;
@@ -469,8 +470,7 @@ static void stm32_rifsc_fill_dev_dbg_entry(struct rifsc_dbg_private *rifsc,
 	sec_cfgr = readl_relaxed(rifsc->mmio + RIFSC_RISC_SECCFGR0 + 0x4 * reg_id);
 	priv_cfgr = readl_relaxed(rifsc->mmio + RIFSC_RISC_PRIVCFGR0 + 0x4 * reg_id);
 
-	snprintf(dbg_entry->dev_name, sizeof(dbg_entry->dev_name), "%s",
-		 dbg_names->device_names[i]);
+	strscpy(dbg_entry->dev_name, dbg_names->device_names[i]);
 	dbg_entry->dev_id = i;
 	dbg_entry->dev_cid_filt_en = cid_cfgr & CIDCFGR_CFEN;
 	dbg_entry->dev_sem_en = cid_cfgr & CIDCFGR_SEMEN;
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


