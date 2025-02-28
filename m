Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2680DC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 08:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUPUHkJioUtE81ZsDkMXvltzeWnfkq7PCX4NoRG/jRo=; b=No+8F+B7syxojKi62ODUtlxpaP
	RcUcpARUzDe7TbiW7AvnRg179kBY9itvk8hK/4fmrfXCgICNNkkFOYqU09MHvfkmDLq2UnE6jkZyF
	N0syUFEPqQsT2F2J0kuleAx1eD4T8+Mg8o/2Ucy8nFRATEb4CD+uK1RTHDKYYFQwEbwPpdbzk/Uia
	oLjNFYVXT2Y7fqAhMrQuR2NFfyeyPF87mMLbu6U6gdP+TTN4pZ1ydLAztXyC4XBBHax8AeK13Get3
	jRJViOEFPd1vc9oz6YXwMl95OG6pmh0Vuo7ZWicphkiQzjmXJx2hp2qcNRQIQQxr3AxmRWVqis71J
	5q82NTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvU0-0000000A7VB-1aVk;
	Fri, 28 Feb 2025 08:12:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvMK-0000000A5Sa-26yB;
	Fri, 28 Feb 2025 08:04:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE0155C65ED;
	Fri, 28 Feb 2025 08:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16401C4CEEC;
	Fri, 28 Feb 2025 08:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740729875;
	bh=ng6uI31FAjjiJ3zN2b6BFVRcHb6da/jG3bCOtov0xR8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BuMvP8HcQPbFDZblaAHtwyevthCEThdUAmFubB4fZy1kc7ex68paXGglcurxMmynE
	 9TPLPP8TiX28p9Vfw5LCF/fqBSaEKZDz/aklPBDrdxaxeVCNwXlU8Oz0ke8XhI6Hfn
	 MDzh/hIU9kcesbjkUxqNDwqETmpqs1W8mmd2KrX+fAkXW7nsa0vcFXgZJorYVQVVTa
	 VLvXxOxEduRVrhZvxqem1JoLpKaC6oKUKgF3CHAIx5xNTJ/isgmyrEIC0eRXPkm4Fb
	 xSbWO7ycJDVsq8f7sjxEjoABIRoEEpvKgqIB6RDBxjjwHt2rtUIN0sHKtlR0CxUbEF
	 f7NxdmR9EGYxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBF3C19776;
	Fri, 28 Feb 2025 08:04:34 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Fri, 28 Feb 2025 16:04:10 +0800
Subject: [PATCH v3 2/6] dt-bindings: clock: axg-audio: Add mclk and sclk
 pad clock ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-audio_drvier-v3-2-dbfd30507e4c@amlogic.com>
References: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
In-Reply-To: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740729872; l=1189;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=88wOt7PQOZgMOfEb+IdY8ro91DFKMHUEezQLsKjA1uk=;
 b=NRb7Af0SblT1s22xNxsRpztqbejXeyPzRRg2nWh298Z5IoQTpEqvtOgqR6DJjvmHrLnx8SwyW
 EGfSy9Q/ZiyAGHFbaJF3z/DGlcR+FTMidRL7/jsHGQltd1mRooAru3S
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: jiebing chen <jiebing.chen@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_000436_697053_0DCCB418 
X-CRM114-Status: UNSURE (   8.41  )
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
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: jiebing chen <jiebing.chen@amlogic.com>

Add clock IDs for the mclk pads found on s4 SoCs

Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
---
 include/dt-bindings/clock/axg-audio-clkc.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
index 607f23b83fa7287fe0403682ebf827e2df26a1ce..75dde05343d1fa74304ee21c9ec0541a8f51b15e 100644
--- a/include/dt-bindings/clock/axg-audio-clkc.h
+++ b/include/dt-bindings/clock/axg-audio-clkc.h
@@ -162,5 +162,16 @@
 #define AUD_CLKID_EARCRX_DMAC_SEL	182
 #define AUD_CLKID_EARCRX_DMAC_DIV	183
 #define AUD_CLKID_EARCRX_DMAC		184
+#define AUD_CLKID_TDM_MCLK_PAD0_SEL     185
+#define AUD_CLKID_TDM_MCLK_PAD1_SEL     186
+#define AUD_CLKID_TDM_MCLK_PAD0_DIV     187
+#define AUD_CLKID_TDM_MCLK_PAD1_DIV     188
+#define AUD_CLKID_TDM_MCLK_PAD2         189
+#define AUD_CLKID_TDM_MCLK_PAD2_SEL     190
+#define AUD_CLKID_TDM_MCLK_PAD2_DIV     191
+#define AUD_CLKID_TDM_SCLK_PAD3		192
+#define AUD_CLKID_TDM_SCLK_PAD4		193
+#define AUD_CLKID_TDM_LRCLK_PAD3	194
+#define AUD_CLKID_TDM_LRCLK_PAD4	195
 
 #endif /* __AXG_AUDIO_CLKC_BINDINGS_H */

-- 
2.43.0



