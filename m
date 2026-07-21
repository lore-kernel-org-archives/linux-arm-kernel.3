Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECE2C44520
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 01:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHPTMhb9JAbcXOq5Xex7Y15eQjdJiY8OEmA13h9LDA0=; b=SKhi4OWFBfOowTlrDKEMic9mjd
	apanNb+tRkdQAtSGmVTbYLmubc5xcMJY7VjdpV9HaZ/YMDSVr968Gm9Rynvcwt8DWlOBNZ6IGbDzs
	kJs++ZS0JmrEXUhiINWGk6m4kMIaQVOgOj3e7yeaZaL+fBS9RJVbuhl/kXhNlirsEwgcDL11I1XAd
	FyYt1uzCtGpHA0b9Wq/SjsI3HBO6tIM3OcSnFkFkbnvFnjV6eOA7y1RTsRarqQHiMidvSGgxg/Se7
	RGGzbAAPnCPMOhJlDzbwn/exvJoTgU7FjEIlyiTww7IQ9IMjXFVSLz2cyzAnMrVCMCWUDlwF6VVeh
	uQAT4Qig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlyuB-00000008ACz-0o5W;
	Tue, 21 Jul 2026 01:04:19 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlyu9-00000008ACc-0SEX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 01:04:18 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso11319547a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 18:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784595855; cv=none;
        d=google.com; s=arc-20260327;
        b=RESJjrj6rq39oaoTyORydbdditjgQG7BGgCrMcRqVJsOihHkZ5kave0huvoeyeldkm
         mVHiNLfrS/Nj77aF23Y2FmbH61BHQNa3sHtii0OW0HqEj2EFbGaap8vl2wlrjNy7cEbO
         ddP4eYLitX/mL6MMmaXZm2s86wKsIWT4gXljgmo82elYl9m2Msh9mxg+U4h/aNZc+Glv
         I6SDDrFc6KwIwrgq6lBpWvllMaUZnuT6e/U7Du8F2dvXPEqRnKX50Um3inibFZLFCC0V
         ob1cuUt/QUBlywRpQcLu59dmO279eentNkJ3ctce0+E0OYPNVdqDMPIGkfhyhem7oVK6
         x1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EHPTMhb9JAbcXOq5Xex7Y15eQjdJiY8OEmA13h9LDA0=;
        fh=Fhg20IANTZ0WfeH/TobsfvqBBZ0RNj6PcV3l264TCyQ=;
        b=XtXT9IKrkJEMZ4ZTt9er9LDzc9oIAr9glCmz9pThBJub5HjZ88IMY1q/CB/vSY7wxa
         UsZ1xd/FPRTwTUMhBl0eqiuPzT/xIH3vWEXbdY8NLf+4tA/YBgvMFb09Foo0cy52kDXn
         hCE5PCcoQ1rs7lApfnBUdqDietKYhSYzH1LxvvhuJrvL2j4MoLnXNZ5ZLpXmw6WcYQkE
         lnlVK1m0LkdpSHfyBF6znAMdHm0KTsw/5REsSVNYUE7uHSwFfJK4ovmTwrDumYfMc/Hl
         08z+474EvwHQUg/HwV2DNQegeYiJsZP88EImYHQ611TRov+JNt3NdcRyqwHvKGmMaWjt
         YKoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784595855; x=1785200655; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EHPTMhb9JAbcXOq5Xex7Y15eQjdJiY8OEmA13h9LDA0=;
        b=U/2aiCjDHSJaPf78aj73H05Ae6iI9xhGH0Ao48O7SMuYxtJvMf/ot6j259oyqVPwXo
         dvh3khTMAaiIBDjCYjMUX2MSFzO+a17M2S0fwTR+TTcpFJyvqysuV0aGUKyU8T/afgmS
         cw7ZUpUphBf4jtkrGvYPORjPAPUk70UwL1Rb26oFOKFNxXKm3rNSpf8+Br0xZn8YCK+o
         mfFo8i6L+mLU5sjhLncfSMy73Pg4+UBwuVMr+2eA5LijpYd1NYApzB/EmC68PYZGBnm2
         ZGrkwWNg/LbCvhudvTW7Pz6a3rE78qXb8TA2x3qdol+H54Uv9Od8RTRp5j14GDjwr8NX
         NVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784595855; x=1785200655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHPTMhb9JAbcXOq5Xex7Y15eQjdJiY8OEmA13h9LDA0=;
        b=Oj874IlDpgvHBZAhY7Wzpa7h6taFfvMmFk9pRNAGc0dybjfhRqQlkvPzKJ9kbVRYDV
         9YpjkUUtgCVnJz3i2+qxGwzgAOchwPSD8dGkbIUFva1VBLtkKE/BEJQDJ9wCnAdm1Uky
         5yrwI168bGUPO+pWRbTZdGkZ//DPDoNzYiLJDW8GDADw/5iZdYicy0UANQmzGo6MFdlu
         J7vBQTCggf7LMna9MeNE/yrCojSZkkOAfOe0VJPImMD4wrherIRjarOiznyO+5yTt/CP
         43a7UuDW015NUdg9+v/MtvrvzU28IPTCfR+OqUveYFc7OMR0IcD4XfBe4Zo1G+AVxllh
         AV6w==
