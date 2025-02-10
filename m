Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E638FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dx2AyCMYhFFbWrbn642fofkzdPw2vsH5Sq2hYcPNPjo=; b=t9R25pc7n6dq+r
	TiavkN+NuSjl24XPjv/mcXdemulbfswt+iOLiCKzKoHG4PXVrEHKPeZ6/4VpLS5nrSiPBxxD3WzVV
	t6PO1+qPMoSM246WaFdpWVTL58GSVdjP5ZmSdXIC8qQtsCtDyEphtj0v+j3Ml+PUMToFhNQ7HK8RC
	8Ccyot2fSROlNAwhGCcvy/vyDRvxctyxcu+Mil+PnVpQf1fgICfmMAAM1nHMMMyChAn7qxYlu7Jay
	Uvm1TlC5+azqgizwQEHPMDZnDi6VTlqOyujqm0TdOWF3WV11s3Bh357ljife9Lb6t7bqI2/g7nu1g
	E7vEbdYg+IHvIl+bQpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXB7-00000000dLj-0v7E;
	Mon, 10 Feb 2025 17:02:37 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWzr-00000000apM-0rDT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:51:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2CC71480320;
	Mon, 10 Feb 2025 17:50:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739206257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dx2AyCMYhFFbWrbn642fofkzdPw2vsH5Sq2hYcPNPjo=;
	b=WeufU5F04oIdoa+jIjBiljm+kcpuXaacU7TtFk2amz8xodrGnWESGchS1CTSG5Gu678GPz
	p+x8WZu1frRJNtPrCDfoULtLl5W4uz5e7yr+1l8rqHdTdD2WU+alJv7UgS8j5nkS6YniLc
	y/AKnxJiAz24d7dBsfxsoDjNdoAFxcaoGroNUlOwkPy2lRxMuG2tcK1hqUEg1SfuNuAfNF
	/H3cruIVrUfKYa6pvFsc8kU6udnA9/5rer4TZOVgq3lqNFAonQCYWw7hKgWqqSRkGVndHJ
	k5RzWCgc8M8rFEl29o9yvFppLhkYLwUqQKx+XP8pv7zYEsfnYvJMZG9kix+U0A==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v2 09/16] nvmem: microchip-otpc: Avoid reading a write-only register
Date: Mon, 10 Feb 2025 17:50:47 +0100
Message-Id: <20250210165050.496486-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210164506.495747-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_085059_401942_255DE877 
X-CRM114-Status: GOOD (  10.02  )
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
Cc: devicetree@vger.kernel.org, Ryan Wanner <ryan.wanner@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The OTPC Control Register (OTPC_CR) has just write-only members.
Reading from that register leads to a warning in OTPC Write Protection
Status Register (OTPC_WPSR) in field Software Error Type (SWETYP) of
type READ_WO (A write-only register has been read (warning).)

Just create the register write content from scratch is sufficient here.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")
---

Notes:
    v2:
    - Add Fixes tag
    - Remove temporary variable usage
    - Reword misleading subject (s/writing/reading/)

 drivers/nvmem/microchip-otpc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index df979e8549fdb..e2851c63cc0b4 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -82,9 +82,7 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
 	writel_relaxed(tmp, otpc->base + MCHP_OTPC_MR);
 
 	/* Set read. */
-	tmp = readl_relaxed(otpc->base + MCHP_OTPC_CR);
-	tmp |= MCHP_OTPC_CR_READ;
-	writel_relaxed(tmp, otpc->base + MCHP_OTPC_CR);
+	writel_relaxed(MCHP_OTPC_CR_READ, otpc->base + MCHP_OTPC_CR);
 
 	/* Wait for packet to be transferred into temporary buffers. */
 	return read_poll_timeout(readl_relaxed, tmp, !(tmp & MCHP_OTPC_SR_READ),
-- 
2.39.5


