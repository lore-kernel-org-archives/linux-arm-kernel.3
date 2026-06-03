Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FD2CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 03:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n5ygFXPwsJQO8ymWnjVkYNZg4lOorcqeH1A5jF0msXE=; b=uleDo3Co1ytITV02CsfLV4PV9R
	EmSDGINO2vQUvg2E/5C4MtyM2NUVqkxzJv1jMh3k1JcbI/U4X+BldmfcHb5EtEgQFckWQSH9WHWPI
	EavmrmVf9LGC/UK7akd766r6eJBZvRqSFMcbXX2qLT5CU4S+tvYVj6h7WP3c1XcXR7KMOMBC6afEG
	xEem26ijwbGYqSty2ntnBknPp01uIlzPXjOl5teVh+QlTbkAHciVQdZzATaLovUfMhlFJv71NRhqo
	qYLYdfDEKO7KA7HRFbAM7iPQbDqj5WcfJ87Y4QtJ+QHs988JezdtG1YN0yrOnddCm06KIBv5MCZ1f
	MwHTe5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUckW-0000000EDiq-3vnz;
	Wed, 03 Jun 2026 03:58:36 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUckU-0000000EDi5-0RXo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 03:58:35 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c0c2d792c8so21193305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 20:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780459113; x=1781063913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5ygFXPwsJQO8ymWnjVkYNZg4lOorcqeH1A5jF0msXE=;
        b=GvEuC/Dl1RVMH+9R9AJe+i9F4wNF9MAkHlDm06KevCTHf58KRLvLrQfWyDc2eZmdtO
         WQY8hwguBDKdo44di3cgpGBCa6O3bklASJMac0/9Y9tSejHdjjwokLFxMAdPsbuq5ynB
         8/q5Q5Qg7qEs5hasZgnZJNlaH9hP7DLUqthgWRbzzgpJrcx1rDo/AuqXq0UVWwKQggF1
         ekbPl5Vx/Yh8CkKdnpbANqukjv4jlXWchcPlt5wKw1KYcKEp5+fQFTGccZ5QOFdBDyCP
         zIuv9dIony6RzpyXq9tMzWrs//6SuaRPu0Y0VacdgIjYE4r6bOhSRbvfEWYIgSIEP5PP
         zI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780459113; x=1781063913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5ygFXPwsJQO8ymWnjVkYNZg4lOorcqeH1A5jF0msXE=;
        b=FebfEe56mgFAc4UvvlUVhOM7fezw6W1G6xcHdgH1sOD8Vj1eCknaHAG2H0XAzY+j7w
         5S7A7dgJFqHmaGj+HA+Ao/D+/p0LyQrI1nzNRazjlS6DjrwXvhtXF35ZUc1P9SHi3ZHw
         qgfIvq2zODVB4VJi5mRPrYz8+MMT5Sres8ftSnw/5wWYlOOIUPCcANtxqZ+7Btl4lEm8
         Cp2qsZanwwQaz8xbaNW4BdoyxTpKwlbDw0Pdl92IALuyp6EcmBCwAwRWSZSVBPLPhnqt
         Tj8QbHQHCgMu25hNSzbo+uQGvukBEsxo7FidZ4mdo9K7O0QzC/qyYT/SRVnFTzGL/5xv
         CWoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bjWiMqttweJMUX1Dtq2AmwvYGETRry98VpwBVleLHUFkrpTIzbXrFwhXKV8Gw0j2eovMcXgZHzW0kmeFQAAcx@lists.infradead.org
X-Gm-Message-State: AOJu0YzZoisaXKaFUNj1iWlhieagyrs13UoiFFSku44tczjCKhBasG4C
	ATd3Ky2gxAng7AyovO2YampMuxzNr1iBGyCiO+25xOg0DleubCvLl9ft
X-Gm-Gg: Acq92OFn/CxPOWb33Qf61efaF9oZIlFfOqi48wTaO/fDT0uwwIq5v+0d4SEy+EE2QIq
	7Vg3rBR2hw0Ds7pzcBjV6C3fbduphlpz2NunMTbc9Nw0zYXsXmBEzAhpZyeEa+EUSkuO/eBm5l9
	PKHnKxhzIO25snjYKbqBFBceU9nYjH0zoa8CJIPxdpuifmuNREqll9kOiPVc+6aABIQeMbQ+s/B
	DxKwvjScuzj5kJYphbLjSbyKBFh8aB2yolFPMLQSNVhuiDU9wjGBPjnSQSJ9Er6Ztd7YBkpFioa
	A4SDLI8XUDCli9pAcj5RH4gCZVnJcLGMILhhQ983d2UQnzI1QTgCt0/GkURzEMvfI85keRsSGgt
	+tNR1NYroY4RRFcj6nrUp5TYSRqndh15sXECQGs1TRJdlrK6AsbNDgCLYllu6ydQAlqKDbCTxZ+
	JTHu/+I4rTzJd6pOci/U8DFBrDBn8jzaL1RGrMKnel8VhhH+z9MrIRmNL4zv/CYZiaoMX+
X-Received: by 2002:a17:902:f785:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2c163d8ebccmr16632755ad.25.1780459113142;
        Tue, 02 Jun 2026 20:58:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e294sm8461085ad.6.2026.06.02.20.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:58:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: rockchip: Use guard() for spin locks
Date: Wed,  3 Jun 2026 10:57:38 +0700
Message-ID: <20260603035741.68893-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_205834_148665_385C8380 
X-CRM114-Status: UNSURE (   8.71  )
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

This series converts spinlock handling in the Rockchip sound drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.
Compile tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: rockchip: rockchip_i2s: Use guard() for spin locks
  ASoC: rockchip: i2s-tdm: Use guard() for spin locks
  ASoC: rockchip: rockchip_sai: Use guard() for spin locks

 sound/soc/rockchip/rockchip_i2s.c     | 160 ++++++++--------
 sound/soc/rockchip/rockchip_i2s_tdm.c |   8 +-
 sound/soc/rockchip/rockchip_sai.c     | 258 +++++++++++++-------------
 3 files changed, 209 insertions(+), 217 deletions(-)

-- 
2.43.0


