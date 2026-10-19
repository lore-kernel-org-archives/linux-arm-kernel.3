Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B6CCCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zL01sBFtwzYNtBLBNOJogTgRcd3XXRxHUdSzNtaNMhk=; b=Zv08KNZGWNxQKl
	/tHtamY3BATwoF1Uzp+2HVGcNTb/znAfH+luCDDN6ozQCCzD6ieklLXv+YpZEl42FfDdqV5Fy53CY
	w0d1Q5Df8F3bgYW68pSIL5uLAXqTlBaHEGV0Zgq1qTyGVvsLGVTKBLVXV0NOQ5rPVwDDKzuJMULoU
	iQU9Sx0cWZUtmcFZ8DJ8kEzQ+1yFHgeO4oPzaGCN8acp1OnDtCo823jR/U/blFnNC+qvnV6zCKXY2
	jxAYUdPJk/zG6bZHUH8ED7aYak6wUuihOQ3PhYE9dSHPbWe6rHytO/R7cttPiuRwSpxHOiqxct5X/
	nah2tOk0ZW3t0w4CzRkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkTp-000000079zn-27qG;
	Mon, 19 Oct 2026 10:20:33 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkTm-000000079zP-3cs9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:20:32 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-15943c9c005so1272521c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 03:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405229; x=1793010029; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zL01sBFtwzYNtBLBNOJogTgRcd3XXRxHUdSzNtaNMhk=;
        b=d5AmcbBNzbQqVomFOyywR844+RkK3PvsrVbD+phGZ03LjCsd1/BR5e92ZESMbMV8V4
         SEWq78QT9Yy3QLZpgcMQdPuR0FA6FDahzR8DFDY3Y+9TJSKztzLkDITSZgz85QszW51F
         n5HeJ9HynHY0nlPkvPJRORk6azuKSiOjL/eXRBVjgQZ7ft7qrQvMGjyrX+WaQlOiwTDo
         QcLE73yq46wczxwFCcRW+8uce+2x6bjL7MWot0sOL57jeqtkZKiL/hJ8CmEawoFRbeU9
         9AAq2COaoOSH7+/qAPIgpi7Ub9rrLSesbDxWGfJnC/GM8KDUczUPkE85hAJd9GVo9iUn
         tg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405229; x=1793010029;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zL01sBFtwzYNtBLBNOJogTgRcd3XXRxHUdSzNtaNMhk=;
        b=DYmwknYZnbmCK+K7ptfmrz3KHnE2IfFPatPoIwn7J0xyHC233AYq5yOzuRtfyDTcKv
         UFN73fEK3hPZM163dBZ70DUJUQFSkt/YfOuSA8L+Z2TS/vnojz9nNgchP/NcDDADnzl5
         9c7EoxRkOu1IZ1zO3upINf2G/+qzDrv4MA8hf01+1DL7PvIlCn3Ct7dAdTGa/WJiY1sE
         LWelF9S6IFt4xN0i9BgRGRAeRIutfIatmP/ei/w5jOdTgRm8ftKdHUywQpr7RQtoOyfG
         SKKiWWP5MNB3mv9tgvbgeVlJcVdGxNa31XvAnrjC+B9SvBIY2zOl4a0nMnZKqTT+HAFr
         320w==
X-Forwarded-Encrypted: i=1; AKwUvBwI02j6DaWjJJvpN26HIgNYzib10vhkvUriTmGp3iaEqiEeho8dlbJajKDNZC93QhbcpBBbL4Khj6XMRFi9bsA9@lists.infradead.org
X-Gm-Message-State: AFq9FYIJ8rSR2gWJ2OY11KmXt72dn7gz6It4b/U0NK469p74P0WLp0gU
	+yhRVouio+gq7NGB0L+UQrono8g59GEN1lwJE02ol53mkXJpZZ/KWoXB
