Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFBACA5FDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=; b=UZgKvv6RHWdPRZmH9F8nLtmmrk
	UlTPtGScbxkSl1Nma0ZQV0Gsi0YmHKbU/iU4Ex2FB0OZEYI6Uomhg7esHz0aDxHYHiq1qf6xyRFZP
	1QU1V6LTHlbxkvMe4j9peyajyFRb5SRzI2VH1D1b0I22Xepq+oYmfg7WYwXSO1dOCUR4kxmGSOWej
	wlWXRxLYVhb0KbSV6FZlIrDrBiTOLSFScXNRRuTjx/lKjCyudJ1ZshxFmcozdmHK7n3rCPrmaJIHP
	9gmeCJWhpPwvkVHydp/Q1/jnLojUa+EJGjDR2aj5OmTQnHoOCoHalLNjxSBI8y2u2Hz0K/JXYG58W
	tElRyZJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJJ3-00000009dur-0rLW;
	Thu, 01 Oct 2026 16:06:49 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJIx-00000009dmz-3sqT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:06:46 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so50718175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 09:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870802; x=1791475602; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=N8v0QN1qrJWZvnXf3SbxcNhN36RvHTdXalLaabnvr0pmsS3Qx4ti9+agjVBHIXEkWR
         JKkl9lnnbiP76A/lbSBEcziwP0jwWg+rV8MqNurPr4C2bu41dFDpAlotZLEfpMcFLtKR
         VBggScrspEnJbrAFb0ujSUkGw3RGtXE1ptnN+M67bzfAvdFQB8mq2cDw10dXPf3HuKhe
         VUYf7QTfg0C4asm6QL2q6kIXh5hIIu6C6KlHp35AEVqOACMpu97f5wRwMrTAEhjW09h9
         hr6xCKyQzHN4WOiDaPIvAvzMZ2sa2jxqIoWq2uImAZJ8BCHmQNHsMTpxmBq7WpeBHbTU
         SxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870802; x=1791475602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=12tJaRsPU5sLG48RZmF17L2lhxP3HzesXDDbotAHtxorLIb5d8LBgb3ISIshwDrUv2
         gHno0ryck523XZUamJOd2VUjVaDgiry3kvEodPm6szXHPP2iUnT7Nzk32dtFx5PG4f60
         uR1AEtXAiqRIkbabp00ESLE/kdJw7qUkEvmvWVyTB4hn9ct+5wiY8pTi4TWxSDMr6AjO
         jOJA29+5Vb9faruEcvDsCpagYgvL9fCp5R+4CVXSCTL0h3h3fGkB2K55Yvb0wBSl8QD0
         N93i+hA4oQxpiz1uj4E+eRkjBASGSiTsJgVFbar2Yc0IX5U2Lwj4y1nExvyn4CH/kUwZ
         VpEw==
X-Forwarded-Encrypted: i=1; AKwUvBxzNTHS1ePg6cmuI3W9gngTF98sm8P1gR0zwfs+0HojhjwBawMMf1VfVWIuYDVzT63z46ObrJryYoyl5OKvjVau@lists.infradead.org
X-Gm-Message-State: AFuF++k8PAwPtJYUOrmIgyRHGUEYlajqHJAP19LdNVAN98hzcvx7dK4r
	QelIihzW5cDoRKAYHMN9AmO8obOm0LhaqebxGNzVWGLAc9ehfUEZJETCKOE+HBPH/AC9fzxFAtn
	YdAA6AGs=
X-Gm-Gg: AYBFou0CYqwv7nqJoEGxsPe6EYcZVJV+tkRHgQpoPO6ls33s6nWAq4Lw1EPoZZrrvKi
	nWvFFAiWeCqZnlt5jDrteYBg4qp/b1PJLE/h4WceB8Snl3s542ha4mPsIyYcTbvhcGmVBhSVR/3
	+x8N22abOpwvayKKL5ziqYvBAvTiewIvcJGsRBoOg7oqC+l3O1Bjwb4NPylT1OryUrtq+CavxfL
	nnoW/fTS4GP+J+j3gCDTVLv1PICnKYC8+C00+N9W1HvgmmxqYJNGwSKY/l4yP6p/mj6j/nBBZUt
	ThUI6lJEqs7uaZhJm7csmmqNSY7ef54gj8hWQQH6xAsNQb4uQNk2krbT2xZdsSprLhasXdMkRbv
	MQObnmKp+l3Cx12SXybrvG6+7T1vW++VU/vwgetc+5hG8lw0hDj1IQWdELQWRHUp8I8Bv+1AQjE
	FNs8FPrd8arUAqQLDzbvHd66V6bM5KNCssaZ+tro+b83/qK5rDStHbw0as0zK6KnNq
X-Received: by 2002:a05:600c:4f88:b0:4a0:f4:1c76 with SMTP id 5b1f17b1804b1-4a0274f9c06mr2153635e9.4.1790870802378;
        Thu, 01 Oct 2026 09:06:42 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:42 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:30 +0200
Subject: [PATCH v4 5/7] ASoC: meson: aiu: add I2S Capture DAI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-audin-v4-5-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=Uvy6WjK33Ql5QDc+7YeTX2qUEcUUi+n12SinkXVNwt4=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7Wrm1f9gaFjtvOB16V+bf14s6N/wc0k7OqqtkijLI2
 LtgmQZvRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZy9h8jw2ahV0o2Gz4cvM/J
 v39B8Rpf3e9rvk+crWh+ovLufvW84BiGf/axdec3K0zd/V9/XmbNptbWxrTC+MPrdvuuXRT61rR
 pMTMA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_090644_022328_C30C8D1F 
X-CRM114-Status: GOOD (  13.72  )
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

Add capture stream to CPU_I2S_ENCODER making it able to handle both
playback and capture streams. Captured data is formatted from
"audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
FIFO and then bulk transmitted into RAM when the FIFO is full.

As for the naming of the stream "I2S Encoder" is kept as base following
the same pattern used for the playback stream and with the goal to minimize
changes.

Supported format for capture is currently limited to S16_LE because it's
the only one that has been tested. According to the manual also S24_LE
should be supported, but this is kept as follow-up.

This capture support also takes advantage of the following commits that
has recently been merged:

commit df3c987ab3d7 ("ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw constraints")
commit e82159384a50 ("ASoC: meson: aiu-encoder-i2s: use the core symmetric_rate handling")

They ensure bs_quirk and rate symmetry across playback and capture streams.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 535fbf7c1639..14d0e20a4bd6 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -153,6 +153,13 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = AIU_FORMATS,
 		},
+		.capture = {
+			.stream_name = "I2S Encoder Capture",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
 		.ops = &aiu_encoder_i2s_dai_ops,
 		.symmetric_rate = 1,
 	},

-- 
2.47.3


