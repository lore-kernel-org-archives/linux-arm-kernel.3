Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03436E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfTUgwKwfkr0vLqCx00ZTihimy0hbAjeLP+a0GkktMQ=; b=V+Os1QnrQa1xIpEUcPVgxs7vit
	czj15KrAvDaTf3AiPJZYoRbvNZQUrQTJy30Q/3QT+peuh5Wz9UoVv44ycDrJyRmSpz7q3SUSdNss1
	GOoo2GUILyXWMRoK04AMjaH5rihKPXNO05sLDkMVU4cGNrEMaHJbKZYJs64RL3Ij1VyggpiHVKC6I
	XU9dQBJm/O2h0vqZuD3VaBIStc874elad4F40gN2ozkiwbhBAaByx7TPBEPkgGm8ExnHfOjTMiLGn
	BczP2E43/Zbun+FzkiecQW0bcpeNPxd0lfBDr30stihyNPhNTxsFcjKZgtP/RIL4drBau1BC40tAE
	mhxtbnzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmYH-000000015V2-09pZ;
	Thu, 12 Dec 2024 17:00:37 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlcR-00000000ryj-1TGi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:00:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43621d27adeso5762335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 08:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734019250; x=1734624050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EfTUgwKwfkr0vLqCx00ZTihimy0hbAjeLP+a0GkktMQ=;
        b=gJMY7ZWYVeWV8atu3bI2IAVWNP3XYtyRlHdik5U/pISzKxbaxzrtohTJIyyEk+Ndex
         FGC0L0iwhBzSa9ZS4A5/Mk4iGksaCjFq/Aazmtd43/XYH6q+R4ziyoNPLkR50r2eTSFj
         5o2GgHUtR7le+JCZELx6Jqjz7tED1gpl4N5284TqNk7sPtoR59/bAtkGf650S2i8LCZT
         7C+rnTOarh5yhE0XShDumeIK6uZuQ+AdJkRLtTdZh6wP5w4SSCtzGjygaB5QSPMedW6T
         e8S1zkwD8+zBJ5Yl/kADZIguv51Ro82KLC+be2PcQiZjZ5F4SCIUb0vNa57apluyFXji
         Ai7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019250; x=1734624050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfTUgwKwfkr0vLqCx00ZTihimy0hbAjeLP+a0GkktMQ=;
        b=ZUOkM3tQTjIRctvczAE7ggDuaKPZbj/XluW4xYuHxnY+wL9azS5BNOzT3ZH0tPJJ9q
         +6BQVEn6JI1L9DrBsciwhuLiXYiM4JTEe9zrFWQ5KXSY7wggfng14NpTp6eQfHkHQmoJ
         XHwY1mBzzIDV5/6d10kT+TF4JKiWrRvBTWDVG+LJsuRa/YFIn9MiEFHJbDnhuVrl8jY5
         ICHhegXZDXLkFm2/rRr28zN1a3YFMYy9p4f9+YSMZXtmQ8SMXNh9SFiFl9bXEgnqG3tS
         ZuVzsnS27aQhH0kyLjG4MdpMy3xX47wcU4ijAlYuEc2LVbEQZ2Z8lvDz4KkvLcOKVB+K
         kciQ==
X-Gm-Message-State: AOJu0Yyh+LvpuRC1Yp9TI1Gd8rGnM0IP7cRGzliOM+AVDR+Zv6o5qQMq
	QSluHQVQ4jLOmXcryPadG+bqkvnamRTgGGa1rgpKXjPSzKdowXdzdyhKz9MbziE=
X-Gm-Gg: ASbGnct7EetTdCVh6L85ADYF89tD6I7rsLZGTRvF/EUpM/z6+yNmeNATyy5OEOM+gvt
	0EXKoOZKBrsMUy+WeLbdJty/kzu/ejWIYomkRDcs/OAkMtr/x1rA5iAyjLPjdWM/iZaI1tcsifn
	zvIhxBwgB9PbINGl66dKW7srYLAU/+0YSeBe5wBpRmevWu8iPgghMeQfVcbjq4Exis/i7DzcjV2
	ab4ufZiNUJz8wiSiMsNodd6Mno5FBrUgkvLaBOEItaYUeBcyFq2MtDfQkPLMMGe0L1VF3j8Yipt
	koTKn4xa2eaR0g99GaRqnEKKnXMP5NREuw==
X-Google-Smtp-Source: AGHT+IHBwvhfsHZ7qtV6/yU6ZWxHrw8qGSfTmuFY7zgZ0URfdh6kuYfx9vjB//GYI02tJWakncUFew==
X-Received: by 2002:a05:600c:5029:b0:431:44fe:fd9a with SMTP id 5b1f17b1804b1-4361c3e010amr59881015e9.19.1734019249618;
        Thu, 12 Dec 2024 08:00:49 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514d35sm4462941f8f.74.2024.12.12.08.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:00:49 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 12 Dec 2024 16:00:39 +0000
Subject: [PATCH v2 2/4] arm64: dts: exynos: gs101: add AP to APM mailbox
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-b4-acpm-v4-upstream-dts-v2-2-91b7a6f6d0b0@linaro.org>
References: <20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org>
In-Reply-To: <20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734019247; l=1282;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ce1gfVKuhMWygYDqna0xFI3vmpwGiIISm4wS0eqE5Rg=;
 b=yKRS1dg8qQ9WdVmW4a6Zg6eAYV4MUjEMRK91aEUmMZbQw2ZHkn5kV9WpTw9VlRF1IDm6DHmUE
 SXlDqjTvmLxBx4qsFucA34eNpV9XbiYQVPyNFTyq1FYbsLz6NiLkKWg
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_080051_393276_A93A4243 
X-CRM114-Status: GOOD (  10.90  )
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

GS101 has 14 mailbox controllers. Add the AP to APM mailbox node.

Mailbox controllers have a shared register that can be used for passing
the mailbox messages. The AP to APM mailbox controller is used just as a
doorbell mechanism. It raises interrupt to the firmware after the mailbox
message has been written to SRAM where the TX/RX rings are defined.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 1441e9a252c2..04561e15b96c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1445,6 +1445,15 @@ wakeup-interrupt-controller {
 			};
 		};
 
+		ap2apm_mailbox: mailbox@17610000 {
+			compatible = "google,gs101-mbox";
+			reg = <0x17610000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_APM_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <2>;
+		};
+
 		pinctrl_gsactrl: pinctrl@17940000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x17940000 0x00001000>;

-- 
2.47.0.338.g60cca15819-goog


