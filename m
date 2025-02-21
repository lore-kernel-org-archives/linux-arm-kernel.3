Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FC0C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/RCLtFgB40kh5NGeWf7eTgIwKvvdlHuGYWJTu9Fn9iQ=; b=HHQr4wLLTY4F9gJWYcmh0gKo2C
	bA3XJFOmMAjt/8YqLPIgMxNSaeCIqOEGCUEra893bBOD4a9GCp5+yKR3lY3sYKjwXhLY6/QnO0m4M
	ZEb390+dQwZwNcu/NY9Uth1luBz82MKZR642VoivykK6YYORlf+M0V8d+bB5cevLshHHouLoy+UlS
	+Nu0jwkKg90UHy9MuEJADaIAxljP2xQMC94y99z9wSif9GlrVQPDh1LXx7fGOLL+Yriy6C32lnl8A
	M3B1EorLZS9v8m6eBZ5c5E8tkijaM5hYP9fdH24hpkEUrDUSd1xJgr4mk46IWi1ferAdVPATVHp6B
	pHAFL6wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYR2-00000006bx6-0Ga3;
	Fri, 21 Feb 2025 19:11:40 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYPY-00000006bVJ-21bY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:10:09 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e0452f859cso3855781a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165007; x=1740769807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/RCLtFgB40kh5NGeWf7eTgIwKvvdlHuGYWJTu9Fn9iQ=;
        b=ci/Yhk6esqrKLD0Sh03/1q5i3+ZP1ZQoLybuQG8z4K7PzcyOp7zVufHIUxfVgaNK0C
         f4KvjziIokD+0S8qvNYBQ+s54+6+uJZSdLvb4gQQIYlIvFSL/IiRQXr2PU3ALC7Dc6YV
         Py9ch7aV/yyJ8jf0eSwdf3EfQIKJ4ZWRCnsdwv/3CS0M5B9OfWN0BrxujwgpsxOtU4uY
         YfqvKTN+Gnmyc1zaR3NCUX/K9YCK9uJMh/i1pDUdhYPGoJc/AWOHWkkWipm/ekjEV5Oy
         YgFixScaHVFjcn7tBmX8NdvmYUPWHic8beGHT06SkfpubGO5vX796Z/9FmjV9NV5iAWQ
         UB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165007; x=1740769807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RCLtFgB40kh5NGeWf7eTgIwKvvdlHuGYWJTu9Fn9iQ=;
        b=Pkr5535BYVXGyEy4j8DrGmB7yExhQQLCqshp/pj1yQP9DLIu/OoHs8RkrNBRdtKLwA
         g3vq2QmCMVP/Jbs8v8HoSZgFAwqKwbejb5bai39BMPplZ/wgm6qvovyk6aEQa24fLN/z
         gAF2s3E+gEstb8/TpU+fMrefaqRPo1Upy+zZgOOUPMX7AycoKhA7YHb4XUkg6C9ZD/5C
         f1+pPiG38QMwKzRgCrO9EjQSHu5m3GY7coHk3lxO3PG8jZVhNTR3YMXgk71avZB8sfPt
         9TYyQ8Pj5n2vmfWzoM1qidN/GCH+vNxQLdVSKeBgJz2vjcYvy9xoUkS7AZuQppPFSp62
         OoWg==
X-Forwarded-Encrypted: i=1; AJvYcCVl2RXeG+kFZCnPYXnEzEUyR7xGK8TWcCybyIc9c1A2LR8VzvVM6nq0m9PVFQaVnZWZ3xr7PiQ+4f+wcN9ypOkr@lists.infradead.org
X-Gm-Message-State: AOJu0YztqkFIZqFxDuGsEZBgJEKkn+GQs98BsYZQG6nq2TDwxmGDHU36
	pADhZyG9Jt2dasOQ0q3uYIdtK1WBvR7lZg2hNIfEu809o0Ye1Cds
X-Gm-Gg: ASbGncvAu6gmBNdy23hPQGsd4clnSCn/8BVTAdWi3+Csl7ywjvYPSi0mqgkYQjrQ7LU
	i5Br265a3WIYypIF2V2c+PYwfZjFq8Z+4JxuDnoEBLHt/V3V3axMOO5B+v6z0zQC4zNH+ICstL/
	+woghopx3ZgdE5HcL57nvcoE9Cl2m2Zq6HB9f8CLLD/Ui8wjHCHsIgMc13Jgai+0nT5YUwfkBjX
	MSKqvgxz+ob1G1M9d3DQgzm6xO8FXUw3G/3ugQuZe9a8i26qOb5RvdcXrqTyNkHi7R5mslJ5P2L
	3RnRvEyoEHXA96/cO4FeVk1YZw+OhzxKDmGsVecdsLDTM5TQT9NuIJZy98A=
X-Google-Smtp-Source: AGHT+IFpUclfl3GP+JTSRxwBFyvgILom2sf5gyrQlkLG8A1WEQOIo0TKJpX4cHGGPDFAFepHADJp5w==
X-Received: by 2002:a17:907:d9f:b0:ab7:66d3:bc88 with SMTP id a640c23a62f3a-abc09e459famr488105666b.52.1740165006472;
        Fri, 21 Feb 2025 11:10:06 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9b187203sm1027261566b.61.2025.02.21.11.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:10:06 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] clk: imx8mp: fix parents of AUDIOMIX DSP/OCRAM_A
Date: Fri, 21 Feb 2025 14:09:25 -0500
Message-Id: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_111008_524838_4AAD9F05 
X-CRM114-Status: UNSURE (   9.48  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Correct the parent of the AUDIOMIX DSP and OCRAM_A clock gates by setting
it to AUDIO_AXI_CLK_ROOT, instead of AUDIO_AHB_CLK_ROOT. Additionally, set
the frequency of AUDIO_AXI_CLK_ROOT to 800MHz instead of the current
400MHz.

---
Changes in v2:
* add Fixes tags
* add Iulia's R-b
* link to v1: https://lore.kernel.org/imx/20250217165718.74619-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (4):
  dt-bindings: clock: imx8mp: add axi clock
  clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
  arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
  arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz

 .../devicetree/bindings/clock/imx8mp-audiomix.yaml     | 10 ++++++----
 arch/arm64/boot/dts/freescale/imx8mp.dtsi              |  7 ++++---
 drivers/clk/imx/clk-imx8mp-audiomix.c                  |  6 +++---
 3 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.34.1


