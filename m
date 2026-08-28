Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC50C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 20:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqevhQmDUlAlxZrxi7igRupcRfpHxunuXttW6NuOQbw=; b=h97tNdlMmOfspwYx17mB40tiOF
	2qIMj+gHDeqWz8MCfrJFAoV4sFFut+L48ebmAHl8CgrNKf+e3AcQJWWKzWubBvhF7V4xnC+OR6buo
	+dE/UMvtvnLMWxLBoqUAnTJqSioea18jodIvVEF65AbQ2urzvjE/GciZG0TPMyg3eNbp8fZI2O3p2
	TvO43b+BcWBdMP6Q+GqmkTy5rcX8vJVuorQOmWhbwgtfAx18VzZlAIO0LW92+gE2XAAakE8Baqwhe
	PEKD/NgV8lDoFwFJFDXpKGE5cnSa/bzx/szRYGiLxvAJVRw81NUl1MY4+gM7dUyI4vU55p5N06vCz
	4GIrRSZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0336-00000006ONO-0AsB;
	Fri, 28 Aug 2026 20:19:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0333-00000006ON3-38d0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 20:19:39 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so835790f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 13:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787948376; cv=none;
        d=google.com; s=arc-20260327;
        b=Lt7SAoCp39soX39BPWUoIPRyS7YqpPUpFAKySeiamR+RBwcXu19MHuKYVJdRjypO/n
         yCy4KYo5GTMopkU5PVcrIRvYNoL5laFgPI7fPaDDRs4u0sfS4PYnBGATu4dXQAKTCyDp
         YSC/b0P0+Zm4CTmWgq6/RPdxHH3dpsYBfCOhNkWB8fRBPkY5/lhLdlUoggFVJS9TGzgt
         ioCXTKy8ClDIrmc7lr9qMejc+LJWWeKuUVlyPYwuDNh1pUxVUV+TBGwV7KXny/IRxxdl
         NfKDfFihgKmRh5vfZganoh08sWRRkeUpfLDOqUwfDnrdjvIjCOEvB3HEVa1iKfqu/EN9
         9tig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AqevhQmDUlAlxZrxi7igRupcRfpHxunuXttW6NuOQbw=;
        fh=xdWy0i4pD6UHhJ/Exe6fMlsYtBlnwT+cF+fNsbsIimM=;
        b=PY+ElMX9v/u4a4hw7YcU1/fbpPnKMong4PeaLDEm7yJSzXY50JqWRK8K2fe6iIf0kK
         Efnmo9ObE7FV0rdGU9HP1KPDlLZUD4Ldcu2QOIkoFTK/OsxEx6hcB/cFUn6yPQ5aR02V
         l4t+pL4R4YYqf3sgMeG0+bBEocwpCRWwgWJEU/yIl0R/iiDEGNApbNmKgKg18lfF+0kM
         X7GpgcrxGJ/M45ltcJu18I9EJXNq0viww6OFOHzb5CFYmLWV2PXTdGft1Om2bWgo/oZb
         GwMBjK6R74cq6H3f4f9jpz8/ai+QLIxcSzXYXAt0DBXDxZ+O/9d/5uhySPfK8oaOaJ56
         H7Gg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787948376; x=1788553176; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqevhQmDUlAlxZrxi7igRupcRfpHxunuXttW6NuOQbw=;
        b=SeVWqE0d//U1nq5XCMGbYBWCDMHR0nmw6q1YAMnSuxmIrP71iIhXVlST7zzrSgoVyj
         UTztcTyKka6D7e+nFewAGkISRstWZj/e7I1YlQbH6hreK3xKtDCI+kLthVGNZYD5h5XU
         S4VfuFGA9xrnqrWfZaUENb86tl0P+/SspyvjXYVXToLgQGTLJOO/MrCq7OBzTp/2z+Gq
         b378MIYkWp2wKdKy7OpTsS94SNwz430eug9Hl+T8xn9rU97spUfQm/IkrbcxQf5hTzZk
         tAsXdEiizENb/ztdphQqTFn0MxVXl3bgzhyFGO02BiBfHEtFJtBf0MhWBA0+0kfZktsc
         KDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787948376; x=1788553176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqevhQmDUlAlxZrxi7igRupcRfpHxunuXttW6NuOQbw=;
        b=b6MQo674VRSvt6tFqvgxyK4T89BDCTtyS/Qu3Xp3HIuGH5PaD5wBLN0XSAnaVYsnDt
         xT2Cah52OhgaiUfUi9GtGkBSgHp88/tYSTUCQ1YC5n4cpzch4cNLX/JuedGRoRyoVoAT
         TFXhdZAzidFHS8CxV43daS6H93+CvRnG0GGcLK30UmOd+SVdM+B2vfBu7um1jeJOwUEf
         KYBqsuHMgSsumuZ15VnUEyMpj3b5+uqTea2TB0bboKPyj8Ri2PhhmCiGStj58tnBDs1w
         51mxEBjQmMJL7t6MtFMkTJ/t2GQwAY7JenNQ/ffhA3QRWlzovCReXvquyC/WUxo+I2Z0
         3zlg==
