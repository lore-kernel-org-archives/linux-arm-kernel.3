Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BBDC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ng3hN8k9p0RV0r9yi43ppO7Q4cpUfGdxdpjlyOhf/No=; b=TXqWd5zdBXdvF/G6wTQzhaYgIr
	WXIGdw5FpoH7luZXkLDE+QNpz0AkT9RauedLWXAsZSZUMhnV/MeoBovi4EMjKnFhe2qqv+tv+tAeb
	YeucB24y7T1ASKgKTqeHmhvpvogXFd5F62RuAtd3/aX0QWl8ucZ+7ioykypTSIl19ynqLPPWtz1qp
	8EpXbXY7Up2TGcAR0IygDUNfJ811bU+xTwWDNfOE0GySQy5JsrH6vvfZ2vXdnqhpbnaLYnruNrMZa
	KA7L6q6ob9CkXqCU1Kdxcjw1ZqHBiIWzZOAJfoYtHncCwRmkx9yDhrsq+OLkMftXPqHz+26gPkX1p
	0qnvD7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiSC-000000036he-355K;
	Mon, 23 Jun 2025 14:47:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfrz-00000002b7a-2J7G;
	Mon, 23 Jun 2025 12:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680110;
	bh=q4xguAEv20thxhkNrNlpmM17Rq+I44PLFPaJdl62SdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=or0ZvmSfj/H5UL8XHYNj8c1tbJRxWQgEOqYkV/7HUnP5kNFdZLzrJqsxl7ooqoror
	 kTMdyqyjThxetQcsb3CNO8A/1q2Y6LkRHnei18u/m10no7W6o5ULXcKydpep3lkxD9
	 xNp+1os8VOUkDQBQzssLAugosURYjGRPChCGlbKI1f3pKtSIKo9pnRgdBHosp+/CIx
	 Q3FoUGe0q9nSxiJK3Xb/dPDvH0T+KVRAd/bGXK0oymkkLMBIch+w1vd6QsJb+jaazU
	 NiSmDBV56mo/Eln7K6/YtMVF/LKcJpJ9ZAkI7u4bgGhmHsil6sJj2lUYBVpux3b9CB
	 dQuAAOe2aF/Ag==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AE1417E0EC0;
	Mon, 23 Jun 2025 14:01:49 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/4] dt-bindings: regulator: mediatek-dvfsrc: Add MT6893 support
Date: Mon, 23 Jun 2025 14:01:41 +0200
Message-ID: <20250623120144.109359-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
References: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050151_738756_DA866D65 
X-CRM114-Status: UNSURE (   8.46  )
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

Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC's
regulators over DVFSRC.
This SoC uses different values for the vsel, hence it is not
compatible with the currently supported ones.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
index 704828687970..acac5c869f2c 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt6873-dvfsrc-regulator
+      - mediatek,mt6893-dvfsrc-regulator
       - mediatek,mt8183-dvfsrc-regulator
       - mediatek,mt8192-dvfsrc-regulator
       - mediatek,mt8195-dvfsrc-regulator
-- 
2.49.0


