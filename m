Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B64CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 22:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+FgDHRlDmcsgJ4VxNj4kBWd3s+eiFbP/oYJUJ1RSnuQ=; b=N6vzRhqVZU9ryW+Rg7DvsK/MmC
	KV7E9sTusteX/K4lqF+29johjJJxAzirt6tluiKbBPye/DuWY/q1T8FBGjhaVEw2ymuMWLauHpiA+
	Xd1PIqfzylNRtQ9dD/Zww+1AghLlJMtx7/PUbURZmrGOcCLS2h5nSl2Zig874r81MFgR79EiOy21V
	T8Z+TyitP/5h/T7Lv+CVmAWOQVgj8fnuQ42rLV7cTJvWSte4u2XaE2QNt88vVQbQkmKIjQ7C1K1/3
	zw6Y9JPhR/f3Bf6PHLpOmrRwx0olZOkUhYYDqUdQjrpfF+EsYqJeq6sB0ZmIZK4QawsPIEXPnICCG
	nQGfTUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tRt-00000000tmW-0XUf;
	Mon, 06 Oct 2025 22:12:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tRr-00000000tle-0zaG;
	Mon, 06 Oct 2025 22:12:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=+FgDHRlDmcsgJ4VxNj4kBWd3s+eiFbP/oYJUJ1RSnuQ=; b=hsOQl+UmySI8bLddQDrA14MXyF
	Rs+HUXKs/Z9SE8XcBJrPv64pXmgBi++F5ycV6sgoUmt+XD9ahMXXqimPoDM4ydlT+lw4/IuAgSI+q
	5MMim431opg0R4uAgwjkuqhGaJRL/XLR/8gjKFj5GMFaqpBgc8LxwI/QuwMdOARi+sNkz/a/GY8FW
	/T6xe9++wTeutiDFWgH15k9GjrNcsT5AtYTrSej8p3lObFPyqnfwpSEW/c6KItQ2wcz0SduvCRN3e
	KNJjIGkfC7GrIFugdeihMcMzH8f0AmsFaSj6KPTm+qRT8exCRMfcpraL7O9oXNdnj8V+KJhru5r/F
	0uPzWWlw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tRn-0000000HDVC-3e1Z;
	Mon, 06 Oct 2025 22:12:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6368240577;
	Mon,  6 Oct 2025 22:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B4E5C4CEF5;
	Mon,  6 Oct 2025 22:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759788763;
	bh=frN59PtaP2NnDY37GTjkkk5HaJHZi6o8TAEh204hsUw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Y990LoQPFXJep5tZcVNY1X9Hd8cChZMnMlx5TuuDQTTiBWY0EN2fa43UR8eP9lBFQ
	 tFi8EFE9pkzG55PxKvDK4znwjfZIgkOv4tYx7cpCjp9M7eXIxD03OBKV145pu6jYiP
	 RU37evp4JBS2qJ/t9HZXLfvlCX302REhA1DTENeJDAIEfm733lEyUDSAnDZ5IfMHIs
	 vDeZsC9h6WHfGYYYbd62VdmMuw4BvvORGHe19TsIt0Loxjqez3AlxTFNrJrueanflE
	 zN/bchdlMVAgYtOrtDdXk7aHPdGZS/fbj+GSjuwCU/XLZ2Symr4GWTf5hsKIslyt7x
	 n3KQESdCio3fg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2790DCCA471;
	Mon,  6 Oct 2025 22:12:43 +0000 (UTC)
From: Valerio Setti via B4 Relay <devnull+vsetti.baylibre.com@kernel.org>
Date: Tue, 07 Oct 2025 00:12:19 +0200
Subject: [PATCH] ASoC: meson: aiu-encoder-i2s: fix bit clock polarity
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-fix-i2s-polarity-v1-1-86704d9cda10@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAMI+5GgC/x2MWwqAIBAArxL73YKt9qCrRB9SWy2EhkYU0t2TP
 gdmJkHkIByhLxIEviSKdxmqsoBps25llDkzkKK6UqrBRW4Uinj43QY5H5xbY7TuFkukIWdH4Oz
 8y2F83w/n6ZUSYgAAAA==
X-Change-ID: 20251006-fix-i2s-polarity-d744338fa223
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584;
 i=vsetti@baylibre.com; h=from:subject:message-id;
 bh=yhS4Hp8u/Or3vlCBo8NKBwUHK5bFZ95+lSDqT7ffm68=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDBlP7G7Vcrw8+WNXspbGklMbFI6a5LY+1/gg9v5pfgqHn
 ozu2umiHaUsDGIcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZhIlAzDT0aRdVUTjRINNFhD
 Sg6cPrPmuFXCOu/OksauQpW5T2W/+zIy/FO7m1Wq8VTx9nf/GRt3bdV6nfajzTH9xteVf6afa9P
 azgAA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-Endpoint-Received: by B4 Relay for vsetti@baylibre.com/default with
 auth_id=515
X-Original-From: Valerio Setti <vsetti@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_231248_441772_3AC4F69B 
X-CRM114-Status: GOOD (  13.14  )
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
Reply-To: vsetti@baylibre.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Valerio Setti <vsetti@baylibre.com>

According to I2S specs audio data is sampled on the rising edge of the
clock and it can change on the falling one. When operating in normal mode
this SoC behaves the opposite so a clock polarity inversion is required
in this case.

This was tested on an OdroidC2 (Amlogic S905 SoC) board.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index a0dd914c8ed13616fbcbc0828e36418cfd255391..3b4061508c18047fe8d6f3f98061720f8ce238f2 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -236,8 +236,12 @@ static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	    inv == SND_SOC_DAIFMT_IB_IF)
 		val |= AIU_CLK_CTRL_LRCLK_INVERT;
 
-	if (inv == SND_SOC_DAIFMT_IB_NF ||
-	    inv == SND_SOC_DAIFMT_IB_IF)
+	/*
+	 * The SoC changes data on the rising edge of the bitclock
+	 * so an inversion of the bitclock is required in normal mode
+	 */
+	if (inv == SND_SOC_DAIFMT_NB_NF ||
+	    inv == SND_SOC_DAIFMT_NB_IF)
 		val |= AIU_CLK_CTRL_AOCLK_INVERT;
 
 	/* Signal skew */
@@ -328,4 +332,3 @@ const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops = {
 	.startup	= aiu_encoder_i2s_startup,
 	.shutdown	= aiu_encoder_i2s_shutdown,
 };
-

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20251006-fix-i2s-polarity-d744338fa223

Best regards,
-- 
Valerio Setti <vsetti@baylibre.com>



