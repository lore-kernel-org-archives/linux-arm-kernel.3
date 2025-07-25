Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A86FC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 23:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azovglNcrMU+CRv7+Depb5OtDRidVSFmz3U73JO1HOI=; b=YpbG1ZhXPRJ27REa09k94Qaxry
	ittBqkkSKlTj3i6B2RHPROtSEmZKm8MDd0+lTHMYKloDWENnxT87mlPoR6+lBiz7Oa+d3HMY2wHiM
	zosJGtIOZvWOUEUwdzAYg8yiNwPMdZZ4ZZPojUmid9HhOSyQQBpgdVqUN0upp6t9vFnWPNbPRwU1Y
	T7//4sUKwjbk08L51Ksymu2rUV3xFk3f2hEtbUzvjbBXVQahKM7R7edgppH8VFPORRITpzrhm6As2
	3XevuvxDvq9Yi1iB7fUIFm6xheICJNRfMek72dt+Fqa88+DzaTjH6eaeyzQxs2HYZBSclkV+49Dcc
	OQxZwXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRlb-0000000ArGe-1W54;
	Fri, 25 Jul 2025 23:23:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRdV-0000000AqPa-0ZyE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 23:15:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A48E145DB4;
	Fri, 25 Jul 2025 23:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612B9C4CEE7;
	Fri, 25 Jul 2025 23:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753485332;
	bh=hvysnKO9pk62IKH1vrOE7jWkruaWvZGK3SjRB3Cjdno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TfNpZePxnd3pa2g1S5Gz0JGpU/ClFo5/Jt7w7fxfk23PQQY6NZUKiONCrMOiAj65h
	 B4R19nmEoz6+Cnm/nPZG8/EwEhdZdeC0Ogo9n7eA3KkKkmGqURGPNMgtrXCNcuC8vC
	 Bl8n2JwKcTtCLUYs0lVjv7LZKVn3W97gx7/XyKjOXTFnwg0lxswO3UmmE8KRol516S
	 kjn8Ho1cKrXIBpeiNW46ZBdxPt1NyirIhG3VmQoyLJ0kpIBKJqKxDA8bRQ4/v6cRK/
	 14Wosw/fWafAHvDy07O6Zzgcjl1Y4lfCrDvo3pFvKoSg7+CnT4DWuxhQY9SoJBK7UU
	 jHWxP9wKJ7Zpg==
Date: Fri, 25 Jul 2025 18:15:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Dan Robertson <dan@dlrobertson.com>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Alexandru Lazar <alazar@startmail.com>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	linux-iio@vger.kernel.org,
	Lucas Stankus <lucas.p.stankus@gmail.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	David Lechner <dlechner@baylibre.com>,
	Stefan Popa <stefan.popa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Ceclan Dumitru <dumitru.ceclan@analog.com>,
	Dragos Bogdan <dragos.bogdan@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Gross <agross@kernel.org>,
	Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Andreas Klinger <ak@it-klinger.de>,
	Andy Shevchenko <andy@kernel.org>, devicetree@vger.kernel.org,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	David Heidelberg <david@ixit.cz>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: iio: adc: samsung,exynos-adc: Use
 correct IRQ level in example
Message-ID: <175348533136.2012943.1681778116126548009.robh@kernel.org>
References: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
 <20250724111345.47889-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724111345.47889-7-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_161533_192571_7CA161C9 
X-CRM114-Status: GOOD (  10.42  )
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


On Thu, 24 Jul 2025 13:13:48 +0200, Krzysztof Kozlowski wrote:
> The interrupt line to GIC is IRQ_TYPE_LEVEL_HIGH, so use that instead of
> "none".  Also replace the hard-coded GIC_SPI flag.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml    | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


