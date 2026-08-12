Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ECFC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 20:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YtUGituyk2Ddp0UGCePWRfQ0rhz3dgx1B50fS+vGVpw=; b=w/0UWSn7+N/obKtE6CV8gadahn
	+ShaQZzkQhbkT6vpXyYRGCJLGfAWD6EOhTdUal+2cZiZM9vVMLmnhIZFpGYjP2UTZ9YN90LNceHfh
	pidDD/HR9YS0++ZxfkEgZIWi1IKfe16NZBgHmbepzsUrEHCXHZXgVtpd2920gKibe1tqQiGsWSF0U
	isKfUPmkhs3YwWckPiVVBO0RYnfA7ap/rjE07iFASpXkOR4RGRYo2RqX+Xt50MaT/eTZBiExg3fZn
	CJZWaxMROrVRxxhLESIpFk0cMOXqm34E/YiG4IUE4FsGNBG45SQQ1Cw7KLsbc39EumwTux5wjCwVb
	FHtmPEcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFuQ-0000000H1O7-0pZC;
	Wed, 12 Aug 2026 20:50:46 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFuN-0000000H1NN-34ut
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 20:50:45 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47fe89fb333so807269f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 13:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786567839; x=1787172639; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YtUGituyk2Ddp0UGCePWRfQ0rhz3dgx1B50fS+vGVpw=;
        b=iOuO5xVkFxTQ4Jz9CTCVYAHeJzo/3Jo8Yk5c4YZdiTKanNcM7urtY8vU0PrWjYkeLk
         2hm6Hp6UpkcQHdtc0aGGaRknBP4Xp1IzFZBbAZCzstyFFrVHDroAgGAE9XCxooN7GfSJ
         BtI2elZG08oZUxxaIAsIDiJRYogENOgpwdPoOiVyOxAQ1rebEK4Br6nvjtbc9IZKqkf2
         FCT8RS9ooWEMZavCTPg1g8497JLzRTI4sS7UTeHBQRLTFZdYw7S4HEHSdzLMpjRbzshw
         42vsBUPWzpZQJL3gjItalSWOfcoMBqeSa38JykI0Z/hyO6qJP41b+viSwfICqDK4QUyP
         EPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786567839; x=1787172639;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YtUGituyk2Ddp0UGCePWRfQ0rhz3dgx1B50fS+vGVpw=;
        b=fCULToZtWn2+cHFwlfbQDk4Sl/w9y+CVMnE6nXcBI13LCO7g+6abCnl9PY63RKQLZ+
         cyF4qKxWpPFRCc1k4j9t19gi2r2Nn9Dr80yJK6wTPpBc4JjLNtAlkw5pPliwjQ1Z7Tgj
         cshm1qXqyU+r2gkMAQ36/p2jccRMUIMDJozURPeHRrG6SjH4xDLizP+x1h0vEWFguh3i
         qTDfGxMkEEdCmYikkYdlNi7JTNZh9MvsfXPxII5fTV3O1WLQnNyehLudaMiSwltM5y0x
         EWxvg70UbgBMUO5DS3YFsywhR2mxFrkMVCuPD5OWmbUCXOAnh0eZORYnkJzFv68bl8yK
         346Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp7m+oVo2UUhYTlR76rrEoIir6HXibkIeTNsi+qM9TbXooCKjqJQlmQ6h9yUF+oRon0fM7TiPOy7fn/lvxMhKzX@lists.infradead.org
X-Gm-Message-State: AOJu0YzVsl20fub0FbiRRz4W8A34dUfbGAKINQQuHikS42xJe3toSTuA
	axzjAFeWxRKrBVlWL9Nwpqgzxw1P6wjvmI/bEL+Q4S/5KtqyBN+UikiUiV/OZ0VZBD8=
X-Gm-Gg: AR+sD11kVoLKUq0WEmbTKw7z5LRzqRVDd1myABeLwOc/Ygj54da9a/oEF/jPj7d94Um
	BiMIoMlcC0N15mBFypx/qW8Nd/JU8z73wgoRDTRAONSVoOW9t9+ZUatlUXcIKCxm6dXnjndYZ1s
	oTmIUxZrqyPFF87G2+0fDF5P4FlrND4HSNTa0mdmeJoZ49dtMlNllBveh9lZC3gWSUrM/5xJFwo
	LpKL4VAjSJ9mvm/YN1VeUu5jdRLdc0xppSL4fzD9RYCjF6rzWKXNnz4GzeScLACLR46lCYiCt/R
	9Wl4ug6xX2ypUqQbzXQKeZhlBEeDIfKnGjztf3D+LJzeZmrwwHN/4tqrlByo3DcttoDZRSjipNV
	/iu6tGyssEmZgoRmPMkCCdsOwG4TvilM1p8vf3eGBAIntzrfeFaKyEjo+S7aW64N+DwDQQ9OV3P
	Y3caUS7YbmdSxnMcaap4DJ1cbWsXVeoYKbuIVo3gfnZcxykt2kqj885Oe0VHU=
