Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE01FD0058
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 08:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COktpS70G1jBT7Oq0awQeJHx1NZJeipbMMF36OzY5Z0=; b=lK8BqsInCOrl0sRfRncj41x62h
	yc6CMbzp4H1idIDJlXw7bjwvffyfazIWfovWnz/YNp1uZ5ZYSWHunwVh6caw5IfMz1TNwY41rUDmb
	YHk+jUdsBZ1fYuxz2MOY5fQtZkl+ZyEOzHSf3ZLMZFCpeofh1HZM9u146CapSBWs2gX6g/v6cMWly
	/WX0N7P5UPhO8r33SYYi9+enWGDnkgjC4+o2KJPVMObxIM8RaqA3On1DKxsZf8u/lsC9a5ICqwHYX
	c8q7CPaAqhv9yjqE6AqdCB85Vjo7+wrl9SXg6MfBE/Wym5Wk2cMsPJLKoUkeKv11tH5lFW/JkIfi9
	MMjVLGOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwbp5-0000000AwNj-26wV;
	Sun, 01 Mar 2026 08:06:43 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwbp2-0000000AwLg-3ZXk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 08:06:42 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3562e858da5so1467071a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 00:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352400; x=1772957200; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COktpS70G1jBT7Oq0awQeJHx1NZJeipbMMF36OzY5Z0=;
        b=CMyy39XaFI+OZepECDbovb8ximimdtDo7z0X05/OtX1mIigph/iuH4ElcF3O+i+ONG
         KTyZDjry2LnkIq9NmqN/sLR04EDaEGV7XuGdEqT6JXkaptbmXeJuiayTGkrSzfGT8CYx
         j2tc6P5ABfR4D1mR0su+aA6sslqX468t+OZHBqkJ3CJ9qxXLyHvHfegSYfIzGWg2xVbL
         cyUia4K+xgzEu1Ua4tvsQmkxrefOZg68IqSN6jhj2DCWPbO2Bc7y0Vw7CDUD6X8Dl18z
         NQF5Ir4/w1puZ2898r3W+YGHrs7Tx5x9qvJtdw6mcU0H4XG1wiNIMQ5FZR24c0St0FOR
         k8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352400; x=1772957200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=COktpS70G1jBT7Oq0awQeJHx1NZJeipbMMF36OzY5Z0=;
        b=Ab78MTR7JCVhiZK9ycOsY6CC0tlTXPz5YLeu9sJg1UAIY7toUZLVJp5Ihdsdj5wMOJ
         9pm2MCSOkzSw5DzSxCXRlTr8V5raJwvZ29yOi6Nuifd2O+BrW8iTRv3DFx3xdYhnwO9f
         ca1prlLi4pJ6lAHUUE+u9BAvJ+WQgVswYOLrAc4PZnK4fmtVUmxwTVfP5n04kahNzpNa
         RUdLdXnAYmj4Z+YeR1440PTwz4AO9GyuvHZOhzYqHSwGk6OY3FUxy6hoE6YKuDIpaV7p
         bww/WqpQS3jdJBpLWMVp2x9HSvAY8tG3oSytTOWfKP2SxJgCm+LwslkRSNnYaBbhenaL
         u/Og==
X-Forwarded-Encrypted: i=1; AJvYcCXKuIAbAwFykVgoZ3MMjLNSt6XRrEvx/G/F6iLo8eWwaatyQI9BHf2yzlwjPQyTyQWt55ydgPj9zgf3Y8gaxV9v@lists.infradead.org
X-Gm-Message-State: AOJu0YxLNjG2TkJXJoMU6iWTADLVoAjraHAPE2QKjffq8V5NBeEXpymc
	djCVuSbzD5k/pW6Sin6eN+pRWs15sFxgSJ/MhxgsrHZx80FehMUqE7t6
