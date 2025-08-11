Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09192C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 07:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nbhzm2pjgxTnUGsWXEMLCLIOKDMpK0vdgym9Uw6mltg=; b=qZ5MI9H2w3Zb31NvnpVDqcS+mq
	387zXXB2zYPBPYj4q1YkTxe6p3g+Bku12r7SVHIxCuAdiGAyZ7XQ6v9c3cvGz4AMu5TwHyunV7bUX
	dJY9dYuiUfE4zb67FTfXv9qlHIlU8ijOMSmd3dAJQU6P/fSDo+ALjZ6vS41YVlRPFkNSeNgIKWfxW
	mTRB/XP+qGEr/p0+oVwR7+9dKFL/I7nHPZDEzJBX9xUJs/Ak9j2BB3twf7tP1bw7C4FTjEkny3CYK
	lUYN0mhwx2ry7xbpISsTk/IdJb4bSuHz5j88/Z/ioaDYb9FqmDRR9I9UsbxJCTsmtkSzBw2c0EQhq
	QREM4/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNMu-00000006lnk-0arR;
	Mon, 11 Aug 2025 07:54:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNGk-00000006kb2-2OpD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 07:48:36 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754898512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nbhzm2pjgxTnUGsWXEMLCLIOKDMpK0vdgym9Uw6mltg=;
	b=aNxaHmBVlpTu1AEdTMm8kk9NDfz8glu3DqSWp+tUObUBjOCJQy0ue8PMZzln1tZN1kuwGC
	HJeYP+sU3QzOlzom6g//AQDRYXuI3o0+f3fxqnBN9utO02xHRmAYkEo9BLhlcNH9SQvGm7
	RPrZ1Mo6pOA4LbKPPi2hAJEeNJeiU7EVoxNrsH08+pyXxNHqoX34y8VaJRO4qJdwaHZLF8
	dC0slX1GmQv+jyM+lelNriBrORUhYF/ioJ6hbe/CzT9A86KFvBXKlZsouciJuFWHCZNBM7
	7/1KU3DTy/m02xZ2HtQ2PREBGO/ex1NJrUCDiz3ivl8gpT6wVzXKJWi4qePDmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754898512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nbhzm2pjgxTnUGsWXEMLCLIOKDMpK0vdgym9Uw6mltg=;
	b=0sfL3U6A5MNQLkk6Gt+s2p0/B8O/M46naTFVSZzV1WjZ3+4cDg+KzXS9KyID+yFZlnnlzI
	cWXE5KGjHgeIWfAA==
Date: Mon, 11 Aug 2025 09:48:30 +0200
Subject: [PATCH v2] soc: ti: pruss: don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250811-restricted-pointers-soc-v2-1-7af7ed993546@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAE6gmWgC/4WNQQqDMBBFryKz7hSTKmpX3qO4qMm0DpREZlKxi
 Hdv6gXKX70P//0NlIRJ4VpsILSwcgwZ7KkAN93Dk5B9ZrClrcvGtCikSdgl8jhHDolEUaPDquu
 aqvV17UYHeT0LPXg9zLch88SaonyOo8X82v/OxaBBV/qc0Vm6dP2LwztJDLyePcGw7/sXyHCBj
 sIAAAA=
X-Change-ID: 20250718-restricted-pointers-soc-499748d55cbc
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754898512; l=1643;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=M/jsQQIqEt8T29bnGJ7SJxDDqUjOBN3iPrs3SE5Ackk=;
 b=TkC64m652S4rlsEbg0SAFfjxGBK3ajQdP3Qz0/2IggfbxCOzGajhqBeeEalOBskujn1JGYDX6
 rau53iiaFvUBaU9l3LHEm57zhRM/JuvRYwxHJd4ku/nokcWBggnjLAt
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_004834_749273_167C50C6 
X-CRM114-Status: GOOD (  11.47  )
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

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Rebase on v6.17-rc1
- Link to v1: https://lore.kernel.org/r/20250718-restricted-pointers-soc-v1-1-c0d0d0bc2e39@linutronix.de
---
 drivers/soc/ti/pruss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index d7634bf5413a3421da296103fc1591030cd00cbc..038576805bfa0f8dece569cf6faecedfb43a392f 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -449,7 +449,7 @@ static int pruss_of_setup_memories(struct device *dev, struct pruss *pruss)
 		pruss->mem_regions[i].pa = res.start;
 		pruss->mem_regions[i].size = resource_size(&res);
 
-		dev_dbg(dev, "memory %8s: pa %pa size 0x%zx va %pK\n",
+		dev_dbg(dev, "memory %8s: pa %pa size 0x%zx va %p\n",
 			mem_names[i], &pruss->mem_regions[i].pa,
 			pruss->mem_regions[i].size, pruss->mem_regions[i].va);
 	}

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250718-restricted-pointers-soc-499748d55cbc

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


