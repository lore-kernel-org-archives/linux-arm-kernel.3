Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BECC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 23:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbmA7lPtg8lHve0ezKTNG03RsW6RcvxCYabLXJ2hr7U=; b=h39AqAkknbqQtphfPFtjctgORl
	foIHYifPyiD7trbdVSkjnxMXor5Hqi0+AEnK4yIhKE6Tm086mqunDW3kZ1MFxUDzkEjQPNmnVf0Gn
	xlj5sl5rPSQHRRd2ApuSX2R8GqpuX/0Fv9uOeFBuFi0gkhP4VBV94b3TU4BPz5tu0/+nI+txSfgaR
	dwdaqbGvLOWFNczsdS7MldVC5XEpzmQI84O4Lg8ve4lyj86+ZBRfEb8Kdvgcn/PYv9kH1gtk0MPb8
	rCTaofP3F6j1QagozgiIpeaRPnlBowPvOqzod6bKs5kuM151zrRhW0rxlAVkrLR9JNr8yIb1JFXJD
	orZeoueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ4g-0000000AYda-4A3A;
	Mon, 13 Jul 2026 23:28:35 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ4d-0000000AYd0-44cG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 23:28:33 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c96c92c0980so206041a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 16:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783985311; x=1784590111; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MbmA7lPtg8lHve0ezKTNG03RsW6RcvxCYabLXJ2hr7U=;
        b=q6hjSrEuNwU7KU748tnFmP+Ar2qYA4D+lIwHHPGfv0yk7vz/LteI2i+oOcuatVYi69
         vpnIIXC9L5MVNV75SBspETkBXnY8B+XVPppoRGOrqeXqrBPZ5C8sS52FGE5IzMCoORk2
         37yr2+nqq+X2bIvyfLShH2eCGnWsPSLVoBd9dGgIyzoIdYJqG7IlDI0uWuaCjFF8wY5D
         oXc9CSjA5M+arryRa6b1fR/52YkQzDeQtBjlT6xdI/+FbU/0MTs1N4kGtM+R3DgwiQo+
         P1LZfgFaTulEMovEMI9ZcB2GhRSmefAy43vUnP+06qzWVL5wSHUqHOdkYyVCUhEKXdEF
         nmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783985311; x=1784590111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MbmA7lPtg8lHve0ezKTNG03RsW6RcvxCYabLXJ2hr7U=;
        b=XjgTmy+6CgrmV3/nDW4lodIIcPLxQlGwMtB7NUJ3/EYXkdoYkURR1TwUF2zYEaDfVf
         /pfw+EkbTMr4jVf2m5rvLeP22DyLpkCKVWmvurczCyODrP32Vz5NAAhqJuDsj7kOtNE2
         mrpsss190SlrnefefWgwm0nOejBC1S2ca99Nqed7RtCZwBVvoXqwjRVVRkT9QodPDr5W
         LNfUkhcL2PD2NvuZl9oLi3Q4kobjKt7T7rXzSiJx1gke8bKIi972+htV4+ZRd59o7Ddf
         Gg5lrAMeB5n5xd0G2CLwB3Fn7JAo9x4Dg1r4d7gYsj4miqO/s/+lGn/+kPOvdYCaUg5l
         GLsA==
X-Forwarded-Encrypted: i=1; AHgh+Roa9CXNNFwYEFq2SWmOp5lOB4dt6vw+x2d0bdyQwH4M8G/uLLwhGp4ErNXe6THZfpfhBC/bkU3tQIgNLGe0lP0R@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4Saxxmm9tWQxs2lFNJN+qQ8b6gMifCkp2Fkuf1fNjNAWxFA7D
	m346vMR88blRrTpzhtPrfNx7WI0XoXNbMYiL1vgwdYTvp3DF7FdUMryL
