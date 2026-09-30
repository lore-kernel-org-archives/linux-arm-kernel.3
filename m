Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B491CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5meFYk8A6OECXcbERFC8vfkK/C/8PqfInrhYe4+ifGk=; b=Rg1Xi+PQzqdMLs2nLky5cLptlL
	saWRCOgIVVqW4tRR3RnNB3sPkPYwsCvS1Rk3OXkhSUBP7TEpKBk0nB6EpfEk31Q3tdWlptuEsOxHH
	hxV82DWk7e0q4r8qpC7tIg2NOqela8hmXzLVMtLvdwd4xFDB89p+l6wm97230gvyjHHDK2VhRyTBM
	ueDJ2d3iwEiPPLSxr5HQin9tcIj1YXFCUhMkJiW3lSabk+pZdzLjJg9mK2FawBF++oPVsHHI98ZZT
	4OfhbmZquDPGFcXAjgNwOW/erSt+rUg12Dou261+o5k9CAEoPe9pUh/25cPM1MiqniyU/nJqKpG4E
	ElIuTnvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsui-00000005wPy-1s4M;
	Wed, 30 Sep 2026 11:55:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsuO-00000005wLO-3oZr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:55:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6563D40501;
	Wed, 30 Sep 2026 11:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C5A1F00893;
	Wed, 30 Sep 2026 11:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790769336;
	bh=5meFYk8A6OECXcbERFC8vfkK/C/8PqfInrhYe4+ifGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LzmNi4Daa51WDFjSoir1xbp6dOJXW+dMjTMrMdtLb43+u6E0X6pmPHDFH7bUpBdfh
	 evfZ6y5kYwH7O3rue728Rh6422nWbNsJiGvmI69G89oEhXRrych7qKgXibxv1hYKwz
	 N+vOi6fWtCQBWveRnn0uYoRqLUF0GrziA4Fv2IqQGkFGzUxZP8z6wbkTucuvvvYWMZ
	 EOKuBMTp75lPiDRgzTL0iRS7hAdnIojvWjFXz4vg2MWEbWbXGsRjab/84bbEc8egYm
	 0ud5d0aIdWGMJRYc4jSJtLPOsTKDbT2fRrbzlsxKsSmIh4M9pnwQj5Y7bum73AL2Bn
	 pI1jB9Jl9vtNw==
Date: Wed, 30 Sep 2026 13:55:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chi-Fang Li <cfli0@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v5 2/9] dt-bindings: clock: ma35d1: Document the missing
 crystal inputs
Message-ID: <20260930-asp-of-pragmatic-discussion-16abe9@quoll>
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
 <20260929-perso-ma35d1-upstream-clk-v5-2-68533e935ee4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929-perso-ma35d1-upstream-clk-v5-2-68533e935ee4@bootlin.com>
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

On Tue, Sep 29, 2026 at 04:44:45PM +0200, Miquel Raynal wrote:
> The MA35D1 clock controller takes two crystal oscillator inputs from
> the board:
> - HXT, a high-speed 24 MHz crystal for most of the system
> - LXT, a low-speed 32.768 kHz crytal for the RTC and low power modes
> 
> So far the binding was expecting a single crystal. The example named it
> HXT, but no real definition for it was given. LXT was not even
> described. In order to remain backward compatible, we will continue to
> allow either one (HXT) or two (HXT then LXT) input clocks. I propose to
> give those phandles a name to clarify what these entries expect, but I'm
> not listing the clock-names property in the required block, for backward
> compatibility. The rates are fixed by the TRM, so even if the second
> oscillator is not described, the OS can make an educated guess.
> 
> Fixes: 2f8b5eb589cb ("dt-bindings: clock: nuvoton: add binding for ma35d1 clock controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml    | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


