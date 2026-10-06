Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE60CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=; b=IW4qPVya5h7AFr/B5LiMsYMHSx
	BTi697WwquhkqHjH4mJ7+DiXiumTvRa7r3gr1M+7Zo+Sf50XWDmWFDeCCwnP8l8RyVNV51GXVKEfU
	zcg2ImveJWzvKU/ht9/wi9vEGZRbZibpB3JIEJZB9ShmWfN+v5HilOfnQWz4W2kiV9fP58lVHCdJX
	NlnYN7zfu03/agZtXQN2mlzpfG9nKpCXwqFAYMULthAxWVC4t0v80oMzF7M+phOmdDT3Cf2AEcIys
	jNZopTHHZ+dRsrduTITFSC9fE2yuIczJDJl9Qf6xMosGafhiqdUk5CCwFrPcCq+maPCSZtyrXnLto
	ph/byIQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2E8-00000000Tp3-11Ms;
	Tue, 06 Oct 2026 10:16:52 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2E2-00000000TkS-1J71
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:16:50 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-ca12086c06eso224757a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281805; x=1791886605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=;
        b=KLiKJBW+gRwbNxr3jbSqNaxae5khGQHBmLnYTVMKK/P/J+W7p8e+tmGeY3SfI4Z5Kq
         l9zZDV1gKf+EYIsYqzuo+rXc5IL2+qLWGqF4+7irJPAFkbx2zaAAd98Oe9G0ALELQK+z
         Hk9iZfWauDTnwXi0S9vuZCU4u0cp0zKfxbQV/Y8dmqX6OT7jEmsSspEOCGaWhzpnQQpt
         xAbkScFF+1gYEuREuW5lnYOUttWxwAimYhTfwPlx82f5P0JL6nO0akc8VRX5gRBWNxJe
         sC3D637JT/GdUWTW6gzQVcCc+JNjulP3JLIp2DunqnbTd9io2U1yBRtDJ4ze2zxXxRxG
         hoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281805; x=1791886605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=;
        b=P4gjTNig7X7LQOPQvwIsPy7bU8GpErv+fFhTgrTM/g4IwKvu8pPuPpemWdXJvvG7rG
         +3Rtok43tBQ1t+wJ6UgbW/WzFDnsr2QSJPjVB6FQ+WH/fE4i7cGql3fD++ZVsI8tX3Vr
         vSlyoe6vmkxmpq0O06ZILA2SlHPrCIXD74S//yj1C0rJi79h3I3UStHGszOPYuwyXcyA
         aorCtvzqSMWdUMwT3UV9b5BFQSlvbQdXCIKGtMTuyC4mrM258Ze1+QRx/vcrfDcdzILC
         itB0m1El4LHb+uZ4dyFt+QzVt9RdLyczmEQTvp3xnaYkcYXL0fxgpJ9s6WP7/361JESq
         e62w==
X-Forwarded-Encrypted: i=1; AKwUvBxqON9oxzZXfLMHz40q41J3k4wMlOnz1E+iPt5TLJXqY/j+y9scr3Zihmjm9RQhKh+K9cweac5rLB+weQdPSh8f@lists.infradead.org
X-Gm-Message-State: AFuF++mWRSyKRinj9IJ5aJoUR+TUc5RHCflqbunsdgtIbzM3yi72Z6+t
	CmV+sJDcJjPArywqJRIBQq7BogZWsvTvb73oyevF+HO0ip1hS9YUM2QW
X-Gm-Gg: AYBFou0IY7bIAom+FqYRc3fUKk8MC4VcloSPQ7z+VxN9azd2JnyAugZv8j6HdBR7DMY
	xb2tSwXod9LABry2ysg0pe5oSCchWlBsazphewYyBq+tsQfLKFXIw462f+5+XepsEtGhu6tL7Eo
	djUIqOPp9px19uAV2FA4FOOuU4/VVttgo54InDfTzAWdMMGU4gJVZPwMEVJKC/CZr8EzwEhkXc1
	c4lc32s1jSoCgGtoEpDJPtO1DL+5+Y6msYrpnY69oyS3LN/hrN8uwmBirfFzEfwXYNcSjxVoKRf
	8SCVElQQF2W+Uurtx1o/0fnbs369Dx0gM7NO7e+Md4H0zqiSINY+wmEg2K3L5TJwwurjYqonyEe
	p7EkOpMzPP++mI2vFfwQGKg6+WqGRtLxR6naEm3gYBXPBbB82BwBsZxQbveqBex3Qsgky7Z/wNG
	sJZA+591m6Q10RTJNfliMjpSNvioM0YGZuTJ0WfUG1NRBp30cKFEHQq19LJZqjw8cIHa2iDWvLh
	wfcl0gkdSFVWyFLhGlO9DiRcaU7EdUUjidssPuDhnjOjIcwXvl0HvJFkHjG58CiylyY3w17lDOX
	2rpb+qYPpAFPag==
X-Received: by 2002:a05:6a20:c70b:b0:3dd:a196:69ec with SMTP id adf61e73a8af0-3e12492c658mr784333637.71.1791281805254;
        Tue, 06 Oct 2026 03:16:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/4] ASoC: mediatek: mt8189:return 0 from mt8189_fe_startup() on success
Date: Tue,  6 Oct 2026 17:16:05 +0700
Message-ID: <20261006101606.54079-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_031646_369741_36028269 
X-CRM114-Status: GOOD (  14.26  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mt8189_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index c0f340a6cc09..eefa96b701a5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -155,8 +155,10 @@ static int mt8189_fe_startup(struct snd_pcm_substream *substream,
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_warn(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	/* dynamic allocate irq to memif */
 	if (memif->irq_usage < 0) {
@@ -168,11 +170,11 @@ static int mt8189_fe_startup(struct snd_pcm_substream *substream,
 		} else {
 			dev_err(afe->dev, "%s() error: no more asys irq\n",
 				__func__);
-			ret = -EBUSY;
+			return -EBUSY;
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 static void mt8189_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


