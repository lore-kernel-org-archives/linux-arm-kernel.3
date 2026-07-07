Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74FEC44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 01:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f6D6cg1mRn5TZxz1CwmBlwOFw0TYzLoa18zGJaen0Qw=; b=L7CCQyRPTkbHE6bzcfZ5e7h/JG
	kAEp1Si238sH7IV2Co2gf6R95Bs44PSkgbHaXbt0QRpJ/zKiwsSqCzNnjRZLowD+ExY2Y8CEwaUL2
	kR7aRGuADnJw7hpGSEPs+tUDX/IiZDn2N70LvZnY6/+wRu0LIp8O3ZeFgwiekMo2wWf6k/jB53yLI
	288MfX3mplw768T92hakmvpnZlsrsWT18rGY1JNv6LiAZC5hrd/jH4AyOKe2w1yoMJc9He6EnmYaa
	Yon0w/J93op4p06VIsQ0CpufL0e/6n81mZdFde3y2hRgRjfe/hm+QSEs94ZrJNPkTNF8BLO1jNWHt
	H9QWQtRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wguYL-0000000Ds9A-2FjV;
	Tue, 07 Jul 2026 01:24:49 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wguYJ-0000000Ds8R-1I4C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 01:24:48 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-8143d904b01so38926747b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 18:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783387485; x=1783992285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f6D6cg1mRn5TZxz1CwmBlwOFw0TYzLoa18zGJaen0Qw=;
        b=nAPiM7Jf2Hb1EVS52oG4vcJR5UFEzdf4Dxe4HTzIXfN04LW2ZtkrUhOtIlTO6KcXsL
         HGz0gbA88NVwazchdzdRYJuZaZ9WJmrM/0lVs6Qje9ODUA/pxQ2iZ0oX0tmKYMVnkRpY
         oLdqHMABx71rG54PuX9778PsPAJmj7klpt2RFVaPc9UGoiRZKUbWRPZMQyBikmpFg7PN
         RmUVyKaVvEJ1PTrTapykddIQ6r7qpLeSDq3B155O0fvDOx8us/lgqYAUH2oBkuaRt+KT
         ecsHB1BwCaGtNBSANZpqPAhx5xfLTNENT5P3VrnIjhsVgQ/ZAtAuAu4huhQHZzBXw1Ao
         WDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783387485; x=1783992285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6D6cg1mRn5TZxz1CwmBlwOFw0TYzLoa18zGJaen0Qw=;
        b=oN4/exOp/OJf3SiXYXrLZ6gR3KyvMNGYoPmBq7s8SXzQRpByYbs9U6ZeJcjT375kCW
         Am9tCI+yLPVDf5saGM848Ip7uNA02C8DhETzdk4xiJoXP3LXmnpEdptDGew5eAqn/ZBm
         6YQYI1AZWjOHj+3V/3CJM9Cbo8f3eWUEe1O3N+Z2Xux0enZgedOFsuHFliLrHOaRrkTy
         Uv2Fskhd+3GNN+6CEx8cKfuilZ0ESnJGc323BnOL6wnVycLfuE8h5bX5jjJwoa964Q+M
         SOSQV9O+5UtbbbRMaP9QCOVNTn/1nkbKdTULdhl0ueG0foKiIs2nqVo/o5l+/++aUCOk
         5HjA==
X-Forwarded-Encrypted: i=1; AHgh+RqNwRZcnCxeQFPwHRIusVbjLTq5OhQlV73BQvN1m+dkbbmRWksYUkJfTRc1NmLgR+tsAR5yM12hpYw4/2I7TMmA@lists.infradead.org
X-Gm-Message-State: AOJu0YxTLtgDnZletQm6iSaOtkmCgflgo6KpS1ycsg/dkp99kCqHD0F9
	cGf/9Z36Newt/ovFO3W3FxzwHsaqYfe2at6gri1nZSKwesYUo0/Wo1o+
X-Gm-Gg: AfdE7cm2tVQP4M6ZnwPbXo7JSvHNfjiubSbcRhFzDiEKZi5kH2PKKgluLEkpkUqbdq7
	rE+suHaSM6OZV+f3hgo8pxZ7dnv5mSqUO/mF6Tk047zCAY+qeinG6M71qsYc6T+jX94XF23wBH/
	toHXOiSGUKmL/NYZSrxjpfFI62Hbt+hmHfQWt9r4HSMB1cKQionsKijn7pNtLZld/cMhnZXtMlw
	EK3VmfAjWglcVmSJ6CDdTv5jZNu0GcifZ5UIfjfEYL+1i9BD5ReFqYMtDBNCMsR86XX3iUfA7TS
	le6Hp6LS1VbDBstq0hfCCby9Nu0Ed6IYG8PXNXqw9SNRDa0NJB4GMQI/7s4EpPZSZZXcB5ApRjU
	sp2bmVLc9An+SOykBUYE/R6VSfV1ZUJRDl8kU0XJFBMcwWxXC9ZP2W3A6v3mpa9oa7qZEWh19IP
	JAAFmafWrVx/ED72Q4LGPltPx5hps4EFC3ohkz23qIU0ZxaG1boTDryOWHtxzEtc0rdSiy3bwPi
	12yHhyEpOyyCAILZ4RABdedwjs8SUSj
X-Received: by 2002:a05:690c:720a:b0:80b:9114:3b7e with SMTP id 00721157ae682-81be06433d5mr25020817b3.12.1783387485530;
        Mon, 06 Jul 2026 18:24:45 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360:d412:6d5d:4bc3:48b2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81447f2755csm64120787b3.11.2026.07.06.18.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 18:24:45 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Valerio Setti <vsetti@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] ASoC: meson: aiu: Fix resource leak
Date: Mon,  6 Jul 2026 20:24:24 -0500
Message-ID: <20260707012424.1661733-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_182447_355580_F2544574 
X-CRM114-Status: GOOD (  13.55  )
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

In snd_soc_register_component() error path, the aiu-formatter is not
being freed. Instead of returning now goto the err tag so the
aiu-formatter can properly be freed.

Fixes: 83b83024cdbfd ("ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 sound/soc/meson/aiu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 64ace4d25d92..d6b644a53f7e 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -310,7 +310,7 @@ static int aiu_probe(struct platform_device *pdev)
 					 ARRAY_SIZE(aiu_cpu_dai_drv));
 	if (ret) {
 		dev_err(dev, "Failed to register cpu component\n");
-		return ret;
+		goto err;
 	}
 
 	/* Register the hdmi codec control component */
-- 
Thanks,
ET
https://github.com/sponsors/ethantidmore


