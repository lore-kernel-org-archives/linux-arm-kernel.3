Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E19FCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ehwC4+p6kz8win9+9tJOLmuWLTHCo6mGAGt8WUYA5c=; b=WATijPDefK2WakKytkdHO/64Wk
	qE2G4774CUSqtXlS955zRaPE60KuN8FRmHYVZPef01/YZfzPGOvz5nbDdpPHXBy9RwlmLupsgjfbd
	VmaPHf5TmdS9ISaVI6k98IgjIG2y+xsK3e0h4iCEurq6g5v6tAFJ3ytRtuUDFRVgZHO+BakFR7KVu
	D237fWH7HNsSe18N3WFVApsv6ODJDf+5AVMmomYLzWh1JpnoB06Cl35B7al306ayy6Ka6s3jsehRz
	YSe3wnYCLh5oH7roioIFbPjfHOvDNNc7BWJJuhFyZE8jecHjo7NZcfSeJTPKDmBViI7mt3vX5aFQT
	oW8a4a3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvrI-00000005YnH-2S3j;
	Tue, 09 Jun 2026 12:47:08 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvrC-00000005Yhz-4712
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 12:47:06 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2c0a5354da1so44453675ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 05:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009221; x=1781614021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ehwC4+p6kz8win9+9tJOLmuWLTHCo6mGAGt8WUYA5c=;
        b=ozdR+eDnUtZ00srJCOFAT9hugo5/+47/li9wFt0M1Z3mHLe+mVghCnL+l1RBCUcRO6
         46Yg/gNHtYeKegmHPv3UlihO2fAgWzL/hXxP6cWVc2ZDSuxKsUQWnsZL5AjhxUxM0/D8
         hlj9BeQ74+bnUIkQaOxd80qCKtS44qti27JtqTW1++Qit77oECc/i4BCzJ3KUxJBax/T
         5LtO35p2J2enB+scSa+7VJb6GNgMPgu3vCj6SfV3/fiyBlLxtUyspqSuSpNXGJDTCUmf
         Br84cjvDgfQchj0GvE3SMd4AvIiEuG7tUZB6sshjs+ViAHi1gI9UTFGjT7adTyPCILL2
         FoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009221; x=1781614021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ehwC4+p6kz8win9+9tJOLmuWLTHCo6mGAGt8WUYA5c=;
        b=Utv4B2WTViP+8KSejo8bJ9vTwdHPOI2s90ooAOVk/cEvhsKHr4pR6q3c0mdHNjNT5Z
         SLrwoWac6BurCaod6QLqF4zvjF7XfRPrJNzYVk1v3Wr3Xf/XCd4CFU5XboJ+hYK4ZamO
         FAmYUNH4yvMNFU3apPvBQ3NNejgB3EIBwSbzmxxSYKy+KTkb3VXCQQfOIfFnaAkV184G
         gco2vUeUXNnvFxRjZ3yucDXcW1f4cQRFxTD1WR0WM3t7qm+WuE9lrKtB152BfKkCuNZd
         EK5OUMaCWN5J+oMTesVPqijm1OEeQj9vyGfX3wPhw0jCFhzXgI/+66RSRh4khcIRXm29
         jRgg==
X-Forwarded-Encrypted: i=1; AFNElJ97V39/FidUFqPQRzTSbrTXfeYn+OOqnKA9gOD9BjZ5SeNpL0xrmfZqsw9gD2mMu55Vz0aqthRj74pzlv4LTeAn@lists.infradead.org
X-Gm-Message-State: AOJu0YxkQg9EWCX+b1dfACcNZUEb+ERse6e+WJ7JIE/hPzVz91LUrXfy
	q1Tf/x5047GB0FHHb+ahaXXE8tL6Y0Fx1umBmC8aKN6p+LrTii3Nm99A
X-Gm-Gg: Acq92OERMqe+rdSyV3BRTMgXcsCVSBm2ghTBC1Yjs1JTW0xNa4jIzLfG7TQrGHgTfym
	vW75J3T+EtGQUucqR0kCvROFJhKcevl6mOs4/ECDdTt/hlqAcCdd2hFnChn7K+nB8q8CT6hyzbc
	5F8MJN8ewh/qOVaF4px2CKtfqKKk0mgLXv4jP3ZCNE+we0rrXPkLGPkESo6+PyQDC+7cklbbarZ
	/vcKm4EF2gf8A9k7s+PQNqrOhF8Hbpa7mxJ4lKF3j7efVDeomUMt6SBF0WQovPL7ddwxAwcz7FB
	xh62Ejvq2zH2EPE66aA/+1tpChZfE3JEeVIo3R8AGQ5f8uRA44WX/TxAeuhZb/VTdJSokrUELGH
	wEbpxUYFN8DQSUFO+PSVEpnfznFCQJfGWlktENazFteGR2mSWksjFqif3UumVH/vmluY6L1U/ru
	R/e/sGUp3Yrfd7t/39/3FbvfeMtr15u6wp6u1btDHYbNQJLbVVsaO7LNz1N2n5pM2Wi6O2+0heA
	h2ZQ+9wJKQDNEjl/vcJwfYnEPU=
X-Received: by 2002:a17:902:f650:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2c1eb7476d2mr171953745ad.0.1781009220767;
        Tue, 09 Jun 2026 05:47:00 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d40asm204686345ad.64.2026.06.09.05.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:46:59 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/4] ASoC: meson: aiu: Validate written enum values
Date: Tue,  9 Jun 2026 21:43:14 +0900
Message-ID: <20260609124317.38046-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609124317.38046-1-sammiee5311@gmail.com>
References: <20260609124317.38046-1-sammiee5311@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_054704_113863_A0B6E0CD 
X-CRM114-Status: GOOD (  12.18  )
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

The AIU HDMI and internal codec mux put callbacks use the written enum
value with snd_soc_enum_item_to_val() before checking whether the value is
valid for the enumeration.

Reject out-of-range values before converting the enum item, matching the
validation already done by the G12A HDMI and internal codec mux controls.

Fixes: b82b734c0e9a ("ASoC: meson: aiu: add hdmi codec control support")
Fixes: 65816025d461 ("ASoC: meson: aiu: add internal dac codec control support")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/meson/aiu-acodec-ctrl.c | 3 +++
 sound/soc/meson/aiu-codec-ctrl.c  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index 483772ba69cd..94c5d6533523 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -36,6 +36,9 @@ static int aiu_acodec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
 	changed = snd_soc_component_test_bits(component, e->reg,
 					      CTRL_DIN_LRCLK_SRC,
diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index 396f815077e2..60bb4cdfee52 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -28,6 +28,9 @@ static int aiu_codec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
 	changed = snd_soc_component_test_bits(component, e->reg,
 					      CTRL_DATA_SEL,
-- 
2.43.0


