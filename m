Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824BBC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AC1V7c4WU6arvaHg1fiICTCR6GKg0EaeyLEpLHxpNDY=; b=pvz0b3i+kth/zjj2i3oVr7XlYE
	wALXawdoRWq1DB9YtbBhIxpA0LjEBFRarNiiUAnHWjSEAmJu/TtpBVZf+noiqfd1LSsUD1uej5GYa
	lcrFqwYi9g5F8iEHvLzuLoJWy12Am4nQcLZJ0zs3htk/iG+ixjl4bkI7jeDst1ezbJz/k5a2UUiSm
	fVbdI2wMtwMy4LNFrve8zj/VmhWpBfCJDNdpwhnuNK26uIYqsZXd4UaPfEaiWKCqMfgb6v3MkVbO6
	dmCwOz6dNjqrQoWk6GBROXJMx+8DE+SGjiIQaXh7ZZYQ3+Ny2ZCQ4VTWnh0tBh6cyKqkW4pvgrHR3
	B9TCdl/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PDb-00000008nqs-3YGT;
	Wed, 23 Sep 2026 15:49:11 +0000
Received: from mail-ej2-x0c.google.com ([2a00:1450:4864:34::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PDY-00000008nq9-2tJQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:49:10 +0000
Received: by mail-ej2-x0c.google.com with SMTP id a640c23a62f3a-c2a1a631f6aso134743866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790178547; x=1790783347; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AC1V7c4WU6arvaHg1fiICTCR6GKg0EaeyLEpLHxpNDY=;
        b=PkkqW8Qfj19uidKDOHUNv+22rMa7NYrsKkW4g5EcAoFEw9IOvPGIm5ATOOnQGKYqIG
         ts4cud8Vmzpov/4U8Sz7QFt+HaS2zJ5/K2whWSh3Hna7mP5T4TCA2WUv/GHrmbxJpfup
         lEwOtvdqryqUZoFVexAtagioVQZnaQLeIobE54UvSykNZQOenGDK25ISk1KNIK4Topyl
         MC37H3ncXnccCb3lDP5zuSlLVaLUGLdceHVRDkuIvqwCrtBTQkTotgQ8rnh1N/4pVUNg
         Mb/r4dYhpEX1Uu0wW5Xx0pmtQrSTD+jVCKbAfQOu6hwi4TIUeozo6J4/HvkloHV7riaJ
         EviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178547; x=1790783347;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AC1V7c4WU6arvaHg1fiICTCR6GKg0EaeyLEpLHxpNDY=;
        b=tbtuk6cvSX1+t/PA7x0ZeLy4ttPPGzAyhalnQWJFXDww+nKpg6UfbqK9s2IHSM9/Xe
         0wIBzwFefJFCzAhjb2VOvCV636MUUoI4rQ649Zp0HYPyJhZiB8PMu26eaAZ9OQYJQ0Cp
         aV1N6UsoNoOpi6nPvFfkScxCE84pqLY6J+jl0eGBn6SprhyWDV207lfajKNinoMc3NXE
         Mlh5B5JKGTiiXT169i4rUiJwKZLYGoFsa/OE71CuUFpxoBpMpprd1fLJD//osoxzTyqy
         vx9z7ecIkIMXGPSevdFcg9qZ8Il+gTvsJDM86rI6JNIWJooShLh2V+ty/SWf9qOG9P+V
         QKyg==
X-Forwarded-Encrypted: i=1; AKwUvBxkVBEvD99RIkdRyRFiZbLaRSu4rAV7kmYBEahpkI96p+EzjNqvyPm75yGz5j/w2o/h3IHk3UH+tkEAHL36FTwc@lists.infradead.org
X-Gm-Message-State: AFuF++l/6ZxqU+MiSZtNiFD7Hp4b64BrLO7Bq1pcH/AEhPPNRx6ZD7Fg
	ASKzETkH7nH/G5OrmQxFUCiveOVMM8mnTRW2N+i6iEYIVoOgRiteHxu6vpCfz8PUoQw=
X-Gm-Gg: AYBFou3MtRb0gNBJiwI4y66XgwlTyf5S5lFrTGVcHrsKX5bQSvMuu3MkVWgDrOAlApB
	sqGZKp3G4+qJs/S3qupZDhJ0klXcD5ssHIugtD6njURCjqWBRQv5aBWU6HIB5BRz1Sc1Gx7KFCv
	VIO0TRD7AXI5qh6DCvtTJPoaLe902aPYNqxpE41t9nrdyV8L6L4g2acjh3dvIEg7QAT2Ig/1qp5
	1CZ5WyT9sDXwlvyYEnVDl6z/bw9iH2dgWmgFzNnhFdRUkt+f9hYBGIyLSjr/N08ynrReS6mRopb
	KOSV56r8E6HQhFKhv1nlmWYJhWSSS7lDLW+1Ws3S4MQapsWqUI651rIt9JGpujXJNQaBU4QlIDK
	ehfbvKAN/Lif/y966xvjUTttKjwI4xOkxVtNDEZEqo4jK/1uOAuXK1jCJkKu4JXGcGaLxS3Mx6E
	To4tEPTPX1jnmGWyjCy8+GpgfbCqZhmNxtqoF9LudBEDGqtf9N5TMkUPgj5vM0zfVpCR1m998=
X-Received: by 2002:a17:907:c02:b0:c25:c67d:53cc with SMTP id a640c23a62f3a-c2aadeb4e22mr229458566b.8.1790178546725;
        Wed, 23 Sep 2026 08:49:06 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b4a:dc6a:68e:2592])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae687318sm152318266b.44.2026.09.23.08.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:49:06 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:48:58 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	imx@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 12/12] PoC: arm64: dts: imx93-11x11-frdm: add
 multiple vdevs
