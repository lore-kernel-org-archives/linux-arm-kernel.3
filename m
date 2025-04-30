Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B177C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYuvroTINkfC6xAaXcm4PuIm1ax6xcO4Y50Rb3BmvI0=; b=vcB31156+tigmHFLvLwZaZoXGY
	ZX12R3MPIy42KDbWIZnJLvv4Yi5mAMBT7a+nR9/Or9GkFhIRbtO6FgV4Ts56p6itrKsMlXaxOGjwp
	Ou1kMbGg3fW1U3MPSkIUQw8orm/22y0pteRkfDD3uWDiljo5K5Qwj+CZnYNhTX2zkTHAosFIrtAIw
	0opM5eJ9ILpysFNuDWvjP3oXhszcvkOiQG2M2P7oBz/zlHQcau8n1BOHzvov3SffXN3D4IaDjFLSj
	MCCp7ajm8Abab/kmRaZEuQ5qTrIY7/zdEgu6Uorsb0vOGraGMBcUw9JPGky3gnwq32b15IPFCUosI
	uDotJW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAK6-0000000DRcL-2wMS;
	Wed, 30 Apr 2025 16:30:14 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAFd-0000000DQfR-46e9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 16:25:39 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-6ef60e500d7so801847b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 09:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1746030337; x=1746635137; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYuvroTINkfC6xAaXcm4PuIm1ax6xcO4Y50Rb3BmvI0=;
        b=RpQerAFrBIQXiUmJJ+x9bwYUlMmpdxXoZHMgBL9IsHWh+mY+WDOt1z0pR0NckMqQ/Z
         8Pr5hGr9YF5RlLafZom/RnJB3AMY6ShfDR0BM4hpxXDFiL7R+8/+w/xMQrBRlUTCvPXj
         jCSKCTyzX0DSzSZvB2u9q9VrTdv7o6Gn9wmW4v6xTac7WiLE6KN7/VDd6IuM3qemmuHy
         4Afd+l3loPgcUwtXMJp0pDX+QGiXpET2boJohZ6MfddgVvh5sFWkTdsosC/UPw+hcpke
         rCg0jW7XPf2Td7CjSOhsJcTLdwunrfBPn73HXVVDFu8ohAU76X43Wsnjodm/ef2lUvUs
         QWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030337; x=1746635137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYuvroTINkfC6xAaXcm4PuIm1ax6xcO4Y50Rb3BmvI0=;
        b=GKbklJeiXka8oF5ROlefD1WGwoGUdoSjJa53l2C8Acitw+L36RhspGT9/IULnHsWOg
         0isGCyvDEOL3C8qkWpzE/2btkO0eHpLT1+HmYB8jSog0pSm9Q9qpiXRmLnwZSxCMO68Q
         OGMqV2QvZbnzKjW98SPcu/q6ijKjA/WSKBzOHDJdwg8xRnt1kkYkXzjJjPhK3TNn89xJ
         zHfGKAkyCeebL9YTwkaH1wE6RhbewQVCDemtwsDzWhe/eLcPRxKISxyzPQBFji/Qqi4Q
         BQZrqsnjOs4ECQaA9dvEc6m6sSgLvHHV9urmPzX2cwoXC5qhVwgb7EGZLH4oWgbaQeyX
         j8mA==
X-Forwarded-Encrypted: i=1; AJvYcCXNr5GbbfVCBkRXm+EejwNS8CE7/dJevjb56OmjyC7Shyy7G3tvOSgjQXT7H9OPLWYybm7uxMM+9Ra5jyv57CCw@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe3CGt+0CCdFlGtrV85XhiTHLGK4NHDkIvXF5qQUfZ9Wo8TizQ
	hSfp6q8punENQTZyw1HowMPZQSfbTYaIfL182X0PoNn8w417pBClBaGTf81aq/sL5wHZ0h7k3ew
	8esni+Ao/cVaHVD5p5W/GFPi5CcjOIq/V/Pg+/Q==
X-Gm-Gg: ASbGncsFMjW2Bh6PvreS8jmPdOQFwPJAqzs+hAbeDHCxEDj7tYvbYQyt+KUQ47GcVOp
	yvquTEWvWJCzk9MHiXpo/VQ0rh4O2fVtWUP6lErNS/Ns8+tM1LPu2dF3IrADVY9K+zuVmuE/XcX
	q8qZhzQsxuKOe+5tTSpEgB/hs03fEE0YtE1M7sF3XfhW88xjCQLMEEyA==
