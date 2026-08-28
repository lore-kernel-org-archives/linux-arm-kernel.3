Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B82C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 18:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ko7FEedg7fFwoXFuQeT19PTOVSQvIh4a9+NymvSzdZI=; b=Mu07CnunXnmdh3RsuzqERVCBEt
	0Tdys0JmFqJE1n+wwa+Ot5FC9h84hpFuElBdnfEjtFO6Zskr/ClVd/QhcXy/vrbJwVKVWdzK6kmAs
	swmmZVZMHy4oKshKcPCqqsKuHETurlbWWRH+vWVzYvprDxOl8ldaI2uwKo6hn1muPcrTY7qt6QWPM
	sRcIS+Zr8De9jSk8Fj0MKzLNGDbrhTwYxL+5bv/L0p26huPsu0lxT9zo0BlozqslqfRDD7OwOECV/
	nwauX53WCj85yqvZ5XKAndLXXvx6XV4DWvRV8A1E+Dw6ZPrPKMPE32ayz29DstQKjnKJJoYJ7OHdu
	B2rOPPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x01aO-00000006Jpf-2kGp;
	Fri, 28 Aug 2026 18:45:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x01aM-00000006Jou-0GtJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 18:45:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-499add6348fso6005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 11:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787942751; cv=none;
        d=google.com; s=arc-20260327;
        b=GiyUO0JuwOmvwatR5JcSRrAMOSA2XmlRxIZ3Hvi46YczYp2n8U2LZPCqoJmBMKAFH6
         PJ6hKPOGQS+Asl+jVseFEVp0fzyc9+glCmgLVat4WYwRrQccpuTXzun01ye/RbGxztmk
         EOnfCFzc3wlvjnJCZXhub1foayk6BVMVCeDXOR2XxAGbWcWIYP1fbRvh7w+1ljMx9xNC
         c2lkHKb0gnYIaQpNjj/20wpNdDOpnLUye/merVqIrP3no7fHwxKAo8qWm3ZYOlkM3ACz
         GhjiLhEW4MRSYBuWj1ULlXcE7EV7RoH2MX2Ru82bsTfT9D7MV9lFExZjlP3t3lxgtLT0
         +Asw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ko7FEedg7fFwoXFuQeT19PTOVSQvIh4a9+NymvSzdZI=;
        fh=Oc0N7tCeK3KyV093fJvlI4sKvTjOJe/E0BTrABGNRf8=;
        b=BCI0rW2OZy/2vNsWOgaNABtijyhLYcFJ9gkLCwEMixbwZ5kxFQHtvEh0DKE4Ot/IyD
         pcF0SBF+hfkzW6+AV2pHNbdLmXfZOOD1dxiRlM2O3st6ccqWGQXKJ2c+d19PJdhSgw3A
         IhMBgbfmHBiDlb6zfgtRZp1vWmf9/4NO6eWh9ODnO59hN/jLZWwVJlRHKx3AY6UueUg1
         toV6P0MEdO/YGogWNF9B8HHEFkB6kLHmIFiuNTHPXy6brFuJRNta9C+okc7JsputliS3
         x6BQ3jgsAzCpiwO7MqH++ByF800Xhc9s9S6xQt6i6hyfKPTVCXQIJLFoYzRymWPvOk6r
         u31g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787942751; x=1788547551; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ko7FEedg7fFwoXFuQeT19PTOVSQvIh4a9+NymvSzdZI=;
        b=aUrNpWuof8EitI2OYvux7ELw/1BOTn+qiT+epcPoQrcM/GGVHmv2253ZsLzj2ietsY
         T29/IHlerwMP+C02/9JNpDBun4bZ66AH/kQikHV4SYYLV3efFOriiZWLR0HTTZTq8aj0
         xz5/c+9qm2SexwF9VJQBxv/52FS/ZvbRiDoZpl60RJ/3eyylosfoWnVKUimoHX1uirKp
         NpGdFbh039ebtgTDxnt1RjoohgMoguDt+tG316tMxDunUteE80E+FYg8NeBnDWPKG4JH
         7WuXC4e69uqWmg/Cxnof7UJAk4ThLENLsDnweTc+pgm26CIsZz37XQpOZqtLgld2KsQn
         WmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942751; x=1788547551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ko7FEedg7fFwoXFuQeT19PTOVSQvIh4a9+NymvSzdZI=;
        b=FZ+GGALPmS11gd09z4uRtoiS8CZUvPDlBzHP+xpL7e+CcPBdFKTuKhcWje8MvkWV70
         42zAaPT1GxkJIaKsa+KZSBoFn/a7OqWS8VP4b89LqCFYhTqvRFHyTD9COzcoR5F/9y9w
         bCOuS6EZOaD0qxGk/wVF38KWRfKg78SvFky/eMEaq5lDs5tnV9gZ40O79kVfPouvT+oG
         eOUbeAld2LFFOrpD2m/Bo5fH/P3yrcXaOxiO+fqwNPGxrJcqpCeQmepv9vVD7gSX6nx2
         E0eepMQz1sdhaNvsxtQPEoT6ENq9rs7qOcNm35v+zu43T4ms3366AfN6jww1uvYPwwe3
         iJFw==
