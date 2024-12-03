Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCF1E64A80
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5QpSnqZsvHI5RdTuW6YI5wmM0DD916U9oPMDkb1hRw=; b=3/yoOzVFUXrn5FAygn6B4HrLYx
	KIoEZOHV+GUtKBENAnhsoIqK9htXjFgHIUqqTuHNwMyft0kd+W8Lp9CKAR8yVTQMEmzyirGrHV1lc
	8mnryB/2/iadG+6Jk/eeX8YMN0NLHf+pVQhUX1O37n0g7XTRA3uhbHZ7k5piYZnDfL9E2PHWLxFwS
	w2tPOSj2+hSpMy5PmWy4cJ9m88zJaNYFX4RXK6TsRFae7DFFM5A+ujXWqYbyxKAN52qXCpw8l+2CH
	6VZMMdS45b4VpfPI2Vqfm1y6w5P5C9hEa8J8UaaelR6tNtUXo9UuMBpGzLMZ02Mh01vV/0k00YKfJ
	B2dDT+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIR86-00000009HyA-3NhQ;
	Tue, 03 Dec 2024 11:31:46 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIR77-00000009Hp7-0IN2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 11:30:46 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-385e1721716so2011339f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 03:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733225443; x=1733830243; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k5QpSnqZsvHI5RdTuW6YI5wmM0DD916U9oPMDkb1hRw=;
        b=cmjFlNvYax2eqL5GdwM/YZH3E+k4fc46B5rQ3ttudwlWMAnCljN638XBTBXNAXsLNK
         O7WcwDp932L27AFWQq8hlbLdZJKbzLK/8ZgXisbTrY4fWUKFQmilWfuo+AZkNI49GZu3
         lD6oZRj3XO/+QjyOXd4NAWbCyN4uLzmpTI3ucsWD+eBtUDnRYpMkoNutF8c+W1jjM6Dm
         ojeVSncyew5JgSQykADJEntonoau0hd3EAB3xHvG5W0mDO2+355dVrs+3/yy3qYCP2D7
         GtTrY1QBeL51iS4KwE4B/TawthHLVSxsEQAYpUGhYJ79nt9CIR86b0WQdkg32XsHopM3
         9Oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733225443; x=1733830243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5QpSnqZsvHI5RdTuW6YI5wmM0DD916U9oPMDkb1hRw=;
        b=KiLeiR4SEYRQyObU8v1ckUk/1X/dUOlgHA1OtJ+AYlbXGqnb14ShPQYlSjSOMM3lnB
         Q2IypRgzo1WR6KTOf+Us4vu0/CdH3B33133aZ8/uQW0iJc/466leCHMq5c4FElspTkRu
         UGOtyudaYa52SK++kWEem8dmAqajPGl25SRd4Wkcs4maS1vFm88hyL4SBK1cWBLGMc7p
         hSJN9+TLPM1sul1VFxTkNOhfZEME4wGbxr2RvoRx943BJFjDYUVIwS/EL3Xf4uJwN3SH
         HN3CIF9Go1ZssxhbtdBPKSUCdDoaClRtyMGCb/d2iSj1Tlq3sY9Ktdd8xwADqFkt2Gek
         th0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVI9LFVgUvBlc4W/GlckvO26Sol0S6qJv9TK0hhv5Fol5aqUqopQ7QSj4pG1koLehtopV40nnBU9YwfUkfgQLR7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+KUawly3kBspi78DogF3SnuI0IIpIxRcRuFCDN69+fBb5iohm
	PbHzQbl0d+/gGSpGc97csODOOouA79gxcxRwqQDkF7oYsoyA+kv1UicLqjM0Ui4=
X-Gm-Gg: ASbGncsPhlPEEU/zVInQyunZ6/yoDcnAciRTrN7hulqSGThSQF4Zi4et1HZ2muM3mJP
	vlaJr4k72rQK5ev6MeBXYfghUZCU+B/InRHTtc/PPmiimUIl+0RcRdi7e8Z6yKBm09j2dLGFPiq
	JKNRLuQpgc5DDhgcp8wkDcKskPJSTWS7jbDZ+CyVDE107bg2M7vCT5BpMD874FQg0I1g3QgY7Jy
	H7Rafw2nKnsQJN2vFBvoS8iUkDX8yuReTlYd+ZqMebLUYQg1HDuf7gXy7+i
X-Google-Smtp-Source: AGHT+IH34y7jHvFYEfoZxdYAaLv1kB29M7msviDEnioq7JmNTaNVxGRtN4bXS3pbvxOss6/WmLYc6A==
X-Received: by 2002:a05:6000:18a3:b0:385:e055:a28d with SMTP id ffacd0b85a97d-385fd42a6cfmr1723185f8f.57.1733225441788;
        Tue, 03 Dec 2024 03:30:41 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:5c38:843:f8a3:a2ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dd99504csm13253045f8f.85.2024.12.03.03.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:30:41 -0800 (PST)
