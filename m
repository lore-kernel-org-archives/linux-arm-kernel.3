Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456A7FCA19E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 22:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6sEa2EbLg9kRxYDC+wk5lG4h9pBDhKw3v7ZVTXod9Z0=; b=jOQ5CSB6YwGlOy3uOTELUaYXKL
	srxAm247WXCgXTU8JkGga9b1RI3oM9Idd+G/+M2eawCOJqPIoCPOMaWzs9xPpN1QLBafhiaO1FvvR
	1FpVhluLBofibQe8ds/TPf2tI74IVxRCa0ydzlxLomFGi3cX7Sa6Kw9ern/zHK3zUIDgeKTx26FVm
	vf9Nz0EGX//DauUqhNYMitCaqPXHKaQVe+ugrYYwUdtErt7JXINHIlJz8NJqxemXSgC/6lvQDmS1x
	/24C0VrzQxb+JfVyVLiYKihlZed/OYdmk/TPi3802jx1q/KMIaz4R5ce58pB/tufcX5+52UnGuNPM
	giNYg6mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjGr-00000008EmF-02G0;
	Mon, 09 Mar 2026 22:40:17 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjGo-00000008Elv-2qef
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 22:40:15 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773096010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6sEa2EbLg9kRxYDC+wk5lG4h9pBDhKw3v7ZVTXod9Z0=;
	b=JQTSDRRm9vnyqZZGdY6s0b4nQjjICVmFVwlyzrX9I47jfrkZlWYh612iJzxz9pqqqbbDh+
	/dGUzYblpitIxHSgGJfs5T3y6gJR/gCTn2GEUtMKgotOlFCluc0Kt+0+EdO0kXIpH64XrD
	FU8SjSXFEpE2xajsE08pncz0qmeL92w=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] bus: rifsc: Replace snprintf("%s") with strscpy
Date: Mon,  9 Mar 2026 23:39:24 +0100
Message-ID: <20260309223923.84283-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803; i=thorsten.blum@linux.dev; h=from:subject; bh=se/9XM5LaxmsF9U1ffuqXFfNsRE3YhF8LwOaSh6U6vU=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnrfaQjwjxfVGnc8cvbt2GajMLbm9sWSR74Ic2yY8EmR pZG5dUzOkpZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAiqjcY/kpufPbTqbvnTaR4 2jpts8u3d1psD5r0aU7L4uTsF6+Ntk5h+MPFqfihuCxoCbt5e7nBnSvCVmVXtP2FIj2E7xzjuWq 1jQMA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_154014_873154_55B17F07 
X-CRM114-Status: UNSURE (   8.68  )
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

Acked-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
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

