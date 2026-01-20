Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF20CCF2DD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NkEtjVarcSoHp8QOC/pznn28WeOYOUP6CtTrfas8ew=; b=rZAN9jAbiX4b73hOt19Vh/ReKr
	Aw4Wt+4Ck2WfeqcFRpfdzN+yvdpjjGX/aTQHtpMhsxsMJ5hApayDIf4LCjmkl/zfaFnJraoCXXRxk
	+f/eAE0Ksuzpea0fTG1Jel3ZpRrULlHDG0/Kkv9XHogjLt0hlgxO+PxPfszuZHtk+lJpJPDJOAFn1
	4CThOVwFsyxc9eXzWNH22iwyHdoC8ioRrZ+9AKWucV9j57YMABaVHARh1dwS8JECN0EJGVnvhwiiB
	WeXSmOE/ssuc8j+RygjDtqfVxIRRY0kqIQfGCBAaFqQYhmD1DvKPjBW5sSAOVvVagowChWmvrdAyN
	sQVD/ELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDv4-0000000469m-33D0;
	Tue, 20 Jan 2026 15:45:26 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDup-0000000464v-0ptc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 15:45:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 21B44148AD5A;
	Tue, 20 Jan 2026 16:45:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768923909; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7NkEtjVarcSoHp8QOC/pznn28WeOYOUP6CtTrfas8ew=;
	b=dqGuTuRtpVogREVnWV1N6aV6D2osb3MFMfy2v/X1Xr3m2zdJAD4/z9iFtK2xFiE4pYF6lf
	H/JVPnqCQb2mU2Exirnxo9dU7jgjJd9Z0lW4HvwxKz8BbzcPKWtK3C4FmZvk8qDCwm7R3+
	Hn1jo0x14Ibq7/V27iGrgRh6vEjCU5UpVLnfq2TzVqJ4X5CfncXEzcbi5bhwiRlIctD8LG
	NmJO1cR5XmHgNLPxfQ2qmE8yCtpBr4aTvl9U615wTVKvVFrITfac6Hp2bNArnoSxIbs9+T
	b/nR7kt4Qau/tNf7RUQ7k5F1SxBL/IIAa2qFJKH/UrQk/WyWTZWYPZOAk0SWvg==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	stable@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 11/19] nvmem: microchip-otpc: Fix swapped 'sleep' and 'timeout' parameters
Date: Tue, 20 Jan 2026 16:44:45 +0100
Message-ID: <20260120154502.1280938-5-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154502.1280938-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_074511_396325_93365317 
X-CRM114-Status: GOOD (  12.62  )
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

Makes no sense to have a timeout shorter than the sleep time, it would
run into timeout right after the first sleep already.
While at it, use a more specific macro instead of the generic one, which
does exactly the same, but needs less parameters.

Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - Reorder tags
    - Add stable tag
    
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
2.47.3


