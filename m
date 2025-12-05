Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7BCD32D60
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 14:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQQPUYWzC4MVTVocsZ5Vaqxv+1vD3oOyYMIVagNfpfo=; b=LEEvL9zlVhOgcYj8+k4OFfwYIk
	V2vqNiOoFK94zc/yL+BbeiWpUp1td8mtPbAH7nGY2e+iAvH3XOB7girFQUIhwMsNPaTq4lbtUKxaK
	DjdsebfgGqtwriLemX/PwWr7c84vJHxKRXyqUh79YoQqCCyK4MnTFl4u4K8OrYoSDHezHQtRQV2U9
	g0cCe5IYk52hmMxD+XNYxHKqCevb5NA3SdTK1vDIQXibx1Vk2gxQidn3u3/8bFq3NQx7G3gR/Y7ir
	wS38Im2xS0+XpneujiulBfRAHNVgP0B8wHI241sYYwQpz78+udO21TS3BYOgk+dNb1/O8ISonvowj
	Eg/Z3iBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWnk-00000009ajG-1Gj0;
	Fri, 05 Dec 2025 14:28:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWng-00000009aft-3n9Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 14:28:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 858721A1F98;
	Fri,  5 Dec 2025 14:28:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 571BB606AC;
	Fri,  5 Dec 2025 14:28:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBFB4102F0A9C;
	Fri,  5 Dec 2025 15:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764944926; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qQQPUYWzC4MVTVocsZ5Vaqxv+1vD3oOyYMIVagNfpfo=;
	b=wjqbJzejUGhNfXPzI1AMvsXgzJYpEZdUKWMGoF5ERPpaGOf23wwuyV1cF1qFbNrj3hBzCu
	hL3JHvKG7ceFAhjYvoCYBAHMi/bQB1usM0osoPxZvOvx/EFjxr/mfhfMsjgIqSNO3RSOt5
	N4qnCLXpSROWhrYycXRIIhzy/NJq5GsnltEgPFnC2gj8fEx7hemYrmxRzkcK3X+SfQalZ4
	nPFo+G+AMOjO2CyEF/hvR+NE3LdzaSMxoTOkwSX7ciGx2LsxcBpsORvSfmd5a+6hFaArgh
	QDXfBpafg8K3YDS03kLkGI1Qvpl+GF9vj1//ZWaUOD17X9XNiSwGHoGAm1Z9kw==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Date: Fri, 05 Dec 2025 15:28:26 +0100
Subject: [PATCH v3 4/4] firmware: ti_sci: restore clock context during
 resume in BOARDCFG_MANAGED mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-4-d06963974ad4@bootlin.com>
References: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
In-Reply-To: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
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
X-CRM114-CacheID: sfid-20251205_062849_087139_A8B4E87B 
X-CRM114-Status: GOOD (  10.19  )
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

In BOARDCFG_MANAGED mode, the firmware cannot restore the clock rates and
the clock parents. This responsibility is therefore delegated to the ti_sci
driver, which uses clk_restore_context() to trigger the context_restore()
operation for all registered clocks, including those managed by the sci-clk
driver. The sci-clk driver implements the context_restore() operation to
ensure rates and clock parents are correctly restored.

Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
 drivers/firmware/ti_sci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 8d94745376e2a..6ef687e481c49 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -9,6 +9,7 @@
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
 #include <linux/bitmap.h>
+#include <linux/clk.h>
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 #include <linux/export.h>
@@ -3980,6 +3981,8 @@ static int ti_sci_resume_noirq(struct device *dev)
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


