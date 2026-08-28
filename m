Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F05C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=; b=YG/uY7gWh63KhCYbLtDeoJAvhK
	iYa4hkoT1RYs/ohPtkBRG+glGG7//9j1fGH4dogejYIsR7gtTYehsjviD/kWavaCJy1yjRyfUe+8T
	28jwZVSKeJuvyV+nNQ+tIAVh2Ny2X+kaRSNQA7RbSJ53UzXynH3dnJV+IyaPGSzogGqoAgu8xYT9m
	vkDG2wbsOhiTibtZPyMz0v84eyPcgQ1iySwTDHo45UFwOHAahsioKJH2Zxo5vsn7Hly5Oqfk07BN3
	QdLGikvRMo/ss5UX1pSD7XTB3D/+UKG7+lsagBgNLSp0iz9fXgR/qsgjiexqhJ+GLi/95ezyIARr6
	m4g7YGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshW-00000005Qnl-2sYd;
	Fri, 28 Aug 2026 09:16:42 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshF-00000005QXo-1pa7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 09:16:26 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8548db7428aso639342b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908584; x=1788513384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=;
        b=UggPa5hbkpQSatLgNdrEliKqFiIi2JUoCstIsiaUl+mtAO7gJZr83D8xbzyeaAN1rk
         Akk5VX/03FOrYBYSCpRfJEyog7W6H9AE/YGxLSLPO38LTZlN3r24PNcYXk+3Cuh91C1X
         vQlfc0zZ5+ZBV8z68SUUnrw4mhqIFjOJIVe25uAveOuxhWspqcku0nrCJXx49fYbyuVo
         0D0CP3J/NtcSNn1MI3U+w90Wb+StckSecUa4FrLR4T3v/7NpMW+sz/SJVjgvzyi4Dvhc
         K/JSfMbwz2TEeDrdhzW73wkcth53ZKu8U3ID/VfRriwbauA7MKAervD36t+0jUoHPJXj
         /4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908584; x=1788513384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=;
        b=X72Oxkp4UD4szjcGvDg4eS4sM/2sCCDaO/b2N0SyCVtskwzVrEi+KaLisOjkpEzevj
         b1gada0JMI6efIPX7SSZ5WXeyeyUa7Bnm3e//XUmOzJjKnoQxhDbFJWxKgpwJw4ajt7i
         SoSfmuxUmhPWywzGq2eEkXmuNLy+9sX2B5OC/Z/AqDcnMWqVePpuvVw7bLn8d2jndtm7
         hMWYpvKCdtNq3pdNAOiLmbVpGkfyx+XwHhkmC7KcZwICN69MWLKTPV4Pn4UTsPoo7Odk
         V94sXDDoAO7/lSEYaWn7X+yFi25XRHAWJrHmWAYCTAoEr5psElQ6maq2tFL09HF4UTad
         y+jw==
X-Forwarded-Encrypted: i=1; AHgh+RrimXw+Gff1cTnveeE6GslnVzFLN9ZSetLs0ISNn0LcOXqjD6jXhQ/sQ+sQQfhCR8/6SiH/+RH/WJTdt3NEaO3p@lists.infradead.org
X-Gm-Message-State: AFuF++lycSMGvqhU8uPsoLFSxE/7t88yNWk/5z4A0HzfDg/A1d66g9vp
	UoJbbIJb5hRLIy5H0hoKT55xLIyDLT9v2QKQRTf1DahbtP+yWBDYtnsD
X-Gm-Gg: AR+sD12XliL0NtlgqiAXuFOLiqYAUdjvKFcGc4UsDIlSK4p+FbBhyuvlOSWlDI7ntlZ
	wxvJYSkEKc0D+j+fYnjAxtuNZAZV+2zSVN8XgGJBdhmns2uSB5+y4Yx6CYvSj3UZFWsXpVKY9WE
	6Xu28evLMTAz4p4mGfdXthEB6DY4qt0Cfc6nIFqfQX4aCBRBdzpk8TLF1+al+d5iBRImQ1hkGaJ
	SImAH+u9puH2nSspzLGOOD7jlg7zPTCfW35TIjN8yl1c0wCjs4sNkz67r55VTeiKYePttg4eYz3
	Fo35rKIbD7pcgoDA1I1p1M2mQt9nZa8r95ne8IEtZQF92Fs9s26f9FsJXMDV+RPvx+T8XKQ3Ww9
	/Q6+gZH44MSgtD+W3/noGt78jvP4wDeFlNqTLy3Nk5Kmu5FWHpcBriqAGhMiOrRTT32+weER/jB
	n11e+pLZ3WDbcCxKw0YmTCmkK2XPNyq4Kn+E8TMm8ld+FxKcELQrA/hr/2uiQV91oqtolR8cu3m
	Vy0AwCOcA1oiEbx9h80/ibMHm1mAwClgOy1iLDye185baYmPqkUZnWE2oOZ0M6d2RqvWRCFjmim
	NZLOJ4toDjds/rU=
X-Received: by 2002:a05:6a00:f0a:b0:853:5152:a3e9 with SMTP id d2e1a72fcca58-85628c7766fmr12100030b3a.11.1787908584414;
        Fri, 28 Aug 2026 02:16:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 6/8] ASoC: mediatek: mt8186: Fix gpio rollback on adda dl/ul partial failure
Date: Fri, 28 Aug 2026 16:15:30 +0700
Message-ID: <20260828091532.600047-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021625_488410_8451A6B9 
X-CRM114-Status: GOOD (  10.98  )
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

If the second mt8186_afe_gpio_select() call in adda_dl()/adda_ul() fails,
the first one's state is left applied, leaving CLK/DAT in an inconsistent
state. Roll back the first select on failure.

Also fix a copy-pasted "CLK ON" debug message that should say "CLK OFF"
in the _dl disable path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index aced8e7e920c..1cff2a63ef37 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -143,6 +143,7 @@ static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
 		if (ret) {
 			dev_dbg(dev, "%s(), MOSI DAT ON select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
 			return ret;
 		}
 	} else {
@@ -154,7 +155,8 @@ static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
 		if (ret) {
-			dev_dbg(dev, "%s(), MOSI CLK ON select fail!\n", __func__);
+			dev_dbg(dev, "%s(), MOSI CLK OFF select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
 			return ret;
 		}
 	}
@@ -176,6 +178,7 @@ static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
 		if (ret) {
 			dev_dbg(dev, "%s(), MISO DAT ON select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
 			return ret;
 		}
 	} else {
@@ -188,6 +191,7 @@ static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
 		if (ret) {
 			dev_dbg(dev, "%s(), MISO CLK OFF select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
 			return ret;
 		}
 	}
-- 
2.43.0


