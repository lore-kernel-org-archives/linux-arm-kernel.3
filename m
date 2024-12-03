Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716E3E64A83
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0I7eoP4tW1sy5Wnizr4Z0EwfocpUFRNEULcv2IVlsM=; b=XXf/Yow8OoPcJlVFDwt4BKLX3X
	7jrElWHHQnV3jiW1+NDOYt78ihKOj0uVbCbK4MEG9JZTgaemQpM2+YqPHdvQnU+R/RNuX6dtMb7GG
	Kvfza3MWdI5n7zrvcZcvGziU1XSPsw+JMlAoHItAzhSt+YsQ2HeWlzKyL/PDuaC8MSwfBTKRIM5g8
	kzXDZ4iTchtcjfrvbYHKZsV0ofgNN1hFl6VHtponyGAdPmfQMQoWhGo2XgiNQTbWqvSTyuOil7+cV
	M4+DUsp8On2jITt6Idkdu8RpQCWaQyuKmbRZ9r/csNcYoMF2j1IjWzFO8EDSQtuv5ukWrcQrJ/qlT
	xA+VgbGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRdU-00000009Ml5-1E3r;
	Tue, 03 Dec 2024 12:04:12 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRcT-00000009MdU-2al7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:03:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-434a766b475so50066575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733227387; x=1733832187; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y0I7eoP4tW1sy5Wnizr4Z0EwfocpUFRNEULcv2IVlsM=;
        b=M7dNrVq3RMyKZRSLbMYnnXGNCkn+0QQayPrl24bDsp3trH3ZTlfhTGq0U88z46VgPs
         flZhMmDJf6bc5awpbcQG60FwiSRE6JgalhaCrJVQxwkF5OS47USUChchbzlGa2ApIIEg
         CZimuo7DzFMqNIPc1hxQxAJWFXH3QWdJjKfOUstFnp9EtNdmvoWIbIlCczD6GjWmp7i6
         tc6I6n4hSeUiiN1RV08+dJpO6rJTleHUS/sswP2j4M592fYlW4YgWd2uCt03txemsjjQ
         USUeqfeQ7HsnVKPIaScW6y0AUDqzYkEeFxTKa0Q+JigCIYtYVqXpLSpw5sKnS1Mo9ri1
         NniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733227387; x=1733832187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0I7eoP4tW1sy5Wnizr4Z0EwfocpUFRNEULcv2IVlsM=;
        b=IikxDPVKNmJvpjqRP2t2g15GUXV0dUwHGIWgefBw9IDkuuz7Myjwi7Hn2a8PecP80Q
         Uckj0SrIoVIZUK8fhQoW/VIP4Eoeb+6biF7i99bFlpO0QwCHuFvsZZ9vdPG4bAyt1zHK
         wshh1lYWmspL+BoMw5aiPUyCjQDbmy7BuT1xGRhFBXal/Hyy2GvvePteUoMg3CQaxpG0
         D8Y6/4y8MNSv9nc80maWkfZ0sSmEchW+yKk+kgjb19JQb7DvcNHwfuAmoFTDZlTw3YPK
         iSIZVSA42fihTdQDaCw2gJbXeR38mjnchqkpNg3DiUWfosxJ9CubqhytC7nDcJrVrVDX
         n/uA==
X-Forwarded-Encrypted: i=1; AJvYcCUEo8sT7zulxSPU0Y6QBxj7DEP2oJI4YdHvhBG+ct4C9FZE4n4bLbm5vL2SQj9RbAJTR3phzvRECk5k8kJrfvIq@lists.infradead.org
X-Gm-Message-State: AOJu0YziQsEETtnGrD0LnpTjpyf5zj7tUSHodS/GvmjqmNeliDUFaiJt
	gG9c2Phwu7nhKODtdmHHKAQ1QnzdkKg2Gz7wDCFWlp/2nKu/fRJdkYwCrXPlBeA=
X-Gm-Gg: ASbGncuI+igdH6wIx9MZo83UM3k9zRNsHUP0FPeaBgWOVrvTqJg4le2K4sh1cGiTsxe
	BTvSZl/INySdt4wCt1NZNKvtxAAvrnC1fo+cBmZfnfl2nmop9JCIUsFTHrdf1xQPOOBK7DjhCdv
	YX9Q03hMvSTP+H5zBSGoyj11abbU3Vv3Vxge7M938u+GMduhIggFV5VSWIMab7tLe2l2zwP51Jk
	rXnGy+7UsNDBtQhaCJu0iULjlEDhQT4rJkC0GOEGLBa+6d3
X-Google-Smtp-Source: AGHT+IGJuNygbZCGb6hKSPq7svZI0UjE9YSI8WZDBfz+rnhnNF8S82REfql2U1Ng0i3TWUIKQNJLRw==
X-Received: by 2002:a05:600c:138a:b0:431:52da:9d67 with SMTP id 5b1f17b1804b1-434d09b1831mr21654615e9.3.1733227387134;
        Tue, 03 Dec 2024 04:03:07 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f326a9sm189099435e9.35.2024.12.03.04.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:03:06 -0800 (PST)
Date: Tue, 3 Dec 2024 14:03:05 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint readery
Message-ID: <Z07zeVJU3Y1GiSLL@linaro.org>
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
 <Z07r3Upr50vLluyn@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z07r3Upr50vLluyn@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_040309_667351_686F25F5 