X-Forwarded-Encrypted: i=1; AKwUvBzsNTtkG9sgf+Gajk88Z7UTKob+2xGXRYZHeclNPivwNkuGqFeDmY1Yxl9H6mmRLIOqBEDWq5GwlUUR6D3ustf8@lists.infradead.org
X-Gm-Message-State: AFuF++lX/hil++eiO67i5QvC4T9a8k/HH+M1SMIMG5KfA/cDvSkoMDIn
	FPdE4OmbyRTGv2/a+6HR780n7HWF2MlxEuwVWn/YrIShs4amRsi6IpzgSYjmUFKLlTlNIij+1rV
	JsaPjmGS1Qg+f9HewP93W8QSH+/WclUHNENsDVNLT
X-Gm-Gg: AYBFou2EQwPphIlVGIDdA4RSaBJkZX7H7Lh8GdrYWsaOXxFKFsK3/PA4cRMYO9Kbjff
	HENyrdX55NTW2ZO+2ouDjJj1kYCGtE81Bxg57MVZZOQN7ixZ1QWR2QqNEr1M7oSTQdjUIALuO6x
	bQzN/bJZv366zSOQzA2Z01ZpP81f2GcORpU8oDzb2tRPIIu0wEwWI5P2bwuobqFzpJrUDJ1rfKz
	SHa2jDFyn4n4Go9nsmXuKjIgsSwr8gz69vny2toUN8M5c6bSG/t5wEJr+DzZC2fNmX4oQfCWofV
	NL82I4MJP2Yl+mRFy5WNRmj2dWmESsX4l9b7JIpcGsgKmnZFI3TjxzYcbs4+C85rBL5y3IVZVO+
	zTULl197i6z27sXQXnwRAOi8D1Xz8ctQ0kT+cewQiwWvFEPAkG/zVOSpoGw==
X-Received: by 2002:adf:e191:0:b0:482:e6b5:61c with SMTP id
 ffacd0b85a97d-482f7983567mr15853702f8f.8.1787948375179; Fri, 28 Aug 2026
 13:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com> <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
In-Reply-To: <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 28 Aug 2026 13:19:23 -0700
X-Gm-Features: AcwNN1V_2kf8BqMVIZlH3wMy_YFAxnJPsfByyKc8QzliKU08PTCWPTO7ull2SPI
Message-ID: <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Sami Tolvanen <samitolvanen@google.com>
Cc: "Yo'av Moshe" <linux@yoavmoshe.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_131937_807791_3B63576E 
X-CRM114-Status: GOOD (  21.75  )
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

On Fri, Aug 28, 2026 at 11:45=E2=80=AFAM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> On Fri, Aug 28, 2026 at 11:29=E2=80=AFAM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Thu, Aug 27, 2026 at 12:46=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.c=
om> wrote:
> > >
> > > Note: linux/uaccess.h is included before linux/cfi.h because
> > > cfi_get_func_hash() uses get_kernel_nofault() and cfi.h does not
> > > include uaccess.h itself.
> >
> > Ah, no, we (you) should fix that. include/linux/cfi.h should IWYU.
>
> Nathan fixed this here:
>
> https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-=
b27015390901@kernel.org/

Ah! Then this series should probably be rebased or include that patch.

>
> > > -ENTRY(imx6_suspend)
> > > +#ifdef CONFIG_CFI
> > > +       /*
> > > +        * Pad the location counter so that the type hash emitted by
> > > +        * SYM_TYPED_FUNC_START() below ends on an 8-byte boundary:
> > > +        * fncpy() requires the function entry to be 8-byte aligned.
> > > +        */
> > > +       .align  3
> > > +       .4byte  0
> >
> > I still don't like these assembler directives inline like this; this
> > feels like we should have perhaps a new macro in
> > include/linux/cfi_types.h. Thoughts, Sami?
> >
> > One that garuntees the 8B alignment of the symbol for w/e that
> > function patching routine requires?
>
> Sounds like arm should override SYM_TYPED_FUNC_START to add whatever
> alignment is needed?

The 8B alignment seems to be a requirement of fncopy() for 32b ARM.
But functions in ARM can have 4B or even 2B alignment w/ Thumb, I
think.

Doing such an override would add unnecessary padding for each use of
SYM_TYPED_FUNC_START where probably none of them have this fncopy()
constraint.

```
    #ifdef CONFIG_CFI

    #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
        linkage(name) ASM_NL                    \
        .balign align ASM_NL                    \
        .fill (align) - 4, 1, 0 ASM_NL                \
        __CFI_TYPE(name) ASM_NL                    \
        name:

    #else /* CONFIG_CFI */

    #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
        SYM_START(name, linkage, .balign align)

    #endif /* CONFIG_CFI */
    #define SYM_TYPED_FUNC_START_ALIGNED(name, align)        \
        SYM_TYPED_START_ALIGNED(name, SYM_L_GLOBAL, align)
```
then this driver could do
```
// fncopy needs 8B alignment; see arch/arm/include/asm/fncpy.h.
SYM_TYPED_FUNC_START_ALIGNED(imx6_suspend, 8)
```
--=20
Thanks,
~Nick Desaulniers

