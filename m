Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD70FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 15:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ERcgrOegSKuLIPL4or4RWuj4zLEeGH2UYWhln8zi2E=; b=4vXu1AzfDQTAdVLUAHpQ+wInAr
	iEBuwwcaPoOHKy+J+zAj/d28KcYxNMjiTWndwmwvkC+VoELEHPKQT8uK4UmjMjiK2QKD3hm/j69SE
	pVbpS6SBHLhobBEiNctKAh/YQTvdbG25uIWF7/7ZCMFGcvXU2W1yXWxVpmcTtlElC4ea0RvwymXvd
	kFvAxRDbW4J/ht2rS51L9SfAOMqHz674bHpNh7c8erm4Qocdnt5aZSmjLRfYYd/eLP8jfuODJfW2d
	/XPmG4fYbzjFeWR/sjUxkHHxB582qPLomCeemIcwXInVbg/pN2/rqAt8CU3uhe8h8MlTfVRjHn4kx
	UWPLw6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfR5-0000000Cb01-1pkU;
	Tue, 14 Jul 2026 15:52:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfR3-0000000Cazq-28EG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 15:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=+ERcgrOegSKuLIPL4or4RWuj4zLEeGH2UYWhln8zi2E=; b=rSUpDs3Td/LOu2dPnlOuWa+O5s
	A93zwsjDaHHCmjr64kk22rdOxo96EuuB6M5BdZyeCJoc5oRnxZKg24Y/yLtc+o6eQDl6VIK3/CiUZ
	Ankqnx/eRyvH0iUkwWQYSEtF/fhDLRxG93hWTIZUbySqRAQ4sNHuJNib5a8KsdVpSE42aJC71mR0a
	lTY4H6pHGVzV8FuBLFLCGOkT79ThLHDZ8n9yljNmoOgMzZtNQzEp6NeIXuDaUXrOkxMqwiRS4yr+6
	epEQ+Pmq6RqC/3y8FjMirnbcm0x/0ST5sZDEmnQUxQibiSGQ8gCGWjoLsADIwzz6HFBHimK+t96hT
	ONi7sX6g==;
Received: from [80.12.242.78] (helo=smtp.smtpout.orange.fr)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjfQz-0000000CfGs-28Xv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 15:52:39 +0000
Received: from device-97.home ([10.65.86.64])
	by smtp.orange.fr with ESMTP
	id jdmawmkXaVpupjdmawomkK; Tue, 14 Jul 2026 16:06:48 +0200
Received: from device-97.home ([IPv6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e])
	by smtp.orange.fr with ESMTPSA
	id jdmYwryGUIOrpjdmYwdCwZ; Tue, 14 Jul 2026 16:06:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1784038008;
	bh=+ERcgrOegSKuLIPL4or4RWuj4zLEeGH2UYWhln8zi2E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gA3VVSNa2X5AkRN3xmG98f4kHiSorJR+Za2t0Yqu4+ZWLU+867rOUd6a8n6MUZduk
	 +DYq95qvhFJV1wv/ho094bN436exEbGLcWj7ZhsqbSnVU7Y2TRI4GJ53Z64tYlESqp
	 NKMM9d7IEEPxzyVEnEygy9AV+6bTCWhs5Xc3m8Y4LafYACIsC23k6/KH/f+X9JMOBW
	 gMMyaK0VDTEdbDa/9OlYQhUiEz3PzC+g1OgLQhNqwflXfatlHj3ejvKzwcOoIYlKqh
	 7ZOCgxXhFVWF44s2VR71CmpgoMgZoRIHgjK+r7VSorskTemc0GX+s3gTzbkXWHSn9o
	 jIOSI5KUX+T2g==
X-ME-Helo: device-97.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 14 Jul 2026 16:06:48 +0200
X-ME-IP: 2a01:cb10:785:b00:26fb:aefb:6cd2:db0e
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dmaengine: Constify struct dma_descriptor_metadata_ops
Date: Tue, 14 Jul 2026 16:06:33 +0200
Message-ID: <b0a22171f3ed68e156a2fa84383e99c23ec6b2ff.1784037977.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_165237_672524_C545E791 
X-CRM114-Status: GOOD (  11.69  )
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

'struct dma_descriptor_metadata_ops' in not modified in these drivers.

Constifying these structures moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
 120635	  21584	     64	 142283	  22bcb	drivers/dma/xilinx/xilinx_dma.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
 120699	  21520	     64	 142283	  22bcb	drivers/dma/xilinx/xilinx_dma.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 1cf158eb7bdb..fb21e0df5ab7 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-static struct dma_descriptor_metadata_ops metadata_ops = {
+static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
 	.set_len = udma_set_metadata_len,
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 98b41b8f8915..bef2b031dba1 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -655,7 +655,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 6fe46c0c9452..fe33a20abc61 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -631,7 +631,7 @@ struct dma_async_tx_descriptor {
 	void *callback_param;
 	struct dmaengine_unmap_data *unmap;
 	enum dma_desc_metadata_mode desc_metadata_mode;
-	struct dma_descriptor_metadata_ops *metadata_ops;
+	const struct dma_descriptor_metadata_ops *metadata_ops;
 #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	struct dma_async_tx_descriptor *next;
 	struct dma_async_tx_descriptor *parent;
-- 
2.55.0