X-Gm-Gg: ATEYQzxuzdlT10xj+Av7MXWlTtu2UPGDfKKaxE1WzG14RG+HfxUocV2TEK24ULOLyV7
	KJ+rYvYZ6mVFn7Ux/RI+k0czLZPeUto2RpYeJ+7w5ymoheQYx+0CO6o7JMYJKMdOFgWVG3VCVRh
	QzhL+iscqHF+P5ufdqAUSNZJePGdmxAabcjwtKd2jHy/BhxwE0IQV92SmJDk72MmJVacC1GEErd
	4BKWVxXaCSGRDSqEPgkAgf4RPiFc6dS+dXKF0LlNqDuFYLaCM0kG2H5fLKymdI8U6nZAITYq33R
	KI7vU++TFkxXGGMtbc1wuK1AzvnYZ5VyBk6AkxmRodT24ZA/qABTFWYd1gjfYwfflXvAzqZJhmN
	CzrRbshqIEBbeCE2+o8pOt8ek5zCImLa9M0qV+Rqf4vQqQcgBG5+8M2QrIrc0OYuIwu8KujeSPE
	7I7K892GLlZepxggVcgeEe8nWfX4v9NUXosvnKT0BFyCpHHCqst2v9J4HJMV+SQ2rVVMHAk7J1c
	vQ0k1fXBJqQ5O5t+IAAe82PHEm5Qi0McSqYzLXDGgl+3i3Ofvnaomt/YA89RjlHlMpsb9bDVY3u
X-Received: by 2002:a17:90a:fd97:b0:349:3fe8:e7de with SMTP id 98e67ed59e1d1-35965cd1066mr4480685a91.28.1772352399832;
        Sun, 01 Mar 2026 00:06:39 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:39 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:23 +1000
Subject: [PATCH v3 4/7] ASoC: soc-dai: define possible idle TDM slot modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-4-c6ac5351489a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2335;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=VyTWRPS81+vOo86P7NyB7zBl67kC7Sarhern+hi6yV0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6fXyj+ot16S9/zirdpppzcc2LDlnapn6bXO1G+Hz
 6y9z3LmXMdEFgYxLgZLMUWWDU1CHrON2G72i1TuhZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqJ+gx/GJO9N22/us5k96pFR4/V7C08c4w3xVVcFidZcP8zCcfjNIZGQ6lTXT
 u+PN3rYrwtOxN968V75nySMXRV/eSfPhus8QJ+iwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_000641_003731_A992C598 
X-CRM114-Status: GOOD (  13.58  )
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

Some audio devices, such as certain Texas Instruments codecs,
include configurable bus keepers. We currently don't have
a standardised way to configure such hardware, and instead
rely on the hardware initialising setting itself up into a
sane state. There are situations where this is insufficient,
however, and some platforms require more concrete guarantees
as to the state of the bus, and being able to explicitly
configure bus keepers enables this.

For example, some Apple Silicon machines have an odd bus topology where
the SDOUT pins of all codecs are split across two data lines, which
are summed via an OR gate in front of the receiving port on the
SoC's I2S peripheral. Each line must transmit 0 while a codec
on the other line is actively transmitting data, or the SoC
will receive garbage data. To do this, one codec on each line
must be configured to transmit zeroes during the other line's
active TDM slots.

Thus, we define seven possible bus-keeping modes that a device can
be in: NONE (UB/as initialised), OFF (explicitly disabled), ZERO
(actively transmit a 0), PULLDOWN, HIZ (floating), PULLUP, and
DRIVE_HIGH.

These will be consumed by CODEC/CPU drivers via a common DAI
op, enabling the explicit configuration of bus keepers where
required.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 224396927aef..44dd06add52e 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -52,6 +52,21 @@ struct snd_compr_stream;
 #define SND_SOC_POSSIBLE_DAIFMT_AC97		(1 << SND_SOC_DAI_FORMAT_AC97)
 #define SND_SOC_POSSIBLE_DAIFMT_PDM		(1 << SND_SOC_DAI_FORMAT_PDM)
 
+/*
+ * DAI TDM slot idle modes
+ *
+ * Describes a CODEC/CPU's behaviour when not actively receiving or
+ * transmitting on a given TDM slot. NONE is undefined behaviour.
+ * Add new modes to the end.
+ */
+#define SND_SOC_DAI_TDM_IDLE_NONE	0
+#define SND_SOC_DAI_TDM_IDLE_OFF	1
+#define SND_SOC_DAI_TDM_IDLE_ZERO	2
+#define SND_SOC_DAI_TDM_IDLE_PULLDOWN	3
+#define SND_SOC_DAI_TDM_IDLE_HIZ	4
+#define SND_SOC_DAI_TDM_IDLE_PULLUP	5
+#define SND_SOC_DAI_TDM_IDLE_DRIVE_HIGH	6
+
 /*
  * DAI Clock gating.
  *

-- 
2.53.0


