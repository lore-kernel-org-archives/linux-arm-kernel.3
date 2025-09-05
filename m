Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7B3CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLCXREPNi4TcJ1BYbePcTdlLX0+ZkeLublBsxs8Nd74=; b=Qefrza3qhLsJ4KL5odk6J4N2US
	BAMskl7fa5P/RFMYPqOw3avI/yJfy+RzdB1iKYePuJayoOrgEo9csj7rQ+0TEpIK7rTLEWVOG5/FY
	5b1+7Ro88s0W4rgV+Q4RnHCz/NHmS1IGkQTXCbo5Wo0xdkCTSz2CRvt5G6GLmzqJ40rY9H/aucaVu
	FJzEQRjbKTrLRKaAHViL/O+zx/fFT+FGvfE6YEezsKy3A58kgBBSiB/TXaf8lPQuSY8fBTDu/uy+n
	N4rkTUpUZyuNxaPJ3uNT/4okg3OtJrJ0kkCpSUh/C4oEfO42gClaNWX3CChjurQPjWLb7G178Qwaj
	lYHL0lew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugZh-00000005Yrm-2kO9;
	Sat, 06 Sep 2025 00:14:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uufta-00000005HYY-0Tuh;
	Fri, 05 Sep 2025 23:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BF6B601AE;
	Fri,  5 Sep 2025 23:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73B5C4CEF1;
	Fri,  5 Sep 2025 23:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757115064;
	bh=BhvkplneeHvq8+/St2DrA4zwRkq9v6hH9fZ+08hzphw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pt7bN0Dr2EYWLSdBhCvlwbVMIYN3Ig8y/jgrzdnjRjxPAEUR46bNQtiTCEvVSHeuz
	 sCZxBz/5gODblGYi6JpgvycV+FGAuMVxvqTx6daLEhapSXeUj3RBEmsv2V8vdzWz7f
	 r3qvSbqGlue6IoiNwrZ8O+3bcqhxIAS1N3hSwhbClKHNHtcamaW0zeq6NvR1fysEZc
	 UnDKZbtbdbj9/gHoF3stVdM0pNNB51k/cFyuOd6c6NbGT0awSMZ6PhIMUu2cr47nVK
	 vEoUOVaes6PpH/SxAphgsq5A3Ru1GENiXcWKSNUgD/I2GXH8EEg+jLGqyJQGel1jxx
	 u4Em+O4BGCRmQ==
Date: Fri, 5 Sep 2025 18:31:03 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	kernel@collabora.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 04/10] dt-bindings: mailbox: Add MT8196 GPUEB Mailbox
Message-ID: <20250905233103.GA1508406-robh@kernel.org>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-4-7b6c2d6be221@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-mt8196-gpufreq-v1-4-7b6c2d6be221@collabora.com>
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

On Fri, Sep 05, 2025 at 12:23:00PM +0200, Nicolas Frattaroli wrote:
> The MediaTek MT8196 SoC includes an embedded MCU referred to as "GPUEB",
> acting as glue logic to control power and frequency of the Mali GPU.
> This MCU runs proprietary firmware for this purpose, and the main
> application processor communicates with it through a mailbox.
> 
> Add a binding that describes this mailbox.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../mailbox/mediatek,mt8196-gpueb-mbox.yaml        | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-gpueb-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-gpueb-mbox.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..506723d54ae0a429b462914f3666184c24c4fc5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-gpueb-mbox.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mediatek,mt8196-gpueb-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MFlexGraphics GPUEB Mailbox Controller
> +
> +maintainers:
> +  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8196-gpueb-mbox
> +
> +  reg:
> +    items:
> +      - description: mailbox data registers
> +      - description: mailbox control registers
> +
> +  reg-names:
> +    items:
> +      - const: mbox
> +      - const: mbox_ctl

'mbox' is redundant. So 'data' and 'ctl'?

> +
> +  clocks:
> +    items:
> +      - description: main clock of the GPUEB MCU
> +
> +  interrupts:
> +    items:
> +      - description: fires when a new message is received
> +
> +  "#mbox-cells":
> +    const: 1
> +    description:
> +      The number of the mailbox channel.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - interrupts
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    gpueb_mbox: mailbox@4b09fd80 {

Drop unused labels.

> +        compatible = "mediatek,mt8196-gpueb-mbox";
> +        reg = <0x4b09fd80 0x280>,
> +              <0x4b170000 0x7c>;
> +        reg-names = "mbox", "mbox_ctl";
> +        clocks = <&topckgen CLK_TOP_MFG_EB>;
> +        interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #mbox-cells = <1>;
> +    };
> 
> -- 
> 2.51.0
> 

