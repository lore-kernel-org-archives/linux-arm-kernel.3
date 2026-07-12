Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA05FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 05:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLTCb96hFjM2FfPbsAHnO1f3U06p3l/uWtkaSYyB/bQ=; b=0n1R/w7uJGRunn
	iNqh8dxjcrHhwbFrfvjN4ZU1+uZXrJPjIRl89UUe5TY/2EPFpcmDvVWlZTguTLrdeyTqKcOfS8+kM
	cDj8ocx3ooGjkMnEbe5h42ZD3VLCx1Cc1mCPu2Xhb23XtlP+ca3S/xu9Cu5mB6bFqIfXFZrnaCJ1q
	u3o+n02l7p4M9tH7xNCkTcp/NuSLUU+l0DfHegvhwugzzwQ57M7IN2yzXFObeBGx86GJYfncuh0d3
	TTxXtmhVtw88HxG46OCMSBBnZFWMDcPEWQP6XidGk/LhyDick2frjtEuY/MtL5Vu0z4S4TzCwpduq
	nefl0xQzJJAqR7BU9pGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wimVB-00000007A6Z-41FI;
	Sun, 12 Jul 2026 05:13:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wimV9-00000007A6R-3G6N
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 05:13:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 057C640F15
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 05:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62A01F000E9
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 05:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783833194;
	bh=rLTCb96hFjM2FfPbsAHnO1f3U06p3l/uWtkaSYyB/bQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=PD90buyWcLDuUV/b7DNrnqmFNFfpaxzYNFbWdbGWa/ycjBz2RGTqmzrB1kW4lnWKi
	 vbvdrARrRZ5wvwGNqpQmCxI9lzaX3OTZCWtI4jjPKqJax9DvhhtlZLT+u8lXisDyRV
	 r5UOn1D/5OKv2EF3l6eY8v55pkYnBO1pgrVuwMjdfQiH4QXQUx2dieJvruUHEkZAVz
	 iasBuIp75IK10Y4ebhs/lczxIVDg/7LfIuDIfH3SDYJt6108U5rqUSruFp6JoiLVHB
	 GsLEr2IzPUFfCLKAVYfRQQV0/j1ekc8Ay9vdT0xaR7YJbNbtf/i9u1pPioplysezC6
	 mDxfrZeJyx4Qw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso1966820e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 22:13:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro0x2N/hOYsLCo0mnyedYuq9QDWEEj30Qfk3g1H/9JdZ5c8vLYPKRFigKpl4alfxRLxZzTseFZW0i2loe5/scBp@lists.infradead.org
X-Gm-Message-State: AOJu0YxWxdL8jVAsIFlMttblEApn85rVhdZvLKZedU/44UcXVshvxRfu
	hPakFogrAcuv8XONBTnSVOAW0tRurMMrE+DLQcIb3ZGrly1NEJKkFgW6TAG0Sk6N+Re5pqMnElP
	4x4PqqBWSo20XQS3YoyANajkNjqHv/YM=
X-Received: by 2002:ac2:5284:0:b0:5ae:c636:5c with SMTP id 2adb3069b0e04-5b0236de96dmr689800e87.47.1783833193266;
 Sat, 11 Jul 2026 22:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260702214750.3428694-2-utilityemal77@gmail.com> <20260703-versed-locust-of-agility-d76fda@quoll>
 <akgR7N1LmqEmPSLy@suesslenovo>
In-Reply-To: <akgR7N1LmqEmPSLy@suesslenovo>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 12 Jul 2026 13:13:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v64dEj_M+LvCok91EuH6uq3ivutMRqU8-XUno2_ag5p+tg@mail.gmail.com>
X-Gm-Features: AUfX_mwTG0Ej3M8TCZ8CoQWahuofQ1shmnD3lKfX2hOd7HU_ITVHuXMr_RVFxTM
Message-ID: <CAGb2v64dEj_M+LvCok91EuH6uq3ivutMRqU8-XUno2_ag5p+tg@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
To: Justin Suess <utilityemal77@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sean Young <sean@mess.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Jul 4, 2026 at 3:50=E2=80=AFAM Justin Suess <utilityemal77@gmail.co=
m> wrote:
>
> On Fri, Jul 03, 2026 at 12:56:00PM +0200, Krzysztof Kozlowski wrote:
> > On Thu, Jul 02, 2026 at 05:47:47PM -0400, Justin Suess wrote:
> > > The A523 (sun55i) contains a newer revision of the sunxi CIR receiver=
.
> > > It is not backwards-compatible with the A31 programming model: the
> > > control register has a pulse capture mode field (bits [7:6]) that
> > > resets to a value which captures no pulses at all, and the sample
> > > clock divider is now selectable via SPLCFG bits [1:0] instead of
> > > being fixed at the old module clock / 64.
> > >
> > > Since a kernel driving it as an A31 CIR receives nothing, add the
> > > compatible as a standalone entry rather than under the
> > > allwinner,sun6i-a31-ir fallback.
> > >
> > > Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> > > ---
> > >  .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1=
 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-=
a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-i=
r.yaml
> > > index 42dfe22ad5f1..06656058ce91 100644
> > > --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.=
yaml
> > > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.=
yaml
> > > @@ -19,6 +19,7 @@ properties:
> > >        - const: allwinner,sun4i-a10-ir
> > >        - const: allwinner,sun5i-a13-ir
> > >        - const: allwinner,sun6i-a31-ir
> > > +      - const: allwinner,sun55i-a523-ir
> >
> > I assume you are adding it in expected order that Allwinner is
> > following, not just randomly at the end of any list.
> >
> I did it in product generation order, is that what is expected?
> I know that the a523 series succeeded a31, so that's what I put for
> ordering.

Yes it is.

> > Also, please change all above entries to one enum, can be the same
> > commit.
> >
> No problem, I'll do that for v2.
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >
> > Best regards,
> > Krzysztof
> >

