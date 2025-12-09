Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0925CD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wT5Tpa0cRknM+Vnr1JQ25hhT3yDeTWdGEabrHv7VB7g=; b=PRHduf6EjWWqaOEJZKxLOR+J5x
	Z6jTO3SSDA3D/tDQ3WWT0d8wnLIxMH0HAJIia+0s4WJL+ISvUv1R1nwPqJCRVPrIem3q5zCTlpWr9
	95TvXKPnlALw4BzCSPqQXenDMYBMsGOvohaU4Hb/TfecEKork3mGJg+6oASYSWiXC7LaXveNTd67k
	TdUNmULhiaBtbFJnZXQYWXxm1T1DMOMrV9D0d5hT5uko8s8OCwb5zKq1dz9lTztuBvkgOPQx8IfUo
	kWJyDmRSpc0alCu7de1pjhEfzw7W4v9p5anKF44Gk+cjE9t+Y0dAc9vEYLWwQ7N3mlVv+270xY8cr
	ShJbkr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu4q-0000000E38i-28uw;
	Tue, 09 Dec 2025 09:32:12 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu4o-0000000E378-0qSV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 09:32:11 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3434700be69so7655036a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 01:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272729; x=1765877529; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wT5Tpa0cRknM+Vnr1JQ25hhT3yDeTWdGEabrHv7VB7g=;
        b=ccBnH72BkWflw/BvAPPaON3ytlfcE0odW5ZxJaqG4XFnFVYDY8ua3F3X3JtCkebpqi
         Pit5tdk9ii97tnX2bWeOKvh/rlAucgNkcD3Q3bkLNeErZ5MeAZKzDf2AchCXjbxdeJ4W
         cJFaF0GhXJywIcb//1/Kd3oXNd2SXjFqbqu/lHq9Q0fJSnUU/xLLORwhwAatsUT/cUT6
         mT/e3l2nMUF8BPCrFnQPaxk4Ple1uynk/bm60q/v6pBBmBLEV4E83GF7tvfXJqlXsMJ+
         egc9OdkqYClYipGa6urwrbsVJBQtoyhk4DeGE0HIHhcw0q0Tb5H78EPlfbOjCKuXzDIp
         H1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272729; x=1765877529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wT5Tpa0cRknM+Vnr1JQ25hhT3yDeTWdGEabrHv7VB7g=;
        b=GN0MCztuoTh/C81czQVIUe9LNAWdQUDablXWNfqSl3SCBVjdToxAJ9PXYOBFllIRlz
         VKYE0T9rBP4LCnhfLWR0HR8MumfmCGY2fPHRQ3/k6Ox2U7+mBc3a/H4Z5wRTleQczIFz
         xY4ToJJTbvdhDdz9M5ObGbr+3CCjOSsYMLmc4SchZRgNjRXrhWKXvlFiibr3uGy0+j16
         XYySaSALrdCqgUJo67iPThqxKKr9jpod0Jq0Pc3Lo14+nHgr2s8GnpzB+tRNGhwZGZGE
         cvh57mmfcaEdV8YlU8kYByzFKm0Oqcc/UeriiBfaqDiSECz125kos4OdU45ASSGrG4yk
         nnkg==
X-Forwarded-Encrypted: i=1; AJvYcCUkkMr2LXK3qfGGZ7+gTIaL6CHKqbyvZEo03ySzrd44wMtBhMJHLfgLdlbeo2GfulCF+YHUwn4gCJFTgkcAbqNb@lists.infradead.org
X-Gm-Message-State: AOJu0YyJwCWYHM1l0OZYxFUuuCv6DCc7smz+e3u7QDoYGjZ7/b2ns6Tx
	TqGcoyjUOPL6eEqzjDX35IKwYi+zrpDqxqzaX2lICD/4HhZo1brpZImX
X-Gm-Gg: ASbGnct2YrGu7M/iMIY8DtJKr7i2EIW4nMln7Yp1Dr7hyPslQbHP/NJO55C921mxqTt
	GQGiENpkIXXcBDhH2FUSe/O8+XfBvjMPPO2nzUvKn+bjuAk3yK5FE5+Qp/1N4+qccKURYEKS0kW
	ksrDGT1PapOZJNnYuTArwR8zL0H2EENHiuXt149+S6iOBpHhcJNvC0ihzWEyJzXnh522UnIpflw
	1DdL4B3T3cBSenPzurrRCdJsI3yjHfli+DLZmnkR+zDkxGpFQAfTsZlFNu8O6IqqSBAeVycG2Vl
	2VqKz0jkYTFLjeiNP8ZipOcKdIhsVkvCTE+jR8FfqlpIEkd09ww55ufdaSErdffCU4J7mmuP7AO
	bQszS4Ramo4AVptUH/pcdbKs6JX+d/qnx3CW/TgWmwjj9Qu8U/wa9th2IM+1mW42ue2B+jkBekR
	PKEQEMyVVLwjbjT89EcQDEKQHrBtwpMuA7Z60FG9GoIz/PKadperLspFz1bg1HfoJFRbyUABIDr
	IqecjYcBek3IIyCuQz5e22Jlz+qybOuFIHKNnj3R1DNSosn2Ieaaj1XsxAOCjBk8j1vhdwDzcUq
	Uomsbx00BXrH0hztteR2Uybk2gnyAA9Cwp6Q2nJaDsDItjbsqfA=
X-Google-Smtp-Source: AGHT+IEf8k2cGwcYziNVTfhJRUNWm4Blk7mY9yN2+i0tDJn66zOZx4itoz7PdkJwqZ4b134kt4zn5Q==
X-Received: by 2002:a17:90b:3506:b0:340:bde5:c9e8 with SMTP id 98e67ed59e1d1-349a2613605mr9150879a91.22.1765272729310;
        Tue, 09 Dec 2025 01:32:09 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:32:09 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:18 +1000
Subject: [PATCH 5/7] ASoC: soc-dai: add common operation to set TDM idle
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-5-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
In-Reply-To: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3549;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9X7Ik0ab5d6Iz/18MVVGvVc22VgP6m21NK5Flfc6r74=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7I1nvHsL9CcfHRpJM/b7PymxSXtYfH8PI94VRjWN
 Nop1LR1TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MApvpKJcP/hCPlHm6PuVo3nGwJWLYz+8wxVlu1PgahH335M3Z3v1DmYWR4cPhcbHe
 w4rJdj2QFo7h+m50xEP60+dIS0Qn7l+jL39VkAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_013210_248717_C1638364 
X-CRM114-Status: GOOD (  14.42  )
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

Some audio devices, like certain Texas Instruments codecs, can be
configured to alter their behaviour when idle on the bus. Now that we
have definitions for various idle modes, add a snd_soc_dai_set_tdm_idle()
operation to control this in a standardised way.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h |  7 +++++
 sound/soc/soc-dai.c     | 40 +++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index a5784ef8e3f7..1f411237dde5 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -194,6 +194,10 @@ int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt);
 int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width);
 
+int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
+			     unsigned int tx_mask, unsigned int rx_mask,
+			     int tx_mode, int rx_mode);
+
 int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
 	unsigned int tx_num, const unsigned int *tx_slot,
 	unsigned int rx_num, const unsigned int *rx_slot);
@@ -310,6 +314,9 @@ struct snd_soc_dai_ops {
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


