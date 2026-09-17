Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68DDC982DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=; b=emmU0SPyJIUwLJwq72YneKSJ/l
	XnBoxt22aCZe/qrqwLh2EngPvf8uRMNyU+WtY58c4iafwpNdKHCgE0CNlUjCWaHjPbJg8CPAnQDHr
	mh57ECir94UzDR8Np3bvJ9KG5L2YAwMjVW8GtIcvtKlPiu3p2CyBf1eRNwC2St9jutS45gd6pIrT1
	SR8znp8P76bZRYp8CDIkRW6PvfBa7Kj9xdnr/LQPOuGThgQtESiMJRMZBlVUo/96gBLcYDWf+Ptm+
	5OK0mZ+YXPdbYhjQEAoND2GLXepp+BGc01tZ4LADXrX3g19jz3+W43FEXsyP6P7/buC2h4hhOA+s8
	7a/mx2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JFr-0000000CW8P-2tG7;
	Thu, 17 Sep 2026 21:02:51 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JFl-0000000CW4l-33pW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:02:46 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912df756so504115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 14:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678964; x=1790283764; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=Fri6vILQeIxSVyF6ZSidChpOk0aiH6elTWzmVj/RrMPL4p85UTDEtpUjNqdxj7fu4N
         gpjM82GlrUIB4/5XNhKVhysSAYVDOJnXiFAVAvwimDl4J0x3+BedKnDasb8i7Qt1r8k5
         dox5MItBXka4qystK09qa6YTJ6klsHWOZ0l99Gffyq1It+duGGMlWidhLhDyiiJl3X80
         m7MTSPGdyS90AxQjAKraIAjnNq3blbvEJksOD2hBA/x+zMY5TIpHDB77S0OihvYc+kow
         E6hqoCjKTfXaAePmKLaW7pBkKYiDzTW2UjSZV/GA6vCsHhplQAQG1Dk1Y5O5o/+wIeqi
         1tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678964; x=1790283764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=SdyvVlfpicZRqvJ1iJ2Zp8/OKLybBDXdWDOnir/2Fr9pdEKwHrZpnHqn13pMQk2KUg
         zUJd01ZX2KpnuGU4v/DzHnk9xGylvmdWa620CeGGGfcfKMWxr5Xl9Z3XUSdRSMhTE/bm
         CRoSqyvYbSXP3eGtcOdGd7/+Z4DF5wGBNlLbObt6tKKoXogCzcdWnCPqk4aaSW3LEp+k
         k9wnB1BSpZl8phkalkmQ5rzCf7iYXHmv/BbWaWjZ7hVyflGljN/O18rcpiNPIebNrMl+
         BjsKDKNfbqO+tl5mZFpY6LMujvqZblZmzqTW8lftuR+F3GciFL+EIqalTFpAlS0o2mpp
         UKIw==
X-Forwarded-Encrypted: i=1; AKwUvByyn9b6QglaUsKsMT/VAEtJvwwHpmdCHfH44f6UE+LfqOI7/F8097/OITv8Nhx6BRvGj3SN3vSB2oxmokWmohaD@lists.infradead.org
X-Gm-Message-State: AFuF++mjscZkE6EFU7/spRbANIObi40/ucssP8smT+tnjHfMXzacqcY3
	B3Q+C+mK+Qt2opFDRhxpbr7uvNrXzDH6TkIH1SSKXprgYTiS2y3+s/nyDum8GvhxfXc=
X-Gm-Gg: AYBFou1EKwSMBp64lxmyDYF1HQxXCd+8XGYa7DlvDEbaTqAdCZAJf9aQqIYbpEMFbTi
	/m4y5ayEa5/pkZsSY3H4rLi44jYE+VmuBDGtH2E4eIRTFr69uLH0VbNOCOt5cxvA4VsUFWfWkG8
	X0Wcs3mfR1yQ6OFu+xHSZpwA54DRXmtXvHZiEeh9EtcPmw+bz+uHF3FXLaCzk7RcHVfKxQt9iOv
	Hiy//8uiMn+w8HnorjkaQE7jjmV9HSjosPNuUIMMER65DrgOG29iyXy3VheE+WhUirL2jOPDPf2
	TPbQiHETuNhFn5geDcxgqzgFf3+hMf97O8+uxAdOq9TCY7xEN1t4fhHryKQfqk3hTvlZ0FK0WFg
	k6tER21O6+6P/1dNgr8++3Qbg4GtL2Frd5HR4U/RYUAmnOdN98cjTbvFxaN6crhhaAcxMoMgPN/
	sZEfGZPDu6dyv2xRlnEbeaPqj41iZZpacJFmpb4xsqZyH1h90uCyV+R8qQCw7TbK+dlW3XNDKzs
	8KEuQ==
X-Received: by 2002:a05:600c:198b:b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49fc574f05dmr1574425e9.33.1789678963884;
        Thu, 17 Sep 2026 14:02:43 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:43 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 17 Sep 2026 23:02:34 +0200
Subject: [PATCH v2 4/6] ASoC: meson: aiu: add I2S Capture DAI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-audin-v2-4-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
In-Reply-To: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
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
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQnPVXXIkF19akM2yaANzTvkv5SwOwx05M15mSF780
 rfPiNOso5SFQYyLQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABM59ZLhf0BKUawkm9T3o373
 JU4++fdX5HWgZ7tPR4R6xFNtM3WhnQz/TBt0/F/LRDzrEImSn2DTeaBkfTLbsZcn2dRi5yVor2h
 mAgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_140245_800104_B60ED6CF 
X-CRM114-Status: GOOD (  13.29  )
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


