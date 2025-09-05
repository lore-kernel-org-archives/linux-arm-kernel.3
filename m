Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36EACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjbPe83RwJGFN3hjb0O/L2P6XJeoeb92t7y9A9spJMU=; b=dEBQ6XSVNW286e3giktRT1RayT
	o4Qzhe29tUic/vBGpnXNJ+FcSm1Hh1EUv9kQJA31NL0Vrg7Y46OggTJO+tNAgxixnDbe5KGFpulL/
	RQudRH1PU91YPrD1fp+Tj7U0VdkpKKTOrBAxoK2vi/a6fVRoZ6pArEAehLbwmBjHbwgMNz79WJbWQ
	mV9oRUSKQRoXgXG0qA1ZuqMVuqYsize4QlQ9kgxGrOk6+p5ZSNhRBcJ5umAHK8TMb1+Qeqm0v2Voi
	95e2xgCThv2UARLUrhqQq70FlPpWlCvsUU3Y9QXkIomVI9qwzUIc2oFDlR4LVrzN+X6IpZPWSiDIU
	YEuNi8Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugZb-00000005Yhs-0vBY;
	Sat, 06 Sep 2025 00:14:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uufpg-00000005GOE-20tt;
	Fri, 05 Sep 2025 23:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 686B7601AE;
	Fri,  5 Sep 2025 23:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E0DC4CEF1;
	Fri,  5 Sep 2025 23:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757114823;
	bh=+q3cJLW4otQ2y4PEgtHdwQImmYWRyLrAZYTgi0FPf5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dpcAwemYtcEIHan3qBfZZopUwYOEZCyeLdssSnC7MNMQTp3F74FARA0sBcr2GAmvG
	 CJoYl4PAMa9ce4p3o+nVor8SwrFhakyXa4ew02lwPn9wiY4DuLJx5l662TBEpJ/rSd
	 3PshfvcwV8S3h8cZ9/kg2FbPNJYlfyI8pNj+TzzLoYi5sKcUyJWvnCQ4WgIdr0QKVd
	 Ilr90JShPKByhPGI8Y5akagsIHMp85A03mB+t+QoCw2mCiSBwtCvQ3uGpXtAraytX0
	 gU+zlYGLaJXMd807v532Zx2qL4HiUqyT2p7n8st6BRc6Vcdl/fNmy/TzjNdozNqqLw
	 qspoXkHKK/Ikg==
Date: Fri, 5 Sep 2025 18:26:57 -0500
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
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
Message-ID: <20250905232657.GA1497794-robh@kernel.org>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-1-7b6c2d6be221@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-mt8196-gpufreq-v1-1-7b6c2d6be221@collabora.com>
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

On Fri, Sep 05, 2025 at 12:22:57PM +0200, Nicolas Frattaroli wrote:
> The Mali-based GPU on the MediaTek MT8196 SoC is shackled to its concept
> of "MFlexGraphics", which in this iteration includes an embedded MCU
> that needs to be poked to power on the GPU, and is in charge of
> controlling all the clocks and regulators.
> 
> In return, it lets us omit the OPP tables from the device tree, as those
> can now be enumerated at runtime from the MCU.
> 
> Add the mediatek,mt8196-mali compatible, and a performance-controller
> property which points to a node representing such setups. It's required
> on mt8196 devices.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 36 +++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index a5b4e00217587c5d1f889094e2fff7b76e6148eb..6df802e900b744d226395c29f8d87fb6d3282d26 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - enum:
>                - rockchip,rk3588-mali
> +              - mediatek,mt8196-mali
>            - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
>  
>    reg:
> @@ -53,6 +54,13 @@ properties:
>    opp-table:
>      type: object
>  
> +  performance-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle of a device that controls this GPU's power and frequency,
> +      if any. If present, this is usually in the form of some specialised
> +      embedded MCU.

We already abuse power-domains binding with both power and performance. 
There's a performance-domain binding too, but only used on one platform 
for CPUs (Mediatek too IIRC). Or perhaps you could just point to an 
empty OPP table. I don't think you have anything new here, so don't 
invent something new.

Rob

