Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2BBFF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 16:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Syc2AhxUW6Zx9jl/D9s3rfupPcLOawoGrGFwJ+jOe0=; b=VCAKo6tpHO3NAPjvt3rTY9dJ+2
	5bEdWLYVeDQCSsPdwqZ1hHKY2OAbfK6b6lEb8dGmDG8n6g9MyE/NreV2wU1Qj3fqK9QnhkXZm5iOH
	4HGfwAF5qoNx9QKVtdGs46NbrtVTKkjBE1UPSyg6CrohxMGKZO6oEyUUcbIXSsnuPMcyL0KVWtIzp
	X4PIJD/y5FHw1pzqTJCuEesmgmhkhPKcfas0HfZmuIffxW2EfDHJkiguPLTKodyymYQrjDwIdH6ka
	/7MbwgSzDzNVcqhn4h9amh5s4rNT/bb203TfZW53Akje55paBfY+H7o3WyzXmn8+5Rh+mrslYFU9H
	9aS6meXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUHV-00000005jSS-1zGn;
	Thu, 30 Apr 2026 16:30:31 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUHR-00000005jRr-459F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 16:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0S
	yc2AhxUW6Zx9jl/D9s3rfupPcLOawoGrGFwJ+jOe0=; b=cyMuGCiifNl5ImNjvx
	7uxKZWCh7CCDGxlDTy408JzcTjSXPACWk1Eb3INfit1OWR1VGgtMvX8Kiw8wBizc
	ev/8sdhM8LZu6NvVlN5pbxkLGRxBUy7Ua08jKXZG8kWomVie5/7KW+fX3f6aN/Ew
	6WfiVvi9w9bnv2vyI1ivxNJpI=
Received: from zhb.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgA3LKiDg_NpvQYdCA--.8419S2;
	Fri, 01 May 2026 00:29:58 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: maz@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH] irqchip/gic-v3-its: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:29:54 +0800
Message-Id: <20260430162954.44156-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgA3LKiDg_NpvQYdCA--.8419S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW7uF4fKF43Xr47WF4rKrg_yoW8CFW5pr
	WfKFWIvF4xWa47Xa1fKF1kuF1rtr4DKa4xKFW7Ww1v9w1UJ3yktr48tryagr1Sqry7JrWj
	9rWrtryruw45AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRgtx7UUUUU=
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AZZ-Gnzg4aCzgAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_093026_348481_A35CC44D 
X-CRM114-Status: UNSURE (   9.36  )
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

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 291d7668cc8d..e78795b7acfd 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4784,8 +4784,7 @@ static bool __maybe_unused its_enable_quirk_cavium_22375(void *data)
 	struct its_node *its = data;
 
 	/* erratum 22375: only alloc 8MB table size (20 bits) */
-	its->typer &= ~GITS_TYPER_DEVBITS;
-	its->typer |= FIELD_PREP(GITS_TYPER_DEVBITS, 20 - 1);
+	FIELD_MODIFY(GITS_TYPER_DEVBITS, &its->typer, 20 - 1);
 	its->flags |= ITS_FLAGS_WORKAROUND_CAVIUM_22375;
 
 	return true;
@@ -4805,8 +4804,7 @@ static bool __maybe_unused its_enable_quirk_qdf2400_e0065(void *data)
 	struct its_node *its = data;
 
 	/* On QDF2400, the size of the ITE is 16Bytes */
-	its->typer &= ~GITS_TYPER_ITT_ENTRY_SIZE;
-	its->typer |= FIELD_PREP(GITS_TYPER_ITT_ENTRY_SIZE, 16 - 1);
+	FIELD_MODIFY(GITS_TYPER_ITT_ENTRY_SIZE, &its->typer, 16 - 1);
 
 	return true;
 }
@@ -4840,10 +4838,8 @@ static bool __maybe_unused its_enable_quirk_socionext_synquacer(void *data)
 		its->get_msi_base = its_irq_get_msi_base_pre_its;
 
 		ids = ilog2(pre_its_window[1]) - 2;
-		if (device_ids(its) > ids) {
-			its->typer &= ~GITS_TYPER_DEVBITS;
-			its->typer |= FIELD_PREP(GITS_TYPER_DEVBITS, ids - 1);
-		}
+		if (device_ids(its) > ids)
+			FIELD_MODIFY(GITS_TYPER_DEVBITS, &its->typer, ids - 1);
 
 		/* the pre-ITS breaks isolation, so disable MSI remapping */
 		its->msi_domain_flags &= ~IRQ_DOMAIN_FLAG_ISOLATED_MSI;

base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
-- 
2.34.1


