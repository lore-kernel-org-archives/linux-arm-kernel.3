Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998C0C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JZA17aHcI0IRIEiveRVYy3aeVmVhVMofUrMfE0EO3w=; b=Q0HU/DruZq7/qPe6Z/dkb/VMN2
	CtQcsSf8rFQqKbQY+59uMR8cLAc48rUyC3U8YK9JhBZVeaa0RDoJF+ljupyHRFv5OVlFW67INduTj
	ZEW0Uq8rYxAMmj63qt7iZ+pbdlAJUjDd2MkifiIrTsnp++4ifpv2Q3zCOLPaz9o3/vTSdnJdQSxOk
	wQQ9GDMu4Wdr3Xk1HBeMH4l5LY7XxuAodf+YPeAoXpgUTTpP/zgHLtwPariaMAaxMWbDvy2MIAR+t
	ygOwN3fLip6bEwSomNLsIGGf61iOJAvZZbFveOJuOmuGqUcPsrMb4GaSkT2V+RQujm02iAGovr1+x
	0bGqFhXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmwH-0000000E8ul-1eyc;
	Tue, 11 Aug 2026 13:54:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmwE-0000000E8uD-2wGC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:54:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25D93600AD;
	Tue, 11 Aug 2026 13:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95EB1F00A3A;
	Tue, 11 Aug 2026 13:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456481;
	bh=0JZA17aHcI0IRIEiveRVYy3aeVmVhVMofUrMfE0EO3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JGLfuozPTND9eWwSdd1YMCkf5wDMHWMqzqX3A10OvSKNYSnavA+xPAMEvITpisaUP
	 NbbEhGfVNf0YAxGZFIzGA7jfaVz5uv7Zz1MSFD/LnlbdPwO24oJCrrFD6u6NJDPeV4
	 q3/7Wvme4QGZ07JUy1dCUZbpZ22KM6gAMxeDxBGWetXSGiPMrxWTr7nrnVxTAtvk3g
	 XHfzbdWwpxK5aOT3FiqVVw9yqq1M1BHV3HAXNB0Apj29Bzc6L9C85iksD3vosiun3K
	 PXrosZyFreHyAxjJTvMK6G4ztVpdrDtzoP+zZzmPo2cEyz70YcZC5Kc4P8lZPYemJG
	 VfUo1/x81zMyA==
Date: Tue, 11 Aug 2026 08:54:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Radu Rendec <radu@rendec.net>, Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, Neal Gompa <neal@gompa.dev>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Janne Grunau <j@jannau.net>, Sasha Finkelstein <k@chaosmail.tech>,
	Hector Martin <marcan@marcan.st>, Thomas Gleixner <tglx@kernel.org>,
	Sven Peter <sven@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v2 8/9] dt-bindings: arm: apple: Add M4 based devices
Message-ID: <178645648045.2076922.10746333465104640376.robh@kernel.org>
References: <20260801-apple-m4-initial-devicetrees-v2-0-5cb07cc275da@cyberchaos.dev>
 <20260801-apple-m4-initial-devicetrees-v2-8-5cb07cc275da@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-apple-m4-initial-devicetrees-v2-8-5cb07cc275da@cyberchaos.dev>
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


On Sat, 01 Aug 2026 23:40:38 +0200, Yureka Lilian wrote:
> The Apple devices with the t8132 SoC (M4) are very similar to their M3
> predecessors.
> 
> In addition to the MacBook Pro and the various MacBook Air and iMac
> variants, a Mac mini is offered again with the M4.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/arm/apple.yaml | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


