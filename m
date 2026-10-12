Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C63CA9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 07:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d1QWTDb/oOVddYpnAN188VwUYCPxgfGwS1G3xLd3LyU=; b=vGa5tz9kQUOoDZ
	/lFeGIwP9UNUEFt9dgx8JlI7j1djTqv4FYXuWu+eVcidvFG9shEe4iBuqlncOmoKWievKBqX6YxXb
	ZcIddaGxOl/a8bmqivlQb6/rjjVAMB6Bj4WfDjyKwo1fNo23jDDf0+cF0mdDrhQGOPuvQWKdqWtUQ
	RZVDn85upftAKgWZAkJfU7ksMK1BcgIUTw1TE0oWg/oHlaMzLWIEdN0nEXoWuwm5Ceg3EnbZkGNcm
	AWmSktZoLV64kD3UHXtlO3/FUXI7AnBGFX82XeLcx6qHX/Swl9zKc2A9VXZdTVVvyBxVGExzxPbV8
	iYzyZ6r/xQV4cIKGcqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAPt-00000009pn4-2Qd2;
	Mon, 12 Oct 2026 07:25:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAPo-00000009pkw-1HOc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 07:25:45 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so9669205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 00:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789942; x=1792394742; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d1QWTDb/oOVddYpnAN188VwUYCPxgfGwS1G3xLd3LyU=;
        b=AM3A/dvQ8gaNaK0b3EYEVXL6CPhimCQPY9Eds8+eE0vMN6iYD6AdxwGv1PpcvKv07c
         Lgrnrnv+d0xhLS5bc5zo+7jdP6Krm57i2DjB5P+PM2XrvLw0LZ+1xkTZ/O0u4NLN1p32
         Lu/rXzalZxNnUq87uEiDeKFQdE479/dulBeyYxCPWMFKOAsxLpLBnupGLhmFfN2hMzeO
         UQkY8Z9mPhGNjuArVlePeg0GTm7ZXbaUmIP/21r0nWm3GXLsK8yyRd8/A7OiHFN8ye7K
         3Mvnvs7QPOoMEiL4mpDKeptHQAQ3cz0IgfY/iwEM9HArQDGSAgTan0w+WxPBbs9ER//t
         gXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789942; x=1792394742;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d1QWTDb/oOVddYpnAN188VwUYCPxgfGwS1G3xLd3LyU=;
        b=NLY3Q9sTslPjtjnsnYOUwZ1eNy8LfNuULmozvNY9Fo0tRb/8plqxPlWnXg7ZodZmRL
         /XEfYVMu8rJdgE8sJ8gHObSLT16jvMHLELCmW9liQJZYNJu1nm0ozS3pq50/PEXXfLbf
         Ax/bt8XmCYSn3SsuazcV0GzdVlaU5/ATWS/10ET3chSkMefI0SrTZlBLG/gzCI95IrsN
         Ya4RyAoBsrIDF1VnOeqWxSbj4LHQF7GblpUnNuFq7aN3zkYlQKiFf93a33jaKukZ+E3k
         zZsqc3EPi0k4pJuvduDiETcA2+d8bJAHjIdDNP5sD8t55XS+UJrYs9/FQq9DkLkCyExk
         lTog==
X-Forwarded-Encrypted: i=1; AKwUvBznwR5y7tOPIMSyaLM+0ir18MECEeFm6Z/8LmPiNCrCAOBGSk7WzQuflrBX+yNG3UfD91EK4J0n7AOm1aI23Tms@lists.infradead.org
X-Gm-Message-State: AFq9FYKFaG3Xr4+JBQi0nFU6cOm1ycp6yr1wrOjDKAKwLyKsTuWhczm9
	GYaTYxJIbfNa0GVQQrIfJRJ+RybfiJNwFfwWmlDoR9kBassmEsfrQuf6
