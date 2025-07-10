Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DF1C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 03:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vzMmuklijZS4Zh9NcnGkYlj38ToHYdArOYpLkrLoOA=; b=WxVDIOv23JlQFm1+e6joXeagCD
	KfAlZlIFBGR212VNs2xihdYRGo6hxM9K4bdrjS36+DBMd74RC5OlFHUxtps7K6JlRzA7aYHShnnDm
	vcT4lsup73Vhxo4SIoIGhkqJ9YkRzazqN5UNDmEomxANjdMlGZ04NXADGV+VnOd+jceACNKg2kq+1
	hQ70Q6tkwXW3RmSaamfixB+qUqxqMC2ZR9q0qeZMvAhsDPYEouPdTZtZmAWqtdbe1iFZ3BcMxi5E8
	US4TRnSTCHhEQzVvuzBFLyUqadTHF/vGr4ISJIMSEoaJ6cf2RHoYnRC8Bnzt8mXWjUYHQFfxdD/aW
	ht1NGT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZiJ2-0000000AcXF-1LDc;
	Thu, 10 Jul 2025 03:50:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZi4z-0000000AaXy-48t4;
	Thu, 10 Jul 2025 03:36:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A55BA5C6A24;
	Thu, 10 Jul 2025 03:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE029C4CEF0;
	Thu, 10 Jul 2025 03:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752118572;
	bh=mpUMB0zy8d4IkeeacZr5LroYN19aKGV0mgmO87Hknc0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MqmYIC2TvUl5cqXOetMbnAjWs3Jty+0b+VeS3iOpYlas7PKaDOMS9frp39TLXrFig
	 iCiTYJCYoJFi02Mzgv85Lo9di/0EUJ4dppZ0DaOTDxAXzZC60zrQm1TI9ZB5HfD0V5
	 UimsrqSDtPlqCRPMiC56sXkGkxeXAfjYFImyPm1uuh97gV8l6APP5W+XpiMhvRcMeL
	 uhk7mtCiipM3/qmC72yv+5poROjyNj/iOgV+aTrak1IZXverHozEaxWQFQw0dn9d3+
	 IRstQ2zuRCRGYT7XR3ggBorJbsdpc4+KSqjcejvVSftPbFGStHbsU5wy1f8I8MIshT
	 CXsfsKIramVYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B3CC83F15;
	Thu, 10 Jul 2025 03:36:11 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Thu, 10 Jul 2025 11:35:38 +0800
Subject: [PATCH v5 2/6] dt-bindings: clock: axg-audio: Add mclk and sclk
 pad clock ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-audio_drvier-v5-2-d4155f1e7464@amlogic.com>
References: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
In-Reply-To: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752118569; l=1242;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=IyTHVLGWO5xe9zBV3oLCL3jIvL/ZzNRNr/wMbGfHF7Q=;
 b=wLH8mhxBd9/NHwiDozn4mbXi1/wluasl2S2512oRM2xJvxwZrYsNQAvd251pRYetBh4ZvD67A
 uwwz2NjZuy5C8i3KK3aVOwBADF8/XT+nypbpGtcMPdTlWG7RoZtH5Fd
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: jiebing chen <jiebing.chen@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_203614_166114_3F6BD25B 
X-CRM114-Status: UNSURE (   8.33  )
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

Add clock ID definitions for the MCLK pads on S4 SoCs.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
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



