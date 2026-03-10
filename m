Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FD4EA8550
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 10:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmUw5A97wrpfIT56ALDmCYbj15syxnOOqGuMSPR08nE=; b=0OSiuafclDTj9Y5qV50KTrXBiy
	Gjo0rpyNOwJhPJ2xt67fXwxjsyAgbFxtHC2nf1g2QWvsrhCImeEZzGruK2dhXz4s4NVB4ozv043DS
	8FoNTtMNRgrZ3KF1oJR4B/J0N0ozhQwTkDeSlsPILPMipbcUIzlIyEosWrauk6GzHgK/ccqAGbEgF
	0U/K22eAMZODB2FerBwtNflFJYp2PDQw8EP6nb28Ir7TnAY//fuElQ0MfR92t19ssFeFQuFP08VSv
	wBoetObAD+gbkrcIcQRND5MRH+k4lnoQR6qh4ApjCKdVo1uaLDiJlmqiQiGmoktedUJ1PGtEsB0yJ
	gz0kfbJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztyg-000000099mf-3GmM;
	Tue, 10 Mar 2026 10:06:14 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztye-000000099m9-30Pa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 10:06:13 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-439c4bde55cso4711509f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 03:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773137170; x=1773741970; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bmUw5A97wrpfIT56ALDmCYbj15syxnOOqGuMSPR08nE=;
        b=CDGM+3KhnlmKyFBoG8eJCXuXEE/kJO6UYeKD+GH4XDxOvgK3Voo4iHFS4OHugbLFM7
         0z5alqPvooF0m8ntDXwTaGpeCFqEDqoX2F8S3lPCsPMtMl2tJm3a3zbAQp8EqEZeH5tA
         mDILtca/IIVHHgyhtJ8Kjurpg+dS/inPW0ezIl1j8t2n3QNxqopxYZ/m4ND3VkGAqLvs
         ILJ7rXiifAYViaKz3PnHKH6kZ20HUNmKzigZeB2bXx8ni11o8vcxTnxdgbIgeJa5Zqrq
         0S/h9wahEhH2GZyCcfc02EXysrNLsPBXAH61eEskFIYr/8QdPLqKzCDAJVhwVPERDnoY
         caCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137170; x=1773741970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmUw5A97wrpfIT56ALDmCYbj15syxnOOqGuMSPR08nE=;
        b=ijjIzbj50XeO/Focop/3yA/lA/y7Q/bTa+Iju5/dbwyYCsAeKNDWsmR8ULksT8d4Df
         L/m9BS4OmrKHEBAZClEX1e+781IN2oO0++YdS/HifN0ubz9OwD+yg50u5d+hvWY9wRkZ
         soXiTME/1XhHHxO7lyBubDrOCVqgblULdV0EQ3ZmarS3mZgdb5lc+CzedMjQrmddvRiy
         KzPFysDULNEvl/O0xcIJVJqOgesAhW0caWhB7E1qJoGf3Osw3N5ENNVerwsWoGD3GfBd
         IwprUmqW71Z6TthuO4DUqh9wMXaDAdflNi5IaoKzGMUuij625OdsDJedQ02fUKFZjH+T
         fMng==
X-Forwarded-Encrypted: i=1; AJvYcCW5UApdR+7XDkcDa8HnDHhcuHXMPz24cif3UMyYeOdcWZLFxapCB1vuplFCX/Lrh34IwtFQBtK8ryhk2tr2fvuX@lists.infradead.org
X-Gm-Message-State: AOJu0YyRpQwkV0gW8pNNWWB8vJGNWjs4Lth8FEVVzLKigtlJoByyVDHm
	rBaXfbc5qBEZNHFx4XFsVRURfYFt6VRyck/giyieKZGAuoPQG3AknGsk
X-Gm-Gg: ATEYQzzxzm4K8QGrvOnTuIo7BXaX8JvFdiXQmX78iR2KRNaoEii99oXMFDryjEd0qtZ
	/ki/ikBAq5jbg7wS35NAN53WwJB2b9l8dENCbyZxIrnz/S2qjIZlL3anres/TbDsNYJejHEmNOf
	qtuZjt0B4FWJ2vOF7XfEFZ27BnGLwnqXWAF1DkABbDZu8ybjRQ4pxcKKhK9+QtG+pyX2lm7YyUp
	vVa3WMMmhrzrWzWh8AD1dgMrTSxf4+TX3cidx6S4Jj2Zt99zRyS+++v9voRhU3Bt8wG5tG/NC0Y
	o3eV/ao749xAtqpmzaFGKIitfD7qRSMLYCvx13RnSpISZQPmw1xKLF3VqCOA40bqIw+ae2FNroY
	eS9awvaqR6KyCoZjxJxMVLEjWBSMTExVffnGWY3E0x937oXz31go9uFG+mPT5ytq3DO6gutzb3q
	7WmLUwADFnGR3Rx6N8heIes8BKPIhctGpLQp2xdmmSc/m4rXuGuwq0r99BGR1hKnaDwcJRA1Zg6
	IvMZC7JRd3ME4ypl1ieQAs9KbA=
