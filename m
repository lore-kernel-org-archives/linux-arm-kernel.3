Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39016C98307
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5u7/CkWfak8RB/d8dqpu9NxHBzNm4GVmQxeKd8aK80=; b=nnGUqzz3xZ0EZ7wJgx6FC3rcST
	4hBhu7oKHE4Yqm6hUHJI6ardBfdMaleqjCd8qiioPjh+RPjpVzKdY+RKNly19qn0+XzqTcSqhORtw
	c1E/bZnhMPRvQmVD12K6sZjP+JCRDdUtfRf/48EfymET42rcDRpWGicH2e3KlbWkLgaLq49scYD08
	MVqLFp/PUs9wuOQYeQhA0xWqi5GBTDaQciy6zUUmklzz/iW2FH48oObsU1BlDF/4it6bII3kxfOAB
	Ew654OxQDsIA007vbmijHufMMkRVMfK79YjAdkWstqzJvbcy898+Y1bCxJf0Rrcm6GrvojRDpYF8c
	7nCoRLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92wN-00000005yf3-1vXQ;
	Tue, 22 Sep 2026 16:01:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92w7-00000005yYg-2erR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 16:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=W5u7/CkWfak8RB/d8dqpu9NxHBzNm4GVmQxeKd8aK80=; b=I2RY7WHtZXLOK7BoSekE5n5J/f
	5B9elnGMEr3TqzIwY9dSSFy/uCf1rcT2BcHrT0cKOLy6UW1LBA/csMDUUBTPnAbVzMAu0e4fVQQJ2
	hOy7NJGEsUpiWEfOgWEnrzlIIOYLCazvpV0OUEUdhwySKp93Izr71tGeI3InawrwBXZ2RR66hvOwU
	5CjnAhwj6/+rpu8qyIgx7bQpYMA6XTsTU/boykTvAGr7S6iZFsXvGLjR8/KB1HKHfIIwjf3LF2R2i
	LfZ9gJESWNA6HZjSZti5J4GTKTpYVBygVjt5Cj1ypvAQKBg6YhM9XzdPGrINVvvKyXveKN1u3C81B
	qfc+WBzA==;
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x92w4-0000000Dn1v-2ffB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:01:38 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4885a1480a2so59225f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 09:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092895; x=1790697695; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5u7/CkWfak8RB/d8dqpu9NxHBzNm4GVmQxeKd8aK80=;
        b=The7lX1NoJAEtxFW817dWE+p/P9FYND2QhQORKMoONr+N0U7ms2aXGQNfzVDc/+RR+
         coKF3HI8hUOcTcKuV+yuHk7TzxkuHJ430BjbflwJmHcruYfGP/2K/3vUkC7BO0OhM5AJ
         H2/P42unOHdqYxA52f1J9ArRviU9cdjDdoQOUqEa2einrrvVNo1kGCbk1TySdmwl85a6
         5HHXfG5mH7c96sA5BKptgH/+JDHlzRV7zR15VmR2xSPkZB5pnwBPD55GGkU3majYRSb3
         TL5clQqdAA8FTEykNibDWnC6cLQhWnm/B3Rqdb4wNAxU+7M3Xy54NWCxNG/YoPubH57w
         EJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092895; x=1790697695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5u7/CkWfak8RB/d8dqpu9NxHBzNm4GVmQxeKd8aK80=;
        b=YGpehxH5vhAoNwJr83oJkZW3oahKY1ipM2dvHgI+8NPnx7N5i0LCcElsPNMP8pspy6
         w8Jj6pnqZtW+PHHSNL1qTSa9jknsAphaP0TjuS48nSdZSMjuHbURMoii8+3Qwxu9zXtE
         +Csnlz922Ap/VkcLSKntyGx7MR3ypiBFHkhcYOloMizHRdVtCFnJCtp3HrRhtU9tGBXb
         LdRsYxNcg8UzUVXyUoi1/7k14kYPBncHm1zEkZkCju2SJaS4QS31jeBo9OStCqIQBAko
         FUSZAysm6IRbll2uX6jpiiIrrs7clHlVJBi5QcYBcIy4DhqJ/p8Mn3jPBP92pwFTRAN5
         /YmQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/APeEg4pap1eMYKfwsT3yCPDyT1euQfT0jr7885/NsNmBxS3Ey4R46f+6W8yfwZQMBzb/VA7SwairPpduX258@lists.infradead.org