X-Gm-Gg: AfdE7cmLnSa/H5T1vDggY9NbKXosensAZh9U/Sfg6+LyaCf92OewvqItOxwE6h1SLjH
	f4yWdy5cBArY7mo1eLNP8l4JoufRgqRBbqiVCMRW8TmUArAnZnApIrY9+6KvZyCKBQKH+hDv7JL
	pJg7WrxlbM+9ztKr9ZiuiDuJysMTXzXTHhxsqekK6mav/j8+TO2QXxUhOEN/9kgKCuT4qnGBUBx
	peOzQDTjDwzCn5sfwz8p44v/I+WRkxE445y5Jeh5ElXZpVMlxnDvbqmDkCDXenkGGZQwP5Egy0/
	o/sZ3+TlSSnULsvsXQuFap7a56ljN/DuscAHeMm5EAOG15NfMuaGDZFGfFaX/3ae7upbyir2nt8
	TFM/MzyDDk7DIErQ+ryRqXTFIE18Vr0pa32Rl9QO1fxb/6hK1JmhHvgTLkUXZh1vE3tbdmRniOj
	pmdAFW1y+czSX5HZjw9bcWIFfZgNKBMjvdRpOlUjbSzvKdAW+sKJn75g==
X-Received: by 2002:a05:6a20:244d:b0:3c0:b766:750c with SMTP id adf61e73a8af0-3c110b751b0mr11657167637.58.1783985310413;
        Mon, 13 Jul 2026 16:28:30 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e15f:5d5f:580b:f2e9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b987fc629sm28553811c88.0.2026.07.13.16.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 16:28:29 -0700 (PDT)
Date: Mon, 13 Jul 2026 16:28:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com, 
	Conor Dooley <conor.dooley@microchip.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/10] Remove support for platform data from samsung
 keypad
Message-ID: <alVyvlknt7HaRgs4@google.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
 <20260712-musical-shrimp-of-fruition-b921df@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-musical-shrimp-of-fruition-b921df@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_162832_011771_17A2D715 
X-CRM114-Status: GOOD (  29.11  )
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

On Sun, Jul 12, 2026 at 02:30:50PM +0200, Krzysztof Kozlowski wrote:
> On Sat, Jul 11, 2026 at 07:12:41PM -0700, Dmitry Torokhov wrote:
> > Hi,
> > 
> > This series converts the Samsung keypad driver and the Cragganmore 6410
> > board to generic device properties, allowing the removal of legacy platform
> > data and GPIO lookup tables.
> > 
> > We rework the Samsung keypad driver to stop using platform data, utilizing
> > a new compact matrix keypad binding. To support this on the Cragganmore
> > board, we add infrastructure to associate software nodes with Samsung
> > gpio_chips, and add software node propagation support to the wm831x MFD
> > core to route DVS GPIO to the PMIC regulator.
> > 
> > Finally, we convert all peripherals on the Cragganmore board (including
> > keypad, GPIO keys, PMIC, WM1250, SPI0, basic-mmio-gpio, and LEDs) to
> > software properties. This allows us to eliminate all legacy GPIO lookup
> > tables and fixes incorrect GPIO chip names from previous conversions.
> > 
> > Mark, it would be great if you could give this a spin on Cragganmore.
> > 
> > The majority of changes are in arch/board code, with a couple of input
> > matches and one for MFD. If everyone agrees maybe we can merge it all
> > through the soc tree?
> 
> Yes, I could take it via samsung-soc. I assume I have your acks for
> unput parts.

Yes, of course.

Regarding Sashiko review:

- IRQ concerns are pre-existing and will be addressed in a separate
  series

- TOCTOU with device tree overlay changing DT properties in the middle
  of the probe I will not attempt to address. If this is a real concern
  it should be addressed globally 

- Introduction of 5ms default debounce on proximity and suspend seem
  harmless

- Copying of MFD cells is necessary because we need to "mix in" software
  nodes from platform data. I originally tried to handle this is the
  regulator, but the result was worse as it needed to add software node
  to the device after it was created. Doing it in the core is much
  cleaner overall.

Thanks.

-- 
Dmitry

