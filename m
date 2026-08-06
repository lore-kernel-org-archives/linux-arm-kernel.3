Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E9CC56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PBJSVLcuS698iPvcGBsGEqqGtyBuKd0ri3MDZGD+Opc=; b=f2zbLEolz89847xkbaNv+cb20X
	8iQX4E9F0NVE4fUpNp5u2E28Z3E1+l4jm0psIcZb4MxYYs+ddDh18pRtDtRmhNorND1rgCacsAuWI
	Q1Wrskg9cPM8oaMwFGEKfe3+gl4+1THLAnDlh/SjoX44FaghVF3w+3S1G4XgyZM6ub5FKsdYqgQu9
	lK38A4L2mhg1ATssS/hYdlKWfJZ+WrjNGZ8fULNUvra08Ztuia7km+g/ClUpLyIgrB2cX84qeAjo4
	P0PVLcI8DhB8jIPRYZx7mH12HmBtgtK7Wx0KXYjNFbfiF4p8BA1QDj1FnMKiACWTfQarThEXR/LG5
	dOEi2daQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqYK-00000004wrD-0Rgh;
	Thu, 06 Aug 2026 05:22:00 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqYH-00000004wqN-361I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:21:58 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84847482584so426130b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993717; x=1786598517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PBJSVLcuS698iPvcGBsGEqqGtyBuKd0ri3MDZGD+Opc=;
        b=C8ZanS7hJygsw83hWkI76bwicL0LdFSp426GwxUPKPTenNpmiCDZFqp2NKle2nA38J
         zUdLIAyF8olMhSpwbv4CTG2cmbsh1syy0J1BjSRW0wl+55YZn0s3137He2QRJVA3mxDv
         RK8MoDn542oW2ytYYrIPfgr5qx11lXusyttAl+sdc/0eGDhUX9xP3AlMpbc0Wk/uieMW
         o8IVFYDsfYoj5MAtevVn0AMWJLj1AemlYD3sm+O+TcPpLktFGkx4FvkgriQjdudV/Kok
         hubayNZfk2Z7h4ZiKjxFA4ABbV+/7z/RUy0GUGPETfIMNnSSxYdm4i1e4qr5T/gpZxmj
         gcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993717; x=1786598517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PBJSVLcuS698iPvcGBsGEqqGtyBuKd0ri3MDZGD+Opc=;
        b=IjSjiG7YtKf4bzk7zXVNHAXuD99XXWgGwHaAIUCMz4HGqcgbtwHegtUReObBb6qHse
         d1J9Z7XMKJ/uFLlBWgE3q597Bcmhb1ZObNlLdtAK6kC9PYa7qhFBA80tyAXDPqObEPs5
         DsWxgt2licS7ZljBNzsc4Wtb81vWpI3bxiVr4FFLyht7EnssEpWe0NP/htacfdqWnklJ
         +SJbs4KREjPQJL8kBDDNDO2CJFWkTpYsFxT+N3TFfQijFRKMkfwkqOGwG7M5jebFLMxM
         KCEzwVqPWgodPu3yvKI/mlckOnQOJ4S6T4SqZ4EIapkcOCgFo93SY8M+64cC4y2x4UD9
         ifyA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0Uvyi0oblKKO5vd59ITGP+xpmFQlcAdZwP2k6YqQnuQkJ7ESiLigZlWq89CZVPlce5Va9u2IyUuOHCRdAIv7M@lists.infradead.org
X-Gm-Message-State: AOJu0YwyMYmsFHxmFgZZesT3U5vPhXWS5ZCGKFRhH86k/lEB4dpBB0DY
	U/+tT7rjnugb2InNolLxatdDOij9O4CK5TpHVHt2e3SrWc2AOHfNI93y
