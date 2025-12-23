Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC71E6F08B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 12:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pLfghK18morQpXT9BEqhLMr+9W9RlMs2kLlFEkTdBvI=; b=SyyDTjgcZYt9b2xsjZCghHEbCi
	fJJ8ykUdYPyuq1IQwFye6YdoNh0EJPbZinlj5mHDtsvAvB1aShsM8KDSSUYs77nVu/ZbDXtKAf7gI
	Uyp9s9nx5iOaijpv3v3+xOxMSuGEsItChapsjcl/HlUehzGXGFU/wR6WVDWgtXYKSlDB6NKTJkEx+
	4KrM8/rtptpt14DURrAysKS598USZvA9AESt+hWQ1X0nnrD4ll4rb+42ivmzeI+rBpBtyFwEt7C+K
	FeXdZH5EZe3zLwXsrPcnhWMB+gJylez1gYixzBR1R17KOBvoaUlMI+3l663MRVAE/wCY+x1GC5QWU
	kxCl9ieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1nk-0000000FUzj-1XuN;
	Tue, 23 Dec 2025 12:47:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1ni-0000000FUzV-4APN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 12:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE976600CB;
	Tue, 23 Dec 2025 12:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD6EC113D0;
	Tue, 23 Dec 2025 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766494061;
	bh=vIDLcNDvZkN5LTCFnFI3qztjOOsnOhIPYziKgleG5U4=;
	h=From:To:Cc:Subject:Date:From;
	b=nS/LYUGG3bQWx8kgoisYWGHKKh0DWJMRI4/JUwCUzxuCqJhdEffcw8bQ6NJDCLArK
	 +yD6VkIsifDT4qNnKcj9Y318Gr+O0v8AdqXcjAnSPubjbv3c2DSqAw/x83DeYTgl8A
	 cTuhu28oH0JFPZn0F5NDPomxfJfbHUnfowah+2KMDXlDg2Td4MsdMTvD8XXuK2xDsI
	 azj/89k4Qgct2+VIjwZKvEweKsuNrW37HxfPtjBMb0FDBRruLcHNo6B4ek8cvv4QT3
	 /A/B5HnDGrZgFKBHz9thgkbQkT2EyxyH1qB/r/kDXAiispTT/+youTbGrEvK3FeCHe
	 pWTuHBusy9TSQ==
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
	Andrew Davis <afd@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Randolph Sapp <rs@ti.com>
Cc: linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 0/4] drm/imagination: add AM62P/AM67A/J722S support
Date: Tue, 23 Dec 2025 13:47:12 +0100
Message-ID: <20251223124729.2482877-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This was tested on the sa67 board which is based on the AM67A SoC.

v2:
 - collect ACKs
 - rebase onto latest -next
 - new patch which enables 800MHz operation for the sa67 board

v1:
 - https://lore.kernel.org/r/20250915143440.2362812-1-mwalle@kernel.org/
 - Don't set the clock to 800MHz in the soc dtsi. 800MHz is only
   possible if the core voltage is 0.85V. Just use the hardware
   default of 720MHz. A board device tree can set the 800MHz if
   applicable. Thanks Nishan.
 - Also add the new compatible to a conditional in the DT schema.
   Thanks Andrew.
 - Dropped the wrong of_clk_set_defaults() and instead disable
   caching of the clock rate.

RFC:
 - https://lore.kernel.org/r/20250716134717.4085567-1-mwalle@kernel.org/

Michael Walle (4):
  dt-bindings: gpu: img: Add AM62P SoC specific compatible
  clk: keystone: don't cache clock rate
  arm64: dts: ti: add GPU node
  arm64: dts: ti: sa67: set the GPU clock to 800MHz

 .../devicetree/bindings/gpu/img,powervr-rogue.yaml    |  2 ++
 .../arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts |  6 ++++++
 drivers/clk/keystone/sci-clk.c                        |  8 ++++++++
 4 files changed, 27 insertions(+)

-- 
2.47.3