X-CRM114-Status: GOOD (  49.99  )
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

On 24-12-03 12:30:37, Stephan Gerhold wrote:
> On Tue, Dec 03, 2024 at 11:20:48AM +0100, Johan Hovold wrote:
> > [ +CC: Krishna, Thinh and the USB list ]
> > 
> > On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
> > > The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
> > > multiport controller on eUSB6. All other ports (including USB super-speed
> > > pins) are unused.
> > > 
> > > Set it up in the device tree together with the NXP PTN3222 repeater.
> > > 
> > > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 +++++++++++++++++++++++++++++++
> > >  1 file changed, 48 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > index 39f9d9cdc10d..44942931c18f 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > @@ -735,6 +735,26 @@ keyboard@3a {
> > >  	};
> > >  };
> > >  
> > > +&i2c5 {
> > > +	clock-frequency = <400000>;
> > > +
> > > +	status = "okay";
> > > +
> > > +	eusb6_repeater: redriver@4f {
> > > +		compatible = "nxp,ptn3222";
> > > +		reg = <0x4f>;
> > 
> > The driver does not currently check that there's actually anything at
> > this address. Did you verify that this is the correct address? 
> > 
> > (Abel is adding a check to the driver as we speak to catch any such
> > mistakes going forward).
> > 
> 
> Yes, I verified this using
> https://git.codelinaro.org/stephan.gerhold/linux/-/commit/45d5add498612387f88270ca944ee16e2236fddd
> 
> (I sent this to Abel back then, so I'm surprised he didn't run that :-))

I don't remember seeing this commit back then. Maybe I didn't look
careful enough. Sorry.

Since you already did the work, can you send that on the list?

So if you remember, back then I hunted down all of these with i2cget on
my t14s (it has 3 such repeaters, unlike CRD).

> 
> > > +		#phy-cells = <0>;
> > 
> > nit: I'd put provider properties like this one last.
> > 
> > > +		vdd3v3-supply = <&vreg_l13b_3p0>;
> > > +		vdd1v8-supply = <&vreg_l4b_1p8>;
> > 
> > Sort by supply name?
> > 
> 
> Ack.
> 
> > > +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> > > +
> > > +		pinctrl-0 = <&eusb6_reset_n>;
> > > +		pinctrl-names = "default";
> > > +	};
> > > +};
> > > +
> > >  &i2c8 {
> > >  	clock-frequency = <400000>;
> > >  
> > > @@ -1047,6 +1067,14 @@ edp_reg_en: edp-reg-en-state {
> > >  		bias-disable;
> > >  	};
> > >  
> > > +	eusb6_reset_n: eusb6-reset-n-state {
> > > +		pins = "gpio184";
> > > +		function = "gpio";
> > > +		drive-strength = <2>;
> > > +		bias-disable;
> > > +		output-low;
> > 
> > I don't think the pin config should assert reset, that should be up to
> > the driver to control.
> > 
> 
> I can drop it I guess, but pinctrl is applied before the driver takes
> control of the GPIO. This means if the GPIO happens to be in input mode
> before the driver loads (with pull up or pull down), then we would
> briefly leave it floating when applying the bias-disable.
> 
> Or I guess we could drop the bias-disable, since it shouldn't be
> relevant for a pin we keep in output mode all the time?
> 
> > > +	};
> > > +
> > >  	hall_int_n_default: hall-int-n-state {
> > >  		pins = "gpio92";
> > >  		function = "gpio";
> > > @@ -1260,3 +1288,23 @@ &usb_1_ss2_dwc3_hs {
> > >  &usb_1_ss2_qmpphy_out {
> > >  	remote-endpoint = <&pmic_glink_ss2_ss_in>;
> > >  };
> > > +
> > > +&usb_mp {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_mp_dwc3 {
> > > +	/* Limit to USB 2.0 and single port */
> > > +	maximum-speed = "high-speed";
> > > +	phys = <&usb_mp_hsphy1>;
> > > +	phy-names = "usb2-1";
> > > +};
> > 
> > The dwc3 driver determines (and acts on) the number of ports based on
> > the port interrupts in DT and controller capabilities. 
> > 
> > I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
> > that would still be there in the SoC (possibly initialised by the boot
> > firmware).
> > 
> > I had a local patch to enable the multiport controller (for the suspend
> > work) and I realise that you'd currently need to specify a repeater also
> > for the HS PHY which does not have one, but that should be possible to
> > fix somehow.
> > 
> 
> I think there are two separate questions here:
> 
>  1. Should we (or do we even need to) enable unused PHYs?
>  2. Do we need to power off unused PHYs left enabled by the firmware?
> 
> For (1), I'm not not sure if there is a technical reason that requires
> us to. And given that PHYs typically consume quite a bit of power, I'm
> not sure if we should. Perhaps it's not worth spending effort on this
> minor optimization now, but then the device tree would ideally still
> tell us which PHYs are actually used (for future optimizations).
> 
> For (2), yes, we probably need to. But my impression so far is that this
> might be a larger problem that we need to handle on the SoC level. I
> have seen some firmware versions that blindly power up all USB
> controllers, even completely unused ones. Ideally we would power down
> unused components during startup and then leave them off.
> 
> Thanks,
> Stephan

