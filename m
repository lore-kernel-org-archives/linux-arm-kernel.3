Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC683CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=; b=R4LurKaz2fE1ZBk+hnIl949Kie
	kufo3tQ/eYQS3wQxHyyyXE6LgGbzC8Yx1GpHzaGREwQA2hPAwj1OtBgEHUiMjCPlUD4kfkS0VF0Vd
	uKw+/SjUQlI644ocCtNI4zyW7RKtUI/swo+QGGzSClhYY0r93AIfgJgnJ1t6AaxiieqOuRlmkPAiQ
	RHB1O0/hxZbIhCEDKLdaaFRmv2/JzmP9uRmR0lZqzmPeB3pCVzxvBUOGO+jaMxp/I1utvv0H0YT8h
	vc5PbD0cXLqenMh1gwPYGeWGzwv5b2jKWq6czoB2iFXjhyQwmlcv19vzCeNr39828GAbaY+9CpZYB
	0mdPweZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPoK-0000000Awa4-0f2j;
	Fri, 22 May 2026 13:21:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPo3-0000000AwOi-2Zzk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 May 2026 13:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=; b=JwTVgIS2YXl9eoY4Z+pYeol+XF
	EYzLTBZ8K4vqmrvyUgSzjtt2H44FPlnzikAxaCpCFpHPy7GMjCYqA4yGEWWATpZC/lxDSDBnzzHgG
	aOrwYB0l12BWgJ7/Fjk0E/S3pXRmTKRnigEHN/+A8kXgMRzyLUlEDhMLlY8XsluX5mriTAdZk4BiN
	vGRhkA41leScGVceLsGNpOEqj0zrjec3+L9N8gIJkyl0vhMw545pN897RGd1XMYo48k2pvGSI9Vst
	VCC88BFsYkKC95pMXQ5yKz8MD22MouCFO4fpLkQ3bWc/V2TARlxtXfWnGTMJGGtH43cR9TaKT83On
	BURRX4Dg==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPo0-00000004QHo-0uxh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:20:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49039a8851fso19150265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456047; x=1780060847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=;
        b=MGeG2BPu6kDv3kfn7XWP+Y4MwBu96Ar5giqlBF8LqGKJphfU/eTIBE3NVLEplGqf9j
         ZzIuhP4x57DxjHYoYF3KObYkpPPcPqbbad1vSCNGlFmVV/azxnkQ68aoE2MNBpko2LKM
         NCrIOeGSZxQIiM1V3JyE16gn9skBfIE3BAuSZdcSpqv0PpmTPjBdhyT1rTuCeu3XHP67
         itSBkuJpWUGaa4RrElaUa+ZAQWZYR4nzq+utAYEmZkMKwtixFn1yKfl+7IiLa77Vi9U0
         noTe2zNfWs909qGxJsIdiEvNmCnxvEgyqG93u/NCFxbQAydWZmwUE6xDNDfZgklBxG3M
         S4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456047; x=1780060847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sEzEUIi3oWaa4bkqOIR8hzCtlujzV1XyxBwf8XTkUg4=;
        b=Y/OS6tCYgY6eCBDg9PDNa5xw3DTHbQxuYa44QRJGCiEiNDQaL0F7HX6jzIxzoTiz92
         1bdAbcocum3A2k7LaWhN0eFE7ePa1LnWf+9WTQa16soQvnsScjuzOTXsqrJXKGQE0jIB
         KiLZB5CW5QUGQFCcopaNS54o0Qxt4iRRrppZSxAJZp2/zCzbCwPxHA6G9jHkgc458nW+
         MXH2jDh1cqAGjbNrOuVXvKkudFsYx/Vc61NY85ScAItEKmpl56rITMkaZEKKCJZV97bY
         p4v2b9w+RpXwCKJrtGGFOWji7YxEEbHTBN0d0CtQoyXj7VeWker58yUF4loQG8r+wkSg
         GhcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WEKlzXkf9on6T9dmmLlMqaTGT1QUARQGk1aMOsYk4eSHvy7kjBfQhObD8NiNW/enHt5PBoPJBw3hgJTGcIy2o@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6c9VBV1O9//Uf3u+JqQwwmq/Nn3Aih+kv2rkgBnV2CJJMloa3
	xAdP5yGn0nHOTSCx7SOAjLBLZHiyXTuLlrZLWgBE6vPp+ugw3R9NejAq
X-Gm-Gg: Acq92OGBS0Q8wHIcx1NamtUdWW7rZdZgl3SBhabFx9VfdtbYZOTw2mnHUEgEngdCjrt
	sVOGxq5kLU+ZmxMpneiBq4sQkg/PyEPpi/NNXOdyvlGhJNWOT+r8V1AZDCJci2mbAPivB1H9Pfo
	rHaGRHY3PUVHboS5JYgagmCEuF5e2BUW8InJfphGdW8QQ5HhOb8NwnYKazjqhi+fky17aLuqPVu
	iR8Ztvi+XXIZrQ4WJYmr+Ig1e3KdKRJR0EE22oKqrBCtBc65NOrOAYJT1Vbwks+6nGXKegc4dt3
	d5Z682x7jaQihzDovHtx6V5uhiuR0G3zlbEFmQdK+Dvp74XcGwg5xjNMAXLWQdAYJzKgxCAc7ca
	tp2vmISIwudaE1SMW26ikSKv3kRB6eUWg5EkOW9q00nOPbby72WXYUYKO4yHlSGX9Wy8pAozJs3
	WHyvrELQ/QXYC4lywqBjw0j3g4/x8AxrxIBdGVoXouyQ==
X-Received: by 2002:a05:600c:470e:b0:489:1cd2:610a with SMTP id 5b1f17b1804b1-490426aa413mr49128005e9.9.1779456046963;
        Fri, 22 May 2026 06:20:46 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:46 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 07/11] arm64: dts: ti: k3-am62-verdin: Add NAU8822 Bridge Tied Load
Date: Fri, 22 May 2026 14:20:20 +0100
Message-ID: <20260522132014.226721-20-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132014.226721-13-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_142049_006697_498EF816 
X-CRM114-Status: GOOD (  14.23  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay enabling Bridge Tied Load (BTL) mode on the
Nuvoton NAU8822 audio codec present on the Verdin Development Board.
In BTL mode, the two loudspeaker outputs are bridged to deliver higher
output power on the X28 speaker connector.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile                    |  4 ++++
 .../dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso    | 14 ++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 14898f8ab0e2..a1083c0b2502 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
@@ -224,6 +225,8 @@ k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dev-nau8822-btl.dtbo
 k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
@@ -332,6 +335,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e4b662519a6b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board,
+ * combining the two loudspeaker outputs for higher output power.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&nau8822_1a {
+	nuvoton,spk-btl;
+};
-- 
2.54.0


