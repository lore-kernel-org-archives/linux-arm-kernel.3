Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0647E64AB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zREpKid1FijkM8w3fvUJYYcepCZqPc1/enXnI+QFhQI=; b=nK80cGXS8DvVcQsLXX+wuQD9V2
	chfSgVMrnSNvtRCT74RU8ZmpNVA0VkwW9//uNRrP4Ae+Jeds+Z+FeNOVTaFJn2aWtNQEe7tZDKLft
	ylzb0I/ieuYy4ZnKuus5uItuqZ15OtTaYUo6CKydlsHytzbcsFU+Hu2wd7ytAK2scnOSCvmkNJQtA
	ooNBP2IaBvovhn/TYIwPdFyy/VufrfXPhw/+bMnk9ig8UR3cygdEB7n485aMW+mgvWGd6Zp8xC/9W
	7pu5UBIFvufYQiNe2nvBAjfSlwdpNSwJmOsSxwat70ApYDVxqLkkY2xYJ+FeRbhnBUZZ3osp11mPf
	wWlTJxxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUZj-00000009tCs-38aL;
	Tue, 03 Dec 2024 15:12:31 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUYj-00000009t3v-1e2n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 15:11:31 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-434a099ba95so51068185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 07:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733238687; x=1733843487; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zREpKid1FijkM8w3fvUJYYcepCZqPc1/enXnI+QFhQI=;
        b=gID9rMrWPMWCHgXoWEZ3DOlqmk+vz1SXyeynDq8375eOdJKICrPFRF6K4kqTsxa8ib
         o7SAWKI8XOwEETH6Q2KaPDSKXFKFN1af4lXzPWx7rhxDW4Te/5Hw4gQ9iKYx6vgsIp2x
         uOpNnrcyhVLXq1yt0cPOsxYH4pKcM7rIN3MXzpejcSRDFgfFpVZkOdV5lK2HzBnpv+rR
         SL4d42Md+9uZhCgoinz1GSMzdVY9hEoXJYXxQGtufm0c5QQCrh30cQsJ3aWS5Ekq8zuz
         jh1z21ns0Xtiy3OyZlO3VqfUkyfHU7y3EnWnRULGk7Ej6F5rq96RAQDFOCUpEPyr9ZNL
         muBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733238687; x=1733843487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zREpKid1FijkM8w3fvUJYYcepCZqPc1/enXnI+QFhQI=;
        b=EboP8jA0OXAs3k2yV7lU02OemQS8LD7kei4rJurKEadV2wk1KKrh/0TbqRbzsqwcuL
         D/iwdwdD6xmOdqqgF2i3OR7jDsV7tnUOFL3N1mliBNk/0O1rIXCNa51mkR9P81TClcuk
         SYbk+rZxn4AQDneC0hqzZgU6v2YsAd85mrGDs0NI3+NOs/Agxugp7Z3e1eiv4x6mHd6V
         BsTFWBrQaBVgeqq3VJXMd8NWHV+2jJEGbofuMFuXWnu9mcSaPiFPo5Vamwoz/6JWF+X6
         0ukDGXBNHDk1lmjj/d7mcnjgz6sQEw2/kdYi3Y9m9hA/8nLT/fLi5ebHUOW4ea4t5F6s
         lu8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmiaGHb1gPwWfxW3BqIV2BUBd9OD5uNK5+qSx/KtRV0c9RDG1ej+iPrEbzGR9QpgPznjEov3DJJLinZwu9JlJH@lists.infradead.org
X-Gm-Message-State: AOJu0YxixdMl9ZxveOjOE2jDl3hFhSyCwf7OP0fjqHaumZA6CrSVDdsV
	dVJ5HHjvYXgyhpDrDQifGJ4xmL7/sbSUNfGj1XKxQyxybPgNjD5CeOhZbxf5hL0=
