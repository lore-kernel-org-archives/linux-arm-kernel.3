Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC28CC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 07:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUPUHkJioUtE81ZsDkMXvltzeWnfkq7PCX4NoRG/jRo=; b=KLd2XvXE9h78pdPQr3eVMxVjy8
	byQOV0pFQZcHDQe8VGI3X7W7mAF4iNMozmw6amw27BHeC8ItWEqSEcnU++kv7YE/gussnSC6d0xji
	FiWzs+wCDDMI+sjJHJAHUy88P21kenEM9owEevFjEdHSe4dsoC0VKZuMbk5LNsUJ7gsUucCZWQIVA
	omhWuumCqkROsBJV2+F+9QI8PAjqYOst7fEEDh56mMh6i6qxfYi7GofARTLaIVtbhbXb9s8yjB1U3
	x5aYBpGjW0MKZzovc8Z32Ne8OS0djzyx8RJQuR5jYUPtSQaaA/cZQzCzjeKsRKeq2ZNZwW1jSBwYo
	5wegilkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tunZ3-00000008BrD-1QaN;
	Wed, 19 Mar 2025 07:10:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tunVh-00000008BF8-38e0;
	Wed, 19 Mar 2025 07:06:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 927BD6157E;
	Wed, 19 Mar 2025 07:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2929CC4CEF3;
	Wed, 19 Mar 2025 07:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742368000;
	bh=ng6uI31FAjjiJ3zN2b6BFVRcHb6da/jG3bCOtov0xR8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OM3a5m6MGTdUoVvOTXhy1bS4dIMWp6F/udMJY2+UWRJjKi2S5CkNL53KwSyAxK7wA
	 qNVyUYTsOihrHlvYRJp/fjAlNU2rTUwRLnYWTmaHw5rmBfsAuBaYpjkvD7iz+lmEOW
	 XFXvVZR8cGAFBWdWyta3u4VldZM/6PoKxxNCbL+Oym2tUdM1h+UKDXQwyBD0Hw5xtl
	 9hTHw4R2UJ1MI7oKc0/ApXxaMdA/x1pSpfbRcmG26sl4V9fg5WoAjZ+1cxca+7ss9i
	 hVdf2IypM2r9iXepsXAeSb+uRrGEErVeHEqBAaho9JIZHoyTvvGU0bc5TyavKi3zEa
	 0ywAE4Wui5o4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158FAC36000;
	Wed, 19 Mar 2025 07:06:40 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Wed, 19 Mar 2025 15:04:45 +0800
Subject: [PATCH v4 2/6] dt-bindings: clock: axg-audio: Add mclk and sclk
 pad clock ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-audio_drvier-v4-2-686867fad719@amlogic.com>
References: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
In-Reply-To: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742367998; l=1189;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=88wOt7PQOZgMOfEb+IdY8ro91DFKMHUEezQLsKjA1uk=;
 b=6Awv4/sDOi7d1kZRycDwvlAIG2BhCFEPQVdcZp/+CrCD9WlyCulaecrQOOQeDq2oWsyHTEvbD
 Y7YxtQ0YX73CzSXzx3Q9SOCFf1ZOmVczivxGSAzhtrdXuBT1btxixwv
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: jiebing chen <jiebing.chen@amlogic.com>
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



