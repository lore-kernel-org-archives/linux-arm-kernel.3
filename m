Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBE3C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 11:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1FZ9sKjGBQmPcnWwNmy+m7HReciKhzXM/5uOouRfEU=; b=mIRL9woBtxWsQzawd82r3z7JXf
	cyCDA9+p9y3kcfXtNGGgHDcviWW/jYeq6aWmYVE7Kc5KWnwDaFGLeBajitdZ2heBl6GIq6GMaM/C5
	Irm9c4m9Nq6Wxrwono5rIVhANizBUJVBpQXxEf9iHRPqKYmx8eZOp0r1bD2EaS4InXtiIe8wEx0nt
	iNoiVVCBd4CQSgCUGdc+2SgXuzpu9Y0H7Nlj6gRcTgPH7c9EtT3Y2BdfAkQIeFnv3JQydABwC5UU+
	YmgpO6vYwKxbSTkYxTeZhSTfPkb98G91vfYBKpxrA/EFnWJqwd8L4cFgW+gfP2BeD0NxjK05gsK2e
	U7XoOiPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUO8L-00000008Ril-083y;
	Wed, 25 Jun 2025 11:17:41 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNNP-00000008JSl-0WEu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:29:12 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-32b50f357ecso52938851fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847349; x=1751452149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1FZ9sKjGBQmPcnWwNmy+m7HReciKhzXM/5uOouRfEU=;
        b=Vn4TIJ0cSXqEcgPaOqkP5v3xR76VQT52Ub0exzJTC56K7SDTOvpoDkw0rHaJA6eq1l
         0oGVWDp9bQ9z6eLgXFJtUbiqgHKocT+9Ruotz7YSkbCGXTgTzSRhM9vOf48N3YmJD1T+
         kjwHXWFhxti5/Fv+bhH1mvlabDmTgkR6Pppqb4ZndSphkkSWgqDvytHOq97dSpiLqWcP
         0qTl0vV90FCnH6SEnd7Ow0DY6Itz6IaFvj7EepR8VL5fuXdpPVrDTur4cnAgMkmzlvdb
         vnegLT+H++f61F70YwCxAJgMGAm7e59kJV0C6NmU5vCJj3/6gjnDALb9qoW/LKh9EaOE
         6NKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847349; x=1751452149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1FZ9sKjGBQmPcnWwNmy+m7HReciKhzXM/5uOouRfEU=;
        b=PV5J8HVZKTw0/Rc5+73kC998uUaLMTsYAilw3XZrwACb47R0eTe6juxvDBZcSG9wIz
         55Z6xPMVKAgc8jZoGvQwfMtyILWGxUM59wg6qTi6aRmKNtPInLiQkeN/k2iEyZGKVi+F
         d3nzh+HMDD6Z7shYKfHja75MA2jdHO9DlRqQ3STu/Te7L0AHg9al0bywNHxg2zmMUeGQ
         qstpKkGTlYY2JATvZK0arJeb5ZGkLIlx5ojVUX7hV3+1vb2xpCICD9rNyAR1rpJk1xA6
         BhFqH/yxGvq4G0Lmp9HRAFnvewTZzjgYUCJoORcm0hvhs+DsZUTJCRETO0VVrReAflX+
         HXDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNi/88+qWjlTl+L/invzfMfeBN1Ozpwd0xOkkmd/TpA90YspfVM5/fpY+4ykiaHnx0vNaICjVVbEzMLnqw+06M@lists.infradead.org
X-Gm-Message-State: AOJu0YzBNV8NLj7FGzsA2rwtjO5aFHfEEoLCMhCruDrC9c1wf/FgXvIe
	txDcTUfP87OO6AP+8jUL0spqpW6oTcRMkNDmMfdtPhtrpHo817ob16L8/Rqq3qTohoq1uAFP0tB
	bn7pfX9ZurCuw3U93P7NRQ7Jv8zjBlpQLiUnuSWbJZw==
X-Gm-Gg: ASbGncvZy/2ZrLjIo3yli7+KwVpLsPC3r+doLrwPbB8Y9zNchw3Y2VGdYRUWS0ZOYll
	ykWMpQSO+37/Hqdy30Tr69KYe1aV6KjrX48ItznDgMhGJSfsNaDEJwgOIB0sIR9M39prr/dbKJS
	W02yIgt63yri5jiCBvolW9iMr5W/iMQwa5uPbdUz1qZo7Pd9wB9e1uy+7FfCpS87BkvIiMRuDpO
	Bg=
X-Google-Smtp-Source: AGHT+IEkX13bQ28turRcuObCkfo4NVlXNRfNs11ryLaB3cUvZvJYNYOL/9JsCJbedp2nhQty0KHggcVYo7rajlWmaTg=
X-Received: by 2002:a05:6512:1153:b0:553:2ef3:f731 with SMTP id
 2adb3069b0e04-554fdd1b6a9mr686994e87.29.1750847349350; Wed, 25 Jun 2025
 03:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org> <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
 <CACMJSestPPEvsUrWaqz7yZ8OxZTMEOBY7htE7c8BV-VBumj1Lw@mail.gmail.com>
 <6c64751d-67f6-4c30-a312-af289d9f432e@kernel.org> <CAMRc=MdEZkjoDR83JFg5OPP07_DkAfeZixN9C+uxhkqkxaKypg@mail.gmail.com>
 <b9c6f5bf-ac43-497a-9354-6448cfb2839c@kernel.org>
In-Reply-To: <b9c6f5bf-ac43-497a-9354-6448cfb2839c@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:28:58 +0200
X-Gm-Features: AX0GCFu-paz-Z_NsdxNyvXdu5K3BHS4b3n8YPIt0hLxqGr7Teq3_mQG0oOp06mE
Message-ID: <CAMRc=MdEWmgj8hTY3fQrXnDDv6pmK9XPvT9gE=5oGEs8R7GOVA@mail.gmail.com>
Subject: Re: [PATCH RFT 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_032911_166201_1B6DCF2B 
X-CRM114-Status: GOOD (  17.44  )
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

On Wed, Jun 25, 2025 at 12:26=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> >>>> I wouldn't be stoked to see device trees abusing the "gpio-mmio,base=
"
> >>>> property all of a sudden just because it now exists as a device
> >>>> property though... I kind of wish we had a way to opt out of exposin=
g
> >>>> this to all the sub-property paths. But it seems tiresome, so:
> >>>>
> >>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>>>
> >>>> Yours,
> >>>> Linus Walleij
> >>>
> >>> That's not a problem - this property is not in any DT bindings and as
> >>> such is not an allowed property in DT sources. For out-of-tree DTs? W=
e
> >>> don't care about those.
> >> That's not true, we do care about implied ABI. Try changing/breaking
> >> this later, when users complain their out of tree DTS is affected, and
> >> explaining this all to Greg.
> >>
> >
> > Wait, seriously? I thought that the upstream bindings are the source
> > of truth for device-tree sources...
>
>
> They are, until they are not... ok, we don't really care that much about
> out of tree DTS, but in-tree DTS still could use these and don't care
> about bindings check, right?
>

Could they though? I can imagine this happening by accident but in
general: you'd expect new sources to follow the bindings and be
verifiable against them? Otherwise, what's the point of the schema?

Bart

