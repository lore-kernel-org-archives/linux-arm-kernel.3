Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0A8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 21:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jw59bcdB/ltUoOpdZCepUeH14DCkJ+gtBAcNgz6Z6w8=; b=g+h+dq2OAnxjrZFZ36JeAcVZFj
	pHtWpiteNAt2QPqR5kz6JyTak3eSjrDg+NyJey3Byl+gbW9Mu8HZx6eZchC7LF3zgAOiJh+io2oE2
	oRzOTzHzVfU2FUnHVkfDsKeEgySt7LY0CX8rpRs5SHV4GjQB50Q2rmnqZ9WL90IwhYflBsOyv+TZi
	gyQapNGKTqB9XW/VTSgLMAZMAPT4Uw4bmv/KuhJlNUu/ac2yoWb/Xbj8kxl1EN/V1ybbyaKrQChDA
	gQEvWjeS0icc8z4IqhcEVh9moPbJg90Rzr/23jjKM7YDTKPZuS0cFYb0mXZfriWns4Ot8FZWtOsW2
	QDCFzWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfP0s-00000005XfM-0gwE;
	Thu, 02 Jul 2026 21:32:02 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfP0m-00000005Xdy-0jxz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 21:32:00 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493be1b9682so16903005e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 14:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783027914; x=1783632714; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jw59bcdB/ltUoOpdZCepUeH14DCkJ+gtBAcNgz6Z6w8=;
        b=LlWRmBfJteJ8eQnQ3X5ITU/yEd31c2Abm6Ar3P9fXJGllgN9XWAf1s7oNuGz89pUO3
         ran8OIk89TslN7Y7jqfr/221NYBVyfRwD/zQWTnIep62XJgjtM+TvDPmcv6xXV6DYfKG
         2TBme9w3HtJ7d/mDyg/bCOhnX8LGWoCgK4sHOLuK/jKRq7lTYKGG4WHPCcbkSrHEaoX6
         2pccuJr3qURGaL/WdpyuDMHD8+2Yskz0TTGbBe/D/ix7DXYsp+9VGFrpFJeBzJoyAmrc
         Ndo3WCuj8950wtlC2qFgkqi4+KEzrIGFZ/egqBysWaxQieax/nMOUEMgRWAcVaLwcY/B
         1dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783027914; x=1783632714;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jw59bcdB/ltUoOpdZCepUeH14DCkJ+gtBAcNgz6Z6w8=;
        b=F5GPNYZPr42GcaUCZFYbjWElEfnDz5MwwChUE3wGtsoZBeZFjC06msEIp+WG9FUqEx
         oZ7r4kFqcMxweNtHCLBuoqk7t5bINE2ovyYBr8dR7H/FDJcN7qGHXfh1UAsZqRsTDJNa
         u5UNWHQkl6OjovbMx7RP7jCq7fNIQIe62wOh+ofE91+nhPqNEKGGRw7tabS7x/G03/w5
         H2hVjD4lbKexGI+6PCR+kbi1wzyDNIcCNVl8mOpQ0GCc12oRc3T5Ayju24ZfAjqlj/EC
         iqdEKsvkNTUuWFLKgJFzxVCnmV1dVaGV5dmkYHpAQOentIQ+XbKPt065AHbDZ7zt6vss
         0WaA==
X-Forwarded-Encrypted: i=1; AFNElJ/zzSwkU6H05l94lCjdmTDhUceR5ObcZIWIE7yO38UTTgSzHjRTVZSt7G9VdwlvuN8YEbGIxqb4mcOGbHehiYWZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzIoVqNIFpaKKteG9/bnEZnz1yr/zgeLAGtL9Sn4by21NS0VMma
	0tifiwnHhMIxXAms6fDSgwKnQ85vBgan/ik+Xke1GZkPtkwFurSil8bHI6Kt+duWhK8=
X-Gm-Gg: AfdE7ck8Go/VH/KerrV/wqekoMigk/x9Opu449ZkXmAuFpeAfxEk2DkTmWS1hMLdmNu
	PsxLelxskT0TKn+Ij0PIaDzmA+Tq5crh2dNtFb05NwmJLqJEizyyoXWmLHVHo2bTC3/6mzHG90Z
	iBbs/9nqtrzKgSKHelgTlPgFlynHS0RGi03YippPm6NcacrIMHWXHprwqc6spiDwt2BU+dLYZk2
	rfri3CcJ9vs1UoXySILzKX53j28VYDWx43RjwJphur+svIOGUeBcOPvzu3kdU97UcbAQrJzxVo3
	WGW8SQ6LZ6PngA4E6vODPobgMXeoewIoUUrHbncoOPZp21CC/U0bzRHeG5W5lbtXQEKwItOHbFI
	lo7M95aT+7AKx5oUvAKkCAiLLWJ6HHAYEXzRAPNnqyjnCzkNGnBA8DYP2pEmwEg55tEbD0OxR9K
	CebUMC0BqRFA==
X-Received: by 2002:a05:600c:1594:b0:493:bcba:46a4 with SMTP id 5b1f17b1804b1-493c2b7dc45mr66870285e9.20.1783027914403;
        Thu, 02 Jul 2026 14:31:54 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4a343csm127608285e9.0.2026.07.02.14.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:31:54 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 02 Jul 2026 23:31:46 +0200
