Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE64EA4FAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxBnGBmedQ54EWA7A2cjDvEbeSIOXFfB5ArOz48xqN8=; b=uPu03vYVlsEx1lQi0arMDYJ7m4
	OMFgBkjpxcScfqO8Y4E3g7s6vhgCx8DrmmowH02vVPey4JQGZ+USaW/3MpvxKvJobjp0RfT1SabYK
	ul8Rg6cX4CR9OeAEhzzxLuOnfIeNHX08rtvEn6Adf7hnd3F6VHiXKRy9FKAlk2mTyhLB6Q7VpINdv
	e1X/w0lfra7qBVpybgMpkDPCGB1iCC63kA5loRG2gjP21fSCOoXldDieCC/p5gNhWt4vOmUAupCbt
	BbqAiVDIHbR/rzvUy60uPZs9us6wjJFFzWQDgglKSiOF3qnsvmkzhA1vrjhm+PLPdumsKwE5f7NzR
	4f1WuP0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUBD-00000000BfS-2fSf;
	Mon, 23 Feb 2026 11:32:47 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUBB-00000000Beg-1bN3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:32:46 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c70bb8ffb24so464471a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:32:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771846364; cv=none;
        d=google.com; s=arc-20240605;
        b=cAphdJ532tdcPrjvv4nKvbqcO3xYc+qlm0ewzASO2gGDPXCSu8dsZ+ylQ7YhiqZM/4
         CXWCeUXkc52qSj13gj6zYLB+F1oKgsHPqLdPR6ou0SlP+j5csc4xn7m/une5BGiV8f2+
         y0M+DpcJkKPQJTzdnBt1YAD3m7lrfrbPzQJr6gtWARvEgQ4jC2ptAXCrZF50t4uUV0Vq
         uL5ynwXesI6qzr9tNMyuyJVe8qQcwZ4XA/45StVD5A0hbp00CCmyIUOcMwwbtnNvahyc
         V7XB0+kQBsdvn6kNTcBjUak/hQH4Bx2+I2bROoKt5atVX9Brulqfbmb94QciuNwidOPC
         FVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UxBnGBmedQ54EWA7A2cjDvEbeSIOXFfB5ArOz48xqN8=;
        fh=ajSfSx5kHwT9cemI+vbhWdJleLgUD8JV5+Y24BmVcjc=;
        b=kmYPYLTzf13q/lHR1G+IXW6yFs0+kHIqtEycpKM4EopgszVjwA7UG98dwMFE2By7rF
         ddp7COJGaz4bSuoatP7BBN7bJhiEfuW6bZ7goGLITbY2WVsOjuO3QmywBi8iusZgEUbd
         gDTLm2dsfPy1lgyq6CPjS+vA08m+1HW1PvxAEMiMz5EZUAWWN4A2uY3v1BaU5nI62bFN
         J6BzucTYMtOSJ2ZhguLMuf0FnDkmPwVACUgXaLMIaAXx8lN16HhPtwoDZ/vrJmnxAE4C
         /N9t+pdGBJqY3o4VhAzMFSunGdlxEDhoEWWHLkZ//NqGvgDe96mYYZF9bS/MLeJHKP41
         WD1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771846364; x=1772451164; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxBnGBmedQ54EWA7A2cjDvEbeSIOXFfB5ArOz48xqN8=;
        b=VE0TuG50BBwb8WW1b+HTwh/iNGtfPQVR2NoWsorZb/QDU7eI+P53gb4rrNjC9V2vkk
         ML8+HRYbK8NVWQaVBis3VDGJ55y7qDRStc+DTWLtyQeW6GV5mSwoJIcCHJleSJTQLzT4
         /nsUFMT/sbVLmrF0lL3pnCXuh6Rp7AcWtn9CjO8ejWLJ8A9T2TBEDDd+PZWUkNLJv8xJ
         fgzZ9rFUAjTcQ3gPoyGXroOY4NGhqI8QfAk0UBiqE6SDdxaaiQratSRdWKkqaYq3Nen7
         Runju0pQ9UmuoZqkSU7vS9xbJeF4mi9JVdWrJncD3wU4BrZXO8GRZ+YYH2y/Dle/mTR1
         X5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771846364; x=1772451164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UxBnGBmedQ54EWA7A2cjDvEbeSIOXFfB5ArOz48xqN8=;
        b=pbyhN0RiEfJXADSjD1A/Qo+YZOUEL1A8l5OkFgnrENHbAMN4qwcXTd7j9lGW3DLt48
         0GHImUjYtmHLeYIRvhPOw+zmnmsO7sLZvNr2V0mNZTm5hLSJx2TLB4y845AhOcRtBy1r
         6XOa4Hc7P3tTbrEygAqkJkFlz/piqOYk2AxT5wd+pXTT/kyoPhFigol47VoxaRorADtz
         lWmuwO475Jer+RABYBRwZBJn1WpE8Bm1A0efxqjaCGc1L6rAVDq/UrtHEMyLACWFWUbY
         nFe5iHF4id/m4xsAwhusPb3/WLK+VkGtjlNNEMz6EMiojaun5JuZEQhQAr9Oh76M7Xp4
         DlCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLOZjC5W9Tu0aU+oaNIPWdqv/0SarR8pFyVfWaLBp44Da7KuBaRQzyxSm3DLkJ/iLjaaUKa+xuuMCYr+TnPXgD@lists.infradead.org
