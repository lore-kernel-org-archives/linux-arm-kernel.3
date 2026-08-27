Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762FBC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 12:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSQGFmuwvMzM5rXdfSlgZ1DfoF/Bil2FRcC3/j+QQw4=; b=Hycw01UczGAb8qQB1XySQ5rp6C
	uzhN69y0+Sz7Ov9DMdjycBSY6I7r4JXOEdM2zYRhs9OiBAAbjsV2ghqeXM/FAfnX2Rrv/zfe/wKX8
	5w3Q6gaoGS5O5tcIiODkRblC68frXxAln8hp/Bq1VCmaGzMkS5yJMmjInBTG01ZOmGWGZalEj0xTs
	6OpdJm3H+sD3dIC4lUbZxS6cU1FJzFkozZ3rtUQsGsDaT76B3oV+LFVorsKoFY+MuaXbr1BYHmoZD
	YSTXSyRI3V3L3nHsVMAk0q/vbUz31fGLrUi9MRLDOyOJX9+3wRlgo40nhYFbzGH8Xcz9aJrE3euV5
	+ihk7log==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZZz-00000003znh-0ki9;
	Thu, 27 Aug 2026 12:51:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZZy-00000003znY-13qF;
	Thu, 27 Aug 2026 12:51:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 91B0340914;
	Thu, 27 Aug 2026 12:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DB31F00A3A;
	Thu, 27 Aug 2026 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835097;
	bh=XSQGFmuwvMzM5rXdfSlgZ1DfoF/Bil2FRcC3/j+QQw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FKAtoyXIUVjVMDEn2bJ2rLkiz0oMg6z2un6eG+WB04Mgau1KeclOVrx/+jzMdmhfC
	 AnrIP9Tsnsub67iuPDIL3qU/lNFwHldReFpB7+ysS36L8ng5D1VtE3pV9QT/NZ6TJu
	 Uq/ZE21LXMyTUIFd/ZwUHSvk6nXmiNoPxb5ZXE+9OIKxhAwcondOTo4tus0uuh46Wd
	 z0COv4vo1oIYzy8YTpqtm6RfIm52+H0xSls0tAmX8L7d80KaEpme4u3VlHjymgWtv0
	 KDpnU8xhscrfmNplLUYCFI0vque73dKOdHNal978QclZWxCjJVCXItPiCIxpKq3NYc
	 zI3h1p1Re4xKw==
Date: Thu, 27 Aug 2026 14:51:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Marek Vasut <marex@nabladev.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, Thomas Bourgoin <thomas.bourgoin@foss.st.com>
Subject: Re: [PATCH 07/16] dt-bindings: nvmem: st,stm32-romem: align
 patternProperties regex on nvmem-deprecated-cells.yaml
Message-ID: <20260827-normal-amphibian-dormouse-9f8fdc@quoll>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-7-c5e27cbc0795@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-7-c5e27cbc0795@foss.st.com>
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

On Fri, Aug 21, 2026 at 06:23:18PM +0200, Fabrice Gasnier wrote:
> Align the regex with the one used in nvmem-deprecated-cells.yaml
> ("@[0-9a-f]+(,[0-7])?$") so both patternProperties definitions apply
> to the same set of node names.
> 
> The patternProperties key only matched node names of the form
> "name@address" ("^.*@[0-9a-f]+$"). It did not match nodes using the
> extra unit-address index used to disambiguate cells sharing the same
> reg, e.g. "trim_rd_cc1@1e8,4", causing dtbs_check failures such as:

That's not a valid name, underscores are not allowed.

I don't get why this is part of USB and PHY and SoC patch, but whoever
told you, that mixing FOUR independent subsystems is fine, was wrong. It
is not fine.

Best regards,
Krzysztof


