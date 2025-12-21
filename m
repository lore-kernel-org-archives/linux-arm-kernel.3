Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F368ED68BD5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loH8pZ21h3HnsJhHTf084VIuLNxonqEp7O6yoOmUAfQ=; b=Gt7+vc55NVNld+jFissYNo3IpZ
	wSrUU8cSy44Ddwp9tRk+6ODhJs4f30qKMgj/5SgfVRFvNtdvyze8O2eqIQzo2SlV+C8aTYQAkhvMG
	lOXoCdaFWL6+MI2qyUV4M5OcG3tIcOxLUQe7NmUe+h00yz3YK4664nF90Ta6GjrVu77gqNxqy3YiJ
	hAhlcBB5DhAGoXKxNvgnHA3zX/NYnGNxippQf6qK7aMoTkiae17UmivgWX2dBFE43kvwPiJCQRHla
	/2g31rdSBOCwuwyx4HfoXa7ByyYgKPrFqeFr5dO3M/gTbLdCpFnunOsNMX7Nnc3vZ1Npjy6BVXBRK
	SOvyGiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFsG-0000000CI6s-0MM4;
	Sun, 21 Dec 2025 09:37:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFsA-0000000CI3t-0XM0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 09:37:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-29f30233d8aso39207805ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 01:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309825; x=1766914625; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loH8pZ21h3HnsJhHTf084VIuLNxonqEp7O6yoOmUAfQ=;
        b=mCzSoweYEMM3JrCd8zpcxWVvw0aTVUvRNwUVtFB+AgLiDk7/ECsF1q9xvFz+g0UTyR
         qy6MyVZiDad2lYtNset29zoLScjDPq9ibAhttFODx8P5BqF64Uh5EYAlEP4drJVvPTWI
         mj3THSXT/e7X7GT1KLdhnQ3twGCcSUD/7NLd/EAIM8H8MeRMaDoZN3pGMz8FctKLeR7h
         ahk/knQ3dSI6R2iKAbwdo/aOPsCEGWuHjiqyuPkyqFe5HABO2aOQdeLfcS/ZnX69q5DB
         ExPX3HJshqg7Eky1RiG0++c06spYQ/EVKT+BIMNO6uGdtQvm2726dFX7PMYFovjv0FE5
         77xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309825; x=1766914625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=loH8pZ21h3HnsJhHTf084VIuLNxonqEp7O6yoOmUAfQ=;
        b=vAdhzJ1BhaWi9oRw0YAX+XcaunX6ce5XMBaSLUsPbKikeLrL1klkIqK0DoV99eHbFE
         ouyTnM+KdZsX7WEASXkEGS1QNOLP6vbLUk4woaFEWC5JnVOR2HeesCkMpQe0dxmHS8YB
         sSRYuFkUXRVz5IG8NOXai5MveVv+K/ilW3EvSjjhG4lk4beX5hUrGGF7PkOQ75Y6pYym
         hlPh4H2KXiHXLqfHd/K+gYtiN9acCqARehZhyOTbgjjRE6S9T9CbaY130dIsg1n1or4f
         js+aM/G8AbPhQ0bysVtxKHxwhp15W0rWX1xH/XjY/7HDaxhOZ49g04Ql7qT054/gBZTW
         SlAg==
X-Forwarded-Encrypted: i=1; AJvYcCWbNVp6hBumDwrhgmGKxQSovpCz9sN79FxIsplsUaW+hJtyDfl3x0i1XaLQhnGt/zg/6AC3mp2xDH6Qy/QzCCTh@lists.infradead.org
X-Gm-Message-State: AOJu0YwPxEcmZ28BbULMjeG+FO89QrRHiNiS18ZA7jg4aRtkwsoHGUw+
	h/5WooDXS76n9WS0ETvKSBxuZ2Q4SDm2SuC2DlbZFJQBe9eRfD/CFWe/
X-Gm-Gg: AY/fxX5pdLSwCmCDXZUJw6C0JvgNWVlS17WyTMasusgq9ld4EbPk+axAXUEOuGAY8yq
	UsNmLdf3j28PFeGwJvx9CnbwTJ4Oy9X9LiBgj+DxrwNhSNu0BwnqxsneIgTCnw6G9VPfBX4rElG
	EgWMjusGGn5+K/4xePW+VyrHuAeURuz17fyTIXOFYCrH92g34sgdFH4xtqAalM8CAWCrVKGeeiI
	2rcvSAvXsLsE+QISY1qAO41MGYFPQoIKI7V9qmUdQaNT+nm1b4yaXJKwzYR9NnF+Avpr6vbphRT
	adDzG751X2ols9zQ/CGYGSS1sZv3Jxv0N9+xt5BnIlZ3gE+a7KPNuxsx3J0fLbVdAboQbTJeZ8k
	ris338VXijE1k/5r2b9cHPwtw/cUg9AfHyJ5mVJFCbicITJcO67vwMLWFMtJUCQ5a3YOxmnrqlP
	2eSR2WG/9xkszQHIuRU+qyExfoTdgtbxMXehL4WBxYorBRLsmawWVr16CH25OJlttsKk9n4AsWq
	HtqTj8cMu8etOKLs4VNdpds4/nUDaPJV3rzhRCxdkBoGYxZskaNHHJL1j13SVPyuVuzCUrEmCAB
	I4g+n1cQhzCbna9aU/IVJjghT3WrO9TkQzHG7RW6QqxylcambyU=