X-Gm-Gg: AYBFou0GPAzsKXTrxvyBvnIfkkxpNVUbwzWMBeP+/CoTzVw6SxOSTB9KskWC5OzdQ9W
	s3hZSGMKSmiaa/V33RhkMlmS9QE/c8IwPZQWnhN3ngYDG36qBLQSbnGDTKKDhi66jt5leRIr6Cb
	mZ7UMgW8fYdGnJzA7rqV1v7FpPEF+jSBA8mX89Dl7VQBxbJWoY0Q2umx9i+5/9WdbwwI3/wre6t
	NApEiBUFxZZqxwug2XIPvU5/+mHjyCQ6dfxaxmKomtOO8X/zWsSpXG84s8vAf2hbcEXG4Jct5Gc
	Vnt1Pcw663XMEwGTSxArPGkN3f9n0Cu3x2HPwdd1SqAMI5R4joVTLeUmroz8dUybkYOtDrsSkKK
	QNbd44yxmvUcclpFdxPrfP1atnjUkq7UG4kkcPTQQImoMJPe8yYLydcjhuK5WDysnKOOk+VHqCj
	L8GlRKPL63epP3Sj1XJIDVcGYqAGq3+H2JlLU7rOsK4uwt3T8quMqP7kOi7E7MhjMclH3lNIfYG
	1Q=
X-Received: by 2002:a05:701b:280f:b0:17b:fea8:1425 with SMTP id a92af1059eb24-185138b58e0mr9940511c88.30.1792405228916;
        Mon, 19 Oct 2026 03:20:28 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm26324251c88.10.2026.10.19.03.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:20:26 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/3] Add VGA support for Apalis iMX6
Date: Mon, 19 Oct 2026 07:17:13 -0300
Message-Id: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACnu1WoC/x3MQQqAIBBA0avErBswMYWuEi2mmmygLBREiO6et
 HyL/x9IHIUTDM0DkbMkuUKFbhtYdgqeUdZq0ErbTnUGs0a66ZCEchaLHGg+GLMnNL3aeuccGWe
 h9nfkTcr/Hqf3/QBiOi3/awAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405217; l=2441;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Wtjo2nq6SBTIM531bE9hkp4uSTiLMC+4CM/B7PGT41I=;
 b=K/92ccUEyeN+TkExSsHIzTIooOpzahjw6HNCnpCaTctauVPX9ywt82Fnmfxdz7h43b7N6JoQ8
 agNgWXrR1O0Bd2/w7lhY8SXJ79VsHXNsansU0VxIDNA3yLiaBD/A/Tz
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_032030_914343_4BAE3CA5 
X-CRM114-Status: GOOD (  15.85  )
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

This series adds a device tree overlay that enables the VGA output on Apalis
iMX6, which is driven from a parallel RGB interface passing through a
non-programmable video DAC.

The video DAC is a simple resistor network gated by an active-low
data-enable signal. For the bridge to work properly, this series also
changes the following in the dt-bindings and simple-bridge driver:

- dt-bindings: Add the existing data-enable-active property from
  video-interfaces.yaml to the simple-bridge binding. The property is
  read from the bridge's input endpoint. This allows a dumb-vga-dac to
  specify a data-enable signal polarity.

- simple-bridge: Read the data-enable-active property and fill out the
  bridge's input bus flags accordingly. The property is ignored if the
  bridge already has its own timings struct defined, to not interfere
  with its existing settings.

This change depends on another patch, and should be applied after it:

- https://lore.kernel.org/all/20261002-v1-simple-bridge-atomic-check-v1-1-ef5d8332b078@toradex.com/T/#u

  Adds the atomic_check function to the simple-bridge driver, which
  allows the data-enable bus flag to be propagated through the DRM
  pipeline. This is necessary for the VGA to work correctly on the
  Apalis iMX6.

Changes in v2:
  - Introduce the data-enable-active property.
  - Describe the VGA bridge on the Apalis iMX6 as a dumb-vga-dac using
    the data-enable-active property to specify the DE signal polarity,
    instead of using a dedicated compatible.
  - Link to v1: https://lore.kernel.org/all/as-heYw7PKLPm3yH@SMW015318/T/#u

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (3):
      dt-bindings: display: bridge: simple: Add data-enable-active to dumb-vga-dac
      drm/bridge: simple-bridge: Support data-enable-active endpoint property
      ARM: dts: imx6q-apalis: Add VGA overlay

 .../bindings/display/bridge/simple-bridge.yaml     | 28 +++++++-
 arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
 .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 80 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/simple-bridge.c             | 21 +++++-
 4 files changed, 148 insertions(+), 2 deletions(-)
---
base-commit: f33c2a109da4a527ed3103acb649a88e88cf368c
change-id: 20261014-v2-apalis-imx6-enable-vga-450f5777a476

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>


