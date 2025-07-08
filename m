Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCE4C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 09:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XsAV3ECR0VC3tyflJlviJu4ZkBSybjM3a9odoodsNIg=; b=v52tcdsIPqZ+Dy
	YVZJT77eazvyIezjTE2rk/qevEW4cck+IH9630ym6hrH2J34w8AVdmdIRVKvI28iyQvL4NLgCSISt
	hhGx079Ys3ewMtYlSq8ULfjn5xgGFayew6GGsNXmio1BA+r5ixGy3dXCRWYW7LC6lpAHHD76QRrrq
	6Wjp3Sjb7n2sNJK7nHxr5UDuhQ6B6n4PxltlePyaaHMnwH8au6F6ArWczij2NaJ6KsqQQ78RZ4TFL
	Vc/BKL0UBK+e7z9nk7uSX9ldRr1nYdEE09tcPYCh+9rj96Rwp3qRCUvgEEacuGOTcZqlCB9ZM1nw5
	ZVYCdxM/OAuGnpi/71lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4jX-00000004uEW-0cNQ;
	Tue, 08 Jul 2025 09:35:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ46p-00000004oYH-0Prg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3994F46728
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Jul 2025 08:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184CFC4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Jul 2025 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751964926;
	bh=kpstOjw4lLF9eP2jFzFpACQzhk54uwH0eGlIjnY6txU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Bs06Ann6YziWgddfpvw/M9gC3KlX127POufp+uJpfiasKEYtMoUHWfuj0RYCH1ger
	 XYNiGAd6ndxVo0yNppVjsM3dwAJsJ4F1wYEzYCG75X11ynyFpM/P9KES8funbIjNwY
	 nKUPw5xR3Q+Vo90JEk6M9KmVIGyZkm46/+iQOaWnMXbZ9qLv7SQMoXQo2ZBWlZUB60
	 B2KBA82o/0JqdSSjzasdUI41EMFDMzzp+41sl3i5IXUocdQS9S1uPORoZYD7hyfrd2
	 st/BVBgi+/HfF9hkEc814aDmhbAFCqfn3K9v+XhoLDuWeXS2jZHcpIWmwDZWlnDvs2
	 nnaPCYzZWU4nQ==
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-875acfc133dso132704539f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 01:55:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWS+SteNuJGZHHf5B98rV00x5K+fvBcPFRTJ0xB1U2kE7QIb3dR0yrQiFOZ0d4iErmIwrFypg7p523DPQOuIe7v@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1EtCzzOo7P0mVO3EDK8+cVznN/mTI7ZhMQ4nsm7AMd7XyJrfr
	u1HuWBj4b2h5aKSZZuvE1K7dN3+WbeZmanSVj1s9PvNMb9pDF9sRtFTY+R6YFku4b1DFzXMPhkr
	MnUinPDPI1Ss9ISM+ncAiWWA+CZdrz/w=
X-Google-Smtp-Source: AGHT+IF8+rXljY0T3bGeUJ9XXKLa71g9blAF0Fp8stGo0h3DgAP8zTEF2uLbmLy1XQvXT3W/Bs/Wr47ANAVaNz9utYc=
X-Received: by 2002:a05:6602:148c:b0:864:a2e4:5fff with SMTP id
 ca18e2360f4ac-876e158bb24mr1892894139f.4.1751964925465; Tue, 08 Jul 2025
 01:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250627152918.2606728-1-wens@kernel.org> <20250627152918.2606728-2-wens@kernel.org>
 <20250708-capable-caiman-of-feminism-9dfef2@krzk-bin>
In-Reply-To: <20250708-capable-caiman-of-feminism-9dfef2@krzk-bin>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 8 Jul 2025 16:55:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v66SvNmWGYSfVdDfBdRjSz0mQ=f0HHFnQ9eSXSe7fVMEVg@mail.gmail.com>
X-Gm-Features: Ac12FXzLrfMehixQaVjm6pOEjtJAPHoo0j9_l4de3O9Fupbjy73Y0-TvdN1ohlY
Message-ID: <CAGb2v66SvNmWGYSfVdDfBdRjSz0mQ=f0HHFnQ9eSXSe7fVMEVg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: power: Add A523 PPU and PCK600 power controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_015527_317307_E362212B 
X-CRM114-Status: GOOD (  24.19  )
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

On Tue, Jul 8, 2025 at 4:47=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Fri, Jun 27, 2025 at 11:29:15PM +0800, Chen-Yu Tsai wrote:
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > The A523 PPU is likely the same kind of hardware seen on previous SoCs.
> >
> > The A523 PCK600, as the name suggests, is likely a customized version
> > of ARM's PCK-600 power controller. Comparing the BSP driver against
> > ARM's PPU datasheet shows that the basic registers line up, but
> > Allwinner's hardware has some additional delay controls in the reserved
> > register range. As such it is likely not fully compatible with the
> > standard ARM version.
> >
> > Document A523 PPU and PCK600 compatibles.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >  .../bindings/power/allwinner,sun20i-d1-ppu.yaml   |  2 ++
> >  .../power/allwinner,sun55i-a523-pck600.h          | 15 +++++++++++++++
> >  .../dt-bindings/power/allwinner,sun55i-a523-ppu.h | 12 ++++++++++++
> >  3 files changed, 29 insertions(+)
> >  create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-pck=
600.h
> >  create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-ppu=
.h
> >
> > diff --git a/Documentation/devicetree/bindings/power/allwinner,sun20i-d=
1-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-pp=
u.yaml
> > index f578be6a3bc8..b9f550994512 100644
> > --- a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.y=
aml
> > +++ b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.y=
aml
> > @@ -18,6 +18,8 @@ properties:
> >      enum:
> >        - allwinner,sun20i-d1-ppu
> >        - allwinner,sun8i-v853-ppu
> > +      - allwinner,sun55i-a523-ppu
> > +      - allwinner,sun55i-a523-pck-600
>
> Don't add items at the end, but placed in alphabetical order. Could be
> natural sort if you insist, but binding does not use it.

In our other bindings [1][2] we have them sorted by family (sunXYi)
then by SoC name. I can move sun20i-d1-ppu after sun8i-v853-ppu to get
that ordering. Obviously "-pck-600" would come before "-ppu".

Would that work for you?

[1] Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-contr=
ol.yaml
[2] Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml

(There are some out of order entries regardless.)

> >    reg:
> >      maxItems: 1
> > diff --git a/include/dt-bindings/power/allwinner,sun55i-a523-pck600.h b=
/include/dt-bindings/power/allwinner,sun55i-a523-pck600.h
> > new file mode 100644
> > index 000000000000..6b3d8ea7bb69
> > --- /dev/null
> > +++ b/include/dt-bindings/power/allwinner,sun55i-a523-pck600.h
>
> Filename matching compatible (which ever one is correct).

Ack. Will change to "allwinner,sun55i-a523-pck-600.h".

Thanks
ChenYu

