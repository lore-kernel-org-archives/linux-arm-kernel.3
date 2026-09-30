Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E0ECA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrff3cv5D8/15+8lFyuQWxEAP20Quywboqf+aBje2zQ=; b=by4eCaW4BbeFWLD3nlXxJwJ75F
	xVVdtdM4FwQAPICaK20xnr72jfLOd9h68HsEYcJ90IfQ5y/CCAlzd8aEzBnwbkFL55xwVrlDBGpxs
	enDTCQSsczSjsaI/unNbYN54A4ClhM1mLWB7Lb2sCIF2MFoGgTbV2XteAwRdQU53jh4sUuiHEvv/B
	M0iLdnkOTvO4hWf3TTzHWob0Mlb6j1yJ0/38o6EDJOEqnN6I26LBNud9u36iTTViKkXtpcE7StrF2
	FESQ5vugYzGgJzY/wCTj4yJiDmWk9p0tDz92NmcqhCVOxCbF3XnzG/6y8Xzp4Iq4lAzi0xLepUkIP
	Mx642JuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrKq-00000005hCp-07xL;
	Wed, 30 Sep 2026 10:14:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrKp-00000005hB8-09ox;
	Wed, 30 Sep 2026 10:14:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B2DB43F25;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64CE7C4AF19;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790763286;
	bh=YcXMWOwQsCLes1AVO1FME2ariUbRxFXlWwKj5WgwNiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YJKwk+UrlkCk1+lruLc44Vdn9YqqelIS0jnt5qLUfZ/xh3VKojAfAzffnohp9AyMV
	 Asuc6wH/Gp7XV+oNx9zSWjoEccRpL02DLwcuRB6DsKxDys/+4vGp5oS9r6j9/btAdQ
	 QsAoFinUO0FnKgCT0YqPzCk2Z7NjTu6pRt/8cCoQeNLo5d17R5kKHxjJoz/aE5f0cQ
	 rQnF+bQxXtMtQQtnypj+16b8tLrUySUIWOcoGbCLAPIlixt6dNu62y47vJSKLKZRiZ
	 i9308js/F/W1/Sse4AvhjOf5mreN6fj6ZkQFYBw9yy6NZttGSbA0D3OakTl68wquds
	 moLTBCqIpzmRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B42CA5FBE;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 30 Sep 2026 13:14:29 +0300
Subject: [PATCH v5 3/4] nvmem: mtk-efuse: add CPU speedbin post-processing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-6572-nvmem-v5-3-384d2a3a1770@protonmail.com>
References: <20260930-6572-nvmem-v5-0-384d2a3a1770@protonmail.com>
In-Reply-To: <20260930-6572-nvmem-v5-0-384d2a3a1770@protonmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790763284; l=1737;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=obcdDbJPC+bJJB8ejmXjnP6/QmD/06/XozyzFUcNY2c=;
 b=5GShSUHPJqiXvrqHRiSZTcESxZC/UG33Tn9SrBVmHk6NKDWSNpSL7fN2RH+escj9ogsV9oqRy
 D6v3trKnWGYDiKD6tLp28Pl4bnfDCjc+XuZwZ15pENMehY6uHxmfM/l
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

MediaTek SoCs are often released under the same marketing name, but with
different suffix for the speedbin. For example, mt6572m has 1 GHz limit,
mt6572a - 1.2 GHz, mt6572w - 1.4 GHz.

Since the speedbin is stored as a number in the efuse, add support for
converting it to the bitmask for opp-supported-hw usage in the DT.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 980c29d01337..d2e5c69c580e 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -70,6 +70,18 @@ static int mtk_efuse_gpu_speedbin_pp(void *context, const char *id, int index,
 	return 0;
 }
 
+static int mtk_efuse_cpu_speedbin_pp(void *context, const char *id, int index,
+				     unsigned int offset, void *data, size_t bytes)
+{
+	u8 *val = data;
+
+	if (val[0] >= 8)
+		return -EINVAL;
+
+	val[0] = BIT(val[0]);
+	return 0;
+}
+
 static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
 					 struct nvmem_cell_info *cell)
 {
@@ -83,6 +95,13 @@ static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
 	if (cell->nbits <= 3 &&
 	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))) == 0)
 		cell->read_post_process = mtk_efuse_gpu_speedbin_pp;
+
+	/*
+	 * On mobile SoCs, the CPU speedbin is a number. Convert it to
+	 * a bitmask for supported-hw usage.
+	 */
+	if (strncmp(cell->name, "cpu-speedbin", min(sz, strlen("cpu-speedbin"))) == 0)
+		cell->read_post_process = mtk_efuse_cpu_speedbin_pp;
 }
 
 static int mtk_efuse_probe(struct platform_device *pdev)

-- 
2.55.0



