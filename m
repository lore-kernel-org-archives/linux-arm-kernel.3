Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F083D6CFA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 19:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxPJVamFKB6SHYhZQG07QdsmJek+DE77cJ/vff79ukI=; b=YKkTPsnPGodLBjIQAfPvlKciIO
	M6tvOFqoHNVQqj7/g3VF8INlHO3d1RRkBe+2iLNEScnxPyNcGx7lKZLjcefLfn2YKkcVNmmxf6f5Q
	dLUCGH/Ay5AgrLXLhX8cqiGhTJbL9kq1LL+jGDRJmcrbODnSvENM71CfYbalK6ZiIFodwY23jxplw
	Bcv1WjoMfyMZLaGzJR8KrpjhGV3A001QDncHXYXGRSKt8M+gIeS+BGds51HAeufbcgsRXFJvAZNY3
	aqwDsGlBmTOgD3Ht2hlmOTpA1G9hR73zsbWg/67k375OmvEviZBpfcHvvCFhW05ME3TA2l1rc0bp+
	ZlKq2TBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizv8-00000007g2z-3BSi;
	Thu, 22 Jan 2026 19:00:42 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizv6-00000007g2A-00aL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 19:00:41 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-12336f33098so1476102c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 11:00:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769108439; cv=none;
        d=google.com; s=arc-20240605;
        b=KMxghAhFpWru/xKHwB9D1Fr9RRCZWwEg2pueiH4FIZbXGLVOXCBhKgVgX7KJBt+4a7
         vualXTdL+IKrcdjSNqjqxyOcb3Eb5GHIfw5Z977XqXiD6FSfxqk5CBa3zEKIba0AujKQ
         DAQ12WA9OfJ5HOFLUTLF9SndzmHx8qpadJz51fPSJ83KMLBq+7ZxkdlWNzLvRzTni8c1
         kUhxyoMFkdsWgY9vcG7uo1e4YHmCgcavh497Wclpsv1fq7KW6te09WDeLTz5CTngC0Jy
         pOtnCRHXpJ8dJ+PDxlTWDD15ePyuChpJYhR9jumOPheav+0ZPQUbzH7qLs/U4EEMeZuB
         kgtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QxPJVamFKB6SHYhZQG07QdsmJek+DE77cJ/vff79ukI=;
        fh=CUp/whtEUYmZUT4CaajugGgNGCU2bhoJ19hw3MlwnBs=;
        b=Z2eP5B0Ja/BRJVYnjb7OcDGhG3ltFUy2UubUfzL7o71kQAjWPquEWYUjs9xSrgSmZF
         WQU8v1kaRZ0/1kw3EMffGMiqpMDgwtP3VZxs3fLGcTuhSpSDtYwJV8hsmLgnccSOsysI
         3a6Y7HhlYrI2I+nvUbDn7lwWY/U2fbnT1tPKjvuaQg/LiQp6UR6zcKkjyyFkMecgm0vP
         FHAVFar0s8F/Dirhg6RwHFnTTwGY5EaHOXde6qdKeizn1CqEQcEAmGme5wdvtTqDQEGW
         WnFRD4Vv4fMvR4sG/M7T9xulKeTESPmXe2rKjAdyezgRtMO6p1DBKCrwm/j8eLr7e7i8
         DVRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769108439; x=1769713239; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxPJVamFKB6SHYhZQG07QdsmJek+DE77cJ/vff79ukI=;
        b=CtV7OO8PR7xN4N5fMZp+XC1rj+H2UcupucAz60mZEU3qRx6iQTppqSjZ794gKHxMxk
         h54YCs6fsXTQclYxbSAEqZZe6MoqxH+rFQ0XTmPjX3ssWhyK0ZjDa0yEN19ORAYpR7Hs
         pSbS/5Fm9cI8GLZyt0b9FyoTq2qBdgyaDsgEBd1oZGMaWGoNY0UIraV3ATii/nWm8+kB
         /YCdx63XYCjpSvl9HCv5nIpGpe3C+Wj6rDJp3nkr5eEbDupxoN9gWrl8J1WWFTlhMWbE
         6XJNcrJTei0+Bdt234ru856C5W8YLem8va1FvkuM2AhKalOqvRw91WpUvBGP1OPRtKDN
         QmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769108439; x=1769713239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxPJVamFKB6SHYhZQG07QdsmJek+DE77cJ/vff79ukI=;
        b=ZuC6FBp0YdiJ71pUWJQIAhxUlPoKRpAcDgwW7iDxj0TY+Aqa45NCDdgMJiO8zwRbbu
         bMK7qCLaPirzhFymzfgeOw5nhsDg0xyN3HALOFuyiZMwqvrMN0afdAS5uRLt2/WXrah6
         b0+tvgGnYq446/IyxnzEPbfXq56E+oxMJdCCar6XO/Za+T23Q3DFvSY4EZSTIQ31QZSF
         FUqYy+uxrITjqlq16sjT+OhIExlyngk0oiZ67S1ADerQsg6ynu0ODnXaI9oC4fkN1HZe
         TmvgpVYH58bZI7BJCxEkRpni95i093f5gX6BJSQZflTN/mxihoKuRnf+KCfddhPcYUF0
         T2cw==
