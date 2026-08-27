Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2B2C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OG/i49AUF5ncN9ZquXzQyCMye6P3QPZAzJwH1vW0iXs=; b=RlpLIBQnTbnaQKeVMSr2p5ypYM
	4s4HZ7inVhkWqyPyVnLIqvyVJEgQjM8EgR3JgsTDp4wpQt+6P5lnhRzpWSIe/KHAWzp3lqzVNP85v
	goQ11pbw1jc1I92ORW/54WeHpxKy+Gqvtei9HmhpvmblsRtHfaqx/D7+3pnzXXLvmJNIHlDCewwaJ
	g2wg6Je/YNzAEDItxGzQQpeULlyHWVqfZ4su210hRMl0zRRx+syD5cDMb/Jm6YnIyb91D0PIRmH2X
	A5sWu3o1/GDwqNq02JNxiEvZ3BVEH98YBPDGbG+cNDBMw/yhhlb0HIfkAkb2GZmvX2+QL0PL+FHYi
	6eNhtYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZT2-00000003z9Q-3pRZ;
	Thu, 27 Aug 2026 12:44:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZT0-00000003z93-2k7Z;
	Thu, 27 Aug 2026 12:44:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F3F241497;
	Thu, 27 Aug 2026 12:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E858C1F000E9;
	Thu, 27 Aug 2026 12:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787834665;
	bh=OG/i49AUF5ncN9ZquXzQyCMye6P3QPZAzJwH1vW0iXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E9GyhaLHvc5qm1xe5F+LweUh5WMOvuzORzSiuUsyNLPdVi2x6c8+8QueV3zeRANI3
	 +NZ8YOu6Uw76InokvaP4phxEiT5B9dtHBAgCFnM+fYDhJJy1Es5fUX2ChNkj/rIH5z
	 /X3sBlpNqKo79r+ElV2WVt5aMeLHVeu8tXudBknO6HsgImpiY06ZFet8UT/TYziJSK
	 BzMECwXJBYSRxTKJoGS5ieJJXtVtz0w3paau347F74DJuYSqY4tW1dzjD5nmZokhb3
	 QtmJbjWDLR0TbKWMUZHtycEp3k2jwMM48WguOE3+UzH+UxnSoGpvBKoHoW1YitFOZy
	 hP2GsVd4JEayA==
Date: Thu, 27 Aug 2026 14:44:22 +0200
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
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 11/16] dt-bindings: usb: dwc3: stm32: refer to dwc3-common
Message-ID: <20260827-beige-shoebill-of-calibration-ec29ff@quoll>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-11-c5e27cbc0795@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-11-c5e27cbc0795@foss.st.com>
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

On Fri, Aug 21, 2026 at 06:23:22PM +0200, Fabrice Gasnier wrote:
> Add reference to the dwc3-common bindings, used on stm32mp25.
> This is a temporary update, as it depends on Marek's series [1]. This

Why should dependency be put into the commit log? How does it matter
after this gets merged?

> should be dropped in later series revision.
> It's a precursor to validate further DT addition on USB and Type-C, with
> usb-role-switch properties.
> 
> [1] https://lore.kernel.org/linux-phy/20260816213849.1044073-6-marex@nabladev.com/
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml | 3 +++

There is no such file. Why aren't you reviewing patches on the lists but
instead create inter-patch-chains?

Best regards,
Krzysztof


