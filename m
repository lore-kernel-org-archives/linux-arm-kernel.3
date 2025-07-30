Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218EEC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 00:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pQ4TzcrHmcxlG839ulctgQcnl1iIkD2FDk9gnChis8=; b=YAUybrsJXCMMkcxPrldRb82BW7
	QFD8Z1rcaRy/fhOheHENOniHRBqKEvG3do0JGAAZ0iUZw8P9PzOS2OelnV23TB3ojz0M4Dzh2GWrl
	hhuafHGSlOxxOQWESdXE3Sprx8vI6b4yi7DxGSuPrCyEi4YXZ45oSBhKPB+ulZYBbZDl/0S//jSaz
	uw/ok4oYqBUyKAyb83Ic07VZOftbdXijzfFx056L3UFfOJefiY1JVrTisus60Z8DvFdIrEonw/uso
	PqLpHssKZoo0tyDbwiwL7l0DNbT0GzOD70pqhxJ+1gyXa8YHSckBjk3/Cwx5BbJbGVXb9YtE+yJ56
	s7Z+PbzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGii-00000002e6O-29gT;
	Thu, 31 Jul 2025 00:00:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGfG-00000002dds-3QDi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 23:56:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43467601DC;
	Wed, 30 Jul 2025 23:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36B9C4CEE3;
	Wed, 30 Jul 2025 23:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753919814;
	bh=QZsdIcHWxpI9QDh/Acp10J22Rwmw8P/g++NrOm4SvtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t2kOSmy8UhjztMdU71mBZlIUrHgHNdE1WicfZDCRKVDj7r5Gr0Fa+cFH+0t7sYjqe
	 0ri4igYvUEyFp35/tO5cNqpvtl8w5CF6GVDv+z9SJSCunjeJl8DqDtURRKLv7c0kbM
	 xTGc/JyWp3gbJBMQm6WNO55NVYvPVqWbtyM19f2cNwjs0b5kztu3DeMOHa6xA4f6nN
	 2grq5qZ4F37/qft/lbiVpO5apcljhUiSdFYbQrFI+yNc4GoMAKMGMx2CDQpB/IHa8W
	 5BIpdQxmGi6JJTwUda2/osXLUwaPh1nlkpYRSvjUFbzJJZZ9mXoKFxMcsuOgrnNmF8
	 hY9yZIOO+xKwg==
Date: Wed, 30 Jul 2025 18:56:53 -0500
From: Rob Herring <robh@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
	Benoit Parrot <bparrot@ti.com>, Lee Jones <lee@kernel.org>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, thomas.petazzoni@bootlin.com,
	Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: ti,am65x-dss: Add clk property
 for data edge synchronization
Message-ID: <20250730235653.GA1914482-robh@kernel.org>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
 <20250730-fix-edge-handling-v1-1-1bdfb3fe7922@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-fix-edge-handling-v1-1-1bdfb3fe7922@bootlin.com>
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

On Wed, Jul 30, 2025 at 07:02:44PM +0200, Louis Chauvet wrote:
> The dt-bindings for the display, specifically ti,am65x-dss, need to
> include a clock property for data edge synchronization. The current
> implementation does not correctly apply the data edge sampling property.
> 
> To address this, synchronization of writes to two different registers is
> required: one in the TIDSS IP (which is already described in the tidss
> node) and one is in the Memory Mapped Control Register Modules (added by
> the previous commit).
> 
> As the Memory Mapped Control Register Modules is located in a different
> IP, we need to use a phandle to write values in its registers.

You can always just lookup the target node by compatible. Then you don't 
need a DT update to solve your problem.

> 
> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> ---
> 
> Cc: stable@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 361e9cae6896c1f4d7fa1ec47a6e3a73bca2b102..b9a373b569170332f671416eb7bbc0c83f7b5ea6 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -133,6 +133,12 @@ properties:
>        and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
>        interface to work.
>  
> +  ti,clk-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to syscon device node mapping CFG0_CLK_CTRL registers.
> +      This property is needed for proper data sampling edge.
> +
>    max-memory-bandwidth:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> 
> -- 
> 2.50.1
> 

