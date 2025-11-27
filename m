Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EADCCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 08:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGUB311hgWAyFRUuNDLWLmnmEe9k7c0Q1RMUsTuYHcw=; b=b0QEco0Sg4H1wOWWCkFQKUA3ws
	fVnRg6goFXbQTsg+6Vo8I5HIhrBtM2ZZXjUiSMvsHz5mBRA1UcB6wyhVhlo6v4baCDldSj95B5gyX
	SkSBGSxcb8gh+OgYxHpUSV+xeod1glvETiyxilLeWcoBjKdFOFzHZ4NLV2QU69odb31LN9LJ4JSqb
	ri8DJU+SuV4agaVAEPeTnkdHqOHO+igBcLlAcHy4MzHE2Lv1iUXAA9gfHkwjOpDS3gboFCoEH+SJ6
	8fARsxnNy0OajushnwDmh6+MbqoXgbpgnoLoIjLK29UNkwmzSsl62EA8x0dkhgI+eu7JHsTsVSKCs
	YcnsPGCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXXH-0000000GDek-3JtB;
	Thu, 27 Nov 2025 08:39:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXX8-0000000GDb8-3gie
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 08:39:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 167764E41916;
	Thu, 27 Nov 2025 08:39:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D9FF36068C;
	Thu, 27 Nov 2025 08:39:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B470F102F1A6A;
	Thu, 27 Nov 2025 09:39:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764232759; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uGUB311hgWAyFRUuNDLWLmnmEe9k7c0Q1RMUsTuYHcw=;
	b=n1lK/gI/ZWefv9D3rq/z16Z4OmDsaSOdN7WJxw+1To5hlI0jyfodUScvXR5zIV+LyMbcsA
	hIKf555N5KfxeazGBpzXws0TIc5AQoZONVoQcXdv1pLG0wGVy8O3/OYeoH0ZNLQpJNo3va
	OSzx6W1og/5lfvKN+7rRNGYYLg/t4zHjPcxCKxRk8oq+AWksVIpPsBg4K07VFvAe0A/vG6
	4OXtn+A5WD8nrA+XIbMWlahn3Lkia0nVTwr8603QIuflhYCnDLKFpEyex0Nm4S2E7vDBjq
	Zvx7hWpzV/93lQNClNb3LYY+LB9IjLfRtGarsgS7bN8bulnan7CWO3u/Bid4pA==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Date: Thu, 27 Nov 2025 09:38:58 +0100
Subject: [PATCH RFC v2 4/4] firmware: ti_sci: restore clock context during
 resume in BOARDCFG_MANAGED mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-4-a487fa3ff221@bootlin.com>
References: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
In-Reply-To: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_003923_060934_E9E37F9F 
X-CRM114-Status: GOOD (  10.52  )
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

In BOARDCFG_MANAGED mode, the firmware cannot restore the clock parents.
This responsibility is therefore delegated to the ti_sci driver, which uses
clk_restore_context() to trigger the context_restore() operation for all
registered clocks, including those managed by the sci-clk driver. The
sci-clk driver implements the context_restore() operation to ensure clock
parents are correctly restored.

Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
 drivers/firmware/ti_sci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index a4d28f37b58ae..1e3fe00ff9109 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -9,6 +9,7 @@
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
 #include <linux/bitmap.h>
+#include <linux/clk.h>
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 #include <linux/export.h>
@@ -3901,6 +3902,8 @@ static int ti_sci_resume_noirq(struct device *dev)
 				if (ret)
 					return ret;
 			}
+
+			clk_restore_context();
 		}
 		break;
 	default:

-- 
2.51.0


