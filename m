Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95375FD0056
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 08:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7FTeTejosz3HBWt4lvx3HRODQxLOqbKVT6yXP2mGuM=; b=fofdyxlFEObj9VgP+RjEtK7fzh
	VGmM3/lL5VVysQ85jkwgvcywX1DoRjkZ5GrDb1hgRSP2maEY1U2nruDqM6qtTun5AInWrpT6a3T/4
	Wlyv+wB/2xo6Nd4/7Do3BbQTt4eM1xmDeDpXtoK8fAjXZpjD5RPnqpfEqCV7cx7r6XFmDa/Zwdw48
	leadgW7t4dR2hwgehkmH740lFO3OEW1+0MSqt6LGA0f6E5gwaOZ7NEB9DeJTv4BtDtavPfRghmgj1
	vUtIPlNBR2w1GVuzUIs62ZzwINyrIjBDqin672gOL8xLkF9OYBkhvMDw77XSt368EKaTeGgtvun5V
	wuaxio0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwbpc-0000000AwTO-102T;
	Sun, 01 Mar 2026 08:07:16 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwbpA-0000000AwPc-2bLR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 08:07:15 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35691a231a7so2101167a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 00:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352408; x=1772957208; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7FTeTejosz3HBWt4lvx3HRODQxLOqbKVT6yXP2mGuM=;
        b=dnbV2lFK3uAAqbpXOgBvkqiZxlY8OQ+uFzdu8j4OF/FoufeVGKup9+2WIGKqV6EFPr
         MMxtO5XcX8JLVz+5X3lINlQcoqi48NsbmoLKffI+zc+ibPNnLmnvphsG2LLZHqiSIvzc
         MGiHYPW5jUOG7ra0Un5nuZhvayPmy45oe17JwxsA8nRucuiUCJEytW4pYyg6D9JerK+D
         3WmRqXEvhGs0HuVmEHMtQ6VhjoSzedZhIuS6z7W0nCY3Y3cR7FuaWnRDrsXTtOIwNQJ1
         HnqdqEHx7wBaWGMJTE8qsXZHGzFOXl/YNaot1JNEAm+OY6PeIarp89DtQelpV0hdW1i9
         XB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352408; x=1772957208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A7FTeTejosz3HBWt4lvx3HRODQxLOqbKVT6yXP2mGuM=;
        b=S8tVdwnFPQ7QjtPE5IzMlJh32bb8p6yLHFeEgVRPGVhhwe/qZVaNOswmnnF1kprFCh
         RneSof+XsJboS/miS3sANdgz2owlSeJHnkPTohVqEID3GEgpy2cKLJWCBP5MjwxpYEhy
         aA1q5KOBFMb8IASN06CctD93475WdUBGuPWanRpMn5UObMqI/tAeDdOmvdx0+UlyirrC
         1gij7Cn7XeM99w6m1EnGNkqrjkw63ZmlS8VYzihN/voeuJy3o4FRXB7gTKNEvl18FOtK
         pz/atatTM8yPQtEIst+zbgO6Qm4+IXpRzmrr+3Gl253S/2TkvLaPbHqFzDJKZpVmLIXF
         +3hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd/va9F3BYPL27wRHOTsGDaMKUUcIUhMSZw1CMDs+IMZPw39oAlA0aRVo4M312DFk9xkNWteMQSQEWal7w8ORS@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhvq+hEQ+0RX9qTj8wwFcJOL1eL6il2n44geyPVcvVC6R5+Zo+
	K0Gr/FBI/ORoD9AQ9XvDwL9rggolMnauwf9fsYqnG5Pgdrx4X3R4Z/K9
X-Gm-Gg: ATEYQzywFRREJ2tIcvLa+T49juE3hKRym4CUI+eT6O+cdKnQTgcydC9DmcBtwKgAK96
	ShxDPkNFF7BT3UAokAnbK2NMlyE0578AnzIFleNlxRChZTKsp4P74Ud+OsJJ1FBAVLbTiHM2r19
	Om5YWj2Nh+t0JLIMN+Mg9zyqv3S6VvagmpscBRNmke9+/EytXulKsYH47Hh05JIp/xj346WiOr1
	Ccxmn44ge2RplDetq2ztUB5hCDf7kjqZVaUZKgpHVO6rILRGWVnWQiL+Tk/tnN7MxL2poIPI1+t
	Na3gQghP/LHCAAUWU++jqVhtZGgMtyZ9T/HIgRN/FQQ8dhjvBMeEzefIRjpiiXC8sckvle5YxnL
	VSfAZIdH6Cn8iEZHJknLw1rmKdzbWie40WQGOHrHYQiiRTFJyF6N0so5XP95lRKZYCZBktNzuYO
	o/0uTc6nB3Iom6S2FuvNNLTUO8OJ12EXfLr+4aT1RJekTNItLYMfeZKdHv1y71FvSvSXY/mkNkb
	Oxw0mQzLNhnPjLeNMrDkvgwismEA28p0lFemeJJUXgndSHvNrhdBpxANB7t2V6aigIhvRhYsV3Q
X-Received: by 2002:a17:90a:f950:b0:356:22ef:57ba with SMTP id 98e67ed59e1d1-35965c17f28mr6826445a91.7.1772352407658;
        Sun, 01 Mar 2026 00:06:47 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:47 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:24 +1000
Subject: [PATCH v3 5/7] ASoC: soc-dai: add common operation to set TDM idle
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-5-c6ac5351489a@gmail.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
In-Reply-To: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3972;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=rqHc/7eJJOJ6QC/+Z/HBxx57SV1pobAnEybE9GKRIxI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6fHbmx7kXl96WTxidGSMsWbznFOqazZpjSdxWp3p
 OgcsdayjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFQHlTIy7H+vPHeZsVjRqpyjTIlX6t/3GuyeUMb6iHdldILNd5V78xj++y1kKM/
 kX1mzJXNuWVb416nGnxV5G11PqHusm5xx8qY2FwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_000713_895573_A349A7B2 
X-CRM114-Status: GOOD (  16.79  )
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
2.53.0


