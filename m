Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884B8CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYzmjWKBTXTkbIIV0Us37bAfYBFtWf7r18ikabFV4Kk=; b=pVeQ6IF4z9XYpZ4prVVfwo8zTW
	a6Qa2UVBLmyoEZmpNnoIhOvi1ln2ZL5PY9B86KG3PjEL9cGUDhStpnO8AoC3+ERRqqk/WM4Bx/OeD
	7sIADMdGjdGtwz+OR0Tl8WqPNKNp7JRVqWzfqIN1a00zooGcC4A6njczSGuUC9l029thyTfi9ebvB
	KGf9a84E6tlkDs4s0jNxcg+k/W2cSqv7tHLWirXVa8HJtiVxnfKdepkEMojRps9xVpyFRgAZKMnUO
	dabh6XTW42kHO37V7qOvE6UjllhQT16RG5vj9bhX9i0n3pV4Tw978hD5af2CILEYp8n042xjfvXzv
	5iy/9lgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEb-00000008h0h-2nCf;
	Fri, 24 Oct 2025 08:33:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEH-00000008gVw-3TZ7;
	Fri, 24 Oct 2025 08:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761294775;
	bh=A0XIdmTunSfnUb5W+QZHC0IGBV0qBNWbSKuFq+OxxLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kWy+SzWrZy3V6X4tgZy/VaUdkbC7p1WuK3TTEuclWtOqIn6CLsGcBUIhJmZOX0RN+
	 JhtVmKzdj2UiHHY3aKoCh8pLVyw43wxT1kcutKtZ6Oz7VKO2si6fdaLfBciXuCnhNn
	 2/U+BtRhIhJRliOQNeQc8tHlmzNf2ZKFGQuWqpeeWRnXAYbeq/GS+1FUs6avmZIeow
	 08HZU1rQMa6t5oioUCQMgGl81QAzaWdeBtUKj0fzRYh2N7eSrVC5Mlahmf+NUwPntF
	 Gk/qnEsqtfxdiAEkFVNhnh+/0cx/6tVIgMY8P3fJMKVR3kWTASnqqfqejmlPKYbnlu
	 iBUPYsKW1HMEw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D8D217E13F9;
	Fri, 24 Oct 2025 10:32:55 +0200 (CEST)
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
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v4 3/5] spmi: mtk-pmif: Keep spinlock until read is fully done
Date: Fri, 24 Oct 2025 10:32:45 +0200
Message-ID: <20251024083247.25814-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024083247.25814-1-angelogioacchino.delregno@collabora.com>
References: <20251024083247.25814-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013258_057976_B0D84C03 
X-CRM114-Status: GOOD (  12.92  )
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

Fixes: f200fff8d019 ("spmi: mtk-pmif: Serialize PMIF status check and command submission")
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
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
2.51.1


