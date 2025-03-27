Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C05DC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 19:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zd5BXmlZnu1j0K9/QsEF8vrUJXh1mHUAcZQsH3zURHw=; b=M6MtSSob9d8/VCj6o/3jTGw/LU
	uX+w9oq1eR6K7By0shKCYk+bp0GfzYik4v6jTHk1MdjxVaVeyiCGFOmuGD1gFXVDRY8fkT3FZrlUr
	UFJ3T/MGhwfN97nj7jPcQ1y3/mOvdiyQgryqGocNcLH7o+IbDIHwVQoxLZDjt5AFn2InJbJGWprhL
	ROk3cowU20VcMTdAydYOttzOBt+sf3vxWnQAOJYw8eDmH6oOJOc/aWCKVpzJIyy3UqFapSz5rG0SW
	oAjMAKcm4F72ukWpV4KS6O9H/iygIYTixL+V1P3ORt1glvg5xe96OfgV8F42rZUf0/Ad+MwlU18pR
	ttTs3BIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsZQ-0000000BnCB-0gYe;
	Thu, 27 Mar 2025 19:07:16 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsSr-0000000BmKh-3rQe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:00:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso10657165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743102028; x=1743706828; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zd5BXmlZnu1j0K9/QsEF8vrUJXh1mHUAcZQsH3zURHw=;
        b=Bucbe+BQqMRblAFHlgPtcXqt0MJD7dFl9g2KkY4NqqQQAYeRtj18Dqy35Tt7Gq3vIZ
         3zHjKBJTB161rD/AwPaBBgyySQkfjmabsOHgoM4ybH76dYjpYYT5MNlfiO1d3O2OiSC+
         29PbuoFoSMkHaEC56kZzcIwHKZdEmWO3oaDOSm0rFteVDSekiSWwdPoifA/Mfv8QgXmX
         azTAzTI3G0EayRehujmUS1L6pEvgu3zrSWQVFb4vLuPNFRGbzO51+C6TBDBXxPUmTJ/7
         33dw/aH5wmx7v4OTjT/HiJLrzeu56+4jNEPPss51YNYBJwVcza71U80uLojHYLpnp32o
         IRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743102028; x=1743706828;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zd5BXmlZnu1j0K9/QsEF8vrUJXh1mHUAcZQsH3zURHw=;
        b=UHc/OEZ3SU7a6UT9qvGHfEiejyvE4ZAA/kckMZvNC/mL4WWkhPhgZ912Z80zg/OAYv
         X6ctsCVTRDMTpiDHLdyRXJNzrFE3nsObyXp/JJobvrMYHpTiRinLsPnQpV9Th376eF7F
         vnjwqxXsXF55wRhlhUVMdpidsiLp3ua95DPMpxiqzbgYNkzhiRM3ccoFVUSKQhw4dD38
         PWBCEJfgD9abFLKoK4EJ5eKVYsIdliGwHmSy1GXgxGrFnNft+vZCTzZdb5ZvD8I5Kufo
         z9+qXhExhWC9uSw9n6Ftx5TT6k9UhshiGCVsZxBOUmZui0A8aKw1sBVPM0c77ZasSSF0
         M2VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfpZL9RJ+Pr1DfVgbRfv1XvHjIbZfpI4E72JOneF2RKi4UQdS6migricFdx/lLqQMI0WWkSyjSkI1YlU6KL5ny@lists.infradead.org
X-Gm-Message-State: AOJu0YyypV+iry+Vjlt33kC+ZrYeXUNo0dX58WYtVh9jQ3TLwnWV4bkj
	ccd8MjsVl165j1V3H2jN/K0lgz4xsD6cOY2FFJOZWCvCBNOIvYOiF1F4J/5xkt4=
X-Gm-Gg: ASbGnctAyFd9w1sdnqc+PiKOiVZYetQMS1fWMPcGGlNkYT32W4UUurwZTu1GO4gqzHl
	jqLN0KaJXeg+OkD3nSkAE70RkoCXD+xYHQSOq9nHbnotAyvdexDYs7gEf5qVtEQyK8jOy45E1Uo
	EY80ffWMRNAzTUPYz41v9mFDzuDX3ydqfddmJXxuRlPiVSshZeAb0Gb3dZKWpQXmNpaLSB4vTgg
	8L6inLMBDplq8motyct/83NNOdtcLfYr2QGa1kRnmhXoMoV1e8iCbMYsQ8QlimVYQrPRqocfaCZ
	4G5PXUBIgKEv/4VFaKI3+W86gCEkMlK9AfVUhRIXTNkYJQ5BAg==
X-Google-Smtp-Source: AGHT+IGnQpe3KSpRW8OcMy9ZOhvZKg6FTDTo/56rh7+F2u2OEQyun5MJVX1ptbNmngH24DTaiRQADw==
X-Received: by 2002:a5d:47a4:0:b0:390:e853:85bd with SMTP id ffacd0b85a97d-39ad178a45amr4737166f8f.48.1743102028193;
        Thu, 27 Mar 2025 12:00:28 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8f404ac3sm4134315e9.0.2025.03.27.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:00:27 -0700 (PDT)
Message-ID: <c7169df63dfad34ecbda3554ec51631e5cc6a2ee.camel@linaro.org>
Subject: Re: [PATCH 11/34] defconfigs: rename CONFIG_MFD_SEC_CORE to
 CONFIG_MFD_SEC_I2C
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Thu, 27 Mar 2025 19:00:26 +0000
In-Reply-To: <fdb8ef9b-3053-4dbd-b3f0-e2fd512de770@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-11-d08943702707@linaro.org>
	 <b733eff2-171e-4ab6-8546-565d87d5ba84@kernel.org>
	 <62bf00c37566964d6be794ed12a34cd057d9bb1d.camel@linaro.org>
	 <fdb8ef9b-3053-4dbd-b3f0-e2fd512de770@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_120029_979120_94B986C3 
X-CRM114-Status: GOOD (  21.91  )
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

On Thu, 2025-03-27 at 17:57 +0100, Krzysztof Kozlowski wrote:
> On 27/03/2025 09:56, Andr=C3=A9 Draszik wrote:
> > On Wed, 2025-03-26 at 08:16 +0100, Krzysztof Kozlowski wrote:
> > > On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > > > We are adding support for Samsung PMICs that aren't using I2C and
> > > > therefore had to rename the Kconfig symbol.
> > > >=20
> > > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > > > ---
> > > > =C2=A0arch/arm/configs/exynos_defconfig=C2=A0=C2=A0 | 2 +-
> > > > =C2=A0arch/arm/configs/multi_v7_defconfig | 2 +-
> > > > =C2=A0arch/arm/configs/pxa_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 2 +-
> > > > =C2=A0arch/arm64/configs/defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> > > > =C2=A04 files changed, 4 insertions(+), 4 deletions(-)
> > > defconfigs go separate tree, so this must not be in the middle of the
> > > patchset. Bisectability, as for defconfig, is anyway broken in previo=
us
> > > change, so no benefit of putting this in the middle anyway.
> >=20
> > OK. Should it still be part of this series, e.g. at the start, after
> > the binding changes, or a completely separate stand-alone patch with
> > a reference to this series?
> Hm, now as I am thinking, maybe we should just squash it with previous
> patch and take everything via MFD? defconfig could be mixed with the
> drivers, it's a kernel thing, not like DTS.

Happy to do that, and it would also ensure bisectability :-)

Cheers,
Andre'


