Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A424BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFwsDR9nS9CPwG8EUO+TSr+FVpQylptXjpi6T/0gA8Y=; b=HsaSyvu2fpd58GquqK/kGMTJXi
	3dMyJxa1jHuFaUIM9psC09KvWM5+ALmpGVOw+3qCCnt0ppIASZPSo9VAxUHhzZeIeWF7uno7+imI2
	8TfqoHBoPF3lz/gKkB9jdfyJZXSgc0u1NKjf4xdHy15pTAtMyk3hBSokz+F4qOXPjimITeuu2l1CE
	Sv2YCOs1y3x38P7FXX8l3qeh+RKkNCbwsesKuqyo4/+rzTDc02y3pWe6RXKK/e+NZa3YLpl0UFIbi
	Obd62n6m9hTNqbBAudjjHWE1EVRKYfgT8vhDwq/Xn6vVVKHpLK8Zzaz9tuGX9JiYGyjrFpetsa/S0
	VLpXKzOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesWC-000000075ns-2a4A;
	Thu, 24 Jul 2025 09:45:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerTs-00000006t6t-3RSs;
	Thu, 24 Jul 2025 08:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346351;
	bh=TbLsiYD2WKRADkZMF09I8y6SP9/pzpukwJSQWNOyHkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CL4kXhsJFkH8miuh3BMC765Je/N2G6/OiELhoJkKE0fTTcK6VPA5nnf36nd8a0Rts
	 x/HpUKo54UMft6ezx5qaZTI6KoFoa7OPYsHKVHKYe+HSgmpgUWtffIMRZL5X+eDJkt
	 9vnDGkiUK2vyydC9jNDolpDOwKI+D+/LPttmqK4qpcTz2kKwD6rjbq2H3hKMqAU2sb
	 6EcS48XZ8yJktXo8hq8+uFRiM4WGSkc41ulFLRzaGSoT+wRVFebD1NM7QLxRpAIr1l
	 44GBldk+SO2BzKbME8f5gohzbLzLWiFtFQKJauumCO6e0aV5nSNpybbYPQIE3YVtin
	 Rb3r5osQSArig==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FC6217E1110;
	Thu, 24 Jul 2025 10:39:10 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	geert+renesas@glider.be,
	u.kleine-koenig@baylibre.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 2/3] clk: mediatek: mt7622-aud: Add missing AFE_MRGIF clock
Date: Thu, 24 Jul 2025 10:39:06 +0200
Message-ID: <20250724083907.61313-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083907.61313-1-angelogioacchino.delregno@collabora.com>
References: <20250724083907.61313-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_013913_002008_C32EE3CD 
X-CRM114-Status: UNSURE (   8.36  )
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

Add the AFE Merge Interface clock used for the audio subsystem.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt7622-aud.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt7622-aud.c b/drivers/clk/mediatek/clk-mt7622-aud.c
index 931a0598e598..a4ea5e20efa2 100644
--- a/drivers/clk/mediatek/clk-mt7622-aud.c
+++ b/drivers/clk/mediatek/clk-mt7622-aud.c
@@ -75,6 +75,7 @@ static const struct mtk_gate audio_clks[] = {
 	GATE_AUDIO1(CLK_AUDIO_A1SYS, "audio_a1sys", "a1sys_hp_sel", 21),
 	GATE_AUDIO1(CLK_AUDIO_A2SYS, "audio_a2sys", "a2sys_hp_sel", 22),
 	GATE_AUDIO1(CLK_AUDIO_AFE_CONN, "audio_afe_conn", "a1sys_hp_sel", 23),
+	GATE_AUDIO1(CLK_AUDIO_AFE_MRGIF, "audio_afe_mrgif", "aud_mux1_sel", 25),
 	/* AUDIO2 */
 	GATE_AUDIO2(CLK_AUDIO_UL1, "audio_ul1", "a1sys_hp_sel", 0),
 	GATE_AUDIO2(CLK_AUDIO_UL2, "audio_ul2", "a1sys_hp_sel", 1),
-- 
2.50.1