X-Google-Smtp-Source: AGHT+IHd+mzxsbQHzg2KdqaE0D0IMCI4DPD74nxHKEsYaPw4wosN4rVl4mhlvOGDdXpSNiN3p5emIlAjRcnS9XKmP/Y=
X-Received: by 2002:a05:690c:700b:b0:708:73bc:abdc with SMTP id
 00721157ae682-708abdac21fmr56602207b3.22.1746030336612; Wed, 30 Apr 2025
 09:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>
 <20250430131856.GB25516@pendragon.ideasonboard.com> <CAPY8ntBPSC6KZcBVt35QWx_ZPYwkSJSVzhhaXokbjkWJDVJRqA@mail.gmail.com>
 <20250430160445.GB31516@pendragon.ideasonboard.com>
In-Reply-To: <20250430160445.GB31516@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 30 Apr 2025 17:25:14 +0100
X-Gm-Features: ATxdqUFmSnHhLyB4xlaoBz0z3J5u5ayEJkVVl-qFWx18SUxO7BsGgktwlOcreUk
Message-ID: <CAPY8ntBb5x+F=xj=KVrkfq=JqdshgCS548YjRt4OuhhyVJNkVw@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_092538_188463_5518859B 
X-CRM114-Status: GOOD (  39.72  )
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

On Wed, 30 Apr 2025 at 17:04, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 30, 2025 at 02:52:01PM +0100, Dave Stevenson wrote:
> > On Wed, 30 Apr 2025 at 14:19, Laurent Pinchart wrote:
> > > On Wed, Apr 30, 2025 at 03:03:10PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, 30 Apr 2025 at 14:58, Niklas S=C3=B6derlund wrote:
> > > > > Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable =
link
> > > > > frequency and pixel rate") the driver expects two specific
> > > > > link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> > > > > (222750000, 148500000) operation. The driver fails to probe witho=
ut
> > > > > these exact settings.
> > > > >
> > > > > Update the example in the bindings to match this to make it easie=
r for
> > > > > users to incorporate this sensor in their device tree description=
s
> > > > > without having to read the driver sources when the driver fails t=
o
> > > > > probe.
> > > > >
> > > > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ra=
gnatech.se>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yam=
l
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yam=
l
> > > > > @@ -136,7 +136,7 @@ examples:
> > > > >              port {
> > > > >                  imx290_ep: endpoint {
> > > > >                      data-lanes =3D <1 2 3 4>;
> > > > > -                    link-frequencies =3D /bits/ 64 <445500000>;
> > > > > +                    link-frequencies =3D /bits/ 64 <222750000 14=
8500000>;
> > > > >                      remote-endpoint =3D <&csiphy0_ep>;
> > > > >                  };
> > > > >              };
> > > >
> > > > I guess the link-frequencies property should gain a rule that it
> > > > needs two values, too?
> > >
> > > The driver doesn't require two frequencies (unless I'm mistaken), it
> > > could operate with a single one (albeit not in all resolutions), so I
> > > don't think we should require two frequencies in the bindings.
> >
> > The driver does require both due to 98e0500eadb7 ("media: i2c: imx290:
> > Add configurable link frequency and pixel rate") and
> > imx290_check_link_freqs()
>
> I realized after sending the previous e-mail that I was indeed mistaken.
> I thought the driver iterated over the DT link frequencies to check if
> they're supported, but it goes the other way around.
>
> > However I'd agree that it'd be better to make the driver accept just
> > the one and make any compensations, rather than amend the binding. I'm
> > happy to try and find a few minutes to make a patch for that.
>
> That would be nice, thanks.
>
> > My experience of this family of sensors says that we should be able to
> > run any resolution at any link frequency, but it needs changes to
> > HBLANK to ensure there is sufficient time per line.
> > Dropping to the lower link freq for the 720p mode is only because that
> > is what the datasheet describes for the precanned HD720p. The window
> > cropping mode lists no such requirement, and yet could produce exactly
> > that same 720p output.
>
> And with more information about the INCKSEL registers we could possibly
> even support other frequencies.

I have no extra information there.
The minimal changes that are made to INCKSEL 1 & 2 to switch between
the two link frequencies makes it look pretty fixed rather than
flexible PLLs, and I haven't got the time to go randomly poking to
reverse engineer it.

  Dave