X-Forwarded-Encrypted: i=1; AHgh+Rrg/x+mngVH4XLYdHWjTmS+8F2WtdAOSh3nrg8Ez/IQ7+KI+0OgbbyaofWoE3tLe0WqDtpxbblQhsEyDoZwg40T@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0MoUeO9mLJgkNNijiAyblUYrBRisJWZN03ynuqK/3ZK31Imha
	ovpvUv+YyIAb0upO7JzMBUOtHdZLOvhkemEqi+yKM/aHTfrH+/Y/+YT1ctAqCbtgt1JMKqO4qjp
	DxQSe+VLsYQ+2tWN2pzMRVD4tyl0UwGI=
X-Gm-Gg: AR+sD12TRQpBx1ZB7VGQf9PHLeX88r+UY03lXw+ei74/BeIjK6mW4R7LKndV4UcHu52
	P7ARlESmdUuWcAOsibYnVHcuqgKuqwMBd5Nz/XV43X9y/8FKXSQ168nVP+U9PuKtNSm3Q5q6LE6
	odwDDM6H9ENRNKkl2vE7c4KTd8fixO96yrP3gYVoBTNhPk5WphKiR/EIils/BsPnIQq221BabLb
	AmkerHjNqy95t/WDiYegC/EFn7uLkcjXAhvftc+7gViuiyODYc5/fgmGqozQBzKm3NQpGxeKYio
	Rq+ghVv9U0wN1mealdRnQY9+oGPe3U0MT6IhJu2mgMoD0m3Z8PshOfIIhc73Drika9H7I7tOhAM
	c8G9Ftqf8CPOfoNz5aKGz68iQwW4NVtEZv6eerzAeprEd8uIm3TAJvpjlhD8IW+uSOQ4H3895
X-Received: by 2002:a05:6402:210d:b0:69a:a9a6:61e4 with SMTP id
 4fb4d7f45d1cf-69e65312188mr6060598a12.39.1784595854460; Mon, 20 Jul 2026
 18:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260719214349.734351-1-rosenp@gmail.com> <YBsaITDCQyaUWFnnWTe4Fw@gmail.com>
 <al6ALM2eIWots1Zr@redhat.com>
In-Reply-To: <al6ALM2eIWots1Zr@redhat.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 20 Jul 2026 18:04:03 -0700
X-Gm-Features: AUfX_myGWf8CrBLd-qjrAwYOqQPA4YF8JvhlVdpAVRQMWtpDnQSDVL_bsBB8gd4
Message-ID: <CAKxU2N9VoHRUGGjEsMCEyGaMxoc=Bw0tuuMb-BYn+54DJRjQWA@mail.gmail.com>
Subject: Re: [PATCH] clk: mmp: allow COMPILE_TEST builds
To: Brian Masney <bmasney@redhat.com>
Cc: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>, 
	linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Marvell PXA1908 SOC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_180417_184789_A0BD1333 
X-CRM114-Status: GOOD (  20.16  )
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

On Mon, Jul 20, 2026 at 1:08=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Duje,
>
> On Mon, Jul 20, 2026 at 04:46:40PM +0200, Duje Mihanovi=C4=87 wrote:
> > On Sunday, 19 July 2026 23:43:49 Central European Summer Time Rosen Pen=
ev
> > wrote:
> >
> > [...]
> >
> > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > index 4b2c089f46a1..8383f9f1da51 100644
> > > --- a/drivers/clk/Makefile
> > > +++ b/drivers/clk/Makefile
> > > @@ -130,7 +130,7 @@ obj-y                                   +=3D
> > mediatek/
> > >  obj-$(CONFIG_ARCH_MESON)           +=3D meson/
> > >  obj-y                                      +=3D microchip/
> > >  ifeq ($(CONFIG_COMMON_CLK), y)
> > > -obj-$(CONFIG_ARCH_MMP)                     +=3D mmp/
> > > +obj-$(CONFIG_COMMON_CLK_MMP)               +=3D mmp/
> >
> > Could it be possible to select mmp unconditionally, like most of the ot=
her
> > subtrees are? AFAICT, that would also require creating new Kconfig symb=
ols for
> > the PXA168, PXA910 and PXA1928 clocks, but I suspect it may be the more=
 proper
> > choice in the long term.
>
> Just by sheer numbers, the CONFIG_COMMON_CLK_XXX approach is the most
> common use case right now.
It's much simpler this way.
>
>     x1:~/src/linux/linux-next ((next-20260720) %)$ grep "CONFIG_COMMON_CL=
K" drivers/clk/Makefile | grep "+=3D" | wc -l
>     68
>     x1:~/src/linux/linux-next ((next-20260720) %)$ grep "obj-y" drivers/c=
lk/Makefile | wc -l
>     25
>
> I have no strong opinions about this either way other than to drive
> consistency across various drivers as much as possible.
>
> Currently the mmp directory currently only has COMMON_CLK_PXA1908
> defined. When the other PXA* drivers are introduced, will there be a
> CONFIG_COMMON_CLK_MMA_COMMON that all of the drivers will use?
>
> If so, we could put that MMA_COMMON in the toplevel clk Makefile.
>
> If not, then yes I agree that obj-y will be fine.
>
> Brian
>

