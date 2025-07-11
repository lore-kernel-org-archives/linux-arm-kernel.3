Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF75C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 04:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//d0bJWkNr8qRs213bW7gb4xunennUE1PJsDFQia6Eo=; b=0yPYYnDaiPPzGuwCjHJBn7foz4
	DxTcD1PZOHWla29mk4RumJRqmoPA5xIYg81hP+UsVzhTHC4H5kfqZXOVPUooq/kz2Oe6M9dFhYxj2
	D4LhGV3VLPnoKuU8vfN13hhgQgUhtI6x/QKpvUts6qGtiz4nkNaK+z2kTTXInGu4rBm/x4txjkqnL
	cUtalers0WmxK5WK6VunQp4hUr532MYH5k5QlvUfooYlKJB3KpGkxoisGK5KOmC+HBqdrNIk8w3t+
	+7qUYmqiV9iyu6Jr76T07SLVJ0idtSzm8u53hEkaWgkiVmzRlfsrKjIwKsM35RjT+HWxbr+jvvXGo
	SAHIlOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua510-0000000Dd5H-07L7;
	Fri, 11 Jul 2025 04:05:38 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua4uU-0000000DcQ9-3W7u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 03:58:55 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5550dca1241so1578412e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 20:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752206333; x=1752811133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//d0bJWkNr8qRs213bW7gb4xunennUE1PJsDFQia6Eo=;
        b=fJLakxCIVzqGq0hROMq8/cfxug+g3IjxOnIaCC43x+dQkyM7xUTfFkLEnJYXrgBC19
         h/467+h7frmGIRwl3qvVUeWeaIjBCcxSU3kFs1gPDk1zkqac+oy934p8Lvp8nN397k14
         7QFtW2BQRbCV5G/pGvox/KTIlfYdDn3cgm11jnbMGNaDLVL18FVGrZ1aUAvs+KkEWz0z
         nBSAVtSdFJcv0VIZfRG6AbrkYu3TbfDy34OqbFAf4QlXyiVTkE2eqyfENOTd9IgI5tpY
         YkieY+RVFaQaYFj3huMXDnTiHY2U41mNAeZ/nSqGprfBX3l072diIJGrsrQTWRYCaPuW
         68cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752206333; x=1752811133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//d0bJWkNr8qRs213bW7gb4xunennUE1PJsDFQia6Eo=;
        b=ZYrBuqNdsWzfQSAJVe45wapH74oVXwdoX4a+6oafjwHWDEBA3ccglouByCZoDdFWwe
         7cANtJj/REqAI5TlBb9Y9NmFaRCgdFsEs6W6VZTvQtq8CHeL8WoV++X1SNY9hQQ/0Ix7
         GcfoG30cyo9rClaA7G0FdWWxrdqBaHUXBMuBmukShN7C1qB4AiMaGNibQkzAl36lSZ60
         ph52pq/ikNU8jkPwsbfXZ7N/6a/7oGtRWGB08pyYsP2E11jnAp+s3A98avipUrdEl9lj
         hMDQ3DrmO0AWKn6Zp0SFEeqAL0M9if2TyCC7lukjSY1DLhZkK5E/AvCBfIrY/k+YbblX
         FzPA==
X-Forwarded-Encrypted: i=1; AJvYcCXIXn6hRQFZ2mQqb42s6+fac+m6NI6a9MnaG8msdD8w60qIJvIXJW5ZERF/+EVgLMvwVv4a6fqqc1q+Mg+mwQH8@lists.infradead.org
X-Gm-Message-State: AOJu0YyyN7sh5yC2C4ZHa3uSQJgGFGq+OBigtqh/50z2mOBFsTnQKNbG
	ldQk1b/+XK4p+xvVLpzOqgzw8fHvjYMr+QcKkxMyyO/cYzkTSvL9Ho1P
X-Gm-Gg: ASbGncvt2I4+RqY85wE/jhlzrQx+ekTocjvYhvzPiq/0XL9fCscxKayT2ttQ8EQi452
	6OyT9E359N/KfzgQtvLk6jebfW2VKaDUAJTwgsPXNF0r2qNamZUSJiB4eGtkILRzz/78sI5c/Ts
	jLPqG9BU2iYgMVDg1W6PG6WELC0xdVZbRygZnwfnD5Kzp68H51a39/VsNlwjgoIHrpEwzJ0aWDK
	seIiPIYd2ZuZTxXqaVVVmttPtcEHRNOQt+4eYNMzGDKuDz+XsiGSrKfwcoo9HTdOevPqqi+4NiP
	EgUKL2svttCBikbkdn+johwy9osq70Z7IcL/5FIzxB2a8Ax8ZfFtL6Grw1lx4FtNfdvC7jk45G+
	Wk7E7OZqwptE=
X-Google-Smtp-Source: AGHT+IGkeSBXm/EW3UWMspIGCG+IQIIuepjGaDlwWyIf9NR5Xr+PDLCyR3s4y1gsKiBc5fqAWrIf5A==
X-Received: by 2002:a2e:be0e:0:b0:32a:8297:54e3 with SMTP id 38308e7fff4ca-33053293f75mr4620471fa.6.1752206332869;
        Thu, 10 Jul 2025 20:58:52 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa2943d46sm4971191fa.40.2025.07.10.20.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 20:58:52 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.or>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/3] arm64: dts: allwinner: a523: add Mali GPU node
Date: Fri, 11 Jul 2025 11:57:28 +0800
Message-ID: <20250711035730.17507-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711035730.17507-1-iuncuim@gmail.com>
References: <20250711035730.17507-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_205854_886293_5B3EC97D 
X-CRM114-Status: GOOD (  12.02  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The Allwinner A523 SoC features the Mali-G57 MC1 GPU, which belongs
to the Mali Valhall (v9) family. There is a power domain specifically
for this GPU that needs to be enabled to utilize it.

To enable in a specific device, we need to enable the gpu node and specify
the “mali-supply” regulator additionally in the device tree.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index dd6fa22f9..d3528d498 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -108,6 +108,21 @@ soc {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		gpu: gpu@1800000 {
+			compatible = "allwinner,sun55i-a523-mali",
+				     "arm,mali-valhall-jm";
+			reg = <0x1800000 0x10000>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
+			clock-names = "core", "bus";
+			power-domains = <&pck600 PD_GPU>;
+			resets = <&ccu RST_BUS_GPU>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-- 
2.50.0