X-Gm-Message-State: AFuF++kfdDiJX8OFVCkv7HcqtpVab0BBZ/KEaW2rmeu3y2X05wwFe5Ld
	mIgafQhwK8t4Ttqo5Msd3QXk+Wf7kFSEMec0JuF/kYWK+qkyiJb/yoMWPTdOKW2Jn5wSnbFy64M
	DDoeV2PvUGQ==
X-Gm-Gg: AYBFou1lDC4MCPB834khRz0d2tj34rYcerWc7wbWyStsMLgAbI8HsY8QnQtjkbT+SUX
	KCKNq8t3GYtQ9YAIwo/DnneODWUeK8F0OCwrAzxDEbKH2OuZ4tlx9RZ4AnjWNiujG7vetTtuT3B
	TDihYJAXQzKesvARK7JVnD5ZxVzRybdJ6IstAc6Glya/uPkxhLHcvVWRxyJoxCRLumHCEem7xXv
	Gi+RQ/y1CXEyldhA4qbd6GWV+NKDB8FLnT3/NWr5yA4dnGl+AaQ2LSuiHeD75gE+0CP7Ttj39Hq
	JfnrsvqHFA1YvAwzmeeZS89PcQfQ+hQf2XCSouakQcy3fXp0oS9ErHn4HJGlYgv90/FTtigPKwy
	kuuLJqlRfXeT10XiUGNjxdZn0FXNv2+tnAoFo1GfscA0MYHWErlzwds6qPmXNN1U3+uNEVusJ4Q
	U8ufJ1ZP0Zu6mXkG+kIW1qGKEtrSnmU9lvc5LJ65kuiwCK5ziIrYnq5HSaKfnqUTlzfg==
X-Received: by 2002:a05:600c:4712:b0:49f:dd10:3c71 with SMTP id 5b1f17b1804b1-49fdd103ccfmr22007895e9.11.1790092894693;
        Tue, 22 Sep 2026 09:01:34 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:34 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:48 +0200
Subject: [PATCH v3 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-audin-v3-3-a760312c076c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=USKlfavDbggOjZS2/SFDHhmHPla3alh2Tu6lzPN+798=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkWdmnXxyuvtO2XuTbfN/OPOpc69WvCaZKdG3trCh
 X+fBTvN7ihlYRDjYpAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBEnvgzMnxcnvHv4du5jDnP
 fC67L/cK+Dm3Y5n1XwnnU2u1VnLGMakyMty8rJ5w66gVU3VHIuuk3+mXLvuFbFboLfCUYa9tWNz
 TzQAA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_170136_751994_6C9F7018 
X-CRM114-Status: GOOD (  19.13  )
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

A recent Sashiko review [1] on this code revealed the following problem:

  If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2,
  and explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
  snd_soc_dai_active(dai) remains 2. This skips disabling the clock
  divider.
  When the streams are subsequently closed, the ALSA core skips invoking
  hw_free again because the state was already changed to
  SNDRV_PCM_STATE_OPEN. This would leave the clock divider permanently
  enabled, potentially draining battery or blocking system suspend.

This commit resolves this problem by using the 'clk_enabled' field of
'struct gx_stream'. In particular when 'hw_free()' is called on a stream
the code check what is the status of the other stream and then only if
both are off the clock divider is disabled.

[1]: https://lore.kernel.org/all/20260917212019.4ECE61F00893@smtp.kernel.org/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 58dce9f08c9d..70ea39c77b32 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -219,16 +219,14 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
 	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct gx_stream *other = snd_soc_dai_dma_data_get(dai, !substream->stream);
 	struct snd_soc_component *component = dai->component;
 
-	/*
-	 * If this is the last substream being closed then disable the i2s
-	 * clock divider.
-	 */
-	if (snd_soc_dai_active(dai) <= 1)
-		aiu_encoder_i2s_divider_enable(component, 0);
-
 	if (ts->clk_enabled) {
+		/* Disable the clk divider only if also the other stream is not using it */
+		if (!other || !other->clk_enabled)
+			aiu_encoder_i2s_divider_enable(component, false);
+
 		clk_disable_unprepare(ts->iface->mclk);
 		ts->clk_enabled = false;
 	}

-- 
2.47.3


