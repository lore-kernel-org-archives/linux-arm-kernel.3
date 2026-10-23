Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B892360A2609
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lltPYZ86;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SAMiazq0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tlePnP3GE78vbgKi5tLSYix5xa2MNZBwLKVMInUWwZ8=; b=lltPYZ862rtnxLccCZQfblpypo
	UOoRRWe8rzfkCr/4XeHEdhPtSFV3uYUEr7GmUcgwoAH1tT7VBOBRTHHDAYrNUef5qCop8ER7BW8Of
	JSZLVwWRdj7pw6481GfOggruA3mEcV6S7ORgGXmMxRMEEdquUyg9rV6hO9veoOoBWCoMS/MMK1lS0
	t4Sa6nmaDiSmqlqk2gBwW0mBelbThbDq0X+F57Lz3nUlYjcDem2MyHw/Le7AEgh782j/w+zOFFI9G
	EnSw0a05UnwtllP0Ei8dxiJNcY+tJySAnME06nOSLKR5W5pTUdkPm+IaBZe1RW0LO7nErJKLHlEzU
	0QIto1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBZT-0000000G1go-171K;
	Fri, 23 Oct 2026 09:28:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBZR-0000000G1ey-18il
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:28:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DA6FB602C3;
	Fri, 23 Oct 2026 09:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14DC1F01825;
	Fri, 23 Oct 2026 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792747694;
	bh=tlePnP3GE78vbgKi5tLSYix5xa2MNZBwLKVMInUWwZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SAMiazq0h/d4fr7VYelFNOoHhHhBYWz8XP8e8Tkhw420EvwAw9Umtlm16H1x+YAm1
	 yspCfKmJlVDvuuz+DX8MhDfHgXkciawgUp/iHUmny3Ge3LUZy0rWnXMJwC5RgA5TxB
	 QheRdXq+kNXoukztdjuAkaUr/0vjNROT5NeJXX1hZ50T1Jh6GuYmkIWXlufDKw1BFA
	 gto3ZRZcrjAX0O/8e0/1jIxI5jHnhFSvd2hH0Fx7JqNAUeOWUjzz8U5xO2ED16NYRk
	 YAYnDCRbwQ5FZhjYoV+D188RwVwcg9lao1puIsFDtOCYhw4tRTxaKYaHz4QL73xdHO
	 Oo/18fZpTQD2A==
Date: Fri, 23 Oct 2026 11:28:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Robert Chiras <robert.chiras@nxp.com>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: lcdif: add compatible string for
 i.MX8QXP and i.MX8DXL
Message-ID: <20261023-uppish-invincible-chinchilla-cf8a47@quoll>
References: <20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com>
 <20261020-dxl_lcdif-v3-1-adc944659e14@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261020-dxl_lcdif-v3-1-adc944659e14@nxp.com>
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 04:12:51PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> i.MX8QXP and i.MX8DXL have lcdif, which back compatible with i.MX6SX. Add
> front compatible string "fsl,imx8dxl-lcdif" and "fsl,imx8qxp-lcdif", which
> fallback to "fsl,imx6sx-lcdif".
> 
> Required power-domains for both. Required 3 clocks and clock-names.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