X-Forwarded-Encrypted: i=1; AHgh+RpZMsBtilpy413plx61Fzfbuwwi0+XFm4L47c2dJUERe20yH74vYr9p0ezVdsC/seu6+vYHbOLiwWPqedTzwZBR@lists.infradead.org
X-Gm-Message-State: AFuF++mDOpVLjzPqzFivbnMXnhPn2z45gXxHr44kepKuyQWZx/vRECU+
	ughD7kEcoseRLt30jFg1/nMCu0XyOsc6WwASGzq/5qVRdaFMGUsHoRC4NyidWwojEK8h1YDu/OJ
	9nQc0sMOBfzUg8ekFqfrKU6RjxrB3HxVdaE9n8K2X
X-Gm-Gg: AR+sD12ECzRTUmC1n91ptyYcgM74us6ICrtwO5rQ0ji+wgGNlArszchZHaY6lZGwr1z
	Qp6TWkw84Tjmzyvigk/mLzdcJ9mRh71qAFgcl3ujbOok4TOAKKh6T2eAEhZ7Ae8In4flPE9Qsnk
	OBKK0fplfUoWUYx1KNnvHJPAGL5ZS6HlHssxewf56LSc+jerh7tbnB6VAD3Tl5n9VIQTKXlPUT9
	nO3GLtL3H0JLTqnHJxllYCRt1X9dEKZhzuHq68UqmBKCaCU9hDu9aIiKtKHjc3StJURHLo5fS3u
	ETnQCzGi1zkMF1Gp47NeZ/qqaBo8bTzFRxKNvOKIBw==
X-Received: by 2002:a05:600c:6549:b0:49c:1295:45c1 with SMTP id
 5b1f17b1804b1-49ccbb8a4f4mr63075e9.3.1787942750098; Fri, 28 Aug 2026 11:45:50
 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
In-Reply-To: <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 28 Aug 2026 11:45:08 -0700
X-Gm-Features: AcwNN1Wx0I21Z8-gsT0HKzRa32m8c_GTOdvUPjQzxP_d9dv2tDYvd9upqY_kuJs
Message-ID: <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Nick Desaulniers <ndesaulniers@google.com>
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
X-CRM114-CacheID: sfid-20260828_114554_121037_0C19F857 
X-CRM114-Status: GOOD (  16.78  )
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

On Fri, Aug 28, 2026 at 11:29=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Aug 27, 2026 at 12:46=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.com=
> wrote:
> >
> > Note: linux/uaccess.h is included before linux/cfi.h because
> > cfi_get_func_hash() uses get_kernel_nofault() and cfi.h does not
> > include uaccess.h itself.
>
> Ah, no, we (you) should fix that. include/linux/cfi.h should IWYU.

Nathan fixed this here:

https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-b2=
7015390901@kernel.org/

> > -ENTRY(imx6_suspend)
> > +#ifdef CONFIG_CFI
> > +       /*
> > +        * Pad the location counter so that the type hash emitted by
> > +        * SYM_TYPED_FUNC_START() below ends on an 8-byte boundary:
> > +        * fncpy() requires the function entry to be 8-byte aligned.
> > +        */
> > +       .align  3
> > +       .4byte  0
>
> I still don't like these assembler directives inline like this; this
> feels like we should have perhaps a new macro in
> include/linux/cfi_types.h. Thoughts, Sami?
>
> One that garuntees the 8B alignment of the symbol for w/e that
> function patching routine requires?

Sounds like arm should override SYM_TYPED_FUNC_START to add whatever
alignment is needed?

Sami

