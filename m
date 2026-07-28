Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D853FC54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=; b=k+naCHzla3ynI/OfEFoSimjW00
	qCUeOFAZhqkOWXJ+plTUE4dUjvtZUFLJe8fdQptNP+NgHlnLAwymTryPG/BjF2nHNXRsYAhn2sLdE
	cTG078yudc4l3WHLP5d1Er9RsKFvnp8UMk5JzhKINUyjNC/qUXBTvJ+BSrGd2Yrb4GnhBpK8Y7grF
	uY8tPb/K2UJ20QTlM/OAt07Grqfk3o0L8PZnOrFtDq8fNWXVkIKs5jJfpI4AwGqut6Yx5Y2KMBXax
	RbXcEggnfj+XSLC5GAfEKUlhElbHq9ph7OQibdTQoECa+YmHXNWgO4iNCXxzWdZD+SK9RnFCuEqTC
	5uglApMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodxm-00000004nMj-1lGR;
	Tue, 28 Jul 2026 09:19:02 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodxP-00000004n6D-4C3K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:18:41 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cacf197759so51363505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 02:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230319; x=1785835119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=;
        b=ROKJjCdnI/Eh1Zb8Idm+k0r37vObiY/JlqzhQO6voekpXyaS/Z7fHpUekjit8/JPbm
         pRDPhfRDj9btAzwH1UHKwpOd8ek6UZNx0pPG54IiJz9MPXO5jj/5d2alQmQfOWM5R580
         dAUWVZyWpuKzx1gwcKn1nmd/ZkwAt4WccRyfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230319; x=1785835119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=;
        b=XMkR6zf3aP7piA+3Qapn6XDcHn10GemsOkZG0lG34tgGaXddjUSgT7CO69tjuV3+ek
         yGxm2hVGmhtvce0vrU95/mjbfuv7JHaUfhJuPJ3SDFeE7+jJ7g/7+LRHENx2xlLIV552
         zhoyW032fMTtmbxp9H+ocyrlUo5aVaUZRvd0BpdEEqJXpSktUnHO1lLuftZiaRUktIvt
         KUijUUzKTnc5eY2xvyMCYUUPWZPehAq3dP2Ika/PNO5zdBIlVjybf5PimrtibzWW+oEr
         pCE+hX/M8wn4IeZF6MxikDS/Hr0Ple+AFrVchey3wQPWtIKI2ZTB8MD5uAk4ZDNxlnqN
         mm9A==
X-Forwarded-Encrypted: i=1; AHgh+RodDH03nGlozHsq59daQIUjC/n3XwMfHswgIKf4HBk3UtpTjqelEH0EpBG/dYRCycNn68SeLSX0u8Iclupm/ubV@lists.infradead.org
X-Gm-Message-State: AOJu0YztryGpumnkL1DmHYExRce9lpYfjH5OM0Mm9oPFchjFXsuPuPzs
	EPcAT5XYv0XNWmRmov+gUkiATXjnNqKvwzgpGLp49zZwG9wKDS2x5/au/n6bc2Ox9Q==
X-Gm-Gg: AR+sD10hgHYX95BONSxvrkfEyu4jjWlxQ0VqxNCB24GR6fvvAtJhFOW98FArU2V5efi
	ajI6ZWaqeGIDNT2DxYdlsUc68mhWa90LkTw8tN58u/7HE89MyekRlAs9+oDizxSv+NlX01qQ61P
	bsGuxcqiIvqNVACwCzTSTAGA4EynbccXleQUzB0/SxePjDC9uZf04P53nzZpjkhEjKD+bwo0Q3U
	G7KvPSBpptggw3U7+lYp4xjq5LASX8M1RMcagwFnCVKuYkDOrmiQw9j2mZKF6CYf9Sf9YYzPk42
	ndqZGa6BlJK16v1eJ5TQ1fOgiCN1YNkPD0WyOideUobTWPqUaWoW9PsjSXmcrajYpJxVUe6Xgmf
	UAetV8NVTrtdGw6IE9P8diOyb/zmXxjdzuWBfe/Aezzcv6vE/ByxhhsnCg3AAj0o50FNxuR+5av
	rTqPURWQ1g6J4STvWrerH95qcvLsDr/Jnwrr3gQXn2v2EqeA7MBYZfPmoK7XtW0MFkREMpOg==
X-Received: by 2002:a17:903:19f0:b0:2c9:fc14:588f with SMTP id d9443c01a7336-2d015f024b4mr18169045ad.29.1785230319419;
        Tue, 28 Jul 2026 02:18:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH v4 5/5] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Tue, 28 Jul 2026 17:18:03 +0800
Message-ID: <20260728091804.382753-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
References: <20260728091804.382753-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_021840_048768_D7163D92 
X-CRM114-Status: GOOD (  14.89  )
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
of the Series6XT, another variation of the Rogue family of GPUs.

On top of the GPU is a glue layer that handles some clock and power
signals.

Add device nodes for both. While there is supposed to be two different
power domains to the GPU, MediaTek does not have any information on how
this is integrated internally. Assign the same GPU power domain to both.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 556e806b7787..169ba4fd183e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1002,6 +1002,37 @@ u2port1: usb-phy@11291000 {
 			};
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "mediatek,mt8173-gpu", "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0x13000000 0 0x10000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&mfgtop CLK_MFG_G3D>,
+				 <&mfgtop CLK_MFG_MEM>,
+				 <&mfgtop CLK_MFG_AXI>;
+			clock-names = "core", "mem", "sys";
+			/*
+			 * Binding and GPU core HW have two power domain
+			 * inputs, but MediaTek does not have information
+			 * on how this is done internally.
+			 */
+			power-domains = <&mfgtop>, <&mfgtop>;
+			power-domain-names = "a", "b";
+		};
+
+		mfgtop: clock-controller@13fff000 {
+			compatible = "mediatek,mt8173-mfgtop";
+			reg = <0 0x13fff000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MFG_SEL>,
+				 <&clk26m>;
+			clock-names = "sys", "mem", "core", "clk26m";
+			power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+			#clock-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.55.0.229.g6434b31f56-goog


