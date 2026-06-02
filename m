Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D0DCD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9xxE0a97UY7UPF7zz4jpUqke1DXutWR5PtyvwLwWtU=; b=XuqQAt7WQ5Jq70SpcZwdoTO1/r
	yw1IroWvOJkuiLKbMOL2DSCHyL7N5Un7HJ0vdpkVzhR6N4eiqlmkJkyIurEDVHjID0Ya15rQsR36d
	U5H3d4lYT7br2XEYG7ZtBlrpFdKBuqaz/2M3edVUTsk6vEoop/mTsN75azOmXWmL5Eh3GhmBk0LBb
	T53SbdFVl8aLI9AuH9zSRIkLo/BAXZCKHkC193c6KHKwitVu0HaJEsflHwxvTANiLs1X43vFf0/cg
	EJs8DtgWpeHhCdNFYtj9JxCsU+8C6o3TcZZbeUejp+zMvLGoyaw6uUOle2QYZ4gUapSi5kan9DFZh
	tQU4O0bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSU8-0000000DWBM-34wq;
	Tue, 02 Jun 2026 17:01:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSU4-0000000DW6F-2ODU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:00:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490b3e03939so6173265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 10:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780419655; x=1781024455; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9xxE0a97UY7UPF7zz4jpUqke1DXutWR5PtyvwLwWtU=;
        b=PNf/NaoZob13rAUB6O1rkFB0XS2tpA58jlJJ4BX7dTrquta2FvyJ5IRHg8GGulmRfH
         8yQQM0Ya1dCEi74XHboVWPRJjTZ9++6xi4nBhu/awj8uq32+/VTaMJFRAsaOQHSCG1nm
         EO80GkqekvfNdxe6v9A3U8+bBtud9UewvrC5TnBzSrVRYfuKIE5ODQrwH4h4ROgcuY8Q
         Yw4w/kBHIJEH14G/CTlAfeZHHt6R/21tHppxOBMYSM8XI0OrfRp+KdIS5IMVnoGuk8Wg
         bNjvVNXH1sy0fDkrjuezAfU9XQBIUTP9dN9/12JykOQvEpyYxkocvJjhW21kZBVALkgB
         m3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780419655; x=1781024455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b9xxE0a97UY7UPF7zz4jpUqke1DXutWR5PtyvwLwWtU=;
        b=GJc6g9SzJUJbibBFiGK5wMCNxlj/liZny9bSmnioLFN3B8gogDCSFTw5pbK2J0FVM3
         6/Jw0R1VvkvahosWYEjBp+V77xGEb7l8Z3vTqrSXh29QXHOs24veGFqhSfBM60EBDSZO
         pnJ4vBALge4AU6ZXHGmxpvbTKImhi2MOC70o5+pClm7AGWoUz8VYcUgvPP7mH/w5mB6+
         hpIhavWOHDrTvdTnjbWo/OayvuiH/ZhO/VZrKTzxsqfoMDY2ix3yzUFDv6XIzZRqoQKD
         RncA5t/RLeKjJxw7TX1IXLIXm7VjZ0YUvPy0ZOY6KSL4O6ZuNs30i+wh1+0ynontAWmX
         5YWA==
X-Forwarded-Encrypted: i=1; AFNElJ9JFZbtI35Q1yLE/JExQZe9ArZoAH0LcuPIB4gNfPc3zV6gJMnudBolfoWWmCnOkykrOk+1NnuxVGGCw+mZfX5k@lists.infradead.org
X-Gm-Message-State: AOJu0YxF0lN2W+VLkgC6dufaAEKkZivumzcYfQR7dU3cjCOW2dTCM2Cz
	BuzTgqlG1b88xgyd+dD1ekSxuZSpFD3GHLMSDL35D84tYWzwoqTByUGt4qeO/P5HnB4=
X-Gm-Gg: Acq92OEa+6Qmrh3IcdLSPf93EEJt6h7K8bZirK8JWg38/XuHpBiuJfF7RGJLzaQYEYE
	QD5aoJybeh79hIS+VlzPY7CACKCd+ENNsbqU+u7c5rnXOA+nIKeDJqNLZxmsDspa2b2jjjN3OjJ
	A9FF473OFgHBGWo6IT0nSFY7yEf97OgD6lJIZiUIR4eRBIZ5SRnmYt1vK4ewdG06Y6Qflj7ijj4
	BR0RM+MeLb3ecJ/O1TP0uav9Qyg5ZY/F/jsdOQMzPevML4h8O66+3PSnprRdUijjJkOWYNcruKi
	Pef4l4yzrn5mXQN32Ry4GWD/Mushvr5hKq7IV+tPiMVzOeBmB0PA8NkGhznJjiuTx1HWNijzFYm
	5L7iJeCyFThequSi9aLvJo/Cg6W4iKHuT1uek+HgIdab79Rjat0SUkMPI0ksK8XJaJ/qN8nBEoQ
	nXP5XtUZ96Vi/7jA4/brUnfDP7xuy3QaseGeJ1Tcy0rfbFrn8hU3EYWbRHGKssxRZjKqv4iYj4p
	9o19Rf4YR0UWMw=
X-Received: by 2002:a05:600c:410e:b0:490:addd:1d69 with SMTP id 5b1f17b1804b1-490b0eaf370mr58450785e9.13.1780419654831;
        Tue, 02 Jun 2026 10:00:54 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm541156f8f.36.2026.06.02.10.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 10:00:54 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 02 Jun 2026 17:00:51 +0000
Subject: [PATCH v7 5/5] arm64: defconfig: enable Exynos ACPM thermal
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-acpm-tmu-v7-5-8047dd54b0e9@linaro.org>
References: <20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org>
In-Reply-To: <20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780419651; l=795;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=APjGOr4rSujMx24P1jDIzhjkfbHKcFK80a9vPvVqD0g=;
 b=QsERHNC8FPgbTJGtPPDB6Ya/u8jw2mBQU9wWAijdol1fz7fqN6OPrykn8Jo+GBpS1m9JE03oJ
 WGR8WbBY/QdD3cLTko3HsVqrkMKkglmTJ6fLlzdEnf7iZQhpjEYf6jB
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_100056_642798_98D6C320 
X-CRM114-Status: UNSURE (   9.24  )
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

Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
to allow temperature monitoring and thermal management on Samsung
Exynos SoCs (like Google GS101), used on pixel phones.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..3fe76a4c2633 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -793,6 +793,7 @@ CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
+CONFIG_EXYNOS_ACPM_THERMAL=m
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m

-- 
2.54.0.1013.g208068f2d8-goog