X-Forwarded-Encrypted: i=1; AJvYcCVhwRHHgAb/UhbNkinZuyTgV1+SRxRT1GuAXx2RV62ZlzpvnwOkM5j4ymZfuXFJ5JAu6g22ga1J//6Hs1/jV+GC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrd78g5MzoH/Hx4vliPbGfzqNjp/86zLMPdmfVSQaUrvZ8OIAE
	4aUTDdM4RVQuwvuPBEqiSyxjWSJR6mhxl7nX8PLyLIajGoCcUQaA9WJSstnhaqGYcThbbXCp6JU
	m0Bt0t/VCmW7TSpSDE6L7o3QKBS0JwEsaJ5VelVK3
X-Gm-Gg: AZuq6aJ9rM5kydg0Sun1SDjrqYj/KlJjCwiZnFEPZ8JJq72QJrA5BUenKpBnJxrfowP
	BPrRFefhXs61RXYaQX58SzLX0dJ8+DQ6kg9fE6xHVrj+Ma0ne/Gt2AxwrkIBuP1FZPo3+TIcyfS
	K+jrPZYYyybhGLQJH12bejuFrkd1jWijJLQSF/fMOx3JuPpEc18fZrScDTnDq+7M09+tkx+P5D9
	XJAaMAcNswHxhhAsPWkDuhWLOKcx+dWeeOnP6di0SKrmlxaxOTE+mh4z820nzApSGyRB9NRZbVs
	ohwjzxBlXwcR5SyweO16CuQ=
X-Received: by 2002:a05:7022:ea27:b0:123:2d00:1668 with SMTP id
 a92af1059eb24-1247dc1a246mr216084c88.49.1769108438617; Thu, 22 Jan 2026
 11:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20260121-next-v1-1-c18068b091b9@google.com> <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
In-Reply-To: <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
From: Roy Luo <royluo@google.com>
Date: Thu, 22 Jan 2026 11:00:02 -0800
X-Gm-Features: AZwV_QgKOjqTrU5RPHxI7qZYQKJOEiYtHxnQrsaa6v2mT5d6PB9OvOkllt6REWk
Message-ID: <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com>
Subject: Re: [PATCH next] phy: google: fix build dependency for Google Tensor
 USB PHY
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_110040_044286_5A8F814E 
X-CRM114-Status: GOOD (  22.40  )
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

On Thu, Jan 22, 2026 at 2:39=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Hi Roy,
>
> On Wed, 2026-01-21 at 22:21 +0000, Roy Luo wrote:
> > The Google Tensor USB PHY driver uses the Type-C switch framework to
> > handle orientation changes. However, the Kconfig did not specify a
> > dependency on the TYPEC framework, leading to undefined reference
> > errors when building for architectures or configurations where
> > CONFIG_TYPEC is disabled or configured as a module.
> >
> > Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
> > required symbols are available during linking.
> >
> > Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED-lkp=
@intel.com/
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/phy/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > index 142e7b0ef2efb9209781800ee47b820a91b115ae..5531ff31d8156cb164c32e3=
e52d4a57b26a62d8d 100644
> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
> >
> >  config PHY_GOOGLE_USB
> >   tristate "Google Tensor SoC USB PHY driver"
> > + depends on TYPEC
>
> Can you make this
>
> depends on TYPEC || COMPILE_TEST
>
> to allow some better test coverage?
>
> Cheers,
> Andre

Hi Andre,

Whether to add COMPILE_TEST for build coverage was discussed in
another thread [1]. My takeaway from that discussion is that
COMPILE_TEST is intended to substitute for ARCH_XXX in build
testing and should not be used without it. Once ARCH_GOOGLE is
present, we can add "depends on (ARCH_GOOGLE || COMPILTE_TEST)".

[1] https://lore.kernel.org/all/CA+zupgwgfKwPYqj8G2tNf4pEXNEWA+vL2WYJPhJ16x=
Exgko7Dw@mail.gmail.com/

Regards,
Roy

