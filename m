Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428C9EC01D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUJUjulURT0vpMbu4RaHS8o5NCexbA+knxvjmiKjiF4=; b=qTQ4TO9UrGWXlWoC+ewkxLDbSc
	ekdtpWt4sCkOxpMizydxhvbEzAbXsx0ax4KUJTNuOZ09zOYAaXjpUDSGUuYPj3IeeDQsk9k24/JZS
	UBj9Qt0ETyQaa3FUxeQuq7kFW9pblR9QzDP70Lj82V2FjPRYspfMhmI6968IlUJxigtpODm8Bzqz3
	UVoctmpXd03kLP1r1H+KNydc0U0LEOTl9oRQhW5EeegP+drC6q+HcIhYBvEFuO/wGr2mipkMwNkZq
	sVY/xEe2IxuzssTC58Wv9sZR3P20qI7gWbaWxdUc0p3A6qvx/IEu1lGTDCGIRkWpYgXuCwyng/QW7
	hAlqJLag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dkc-0000000Ge17-1tnu;
	Mon, 23 Mar 2026 11:47:18 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4dkZ-0000000Ge0Q-4A75
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 11:47:17 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-668e55bd36bso2919286a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 04:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774266434; cv=none;
        d=google.com; s=arc-20240605;
        b=A37Z2dLFbz1TZmC43Nx5Jw9zxRQ5r6CDxWc+gSMNGnmu/OQONbSErLEJC4742DP1sF
         H9l9T8AuHjJtT+1P/uuAcu5RKOxsB57AeAmbAexaVTUTT4Y0ysZarMwAcvxtIZCu3ic9
         AjdKwdlKRHkdVcc9NGFYRzyYi2T+74fXq+Z6Btnqj4IEPiN7tKRKbo3/TjqJvogRl6LY
         JpvEMPmjjxhDXD2nwrKIR7Y7Pogz7EcAuxKrxHzEOE49m3yyUr1UmwmFtV6OdNRbVEQd
         JQKMap9LL9paOWc+CIfhwM3isU+z+Vx3ESjFKhAAtI7T3c5U4+6RAwM1KdGnxe5WSXmd
         ln3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QUJUjulURT0vpMbu4RaHS8o5NCexbA+knxvjmiKjiF4=;
        fh=CuszovyRpknG3l4FrtcDJO/+vcnlzJU41YjfAFWKjso=;
        b=XxpcMqa7b3l7Rpqm7f21kgwd3xjl4tOqH6SJGr7MuNF4vhm2ysHT8XY+xQebCQ1uzs
         jtaCOx3VtkCHlx28QBbxLVTDNuQaq9L8Mg4IBfdSze+QAzE/EzMMaZC4UcQMoBH9F57u
         egNMtQ8MGaVXA3mvnGtqGfDticZfICOxz4BXU6SMT2PYEW6aMsusckYbI4AzPcLwVjfO
         IUOH7zqpHFabo1uf8+t5hLJkj05cYfuyKMhC5/jpV6XT6h0QDtYG18g6aX1FB2YzAYxS
         xdDEW+g3AViu3ot17S+F7hBlIaH6OCIUgYhZtp6WwHnvgF0r8whtgd9hk2oxJKFeHmyE
         R7Vw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774266434; x=1774871234; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUJUjulURT0vpMbu4RaHS8o5NCexbA+knxvjmiKjiF4=;
        b=B42lonyLxXAYdlH+ywZQks8BVouXZFjzqVzqYV5B/1kjy6J1B7S41eEE2JXleCdWeB
         66B8C5/Waxnt7m3qD7GN0ey9FazaPLh0xSn3dlVcs/1nhfbVeG0Ska0N8BOYZJUTTfYc
         P6fjAhht63dbjoek8ehwd/SW2UHxUpekDZgCYZHceq55rHugHmgJVlm9wNNjNbrpG7l9
         E0naec6CxeoSzxjKbrCGfgRi9MSi1d4LpJilaA79TD7PTiRFKVaAU7YHeIyEjpDdMNGb
         sDc2wCVNx0PxyR3ixyMHm1IiRyKYPZphhidzO70o49RrS22lM8ZuFp375+O3wJ1uZfrG
         RJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774266434; x=1774871234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QUJUjulURT0vpMbu4RaHS8o5NCexbA+knxvjmiKjiF4=;
        b=R+k7zZwkjN1+UpdQISO1TvffKmAoRy65/p5rDeBAj+K79QvS+7gkoos6mq1QVIsp1/
         psMNI7DWcCdYPWQgOa7tONBi4tacQObwbPNOG5m10YNJ9ipEhRVO5RDlm+Wz+n1tA7g3
         gzW1jc5bpHVWRgmnpZRCpcoR5Y36hmXbFSvm5nM/DEld8rCqosCU4bFAcQVDahVxwPXr
         me+xl1HKUbu1B9TGuuK6WkVoH7s8qs6+Sip9ZhkolbJsNbBR/mc5F5PfWBJ5cHxh+BOZ
         pATGLGOBn8oPjbVu1383gVDwJr/iLB+//YyQArhbEox4yVLA/iTaO3WY3Xc3HGSMoxZ2
         sO5g==