X-Google-Smtp-Source: AGHT+IHTEvxzKwKOsqk6jxiFy1KEjLTBz6tFUpjwHXJ/UFHqcxf2UMgauXjpc/2YVHZ7EdAOXNaDmg==
X-Received: by 2002:a17:902:e803:b0:2a0:d5b0:dd82 with SMTP id d9443c01a7336-2a2f2a420e1mr78890355ad.61.1766309825148;
        Sun, 21 Dec 2025 01:37:05 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:37:04 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:36:01 +1000
Subject: [PATCH v2 5/7] ASoC: soc-dai: add common operation to set TDM idle
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-5-ed4d96413aec@gmail.com>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
In-Reply-To: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3972;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=dYxrT04YcQdwO6b5nzPFQQREgLbm70Vca80uGYbXBbc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yf3en2e913tbLCZc/CEUy8ENxvx9r1wfNd5xNuJt
 63AcXVPx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 DXWMdYwYuDgFYKp/qDIyrFjrs0FXc0XYTlemLQmTiiatvJr6yCB+1jZBG8Xaq4+iTRn+h/7JuKk
 otcZRSbTkvkCAvWCqxiPJa7Jheit+PD3MIjybCwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_013706_175488_2D031959 
X-CRM114-Status: GOOD (  15.79  )
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

Some audio devices, like certain Texas Instruments codecs, integrate
configurable bus keepers that dictate the codec's behaviour during
idle TDM slots. Now that we have definitions for various idle modes,
add a snd_soc_dai_set_tdm_idle() operation to control this in a
standardised way.

This is useful on Apple Silicon laptops, where a single I2S bus is
comprised of two physical lines which are ORed just before the
receiving port. When a codec on one line is transmitting, we must
guarantee that the other line is low. We can achieve this by
configuring one codec on each line to use its bus keeper to fill
its line with zeroes during the active slots of the other line.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h |  7 +++++
 sound/soc/soc-dai.c     | 40 +++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 44dd06add52e..6a42812bba8c 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -196,6 +196,10 @@ int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt);
 int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width);
 
+int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
+			     unsigned int tx_mask, unsigned int rx_mask,
+			     int tx_mode, int rx_mode);
+
 int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
 	unsigned int tx_num, const unsigned int *tx_slot,
 	unsigned int rx_num, const unsigned int *rx_slot);
@@ -312,6 +316,9 @@ struct snd_soc_dai_ops {
 	int (*set_tdm_slot)(struct snd_soc_dai *dai,
 		unsigned int tx_mask, unsigned int rx_mask,
 		int slots, int slot_width);
+	int (*set_tdm_idle)(struct snd_soc_dai *dai,
+			    unsigned int tx_mask, unsigned int rx_mask,
+			    int tx_mode, int rx_mode);
 	int (*set_channel_map)(struct snd_soc_dai *dai,
 		unsigned int tx_num, const unsigned int *tx_slot,
 		unsigned int rx_num, const unsigned int *rx_slot);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index a1e05307067d..2f370fda1266 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -282,6 +282,46 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_tdm_slot);
 
+/**
+ * snd_soc_dai_set_tdm_idle() - Configure a DAI's TDM idle mode
+ * @dai: The DAI to configure
+ * @tx_mask: bitmask representing idle TX slots.
+ * @rx_mask: bitmask representing idle RX slots.
+ * @tx_mode: idle mode to set for TX slots.
+ * @rx_mode: idle mode to set for RX slots.
+ *
+ * This function configures the DAI to handle idle TDM slots in the
+ * specified manner. @tx_mode and @rx_mode can be one of
+ * SND_SOC_DAI_TDM_IDLE_NONE, SND_SOC_DAI_TDM_IDLE_ZERO,
+ * SND_SOC_DAI_TDM_IDLE_PULLDOWN, or SND_SOC_DAI_TDM_IDLE_HIZ.
+ * SND_SOC_TDM_IDLE_NONE represents the DAI's default/unset idle slot
+ * handling state and could be any of the other modes depending on the
+ * hardware behind the DAI. It is therefore undefined behaviour when set
+ * explicitly.
+ *
+ * Mode and mask can be set independently for both the TX and RX direction.
+ * Some hardware may ignore both TX and RX masks depending on its
+ * capabilities.
+ */
+int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
+			     unsigned int tx_mask, unsigned int rx_mask,
+			     int tx_mode, int rx_mode)
+{
+	int ret = -EOPNOTSUPP;
+
+	/* You can't write to the RX line */
+	if (rx_mode == SND_SOC_DAI_TDM_IDLE_ZERO)
+		return soc_dai_ret(dai, -EINVAL);
+
+	if (dai->driver->ops &&
+	    dai->driver->ops->set_tdm_idle)
+		ret = dai->driver->ops->set_tdm_idle(dai, tx_mask, rx_mask,
+						     tx_mode, rx_mode);
+
+	return soc_dai_ret(dai, ret);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_tdm_idle);
+
 /**
  * snd_soc_dai_set_channel_map - configure DAI audio channel map
  * @dai: DAI

-- 
2.52.0


