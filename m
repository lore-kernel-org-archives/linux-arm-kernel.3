Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C76BCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 14:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOmSiTMyA8cqAorOzkSzQ5xujNoDEMVqXsbHnkkNM1c=; b=WLGaA08O33qbcTljz0M9aa8Qcd
	n18lfxXMeqgnrEVI61GmZWlI1ZadRBTrcf5Uu/+kn4CTOMxOt7If1LHAqH7OZ/6wwUgjyqyrGABxE
	tsfx/FIH/GevJjjB4vKipCVgA9xMsvfhTTNA54bckGX6H0J2+ab0f/5nOdpqvoLwKUPBMnR0lL42+
	M8YKoxmvtKaQqdFa/fxQdIz2tsFLVtEk/L0cMZxMmLClyZbhm8ZPzVEFHxbc3mHdP55WYKuLLEEgX
	YciUv74vsuge8eUMX07G7vqzcYbQDNVPOKly10CCi4jgoTd8deEFffYOad5YzRSQosw+jTSX79Grv
	fiPG/uLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkYq-0000000G52S-0Gvk;
	Tue, 28 Oct 2025 14:20:32 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkYn-0000000G524-2fjg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 14:20:31 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-376466f1280so90823201fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 07:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761661227; x=1762266027; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOmSiTMyA8cqAorOzkSzQ5xujNoDEMVqXsbHnkkNM1c=;
        b=eDXTgluZWtOYnkNkk6CsADmnG/9FoyyS6oGYuOFMA7Slqk54mf5pgfqDMrxTgMn5mf
         F9mhJdXXMBNs3zUNFBSU/7/3CROJdYQ1Gq9IGkU3fq6WzBfo3fW7hw0r/eIT4Tae3LBA
         LJDluy/CQMlxkICEL67a48nOGQ8Rw20zHszdaFKxDYK1tL+QY8VfOeXHcXc0ONWbUtWT
         YCvXHt5EA8RomU8V/WPIunKM6NtxjVAy9ZmmBWHeiWPWHP/qcwHtoB1Zn/1FYQJlI4Id
         cdW/Xt0KkSHrAmJfm/zk9fDmt0z1ch3O2KicG3InLawFbFN0CmFymVna8/x7gq2iHY8e
         yRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761661227; x=1762266027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOmSiTMyA8cqAorOzkSzQ5xujNoDEMVqXsbHnkkNM1c=;
        b=PEhPcj+DvSGXGatMIINVQhNFAJ78yBmjJ8nLgT1pvJiAFI0B2sCpufOmyX2D2P4iCe
         ycxzCKj7rDmDQx0HCMW+sAp/n9o4aCERPR94XyOlrrdpsmgdiGi4JdsiyRTAPDfsFP6T
         zXt/UiRgyO67vy7eBVG/7kPnzY6gK9cV3BkNx/V9VFWZR9xLM4WHkR91oN7uG72G+ZkU
         dQETAUjewn3RY/kYIS1Xt4xNUnWF/1Xzv2xZW6zWrTkCZTJy2VBFpPjbIJHb+wGkyrni
         5SCMKWTvovxVfD90iUrvLGlFyqpkt1F+j59LIVkvwuUpI/94Ton583KbG5RR5/k4SPFR
         j0Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWKZd3Zjn9p+g8GZPndNfnSod6Cbz2zFdNn1prRH+QZXT4MvIMTY5peIePlCkxpUZmp5GpxgTbGzVoIFJJW1FB/@lists.infradead.org
X-Gm-Message-State: AOJu0YwonpcvdPW1uHwFVYQrcHX5Dux5Sx4ybBaszxlEga3So2d8jBsP
	8cATrtB9yrYzq6btrdhAujnLhxmQxIb3znILwAbGFJaCPIuA0l8P2uQ21HyOqq+onb3rVYEME6C
	3i9VujDfhUuhiL/AC+9THtCbvCKUEUGLhb/DIdPvkTQ==
X-Gm-Gg: ASbGncuurcghos6CjkWE1d8Khd5jmfbaMnK+1+7mM0WslayQ+NberMF+7nt5wQPjXEQ
	/yC3WHrV9ooSDReawn6F6OKAACeR98GJ3/uZxkiPqSP4tsJhtb0OtIL4yCQAENOCRIJprHUykev
	CJakhfoQo1YDPIFdNittRZUPxXdZR0M/Iaf4LdW+PFHmDC9Quq7vPo6lOrYXpEi3tkY5F+RfXNf
	PLjYkKdPd704IvuHLl6ZCQ1oZXTUr+mKUOpHshQeU7MkozgRZOU5TZ1E3QFeIqZckwQrIpoF5AM
	Q4CTCzkx9ubHuDhDRPml4BQ1UwQ=
X-Google-Smtp-Source: AGHT+IEa9/49xzFtkrl2WuFSbF2nGR0Ee3sa2JYGGK47IcVnnhS7gaKd3pqPtDHg3v3/2iaUnvbb9dKc2W6cTL8KA/s=
X-Received: by 2002:a05:651c:2354:10b0:351:62e3:95d6 with SMTP id
 38308e7fff4ca-3790773c607mr10303011fa.28.1761661226962; Tue, 28 Oct 2025
 07:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <76ac5587c5ff3aae3c23f7b41e2f3eacb32ebd21.1761588465.git.geert+renesas@glider.be>
In-Reply-To: <76ac5587c5ff3aae3c23f7b41e2f3eacb32ebd21.1761588465.git.geert+renesas@glider.be>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 Oct 2025 15:20:13 +0100
X-Gm-Features: AWmQ_bkGEmC8OCwW4QksGegCfgNPPWl_EjVB0knvBjv-hfBoqYq6hENcwtWJ0QE
Message-ID: <CAMRc=MdcH-56_cJ7oDUhHRsJRnDqbss5ET-3yGrBffGmEK_ieQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/23] gpio: aspeed: #undef field_{get,prep}() before
 local definition
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jianping Shen <Jianping.Shen@de.bosch.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_072029_952830_DDA93456 
X-CRM114-Status: GOOD (  16.03  )
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

On Mon, Oct 27, 2025 at 7:42=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Prepare for the advent of globally available common field_get() and
> field_prep() macros by undefining the symbols before defining local
> variants.  This prevents redefinition warnings from the C preprocessor
> when introducing the common macros later.
>
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> --
> v5:
>   - New.
> ---
>  drivers/gpio/gpio-aspeed.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 7953a9c4e36d7550..ef4ccaf74a5b379e 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -32,7 +32,9 @@
>  #include "gpiolib.h"
>
>  /* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> +#undef field_get
>  #define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> +#undef field_prep
>  #define field_prep(_mask, _val)        (((_val) << (ffs(_mask) - 1)) & (=
_mask))
>
>  #define GPIO_G7_IRQ_STS_BASE 0x100
> --
> 2.43.0
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

