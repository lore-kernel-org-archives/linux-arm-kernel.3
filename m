Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48028FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 04:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FtGPxykfSJnjMbp7TJp87gUGFkeGywBatbMxDcRE/PA=; b=CXtqQaYxPABuebrf/6EuG4kZ8k
	/WPCy8RWF59XgBwHNhJBrTr2C1ne1GtO7BudXkbaynQiDctUmOOH7PolRebaoIR+PgZC64zArpBiU
	XyMbrrFsfht+6YgnJc3dSpeGVmt6nMBj0u/gNmdd7ficEksuK2NHHX/5H+zryGN3QmGnW+myL0bDK
	6W/lb+NYk+0MZqRzMYDS2YRz1Suj3uqCEsBGmiV8gcsLDgAE5uSIVMVQ48NuI8OBe3LItfIYHYhP9
	yDYPWT9oTgPPGtxBoJLNq9aaUqpTBtvI7XM4zQOp/N8J2jk1jyAdIwwwJdENO/0DqtCS1gLVtMCSs
	uTN1d7cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwKp-00000002uES-31ok;
	Wed, 29 Apr 2026 04:15:39 +0000
Received: from mail-ot1-x368.google.com ([2607:f8b0:4864:20::368])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwKm-00000002uCL-2zZZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 04:15:38 +0000
Received: by mail-ot1-x368.google.com with SMTP id 46e09a7af769-7dccb8644c4so4617885a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 21:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777436135; x=1778040935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FtGPxykfSJnjMbp7TJp87gUGFkeGywBatbMxDcRE/PA=;
        b=JLShBczCddve+kNTxuOiUMpfIga4M/ggfcCShHHpqcDGAXehgv4V6gwHiOK1gnqGEw
         xNOsuWZBHlmhijfTkcPQL/cmKCdhKld9R+TewJkSPVeFme9ZbzGZ0VETlqQ9LxooUaL3
         2tl+yg/zrgllW2gMfiXfTISzZ0FpzH5ZK91AX51rmghC+y//ygjmkH/Miha16bOadfUJ
         yC6hGL3a4wLgexhbPFqt9wt5u/egpORLF6dIUn6cvZuXRzUoBqgR3QzQwUaXUBehOcxZ
         +lEtNbG71pzfc6GNMx3xlVmKc9FvEemyfZbOQs5b98zIcQWtu1VAUmM232OXezvzClTW
         HEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436135; x=1778040935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtGPxykfSJnjMbp7TJp87gUGFkeGywBatbMxDcRE/PA=;
        b=G16TojlF40rYhc6Njx+VjPzAl+7QDQWWjKI0hBNzQRo8ALSzGrPqLFpjptcIaXg87B
         cuRBchfmbV2WXTA3Xw8eBDicqlIZqddhTy8+PfgFd+JellOjSiD1x0r5gVf6fInKQCE7
         qryV6QfNX2vN7D4Kh02BlELo26iW6QuwZIUb2fw1G5V7XV23IG6g48us3dWPOxSYYG1K
         yc5/Hh/jJMSUs4yCsfMB0wc705dbMsEXQFrNPlwFtLdNWYFGa92aN3znJEF59JF8CHp3
         94FhwZD7ukaCLv9Ytu8xZkH5XHZTzooP4pKQgkh+QCYvrH2Uy7ALG1yuIp8vkttLnB67
         Fivg==
X-Forwarded-Encrypted: i=1; AFNElJ8TDEampnxlm/Grt3n8l6cg8naYkpVtpB9pUfJ517ezSjzfDIo5KZ3FBvi5bZ11x245s1fNzzfDfHo3nzOcpGy+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz9ZHjlkDr/6DsZoqePm+/hGi9xOQXG6w2oFC0UbWUBYoTIUa5
	rRvv51yJRjzQOmUVqt0AsOLxo3jRlt2SncjDuf06VPKgyCbswUHt1N0YWaqRh0E591XWvhB0nw4
	gOgEl+F1FG2E3n0o0MlHE4HfbR+Eyvtrx8TXv
X-Gm-Gg: AeBDiesHA7wBZxA41nNejVtRsNGSp5UT4/1nvOXn0VWE/w/kR5nlNHSnrBWu0vUsO/W
	+XeAymdeuLAG9nXKgBrGyRgIVVl/xeReaRuky+NSbHbvvNPVq5oX4Vmtn+jKh6D60A6FWvGzgq3
	S5rlUjNKypEobJso9JGcyaS6OJcZBjJ5GMrxLarfJQpZYOuPVXtyAEPTdahXkWT8PashKYlbAqC
	RXxthRq6mi+AsrQfVCoR8myn8t9owBfH3NEUfSZxxQN3aKyrPrDfOpFQY/4QOWocdJhmNVd4dL+
	N1PSR5setQyx6CpysqZ9hOl1WwhXqtMS4pegxbRw0KVL1emvtT769up5KtAWUFvzlOwMhvND4H6
	95Uvb8H+YccOH5ryKuUWQ5vCF24IngIwtWN0SkgkHhyrnPX0bSvHC4ik=
X-Received: by 2002:a05:6820:1987:b0:694:926b:551 with SMTP id 006d021491bc7-69668520ec9mr1220128eaf.55.1777436135405;
        Tue, 28 Apr 2026 21:15:35 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-6966baf952asm41557eaf.9.2026.04.28.21.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:15:35 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Peter Robinson <pbrobinson@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH 0/3] drm/bridge: Add Lontium LT8711UXD DP-to-HDMI transparent bridge
Date: Tue, 28 Apr 2026 23:15:25 -0500
Message-ID: <20260429041528.558254-1-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_211536_769877_46B97E5E 
X-CRM114-Status: GOOD (  11.93  )
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

The Lontium LT8711UXD supports two modes of operation: autonomous mode,
where it configures itself via strapping resistors, and I2C-controlled
mode. Review of the earlier Orange Pi 5 Pro series raised the question
of how a future board requiring I2C control should be handled, a second
compatible with a driver or we make both work with a single compatible

This patch set covers autonomous mode only. On the Orange Pi 5 Pro,
resistors R9, R17, and R27 are unpopulated, which straps MODE_SEL low
leaving the device invisible on the I2C bus; I2C control is not enabled
on this board.

The earlier review thread is at:
https://lore.kernel.org/linux-devicetree/20260425031011.2529364-4-dennis@ausil.us/

One non-obvious detail in the DTS patch: vcc3v3_dp carries
regulator-always-on because simple-bridge only fires pre_enable once a
modeset starts, but no modeset will start until the connector reports
connected, and the connector won't report connected until HPD asserts,
and HPD won't assert until the bridge is powered. Holding the enable
line high from boot breaks this deadlock.

Tested on Orange Pi 5 Pro with Linux 7.0: HPD asserts, EDID reads,
link trains, and scanout reaches the display.

Please take a look.

Thank you,

Dennis Gilmore

Dennis Gilmore (3):
  dt-bindings: display: bridge: simple: document the Lontium LT8711UXD
    DP-to-HDMI bridge
  drm/bridge: simple: Add the Lontium LT8711UXD DP-to-HDMI bridge
  arm64: dts: rockchip: orangepi-5-pro: Add LT8711UXD DP-to-HDMI bridge

 .../display/bridge/simple-bridge.yaml         |  1 +
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 88 ++++++++++++++++++-
 drivers/gpu/drm/bridge/simple-bridge.c        |  5 ++
 3 files changed, 91 insertions(+), 3 deletions(-)

-- 
2.54.0


