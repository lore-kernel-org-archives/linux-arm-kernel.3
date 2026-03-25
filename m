Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5F8FEA82F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 07:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylCJHL4jz4SMJERGBRhfgz5hmf9BV/IyctYJz76/DdA=; b=GmG2S96W6WesPQJxZtJftBdhDc
	dAXMD7okyBAVvyMHCD3fLFpfgHuuZKLikdXhWGPNWRpvMyo5ctOI7jkBL2+vghTcGVhT6Xx2lL8eq
	eHY/+oELp6/Gs0M2SloXXV6QWbzvnIbvwmQ2c0OEsxrbOMiJ88RnteITS3UYYyCrAUrRJUSPoxptm
	+w4oQLFMKFbP9duBF8iK1LLssymMErNdNMuQdBZURvhnny8NhkVaQ8kNgvj68IChvU5oTSFe5K63g
	fwI6/GRlVTL+LVWaml57pySPLjbXvlDiy9Y4qEKu7i5CN1sCX7rg9v+LCZ1RDFBgaFv/1Ce/JdXwt
	NZzJMtKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8f-00000002tIW-2euc;
	Wed, 25 Mar 2026 07:58:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8U-00000002t8s-3K4Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 07:58:46 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b04fc8851cso21774395ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 00:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425522; x=1775030322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylCJHL4jz4SMJERGBRhfgz5hmf9BV/IyctYJz76/DdA=;
        b=U8x1pCYBaCkerCmVJq0dWxj8eCPnnU4TbHDOzbtb2RVPjSdeFeFGX3v47bDuf2TEot
         G2MzXsX2wW5yztdylZ/O2w6ok+Sb601otlvipBjxJUuQWhUDpfQG7pKoh80f2BsgGjHi
         wlJRJOwKpyQeHSNlbCe6eXA90lqoIocMUwH8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425522; x=1775030322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ylCJHL4jz4SMJERGBRhfgz5hmf9BV/IyctYJz76/DdA=;
        b=Bp0+abTL27bLdxoO1aVlPdFiSGeu4WoaroOvG/H4oJwBeuKaA8cMIw2l8/aUzzihy5
         Y1O7xaxOq52euXubUlnr7cnVym09ny8RWVbErN0NYNi52pjv+Gyr9V1UNKvgBAV6Aajy
         PsM1ibaOTEbB1hogfU26lXNUy1uJ6dy66fTeYyOUC/3mMSZfjNlFVTd1aNySLPFAnBvb
         z3OLKy+t+Do0pSsBYAKu7epGrhoWqQ/Tq2FoWCuGyR4aXlKwAMXEvn/clPju4qg8Qj2O
         Ko+AWK5hZ6Gp1IR52Z9cN9aIi0qSuKdSmHRO0vF0dgYS9ZToud9tGmu0O0EQw/P4/xmQ
         Ew3A==
X-Forwarded-Encrypted: i=1; AJvYcCV8Mes56/zbF4rd/5G5rDL9Q7gWggaPY13joIdqDqErSdyq5qksqDpqca7i9Lh4y/xaH+QHR6BZl1HIS9Io+qV5@lists.infradead.org
X-Gm-Message-State: AOJu0YzHKIqThvfOUREc6EIpU5/GGY/2AYyOJuwRZxQdevAtuekqD7jX
	imeWHjkdNRe3+CvFzjIzz4dhTO5ZzgHs8eO9Yy0m8UEyqSmOS//9ddlREyxI8WDGnw==
X-Gm-Gg: ATEYQzwXD1EAsz1bb9NWlGOY7j7x2+BObAZOpzjMbN4jANDbntK5DGYx73B7k0GFIGf
	xwPfHmxTh3BG4GtOndFnN+7lTW5eNA+mEZPXzsZbzZ5E7redEDUmFborF6Hp0gHEVHG9Q1D8ykE
	jfCHHlq7ixj8Dg6yPep6J+SLOQIXdE9yolTN2HaOwb9EVnqkYOP+9iG0Dr0LPqh5D42oxNky/SP
	4l0EdqZ0Em6Mv9S7n90ewXKHsy7sJsQ/NsqH6fOMCDHEN6Elvs1j0nKDZFYqJsvM+iAf6lTYGAR
	4uW6IJd+eGqEMLkiCJzjNinhtajqJ2oJl5y94b+5RsRQsbu9AFg1Rcm39/TBGRtQqS5PsLngFub
	AkufSq7ILukbQG36ekdhzt2Wuy4rCEiG2+w9UOggIHb5fQTNFeTrbPMqbk1f8CkvLSw0Y+fNxiT
	vSR2qP1kfJFvdyzFeAqThg/+XquNgWuSW8pswO16rJITx23pGE4eZ5JjBpjsl7jPZ+Kv5Gax5Rq
	fsijZg=
X-Received: by 2002:a17:903:3843:b0:2b0:9a61:916 with SMTP id d9443c01a7336-2b0b0a7f831mr28028415ad.31.1774425521733;
        Wed, 25 Mar 2026 00:58:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:41 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <icenowy@aosc.io>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Wed, 25 Mar 2026 15:19:49 +0800
Message-ID: <20260325071951.544031-6-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260325071951.544031-1-wenst@chromium.org>
References: <20260325071951.544031-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_005842_842696_1F0961AD 
X-CRM114-Status: GOOD (  14.83  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.53.0.1018.g2bb0e51243-goog


