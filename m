Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863DCC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXeIsx4F2NXhDj0SmGBNF/s83kdFWuovTemqnjZNmN0=; b=d+x7hCe6dWljfEbGXnYyIu7b/J
	0goNfGkRtR4KAoE+h55Zwqa3aztqzKQXB3f4qd5YF9h9JMYOtjJMvkP6n+wrVlJu1SGxO48v+82CG
	EmVq8kJJYvperRqc1hCxxkjM2VKhgRrczgk2dgzmUIIFm2u86h9dJLxPt5QZKgHZoathmDoZcxbWE
	RsxQzbGi9O9qU4bJN8IM3ECHq4EFuxliAjlFZHNMqqShI0N8FpP+bFttCv/6M+a4U7gfV9iNDIDnm
	TCBHxwElMjHyHHcQomyqdU19fwZqqlNAVg16RYo0oOpf8+RH0BCz1tzf01ZH9w68imRVDJzTcDxnD
	f8/2NOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOO-00000007bZt-1NCp;
	Thu, 24 Jul 2025 13:53:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueuA9-00000007LGH-1JPM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 11:31:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B4D15C64DE;
	Thu, 24 Jul 2025 11:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65C2C4CEED;
	Thu, 24 Jul 2025 11:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753356660;
	bh=tZJLscCqA8Q9oa625+lNcp1oIJSRRSVUd2ToPL84ReM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R6aNhcAM77Ul39OMm/QyrnbykO5KFV2b1iRlNzIrWitODpTdfwqfFzOdjZxwQ1xQE
	 sI65xFztuHuSGZUFX3391fN6Uk+7V+EJf8thLTz847WjW6688DayZ97Gj9ZmbBrOj5
	 eTWERg+kICVsu3cTu2Kep0hw/kcphAoQX7X4Wyh9kmmz8mqwbKQhlNw8stWgRJdsg7
	 msdMhsVlfm7wzy/h5GlRy3/9XBY21zATTNj2zB7YCZ0/tZYTR0FUSou5jcceKM8JH7
	 +oQxatV3zgCm1j/hdD3OAPiemIZRIa4r7QJGJ7+lTbAMQOehTB2xOm/3pO1rpG1B6G
	 yi/JsnKoIc84g==
Date: Thu, 24 Jul 2025 12:30:46 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, David
 Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lucas Stankus <lucas.p.stankus@gmail.com>, Puranjay
 Mohan <puranjay@kernel.org>, Dan Robertson <dan@dlrobertson.com>, Marcelo
 Schmitt <marcelo.schmitt@analog.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Dragos Bogdan <dragos.bogdan@analog.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, =?UTF-8?B?T25k?=
 =?UTF-8?B?xZllag==?= Jirman <megi@xff.cz>, Alexandru Tachici
 <alexandru.tachici@analog.com>, Stefan Popa <stefan.popa@analog.com>, Linus
 Walleij <linus.walleij@linaro.org>, Stephan Gerhold <stephan@gerhold.net>,
 Ceclan Dumitru <dumitru.ceclan@analog.com>, Alexandru Lazar
 <alazar@startmail.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, Angelo
 Compagnucci <angelo.compagnucci@gmail.com>, Mike Looijmans
 <mike.looijmans@topic.nl>, Manivannan Sadhasivam <mani@kernel.org>, Peter
 Meerwald-Stadler <pmeerw@pmeerw.net>, Andreas Klinger <ak@it-klinger.de>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: iio: Drop unused header includes in
 examples
Message-ID: <20250724123046.4eced56f@jic23-huawei>
In-Reply-To: <d8be9f32-e78d-4a2d-8ab3-3c7d0bca4e3b@ixit.cz>
References: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
	<d8be9f32-e78d-4a2d-8ab3-3c7d0bca4e3b@ixit.cz>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_043101_442218_55B420AD 
X-CRM114-Status: GOOD (  17.52  )
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

On Thu, 24 Jul 2025 13:19:58 +0200
David Heidelberg <david@ixit.cz> wrote:

> Reviewed-by: David Heidelberg <david@ixit.cz>

