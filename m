Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9254606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 18:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oUaTRVs7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RN5Sm/kc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IhyvZUUu/9Pqj0G5T+OOMZeqorFoP0fF5JBfpfONpxQ=; b=oUaTRVs7y/sC7JCslLbWDNBxtr
	gb8/a9ZBS31XNug0D82mcte5Kt6SaS5zX8gM1izWQqmU/N6kHwioCj7hyuBgC31G16QkFY6j1Z9Se
	b1bOsMBx0DelZnmEDFAVV4dmLAhXHKorvq8/8BjUKlxyZrTNwl+Jsym6NQz6w4lAs/gLgeWoCiEXk
	oA75rcBFJvXg2WD52J6VgZZgsumdbBA4ENJr0uir/CYz+UMtBhKUl4K5D/TtsD+8DPUDV87Zhscia
	m3642ijXIMvx6XeY6ncB9XhRJFdr9RiePUNnlMI49/+4caI+Kynh4DczfzfbhwTyQvdw4ic7fxssL
	vT8Bk+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrFJ-0000000COsp-3N7L;
	Fri, 30 Oct 2026 18:22:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMrFI-0000000COrz-40bf;
	Fri, 30 Oct 2026 18:22:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 13B04601F8;
	Fri, 30 Oct 2026 18:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFE21F000C1;
	Fri, 30 Oct 2026 18:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793384551;
	bh=IhyvZUUu/9Pqj0G5T+OOMZeqorFoP0fF5JBfpfONpxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RN5Sm/kckP5b5QiYILmF/NuxP5huXk/5np5PefaFjluRtOKBZy7ToFgK6NnazBe6z
	 kT+qDljrYb9ubutfP724x0fmPTeAkznBIhtNYeZVwHe+WGjGDkwawPQvO72BsPDbeM
	 28Ui6Juc196u/T0DzIGq78nj58bHIsWS8BAZqUk8oxZ0QSCMMPlM2R8bbE+8G+XfB6
	 w9pAICRPA07/M5048JrxtQdjbYL79wAcYQNk1x8PlNf7XWWWBGuPIs8oyLHEUJvkMI
	 HY+rLPmLlI4Ilsrl7ApBFgBmAgLmirQWkzk+/iH3+uAl4xJxwvz8RTDnW6ocPa8hKz
	 2SwgMNeXKUjIw==
Date: Fri, 30 Oct 2026 13:22:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-phy@lists.infradead.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 6/9] dt-bindings: usb: generic-ehci: Add the NSP
 compatible
Message-ID: <179338454691.1217805.11713868240616162011.robh@kernel.org>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
 <20261021172819.668120-7-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021172819.668120-7-florian.fainelli@broadcom.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 21 Oct 2026 10:28:15 -0700, Florian Fainelli wrote:
> Describe the EHCI controller in Broadcom Northstar Plus SoCs with a
> SoC-specific compatible. It needs the same FIFO threshold programming
> as other iProc EHCI controllers, which generic-ehci alone cannot select.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


