Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9596DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 05:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9sHUcSk8M94bRNs3iZu7+gRAJsjDAn//p+qux811FOg=; b=k422LoMcw5d6VrTA9Y3/WK6THM
	HP+LLOXDTcWam8LOPHzVdQeVns05eBp0dq4bsaVOMMCeIeTLWZCAAms2hSknQprV3XgvbikcrVPN+
	PmCuDzHiHpplpziVwa/2vpI2LyX9301hVeoV4szvLha4e7d0uG1s7WeDCEzBQ8daaaw0umnXVX2bL
	pg34g9A89uugs8FwMU8K3forLcmiHMQIbhBShnB/1lIRgAy4J3nR9DriAWUAkONzHyH3IgpYOd7xc
	jzuIRaOPq7J1x+pcFS07r73E1se3wfEOKPvl/l2n9omLY4DyLZGjHkg+lsvR36JAe4BLWzkRULq5K
	FwgxvGKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyFt-00000002m3j-3Z7C;
	Fri, 13 Dec 2024 05:30:25 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyDS-00000002lao-2ioQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 05:27:56 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-728e81257bfso1131120b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 21:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734067674; x=1734672474; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sHUcSk8M94bRNs3iZu7+gRAJsjDAn//p+qux811FOg=;
        b=jqL6BiOZshwZ4Lkrs1oGomJheWOgGPENQJKFm4QgORcQk7gbuaM12H75LuYm/8hds8
         W4tUDfOrhsA3aWJ20CPV2vyTccpX7jO0vBcQAfVBe3vEmVuJuiHZItV/kXGsIE8e+jFw
         x/Z3WMSz2nYeR+E9vxHOC66hbkaLetvC/RloU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734067674; x=1734672474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sHUcSk8M94bRNs3iZu7+gRAJsjDAn//p+qux811FOg=;
        b=PlCb9xVqfuZfAfkMU/Cq8CZJkiAhbKBnJcgc15WKE39pXvqDeRFLfXD+T9JGi2Awxu
         wnQH70vXMvfjQwxi56RhrOYbN0bHdSf4i2LYCov3i+Kd4evSgWLwXP4SS7rFDV1IfDxE
         3h+Ahr1Yi/g7gS3iYqNCmut4glAe8rxtOfIxGCSgbTNum5ot4xbF4g0aUShd9mWnepan
         waHyGT7T7U+NgXNw3zGlFMWZFEOx4o9ZF0xPVMEulx/gaxTyWiOi8ZDDaRjcEK2nPVsp
         3vfFrXusY8dTKDyo1bujG4Aur5H6wucxYkHMVPUsLpelaDAlcHUup5aCe/O2aU0U2QX6
         LZMA==
X-Forwarded-Encrypted: i=1; AJvYcCUyOcwLFT0gUhAa75RZm1CyxBmuTgha47mJh5lorYnx9/NMBiRjVjODhmIiN32goGFj5u8PKCnYihVQCwFDNjBy@lists.infradead.org
X-Gm-Message-State: AOJu0YzCBxblLtO2T03izbQCmzMdaN33hoAKzEI64CjWaHAswJR6u8GS
	XhAVK4vFsHkMWyQF02FSuuCA4jDYzkEz27dsemhnJdRlFadq78eRZTFKKoq0xg==
X-Gm-Gg: ASbGncurj0U3/37AhE2QlMhxLy5OM+T9mSA62CV139QcayjEu7R/eT7GEwDj+RSwPmB
	L+wgfpv/PEGQHo9h8Jkk1z9aJU78swnErcWULbXiqEuAGfT7D0ijN6iJ3CDkUEjWBK52UH/OPwo
	pNqIaGhEqgv+5BizI0g/MGaV2F0RNiaReL4AQGgqaMuJqB0IERWtOjcxkn3DOsbKXyZyjQAIbkr
	OZovoNo9WxYwtR9i7v40BhreNz0ArHTQbgHpuDtxzX3ML2GCShpZt7u9MC3CkcFz2f+QPZSUdZB
	MnQKqjovxsP7ckBIXHboUspQQ80xvaSBsF3/s+FL8/m0M5I=
X-Google-Smtp-Source: AGHT+IEewRI1exts+mBt5zPXwiV4DU9C7+OYlL08s3JN7DhOdqeiqTJY3msJOJkX4Vs4aQwdU++g3g==
X-Received: by 2002:a05:6a21:7803:b0:1e1:b35b:5132 with SMTP id adf61e73a8af0-1e1dfd6023bmr2007610637.20.1734067674075;
        Thu, 12 Dec 2024 21:27:54 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7263803a805sm7386830b3a.14.2024.12.12.21.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 21:27:53 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 13 Dec 2024 05:27:47 +0000
Subject: [PATCH v3 1/2] arm64: dts: mediatek: mt8183: kenzo: Support second
 source touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-touchscreen-v3-1-7c1f670913f9@chromium.org>
References: <20241213-touchscreen-v3-0-7c1f670913f9@chromium.org>
In-Reply-To: <20241213-touchscreen-v3-0-7c1f670913f9@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_212754_689482_14C83CF7 
X-CRM114-Status: UNSURE (   9.53  )
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

Some kenzo devices use second source touchscreen.

Fixes: 0a9cefe21aec ("arm64: dts: mt8183: Add kukui-jacuzzi-kenzo board")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
index e8241587949b2bc238ffa85f8fa6b6ca78b1d6f5..561770fcf69e66341c080687e2efaa6e98c550a8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
@@ -12,3 +12,18 @@ / {
 	chassis-type = "laptop";
 	compatible = "google,juniper-sku17", "google,juniper", "mediatek,mt8183";
 };
+
+&i2c0 {
+	touchscreen@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+
+		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <70>;
+		hid-descr-addr = <0x0001>;
+	};
+};

-- 
2.47.1.613.gc27f4b7a9f-goog