X-Gm-Gg: AR+sD117CLSnppPDHlQ1HSEYb7LrSz3Qp0aySqAH0kQ0UCwe8pb0O/EVZBRxjTY0V2r
	WS5488KpfqUFyHWwzeAXLQEOHIPKlnpADz84woxmY0LrLHiDg+CwAePStF5hJckuR3Dki12Ufn+
	UbRXR7UZCB+NanWoWeMfnyNdUiKwMgdXZE4fZvT6JE1bOVpGkchp3W1nKT95vS6p1N0G/aAGWBT
	UJdGq4bs5F7AUwUinPLVRD4rG1RwErpT3lLVi72/CBzt4uiDS0im69Na2iQXJ0mB/nBuBWwhiPd
	4OzMh/Q3xFPj8FHnr82K7QKDKycX1UIJOKfR1c7BWip01cBDYLdf16H+uQGDNxhgBgVXr411Aqi
	sCUJzzD6R6zdSKXfVl95U05sfvYvjxCs1K7khzv/kTis2AvAesznqdsdGw3sdLYEfeuN2WWGD86
	/0pjL5wRdzk/UjI0iAN2+hwdeLoHOaXju61fjumbjByc99r6ZcJD8N8avD8pz8jYLfl/4BqMxlQ
	f7EVzKQiUdoRLzCurt24hKv9wyBG+I4AplEPELNo1O5+R91JQJM2aYpc/qkh21IXCtSPlI9ycux
	rvlN
X-Received: by 2002:a05:6a00:1482:b0:84a:29af:a0eb with SMTP id d2e1a72fcca58-84f47d8c4f2mr1960005b3a.9.1785993716736;
        Wed, 05 Aug 2026 22:21:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:21:56 -0700 (PDT)
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
Subject: [PATCH 00/14] ASoC: rockchip: Simplify probe error handling
Date: Thu,  6 Aug 2026 12:21:22 +0700
Message-ID: <20260806052136.21034-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222157_780535_A4329A2A 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

Hi all,

This series simplifies probe error handling across Rockchip ASoC drivers.

It replaces open-coded error handling with dev_err_probe() where
appropriate, removes redundant probe error messages, returns the
original error code directly, and fixes handling of -EPROBE_DEFER 
returned by platform_get_irq_optional() in the Rockchip SAI driver 
and devm_pinctrl_get() in the Rockchip I2S driver.

Compile tested only.

Best regards,
Phuc

bui duc phuc (14):
  ASoC: rockchip: rk3288_hdmi_analog: Drop redundant probe error
    messages
  ASoC: rockchip: rk3288_hdmi_analog: Use dev_err_probe() for error
    handling
  ASoC: rockchip: rockchip_i2s: Use dev_err_probe() for error handling
  ASoC: rockchip: rockchip_i2s: Drop redundant probe error messages
  ASoC: rockchip: rockchip_i2s: Propagate -EPROBE_DEFER from
    devm_pinctrl_get()
  ASoC: rockchip: i2s-tdm: Inline PTR_ERR() in dev_err_probe()
  ASoC: rockchip: i2s-tdm: Drop redundant probe error messages
  ASoC: rockchip: rockchip_max98090: Drop redundant probe error messages
  ASoC: rockchip: rockchip_pdm: Drop redundant probe error messages
  ASoC: rockchip: rockchip_rt5645: Drop redundant probe error messages
  ASoC: rockchip: rockchip_sai: Propagate -EPROBE_DEFER from IRQ lookup
  ASoC: rockchip: rockchip_sai: Return the original error code
  ASoC: rockchip: rockchip_sai: Drop redundant probe error messages
  ASoC: rockchip: spdif: Return the original error code

 sound/soc/rockchip/rk3288_hdmi_analog.c | 16 +++++--------
 sound/soc/rockchip/rockchip_i2s.c       | 30 +++++++++++--------------
 sound/soc/rockchip/rockchip_i2s_tdm.c   | 15 ++++---------
 sound/soc/rockchip/rockchip_max98090.c  |  5 +----
 sound/soc/rockchip/rockchip_pdm.c       |  8 ++-----
 sound/soc/rockchip/rockchip_rt5645.c    |  5 +----
 sound/soc/rockchip/rockchip_sai.c       | 15 +++++--------
 sound/soc/rockchip/rockchip_spdif.c     |  4 ++--
 8 files changed, 34 insertions(+), 64 deletions(-)

-- 
2.43.0


