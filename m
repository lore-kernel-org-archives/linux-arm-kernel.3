Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C75C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=; b=NJXpUhuTcIOQdfK1jtJgSyfYWs
	MfAP44vFXGMkFMB4/cGurwkwPv4KZfYkwXTpRCfAjI78z2X72ZqNqhK0MFPhT0wMXwCqiaqnNIE7L
	a2AEaDTDSP3Ntuhw5oJ4kZV/SQGigQzkQ7TSYoFOFU1GYpDq61mZpqomwo3vk9m9PFZuBE434SX2e
	mFR6b7a9JRnTpHMWrJc/swnk2WOOL2BU2ogY785giJqRxx/rlJBNHPQ3am8OtGbJJ/z1eIAZewq0S
	V56haW5jK0U26owlt4cFI2nKABwQIpTd0YhXSVSD8P+lS9RxyKuDOXzwm9D3M10FcaBw5hDZVxIZP
	JUNxIjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92wO-00000005yhS-1iMq;
	Tue, 22 Sep 2026 16:01:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92wA-00000005yaR-0DMh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 16:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=; b=etXUbQTTQEA5ach3xRzspNouL6
	56wD7eG7kUILjs0WkndQE37EMTjYRA4tzPZkmoBqzK+Dx7m/StE4jCV2jtX2bsUr17b/wYUuypcLO
	ejgUr05Y1phD8R0tvO/YcvDh5manJogcSO+Q9VKwSfGOS1m43jFQvFSGOYktjROpvLt0WB6bg6RSC
	SRknNQBLLFz2JmpvEr//jGcHwY7NLbuEOMmRpEG/0Z18V0zUczyQRMPUZgdnqSz56lPW5Oa7jsupB
	3JoV6OITnyUraYZPoAGEKdYUcNTkJpxyzSa+uf+VmESO5TAhAzOQIIjxT9l87Zp75fOXFWu5iihWt
	wgrelFcw==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x92w6-0000000Dn2X-0VFS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:01:40 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843cedd129so76880f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 09:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092896; x=1790697696; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=B6q7VDxBnKhwor/MPGdoMX8HV90Ubn7xrD1LzAMjQxWOLDZbdqf32/OHvjqjFS6RQB
         PWd+ToMstF1S/Pohyff717V59ZzpInU7vnxzWtpAfNW91/VzNVfSZF0PgE5sj4KXgWX1
         NciTpc3+xTipPXDzvnp7LHGKqOGOc0VKGpTfaYCzAqZAXHJ1y89Cl7/nYwOG/2M49jXJ
         xeLVftqAa+Y0BjyRuW6cnqUmTj0jKsB0s7DwtaEv0yJHJm6snQcsYTtIKi/sjmdn2CJc
         KB3A2spoSnFfngTNm5406ixE/GxAVCqw/31cNdZGBpXaoAk2X/xwyyRlxqgjmGPvIWdQ
         /RhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092896; x=1790697696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=QB5T783wgJY29QKrWu+GgFnmQbyAvvMt2ZsAVCjw5RtcJJjJssJgSrJSAvi01bnuuJ
         1OEh++n5E94IFVvsJbIICR0nOYZeY9qpPbyTnrgEI28ahvzXldf4V1QrFgvWmRacuv95
         OWwSLNRMuwVBk2b6Mjqa656p+c8efyatiIPicQ938D2hAy0HZkYCpUe0j/NFuiAKxXel
         kaoDEVYcc91/nNDN9x51A2nVuhdz7Jno3RgTZ/1F7ZlUSjnu9YJWP29wfyY5/7QE6LD4
         INFJffyoT/7NtB/dVzx2c/ns2S5eFtRfPkrPefRuDEmlm3Fft40w4SBjHqZaRbs7cfqO
         SlTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlREazPymzovlCHLqN73fQxrSeLVTJG36zcN8gFTMyeSilZvaJt002HC5vrpj7yPtejnnSXHmr9rmhouq5zinv@lists.infradead.org
X-Gm-Message-State: AFuF++n0/pF/9dCpQHdwxb81YJD5x5VtOjzNUWVKXwBEUA4rW1DO67gb
	OEr6r8CDWlCeqPJms8mHk2/qonu1m4gP0Lu5pBUu3HiJQ6ID73AWAE9NEwC09bRD4Js677xxv06
	k672RBdzXuA==
X-Gm-Gg: AYBFou3SOPVpUTbtqHPLtYpFs7HcLxReric5UBjlhWvFGV0fRA1JDDCxanJshtEaQ26
	9zcie1FFF/6J6f2Mfk7YQD2mMupq9uslx2DSUeRKsyQqsXSrgKSjO4Q4IMkjBPaZePIf8vsogmt
	wgeNeU61RnNVGwmzCPUqM0cP4i4MMZwBj2sIh5s7ydW70uWewaoHxL7EJv6NDEI6gA+2wFssx1l
	yjxPjdeEcOTg7fqbujGfHqdJvAIhuMTb1FnVDvEOj/SaWpMoTclsRkEZNx81aYC/gkh2PfJ/bQ6
	3TfeWD1Vom4zXDkiPByL0Z4BsBha/oTw4FHqfNdr8eLIf0P9zjWzq/3GxMiDb0lCuy+0c8F4y9j
	J9KAdH8I5VQlDKlzVqsSwNhDEgGxiNc7W8h4Lll0lHc8mkF+SaqQeOJOnjiblSECF+ri0CRFTBo
	aFC4hGAh5YOQMHowoiKnFXmIEAyolBLh10Fv23yH6rDxl0rSDGyR47XQViCQ5kmsdEuxU=
X-Received: by 2002:a05:6000:491e:b0:487:27f6:a4ce with SMTP id ffacd0b85a97d-4886708a7c7mr50365f8f.30.1790092896498;
        Tue, 22 Sep 2026 09:01:36 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:36 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:50 +0200
Subject: [PATCH v3 5/7] ASoC: meson: aiu: add I2S Capture DAI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-audin-v3-5-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
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
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkVtm8ch7b+rdEeF24O1qxX7Q+9OCG6Yalu1deMbg
 cIFkROWdJSyMIhxMciKKbKwTL/3u6BU7aFxwskCmDmsTCBDGLg4BWAiURwM/10Pswef6OL78Of5
 qanpLsULSnRd7qvUHAub22fQI8gbZ8PIsG7x0a85R2YGzDt56vFKLyubu5IFe0KFeTfUH4mPtrj
 QzAEA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_170138_560985_78ED9AA9 
X-CRM114-Status: GOOD (  14.18  )
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


