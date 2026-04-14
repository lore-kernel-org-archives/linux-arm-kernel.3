Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABD7F9D0D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 21:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCAekC6JihikkAEuEdzid7oOkeSPTTqIBC2dONRzXqc=; b=xW0++stQ5CRelYRXVZubHSUAGb
	7oZZjCoWEbVy9PxzDFP2hRnwDomZ3RNa3pTcFI9LRfv8DW9cuLorYYvORzaxlzyTBJQEBZ+unrZ+N
	bzVl5n77i9yA8rhO3koE+OU0AxkdgQAS1b1kO488b145GphxIoTlM1cZ4mmYLUSjaPp1i2iBA7Krp
	+BKdtfjBMlvt0SrGO0UROEZYIFPhAINyBODFV/lpxqjbJIDSHo4zNAel3bBNXNryLp2KseIbk6qRU
	rJuG5NpAwQFCFmDizXAHPlPsHdQSzHEbqr34z1aK5vtuSb1Hh/Yn1yqig9fT3emCauSsE6tBn2XYO
	gWY57dEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wClVY-00000000FjM-12dz;
	Tue, 14 Apr 2026 21:41:20 +0000
Received: from mail-vs1-xe61.google.com ([2607:f8b0:4864:20::e61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wClVS-00000000FcX-0a5D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 21:41:15 +0000
Received: by mail-vs1-xe61.google.com with SMTP id ada2fe7eead31-610e2e8f57dso643407137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 14:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1776202873; x=1776807673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCAekC6JihikkAEuEdzid7oOkeSPTTqIBC2dONRzXqc=;
        b=ig6/TNQIEy8TANp/I4fmzMCwW8N912RQVXtRrKPrt9xDkZEBNm1Kyz9Zi2ZafuqiAK
         88xW18+NC0oEdi++JZHpq+QlLhuIN15erFt7Qns0+zI4fEGf18CUHIXOC2yDFLSbSQk9
         1DB+NxavVDjtD5r4+jDreDKcP9dWAZPjELY3M349rutRgJhV0XkpMa1zzVGL14+qfxjd
         YoPKq7Z1HSo31N8BfV+mjuY/42uCuqCdbOsOmJuHdh4l5SlzQHEkt2Pdsfjqjh4eERvu
         11+fmwIommgP38cHISZjuz+YYhyOlKLCo/jZJXo1dqf1BRmbu5UtoJnguTQGeHzuh5Iz
         Y9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776202873; x=1776807673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iCAekC6JihikkAEuEdzid7oOkeSPTTqIBC2dONRzXqc=;
        b=Eot/bIJ0MId1YA7DvEE0DRPjP0fuDaAcDjhRG9e4UF45M8WzuGsNB6dfImbFxFJLKb
         gwm+TsMtcNjfXriKrUBzsD3UP2yfy6mMQLHNyvd9/w/LhdBOzDsk6FX4Ihjr6S6XHLah
         smu2LJaGG1MqaDBXhzagARRI5rt4FmvgRl17D+UJpn8X4VajUkRYkM1ImohXMY8stHjc
         W3GcvulHt8H9mFZyiBguyjnPWvp+fYZRDMR31+bTodmExsf656cVXL2bxzIiQWvhtXWc
         POERUsprl4xQZLcr+sq8klXsxauuPec24brmWjtkUrBbYQla/xS5wJwubDkpYW5wlAYL
         KQWg==
X-Forwarded-Encrypted: i=1; AFNElJ+q1gfrWNC1IjhD3r2Fe1Rh2IdO1yk6fTIkkTWubWC6wCysm+CUv243Q+CDibqWrDjWPL1EIT79sf4cTIiU7prO@lists.infradead.org
X-Gm-Message-State: AOJu0YylFY1K4fZ5wsH2ZhSX9uX9FFu/90CbGuFLrxys2lJIX9ovBauB
	gxraucwpO0fUmLcgyOrE5CzwZTi6p/xnBw6yc6jyvxK0OtErYEqTmvTCXwxSOS8CCu2lmGTf05F
	FJB9fgyrhylBSWx6EzTjBQAk+8RQCt3wV2xzy
X-Gm-Gg: AeBDietvu09NAGE+WDEKVfgK02iGAAxMI5upFJ8vj5aGdRhDlqx0JQDSZmp1JNn/I2a
	xONJ3xyMkWXkQ+fDv4K0eSPnmcx7HZ2FefwaDIHXfv1jO+Gh0maDvE6gZjGmB5YkqctGoKWnyAY
	aXSA7sX7kcAAg7CeelQKj/jJhP+bdStr0a2Cx34iO6t4Z/NiNSeuq71xAgYoWGXiHu74jwrhgjQ
	gowLYBSqxj/tM6Zifu28DDkyRhKceXps1R1eZuXNpeKOw+TPDzHdsksOiPbA3oP+KZ7KrniayQ3
	wxTR3ByfuZiFfyNH0c6nsKlgzO0/9qfpucQ19rvd2cgVkddfIKvSdoy2ln7aTbMxRgfQ1onAQZV
	u4yA2X44aX0GontZZcW+ZiH2QQvGhmWEPqwSW49sKpMw46NPwt0L+LCs=
X-Received: by 2002:a05:6102:48:b0:611:959c:86e with SMTP id ada2fe7eead31-611959c25e6mr1708483137.32.1776202872864;
        Tue, 14 Apr 2026 14:41:12 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-95691131afesm346899241.1.2026.04.14.14.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:41:12 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: 
Cc: Alexey Charkov <alchark@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hsun Lai <i@chainsx.cn>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	John Clark <inindev@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v7 3/6] drm/bridge: simple: Add the Lontium LT8711UXD DP-to-HDMI bridge
Date: Tue, 14 Apr 2026 16:40:54 -0500
Message-ID: <20260414214104.1363987-4-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414214104.1363987-1-dennis@ausil.us>
References: <20260414214104.1363987-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_144114_185121_337E8682 
X-CRM114-Status: GOOD (  11.61  )
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

The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
to HDMI2.0 converter, designed to connect a USB Type-C source or
a DP1.4 source to an HDMI2.0 sink.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 8aa31ca3c72d..42c1f3d5ba0c 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -270,6 +270,11 @@ static const struct of_device_id simple_bridge_match[] = {
 		.data = &(const struct simple_bridge_info) {
 			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
 		},
+	}, {
+		.compatible = "lontium,lt8711uxd",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "parade,ps185hdm",
 		.data = &(const struct simple_bridge_info) {
-- 
2.53.0


