Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA070C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVcxW4CrMFPdiaxkpRl6bL+HxVIt7TtpKeqoh/VcgyE=; b=OqDFjjcw4O71P9vRf7G+sgMAY9
	aETxyoTzu4XKqN89EEXJM+Zmlweo2y6HjM2IUJ0C1txdiQK7vc2DrRoBvZ3yZa/qZehICTH3WxPpe
	MAJPrmixKf3hjFUSIvzu8/iA85o9C6vEGgFx+vR2OXvZsrg2SpaDYztanryCJMML3fCuYNC6wBEGm
	ZQ3xcMouInojJsNtE++nnpUQp7yQ33OhzUd7ijlxNHL2ML7JAi3GRGcZY7ssh5zCbYUQ4vWGI4c6Y
	n2Hn/e1yWy/gCk0myEPHTg4tek51EwQ7X/U5KKQk6i16QYKrISJ9rxXn5sJolmGmCqPR0hx7CXr/+
	Fh3OsNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqYO-00000004wtp-1bxa;
	Thu, 06 Aug 2026 05:22:04 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqYM-00000004wsO-3REs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:22:03 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso2203393b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993722; x=1786598522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVcxW4CrMFPdiaxkpRl6bL+HxVIt7TtpKeqoh/VcgyE=;
        b=OmSMTIBuNR1rmzALk1fkRD6H85phdbeNu98V12YOrUxxvcMZZtDM7mRr2S1iKFJeyH
         DpvftCssCghhLrpQ8jYRKZcDtgZjL8OADzdpymSgRy4rh7T/eCJtPBy7vqdnG3mCuYPA
         RG3TiaOGTZ5oZE+kCvQxDQUrmkH8aaZHLYugC1R6KWZydQFqEullLcHneTN1sF/dhMwp
         sDOWwghMHjUo8vOes7nBKouPLUy0OsIRiehuq3MC3EsGF2zubKEuX98OhThC2z/ewOmC
         AwRMlHOphsOddeEGzkLzqrtUwjL7tv9Kjip7FI3pIMXjLe17QZXGV0hFjFMfYr7RJYNv
         Eaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993722; x=1786598522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVcxW4CrMFPdiaxkpRl6bL+HxVIt7TtpKeqoh/VcgyE=;
        b=PcJkuNuceCZRieEtb1aXgE0hcZSLkv/pMmAQMkYVdsS7qQxcC4AYTJFJ7CXEhWdjyR
         GiSfRn30onO+tWtH0YaQPe+26uQDHwvZRit2Pr5QpUvskJeTaGJvmZEM/Bc1J6YAV5Np
         hFBq3hPUSKWbNKBKbJicNuNWNGgqHbW2L2ECWarvlltaT3SwCQnEiDkUzOPkEwAvWUYU
         EOgqk/DP+dSrQl+sO0naaypcBOTKYY8Dh4BHfuvmrEQAciIjvxzN40gwf5ntG/vHCGrH
         lF92LX8plbIoOQ3154y1MqVROiU3f0C7rPcs0uMt/anVKA27uL9H0OjymbU7coSkCSZm
         XtjA==
X-Forwarded-Encrypted: i=1; AHgh+Ro8mRCz7eW6tz1lB9pIQDCiJDM37wly70m5nBo5Aeuru4ehVaZZyfKE/2zRSgcU3cfUtrgPxfwYEdVxD41iml0s@lists.infradead.org
X-Gm-Message-State: AOJu0YyiHsAOwjfzE1LY3y59NcRCBbuZdjrmTU3Ps5pc4ObFEkh7TrNI
	nt1NVcDtMGA3XLYEHWl93afKJHKt4sjzxrsrNjW4nUl1+pb2JJMfK1XZ
X-Gm-Gg: AR+sD12Wp6/Rg3uwnCYy1kNUsWitNE/3i46eNou6IFvpCO4maI7AzvT9i9FdiotiIRo
	52YTsuko2SycAb9oZDBExL0TEhFj1giDt9dnVvAKl4FMy6qsJz9imQJJiMDNv8HzOENJNz2UPMF
	l5kBZqisuIaPbjAQKlDwsnIFWckEU7vieneobYfl3FEnCCeMPhAf4H5KlJ34x+pVGNIajqME2f6
	dSWjw/fyWIqc1C4OgOFKSAYkwqBxgStdS9LB5KCpez9szkHIv4QOwimN4I+JY2RV8adn0kdKK2l
	RZp81qHY45c7rJULq/dnxTqup4j3iueUvZpiFCdXrPe9i1YrMEG1hTxfpL8Kg+WTifn053KyfvN
	2/o/StzyxSz3SaXQccL6uv3FRBRjPPNUAF1/nBxyuSe7pcB/mN5L0AoflBmd1lFU+F8312qhGO5
	jX4RWHtXxmnAq/7HVjlP0XydwImn6FSsAjppEdJi+gw8w92S0Zc1p2b+3SS/708hYDfHNlvOjth
	6QSO8Cf0lG+5B02PdGChNKfFhRfeu7M4bdHy9B5YmErp03kNTU1WXN8ta6K+AOIs0ofpGHwk15D
	NbBt
X-Received: by 2002:a05:6a00:14d3:b0:848:63c9:ee38 with SMTP id d2e1a72fcca58-84f2e13adafmr13246503b3a.39.1785993722219;
        Wed, 05 Aug 2026 22:22:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/14] ASoC: rockchip: rk3288_hdmi_analog: Drop redundant probe error messages
Date: Thu,  6 Aug 2026 12:21:23 +0700
Message-ID: <20260806052136.21034-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222202_868866_043F72A4 
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

From: bui duc phuc <phucduc.bui@gmail.com>

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rk3288_hdmi_analog.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index cf642a23c38a..d88d5ccfcdb2 100644
--- a/sound/soc/rockchip/rk3288_hdmi_analog.c
+++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
@@ -185,10 +185,8 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 	gpiod_set_consumer_name(machine->gpio_hp_en, "hp_en");
 
 	ret = snd_soc_of_parse_card_name(card, "rockchip,model");
-	if (ret) {
-		dev_err(card->dev, "SoC parse card name failed %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	rk_dailink.codecs[0].of_node = of_parse_phandle(np,
 							"rockchip,audio-codec",
@@ -223,11 +221,8 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 	rk_dailink.platforms->of_node = rk_dailink.cpus->of_node;
 
 	ret = snd_soc_of_parse_audio_routing(card, "rockchip,routing");
-	if (ret) {
-		dev_err(&pdev->dev,
-			"Unable to parse 'rockchip,routing' property\n");
+	if (ret)
 		return ret;
-	}
 
 	snd_soc_card_set_drvdata(card, machine);
 
-- 
2.43.0


