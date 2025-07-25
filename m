Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2DEC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 23:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tX75wxzoU5B+LtFYVhk4s+Fmn/17S7sVKi/GjMVUOmU=; b=e6XPefjBaKhao8My2bRG74YL3F
	fXgI8wWQeP62Y6GLDD87iRuy9QlSFKc8IOeHgTM2S4TJJDh3W62r05PlJeEsab4J0lTEIw1sGRKx4
	2cRKfoABy1yanUGyg1sHau1U5CE/FpKdOlr7JPILhsm7/bceEb7Uqh2GXJUtOxNj2lOh74+tMI9J7
	7o5QsrFrdVph4gHQ8O1BG1cylQU8665Nk8eoWfrPWVWpOxZM88ixzVFhIC9vC5qycC4U63kFnXnr0
	qBMd2rI9CyyyVR7NjwtyoJTaN3bFyGe2iuKehZzf/l/3fmAgUOt4XwaZxlQnC2NIB0YJGK8rowa4b
	kBIMQmEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRgk-0000000AqoF-3UJk;
	Fri, 25 Jul 2025 23:18:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRcQ-0000000AqF0-0KBy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 23:14:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C12F045934;
	Fri, 25 Jul 2025 23:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3EDC4CEE7;
	Fri, 25 Jul 2025 23:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753485265;
	bh=roilVrcSzwsI01XzOOpsXim3Xv2gE6Ixo5ZnYOtnZz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qEueuhL6kYCL3Yz1JjWLfYuYvoNzMmNVJt/7eJV6SPfst67Ma33jlz8+HCoii/5KB
	 iN2w4179PaGb4JtqRVyI+2DBaebIO9YetDoMn7rO0dkOPFrzgfbplCB7NumBk76Y3j
	 EAeKUnD3GIYxANgbp4Xve3NQmDBhqIXZzkYTf0/69Eq+SUlxdktkX94nsMiJPn8Ijz
	 ux51iwGDUXjKy7/vYi4QatVzfH6DhR4X0v+IUoLXWzn+jwem1uKvT20sYNHD1BsmFD
	 hY6W7Gm2QdL10qPWF3ig+piHTBAcOxT+uyoS5UEPZ1LuM3XoKjM+9By2PC8jjqWCnt
	 2g8Es33H/D7NQ==
Date: Fri, 25 Jul 2025 18:14:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Ceclan Dumitru <dumitru.ceclan@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Stefan Popa <stefan.popa@analog.com>, linux-iio@vger.kernel.org,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Heidelberg <david@ixit.cz>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andreas Klinger <ak@it-klinger.de>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Lucas Stankus <lucas.p.stankus@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Alexandru Lazar <alazar@startmail.com>,
	Puranjay Mohan <puranjay@kernel.org>, devicetree@vger.kernel.org,
	Stephan Gerhold <stephan@gerhold.net>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dragos Bogdan <dragos.bogdan@analog.com>,
	linux-kernel@vger.kernel.org,
	Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
	Dan Robertson <dan@dlrobertson.com>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: iio: Drop unused header includes in
 examples
Message-ID: <175348526415.2011522.8662273220330760197.robh@kernel.org>
References: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_161426_152870_0E8AB9F0 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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


On Thu, 24 Jul 2025 13:13:46 +0200, Krzysztof Kozlowski wrote:
> Drop includes of headers which example code does not use.  No functional
> impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml  | 1 -
>  Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml    | 2 --
>  Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml    | 2 --
>  Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml    | 2 --
>  Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml    | 2 --
>  Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml   | 1 -
>  Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml   | 1 -
>  Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml   | 1 -
>  Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml     | 1 -
>  Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml       | 1 -
>  Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml   | 1 -
>  Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml     | 1 -
>  Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml    | 1 -
>  Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml       | 1 -
>  Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml    | 1 -
>  .../devicetree/bindings/iio/imu/invensense,icm42600.yaml        | 2 --
>  Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml     | 2 --
>  Documentation/devicetree/bindings/iio/light/st,vl6180.yaml      | 1 -
>  .../bindings/iio/magnetometer/voltafield,af8133j.yaml           | 1 -
>  Documentation/devicetree/bindings/iio/pressure/bmp085.yaml      | 1 -
>  20 files changed, 26 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


