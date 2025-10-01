Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AADECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 13:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHbqmA3oKpic6IfyRvOOe8x31ZYEYEaGDwcq5aemMoY=; b=rW0n+w+5s4e94KfrrDdjq3lrAl
	rYJnCblB0SQVJVWIX7JWcUhF2VlYduIgZN47yUab/wER/1Ps3o2Myu7KTyD2wFZtPnYtTCf7qk91O
	hVSWR3IFGZFIXYbXOfuZQEI4fx9nba1m+EJgAp4aDv7HT7Pn5Fzsew9fgpQ/A8JcYyIla1lqtXyXH
	4z33XI8C7tP7X/cb5oSjNRqcTydf6ZVLj/23OmXtweALDR2932jROKzBzfocczC9UOyZOJY7gVvzG
	qs+35XBzdKHhgs0QfUH4yJv9vSClVngsxVf7fpD1hrgC/f4LESGGPci5GRtup4P+a0xUPmYKqZ2lv
	/MK0x7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wVv-00000007xih-1D6R;
	Wed, 01 Oct 2025 13:04:59 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wVs-00000007xiC-1eCc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 13:04:57 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-78af9ebe337so361849b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 06:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759323895; x=1759928695; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHbqmA3oKpic6IfyRvOOe8x31ZYEYEaGDwcq5aemMoY=;
        b=z9/1ax+RJoroOGS1IuFjkyApZ76VYEE2YcqKvKCgaKapsEJ4WIdEGkfOPHh462ts2J
         WSP0ooinK3K0W5IyQ5dtHHGQKHIH1p5sxpdzWznJXMPGGvVMtCNxd3vtQHBts0xJv2kr
         PE7fqyFOsODkBllMA67829Cs4c2FBj4125NK7cnmVkuTQZyBi20oUHQ6pV7LCOAqkw6z
         vitVLIfjK5VnhdDBgUzpUT2IHqs8MtwI4i2mZJ/rIJ7sBK8PqierOAwreyR5RHNXL75N
         tMlOex61IghIbv1HKsvAOlXEl507cq2XzCu2Mg4KRu07LSmhL91u8n+9m237Rp0j1Cku
         FEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759323895; x=1759928695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FHbqmA3oKpic6IfyRvOOe8x31ZYEYEaGDwcq5aemMoY=;
        b=wUnIaaI4I3+SPtxvZH2DaZQKd2D3PY94xL9X/pES2+wKnwNWXQDe2CGyrQF5+umdbp
         VncmEgVxOLAB+bYBARbr/8PFGNr9vvEvdm/CjgYzTr2z3tuDegm3fi9mai3pg2SfX8lc
         9mBVhULXyxtIW7qohCr+ESk3xfrrhUvwHueHgSiip4uuJ2jLZCyjsrrjAFy2fNfyLt80
         8XyV2SBv+G8YaQN8uafQT0VflTFDsTzbfWPA4vPEBH3jyTxtE68xnH3K20YhYtXVvJGO
         3LOTErAoJ8Grno3/4lz65CiYy8xdAGDD8qz0bwleax4V6Pi6lqNAgBlb+7Gh7rKwep9q
         ex6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmTY9woc/Zi2t/D4eiUPaKDxFop8gv8xWsP/9tdJqB70+eDd6Db3ZQjB9KZw4pAC1SxMm6yS/pFIUleZdse2jn@lists.infradead.org
X-Gm-Message-State: AOJu0YyQsQS1YkIhBglbHFDmzaEDYP1m+0FSCaxHN5jom6nTQyJ1sHP1
	zi8bTqzGubOrkiLT/T8E7mYty4RFoxEwP6LTp5Um6Z6YpOnHQYV70yl22v7DDzmROd1QtyUMQFQ
	4oAgFmF+JkrHAA67FyKgFh+LNtLGi8exv0altagVlWQ==
