Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E8BD29DF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cS+QiFISufJoEVeMvcd1B3yL8m8OJysDKvS+OCH/uOI=; b=wY4JbRzDKf8lhmGsziXBldfFn3
	yDvDWYBnVBNPJcpZyhd2YbGYpZ+N6CzinVgRWMSy85CJ+tO4S7NV4pcZc5UOIenYYVjbe1nMeF1Qd
	gR2QdciFMb6O825Y3P96SRcZhKB1ZEgZHOwoPW2Wk03VSdWPjLIui+8CMRSRS0yZhnqEunKIFVhYh
	UNg3uQuc8XuO8I0pponr95rplBsQmbMqKEc2XRgNVYpJaPSWXeF7fr8w5DYuIeL0EhoN8Ixx4XSZj
	sG3FlkfXCcLu9+K8iRWfWVxYN9G3HWeZm//WH6jnCaOfbP5O7xeyC60UtSIbfa7nCk2+nQsS40JES
	bN8nZ5Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbDV-00000006rzy-29qv;
	Tue, 13 Jan 2026 10:01:38 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbDS-00000006ryd-0UQ0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:01:36 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b872de50c91so209375066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768298492; x=1768903292; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cS+QiFISufJoEVeMvcd1B3yL8m8OJysDKvS+OCH/uOI=;
        b=IAG36iefe0j8aD3AdA3+8I59NIFCP0u7uCxak+LEo56I/qSyPqyBKFmOBgNcELMLq7
         TSbmV562HY9JvtQgpe7Rv3ViLJ4N/ucKC6Xzn9x22n3t7JYJFkQn9k8Cq9BoeyBAkccm
         dQqsaxveaeTdT9SgZO5vYAqnPPcrj4697CIddVg/D8Dr+n3PmktLmywjU5n0PF7UF9+w
         Wtj4HQSa1f/1hcQxEwndrRNYX6ZrFHKsYKDrDIm2sphcYxPexfylah7Bj6S1tE9GeoSD
         jeX8GiKwCS+ZkowNA+4OndfKHcQv4uAyy5fAqmb3EWtNqzUxqHVnrrD+PK6OjCcMELd/
         jnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768298492; x=1768903292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cS+QiFISufJoEVeMvcd1B3yL8m8OJysDKvS+OCH/uOI=;
        b=BXIyZNLvbwxwLQ4w0PO+FFQl0nF0ZHINnQh+Szt47T4yKD5/ekjpDBtgv0pQ6olShV
         mG8jDJ+d34JQ2igY/dfO8jSq9hZctc77//1DGK9yL1JKdvh36gKFJJRKx36eyFmoHdDL
         XoBsoNA95ZOKOy0AQff5zUqD6kw1mUSiDKrvXqCRJWTN+jY/wzy2Bx9v1CzQ4EP4MYSo
         m2tma5Vy26A9zU8w9Tk8lK2deg6OZFEPIq8wHx54RilguiYyU4lAEo6Fvvv9jt8C5Zt6
         7Gk73HaNMIHFBGWiYe8NOO8+Wp81jHk7SeG/pXRrVWgSYF0HZOeJyaRRGYZ2wzTWSbaU
         p77Q==
X-Forwarded-Encrypted: i=1; AJvYcCUa9W6Lv/zsQL5WBGQYUkBLRmLhbE6ZEKZcydrhKzKKbRYUBS+rx9C1LOiCmomLZAl/3aWGHukbqemiAriwu5Gv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6e3ZIYzT4V1AbSAyF+CH/BJHguNwf74o6uozkpD1K0rVoPUc9
	PgEA+KK2hxod00EPq6gjWZg/uzxJuB+wm7gnoNbhwFuKN+a6yBSPl4vIj6JKegJESsOi/WkVID0
	t821ZsG3EJnupDDTxl4YqmCPFDKoOo86Okoda539GAw==
