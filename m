Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF9FC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 06:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QiFIIYGgGBWuarCiW5+YZwUI5o3pOP+hr5uNDNTqvG4=; b=Cw0fNrNDgqG45b
	+gXTcUlT3M1WdrNT/6DNKZR+7Uw9qZyA/i6JQZDssL0AdItlakzsSe/NJYNoc8Hlc7axP/mwXgM1c
	Ds6zGfk06euUbAfbGdX9DXmnf37ii+UgKv7FQOrGwaq8yA9qNbbfgZn39ycjdhIgD60GW0gMye7Hf
	ISczYuEk0CWDB60LCs60hK9r454W7pfZi7r0lQlR7Y7hFTEsyxmXnqe1/pUzAMqDPY4qzIaKw/9oI
	fSbWqkCStY27i+9Ak/AyRML9VsyRph+2ocFfhfhasp6fjLgYqgcq1TNQOuvEWuaQcvE38r4CZEDjy
	aDI2Llm/xRBShZgi/vyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thk9g-00000002knp-3ufZ;
	Tue, 11 Feb 2025 06:54:00 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thk8G-00000002kTW-0IOz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 06:52:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81BB61480388;
	Tue, 11 Feb 2025 07:52:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739256749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QiFIIYGgGBWuarCiW5+YZwUI5o3pOP+hr5uNDNTqvG4=;
	b=roZpjScjYGJ8VLAI8XAAMZXHJfN9L7/Q4kz4gM2SF3Z7rgmg/ifXKDsGxmjqAahtSX1VMs
	PzHPeXcowl1BwsE6qUyriU6sA9YnOWcYRhHvOu6T5GT2awj8nFIBD/JX9v0YaLUtiFsIwo
	iTdMZdGqJIpv5AeKwIZ/aPmdbfFf7d1qo6GsFp74tMo/TmU6m2L3gR0dAQe3A4diNar9l3
	sHySDBBRFsHcikVR6BzEZ7s44lCM8r2L8YEOs6OCEElM7ypZl30woHag+jj6w6UzGJHYKj
	12pvmlG2LIHeXHmaTdybGcHcyrBvjFd03UW5CH+ZQAsiRrTVZhdsCiUKobLecg==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v2 10/16] nvmem: microchip-otpc: Fix swapped 'sleep' and 'timeout' parameters
Date: Tue, 11 Feb 2025 07:52:21 +0100
Message-Id: <20250211065223.4831-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210164506.495747-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_225232_569284_7536DCD3 
X-CRM114-Status: GOOD (  12.13  )
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

Makes no sense to have a timeout shorter than the sleep time, it would
run into timeout right after the first sleep already.
While at it, use a more specific macro instead of the generic one, which
does exactly the same, but needs less parameters.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")
---

Notes:
    v2:
    - Add Fixes tag

 drivers/nvmem/microchip-otpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index e2851c63cc0b4..bf7e5167152cb 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -85,8 +85,8 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
 	writel_relaxed(MCHP_OTPC_CR_READ, otpc->base + MCHP_OTPC_CR);
 
 	/* Wait for packet to be transferred into temporary buffers. */
-	return read_poll_timeout(readl_relaxed, tmp, !(tmp & MCHP_OTPC_SR_READ),
-				 10000, 2000, false, otpc->base + MCHP_OTPC_SR);
+	return readl_relaxed_poll_timeout(otpc->base + MCHP_OTPC_SR, tmp,
+					  !(tmp & MCHP_OTPC_SR_READ), 2000, 10000);
 }
 
 /*
-- 
2.39.5


