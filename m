Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47569D262B3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 02:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbk+pGFu+lFL3En95JgNEi9CVcEotXXw9ZhswsnFCUw=; b=tcoXz9e7X2aEUqBDkqEBoMyGZ8
	TpEtex0Y5Ly0XUzODDQY2J0ZXLZgrRUE3YZXoC8crJfcIv2d0msqDo7Tf/Bil+9P+drKnLp3cZBIN
	PkMpoLusdsvBRaPdXzArEy13/CPJdWJHLiqKB4jHregUPyST8q73p1sMCa84y6AQHywbOjccq3m+j
	XSz2dPfbNmqznb+O1g9ZIOpuO7vxUSDHaOPc9uSQzJ/4KxPtbNhjAQAeecacUBKM3ZxQLTDRxR1tm
	fC5g5LnnUWeC1Iq03f1vxtDFCUNJTdEduWW3UtX8/Crzu4gCYpVqMKCcX4q2RsddEUIpowBvksdkz
	6GaBACrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNhB-00000004l7h-0QRJ;
	Wed, 21 Jan 2026 02:11:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNh8-00000004l7M-1UTU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 02:11:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FBD943DB7;
	Wed, 21 Jan 2026 02:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A20DC16AAE;
	Wed, 21 Jan 2026 02:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768961501;
	bh=/KGdhDaKaLBJN6yZlpLTZ1ZclR4grZLUB70QioIqzqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JmuJmz9ne2giYJgM05lbIVAzQnrqRB6rgNu6X1zj4EbT9rnhG1hqyFu+EBKmuKRQP
	 eU668ym8IXwTvFEDAz7kz+p26tFNneupjsiJdyY6sIalr5Fa6BJ7s23aEcL2hY8OY0
	 vU991IsPI+vUmnPHT5wNraIMNh4LZ8KTOEPcMG6EdzkSK8cA+lZnSdc+wKB3S7p5Pv
	 z6z+1LGle9Jzwi5lOorBhCAB2j/x4kj4o5kP/Z7oUEuL9yBomD7IY2tcI0PL6NDMjK
	 lrIniiMpO4RMq024RDeqq2NV9XF2ufGIIJYGysjfjMiQtLSk1zSYEeFqzR+2avYMmu
	 Kv4XK3xtDWGfg==
Date: Tue, 20 Jan 2026 20:11:40 -0600
From: Rob Herring <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	luca.ceresoli@bootlin.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v9 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <20260121021140.GA1677576-robh@kernel.org>
References: <20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de>
 <20260115-v6-18-topic-imx93-parallel-display-v9-1-2c5051e4b144@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-v6-18-topic-imx93-parallel-display-v9-1-2c5051e4b144@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_181142_434748_24DBBDCD 
X-CRM114-Status: GOOD (  16.11  )
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

On Thu, Jan 15, 2026 at 04:24:51PM +0100, Marco Felsch wrote:
> From: Liu Ying <victor.liu@nxp.com>
> 
> i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Document the Parallel Display Format Configuration(PDFC) subnode
> and add the subnode to example.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> [m.felsch@pengutronix.de: port to v6.18-rc1]
> [m.felsch@pengutronix.de: add bus-width]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 78 ++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> index 34aea58094e55365a2f9c86092f637e533f954ff..d828c2e82965c7a4cd69a67136047d83c96b0a35 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> @@ -40,6 +40,58 @@ properties:
>      minItems: 8
>      maxItems: 10
>  
> +  dpi-bridge:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - nxp,imx91-pdfc
> +          - nxp,imx93-pdfc

Looks like there's a register for this at 0x60. That should be a 'reg' 
entry in the DT.

