Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A1CCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4FJlifkRqPEqQqgwEVL3qsdnCft9gZAAhkwAUUbqYm4=; b=AzanIwuVXyt7N/uI26tIpcG6iE
	T2ZoYwW1eMKG4oGaPeRV3ievhonPyhSiktrS5tjDYJDFja4grhlkcZo9YpxyzuFB4Uie6XYkjTdde
	I+yGGILqLEVXLtOHputB9FYy/LLTD/6gyNCKWinOhrLvWPMLy1BIeLiwad7Nuu7omzHP5mUAXFTQl
	pkgvhBCYkhQDW8KfxswUKpANxw4MEYQvfyMgVurUrcXYEqqjaZJw0jaeuKq/rAAnGfX2u5nt6ViXg
	o+TbQJiKZ4L4s9sZ9kKZQYtE9fMXcSFNB3Q5Ra8O2C82z8JWQOEr1oeRFW8WzHWyV6JdZ4ej/x/NM
	UXlmWkDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMAn-0000000CkNs-07pF;
	Tue, 02 Jun 2026 10:16:37 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMAk-0000000CkMo-36Zn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:16:36 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c0b9328c4aso18418535ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 03:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395393; x=1781000193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4FJlifkRqPEqQqgwEVL3qsdnCft9gZAAhkwAUUbqYm4=;
        b=FuSuRdQbtvdr11DAZ7znVOWpXzfwIuAzlMhhFg1HBbvqF4uQp84oFpFL5hpUrui0LR
         opEgvDdhbFPSvKeBa1hXlzTc0tkEAmITDeWFL9VRR87zh7gt04iwfCTQsk6NiTCbfUzf
         /aoCGTqZ3Pfb7ag1A89N7/LmbTxXnDX365fxArv68B7eEz9g91ODO3rV9nGx0rZb6gap
         /nHWUDMxBOAWsxb6j79LVfMXS4hhP+Ot3nG6pZkccumAqruEKvixMtE5AFq0jH3Swe2P
         dI1TLmyh+LSZ2Daz+B3Ew+dwqNhfKahRI3hFT8kG1MEwVsr15kZwPL5N9LsduDf1u0CY
         8IHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395393; x=1781000193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FJlifkRqPEqQqgwEVL3qsdnCft9gZAAhkwAUUbqYm4=;
        b=tOyAXE+Z+xGlumuzJY/TuYld0oLQZ6XGP35QcWmwmC2o0qEn1g/w2Hpw32LUb8xx5x
         g5vEKd/biFd9c/3M00bTpeTnlfhqA2GF3lM74skywGeN3TwFhSH8uM9SL0qDn4DZsW7h
         THAdQE5ig8VLq2O/EnzDBQJLGbjPc8aPpW2XeX8gfoANHaabL17JeYT/lDQ5s0pZ3dIi
         A4ui0TXvF77H1cjIpizxC5X3pjwNkl+PfDKn7iOyaNcFVifmY+jjaO3lasBEVDJzj6CF
         /JuPVqiFkNYQ2q5XtNjhx6O97RVsVvpVAsWEzQxP2Hy01eLxytpjnroZc3H3LtzzOmbm
         71aw==
X-Forwarded-Encrypted: i=1; AFNElJ8FaErhJTpZRm6ib+SwrZh1wok+3fOu6Xwqh/wQ/J/GI/L0O0hNUiCg8JZTF0/WAVK+ICGLnyg6bHSD7nuMgA7i@lists.infradead.org
X-Gm-Message-State: AOJu0YxNFfbnyhTUBbWgErjJhViiu+z6qcRTeMQ+KXaqmuWiKDHernY0
	GLeVNbNvqIUJ/CB3pQLsw8PRlc0VdTBS0bEin2zCXD0MDp74mJs8OuRE
X-Gm-Gg: Acq92OF0gaxCDyqSzTscnj/v1F4hUCmNSTBy9c34LeREllwhLjkd0J/kLujMsp4J2KE
	ut3U1HtCazIrCnsQXHDB6OTk56jPmE1uyVqTt3+MMNxJVXmYRpneZoFgCVzTjjQglErjN84bey3
	VaNFp8oCKqwY5uxXYT3oPC8sU9/HDkjuHil3wCyfFRx+hSThr/Lt1nTIjFfCEpmEG5L+0NLQ2w1
	jAqW7eFm8uIVJ0fimxx1SrtroSlexs6VX+hHSzOgeb/4MMu0YEyBPOlnL3rVRUyulnwgZzzFqZe
	YAGbYeDK6iRsKTwVbmGYkINjYUC6BqrYi8jBiHhsgtT1JC9DNR4OfExpSXHJtiqeHfL4eyxWoq1
	YG4WS4QMGh+Tklm4m8IMmjGWVv4BBC2SCTHOhcAoAX2vWBTzeY+ej5FTat80VOqRL1Kkpjya/ZV
	YXAShNkxXkzmFjc0Rryp4Usy+VHtmZhrhKM51HNm8lLmkK4nP5KzZot7BLb4Rgl6FVERCT
X-Received: by 2002:a17:902:ef49:b0:2c0:db23:4c9 with SMTP id d9443c01a7336-2c0db23074dmr97094065ad.20.1780395393395;
        Tue, 02 Jun 2026 03:16:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:16:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/5] ASoC: rockchip: Reorder clock enable sequence
Date: Tue,  2 Jun 2026 17:16:03 +0700
Message-ID: <20260602101608.45137-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_031634_785790_4E103EB4 
X-CRM114-Status: GOOD (  11.50  )
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

This series reorders the runtime resume clock enable sequence in the 
Rockchip SPDIF and PDM drivers to enable the bus clock before the 
functional controller clock.

It also updates the SPDIF DT binding clock descriptions to match the 
actual clock usage in the driver.

Additionally, this v2 adds two new patches addressing issues reported 
by the Sashiko AI Review tool regarding regcache sync failure handling 
and runtime PM resume status validation.

Testing:
  - Patch 1: Verified (dt_binding_check passed).
  - Patches 2 to 5: Compile tested only. Please help test if you have 
    the relevant Rockchip hardware.

Changes in v2:
  - Include two new patches to handle runtime PM resume and regcache sync 
    failures based on Sashiko AI Review.
  - Update commit message based on Krzysztof's review
  - Clarify in the commit message that the resume sequence becomes the
    reverse of the suspend sequence.


Best Regards,
Phuc

bui duc phuc (5):
  ASoC: dt-bindings: rockchip-spdif: Correct SPDIF clock descriptions
  ASoC: rockchip: spdif: Reorder clock enable sequence
  ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence
  ASoC: rockchip: spdif: Restore regcache cache-only mode on sync
    failure
  ASoC: rockchip: rockchip_pdm: Handle runtime PM resume failures in
    set_fmt

 .../bindings/sound/rockchip-spdif.yaml           |  2 +-
 sound/soc/rockchip/rockchip_pdm.c                | 16 ++++++++++------
 sound/soc/rockchip/rockchip_spdif.c              | 11 ++++++-----
 3 files changed, 17 insertions(+), 12 deletions(-)

-- 
2.43.0


