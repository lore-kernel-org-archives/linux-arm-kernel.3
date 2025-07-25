Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DF9C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 23:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8e8Q+sx2giWX22QPG1yhHFX8JdjnWxcGX4grFRwX1dc=; b=GMnGv+dwEOb1XA6HKZZtEo0zTI
	D4Nj/XKn2nlzHPbtpwMKKP5PrjTiPjR3dkJbzSCUFseuDO4voQz/4qERvPglh6b44Cv4lA5e2Xl+O
	qyiXeo0Qj7JUGs/DrCrExsz4pmABptW8/s+hfhq4lOfHgG+4rNU0OCClzTKlk4PfRK0mGy7CGU44X
	5P9aWEY6gbmZ+WUth3k39H5xW7n1zKlB/46462r47LliPTvNXTDw7wGD+CnCmxjFjd2nPDpGJSkU5
	MklfAC0yvASvJwpNZgY+Ii5mwwUk70erlPO+1FnmrTDwZm9t7qStykG4D3npaAr0TGGW+PB0Cp60J
	d+e5aoJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRjA-0000000Ar1a-2EeF;
	Fri, 25 Jul 2025 23:21:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRcf-0000000AqIW-3wA1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 23:14:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0AE3B601DC;
	Fri, 25 Jul 2025 23:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80847C4CEF4;
	Fri, 25 Jul 2025 23:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753485280;
	bh=NmAsnmCYqTaZnPZEOZ2cvwYlrb+q1nS2jdfYn0FBcZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxsLWjgGEQLyvqCxSJogxJyY4OuDHfQFYsV3vCthu3iHmxl+jx1+NtapM2OHKNcgz
	 6Wk+nzVGnRZXBZ2cIipgokG7EuSj9+Gh5ml2OMZtU+8w0h+05nbz4+j+XCCogQmpe1
	 GUtOUQzN3185vOKaqk0cwP84MpGpsyXga8cXF0GO+B58fp4TE5A7HejDc/eBpu9kqe
	 6SjzAqM2oFzge2SCcM+J33Jzx8mGL7CCglG1fDuJbAGnnZsBSaaWSdwJG/c4hsdPyM
	 Ib/eeh4wpB2dj8lWlsvQMJcUaPyWb5etNPwSgNqC9Vv6fRi1a45FkSul51yvD+YmbD
	 tMpL63GBPGFwQ==
Date: Fri, 25 Jul 2025 18:14:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andreas Klinger <ak@it-klinger.de>,
	Dan Robertson <dan@dlrobertson.com>,
	Lucas Stankus <lucas.p.stankus@gmail.com>,
	Alexandru Lazar <alazar@startmail.com>,
	linux-samsung-soc@vger.kernel.org,
	Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Andy Shevchenko <andy@kernel.org>,
	Stefan Popa <stefan.popa@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Ceclan Dumitru <dumitru.ceclan@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dragos Bogdan <dragos.bogdan@analog.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: iio: adc: Replace hard-coded GPIO/IRQ
 flag with a define
Message-ID: <175348527925.2011912.6805260803610107718.robh@kernel.org>
References: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
 <20250724111345.47889-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724111345.47889-6-krzysztof.kozlowski@linaro.org>
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


On Thu, 24 Jul 2025 13:13:47 +0200, Krzysztof Kozlowski wrote:
> For readability use known defines instead of hard-coding GPIO or
> interrupt flag.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml | 2 +-
>  Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


