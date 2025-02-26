Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E441C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gn1jVpYNtqABB36v1CD74BC8OtMIG7ZKsW6uUkVb878=; b=F9ZQjSAjiGJ5fhz2d/jb3P7cYb
	eEG5FjJNKOG+OgEudX4plJEUrW0UXRiaSRxLTnPIJsIXJFM7fFXVndbgGmhzEO9efkdSLE+7cz/TQ
	1/v31xDcCWroY5zkPug+Fw5e1Tx2X9EmicJ7bwlowYQ4I0KZ+nGs/+sy+mqRn2VdsXKjW+an/gLBJ
	FNYCbTAk12hGgYcTemJbnS6/Nw/9eTmV4dKCUNFOulekKDdj31J7SPWW2WHbJuIqy8LclmSxoJPmI
	46OPSTTA0vETXc76ytFNjPSkqUdNjpZViiKfobWnoo0TxF0DvCJv7PFqzkO16MnJnfu8IHPASb2D2
	BU4Y9tnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKZy-00000004a3n-0u0w;
	Wed, 26 Feb 2025 16:48:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKYP-00000004Zon-2SKj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:46:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-438a39e659cso168155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588396; x=1741193196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gn1jVpYNtqABB36v1CD74BC8OtMIG7ZKsW6uUkVb878=;
        b=dlYpvmUR1dtFTPRJRrG1/NrkPyqRBOCBbkWDvUIIz2QPhCmxaG2eeSDzeN2szxoEdi
         Aj43McXA8q1q5KEc1aUFQWIi4lkEPpIGOq111wuXWwyV3vZc4WuBNBuC+0KhugjJtvsf
         WioRbQN5Iyxeh3oTVEj05gTizD+4oJ0l8qUdcQiW5GvsF2mjvYLKboEgcVCFRkcMjrF3
         vVbmGtx9uQxtxrsFifrebXny5C+O7tbPWExzeAsds34jvFo1OFFF+F1IezqszHgBUCXn
         eNN8/oYULOzb2/Mn6zr1ML6tBdLxHzOo8GAox0/Pw2dhxXe9q6ER5nWhAhjQIGjZ8Pgs
         E2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588396; x=1741193196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gn1jVpYNtqABB36v1CD74BC8OtMIG7ZKsW6uUkVb878=;
        b=c/f21EuPSezMeBPq3o1Ks0M5r2xDnUgSHUBfoVA9dJHVOE6/XmIXgFLfh55POa2kPm
         LHjb6l67vAkfgTfLM3Bi2s6zvI8ZAvJTU0LkmBJwsovWU4XeYWFk7oDtqzHi15cTTlky
         XYGWNJ+Br7wEupLrgccEcTDpp7xuUQMws4Y3cgQyPd+ZLcaehrtmlW8ml4BY70w8L9Rb
         q5kyx6R9wT8td+0zBu6MWxxCP0v3ErFisPutnHg2CAdWUjCPUte9s0QF2XvgpXZm1v4C
         2ka3FyRM9hhGqy4OUzhqsJKyi8KoehbqbLrdeAoVGOUjXYvypG4qJvAMtBPQahRnfOiq
         1dhA==
X-Forwarded-Encrypted: i=1; AJvYcCUvmnbDKfN2sVcvQRh8ZnLJ3Gh8ra9e56a8iM0TWVoPIdzGRBJkrM3sIIHIviq6N0+F/UAeRuLvn6mhI4nSyDnQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwH2y5nBFDiGwev9CbsiBlQD3JUBn1C/vT6Ja9ItgKxYKvNsI8i
	Ey0Ssb3do7tihWse9HTTcZrmFCrr7ezS+ynZNPTe7+QmJUYoemeS
X-Gm-Gg: ASbGnctf9SMreSMMH7/RJYqZdxGkDeBjgB2274LiFPQttbBEjlYyPkGg8M3UOeL7e6p
	SHxwCcC/F+ZbI+ClNpr6FRROJUpDLxg1NIbToumymSQJBpBQGFAxOZzqu7Q4Qiu/ovMrCDbIGkx
	wer/xl8FyjN/dxY9INTv+GaIiaiHoDv243cJhjvX4PMc5Z0u687TJaB1Bcb6PrxjM2Yv0cr1rNS
	VjZzSWGTBKD7sFTGQKE8bNpeVB3yk6SMcci9aet8M8wT19mrl+de7wuZYNkiuGhfZE3JK4aJWS5
	lPZmUFNlBXCxl4mi7fXehXj3U1NeA2mXLmgJYEBKJo8Y6tBwFGPAV/I9F0R8Nbhm
X-Google-Smtp-Source: AGHT+IHASu5EZyCMob3n+ZWyMrlOQTMJxxFYG7U17xiFzsRsj31Q08c/ZUItm4yM1mcyej2N52nKxg==
X-Received: by 2002:a05:600c:4689:b0:439:9f97:7d67 with SMTP id 5b1f17b1804b1-439aeb2c755mr223185145e9.16.1740588395267;
        Wed, 26 Feb 2025 08:46:35 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7165sm6200215f8f.73.2025.02.26.08.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:46:34 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Adam Ford <aford173@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] clk: imx8mp: fix parents of AUDIOMIX DSP/OCRAM_A
Date: Wed, 26 Feb 2025 11:45:09 -0500
Message-Id: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_084637_624776_FA7E1328 
X-CRM114-Status: GOOD (  11.08  )
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
Changes in v3:
* add missing Fixes tag for binding patch
* improve the commit message of the binding patch
* link to v2: https://lore.kernel.org/imx/20250221190929.31469-1-laurentiumihalcea111@gmail.com/

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


