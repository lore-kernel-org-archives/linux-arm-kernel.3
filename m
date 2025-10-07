Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2B3CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 13:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=264X1qDN3aQAP8Oh7tuky79CRF6X9B+bbwWZ9c7oerg=; b=CEwFZLJyeNc4EcGeb/+kKjVNZo
	e3Ws7h3PQdbTSdxUkqFcjCQ2vG5cJxjxJmr2fw9a121+5Lej62+oFcfQCsvlAfLhJ1Fk67BWO/taY
	XEMCptts31YCjWYDqk6MV/8LsQqbVNWr7Htz6/1bAzybh26zaqym6MpKGi4EJiQY0gwY5Gb0Lnpq2
	V0jCzqR5X0Ol+Pu6xsOVARo+Mf3Hvx2wWCEvAKy82oK9kY0+vgjQC3id0rfD14t8eK8ginxthfYrJ
	iQoJ0wENUZdo5biyPLjnIwb0Iz4sFaG41W0eqfaejEkyruA/LQYviclaAt34MB1l/glT7LKDuzDSf
	8Av3FPbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67dZ-000000023bc-2ene;
	Tue, 07 Oct 2025 13:21:53 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67dX-000000023az-1voZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 13:21:52 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-371e4858f74so70606131fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759843309; x=1760448109; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=264X1qDN3aQAP8Oh7tuky79CRF6X9B+bbwWZ9c7oerg=;
        b=zW68hh36VVlfU5NEjNcwh2OdbX92hzYfmQ2qEqgODu76SjkKF7i+nrI7L4sGQr+kD9
         I6M6ArtqvBqDNZ7gHmbtmpw+iV4XhJ/DX6YLNVHiY/REaSBs8SFq4Jzzds6rQFVXKABl
         lVCwFjMcyafa24XM5Ef1D8BTyR6KP7ld9FF2MiPUn6hmd9/UW3rtX8Z2F8dqSzR2lP7G
         cTVGhrSJBILabXG3qBmf81xKryzaoBph9RlHXSIh1KnJhZSLyPiSio5OD4Ee6Ub/KxzO
         GJ61pI9iOXQWzlM/oKGhe7uL5fcyhsEMeAQsI9PHjUYTB4DxLsqeCvJMFrjfW9GBNLUF
         /jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759843309; x=1760448109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=264X1qDN3aQAP8Oh7tuky79CRF6X9B+bbwWZ9c7oerg=;
        b=u6x9gc4NKTCmOYQvZmfxsiJeC3Q219ySKLdO7WT07BRfVvnnGUNhX7oTNzwTAyOUJ7
         uoT4QOo1B1qEvtdK5ebEtuJWATPT8SKcqr38oGSpRjoD7guGQytMLQufuqnHVRF5robO
         5vZTQW3j+/Ttw3g9zOjfM5451HFkOKVAaal9lqkqfLQmWp7nuesr+Fu5O2gP2kdqhgdL
         BtATyONeWbn/gP+XVIFmJqhXyhsV8z2LtO7A+TOHURKQIwMR88xrLo1i6F0zHrI8nx8Q
         XEmFvmGxlW36oD+BtQg31nS3JNTCypa7i/afvzkiiOiukB6fi4iM1/0QQ+KjYTJGZAPG
         gflw==
X-Forwarded-Encrypted: i=1; AJvYcCUijWVo2KeOU0TDBZw40UXQaHULJU/kifx/+pyO3YYsSpYnRKQ5+HcosDg4heTttL1wN3Dk9wk6R7ph2vi6YJDe@lists.infradead.org
X-Gm-Message-State: AOJu0YzBNHyIGPVl1/U2tfZaksT8QhUp7XVKywkE3FMO71Pj59DvK2Q1
	cPywdGNiDH0DWXCxwXV+MipNV1OOg8jebpxIfdWEM9uP9w6COBAj5WJtWyXIb/B9l2NUDNatKWJ
	wQ1pF9rlFJCe9s4JjFzyTZQ+jEuSkbQ/twNjPGcIfrA==
X-Gm-Gg: ASbGncuE0iZdkmbpC+5PV1vLJqdpJgLdOxMpXHFsq5+FL9c7rGuxvFem0mOWR5e5+nh
	kr3m4bIvfPDjhlDFAml8I3N8Dh9xAjrH7nthlvqo4/wtRaJxM2jWKic6mRKXIz153ApzEkCk9kT
	9JfaufLg4u3cZfvccw2NYuTWPTtCIEnyoyNmOvFhubItCC3GMDg8g0PEpewC+O9l2HngEJMEiwj
	8Y4TO7gx2EzYYJGqi8X+i2vPQDQsizcntIhmJ0ghvkT1yFZO2vAF4DyA0qaSIA=
X-Google-Smtp-Source: AGHT+IE2+IZs52lFcgfooqKpv3k1qTzL2NCFC1USj9Z26FyDVKNO8SnLmrjpEF3qS87kcFqgJsuw+/Q2h1TIfSrcKYE=
X-Received: by 2002:a05:651c:1504:b0:364:c083:2fec with SMTP id
 38308e7fff4ca-375f516a094mr10405761fa.7.1759843309309; Tue, 07 Oct 2025
 06:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org> <CAMRc=MfwEHGV-HZQURR3JNg1HatAeWO17qbRmkWUXTSBWj5jSg@mail.gmail.com>
 <80347dcf-419b-489e-9b0e-d901fbacc71a@kernel.org> <CAMRc=McaZV=tUkzDGMYxXqkuEYw_KasKcv8QGdjw709UYZuGhg@mail.gmail.com>
 <a9a4f33f-b6c5-4c25-8321-7b08a2afb8a0@sirena.org.uk>
In-Reply-To: <a9a4f33f-b6c5-4c25-8321-7b08a2afb8a0@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 Oct 2025 15:21:37 +0200
X-Gm-Features: AS18NWAcsMukxeTYbTWMUg8zWpW3gx9qkOJvdBd4XuNGAXfy8hVOWJV-QYlmbI0
Message-ID: <CAMRc=Mey+iRyKY7Ou=0LM1268r6_WuQDzYmLOU5MZbVoU1yugg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_062151_517060_8477D77A 
X-CRM114-Status: GOOD (  14.44  )
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

On Tue, Oct 7, 2025 at 3:18=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, Oct 07, 2025 at 03:13:29PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Oct 6, 2025 at 11:55=E2=80=AFPM Srinivas Kandagatla <srini@kern=
el.org> wrote:
>
> > > Yes, these codec drivers are due to be moved to use reset-gpios.
>
> ...
>
> > anything. And what about shared pins other than reset? 'dc-gpios' for
> > display, other 'powerdown' instances, 'enable-gpios', all kinds of
> > uncommon names like: `dlg,cs`, `wlf,ldo2ena`, `speaker-enable`,
> > `maxim,enable`? It's not likely we will create a separate abstraction
>
> Many of which, crucially, don't actually reset the device.

That's my point. While the function of a `reset-gpios` is quite clear,
these are not.

Bartosz