X-Gm-Gg: AY/fxX4zevouN+ylQyoBtoP7uWpG8npIYLOpVF9oo3df7NeipKg6/Ll7YN1lr6+Z0V/
	QA7/pM57oG7HZLe/z0V4XvVM0f4ud4IRuQ/PLkVf8F+Vpb8brnTMLlmheemSQQHkvWI/8es33X7
	zuz1Hrpze+s3SZStpmlo61iDb1YuyJCp59psKX1URIDlNdmOxypR0Xc+YLkivkSj0f1PjP3S8nh
	lhgDZFaZxgRAESjKMh0/Oh+kC9zKXOojyfJcBvy7UVywXhhnAi3a91N/rH4X+53VSWx0iynI10J
	deqhozerjig3TVux6MEUt43srKK1
X-Google-Smtp-Source: AGHT+IHhV3y7JNmOBjy5EalV3x7t4vl01JkGjwjactx2DF74xLII3ghvTLNgr5SCi2IqjH5Xtd0PLZPDzayJmM7+uno=
X-Received: by 2002:a17:907:1b1d:b0:b73:6c97:af4b with SMTP id
 a640c23a62f3a-b84453eb56amr2009555166b.45.1768298491995; Tue, 13 Jan 2026
 02:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
 <20260112-dpu-clocks-v2-1-bd00903fdeb9@linaro.org> <ba585515010ab9a9b417d000ba744f8178ca9e24.camel@linaro.org>
 <CADrjBPomC-QaL8aR4QsEPm+Uu5_QoWQZUomLMZt+09-ywH3wjA@mail.gmail.com> <c1045dd2f33ed3a618381448717b0b5d5b28dcb5.camel@linaro.org>
In-Reply-To: <c1045dd2f33ed3a618381448717b0b5d5b28dcb5.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 10:01:20 +0000
X-Gm-Features: AZwV_QjT11z4xe6qFWAlykBYIqmvAiPSAP9U7DrT2D5x97e86Wg6r2gUNQdxGKQ
Message-ID: <CADrjBPorDM7PUwR3x--4qLj9M9-wqZhP6F1Mj1e7HTdstFDcDg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: google,gs101-clock: fix
 alphanumeric ordering
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com, 
	Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
	Doug Anderson <dianders@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_020135_093930_86B3A40C 
X-CRM114-Status: GOOD (  24.86  )
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

Hi Andr=C3=A9

On Tue, 13 Jan 2026 at 09:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Hi Peter,
>
> On Tue, 2026-01-13 at 09:13 +0000, Peter Griffin wrote:
> > Hi Andr=C3=A9,
> >
> > On Mon, 12 Jan 2026 at 14:26, Andr=C3=A9 Draszik <andre.draszik@linaro.=
org> wrote:
> > >
> > > On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> > > > Fix the places that don't have correct alphanumeric ordering. This =
will
> > > > make reasoning about where to add future entries more straightforwa=
rd.
> > > >
> > > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | =
6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/clock/google,gs101-c=
lock.yaml
> > > > b/Documentation/devicetree/bindings/clock/google,gs101-
> > > > clock.yaml
> > > > index 09e679c1a9def03d53b8b493929911ea902a1763..a8176687bb773ae9080=
0b9c256bcccebfdef2e49 100644
> > > > --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.ya=
ml
> > > > +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.ya=
ml
> > > > @@ -27,13 +27,13 @@ description: |
> > > >  properties:
> > > >    compatible:
> > > >      enum:
> > > > -      - google,gs101-cmu-top
> > > >        - google,gs101-cmu-apm
> > > > -      - google,gs101-cmu-misc
> > > >        - google,gs101-cmu-hsi0
> > > >        - google,gs101-cmu-hsi2
> > > > +      - google,gs101-cmu-misc
> > > >        - google,gs101-cmu-peric0
> > > >        - google,gs101-cmu-peric1
> > > > +      - google,gs101-cmu-top
> > >
> > > If we keep 'top' at the top as one outlier, it'd reflect that it is t=
he
> > > top unit and all other CMUs are children of it.
> >
> > Thanks for the review. I opted to just keep it alphanumeric so it's
> > (hopefully) obvious what all future ordering should be.
>
> One last comment: except that all other source files in the tree place
> cmu_top at the top. It'd be more consistent with those files if done
> similarly here.

I agree :) I just saw your other review comments in clk-gs101 and
realized what you meant here. I forgot CMU_TOP is at the top of the C
file (which makes sense when reading the driver as it feeds all the
other CMUs).

Will update.

Thanks,

Peter.

