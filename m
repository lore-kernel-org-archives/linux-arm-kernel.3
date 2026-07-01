Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E2CC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m89+TJM/7Zc8y8H9befQqd/uy+QkEBVdhcZX/opQF08=; b=43N0tnDRJR7b5DPj4NTnNRtHS9
	tjCt5x4KJx3A9IajIxB1vqrYaqoE/H/7s2/QJL0+8mZ2bgTQiQrttn7e7aTxydX5RXMuPnmWR8MiG
	5oYdmg8suiTuVY8AHOXvTgNJKT9QXnYfH+EIzR/jArySmirUK/Y9hG+oABasvkHhyd5/nhFp2xsde
	KLLlAoD/bTQrMmX6a/CSHdjq76R2IqGNV7jFM4B54zsEaabOjxA8uIEhjzV9u6UdP5yF1dVBUvysb
	VXR7msW5Rg/WDXatyBJMCvlr0r0b6qtBErsPhBJTHYpdx4NfBn56otK8lK12BMNGX5y9TFAh06je+
	e5LsukMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetuT-00000001owH-3Ms1;
	Wed, 01 Jul 2026 12:19:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetuQ-00000001ovf-3pOO;
	Wed, 01 Jul 2026 12:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908356;
	bh=f4vLH6a6lzK8ef4k72O28L9ieukkYt0ASrBBhXoHZaM=;
	h=From:To:Cc:Subject:Date:From;
	b=Udhu1BH3GqypfOc37IwN5kv/ugc+pOdqUoo/krDkzUFrW8fu4X+l5EcnwW+PKUqXX
	 kZn+GEhYbM4ryyjqg1SaJwAQD4rgGZHzYqe7SVF1fY51OzHavgeLjhTK17Xi7+LUeq
	 Id4rALoSmtuy4eb5+Pvm8iyNxY2/zq14VtM1W2r2ughLZkLS06QvYYnXxgJC5wPbnO
	 XrPlL8STZE5GB5twVl0R+2bq0m+f08L4537Ifnn0TL1I1X6oOmYgXPYGrcOfeHP1iQ
	 vXEMiO833x/wQcPvqXqVmTA7+UcVfXVyH9Wyp2ljSJpwn3ivpUoHXjCTPzsnCB9mL+
	 Q3BbuC9izZwOg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3FA9A17E0909;
	Wed,  1 Jul 2026 14:19:16 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	justin.yeh@mediatek.com,
	gregkh@linuxfoundation.org,
	nfraprado@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] spmi: mtk-pmif: Add workaround for FSM lockup/error in read operation
Date: Wed,  1 Jul 2026 14:19:08 +0200
Message-ID: <20260701121908.19327-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_051919_110950_AFDF3A81 
X-CRM114-Status: GOOD (  21.22  )
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

The SPMI PMIF in some SoCs like MT8196 is affected by a hardware
issue that makes the first read operation on each SID to fail as
the FSM locks up after sending the read command, and this happens
at least in the following conditions:
 - At boot, after bootloader handoff; and
 - At every suspend->resume cycle.

This critical bug may produce unwanted issues in regulator drivers
which may fail to set voltages, making the platform to end up in a
undervoltage or, a bit more critically, an overvoltage condition,
producing instability or ... worse.

In order to work around this issue, add a retry mechanism into the
pmif_spmi_read_cmd() callback which will resend the read command
up to 3 times in the following conditions:
 - Software Interface returns an error; or
 - Software Interface never gets in WFVLDCLR state.

As to avoid uselessly blocking for too much time, only during the
read-retry loop, the maximum SWINF polling time for each trial is
reduced to PMIF_TIMEOUT_US / 2: this was tested on multiple SoCs
and seems to always be enough, as when any read succeeds it will
always take less than 40ms.
In any case, this is still allowing 1.5 times the previous maximum
polling time, reaching a total maximum (for 3 retries) of 150ms.

Worst case testing that I performed saw a third retry only 3 times
out of ~100 reboots.

Fixes: 1f5be2d7f743 ("spmi: mtk-pmif: Add support for MT8196 SPMI Controller")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spmi/spmi-mtk-pmif.c | 38 +++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 1048420b5afb..61c916edaec4 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -21,6 +21,7 @@
 #define SWINF_WFVLDCLR	0x06
 
 #define GET_SWINF(x)	(((x) >> 1) & 0x7)
+#define GET_SWINFERR(x) (((x) >> 18) & 0x1)
 
 #define PMIF_CMD_REG_0		0
 #define PMIF_CMD_REG		1
@@ -349,6 +350,7 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	struct pmif *arb = to_mtk_pmif(ctrl);
 	struct ch_reg *inf_reg;
 	int ret;
+	u8 retry = 0;
 	u32 data, cmd;
 	unsigned long flags;
 
@@ -385,17 +387,35 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		return ret;
 	}
 
-	/* Send the command. */
 	cmd = (opc << 30) | (sid << 24) | ((len - 1) << 16) | addr;
-	pmif_writel(arb, pbus, cmd, inf_reg->ch_send);
+	do {
+		/* Send the command. */
+		pmif_writel(arb, pbus, cmd, inf_reg->ch_send);
+
+		/*
+		 * Wait for Software Interface FSM state to be WFVLDCLR or to
+		 * return an error.
+		 *
+		 * If this is WFVLDCLR, read the data and clear the valid flag;
+		 * If error or timeout, retry for a maximum of 3 times as a
+		 * workaround for an hardware issue.
+		 */
+		ret = readl_poll_timeout_atomic(pbus->base + arb->data->regs[inf_reg->ch_sta],
+						data,
+						GET_SWINF(data) == SWINF_WFVLDCLR ||
+						GET_SWINFERR(data),
+						PMIF_DELAY_US, PMIF_TIMEOUT_US / 2);
+		if (ret < 0)
+			continue;
+
+		if (GET_SWINFERR(data)) {
+			ret = -EIO;
+			continue;
+		}
+
+		break;
+	} while (++retry < 3);
 
-	/*
-	 * Wait for Software Interface FSM state to be WFVLDCLR,
-	 * read the data and clear the valid flag.
-	 */
-	ret = readl_poll_timeout_atomic(pbus->base + arb->data->regs[inf_reg->ch_sta],
-					data, GET_SWINF(data) == SWINF_WFVLDCLR,
-					PMIF_DELAY_US, PMIF_TIMEOUT_US);
 	if (ret < 0) {
 		raw_spin_unlock_irqrestore(&pbus->lock, flags);
 		dev_err(&ctrl->dev, "failed to wait for SWINF_WFVLDCLR\n");
-- 
2.54.0


