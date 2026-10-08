Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAE2CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 09:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWFUUUrBgiIzK+gqT3tOqpmacYA8GLgSjw0YdluaFDU=; b=wC3stTs/DuBATe/ABx1yjkxyFt
	qM3vjuuA93L59HyWk5Otr4f6z3HyGl/7rZDgsI7VqtG8exyo5UBiKfAOACfl+bwKCaBBeq7GePxtg
	WoDenNUEZuZFBphQeRdJS/GKZXyVh9Wv446bbrvBJTjSXtH7OjXBo2/Ggpb/XQdXETvWdzG9/HW42
	QwGZ6JCT6deE5VXpl683T5xG6XHf6HvCKHXZhCBFps9Ja1LY8XwXD3OvWQrPZ8L9NRlEccsJrEO9k
	JSLO79VkktOt+8C9I8TwIm4KixumwYOhl+pIvLVY5m/MfDDnv2ta4FUpT/y14wSqU2f4nIv7UWD3J
	yTeUa2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkK4-00000003zy0-3fzW;
	Thu, 08 Oct 2026 09:21:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkK4-00000003zxf-0nqs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 09:21:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 648036025A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Oct 2026 09:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186E01F008A0
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Oct 2026 09:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451315;
	bh=GWFUUUrBgiIzK+gqT3tOqpmacYA8GLgSjw0YdluaFDU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O/wmSj2uEqcTYn0JsiBAWBr1mTy1i3Hhhg2zHwNy5LCc0R5LVdyYNByVtp+5RbDqC
	 yu8jRuG5tiXQdJN/6h9C/DVJY89tihoWqhAlsGqYjHDPg4npgnBgqrYQeUWUtBDxJK
	 7Pbzsr/NxhfmK06/fYZrX9D3q1bai1sVVseMAomdyOzesc/wUoURGv6rxDKQgCh9z2
	 zyYl8gs4z60qQTOe7AMTe4Tatn7ccmD7+jvPpg0HsdRPRgt4ZHw8zK0rXBUJeecEJ4
	 HRhyMN7xHrY9sEIEeVl73kwad285NnnlG6JYbgIBRLXs8TgyLFcJpFjSwfQom3VAiF
	 g1hvtPUbbL9EA==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-49429181ce9so1454762fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 02:21:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzz/Wkyo3s0YXdvy2f/B5yjxTJuUFbk/PkHuNY/piVBbDqXKbj99HRXjNP80BVgriytfzhjO7T0VbbP2+Eb48v6@lists.infradead.org
X-Gm-Message-State: AFuF++n+E092Zem8KUhGA2M6pIzWIlKWFLYxTQb6vMow+NBtyve6KA+n
	drruvuq00J3xoy6DV9t3Mpv47xBbs9hFrNUnqDjsrYDxTpsTplXutXQ1BEu0+1CBeSNOKcssDXz
	cJxdf3uM5muicG7mwPIPAssPP7EcDDSo=
X-Received: by 2002:a05:6870:1425:b0:49e:691c:1bdb with SMTP id
 586e51a60fabf-4a259412f13mr4800707fac.32.1791451314370; Thu, 08 Oct 2026
 02:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20261005202731.153971-1-pmazzini@gmail.com> <20261005202731.153971-4-pmazzini@gmail.com>
 <20261007211626.GA338242-robh@kernel.org> <6bb97a9e-cc9c-48c0-bf6d-3a1c6e8048f2@arm.com>
In-Reply-To: <6bb97a9e-cc9c-48c0-bf6d-3a1c6e8048f2@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 8 Oct 2026 11:21:40 +0200
X-Gmail-Original-Message-ID: <CAD++jL=5XbF11=B8Ek0sEXbBthDvMXntsS1B3g=hVj3tvJrJ8Q@mail.gmail.com>
X-Gm-Features: AclHuK8MDx9mBKh-LkXc2Y_EmzTnr-w652rPt-NhKQsERmYINlS6dZoVxe0T-gI
Message-ID: <CAD++jL=5XbF11=B8Ek0sEXbBthDvMXntsS1B3g=hVj3tvJrJ8Q@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Pablo Mazzini <pmazzini@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Oct 8, 2026 at 9:50=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:

> If you mean to just drop the allwinner prefix: this has been discussed,
> but NAKed, because the generic property carries a different semantic.
> And implementing that generic behaviour in the existing sunxi pinctrl
> driver would be quite some effort (read: a rewrite), without any obvious
> win, so we decided back then to not boil the ocean here, and just go
> with a special property.

The point to switch over to the generic "pinmux" property would be
when a completely new SoC series with new hardware arrives, so that
it is significantly different from earlier iterations.

I don't know which semantic with the standard "pinmux" property you
got hung up on though remind me?

The bindings just state this:

  pinmux:
    description:
      The list of numeric pin ids and their mux settings that properties in=
 the
      node apply to (either this, "pins" or "groups" have to be specified)
    $ref: /schemas/types.yaml#/definitions/uint32-array

It's just an opaque u32 array controlling all muxing for a device.
There could be one single element in the array.

Yours,
Linus Walleij

