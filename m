Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D50CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 14:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZCOMUry8QgJDtmQTlzvKx4nzmcRl8rasbY1MAd0sQY=; b=n6Xz2IY/zmW0pgD5SsttVWY7ZY
	afEZooRVwg6S4jKlOFIXtlVmEOvObaWttQWbGZmW4KffINJJhMVoUgHoRizNPuwiRqN81RxqA+7Kl
	wuMw81zeo+zoCGm+FzVzemIFFYDRouQ7e/ITcUfp7QXBG5Abuw8b24bKx/b2MmJiBiZTH73a6rbuA
	tcOy+1vSZY3weJcV7XtuPVoqtAglaBgK8s+GZ/8FzcB3RlxqtAFTy4mjcB9Yedeb6lAqpo0TQ7i7g
	h4pJvc9kqeRC2EJAwRzuyX9Okiqzh6zunHrPr/PXp8dCANGtj1sGU+X7YdeOoHif37BbnnU1RFzih
	nCO81LPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDZI-0000000HMZ5-2W1N;
	Tue, 21 Oct 2025 14:42:32 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDZC-0000000HMUm-3zvs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 14:42:28 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so5463087e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761057745; x=1761662545; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZCOMUry8QgJDtmQTlzvKx4nzmcRl8rasbY1MAd0sQY=;
        b=VcLv0oEZn0R5mES0isKVF1c7f29ZHDkGWfEQ/D7BcbSUnAT3aZKfRf+OUJDgDVHDLH
         3DT0Cd3N0T66DDxQ5FekP63XrjVzTNSbpE1T/Ofo4Phe5ak5NVXqdIMuYIYGw06Tyko9
         Cq+Km61mSX5H9F3RJRkw3yiZteifgTSO+HTsbntMNwHIgXTghR+GKCLLz2Og8arWqRyM
         cIoPmqI5v6k2RKNILG0t+qnBk882p0EOjbhfGcV1f4CrG3Pe1zM0paAucOC9iq8Pulmy
         ecYsAfwyhLfOYdMqJHmSSLd29D2NrzidsYeaHsdKVfxzu2Nt0gd9VEPHVi3gB5ioMHQE
         EaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761057745; x=1761662545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZCOMUry8QgJDtmQTlzvKx4nzmcRl8rasbY1MAd0sQY=;
        b=KZw23UKRHpHoLdPK4cLT5V+J9DjvrIjaPzowa+T5Kfszyuf8KvDG2fZeeV1/0yIe5L
         1a5cluf+cgx6zw2Ol/GXkyRVVfLPB7AEWNasbQWUE4O6KPKtxdJ/VFVgDgMgm/L/H9Zf
         +JBCCKHT2Dv6+uVPY3WFBou1EN4g4oFkOorq6CYwCAn474flfyAPVmMl5nU7Ts30datU
         GIK3Wx5VSUN4u4O50L4yFeQ8RBiSoh7QaxJvdwAJX3g9V9DvjN+XdvPmjDy94uJlnHIb
         n4mTZVVj9WE8mIoZxeZV9rJJNGn74Iq79IbBbXdCvVMqmYv+U+x5MWVxFtcXil6YH7Wr
         5gzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtq+NN+95/+6ef+p0Rbk53Vd5SfKcQ4OYhvnw8982Cty2JJ2u72eFDTldBJOu+yGPZZ14JqwxaNeijZMkktdb8@lists.infradead.org
X-Gm-Message-State: AOJu0YxJcAOFkPeV1pHSnGFetYUbtcUto+BVFBqrzRWn+iOEXIsqdK1f
	fGSV9QrY9i/5q4erP4R0wt6zcoBO2SfZS4T9wrohHKtW0ECOkUWg9oNKTC3pdhncYULSbF2C/cq
	O3J07ipAxvzz8uFIXRbXGeePQzOVufnTjsq480xj8cA==
X-Gm-Gg: ASbGncsj8a8H1Rgt2izR+9XLAuPBwtMd1mDyvMedbDHaWzT4RowLzO1ZaUFtPBpJ3Tw
	VMxa50KegnPP3jJvhLtsa07JDUoCPv1dRE+/RVY4sHltQ1fWz6WycZsm8K1F/TVdohYrdqav1ET
	KtZ4K+JaDsb13iN7gfDjThfOseHcW+4GKEWvfhJE+yYTIfvQ0NF9A/B9AVjyf+oE0QP3G0DI5wz
	Tg0spRVOR3gCWZA9XLb3T8YwpSujfeYOIeK+k4jK6gDhcJXfXr2mMgyZgjunW/kDyT2GrTQN0Wy
	Z9Phhx/dA5jB3zp9
X-Google-Smtp-Source: AGHT+IEAFGsFmUFG/YnJHTCDdPAr/87ZFEb44yMmd6QhcxQ6kY+xN7c3ywaYXlVUOsQLkH0hiixQGCRd64K7uAmIpvc=
X-Received: by 2002:a05:6512:4014:b0:586:9636:6e4d with SMTP id
 2adb3069b0e04-591d85622ddmr6106679e87.50.1761057744764; Tue, 21 Oct 2025
 07:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <CAMRc=Me4Fh5pDOF8Z2XY4MG_DYqPRN+UJh_BzKvmULL96wciYw@mail.gmail.com>
 <81bda56c-f18b-4bd9-abf9-9da7c2251f42@sirena.org.uk> <CAMRc=MdOCHJEyPxN+-g71ux68=Mt_Q5P9611QO7Q8J9e8UJv_A@mail.gmail.com>
 <0e1f3a1b-46ab-4eb5-ad05-70784f9b9103@sirena.org.uk>
In-Reply-To: <0e1f3a1b-46ab-4eb5-ad05-70784f9b9103@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 16:42:11 +0200
X-Gm-Features: AS18NWCeEZ0pLB4tS_IEx2MtW9IQz_axw-1Q3NqtyOuzDmGpEP1ZzpOriXTSxmo
Message-ID: <CAMRc=Md1Ve4hnYQOryYEXG6_HSPJrANrr9gj2FMzCwsD+q5Cuw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Mark Brown <broonie@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Catalin Marinas <catalin.marinas@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_074227_246003_7B8F27F3 
X-CRM114-Status: GOOD (  18.30  )
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

On Tue, Oct 21, 2025 at 4:08=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Oct 20, 2025 at 11:41:52AM +0200, Bartosz Golaszewski wrote:
> > On Fri, Oct 17, 2025 at 7:32=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > It really should be the actual physical state change that triggers th=
e
> > > event.
>
> > I guess so, but this would require some non-trivial rework of the
> > regulator core. We'd need some list of deferred notifications stored
> > in memory for when the physical state actually changes.
>
> I'm not sure I see the need for deferred notifications?  We'd need to go
> round all the users whenever a physical change to the GPIO happens but
> it's not clear what we'd need to store beyond the list of users?

In my mind I was thinking that we only need to send the notifications
to users who already enabled/disabled the regulator too but you're
right, it seems like a loop over the relevant pins should be enough.

In any case: this is outside the scope of this series but I'll see if
it's easy enough to add separately.

Bartosz

