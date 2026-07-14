Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770E8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VMn+zsgq4KlhgLUxgzGJqjMCuofU/l6ZDLRETL0UxKw=; b=NV1D6SCEj0bpGfWaVNzCZJLxwp
	IcuXKURdSBNn4zUFtCeLwjn73m4d2+j3j9gdYwrx5YojrIh8RSTXJbgfP7qrSt8tysPkfMdlU1RCj
	Mc1d/+ptDgfMIPQKhVgFE1Gccc9+n2fZIpi2+wateGsMyzCgvJwFkCS9h+zLnG1MDQ6TOE1lghDqR
	8c2BnHb6fc5NLUPNizk3ei3jcFMkl0et1rxtGDhgDU2IhwWsu2/vpjoeuNprYgV4qAZXv47y7PyJx
	0E23feb5V1t38Kre6VZHaxNxclio2p0ZLB0fnayaGJQLthjGMARZwlERxaQXwxUu/VEy7a31HtmxY
	Mmsi4DrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaLG-0000000BYtK-3xNL;
	Tue, 14 Jul 2026 10:26:22 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaLF-0000000BYs3-0LkC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 10:26:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4758bd3731bso612240f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 03:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784024779; x=1784629579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMn+zsgq4KlhgLUxgzGJqjMCuofU/l6ZDLRETL0UxKw=;
        b=HEnAeG3E2scX+XZmEnpjurOyNxS+XlNCSndwvc8v/ZJvp2vWoSPhy8edDYTK65SFS3
         T7cGzrY0GITeuoKGV5gRU62Q6Y6Ww4VwvnMG14oPy5JTrnmcMZCZF+VRyyL++dI0kzKY
         wC8NkA2G1iReqb+VKmK6/XLyYvVk5wStYPqiLtsGR/spG8yi6cuWZ8HWk14D/MmKWCW1
         o1dUO7Xbha56Ayzq1a5dH31NyONB87meD5vPWDGE6gz8uhTaGYZzU6w9qv9Br/WDgkOr
         nTZIBEB9BBA/71XOu/pxwNElMUv1AsyqJQBCtnaRgvzkv1ETKpUixiuLHcJbWp8SxKkp
         vX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784024779; x=1784629579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMn+zsgq4KlhgLUxgzGJqjMCuofU/l6ZDLRETL0UxKw=;
        b=hXfCLQduflcvmGHGt4utskvPvMJf8cZAgu84odf0tSo15O6WBm0ebgN5tIzzZG9ipn
         xCa8hE+KGw4PF9Lr9QQLDtrFIigNqyYy+XzQZP6Jp4VajTpze7dOq2bmLsSj2aIMAK0W
         giyxjr2upQKnezjIK8K/vYn9CoodOYKugA1ie7V4oyu2yDg7rhQoIyNeOUFcg+QDEmei
         jCtn0aXtrjzVDwyhO5HpBt+Wks+OxZAj4/5zUsGJmnQmwmLS9IaerexDZ8H7UhJzEdYO
         KD8guLAkrrznCzzGk71IPKuQT8MkJii8Pw932qFQo/f5A33hvBjlkxltYTGcAY/chigR
         CezA==
X-Forwarded-Encrypted: i=1; AHgh+RrYsVUgFStySTNs9C5I/0FYsMImznj+IF6rB9ySMK1yOn/vlzojvBDKIsrWugC2MVhp+wN67GCvYnU+RqHwO0wy@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm7mpw5x6tmdEPdlJlH3WdJwLr29UPZuNrOFXaoWRSy2MfYYsl
	ofycL/TF/iNIHXkrnwnPpz5lc3MOyLc2AlummEGEd+rMR06UyhwU24bgKmeycILC
