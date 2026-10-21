Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320EC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 03:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yv3JhGH7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CKwBcAxE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qr31YWWG46E37l6UZYR2FUMOs+UNFYnsINuMkMnDBXM=; b=yv3JhGH7e1l0s4n9xPYcHqGgvJ
	c1l3q9z53n7HGM+LRS25xM/65dqKFk+vZnOU5zSEl6hsfR+VazbwuRpRRDW/AfCgjPCi2K+9b/6aL
	XqW8pzA4kmdjLnFiNfxTMhh0wJcxOu4klhj6gL3ySicbJP70iIYou6nChb9wHnF99VuKtmnutl4T0
	TJABx4If248mC3dHfaPkahSq4p3y2MPb+vXgNBZ619B+m0/Ff1CJuOR+xNrLIIJNhp4vyXZwrk14B
	eIuo3jHIQZjYoyu+JKU5KLZAHtbUWF4BZlDSL7bKmrO97OCl9m3TC6lw8deIoZfAgFF813/8fO3Lk
	0LpCGCCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJN8p-0000000B1F7-08q4;
	Wed, 21 Oct 2026 03:37:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJN8n-0000000B1Em-3e9M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 03:37:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E2A8560534;
	Wed, 21 Oct 2026 03:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FC81F000C9;
	Wed, 21 Oct 2026 03:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792553844;
	bh=Qr31YWWG46E37l6UZYR2FUMOs+UNFYnsINuMkMnDBXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CKwBcAxEK0FlqonH9i3F9j186IPNiPyiGjtvctSlnpB47FDU+qUUCvaPlO2QkLq7i
	 e8sCp9tLAegrSMoFbXXPdGxqv8m3dHAb/5evnWulq/mgO/vxha0CamzcM+tl5uAp9t
	 86dZb6M3f8yDSLlN0k31kl3KYh1C/vbwfCT1pLmpwai9YAL8EzC1G56fc0tP2wgLJu
	 9LjifsAi0zpl3yGv/qIJYthlX4g5eQaOg+llstcB2TgOwYSFTYmp5jcYWhBOaEWBTD
	 MyQO6D813GlBaBBKgPm7FfXcalks49GWmrsL7wRz7mMlEw5W0689Dc8dR4oliXPecx
	 cQwSJJoRzylog==
Date: Tue, 20 Oct 2026 22:37:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Tero Kristo <kristo@kernel.org>, David Airlie <airlied@gmail.com>,
	LiangCheng Wang <zaq14760@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
	devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 03/14] dt-bindings: display: solomon,ssd16xx: Add
 Solomon SSD1677 controller
Message-ID: <179255384325.4089175.11513181876528998928.robh@kernel.org>
References: <20261019213726.4145532-1-devarsht@ti.com>
 <20261019213726.4145532-4-devarsht@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019213726.4145532-4-devarsht@ti.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 20 Oct 2026 03:07:15 +0530, Devarsh Thakkar wrote:
> Add solomon,ssd1677 as a compatible controller string.
> 
> The SSD1677 supports displays up to 960x680 pixels with 10-bit
> pixel-level X/Y RAM addressing. It shares the same command address
> space and GPIO interface as the SSD1683 but differs in addressing
> model, deep sleep behaviour, and initialisation sequence.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> Changes in v3:
> - Only add the solomon,ssd1677 branch, as the previous patch now already
>   uses oneOf for compatible
> ---
>  Documentation/devicetree/bindings/display/solomon,ssd1683.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


