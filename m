Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242DEC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYBcHQbZLmVbxsTqlzcBWSfwehPh/doNpcaZlxDDz4Y=; b=c3FydGyGToZoxx7/9fr06VFqL9
	U4DvIMYSp3jLbjr2aZzIubn2CmkLfB3pbldlnp/WxjQHRL9/fqkTgG6a9Yzwl7ieC/iHdNLPJT801
	Hn4bdHXC9cDz6BJrc6PBQ7oBNcniMhEj+fG/carVtjrBkjPDHinG6tykNaTPI9QcGnpFHyWqh6Cvb
	vV5WfSTF9QbC01k4GiEnjlKQhLAGjVoYtzQVUex44RX1v2210A8B8ruFk+ex95P1e4ls9xBPjf4vQ
	x9KoXcwImWH3e5OmkMDa0yw7Idblek7ypQv58+Jp5eTStLezBmAwNNQHrqx9hVNbfvFi5ccKOmQMs
	iOqjIImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThmR-00000002yD3-3txV;
	Mon, 23 Jun 2025 14:04:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfr5-00000002aly-1Jr0;
	Mon, 23 Jun 2025 12:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680054;
	bh=/qYS7j1Kjsx2bsMR5FO+759f8nIWeGhSxaDm1IPwegE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p/qIfElNqNCxByneAMRVW5sGcKmD3Kly9AN7VUhveOfi8j5yrI12ncftiBLskOUrU
	 pNJo1q3TdlqLRbv+3pZrCZ43n7uC64IiMptqlF3+1/+Kp+VYjbxvy4TZZz2fCjgDC+
	 FPWAxtmC7pH8fD6FCd7bKT2eE3wZVD9JmRKRiYt1fktuagtuu1GRSYgQsG+/JHWyMc
	 /zBk7elPV3wVmj3eqyunEj+MtV2fJNc1UewloZ6re0U2NeJcOkTKByDUdw3jpZzBCW
	 2zo2cP/g1auWWOb9fnoR6O7hu530BA0AtB/G9VXqRQu9iVqnDZ3zwb6mvxfKRshj1j
	 6uCrjzCYy4NVw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 557D317E1560;
	Mon, 23 Jun 2025 14:00:53 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsin-hsiung.wang@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 3/5] spmi: mtk-pmif: Keep spinlock until read is fully done
Date: Mon, 23 Jun 2025 14:00:45 +0200
Message-ID: <20250623120047.108961-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120047.108961-1-angelogioacchino.delregno@collabora.com>
References: <20250623120047.108961-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050055_496656_B43FC268 
X-CRM114-Status: GOOD (  12.88  )
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

Move the spin unlocking to after reading the contents of the
PMIF_SWINF_(x)_RDATA_31_0 register in pmif_spmi_read_cmd():
since this is the only register that we can read to get the
data from all of the arbitered busses, a concurrent request
for reading (especially on a busy arbiter) will show a race
condition and a unexpected or corrupted value may be read.

Doing the entire read sequence while spin locked guarantees
that concurrent access to the arbiter doesn't happen.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spmi/spmi-mtk-pmif.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 68f458587c67..9f416b231ab8 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -22,7 +22,7 @@
 #define PMIF_CMD_EXT_REG	2
 #define PMIF_CMD_EXT_REG_LONG	3
 
-#define PMIF_DELAY_US   10
+#define PMIF_DELAY_US   2
 #define PMIF_TIMEOUT_US (10 * 1000)
 
 #define PMIF_CHAN_OFFSET 0x5
@@ -372,7 +372,6 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	/* Send the command. */
 	cmd = (opc << 30) | (sid << 24) | ((len - 1) << 16) | addr;
 	pmif_writel(arb, pbus, cmd, inf_reg->ch_send);
-	raw_spin_unlock_irqrestore(&pbus->lock, flags);
 
 	/*
 	 * Wait for Software Interface FSM state to be WFVLDCLR,
@@ -382,13 +381,16 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 					data, GET_SWINF(data) == SWINF_WFVLDCLR,
 					PMIF_DELAY_US, PMIF_TIMEOUT_US);
 	if (ret < 0) {
+		raw_spin_unlock_irqrestore(&pbus->lock, flags);
 		dev_err(&ctrl->dev, "failed to wait for SWINF_WFVLDCLR\n");
 		return ret;
 	}
 
 	data = pmif_readl(arb, pbus, inf_reg->rdata);
-	memcpy(buf, &data, len);
 	pmif_writel(arb, pbus, 1, inf_reg->ch_rdy);
+	raw_spin_unlock_irqrestore(&pbus->lock, flags);
+
+	memcpy(buf, &data, len);
 
 	return 0;
 }
-- 
2.49.0