Date: Tue, 3 Dec 2024 12:30:37 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint readery
Message-ID: <Z07r3Upr50vLluyn@linaro.org>
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z07bgH5vVk44zuEH@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_033045_118946_0FDA819F 
X-CRM114-Status: GOOD (  42.32  )
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

On Tue, Dec 03, 2024 at 11:20:48AM +0100, Johan Hovold wrote:
> [ +CC: Krishna, Thinh and the USB list ]
> 
> On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
> > The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
> > multiport controller on eUSB6. All other ports (including USB super-speed
> > pins) are unused.
> > 
> > Set it up in the device tree together with the NXP PTN3222 repeater.
> > 
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 +++++++++++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > index 39f9d9cdc10d..44942931c18f 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > @@ -735,6 +735,26 @@ keyboard@3a {
> >  	};
> >  };
> >  
> > +&i2c5 {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> > +
> > +	eusb6_repeater: redriver@4f {
> > +		compatible = "nxp,ptn3222";
> > +		reg = <0x4f>;
> 
> The driver does not currently check that there's actually anything at
> this address. Did you verify that this is the correct address? 
> 
> (Abel is adding a check to the driver as we speak to catch any such
> mistakes going forward).
> 

Yes, I verified this using
https://git.codelinaro.org/stephan.gerhold/linux/-/commit/45d5add498612387f88270ca944ee16e2236fddd

(I sent this to Abel back then, so I'm surprised he didn't run that :-))

> > +		#phy-cells = <0>;
> 
> nit: I'd put provider properties like this one last.
> 
> > +		vdd3v3-supply = <&vreg_l13b_3p0>;
> > +		vdd1v8-supply = <&vreg_l4b_1p8>;
> 
> Sort by supply name?
> 

Ack.

> > +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> > +
> > +		pinctrl-0 = <&eusb6_reset_n>;
> > +		pinctrl-names = "default";
> > +	};
> > +};
> > +
> >  &i2c8 {
> >  	clock-frequency = <400000>;
> >  
> > @@ -1047,6 +1067,14 @@ edp_reg_en: edp-reg-en-state {
> >  		bias-disable;
> >  	};
> >  
> > +	eusb6_reset_n: eusb6-reset-n-state {
> > +		pins = "gpio184";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +		output-low;
> 
> I don't think the pin config should assert reset, that should be up to
> the driver to control.
> 

I can drop it I guess, but pinctrl is applied before the driver takes
control of the GPIO. This means if the GPIO happens to be in input mode
before the driver loads (with pull up or pull down), then we would
briefly leave it floating when applying the bias-disable.

Or I guess we could drop the bias-disable, since it shouldn't be
relevant for a pin we keep in output mode all the time?

> > +	};
> > +
> >  	hall_int_n_default: hall-int-n-state {
> >  		pins = "gpio92";
> >  		function = "gpio";
> > @@ -1260,3 +1288,23 @@ &usb_1_ss2_dwc3_hs {
> >  &usb_1_ss2_qmpphy_out {
> >  	remote-endpoint = <&pmic_glink_ss2_ss_in>;
> >  };
> > +
> > +&usb_mp {
> > +	status = "okay";
> > +};
> > +
> > +&usb_mp_dwc3 {
> > +	/* Limit to USB 2.0 and single port */
> > +	maximum-speed = "high-speed";
> > +	phys = <&usb_mp_hsphy1>;
> > +	phy-names = "usb2-1";
> > +};
> 
> The dwc3 driver determines (and acts on) the number of ports based on
> the port interrupts in DT and controller capabilities. 
> 
> I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
> that would still be there in the SoC (possibly initialised by the boot
> firmware).
> 
> I had a local patch to enable the multiport controller (for the suspend
> work) and I realise that you'd currently need to specify a repeater also
> for the HS PHY which does not have one, but that should be possible to
> fix somehow.
> 

I think there are two separate questions here:

 1. Should we (or do we even need to) enable unused PHYs?
 2. Do we need to power off unused PHYs left enabled by the firmware?

For (1), I'm not not sure if there is a technical reason that requires
us to. And given that PHYs typically consume quite a bit of power, I'm
not sure if we should. Perhaps it's not worth spending effort on this
minor optimization now, but then the device tree would ideally still
tell us which PHYs are actually used (for future optimizations).

For (2), yes, we probably need to. But my impression so far is that this
might be a larger problem that we need to handle on the SoC level. I
have seen some firmware versions that blindly power up all USB
controllers, even completely unused ones. Ideally we would power down
unused components during startup and then leave them off.

Thanks,
Stephan

