Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF00C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QovoZqY4xt6ZAxVQ0BWNZ2UDIC+LHZmnMzcr9SfOYAc=; b=jBXx93C78PkMz3Je1YR1LtuFXB
	nG/JpgQjc6naSZxysX8gb3RSQyVBbQvTva0uZzNLy/v9zb56MSDUX1ei4PwQXDXQFCSCrr+krq/oi
	kIiJoGc4ytiTKB3NZW4tcev3ALE4pDwJZhhElIwlDCr+Z/kVjZjkmOF7BIQTsHOM5OYZTR4pTXvKS
	1z3wUeHDFzihrMOF9Lt5pwgNc9dL01tFWb0p3wczYqFHcr/pRJw8Gyp+OCw21mgwAazHM2nnyHWYJ
	jOV3DiA6wsdZlA8t/NwCdgjVSFJMoJsfpMRPzleuWEuiVpoDC2nsNTG13T6JUPZKl3Go5Jzn5B3l/
	YsgTtLBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBVm-00000008VIX-0Pwv;
	Mon, 13 Jul 2026 07:55:34 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBVi-00000008VHJ-2BZf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:55:33 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-383adaa461fso1858587a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 00:55:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783929330; cv=none;
        d=google.com; s=arc-20260327;
        b=NdacO+xfc48fmwROYRepcXt8KqnAnHWMhH+q9WHm1sB6oN20FH8ypJUFoGmg5aMfCI
         bl9MXGSoVI3Skz8LKk6xUKpnmcC6tFBnI9xYCZSbMteL4ogNfsPa6rkv/Ap+Lu/EU0ZY
         5cXnGAyTWwnEIMztnzbGWbTou5UxEnCpLK/rt/2AEygiwJSvHxwYEDxn+ks3C0PeHQ2l
         jtjHQXmYUlLW5LxZSNMD7a9N0s3O472ZXBCA7y81zIMaWdZNoTfMUJyXlXym7zCpIiKC
         u0FkGrzUIU/OIUzwxXQUhwy6fFt3YL9LI3arBr72z/GoqWqBfHBBHuud1Eh1+e0ob++i
         vb1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QovoZqY4xt6ZAxVQ0BWNZ2UDIC+LHZmnMzcr9SfOYAc=;
        fh=YrFn+qQAgq5dHfK5+0lgUYP0V14kQEcgsPGTVgwpsYU=;
        b=EGRfa6rv4Q8T2linbvGjbB/rdytOYzsTcd2Dht8Wv4HQY08ZS2xUWrDnDxUVJQxyar
         RdGpZqNZBML4BHjTIKBKLD0BfHa74mSHVc1MDFEa7MP/FF9nQDDM6UKqymVYyMHR6f5m
         dYsj/A5xOBki8QLZh5+vdssRrAvr2dlkqBN5DsMcJOFpvwza/elKUSEoscCvbUczUAel
         cVPN3xWAUjlxEUELZAAk/FW682gsvjIS+pWJfnQSmape7jAKANv1TxxoyLn48LV70HLm
         D5RZZLP4EMOdE06E/0qWh2GXnH663jZHG83IWU7fZBdWfpgrRD/gBiN8JSzjFd+Zl9vw
         jc0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783929330; x=1784534130; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QovoZqY4xt6ZAxVQ0BWNZ2UDIC+LHZmnMzcr9SfOYAc=;
        b=YCsbqBw91KpLt1xJ44QpF6ov2f8JECS8QaCLJMwUTD4AgtCZ+BsMLiV67eTrG+l17k
         +BDKnp+Wkl7gYo+DD1178W3tkeqB63zWVjUKxypNetqteisCMX6w354YI0VuHMe7wYjh
         6SQn4xLhJQV5aEUieugQzDRryCpU6CF7LT7C2RVE9G4lz/VZ8UftOceUMfNgrUJWDeLR
         vPltTtr8hD/sfltf3qFT3jyjAcQdoLZvTb07+vvU8RsrW32uQVVygm2f0FppBoe0qZY+
         7NboFXLq2av7CcE0iKD7ggejRz69ZAhRPuv7S97R0Iq3azKIMUAeMLv4m2mx93i4YTyU
         RSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929330; x=1784534130;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QovoZqY4xt6ZAxVQ0BWNZ2UDIC+LHZmnMzcr9SfOYAc=;
        b=eHq3Yil8scVPbWbhON/l81itFzFR+s+/bVRQepOKnCFfAtzuZPoZ1Fr1sWhdDr69wl
         1SkL2XNLDtXtwx2S8F0Dtg5d3Mm2iWCyCJycPe7T7C2NzMwVOjK1qwOFamMu5nTtscH2
         NB1iQljh9S0o9LWmO5mjJOumh7mp0PA1KIAq0SSITD/3/YuYO0Ge5CI2E75FJv2iCVes
         M0YFpX1bYiOt+8naLvHzD0Ednl0Rr3bJ0Cm+McPcCaFslWRIe2Jc9NFuNXKQ0QAy8QTW
         PWQeYaBYukGGBmMwr4eyZ68i+LimQq+TqT1YO78F+XBIFSWkcL8t4kYVEpS6d44Sqz0V
         +IiA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+EvPDCSgVbzKWSa7+GZO+GoAgbfnv3lX767ZPyPRFotlbPAS9EoYA8f9hlBQVajxInfRT8ZyknKCmVKNLw12n@lists.infradead.org
