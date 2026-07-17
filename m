Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E247EC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GMflJCfpssRM4YJJC+Tlv3Nh5omjZh8nOynqqpt+YI4=; b=h36E/B1bkwXytgfOeVsUQZHwrv
	/tLnC39da/TIR85Y33Acfv+vY2WtMxlIq7D+kj4wyv5W/6QgBs++mGp0Fffp5Lgg1zAeSG1/Zjnkx
	f89nowxKNq49JKwT7XV4tZ8+ZzQcFwMkZl1zkffARsmhLvVsc7I8fjop43Txqu5NyiU5RsMN7AGkT
	062ST2g/onVfQPy0D850RROk2Yx4QJNgtu3ZabNa3NMSXG1Xl5qo7nIUF05s1sUnkNtnmeinz2k6D
	7X3+eQbWyp6d/kBr3ZgTkCOV3iFcBfIqTxck3Fx1XaW+feOyDozaTP/Dqk9J8ECHHLPKeapXrpVBO
	7GCj8Kjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdU0-00000001X2Z-05md;
	Fri, 17 Jul 2026 07:59:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdTw-00000001Wzt-14pn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 07:59:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49546c690ffso6944755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ahdrone.com; s=google; t=1784275177; x=1784879977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMflJCfpssRM4YJJC+Tlv3Nh5omjZh8nOynqqpt+YI4=;
        b=fhGUWiHvOjr5bbQoaKxbZJG4ZfKPxO/GKKLfTy3uQlVL0ZRdu0GSvD5dGhbd+Tzu1n
         AuYs6LFy7soJQGUZh1VtbGFUm9C6HhW2yw5prpWArGmn7cLq4RNbDzjZ4sSLW0Ev+K4x
         fjO1orHahTBQhdl2KdIniWTnrR4DXDVP57PIb7PkOWoxXbXHjRPUNrmPnkjRaYmbIStW
         dJz4Xj8d2kJ10N2fJpyQoMfeicEPgSfzRRgiwNGalSfLtGnqGZomAAuLM+iYNazvuola
         96CmnzkZX7bNpAIHWs0tHSUSUAtrzo9s2dnuEIpi7zwQoDjcNLmPLoXNBJYFwzmDxu54
         0OHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784275177; x=1784879977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMflJCfpssRM4YJJC+Tlv3Nh5omjZh8nOynqqpt+YI4=;
        b=SLzX6kAJmby9qEta5rgXJMXu2UwbPekTe7mrPxOs22eLN5UcW0gGWtwGG/m14MeXSQ
         s96knX9VQR98fMBhfQoj4cSe+0gAm1EMuwoEZo8m4ixVtMTeDrZRlnFIVy9PmFoYtkOr
         uzbxgRs5kef6bXCzHVwYGqiQmTRK9UOsOVvNUcU1iyd1GIw3hMFdYCEerV7idj1VWyyX
         iLiQ8uZGXBGav63c7wyiE0irxPflhfJO8ClY9ywqoqyT05/b7wjV6uRom1nJgeSm2k1W
         FcQ21sB3gOO/gITqfX7KKRJX00oTxO+FLFPY7/fwq2O1VOM2aj0acM3zg4XZcN5tfQQI
         5moA==
X-Forwarded-Encrypted: i=1; AHgh+Rp18ir3rpPsgmwaGhL14ZNsq3rEQIzmjfl2+tm/lz8xiaVtWaEzrhHKG8bs0ZfaCkJFzESEz/47sloRgPKdcqWK@lists.infradead.org
X-Gm-Message-State: AOJu0YzRRFSHr/zrxuJuwUZUg1s5iDUbMh6rYo884MtV3kyk8PGDrl6R
	I2OQFE3GF8AXdyWhbgJYdZnGx6SUGu/eyp8l9E6j+42UNY7Qqp9B5nYYpkgFXnjsCg==