X-Gm-Gg: AfdE7ck2SqDZ7ey1Nralo/Q0+4rlmIAG3L9doE8vkRZ2bRuvplTkjM0t7lI7B6SWLut
	luvzldnjU3qW/FJDlKFEzFVt3oVAQHOnc79oULueXx/E6Ltu+JzyS1HwBq+t3/whmQxI3qwmdGA
	CsqODqqDVAsXU3DQ8z+QG3sG5sL5otO/45kFngi1PBQ2DMz1il+Q6/mxDDy1mlVeCXxDNfvrb66
	WL+eVjVr4zZhnKj55ob7vTrRLoZP5uaD/5treCMB+qD+YF0QkrFhYy3PxBPVty1CRgTlo1oqQgB
	UbM81P1ZI6UX6opXBz8N5K3SJWROn5g7pcic1R9yRv2QKkSUN2plT9OW8AovGc2SSHQ/J6axtId
	IQgccgdtL1yzELMIrHGU1bwH7irruk02n7WGlDw85AnEJgRQQczabmUgqwyHT2jDwK455JhPH7k
	Kqh0szIbLEsJKkfIrI8j6v2GBvt6HjSGAqmh4in5oj3pwX5sR9UtAykt15ruDlrwUbwE+OYExde
	/GW7C0=
X-Received: by 2002:a05:6000:4810:b0:47e:96f6:ab7f with SMTP id ffacd0b85a97d-47f2dcc1174mr15902133f8f.16.1784024778833;
        Tue, 14 Jul 2026 03:26:18 -0700 (PDT)
Received: from localhost.localdomain (ip-89-176-136-191.bb.vodafone.cz. [89.176.136.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c1f84sm7251991f8f.29.2026.07.14.03.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:26:18 -0700 (PDT)
From: Petr Wozniak <petr.wozniak@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	matthias.bgg@gmail.com,
	rex.lu@mediatek.com,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	Petr Wozniak <petr.wozniak@gmail.com>
Subject: [PATCH wireless-next v2 0/2] wifi: mt76: fix per-band LEDs under single-wiphy MLO
Date: Tue, 14 Jul 2026 12:26:13 +0200
Message-ID: <20260714102615.2943-1-petr.wozniak@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_032621_162513_0E504B70 
X-CRM114-Status: UNSURE (   9.44  )
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

On MT7996 (and other single-wiphy MLO mt76 devices) only the 2.4 GHz LED
was ever usable: the 5/6 GHz band LEDs stayed dark and a WARN_ON() was hit
during probe.

Two issues are involved:

1. mt76_led_init() calls ieee80211_create_tpt_led_trigger() for every band,
   but that helper supports only one trigger per ieee80211_hw and
   WARN_ON()s + returns NULL on the second call, so the secondary bands got
   a NULL default trigger.

2. mt7996 assigned the LED brightness_set/blink_set callbacks only to the
   primary PHY, so mt76_led_init() bailed out early for the 5/6 GHz bands
   and never registered their LED classdevs.

Patch 1 shares the throughput trigger across all bands; patch 2 registers a
LED classdev for every band. With both applied, all three band LEDs
(mt76-phy0/1/2) come up and blink on their band's traffic.

Tested on a BPI-R4 (MT7996/BE14): all three per-band LEDs register at boot
with no WARN_ON(), and each blinks on its own band's activity (verified
with single-band and MLO clients).

Changes in v2:
 - Patch 1: reflow the throughput-trigger comment and wrap the
   ieee80211_create_tpt_led_trigger() arguments to stay within 80 columns
   (no functional change).
 - Cc the MediaTek SoC/wireless maintainers reported by get_maintainer.pl.
 - No code changes since v1.

v1: https://lore.kernel.org/all/20260628095313.7790-1-petr.wozniak@gmail.com/

Petr Wozniak (2):
  wifi: mt76: share the throughput LED trigger across bands
  wifi: mt76: mt7996: register a LED classdev for every band

 drivers/net/wireless/mediatek/mt76/mac80211.c  | 18 +++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7996/init.c   | 18 ++++++++++++------
 2 files changed, 25 insertions(+), 11 deletions(-)

-- 
2.51.0