X-Gm-Message-State: AOJu0YwObho/LG0TzB+TShCaU7T5aw5bCeXJpVv6s2sjPlDhfAWsv/qr
	Y0qoI/AB9uD9M1sGCgK/YX/KdY8pOIcOfbp8Niiwnr0XHOBqoej7k9oOzOw2EEB7Gvb+klrXwZf
	yXwYhSLnrYNCJtU7rBGeig2rP9+kGl48=
X-Gm-Gg: AfdE7ckp72MovC2hkAuj8W9h7o13QHVPBd4lPpIGBz8sulq5nBBhYvHTpVdPty7qoJg
	8xFMDxkK2loTk9kph9gxwJA+5+yRc0Lc45FNC6hxsDoCa/AOS0CTYjT+nswIp0/UbSlmUGJeII9
	MiwVs99e3F5Gb4Hr2lwhL+Ks0v1E7N9/l2IlmHatcRL+RpAoICi19Y8/f01p4KLavADefHzw8w3
	H5xSbMC6u/JccoKZKqxSq1FONPK7hz2mLzFO2BGwdaJeBURT98nLIjkvAWgn2mdKI/mUlPd1fWf
	xQ0KO/mU6XD86iiUz0CPuEkgyrERf2kal8pKb8uUlRmtWSdkKOmISw==
X-Received: by 2002:a17:90b:1dcf:b0:38e:673:5d18 with SMTP id
 98e67ed59e1d1-38e06735ef7mr1259924a91.36.1783929329714; Mon, 13 Jul 2026
 00:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
 <20260711-nanopi-m6-v2-8-422675a65402@gmail.com> <b9a5beb6-b701-430c-b667-44780736dd89@kwiboo.xyz>
 <CAPSPb=t=jZke2pEinPvJ4mbxKMF3hSqMfx3GMjEUT6N2FEyygg@mail.gmail.com> <50a8a36a-e7dc-43ec-80ce-904e6e7fbd3f@kwiboo.se>
In-Reply-To: <50a8a36a-e7dc-43ec-80ce-904e6e7fbd3f@kwiboo.se>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Mon, 13 Jul 2026 09:55:18 +0200
X-Gm-Features: AVVi8CetW3-cEGywGS5tE1DvejPk5LFrS4NRovmzWMSPfCpXGd_mo2vU_Ad0Vvw
Message-ID: <CAPSPb=s0Rsvj8b6MLfrza-CVK5U3jF60fEb2yjsro=x4Tyz2qw@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] arm64: dts: rockchip: rk3588s-nanopi: remove
 always-on from vdd_npu_s0 reg
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	diederik@cknow-tech.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_005530_565051_4439465A 
X-CRM114-Status: GOOD (  29.60  )
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

On Sun, 12 Jul 2026 at 20:22, Jonas Karlman <jonas@kwiboo.se> wrote:
>
> Hi Joachim,
>
> On 7/12/2026 8:00 PM, Joachim Eastwood wrote:
> > Hi Jonas,
> >
> > On Sat, 11 Jul 2026 at 01:24, Jonas Karlman <jonas@kwiboo.xyz> wrote:
> >>
> >> Hi Joachim,
> >>
> >> On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
> >>> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> >>>
> >>> Since the NPU is hooked up on these the always-on isn't needed anymore.
> >>>
> >>> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> >>> ---
> >>>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 1 -
> >>>  1 file changed, 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> >>> index bcb2f5d63a61..463cfeddf270 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> >>> @@ -258,7 +258,6 @@ vdd_npu_s0: regulator@42 {
> >>>               regulator-max-microvolt = <950000>;
> >>>               regulator-ramp-delay = <2300>;
> >>>               regulator-boot-on;
> >>
> >> Why is boot-on kept?, NPU is likely not needed until OS has started.
> >
> > I am not really sure.
> > Looking at the other rk3588(s) boards, they also kept the boot-on parameter
> > when the always-on was removed.
>
> Ahh, those board should likely also drop the boot-on prop. There should
> really not be any need to force the PMIC to enable this regulator from
> firmware. If it was left intentionally for other boards, maybe there is
> a bug in software that need to be fixed.
>
> >
> >> With PD domain-supply the regulator should be enabled automatically, or
> >> is there some other issue that requires boot firmware to enable this
> >> regulator before OS is started?
> >
> > Maybe some Rockchip people can enlighten us?
> >
> > I haven't had the time to actually test the NPU. I'll try to test it next week.
> > So this patch is based on similar changes done to other RK3588 boards.
>
> Yes, please drop the boot-on prop and test :-)

boot-on doesn't seems to matter on my NanoPi M6. My short test code for the
NPU runs either way. Note that I am running edk2-rk3588 bootloader.

Setting up the enviroment for running stuff on the NPU was less painful
than I feared. Using Mesa teflon and python-tflite-runtime.

I will repost the entire patch set later today.
Thanks for all the feedback so far.


best regards,
Joachim Eastwood