X-Gm-Gg: ASbGncsxta2gKkvtXvTUljI5LgNjIZvFIAj8z40MoHHvUkFqeaRYS9RsEkWjWsshh3x
	7EUa2JnDeVbnwbygPUzi9L6Sb1Dvj2OJUwVh9iVPsGbtFuzFW5nO3BOYhtrqQ9MPIZOVmC6Sa0n
	lk9kwWS2VEQvQtiSJkDI64yy2q/QiBUO0+j/7r0n1HCCTlqVHvKwqYwwtD+F/WQKPQxR/X8llse
	eo68u5hWGDu9ufB3zMvnTYlJ7rjpatZuuePQ+DJ/MZWi2oq2wTXnFEI8QkdBw==
X-Google-Smtp-Source: AGHT+IHpG+YYkt5XvDCdFdtRCKt3GJs9wG1S7RmUFMFyXfoO+hh7Lfjm2kqMdLvybUfLqLTQRDejCw==
X-Received: by 2002:a05:600c:3ca7:b0:431:12a8:7f1a with SMTP id 5b1f17b1804b1-434d09c12bfmr28153625e9.16.1733238687261;
        Tue, 03 Dec 2024 07:11:27 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:41ad:5703:2486:8f59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dc99b3sm191481505e9.24.2024.12.03.07.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 07:11:26 -0800 (PST)
Date: Tue, 3 Dec 2024 16:11:22 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint readery
Message-ID: <Z08fmvBEh6dYQimN@linaro.org>
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
 <Z07r3Upr50vLluyn@linaro.org>
 <Z07zeVJU3Y1GiSLL@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z07zeVJU3Y1GiSLL@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_071129_429127_6319F9BA 
X-CRM114-Status: GOOD (  29.32  )
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

+Cc Dmitry

On Tue, Dec 03, 2024 at 02:03:05PM +0200, Abel Vesa wrote:
> On 24-12-03 12:30:37, Stephan Gerhold wrote:
> > On Tue, Dec 03, 2024 at 11:20:48AM +0100, Johan Hovold wrote:
> > > [ +CC: Krishna, Thinh and the USB list ]
> > > 
> > > On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
> > > > The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
> > > > multiport controller on eUSB6. All other ports (including USB super-speed
> > > > pins) are unused.
> > > > 
> > > > Set it up in the device tree together with the NXP PTN3222 repeater.
> > > > 
> > > > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 +++++++++++++++++++++++++++++++
> > > >  1 file changed, 48 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > > index 39f9d9cdc10d..44942931c18f 100644
> > > > --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > > @@ -735,6 +735,26 @@ keyboard@3a {
> > > >  	};
> > > >  };
> > > >  
> > > > +&i2c5 {
> > > > +	clock-frequency = <400000>;
> > > > +
> > > > +	status = "okay";
> > > > +
> > > > +	eusb6_repeater: redriver@4f {
> > > > +		compatible = "nxp,ptn3222";
> > > > +		reg = <0x4f>;
> > > 
> > > The driver does not currently check that there's actually anything at
> > > this address. Did you verify that this is the correct address? 
> > > 
> > > (Abel is adding a check to the driver as we speak to catch any such
> > > mistakes going forward).
> > > 
> > 
> > Yes, I verified this using
> > https://git.codelinaro.org/stephan.gerhold/linux/-/commit/45d5add498612387f88270ca944ee16e2236fddd
> > 
> > (I sent this to Abel back then, so I'm surprised he didn't run that :-))
> 
> I don't remember seeing this commit back then. Maybe I didn't look
> careful enough. Sorry.
> 
> Since you already did the work, can you send that on the list?
> 

Sure, no problem. What exactly do we want for upstream?

My patch above isn't ideal, because it checks the CHIP_ID on every PHY
power up. But briefly powering up the PHY during probe() just for
reading the CHIP_ID is also a bit weird. Not sure what the best approach
here is.

Thanks,
Stephan