X-Forwarded-Encrypted: i=1; AJvYcCUeMDlJK4qhGZz4izs4vP9lYSzlsnuTnAq7pF7xooaZP3Z1wEiDRDD+4Qf/SL3g2L/ElpDtI6DCLYYDPIZ4VjnO@lists.infradead.org
X-Gm-Message-State: AOJu0YweBbBVepfVUX0b9DO17ecKtlQ8ii7Gi77OeI4s5YLHEldJZC6i
	vnXlb38HHx7t7nGk7hZra/nzeFBbB9T1Y3ST7BTlFuyJIZxfKFd+6iPjk31gJbKJgH3C8mPci5t
	zlJh8xuXMLpEFpcQtyyxL+OfiEODzBpE=
X-Gm-Gg: ATEYQzw0l04HEQFwTGWPhg3llfsXQGfW9mSjzHQR2q0CLjB1IcGDalzp0edSOAZ4Mg7
	Mp29AsCbmer2ZZnPScGCSzMzwQbFunerO7xs8mlRFe1Xyd/wIDbiZG9WldK5hsFecQrcCUPw00R
	tm0tczvgyCmi+/+Su2rj2eQVotvBObwIM8kv9B0Ger96j/qwTMjPK6dLsBj41lFli95EBkt5rJf
	pr2WlSi26icSPwniQKcbdyOvIsD4VHIhN0W1JGxhyFa1Srze4pXi/xsCFnUctt+j73Hcr+QiaMw
	5Q+LAx/DJbtXIRK5Z5S4rWAI9dvgqrU+8r0yNkJVLmZ+czrAjFMvbYoqga+Sm523e46KtifQ3Kf
	kxf1ZyCI=
X-Received: by 2002:a17:907:6b06:b0:b97:f050:d115 with SMTP id
 a640c23a62f3a-b982f0c310amr932278966b.9.1774266433441; Mon, 23 Mar 2026
 04:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260323074505.3853353-1-sai.krishna.potthuri@amd.com>
 <20260323074505.3853353-4-sai.krishna.potthuri@amd.com> <acEbZ0O3HKrGx0u1@ashevche-desk.local>
 <8c8fa211-6244-43d3-9350-856301075e2b@amd.com>
In-Reply-To: <8c8fa211-6244-43d3-9350-856301075e2b@amd.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 23 Mar 2026 13:46:37 +0200
X-Gm-Features: AaiRm51igNpVP2kCtjt-uVTIXp5cT3pPNV4OvOgkKtoQyGTUIfXrJkbDCsd2ufI
Message-ID: <CAHp75VdcrfJn=VBnjJbA8QQnstaTay+39bumJiLt796fXsKmTA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] iio: adc: xilinx-xadc: Add I2C interface support
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, "Simek, Michal" <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"saikrishna12468@gmail.com" <saikrishna12468@gmail.com>, "git (AMD-Xilinx)" <git@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_044716_048549_A901D480 
X-CRM114-Status: GOOD (  15.76  )
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

On Mon, Mar 23, 2026 at 1:32=E2=80=AFPM Sai Krishna Potthuri
<sai.krishna.potthuri@amd.com> wrote:
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Sent: Monday, March 23, 2026 4:22 PM
> > On Mon, Mar 23, 2026 at 01:15:04PM +0530, Sai Krishna Potthuri wrote:

...

> > >  int xadc_write_samplerate(struct xadc *xadc, int val)  {
> > > -   unsigned long clk_rate =3D xadc_get_dclk_rate(xadc);
> > > +   unsigned long clk_rate;
> > >     unsigned int div;
> > >
> > > +   if (!xadc->ops->get_dclk_rate)
> > > +           return -EOPNOTSUPP;
> >
> > > +   clk_rate =3D xadc_get_dclk_rate(xadc);
> > > +
> >
> > Unneeded blank line.
> >
> > Also, don't you asked for options?
> This callback is defined for all other platforms except I2C.
> Currently for I2c interface we are not supporting any configuration, it
> is used only to read the channels.

If the callback defined you should use its value and not hardcoded one, rig=
ht?

> > >     if (!clk_rate)
> > >             return -EINVAL;

--=20
With Best Regards,
Andy Shevchenko