I'm going to take the view these are utterly uncontroversial and pick them
up now (I'm trying to clear my review backlog).

Applied to the testing branch of iio.git which will be rebased on rc1
(so I can easily add tags etc)

Jonathan

> 
> On 24/07/2025 13:13, Krzysztof Kozlowski wrote:
> > Drop includes of headers which example code does not use.  No functional
> > impact.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >   Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml  | 1 -
> >   Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml    | 2 --
> >   Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml    | 2 --
> >   Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml    | 2 --
> >   Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml    | 2 --
> >   Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml   | 1 -
> >   Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml   | 1 -
> >   Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml   | 1 -
> >   Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml     | 1 -
> >   Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml       | 1 -
> >   Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml   | 1 -
> >   Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml     | 1 -
> >   Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml    | 1 -
> >   Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml       | 1 -
> >   Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml    | 1 -
> >   .../devicetree/bindings/iio/imu/invensense,icm42600.yaml        | 2 --
> >   Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml     | 2 --
> >   Documentation/devicetree/bindings/iio/light/st,vl6180.yaml      | 1 -
> >   .../bindings/iio/magnetometer/voltafield,af8133j.yaml           | 1 -
> >   Documentation/devicetree/bindings/iio/pressure/bmp085.yaml      | 1 -
> >   20 files changed, 26 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml
> > index 5887021cc90f..3dc973b98f81 100644
> > --- a/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml
> > +++ b/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml
> > @@ -37,7 +37,6 @@ unevaluatedProperties: false
> >   
> >   examples:
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       spi {
> >           #address-cells = <1>;
> > diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml
> > index 0c5b64cae965..3a8c69eecfde 100644
> > --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml
> > +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml
> > @@ -57,7 +57,6 @@ unevaluatedProperties: false
> >   
> >   examples:
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       i2c {
> >           #address-cells = <1>;
> > @@ -73,7 +72,6 @@ examples:
> >           };
> >       };
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       spi {
> >           #address-cells = <1>;
> > diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > index 84d949392012..a23a626bfab6 100644
> > --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > @@ -56,7 +56,6 @@ unevaluatedProperties: false
> >   
> >   examples:
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       i2c {
> >           #address-cells = <1>;
> > @@ -72,7 +71,6 @@ examples:
> >           };
> >       };
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       spi {
> >           #address-cells = <1>;
> > diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml
> > index c07261c71013..f39e2912731f 100644
> > --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml
> > +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl355.yaml
> > @@ -58,7 +58,6 @@ unevaluatedProperties: false
> >   
> >   examples:
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       i2c {
> >           #address-cells = <1>;
> > @@ -74,7 +73,6 @@ examples:
> >           };
> >       };
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       spi {
> >           #address-cells = <1>;
> > diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
> > index 62465e36a590..88aa67bf2280 100644
> > --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
> > +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
> > @@ -37,7 +37,6 @@ unevaluatedProperties: false
> >   
> >   examples:
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       i2c {
> >           #address-cells = <1>;
> > @@ -52,7 +51,6 @@ examples:
> >           };
> >       };
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       spi {
> >           #address-cells = <1>;
> > diff --git a/Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml b/Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml
> > index 457a709b583c..85c9537f1f02 100644
> > --- a/Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml
> > +++ b/Documentation/devicetree/bindings/iio/accel/bosch,bma255.yaml
> > @@ -107,7 +107,6 @@ examples:
> >           };
> >       };
> >     - |
> > -    # include <dt-bindings/interrupt-controller/irq.h>
> >       spi {
> >           #address-cells = <1>;
> >           #size-cells = <0>;
> > diff --git a/Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml b/Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml
> > index 8723a336229e..c5fedcf998f2 100644
> > --- a/Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml
> > +++ b/Documentation/devicetree/bindings/iio/accel/bosch,bma400.yaml
> > @@ -40,7 +40,6 @@ additionalProperties: false
> >   
> >   examples:
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       i2c {
> >         #address-cells = <1>;
> > diff --git a/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml b/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml
> > index f64d99b35492..53de921768ac 100644
> > --- a/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml
> > +++ b/Documentation/devicetree/bindings/iio/accel/kionix,kxsd9.yaml
> > @@ -57,7 +57,6 @@ examples:
> >           };
> >       };
> >     - |
> > -    # include <dt-bindings/interrupt-controller/irq.h>
> >       spi {
> >           #address-cells = <1>;
> >           #size-cells = <0>;
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml
> > index ddec9747436c..705adbe88def 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml
> > @@ -93,7 +93,6 @@ unevaluatedProperties: false
> >   
> >   examples:
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       i2c {
> >           #address-cells = <1>;
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml
> > index 21ee319d4675..62d906e24997 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7173.yaml
> > @@ -379,7 +379,6 @@ unevaluatedProperties: false
> >   examples:
> >     # Example AD7173-8 with external reference connected to REF+/REF-:
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >   
> >       spi {
> > diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
> > index c28db0d635a0..b9dc04b0d307 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
> > @@ -278,7 +278,6 @@ examples:
> >     - |
> >       #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
> >       #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
> > -    #include <dt-bindings/interrupt-controller/irq.h>
> >   
> >       pmic {
> >           #address-cells = <1>;
> > diff --git a/Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml b/Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml
> > index 2a8ad4fdfc6b..f0a1347ba4db 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/rohm,bd79104.yaml
> > @@ -50,7 +50,6 @@ unevaluatedProperties: false
> >   
> >   examples:
> >     - |
> > -    #include <dt-bindings/interrupt-controller/irq.h>
> >       spi {
> >           #address-cells = <1>;
> >           #size-cells = <0>;
> > diff --git a/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml b/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml
> > index 775eee972b12..044b66a3b00c 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/ti,adc128s052.yaml
> > @@ -44,7 +44,6 @@ unevaluatedProperties: false
> >   
> >   examples:
> >     - |
> > -    #include <dt-bindings/interrupt-controller/irq.h>
> >       spi {
> >           #address-cells = <1>;
> >           #size-cells = <0>;
> > diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
> > index bf5a43a81d59..71f9f9b745cb 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
> > @@ -59,7 +59,6 @@ unevaluatedProperties: false
> >   
> >   examples:
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       spi {
> >           #address-cells = <1>;
> > diff --git a/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml b/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml
> > index 4cacc9948726..3a725ece7ec4 100644
> > --- a/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml
> > +++ b/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml
> > @@ -44,7 +44,6 @@ unevaluatedProperties: false
> >   
> >   examples:
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       spi {
> >           #address-cells = <1>;
> > diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
> > index d4d4e5c3d856..119e28a833fd 100644
> > --- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
> > +++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
> > @@ -74,7 +74,6 @@ unevaluatedProperties: false
> >   
> >   examples:
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       i2c {
> >           #address-cells = <1>;
> > @@ -91,7 +90,6 @@ examples:
> >           };
> >       };
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       spi {
> >           #address-cells = <1>;
> > diff --git a/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml b/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
> > index 688100b240bc..2930b3386703 100644
> > --- a/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
> > +++ b/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
> > @@ -47,7 +47,6 @@ unevaluatedProperties: false
> >   
> >   examples:
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       i2c {
> >           #address-cells = <1>;
> > @@ -63,7 +62,6 @@ examples:
> >           };
> >       };
> >     - |
> > -    #include <dt-bindings/gpio/gpio.h>
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       spi {
> >           #address-cells = <1>;
> > diff --git a/Documentation/devicetree/bindings/iio/light/st,vl6180.yaml b/Documentation/devicetree/bindings/iio/light/st,vl6180.yaml
> > index 27c36ab7990d..8598fb631aac 100644
> > --- a/Documentation/devicetree/bindings/iio/light/st,vl6180.yaml
> > +++ b/Documentation/devicetree/bindings/iio/light/st,vl6180.yaml
> > @@ -32,7 +32,6 @@ required:
> >   
> >   examples:
> >     - |
> > -    #include <dt-bindings/interrupt-controller/irq.h>
> >       i2c {
> >           #address-cells = <1>;
> >           #size-cells = <0>;
> > diff --git a/Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml b/Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml
> > index b6ab01a6914a..ed42dc5afb99 100644
> > --- a/Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml
> > +++ b/Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml
> > @@ -44,7 +44,6 @@ additionalProperties: false
> >   
> >   examples:
> >     - |
> > -    #include <dt-bindings/interrupt-controller/irq.h>
> >       #include <dt-bindings/gpio/gpio.h>
> >       i2c {
> >           #address-cells = <1>;
> > diff --git a/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml b/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
> > index 706b7e24f182..b9ea37317b53 100644
> > --- a/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
> > +++ b/Documentation/devicetree/bindings/iio/pressure/bmp085.yaml
> > @@ -109,7 +109,6 @@ examples:
> >       };
> >     - |
> >       # include <dt-bindings/gpio/gpio.h>
> > -    # include <dt-bindings/interrupt-controller/irq.h>
> >       spi {
> >           #address-cells = <1>;
> >           #size-cells = <0>;  
> 