Message-ID: <arP06mWDehsIDh5s@p14s>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-12-dac8c5eb4aa9@valla.it>
 <arKiOCGrWAKyc-bc@p14s>
 <arLawAw6kgFT2e0W@bywater>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arLawAw6kgFT2e0W@bywater>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_084908_920945_6D09A408 
X-CRM114-Status: GOOD (  43.93  )
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

On Tue, Sep 22, 2026 at 10:19:48PM +0200, Francesco Valla wrote:
> On Tue, Sep 22, 2026 at 09:43:52AM -0600, Mathieu Poirier wrote:
> > On Wed, Sep 16, 2026 at 11:10:57PM +0200, Francesco Valla wrote:
> > > Add rings for multiple vdevs, as well as the required virtio nodes for
> > > I2C, SPI and GPIO functionalities. On top of that, add example
> > > peripherals using all of them.
> > > 
> > > NOTE: this is a Proof-Of-Concept, not meant to be integrated!
> > > 
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 128 +++++++++++++++++++--
> > >  1 file changed, 119 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> > > index bd14ba28690c..dfa3b122ac5f 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> > > @@ -53,6 +53,32 @@ button-k3 {
> > >  		};
> > >  	};
> > >  
> > > +	gpio-keys-virtio {
> > > +		compatible = "gpio-keys-polled";
> > > +		poll-interval = <100>;
> > > +
> > > +		button-v1 {
> > > +			label = "Button V1";
> > > +			linux,code = <BTN_3>;
> > > +			gpios = <&v_gpio 23 GPIO_ACTIVE_LOW>;
> > > +		};
> > > +
> > > +		button-v2 {
> > > +			label = "Button V2";
> > > +			linux,code = <BTN_4>;
> > > +			gpios = <&v_gpio 24 GPIO_ACTIVE_LOW>;
> > > +		};
> > > +	};
> > > +
> > > +	leds {
> > > +		compatible = "gpio-leds";
> > > +
> > > +		led {
> > > +			gpios = <&v_gpio 18 GPIO_ACTIVE_HIGH>;
> > > +			label = "LED V";
> > > +		};
> > > +	};
> > > +
> > >  	reg_usdhc2_vmmc: regulator-usdhc2 {
> > >  		compatible = "regulator-fixed";
> > >  		off-on-delay-us = <12000>;
> > > @@ -89,11 +115,6 @@ linux,cma {
> > >  			linux,cma-default;
> > >  		};
> > >  
> > > -		rsc_table: rsc-table@2021e000 {
> > > -			reg = <0 0x2021e000 0 0x1000>;
> > > -			no-map;
> > > -		};
> > > -
> > 
> > Why is the resource table removed?  There is no mention of that in the
> > changelog...
> >
> 
> You are obviously right, the commit message here should have been a
> poem, not a form of hermetic poetry. My bad.
> 
> The resource table here is causing problems with how Zephyr is managing
> it at its side. If it is kept in a separate memory location and copied
> there at runtime by the remote processor firmware during its startup
> (which is the current Zephyr behavior), then there might be a race
> condition when the aforesaid firmware is loaded and started by Linux
> *and* at least one of the vdev drivers (here including rpmsg_bus) is
> built-in. In this case, the copy of the resource table done by the
> remote processor might - depending on the async execution of the two
> processors - overwrite the status bit set by the Linux driver:
> 
>   Firmware load and startup (echo start > /sys/.../state)
>                            |
> 			   |
> 			   V
>   The vdev devices get registered (by register_virtio_device())
>                            |
> 			   |
> 			   V
>   If a driver is built-in, it probes and sets the vdev status
>   inside the resource table @rsc-table.
>                            .
> 			   . (in the mean time)
> 			   .
>   The remote processor starts up and copies the resource table from its
>   dedicated section to @rsc-table.
> 
> Depending on the system load and the complexity of the firmware, the two
> operations can happen in whatever sequence, causing a race condition.

This would happen regardless of this patchset.

> 
> This is somewhat masked if vdev drivers are built as modules, as the
> devices does not probe immediately but only after the modules have been
> loaded, giving the remote processor time to start. Note that this is not
> a solution! but a workaround.
> 
> If the rsc-table node is not there, the startup logic falls back to the
> classic rproc_elf_find_loaded_rsc_table().

We can't remove @rsc-table to make a problem go away.  

> 
> This is specific to i.MX platforms [1] and is probably not normally an
> issue because - as stated in [1] - the offical SDK from NXP seems not
> to check the status inside the resource table.
> 
> > >  		vdev0vring0: vdev0vring0@a4000000 {
> > >  			reg = <0 0xa4000000 0 0x8000>;
> > >  			no-map;
> > > @@ -105,12 +126,42 @@ vdev0vring1: vdev0vring1@a4008000 {
> > >  		};
> > >  
> > >  		vdev1vring0: vdev1vring0@a4010000 {
> > > -			reg = <0 0xa4010000 0 0x8000>;
> > > +			reg = <0 0xa4010000 0 0x1000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		vdev2vring0: vdev2vring0@a4011000 {
> > > +			reg = <0 0xa4011000 0 0x2000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		vdev2vring1: vdev2vring1@a4013000 {
> > > +			reg = <0 0xa4013000 0 0x2000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		vdev3vring0: vdev3vring0@a4015000 {
> > > +			reg = <0 0xa4015000 0 0x2000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		vdev4vring0: vdev4vring0@a4017000 {
> > > +			reg = <0 0xa4017000 0 0x4000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		vdev5vring0: vdev5vring0@a401B000 {
> > > +			reg = <0 0xa401B000 0 0x2000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		vdev5vring1: vdev5vring1@a401D000 {
> > > +			reg = <0 0xa401D000 0 0x2000>;
> > >  			no-map;
> > >  		};
> > >  
> > > -		vdev1vring1: vdev1vring1@a4018000 {
> > > -			reg = <0 0xa4018000 0 0x8000>;
> > > +		vdev5vring2: vdev5vring2@a401F000 {
> > > +			reg = <0 0xa401F000 0 0x1000>;
> > >  			no-map;
> > >  		};
> > >  
> > > @@ -149,8 +200,67 @@ &cm33 {
> > >  		 <&mu1 3 1>;
> > >  	mbox-names = "tx", "rx", "rxdb";
> > >  	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> > > -			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> > > +			<&vdev1vring0>, <&vdev2vring0>, <&vdev2vring1>,
> > > +			<&vdev3vring0>, <&vdev4vring0>,
> > > +			<&vdev5vring0>, <&vdev5vring1>, <&vdev5vring2>;
> > 
> > Who is using vdev5 vrings?  
> > 
> 
> Another thing that should have been in the commit message. Vdevs are
> defined, in the Zephyr application I am using as PoC, as follows:
> 
>  - vdev0: RPMSG (tx and rx vrings)

To be backward compatible, there has to be a way to make vdev0 defaulting to
RPMSG.  It would also be nice if bindings were define for RPMSG so that it can
show up in the list of remoteproc-virtio devices like i2c, gpio and others.


>  - vdev1: entropy (single request vring)
>  - vdev2: GPIO (request and event vrings)
>  - vdev3: I2C (single request vring)
>  - vdev4: SPI (single request vring)
>  - vdev5: CAN (tx, rx and control vrings)
> 
> vdev5 is not represented inside the devicetree because the can-virtio
> driver registers a single CAN network device and has thus no need for
> such representation.

Then why is it part of the remoteproc's memory-regions?

> 
> > >  	status = "okay";
> > > +
> > > +	virtio {
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		vdev@2 {
> > > +			reg = <2>;
> > > +
> > > +			v_gpio: gpio {
> > > +				compatible = "virtio,device29";
> > > +				gpio-controller;
> > > +				#gpio-cells = <2>;
> > > +				interrupt-controller;
> > > +				#interrupt-cells = <2>;
> > > +			};
> > > +		};
> > > +
> > > +		vdev@3 {
> > > +			reg = <3>;
> > > +
> > > +			i2c {
> > > +				compatible = "virtio,device22";
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				eeprom@50 {
> > > +					compatible = "atmel,24c1025";
> > > +					reg = <0x50>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		vdev@4 {
> > > +			reg = <4>;
> > > +
> > > +			spi {
> > > +				compatible = "virtio,device2d";
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				sram@0 {
> > > +					compatible = "microchip,mchp23k256";
> > > +					reg = <0>;
> > > +					spi-max-frequency = <20000000>;
> > > +				};
> > > +
> > > +				lcd@1 {
> > > +					compatible = "adafruit,yx240qv29", "ilitek,ili9341";
> > > +					reg = <1>;
> > > +					spi-max-frequency = <10000000>;
> > > +					dc-gpios = <&v_gpio 21 GPIO_ACTIVE_HIGH>;
> > > +					reset-gpios = <&v_gpio 20 GPIO_ACTIVE_HIGH>;
> > > +					rotation = <90>;
> > > +				};
> > > +			};
> > > +		};
> > > +	};
> > >  };
> > >  
> > >  &eqos {
> > > 
> > > -- 
> > > 2.55.0
> > >
> 
> Thank you!
> 
> Regards,
> Francesco
> 
> 
> [1] https://lore.kernel.org/all/20240719-imx_rproc-v2-2-10d0268c7eb1@nxp.com/