X-Gm-Gg: AfdE7ckRNFdW60wvIxKoI0aOnSPbxKz/cWuJO8yNSv5NCOUwjQ3+FS2kB4PVefLqn8k
	xl0sKokA3tp/wehgc3LiyLN5V65MWH4ACE2xvgWWdXKdcgOJDXRGfAlHSrso5FrVb2bc8T1g9Nz
	EXJ3NHzMpDrgC75dii+5R5KoNxvXwaf3+1H0rySQSnFiyUxJe21G2iWbaFcq8zSVaxUSdgg6BEp
	2OZCHBC6F4OL54V5SuV6kynrdMOzfMlLhRYGVzlPyBGKezPsBHKQxHR6CkvM3HlZ2uTKg690Re+
	aoWbWTLMO8VFLin+GvbRJcKob8xzOXm01ZQBD1ITIG/ZxHNvXPJ8WgfNBJQ9tPUU7+Kv2G3vGa8
	mcXnTy3FqP4Xi003V7rU1D6YSO9+mLDM6/JWHKo2DR6LMclzvWYuUj55HIyV0JMC2vjzvgxIonD
	hMfG6nOls1g9k2P76Shb5/xenb1g==
X-Received: by 2002:a05:600c:c04b:20b0:493:d078:796 with SMTP id 5b1f17b1804b1-4954a3f397fmr12203065e9.17.1784275177348;
        Fri, 17 Jul 2026 00:59:37 -0700 (PDT)
Received: from rikus ([2a01:e0a:edb:6330:cc2f:bd70:58a:fcfb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm31709045e9.4.2026.07.17.00.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:59:37 -0700 (PDT)
From: Hugo VALTIER <hugo@ahdrone.com>
To: Linus Walleij <linusw@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Hugo VALTIER <hugo@ahdrone.com>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/3] pinctrl: rockchip: add support for RK3308B SoC
Date: Fri, 17 Jul 2026 09:59:13 +0200
Message-ID: <20260717075918.1869879-1-hugo@ahdrone.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_005940_615035_59C0E2E7 
X-CRM114-Status: UNSURE (   9.99  )
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

The RK3308B is a silicon revision of the RK3308 with a different iomux
register layout: several pins (GPIO2_A2, GPIO2_A3, GPIO2_C0, GPIO3_B2,
GPIO3_B3) gained 3-bit mux fields in new GRF registers that override
the original 2-bit fields. I believe the bootloader enables the new
registers via the sel_src_ctrl bits, after which the kernel's writes
to the old iomux registers are silently ignored. Whatever the exact
mechanism, on RK3308B boards (e.g. current Radxa ROCK Pi S revisions)
SPI1, I2C3 and other peripherals on the affected pins are
non-functional without this series.

This is a continuation of Dmitry Yashin's series from 2024 [1], which
was never resubmitted after review and got dropped. Following the
reviewers' feedback on that series:

- the separate "rockchip,rk3308b-pinctrl" DT compatible is gone;
  the variant is detected at runtime from the GRF chip_id register,
  as suggested by Luca Ceresoli and Heiko Stuebner and prototyped by
  Jonas Karlman [2], so the same DT works on both variants (boards
  ship with either chip)
- the mux_recalced/mux_route tables are constified (patch 1)

Patch 2 is a small refactor so the SoC-specific init can swap the mux
tables before the per-bank masks are computed.

Tested on ROCK Pi S boards with RK3308B silicon, where this fixes
previously dead SPI1. I don't have original-RK3308 hardware, so that
path is compile-tested only; the tables used for RK3308 are unchanged.

[1] https://lore.kernel.org/all/20240515121634.23945-1-dmt.yashin@gmail.com/
[2] https://lore.kernel.org/all/20240604141020.21725-1-dmt.yashin@gmail.com/

Hugo VALTIER (3):
  pinctrl: rockchip: constify mux recalced and route data arrays
  pinctrl: rockchip: extract iomux_recalced_routes_init()
  pinctrl: rockchip: add support for RK3308B SoC

 drivers/pinctrl/pinctrl-rockchip.c | 266 ++++++++++++++++++++++++++---
 drivers/pinctrl/pinctrl-rockchip.h |   5 +-
 2 files changed, 250 insertions(+), 21 deletions(-)


base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.55.0