X-Received: by 2002:a5d:45c8:0:b0:481:4dcd:aefa with SMTP id ffacd0b85a97d-48159ca6290mr823395f8f.6.1786567838585;
        Wed, 12 Aug 2026 13:50:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:282d:879b:d1fe:f977])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4815a5af45fsm376508f8f.18.2026.08.12.13.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:50:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 12 Aug 2026 22:50:34 +0200
Subject: [PATCH] ASoC: meson: aiu: make aiu_formatter_i2s_drv static
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-aiu-formatter-static-v1-1-67936d57ba05@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAJncfGoC/yXMQQqDQAxA0atI1gZ0LKX0KsVFZoxtClVJMiKId
 +/ULt/i/x2MVdjgXu2gvIrJPBW0dQXpRdOTUYZiCE24Nrc2IEnGcdYPubOiObkkDB0RXVIXhxi
 hpIvyKNu5ffR/W45vTv57wXF8ATuSZ+R4AAAA
X-Change-ID: 20260812-aiu-formatter-static-23aaa4c3bdbb
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ZwCKvBVeKCOwHFezxhEHs3g/mJs9UKkhhIxC1BaFhkU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqfNybkgNRRQANZqrgMfq5ox95yeE5stSqqgOYM
 tnyCOUWsYuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCanzcmwAKCRDm/A8cN/La
 hXfiD/9wjY1KHufHKO8MBicjjnToaV+KSrITmuuCi2jyWAI5BqRoa6xPOgAb3b6yv2IiHQigpXu
 RiC6MGC8V7cdLH9Q+HP0lrrxysgBEidXkIPdFOGdDfgt8jI9j4fZOQnHBTJg4OQgF5814giLD/Y
 GIYE4uykk9jwjNXtW1UJiZ6DVzN1WCrjFoVcr5TwC5UvqMn4tGrW2YlgSLcZCCFJcDSNyCdr6of
 WkQWAwDDo0rv9BDHDWmcmtaFk5kkyCmLfu5tJLEtfbh89pDOGwPXESrZP2/CP+eMGizHLiUpydp
 N0WnBN/xsFKn3pSOFADKxnH6qoQMqoCi+nTMtJIkxmTmW8Stsaae+sqva2ivT72hl5Tpt3oiRS1
 Fnq8GVoO125m2M/T1GJ3GBCJmOb+L6HDJVdCtqy6Dx3HKT7aFHh4Bqu5+ZnXNdzu4YD84ORq/tR
 RllY6zDRUHGDx+gH/+9vQPI51dYtWhilSQ2VyuZXRC+qGtU+/URFhVVhqdDsiFRTZZejx7kro3w
 AK+hkfu4Bg9Mm0JIL9cycjTC16dc3b1wtFJYNWMiBKRzFPXjMvzol2JcODG2K+nRccYJ8XMdWyS
 JBoZjnom6I4KEs3tde+B/Z1rymBRL8o25gd8YRGgwfgqTdwtLL5rvpbpaTugYAobONYTbDEQYPr
 WTI9o3lib8LpqDQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_135043_834201_F05162C9 
X-CRM114-Status: GOOD (  13.31  )
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

aiu_formatter_i2s_drv is indeed used only in the aiu and it is not meant
to be exported. It should be static.

Cc: Valerio Setti <vsetti@baylibre.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608080634.hf6aJGPB-lkp@intel.com/
Fixes: 83b83024cdbf ("ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 2668646e3597..535fbf7c1639 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -182,7 +182,7 @@ static const struct regmap_config aiu_regmap_cfg = {
 	.max_register	= 0x2ac,
 };
 
-const struct gx_formatter_driver aiu_formatter_i2s_drv = {
+static const struct gx_formatter_driver aiu_formatter_i2s_drv = {
 	.regmap_cfg	= &aiu_regmap_cfg,
 	.ops		= &aiu_formatter_i2s_ops,
 };

---
base-commit: 83bf17424a97ab277ead2d98e3500bc632df0c40
change-id: 20260812-aiu-formatter-static-23aaa4c3bdbb

Best regards,
--  
Jerome