X-Gm-Message-State: AOJu0YzRyH8lZazaw9TiLdZI3rAnAl3Ars7n4bLLEO8zeu0ElOoAdmBJ
	No28nraq+fDJubhvZJgmSU6cGliqaeLBLH/iIoumIsJGWsXzxPb2OWdBnFjVTNu88C63aFg2v9d
	ntGzq1mzxXz4GyzKUQeOJIaRgX/dq+sA=
X-Gm-Gg: ATEYQzxgfS6YKzYadHa7M7aSPa/j799a/eiDL1BoqI6eO+5tvKxTEGuAT6hb9tToiWW
	rOHrhQzh12xPPGiM77VlvPkPGQexMAuT4SHJmvpEiyGiJ0C3oChNlgobz9MZpvm6cKcbE8aN/VI
	neT+M3DoMvjMHw3yqsSRxHhevda54LqSrtClwr8t15n8M2eUpy3sF7200qUJ434DMSex+kNC5rE
	HyYrNlOBe8RH2UuLpO0cEjLXEm8DLygepH0wK2ECTkULNS4NOjOvXQIT2Jd11CgNEqsaUcY8pQq
	a9Oi5k9t
X-Received: by 2002:a17:90b:4a03:b0:354:bfb7:db1a with SMTP id
 98e67ed59e1d1-358ae8eb3c1mr6483020a91.31.1771846364557; Mon, 23 Feb 2026
 03:32:44 -0800 (PST)
MIME-Version: 1.0
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
 <20260130-yv5_revise_dts-v4-4-4d924455f3a7@gmail.com> <963194a5e7e88ae8ae1fe367d34d2fcdc329d814.camel@codeconstruct.com.au>
In-Reply-To: <963194a5e7e88ae8ae1fe367d34d2fcdc329d814.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 23 Feb 2026 19:32:32 +0800
X-Gm-Features: AaiRm53bpJFrm7XPxTVOdQ54aVpHKM6_Ww6c7tzcvFzJ0UfydujR-z_VZkvGO7s
Message-ID: <CABh9gBep1U6oMLTFG0c=xX_ZceeA9=q=zELJ8CDENLz7a=iM7g@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] ARM: dts: aspeed: yosemite5: Add ipmb node for OCP
 debug card
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
	Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
	Leo Yang <Leo-Yang@quantatw.com>, Jackson Liu <Jackson.Liu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_033245_424740_A6E23259 
X-CRM114-Status: GOOD (  23.24  )
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

On Mon, Feb 9, 2026 at 2:25=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Fri, 2026-01-30 at 16:20 +0800, Kevin Tung wrote:
> > Add the device tree node to enable the IPMB interface used by
>
> Here in the patch description you use (capitalised) "IPMB" but in the
> patch subject you've used (uncapitalised) "ipmb". Can you please be
> consistent and use capitalisation for acronyms.
>
> I wouldn't normally mind and would just fix it up, but I've other
> feedback on this series and have fixed the same problem a few patches
> already today, so it's a growing source of irritation :)
>
> Andrew
>

Hi Andrew,

Got it. Updated them for consistency in v5, thanks.

Kevin

> > the OCP debug card.
> >
> > Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts=
 b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> > index 983aebc394d9159c7e3db2e7c39e963f7b64c855..84d3731b17f7c7c87338672=
bbcc859de2b89b722 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> > @@ -365,7 +365,14 @@ i2c6mux0ch3: i2c@3 {
> >
> >  /* SCM CPLD I2C */
> >  &i2c7 {
> > +     multi-master;
> >       status =3D "okay";
> > +
> > +     ipmb@10 {
> > +             compatible =3D "ipmb-dev";
> > +             reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> > +             i2c-protocol;
> > +     };
> >  };
> >
> >  &i2c8 {

