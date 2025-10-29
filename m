Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00066CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 12:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7av6/+8iNuXmmgvTwlUka4Y7XmkOmuVd9YoxH52DeM=; b=q+jwVbBjCbiiPIBa0+D2uXKLUD
	PN5Kc6TsmIKwOQM+kjS7to+BLEZtcgOTLRvR9VIng6ZrXnkaAGxgjiqEBIxhqSShUiCBnROTfxB9M
	g65ZdRTVfpmjymcjxd0MmY6dXqXS+XooMyMUUUtxEtLrZM3n65OWZwLk222SAmYWgzEVxDBiaQe7E
	XqOV1z+pl9DDlRDuhiteRnkNBu3UiGu7KH3ytoK+Ev9tbiZBdzS5V1yhfX1FFTi2Y2Ma36doZiOI1
	VMNNVIjOgkJbjAtqvSnYFl8LvO3VtK7CxbRV0jr26b7b/eSULyntA30/gTrCwLNM/GrTyrvcJJcU0
	bTlSleiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5QN-00000001BCP-1kei;
	Wed, 29 Oct 2025 12:37:11 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5QL-00000001BBU-2BVI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 12:37:10 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-57e8e67aa3eso1500957e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761741427; x=1762346227; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7av6/+8iNuXmmgvTwlUka4Y7XmkOmuVd9YoxH52DeM=;
        b=1TwEjPutJJccmtDR2T0cfPTATSrk+QN1Mbp+Qghp66kADoV+zNjYiALeZbzjjbwgak
         QJDGWjp2dACAja04SXNnXsfd/RVUeXL/jyk80Vt/GPXsL7wVPG5PvJFFyMRXsVLLPnel
         qtVhhOmJ5uNTaoizePoeRLTDjLrMcqghwHkqyv4s7W8DJqii+Wp3ChFzafBPPG4URQ5E
         TI60ILsvuKe+XJKB1H6j4pf06Mj+ZKSI6/a9ykbZI19KtiFs3acYO/9ema/5T6DhdDnJ
         DlQzm863bsdfM7evqO4NVCIfEzMD0A+4qNnEZXTTVKalkdnJAEHAGMnwj96r0UnHJVlm
         VrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741427; x=1762346227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7av6/+8iNuXmmgvTwlUka4Y7XmkOmuVd9YoxH52DeM=;
        b=VAN9UYzkevMu4Lu0fU9qo8unSfONsEPHklYD8r7Da1ajv5JaxKvl4YNf6IT3/8S9wd
         cLNUpGVr4d/1M1n6DKMAkULCcrmxJOMrMFFNNuWtyhXKl+oPrVXuEuMq80PgUmEjhUy9
         zf4ux2BVZVXGakx+tqTmY6tBFpGKEacwk9KU4Qfzz//120fTH7t84WaEDdmh1MZ0v8x6
         cZoc1+mzEZZGmKp6vRPLUZRydvxBklfJqaE2GOjBcbvokf0pq80RIMeVtci/deUl/B0q
         y7g+uuWbjWXY9RnWG/mA9YSXit/SetMvUgxsx0u3zYC4XoNH0eZmGpn80nHKJo1/0fGu
         W20Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9S8a1fPLZdhDLXNSHYNvV6gbpyGfsrO9rLEkR0yatPIleayGDpc8DXwSiu8maM4010hY7m6Xm3khapSPc7Mt7@lists.infradead.org
X-Gm-Message-State: AOJu0YwXz6Zwp2Tv4HtItL+N6MTRDhEOGnXobpnM9/j2rDpxDjqMklEs
	xv8FNzfUH64t4pKkCTzRM0R98fd+xhHr9oW5lB2zB0D+ZiLxcSaKy0gwvZdRtiolEZls62S5XWM
	45UcwvOs+D8SbwRXJ/5oYIfh1AEu0r1qzbEGzykHl0g==
X-Gm-Gg: ASbGnctMaWbg8a5vYIHHfFhaZ7I4KU/qfdkL56RreXnTPVtG+xtHJQ0wDzQReJADhEc
	G+DsNXhtijLWs/4MngCe60SG4oVzQUoTF1P+DBzMeptjEDgJcDZu2ISu56J/yjuH76kEZ0JPr/s
	k5Tc1f2gnwSJQFf0DGW2T7OOIC5yJRViHq5jkU/21bJZoPn2DX6q56bo7kANWU2t9H/D9NYIqc5
	Vhsz7Jvev5sGAOSuBfUXJMGwHWw+faEki90bQEJCIgOwHZBhhwJNOAOtV6I7bcsc6zb9JsIwzoW
	yWSS76e1WLbVI7JWCLUvTcOxLjk=
X-Google-Smtp-Source: AGHT+IEUmGu04036ormM4pltNB2Am321w2VXbEnKTAs3EJCIFCtIkYSiyRchfH1o5wZ/LZR6U90hsv4wZnUUYh2RdrI=
X-Received: by 2002:a05:6512:31d5:b0:591:c763:78e5 with SMTP id
 2adb3069b0e04-5930ee00135mr2032537e87.23.1761741427164; Wed, 29 Oct 2025
 05:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-1-71c568acf47c@linaro.org> <aQH9gE_fB119CW3l@smile.fi.intel.com>
In-Reply-To: <aQH9gE_fB119CW3l@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 13:36:55 +0100
X-Gm-Features: AWmQ_blmOzETrnBiOxNQNAG3OMw6fz-E4Nx4SOD4Wgu8a41SpvuD7mJ9RHyBeG8
Message-ID: <CAMRc=MdKfXJx-cxNr1uOCkifD6YVE2t5w4hkuYy7jcnidiid2Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] string: provide strends()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_053709_578164_BB0AF265 
X-CRM114-Status: GOOD (  21.32  )
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

On Wed, Oct 29, 2025 at 12:42=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 29, 2025 at 12:20:37PM +0100, Bartosz Golaszewski wrote:
> >
> > Implement a function for checking if a string ends with a different
> > string and add its kunit test cases.
>
> ...
>
> > +/**
> > + * strends - Check if a string ends with another string.
> > + * @str - NULL-terminated string to check against @suffix
> > + * @suffix - NULL-terminated string defining the suffix to look for in=
 @str
> > + *
> > + * Returns:
> > + * True if @str ends with @suffix. False in all other cases.
> > + */
> > +static inline bool strends(const char *str, const char *suffix)
> > +{
> > +     unsigned int str_len =3D strlen(str), suffix_len =3D strlen(suffi=
x);
> > +
> > +     if (str_len < suffix_len)
> > +             return false;
> > +
> > +     return !(strcmp(str + str_len - suffix_len, suffix));
> > +}
>
> Can you rather re-use strcmp_suffix() from drivers/of/property.c?
>

I think that strends() and its boolean return value are a bit more
intuitive to use than strcmp_suffix() and its integer return value,
the meaning of which you typically have to look-up to figure out. If
there are no objections, I'd like to keep it and - when it's upstream
- convert property.c to using it instead. Also: the name
strcmp_suffix() could use some improvement, seeing how I wasn't able
to find it, even though I looked hard across the kernel source, while
I easily stumbled upon a similar implementation of strends() already
existing in dtc sources.

Bart

