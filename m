Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF58CCA46D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUGOkTgheWy5CuEi5lF+7B+pWPq6Cz4YPHhejKlj5Ew=; b=sv4LOnL8qEbOIdgY6ULUGlN3q6
	m/I22q6F9YvVtlWedh2njT7bdBoW20Co9XupuEtdCqkB9gso0AQA3i2ZTxXqnYkv9sdH8zMECWxbG
	INeZv8gILDgqYf4IsD+gMvrjAoFz2eO7zmp/sb3cve5ccMq7cIu9ZockEmw3CvEvuD3687JlR3Wrl
	xWEIL38H5HqBuam7ZE2c/67sfDP4NrFdyQfApGz23076lpJQRduKRkdyJJX0JMNKCyTcw8BrrC+14
	VAEIAFTs145GcU2j4ki2qgIjaV2V6ToLCoTpa3HdkuzZ8sT2MxV/xxlpTyVrUVIIzT2HDeeThCTQm
	p0AQRD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd5D-00000002It8-3jDF;
	Fri, 16 Oct 2026 08:14:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd5C-00000002Ise-2KYX;
	Fri, 16 Oct 2026 08:14:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0673942E38;
	Fri, 16 Oct 2026 08:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFB05C2BCFC;
	Fri, 16 Oct 2026 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792138469;
	bh=6MzXY6URcuyZMGe9mH9bcydnzkC4AGYAyCDj4+DY9rE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mMCA8c7+7OQUi9TopRTWXNRVcMFFZ+I8byPWFUaWakF503vQHPhFeDaDzrBm1TZFI
	 hCSaBoSfuaI1zqVATP0dgJKLwmtwOg6wgZfxwVoKq3qbDcusZZxGCcuvhb23ck31Jm
	 zc7nk0jdFEcu9eZdHIxuYi1YxpcBlx/ruD9hiqFqYo3kJwONHdmxDQZfyk5wJA+i0F
	 CEmelynrJbNP7JQLnVnejxlfuIJ6xpnoxTg8S5MW1RQJKygvlzKWLAXwqjzIlFfdfl
	 I1yM/y9vhjefoR8OYgfwgp7D3byF3KgoEnc2R1dUa9JBWxqfxY9EJobDH0YIm/1KfG
	 YbG8lhgZTWazA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3361CCA462;
	Fri, 16 Oct 2026 08:14:29 +0000 (UTC)
From: HuskerMinion via B4 Relay <devnull+mocker-mug-unwoven.duck.com@kernel.org>
Date: Fri, 16 Oct 2026 02:14:02 -0600
Subject: [PATCH 2/2] ASoC: mediatek: mt8183: Fix UL1_CH2 I2S0_CH2 routing
 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mt8183-afe-fixes-v1-2-f0db51e0c073@duck.com>
References: <20261016-mt8183-afe-fixes-v1-0-f0db51e0c073@duck.com>
In-Reply-To: <20261016-mt8183-afe-fixes-v1-0-f0db51e0c073@duck.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 HuskerMinion <mocker-mug-unwoven@duck.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792138468; l=1450;
 i=mocker-mug-unwoven@duck.com; s=20261016; h=from:subject:message-id;
 bh=mEWhlclh4rsOZ/4zrF6u9RE5QWi0z/CRm0Rz/ciL1HE=;
 b=6YXlyoF5BZSa8qalNwQEhwPQZX15OAoWl6Cwl3SmMzWojxGvBMbRuyUf4ivpDoMJbSHk0bkXW
 k1493RQj8XmBmDpzzjLmThkLYOaOUD56lijYARzfS8X/I4voQADCpZL
X-Developer-Key: i=mocker-mug-unwoven@duck.com; a=ed25519;
 pk=Q7l9BnP4XnFimCK28K+NVowcECqTaJNXicdBAInot0k=
X-Endpoint-Received: by B4 Relay for mocker-mug-unwoven@duck.com/20261016
 with auth_id=1206
X-Original-From: HuskerMinion <mocker-mug-unwoven@duck.com>
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
Reply-To: mocker-mug-unwoven@duck.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: HuskerMinion <mocker-mug-unwoven@duck.com>

The "I2S0_CH2" switch of the UL1_CH2 mixer writes AFE_CONN21. That is
the interconnect register for UL1 channel 1 (O21). Channel 2 is O22,
which is AFE_CONN22, as the "ADDA_UL_CH2" switch of the same mixer
already uses.

So enabling the switch routes I2S0 channel 2 into UL1 channel 1, mixed
with channel 1, and UL1 channel 2 gets nothing from I2S0.

Use AFE_CONN22.

Found while adding UL1 capture routes for the four microphones of the
Amazon Echo Show 8 (2nd gen). That board captures from I2S2, so the
I2S0 path itself is only compile tested.

Fixes: d232591c9482 ("ASoC: Mediatek: MT8183: add I2S2 control path from UL2 and UL3")
Signed-off-by: HuskerMinion <mocker-mug-unwoven@duck.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index d6175da3b..2b2ee0575 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -301,7 +301,7 @@ static const struct snd_kcontrol_new memif_ul1_ch1_mix[] = {
 static const struct snd_kcontrol_new memif_ul1_ch2_mix[] = {
 	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN22,
 				    I_ADDA_UL_CH2, 1, 0),
-	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2", AFE_CONN21,
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2", AFE_CONN22,
 				    I_I2S0_CH2, 1, 0),
 };
 

-- 
2.43.0



