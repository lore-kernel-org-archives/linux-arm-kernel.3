Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2792CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=37uU6dupYlnBUFfhVB2je6bcPxvtAGRd44OBf+N8R1U=; b=votF07TFD69z8DKKX0ZkNHtQTi
	DFQfk7NA1JbnMW6X4WNAK/XQuQP1QCgR+isycDMWOniQlrI/O/y9SqJ5ErjGcHm6gtaLkAb6Tar4y
	8xVKtPrHcqDdnERE70AcA5zOVeVsJWC3HUW1pn3noB7Liu1qSNzUNnPQ0vpWkqu4wE/J8Qp2xWjND
	SvHMgg128CoVfz7fAogMNUVRjtdl/OmmyASM9s9x0eLNtA0PqY0Sjp4BgF2yOcQyTS/kPQHNV4WOd
	jLiBRceq38XH6JScc7gEpfODq6QQqXVsiuh7govftNeBY4jdndCCmQTEG+1F7smN7HfO8+iE7HPB7
	CmzybX3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAK1-00000004jL0-0yly;
	Mon, 15 Sep 2025 14:36:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAJy-00000004jK1-1Uat
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:36:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EBA641A52;
	Mon, 15 Sep 2025 14:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6236C4CEF1;
	Mon, 15 Sep 2025 14:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757947005;
	bh=RLaJFRiH9fUacA+g8XK++lLAVHNIs8PaxaaH9y0/D68=;
	h=From:To:Cc:Subject:Date:From;
	b=Cm8h8W+NHQQgUhYx7vuPgMU2GxX/rYcW6cDGMwdYtftGZM+ds2S4gGgbjvadMuJW7
	 uZz0cIIRb13Y9XNXQ2fP+Kbeai4RTWs9XFrsDSCg1QrqimGWm2f6C2u70A1bnccP7W
	 79OZAe5oGfLp6K7kRzxFjwwC4E5M/EOVJNlXODnpq7THhEyOk3D61bKy2eekpyWq2+
	 Pi8dbMS52WvF/SCwrCRDLI/0U7MZjzsMOT9x0Zh+rynSjKen3EDQbD/0PMk6cTqtOx
	 R/TzC+Tef7diO72p98ly74SUmGgETUy2IypawrudL66x3Uhe1XwzdDzLrdnKnHzGIH
	 tKTGhk0/3ltrw==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andrew Davis <afd@ti.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 0/3] drm/imagination: add AM62P/AM67A/J722S support
Date: Mon, 15 Sep 2025 16:34:37 +0200
Message-Id: <20250915143440.2362812-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_073646_414857_A5C880F1 
X-CRM114-Status: GOOD (  13.92  )
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

The AM62P and AM67A/J722S feature the same BXS-4 GPU as the J721S2.
In theory, one have to just add the DT node. But it turns out, that
the clock handling is not working. If I understood Nishan Menon
correct, it is working on the J721S2 because there, the clock is
shared, while on the AM62P the GPU has its own PLL.
In the latter case, the driver will fail with a WARN() because the
queried clock rate is zero due to a wrong cached value.

This was tested on an AM67A.

v1:
 - Don't set the clock to 800MHz in the soc dtsi. 800MHz is only
   possible if the core voltage is 0.85V. Just use the hardware
   default of 720MHz. A board device tree can set the 800MHz if
   applicable. Thanks Nishan.
 - Also add the new compatible to a conditional in the DT schema.
   Thanks Andrew.
 - Dropped the wrong of_clk_set_defaults() and instead disable
   caching of the clock rate.

RFC: https://lore.kernel.org/r/20250716134717.4085567-1-mwalle@kernel.org/

Michael Walle (3):
  dt-bindings: gpu: img: Add AM62P SoC specific compatible
  clk: keystone: don't cache clock rate
  arm64: dts: ti: add GPU node

 .../devicetree/bindings/gpu/img,powervr-rogue.yaml    |  2 ++
 .../arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 11 +++++++++++
 drivers/clk/keystone/sci-clk.c                        |  8 ++++++++
 3 files changed, 21 insertions(+)

-- 
2.39.5


