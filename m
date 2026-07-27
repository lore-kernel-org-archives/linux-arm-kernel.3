Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CF1C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=; b=ALORqtaJQnEofUV2dxJYWchxul
	NHzlMvZYPS959jpelK2NPc+/A2cXZD3V3gFQtwCFsGbE3ocgWqH3UZ3OzexfZ3i0s3zcXPA8x943r
	5o9ja9RVYLUo/XzepCsqEylT7GXz/4MdJQBHWnwHKNgkd9jVidrrVXRBzKAZR16uTM8ZUTt80X3/o
	fFH3ty2JaaAIC8EBQtkcYi9s+fi1XgGKaxZNpimeEJnrSMhbVMflvwEza5IRlMFiLhrArrAFkDSVa
	bmC9mkT1L+qV+3v0jqBYG77Hn4V/c8yYrlXQYlDpky8FC2m8iHgBelGFMhLOhXwwVPBtPFFqGKCKL
	AgeuyrLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHSL-00000002JDQ-1YW5;
	Mon, 27 Jul 2026 09:17:05 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHS5-00000002J3S-3W8j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:16:51 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so2395992a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143809; x=1785748609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=;
        b=iXCSafgDjf+qTqBuE9c4tan/wMpVhe96Kqb/MRIneIvNuFrxlkHWwGZST060+SIf05
         Ov6iq/BSKyUPM+h1HMpSbRCB3WBIg8gM7od8WbJPnJL3efGg3Ea2F7NVHx2mYZiLh32Z
         HR1eyjwhpd+031kLLiuNcGP3kkxKckUf4U4R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143809; x=1785748609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=;
        b=fEA1/uDQ6aXKwtlMvtMp4yOGPLi02JwZsiHUEgojMca7xCMrtEF2yAo7omuRrcMsOG
         RlOfNTlgn/cB5h1vJj43j1hsERaAJXhasZBh+4nWBdiOs71D8iNvrVliJbsiltuU373V
         T2AhC7uLjTQNGEJIceVAizc7DMhXsfog2k1E5evmcJDJGn81X/+5aIK29UBmE2tpYTgV
         vdlq75wjOMC9MYpnp7AzgY6+ap+5n3qLkeBsWpx9eC9D1fRPEsQk35mcOycBfeEBRUkU
         /wHYFeBD7DwQ/uXA3OOSEZaiE3lxgyjH0k4SK9nWY78aaKPcc9nwdz7p6dli7TB2ZYlM
         a7+A==
X-Forwarded-Encrypted: i=1; AHgh+RrNPj1vK7j3gBsaxYrYhkwHlFwq9S6t0aaHfeGBriCwLVJcDsW2KA9ai70sg912PivjDkyf7dyKvhB+AygH2/4l@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo25AyLGP+f6lwy49ThXeJ4uVIW4ERQeHMRfuuAoQA6j71NyNt
	Ve9EuEyQMGEaydx2CRt9ySpgLk3e6skFttbK/qbCrxU1wSd9e3aa2yAq8PNuW5MQug==
X-Gm-Gg: AR+sD13VJHtfyCiVKN6PDwTYd4pQiMZz+VnAufy3NW/Tm3+vtRwUxUbKUNYdKOG9+YT
	jId6KYGfNq3tREVgDJspK1GlMZRxkXQUDQbV/DfGqZYGD7mJtr8F1kj7hRV2I18SSnAmfUAdqkG
	u2xTaE8fkolFoZVMcqF2O523uu0IyMnJaEpcagYr8RgKiyRrdDVUiVeTQScobK6XCbAhMjZ1UX/
	j6m1BoFoxwpkSQIuZHPZGiRYNHbcleS68ZxTKbDAatw9kaeXMH6JmjDP52VWMWtlyURk2DyJKpw
	wRgW+2GL4hE4pPcAxyEuLPfPP+4sV2L8vgEpTLIoT6YUQw4xOmp4toOyybtTT20DavgGAnREqf3
	+V5P7oodgcrT2cy0IBqBhX8ZABJXJZ4HMaNaU8hbhWj8mBKb7eB718dPTNoehNDvL/CuTuecCp9
	Y3368Te3kW/dNHjUwkUfJ/NFEkbg7wCU7XOSG34M4wlfdErF75xntoATAR1rA03jwbjxXd
X-Received: by 2002:a05:6a21:6f8b:b0:3c3:7cfe:b32a with SMTP id adf61e73a8af0-3c67dd65e16mr7098317637.27.1785143808982;
        Mon, 27 Jul 2026 02:16:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:48 -0700 (PDT)
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
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v3 5/5] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Mon, 27 Jul 2026 17:15:54 +0800
Message-ID: <20260727091555.1023910-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260727091555.1023910-1-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_021649_883521_3B5E035E 
X-CRM114-Status: GOOD (  14.34  )
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