X-Gm-Gg: ASbGncvLHmrN6uS+43PQTMuEaU7DCM1gy9LYcIKz9gO4IdOyxTMl4w29/eaWhhk+zsV
	WQSKwysXIF8QbzyUh8MlG3eMPqwpFFbrZiKN818qMsM1PA0EBVQmK5058zt5jH5ZBJYjMaio3br
	4wAEX83aJSDXUYHnUXKEiL2Ge79fTDT4uoSSHPzuyUzcIdKNG4ua77IBjRGbPKj/DNecBUDc1FZ
	WIxkSQI5Lphk5FHf7vVRadaCZ/HEh6e8rUIPjGNw01F8XbXdA6scRxnx3cnGlc=
X-Google-Smtp-Source: AGHT+IHIX0BnzV5QR3ZUNafIRXxWw+fJ+TE74iOPYTO055yiV9YQx881LMKJ8ntEhbIPyMH/yj9fWYf3xbX9jssRLhM=
X-Received: by 2002:a17:903:15cc:b0:26c:e270:6dad with SMTP id
 d9443c01a7336-28e7f43f288mr40560635ad.60.1759323893974; Wed, 01 Oct 2025
 06:04:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Oct 2025 06:04:51 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Oct 2025 06:04:51 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <CACRpkda-ZvrAC4bNLnA+ao0Y8-Nd_-b89N6HU10hhEdaOUYAjw@mail.gmail.com>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <CACRpkdYcVtJjRHRJ8GgeU7rZDuyaJKu0vgcknb7DsHPjZGKGuA@mail.gmail.com> <CACRpkda-ZvrAC4bNLnA+ao0Y8-Nd_-b89N6HU10hhEdaOUYAjw@mail.gmail.com>
Date: Wed, 1 Oct 2025 06:04:51 -0700
X-Gm-Features: AS18NWB4-ek2de5G39SVs91_zyxyHsKkPvhufhJXGysoQ2YUW53Yv6YTbFeN0M4
Message-ID: <CAMRc=Mdb_cUG+hKq8GyfUP1SYBh0p19J+4dFG7G3JSuZTr4n8Q@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_060456_434827_1C7BF13A 
X-CRM114-Status: GOOD (  25.76  )
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

On Wed, 1 Oct 2025 12:53:07 +0200, Linus Walleij
<linus.walleij@linaro.org> said:
> Replying to self so Bartosz don't have to tell me off...
>
> On Wed, Oct 1, 2025 at 10:49=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
>
>> and every GPIO access on every system will be proxied
>> and then this better be fast.
>
> What about I read the code before I talk :/
>
> Inspecting patch 4/9 it is clear that only GPIOs that actually
> need to be proxied are proxied.
>
>> Two things come to mind, and I bet you have thought of
>> them already:
>>
>> 1. Footprint: all systems using regulators will now have
>>    to compile in all this code as well.
>
> This still holds. It could be a concern if it's a lot of code.

It depends on how we implement this. If we just rip out the enable counting
from regulator core entirely, then it would be transparent from the
regulator's point of view and each platform could still select the new opti=
on
as required.

However there's the issue of regulator consumers who need to know when
something changes on a regulator and to that end subscribe to the regulator
notifer. Regulator core knows then it actually changes the GPIO so it emits
the event. There are several ways to approach it but the best one seems to
be: allow to subscribe for a per-descriptor event notifier (implementation
details may include: only actually creating the notifier for shared GPIOs),
and be notified about an actual change in value and then propagate it to
regulator users. This would still be transparent and allow us to select
HAVE_SHARED_GPIOS on a per-arch basis.

Bartosz

>
>> 2. Performance, I didn't quite get it if every GPIO on the
>>   system will be proxied through a layer of indirection
>>   if you select HAVE_SHARED_GPIOS
>>   but that would not be good, since some users are in
>>   fastpath such as IRQ handlers, and the old way of
>>   sharing GPIOs would just affect pins that are actually
>>   shared.
>
> It is clear from patch 4/9 that this only affects GPIOs
> that are actually shared, and those tend to not be
> performance-critical so this concern is moot.
>
> Yours,
> Linus Walleij
>