X-Gm-Gg: AYBFou1lOXgjusugLS/6ElLzK6IgAFzvv7+kHyNNSW38AXEuoNcCH4RLS5VbZJKuA5T
	E78z/Ablhn9VGsb0kOsUfEA36ZtH1mncv6N0APXxe7D3A12lMdq4WWEXhyblK4gXIxDBl5NByG6
	paePnTcqMHAsxyP78FdFHH5Nw6U9nRWv0atfUmfmS6y6IIrYmnYvEXxm5TQXxn0GIe5aDv3oukc
	WNxlK2oTqybfbAsSp5SpqDHNuKy4hyL2pvjzXlxmFxnves8aPKVFxDmS+6tVjjGc5hh0tt7mVm0
	Z1NnsbnCcKlW92jyT4r/MIwrRI6YM4bwTg7MGAaWma//A39PgFKKUqvGQbYiHytE978UUy3Yma7
	CltWMc9wKTyBm3prhG2sFIortNyR8VNETsOPxCRNTZM9j9sB3MzmPNvkVM+PzZHYmtGYxY6IQoV
	nS94B3tSHxb/loxGnP1jMdqDxjF5AcPOU+oMp8QJAu3D94oPNHdeDNK78/WZTWVSqVBzj1AmWYo
	dL7+MIg7RgrMc9t1ByYmKsX/dopts9h7THmkRKb9hATWhF9c38qPoPVWJLnb9ID
X-Received: by 2002:a05:600c:19ca:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4a18e4ac650mr158677175e9.14.1791789941611;
        Mon, 12 Oct 2026 00:25:41 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm17523377f8f.29.2026.10.12.00.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:25:41 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH 0/3] Add VGA support for Apalis iMX6
Date: Mon, 12 Oct 2026 04:25:22 -0300
Message-Id: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGKLzGoC/x3MTQqAIBBA4avErBtII/u5SrQYa6oBs1CQILp70
 vJbvPdA5CAcYSgeCJwkyukzVFnAvJPfGGXJBl1pU/W6w6SQLnISUY7bIHuyjjFthM3cWjK2brq
 VIfdX4FXu/z1O7/sBKq18SGsAAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791789940; l=1908;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=oIehZcPpAbqiwfIqG1W31kjdUe0imO5csyH1FVDoC4g=;
 b=6Na6Gpe9E1PvitnwV+dpCDK0x8whlxg3tt6LUG+45ePWH6KHyR7uTPCZpXJvoHbTKeZQq5b6z
 YhrD1XfpN2gDC54bNXQKOrMjPmqjFju0acH+K48bnab3b0Eu3MBtE5u
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_002544_372119_D1244B16 
X-CRM114-Status: GOOD (  15.13  )
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

- dt-bindings: Add a new compatible for the bridge in the simple-bridge
  binding. This is necessary because the existing dumb-vga-dac compatible
  doesn't describe a data-enable signal polarity.

- simple-bridge: Add the VGA bridge match-table entry and timings
  struct, setting the DRM_BUS_FLAG_DE_LOW flag for the bridge.

This change depends on another patch, and should be applied after it:

- https://lore.kernel.org/all/20261002-v1-simple-bridge-atomic-check-v1-1-ef5d8332b078@toradex.com/T/#u

  Adds the atomic_check function to the simple-bridge driver, which
  allows the data-enable bus flag to be propagated through the DRM
  pipeline. This is necessary for the VGA to work correctly on the
  Apalis iMX6.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (3):
      dt-bindings: display: bridge: simple: Add the Toradex Apalis iMX6 VGA DAC bridge
      drm/bridge: simple-bridge: Add Toradex RGB to VGA DAC bridge
      ARM: dts: imx6q-apalis: Add VGA overlay

 .../bindings/display/bridge/simple-bridge.yaml     |  1 +
 arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
 .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 79 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/simple-bridge.c             | 10 +++
 4 files changed, 111 insertions(+)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260928-v1-apalis-imx6-enable-vga-5c7ba6b358fe

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>


