Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0010C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 14:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zEO0sHexR+s4wdxZ1kbtLkMsNlydM6144VdLP3jn7gQ=; b=VAXqcp+/cBKGXHigvuRo3CK9Zv
	TdZBU30hN5L8bJVesmh27qtZF+ppIMOfTMcF32JwW1uxiee/TcYBx9YW1tBVY0bM9p2LYVhvm03TE
	otkYq+rvgC4Q5D2rj2ERVTGksD77byDSFt9sJAHyLlOFLRafTaViviHpajLrCuqDF80AGFv4sf+Sn
	vyRp+MymBAbc/QruS8WMvQ+/8fNdmdO8hGkAmNzcYYAg6xJQ9vuTF6cCyUqBeL5pGa875lerkKiIe
	LrEN0W9qklt7wRHmz1Sxq2bhau7vVaJy+CXWfdi06CRYwlxunbREjTbjJYALUgBylM7PN6VQQZANN
	A9hdPB/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkW6-0000000G7k1-3C8H;
	Wed, 21 May 2025 14:33:58 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkMv-0000000G6IC-0G6V;
	Wed, 21 May 2025 14:24:31 +0000
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowABHtcQT4i1oHRX6AQ--.16951S2;
	Wed, 21 May 2025 22:24:20 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] remoteproc: mediatek: Add SCP watchdog handler in IRQ processing
Date: Wed, 21 May 2025 22:24:03 +0800
Message-ID: <20250521142404.1077-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABHtcQT4i1oHRX6AQ--.16951S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFWkXr4xCr4DGFWrXry5Arb_yoWkZrX_ua
	s0gFZrWF1vga1Yy34IyrsavFZa9ry8Wry8KFySqas8t39xXa47try0vF4kuw1DXF15uFy5
	Zr4v9F4fuF4xujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW5XwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUSdgAUUUUU=
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAUJA2gtsvlq+gACsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_072429_465065_3334F351 
X-CRM114-Status: UNSURE (   9.09  )
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

In mt8195_scp_c1_irq_handler(), only the IPC interrupt bit
(MT8192_SCP_IPC_INT_BIT) was checked., but does not handle
when this bit is not set. This could lead to unhandled watchdog
events. This could lead to unhandled watchdog events. A proper
implementation can be found in mt8183_scp_irq_handler().

Add a new branch to handle SCP watchdog events when the IPC
interrupt bit is not set.

Fixes: 6a1c9aaf04eb ("remoteproc: mediatek: Add MT8195 SCP core 1 operations")
Cc: stable@vger.kernel.org # v6.7
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/remoteproc/mtk_scp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 0f4a7065d0bd..316e8c98a503 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -273,6 +273,8 @@ static void mt8195_scp_c1_irq_handler(struct mtk_scp *scp)
 
 	if (scp_to_host & MT8192_SCP_IPC_INT_BIT)
 		scp_ipi_handler(scp);
+	else
+		scp_wdt_handler(scp, scp_to_host);
 
 	writel(scp_to_host, scp->cluster->reg_base + MT8195_SSHUB2APMCU_IPC_CLR);
 }
-- 
2.42.0.windows.2


