Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFAEC43211
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 13:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mYYGf5y/FFyUp8Jk8dSfusP7o73GMsKAwMN8eV/HMTQ=; b=iqo61Nw/ktjHq02m924RPpmisb
	on07X/XtSQyaGyJ/UoI/cVs2E/NiQmOB+gNfXLwVILxNmZrId/gI9bEb75MUvzdEUr8CC3qz/Uk/a
	5TKznx+K1jz7th1hxfexXJtXYWJZwf6RsvB/yvgGKHsXVuf936KZe2VFtR3ptt+loaB3FUSrh7DA7
	ORggkfC3bO7kEsO4sdYgrLIW9DRXEOoGkVF+W5sBcq3U6YDA5ueyHlkMNRcgYpLLxmgM9CNjbwfvl
	g5GkuXJx8ysm/ZcisnHt11daMkmezU3r3hSFw7077OLwSwmvMr9ChQ56s03lLpnvHk/whRrkNC0hy
	iPImewDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSpS-0000000CUvO-1dfD;
	Sat, 27 Jun 2026 13:12:14 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSpP-0000000CUuX-438v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 13:12:13 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so16824545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782565930; x=1783170730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mYYGf5y/FFyUp8Jk8dSfusP7o73GMsKAwMN8eV/HMTQ=;
        b=eZ05Ov6XPT0hx8fI0f3WTQ0d1RQLBRsaXo0ZRBa+nv0DNdbU7pVzi123yOF1axU6Gx
         5LE/d+AGPmoXcS3kD3wLL98++sbx4SHD0qjMZ4ezJJBgfPqkMbY0pWbrCT3Kv6btJkLO
         fftclRtY16OOM0mtgXKjAcFBbVSu58nshJYpb+BdSIoxxvU1V4a1ziWAd0Okl2yvIs5C
         eTBGXYDItovQmbfEJyD++jO1c/FZcyTwJPc4Z2omHH4361RpLB59mz3x7HLYubeyFiRr
         I3Os6KXtFWjeoY2ISawZ0IEnugCdMOKAvlhCWk7gPC7EKZrM1SkGx3xcShRrlHql++5n
         Ik0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782565930; x=1783170730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYYGf5y/FFyUp8Jk8dSfusP7o73GMsKAwMN8eV/HMTQ=;
        b=KmtzVqWm8XecHOUuv7+t6Hj2kKEI5DgJGLG7iTS9Qnnoo2jegJCaLgYn4IAJQpgxLo
         5phDUOPiXuwo8fbZJDJcpoexOeX5Q7c6cbbbriAHLVZAe4AAWmbm6ouzkDPFjyvoxQwY
         /BaRSPYeAGm+TrJJ9REJX9wZ4itJoyOqiO7kIR+nbtgqbWV+pqOdXG80b4p//DxVN1Dx
         Cg1AyjH/aeiYsW6qSICMx/RPuIHKQ647in3wPex5KxdlKVF+1ya9YKh/OWYu2KFyp//H
         otGd4NQNmCHhRFtkLjSQ4MKNqFt2ZIQaWMIeEvzjchlSt0zkJ8cM/Z3XKQU3ZiXC7qy1
         bzKw==
X-Forwarded-Encrypted: i=1; AFNElJ/2J+RwV380ax8bv07u1x/DqO1v9leTS1STcan9m+9gBvN2CmfQ2D7y3pFDenGWojx7hSds1YoCuN4qHPKk5qab@lists.infradead.org
X-Gm-Message-State: AOJu0YwGwzBNy/4NEZ88inRgZjfE8d2dy/SSC2mXhs56aLDQ0z5RzIyh
	0FRSCyW8Gxkpi68exPmkmPpCqPLS7u1cq5ErQXanKwhLLXmxPViHagAR
X-Gm-Gg: AfdE7cn93741VDkNxwqoE3NUtz5F/JgnZuRze1CYmuCK9NNm/DK/hOlksmiNZqcEopI
	yWT8I/WYzdiqV1LjDtKhD0el390/Z/IxjChVUI9MS4/cRLTWZFKABsYCvpJQppyEzz7mlQafrPR
	/LVf93ahZJQHedbQYkOBIpkoyBYmEK1pmbsctxiwIpD7eC++yAU7f8rADpAYfGRYmB1oWWw9VO1
	HH0IZKmW33MlNnqiptUsmJuOIlFbtoVG18afW8thFFfoje2YGqlu0lpggE0s3+m7hWYJBpVATPy
	jvIBbt5WnFfvvy3NV9xdDqCIQFluQjbRvsIVXpE6czExpfKNp5udPO3BLW/CDBz/99xUvU4uwb4
	SmO1y8ZI10LltHG8a5uRbp9pRT2kqB66lVUaKhuT+T/cG5SeHoheEf/wyeZEA36yfqQqK63/mJ8
	SbW/Xgh9yCIpe+SdY3
X-Received: by 2002:a05:600c:4e54:b0:492:523f:a3df with SMTP id 5b1f17b1804b1-4926685fccfmr158769025e9.5.1782565929840;
        Sat, 27 Jun 2026 06:12:09 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fde98csm171665075e9.6.2026.06.27.06.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 06:12:09 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop
Date: Sat, 27 Jun 2026 13:12:05 +0000
Message-ID: <20260627131205.808800-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_061212_047931_9C560F7C 
X-CRM114-Status: GOOD (  12.28  )
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

The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit 0 +
AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no equivalent:
it only toggles the IEC958 DCU, so a stale datapath FIFO can be replayed,
producing the "machine gun noise" buffer underrun - on start when switching
outputs, and on stop when playback ends. The latter is audible on devices
with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek Play2).

The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) on
both enable and disable (audio_hw_958_enable), and when reconfiguring
(audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the same:
reset before enabling the DCU on start, and before disabling on stop.

Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

---
Changes from v2:
- Ammend description to match the change in v2
- Add Martin's reviewed-by
Changes from v1:
- Add missing fixes tag
- Trigger AIU_RST_SOFT_958_FAST before disabling DCU matching the
  stop flow in the vendor driver, as noted by Martin (tests ok)
---
 sound/soc/meson/aiu-fifo-spdif.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index e0e00ec026dc..a9861c5d6637 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -24,6 +24,7 @@
 #define AIU_MEM_IEC958_CONTROL_MODE_16BIT	BIT(7)
 #define AIU_MEM_IEC958_CONTROL_MODE_LINEAR	BIT(8)
 #define AIU_MEM_IEC958_BUF_CNTL_INIT		BIT(0)
+#define AIU_RST_SOFT_958_FAST			BIT(2)
 
 #define AIU_FIFO_SPDIF_BLOCK			8
 
@@ -68,11 +69,15 @@ static int fifo_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_soc_component_write(component, AIU_RST_SOFT,
+					AIU_RST_SOFT_958_FAST);
 		fifo_spdif_dcu_enable(component, true);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
+		snd_soc_component_write(component, AIU_RST_SOFT,
+					AIU_RST_SOFT_958_FAST);
 		fifo_spdif_dcu_enable(component, false);
 		break;
 	default:
-- 
2.43.0


