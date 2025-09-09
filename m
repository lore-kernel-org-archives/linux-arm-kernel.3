Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DA5CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fz+B+CL4iaScWz0taGfrGQauvYCWLu7diA57jxmU9w0=; b=ymJPfjmo6YaVXApJko84qQxS0n
	ptjHemAvq35mRWMqqeV9XW1gyuxITnJBFxFYZ8EG34eybVYgepArVAivf6KNXtntfnWEB28m4Lu7n
	d5nVfXChXUMYBpbP1+4X7emEuQRDNMHpSd5na+DZP9tNW3qDs0WKYGCzcCEUskFTetkMR6p0foav3
	dOdFxRKh3mFoWi1bkg0eI3qvyqefA6qwjPLYn9ns1gan5iDduOOtiRdeJFXeVCNtGE6oHkcyKO2nL
	PxmHk2Ho9xfdq7v6Xz9+Hl3Et4GxRuManWCBnTsniFKGbvK02eOkfyW5FyON9X5TIs6BdZKgoHHG8
	FTyhl5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Ua-00000008CrX-1Lml;
	Tue, 09 Sep 2025 15:42:48 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvLC-00000006HqA-3z6Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso2764605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412765; x=1758017565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fz+B+CL4iaScWz0taGfrGQauvYCWLu7diA57jxmU9w0=;
        b=lgYlM/W++W1Dmau7gk/ei8CH7lhZIibm2nep+yd8IMJvUMuKMMu98wzGl16+WigMiW
         qufrrNrOgEYsA95gpp3r1KF8kAj8W8KyfHTEGw56fdt0PzK70a/jezsitx03SvmIJiJ/
         k0XGrp1QGtU8go7tLI7wqGRtsOB+5RWFgtYrV1zThtIo0k8d1iZcWAkykdAq326xLrZb
         ldi6lFoA7yNkq0KFzicoRcQiL8X/HoaQ6fvLsomSNenYVOw0niUSH92ia2+HNEoEGH0A
         b4rzIMAzpU7zme0STDy6pQq6xgRfLQxsCIy3DaoQMmnxOke2mqYq6wWE3IMKRVihss62
         36Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412765; x=1758017565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fz+B+CL4iaScWz0taGfrGQauvYCWLu7diA57jxmU9w0=;
        b=mDbT0Rvk9FuR2RStiMbuiVpj4x5NTp3kzy/lVtTkyHGGR6vT7daaF5SnN2Eg6A+O2s
         PMHiJPv3EaNXgBfQDPWgNnlVkUx0Phk44rN54T6QDDt1I6EFXuvEk1wwLrIvF9rMHxtB
         a0h8jVLmvhGN7anme3b7PTDCC9CnGutUcyMJ9IHwvr7t0jvWwW1ntXf0zsKHqvA/ODpH
         efH6jW2s93iihNNyYDUZA6ZYKuT/N+NIj6S4x55AJ2CdwVry9wfFTz5SAK0W7cO7Z9Tj
         L3QETL3cn1gdxs1NTcZv1NSVWS6mOQ4EUyPXVTNkaH2/NOOiCaztyBuM21loC4Hb5+D4
         aeqw==
X-Forwarded-Encrypted: i=1; AJvYcCWB5X78mqXL20WU/2LjN5gGdGes23B0OwroZtHvM81L8aipE7RDweJT4ZC95mLH/l7C3tn657Gjr+Z7zf3qsxW5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy71oMeybk3LyJ9IqdthaoQT/MaoxqgC8XXu0yJOELp1l/hgh53
	eeU/gyZ82u4OugFswL9PoiNNP9DJTObEj1Qlb2Vyixouu5VRW1nw8K8/
X-Gm-Gg: ASbGncuZvt75y4NNy3xD2z1PoyPBBsYGnFvJxIAeB31dDaDltyWkCXusfYCsTPSc6l8
	PzXyrySczZiaXCwj+KhcBN4n6fTyRF0dW7/H40yU+9ZjMF3yM2NFcc+fHFGOkaVVE7RBy6Av0Ze
	hOP+UJHO8K0LLYIxKC7LOAkgabJDHp7rHfR0QSK/VTW9uYcCwUd1gAqDXCnI8zF/+1gusNC8QfW
	doQKsTVtd+WtLXTsWwbGoDAH8ImShEpKixZcnVzdRYfq2+TuvxAU5EzP5J91v23DFHhWc/3igrR
	S3cIvfCpS9v9mgCX42YTrJr8ObXKJdxJy5n25dNpUG99pj+qqX86exWE516+R3tus5+yrheOK3H
	9e/DwUyGg1GDAsT7j8fNa1LDjUq7oUYthDbXKeDvOc8dJOhOqHxi9w83PZR5iff1TT2FzkiW78L
	MWpneUxtjDlliG9oA=
X-Google-Smtp-Source: AGHT+IGIpwds5m1f99DmZYWHr5hx00ReCcHO4qawO0+yYPkO3AH5Qzc/5zzp8Hi+Au0bjFxBpPBAkg==
X-Received: by 2002:a05:600c:45cc:b0:459:dde3:1a55 with SMTP id 5b1f17b1804b1-45dddec78d3mr98436055e9.24.1757412765321;
        Tue, 09 Sep 2025 03:12:45 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df15e4f44sm13157475e9.6.2025.09.09.03.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:45 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:23 +0200
Subject: [PATCH v6 16/20] ARM: dts: stm32: add ddrperfm on stm32mp131
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-16-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_031247_024298_DC8706D8 
X-CRM114-Status: GOOD (  10.43  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

The DDRPERFM is the DDR Performance Monitor embedded in STM32MP131 SoC.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index ace9495b9b06..7ef3931fd6c5 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -998,6 +998,13 @@ iwdg2: watchdog@5a002000 {
 			status = "disabled";
 		};
 
+		ddrperfm: perf@5a007000 {
+			compatible = "st,stm32mp131-ddr-pmu";
+			reg = <0x5a007000 0x400>;
+			clocks = <&rcc DDRPERFM>;
+			resets = <&rcc DDRPERFM_R>;
+		};
+
 		rtc: rtc@5c004000 {
 			compatible = "st,stm32mp1-rtc";
 			reg = <0x5c004000 0x400>;

-- 
2.43.0