X-Received: by 2002:a05:6000:2010:b0:439:b203:7711 with SMTP id ffacd0b85a97d-439da31de13mr25766004f8f.3.1773137170198;
        Tue, 10 Mar 2026 03:06:10 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb29fdsm34564056f8f.16.2026.03.10.03.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:06:09 -0700 (PDT)
Date: Tue, 10 Mar 2026 11:06:08 +0100
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] arm64: dts: freescale: imx95-verdin: Add Ivy carrier
 board
Message-ID: <xghf5wajmzkz3vhi565q5fmclrelczobbvywg7z2tj3gj2rzlq@idn3vyhxxsde>
References: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
 <20260305-verdin-imx95-upstream-frank-li-base-v1-4-823fad02def9@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-verdin-imx95-upstream-frank-li-base-v1-4-823fad02def9@toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_030612_782643_E4B74962 
X-CRM114-Status: GOOD (  13.99  )
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

On Thu, Mar 05, 2026 at 06:24:32PM +0100, Ernest Van Hoecke wrote:
> +/ {
> +	aliases {
> +		eeprom1 = &carrier_eeprom;
> +	};
> +
> +	/* AIN1 Voltage w/o AIN1_MODE gpio control */
> +	ain1_voltage_unmanaged: voltage-divider-ain1 {
> +		compatible = "voltage-divider";
> +		#io-channel-cells = <1>;
> +		io-channels = <&ivy_adc1 0>;
> +		full-ohms = <19>;
> +		output-ohms = <1>;
> +	};
> +
> +	/* AIN1 Current w/o AIN1_MODE gpio control */
> +	ain1_current_unmanaged: current-sense-shunt-ain1 {
> +		compatible = "current-sense-shunt";
> +		#io-channel-cells = <0>;
> +		io-channels = <&ivy_adc1 1>;
> +		shunt-resistor-micro-ohms = <100000000>;
> +	};
> +
> +	/* AIN1_MODE - SODIMM 216 */
> +	ain1_mode_mux_ctrl: mux-controller-0 {
> +		compatible = "gpio-mux";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio5>;
> +		#mux-control-cells = <0>;
> +		mux-gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	ain1-voltage {
> +		compatible = "io-channel-mux";
> +		channels = "ain1_voltage", "";
> +		io-channels = <&ain1_voltage_unmanaged 0>;
> +		io-channel-names = "parent";
> +		mux-controls = <&ain1_mode_mux_ctrl>;
> +		settle-time-us = <1000>;
> +	};
> +
> +	ain1-current {
> +		compatible = "io-channel-mux";
> +		channels = "", "ain1_current";
> +		io-channels = <&ain1_current_unmanaged>;
> +		io-channel-names = "parent";
> +		mux-controls = <&ain1_mode_mux_ctrl>;
> +		settle-time-us = <1000>;
> +	};
> +
> +	/* AIN2 Voltage w/o AIN2_MODE gpio control */
> +	ain2_voltage_unmanaged: voltage-divider-ain2 {
> +		compatible = "voltage-divider";
> +		#io-channel-cells = <1>;
> +		io-channels = <&ivy_adc2 0>;
> +		full-ohms = <19>;
> +		output-ohms = <1>;
> +	};
> +
> +	/* AIN2 Current w/o AIN2_MODE gpio control */
> +	ain2_current_unmanaged: current-sense-shunt-ain2 {
> +		compatible = "current-sense-shunt";
> +		#io-channel-cells = <0>;
> +		io-channels = <&ivy_adc2 1>;
> +		shunt-resistor-micro-ohms = <100000000>;
> +	};
> +
> +	/* AIN2_MODE - SODIMM 218 */
> +	ain2_mode_mux_ctrl: mux-controller-1 {
> +		compatible = "gpio-mux";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio6>;
> +		#mux-control-cells = <0>;
> +		mux-gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	ain2-voltage {
> +		compatible = "io-channel-mux";
> +		channels = "ain2_voltage", "";
> +		io-channels = <&ain2_voltage_unmanaged 0>;
> +		io-channel-names = "parent";
> +		mux-controls = <&ain2_mode_mux_ctrl>;
> +		settle-time-us = <1000>;
> +	};
> +
> +	ain2-current {
> +		compatible = "io-channel-mux";
> +		channels = "", "ain2_current";
> +		io-channels = <&ain2_current_unmanaged>;
> +		io-channel-names = "parent";
> +		mux-controls = <&ain2_mode_mux_ctrl>;
> +		settle-time-us = <1000>;
> +	};

Hello Krzysztof,
Hello Frank,

Thanks for your review so far. I noticed that the node order here is
also wrong and not alphanumeric on node name. I will fix some of them,
but for some it could mean that for example, 'ain2_voltage_unmanaged:
voltage-divider-ain2' is far from 'ain2-voltage', which is unfortunate
since they are related. Together with the the current-sense and
mux-controller nodes they form something of a logical group and it seems
undesirable to have them be separated by a long 'leds' node and the
regulator nodes.

Would it be acceptable to keep the "group" together and sort
alphanumerically within it, or is it preferred to sort all nodes
alphanumerically?

Kind regards,
Ernest