Subject: [PATCH v2] ASoC: meson: aiu-formatter-i2s: remove pipeline reset
 from prepare
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix-24-bit-i2s-playback-v2-1-9c008ff0b211@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAMHYRmoC/4WNQQ6CMBBFr0K6dkwZGpq48h6GRTsMMopAWiQSw
 t0teACXL3n//VVFDsJRXbJVBZ4lytAnwFOmqHX9nUHqxAo1ltpqhEY+gAa8TCAYYezc4h09oTT
 G5NaQpdqqtB4DJ/Uo36ofx7d/ME17bjdaidMQluN6znfv/8ucgwZPdeFM0XCB7urd0okPfKbhp
 apt277iTV5f0wAAAA==
X-Change-ID: 20260702-fix-24-bit-i2s-playback-6444174c7cd7
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4120; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=uZsb8EusuxDA+iZq5vtuz8+Khov6nisW0HEkdxjZ8ps=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFluN06+yjvjnhd0k+e1smyS/1a35vqg2h97Bb7GRPx20
 IqZsWh3RykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACbiPYeRYdWm/nssm5/c+xPz
 8PS/Za8L3130qMiPvTvruryfo7vYx+kMv9n+T+LdtfnH2zWN3OkXT7/pZ513yjvlcqikMuOU7r9
 CeewA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_143156_511949_75D73A63 
X-CRM114-Status: GOOD (  21.73  )
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

'aiu-fifo-i2s' (DAI FE) already resets the I2S pipeline in
'aiu_fifo_i2s_trigger' for all relevant trigger scenarios, right
before starting the FIFO. Since the DAI triggering order is the
default one (FE before BE), the reset performed in
'aiu_formatter_i2s_prepare' happens after the FIFO has already been
reset and started, which corrupts playback in 24-bit mode. Remove
the duplicated reset from the formatter.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
A patch series has recently been merged in c7852d2dcf66
("ASoC: meson: aiu: align I2S design to the AXG one") which unfortunately
introduces a bug in 24 bit mode playback which this new series resolves.

Among other things the previous series moved the content of what was once
called 'aiu_encoder_i2s_setup_desc' from 'aiu-encoder-i2s' to
'aiu-formatter-i2s'.
'aiu_encoder_i2s_setup_desc' was basically accomplishing two tasks:
- reset the i2s pipeline.
- configure number of channels and physical samples width.
Before being moved 'aiu_encoder_i2s_setup_desc' was called in the encoder
DAI 'hw_params()', whereas after the move it is called at trigger time
('aiu_encoder_i2s_trigger'->'gx_stream_start' -> 'gx_formatter_enable' ->
'aiu_formatter_i2s_prepare').

In parallel 'aiu-fifo-i2s' (DAI FE) already performs the very same reset
of the pipeline at trigger time in 'aiu_fifo_i2s_trigger' and then it
triggers the playback.

Since the DAI triggering order is the default one (FE before BE) this
means that the pipeline reset in BE happens when the FE already did it and
started the playback. This causes the 24-bit playback mode to be
corrupted.

This series removes pipeline reset from 'aiu_formatter_i2s_prepare' because
the very same operation is done by 'aiu-fifo-i2s' on trigger.

This series depends on c7852d2dcf66 ("ASoC: meson: aiu: align I2S design
to the AXG one") which exists in 'broonie/sound.git#for-7.3', but which
has not been mainlined yet.

Apologies for the inconvenience.
---
Changes in v2:
- Dropped the first commit of the series because, as found by Sashiko, it
  could lead to other playback issues in case the sample width was changed
  without closing the PCM stream (i.e. play->stop->reconfigure->play).
- Link to v1: https://patch.msgid.link/20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com

To: Jerome Brunet <jbrunet@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/meson/aiu-formatter-i2s.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/aiu-formatter-i2s.c b/sound/soc/meson/aiu-formatter-i2s.c
index b4604734fe88..cb554c2e7ce4 100644
--- a/sound/soc/meson/aiu-formatter-i2s.c
+++ b/sound/soc/meson/aiu-formatter-i2s.c
@@ -13,7 +13,6 @@
 #define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
 #define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
 #define AIU_I2S_SOURCE_DESC_MODE_32BIT	BIT(9)
-#define AIU_RST_SOFT_I2S_FAST		BIT(0)
 
 #define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
 
@@ -55,11 +54,11 @@ static int aiu_formatter_i2s_prepare(struct regmap *map,
 {
 	/* Always operate in split (classic interleaved) mode */
 	unsigned int desc = 0;
-	unsigned int tmp;
 
-	/* Reset required to update the pipeline */
-	regmap_write(map, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
-	regmap_read(map, AIU_I2S_SYNC, &tmp);
+	/*
+	 * Pipeline reset is already implemented in aiu_fifo_i2s_trigger() at
+	 * trigger time.
+	 */
 
 	switch (ts->physical_width) {
 	case 16: /* Nothing to do */

---
base-commit: bff7fad1010eea6f183fb110b54171cf8700ef8e
change-id: 20260702-fix-24-bit-i2s-playback-6444174c7cd7

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>


