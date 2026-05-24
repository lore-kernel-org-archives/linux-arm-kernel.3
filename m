Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64253CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 20:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdF14EN2gaQGUPUIlCL2/+2xdkR1iD92W761e0Tt4JU=; b=TMBxlEZ+R0nBzE
	c3Vbs7hnvYSbWdBxIrR5grZ42VdWmsLNh7tXII8mkq2jSW+5YAmUnhYQm8NdCCXfJgJ91I8SgCDiU
	eLwzlUmKVNE/yckimofkloaIQAYH27as9t/BebmTRp+m4NHLHbRfyCG+kMzXkbIvZZ5EJl2Dmwwa5
	7O1MF38eg8xhkATNq1xM6BiCwsPRuu7znyDcT2h2f5sYN+qfur5alCT2quWQB427FDcRN9AyfhcYo
	wZlqENk3WT8RXgSq5l+Ym7wEblnTVKooaTziotKdFOk1+2W2mKoUrNngPPj8e2O5abERIRma2wbZl
	bbVKf1uf2x0XhAhEwFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFiH-0000000FcFP-0f5w;
	Sun, 24 May 2026 20:46:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFiE-0000000FcEQ-3F9W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 20:46:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C392442BC
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 20:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD4E1F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 20:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779655578;
	bh=XdF14EN2gaQGUPUIlCL2/+2xdkR1iD92W761e0Tt4JU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Jmp3uHrJalMuK97geIL59g/5n7B65j4S+VeBKj4DmDnWAQAOqouhdvFbo252rKe1N
	 EUpcyyD86pld7FFWuHYj2qi8ttslywQ2YFv76xk/LlUttVGuoD9e4xgAb2hVLHFodp
	 u6Q1IXTDm6SolrO1KWjZicEZWW5RynXVu/f7bW8JdKQU1niaxHUcErr+5GtJ0J//7M
	 tS3zfKpjQBSUnWPA00aobrjTTMyxvZ/TVTOv9zHAI180OLjHC+Dvj5SdsgPFJNu5mY
	 JaZH7oDTDHlAfcxE3VboyLjNP0h0O1pur4E3J7GfrvSc94tGzLkq5ydvaUoftCMZrX
	 zBlUfe1hiS8dg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3937014be0cso28813331fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 13:46:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ZUWdPak+NUPbkWSf55IEvl8ZJXmzzuR4pswnvfJrEYAe9l+N4LcrV1UuDEas7OMqeZCq7eBLNGu3RwXSVDpi2@lists.infradead.org
X-Gm-Message-State: AOJu0YyGn0vXG4l+rb4a94E6LBHBddqDUGzOEvZ3A+Ae2kI15HuSQ1lo
	2xnOdmuokgG9RZ6yfayH2V6vVSFTNBLFWFt74ubg5mnkoEL8RhBrLEzcf0E7cNuGuUtndrFjnpB
	YYMH3MqqCXBFaqST2fSmf0ayYF+RWxfE=
X-Received: by 2002:a05:651c:222c:b0:394:942:9bb6 with SMTP id
 38308e7fff4ca-395d8c129fbmr37366311fa.6.1779655576527; Sun, 24 May 2026
 13:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260505134812.408316-1-wens@kernel.org> <20260505134812.408316-6-wens@kernel.org>
 <afpUiupOgPhLksM8@shepard>
In-Reply-To: <afpUiupOgPhLksM8@shepard>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 24 May 2026 23:46:04 +0300
X-Gmail-Original-Message-ID: <CAGb2v64Ln=2RnOf_WKHJTGphofe-+iUddenu7H4FNFx03tJoOw@mail.gmail.com>
X-Gm-Features: AVHnY4LzB_OhmZqGSHcQSdeKCJP6XONAvy9GHgQqfzYfXCQHIhPSMFyqiHhyTFc
Message-ID: <CAGb2v64Ln=2RnOf_WKHJTGphofe-+iUddenu7H4FNFx03tJoOw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM
 region for video engine
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Maxime Ripard <mripard@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_134618_861576_23F1E7F9 
X-CRM114-Status: GOOD (  33.18  )
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

On Tue, May 5, 2026 at 10:35=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi Chen-Yu,
>
> On Tue 05 May 26, 21:48, Chen-Yu Tsai wrote:
> > The SRAM C region contains a partial alias to the VE SRAM already
> > referenced by the video engine. To avoid access through this alias
> > window, the region should also be claimed by the video engine.
> >
> > Add a reference to the SRAM C region to the video engine node.
>
> It feels very weird to have a reference to the DE2 SRAM region in the
> VE node. It seems unlikely that the same region would be used by both DE2=
 and
> VE and I am pretty sure can have both running at the same time without
> overstepping.
>
> From what I can see we have so far assumed that the SRAM C and SRAM C1
> are two different physical SRAM areas, but this is most likely not the ca=
se.
> My guess would be that SRAM C1 is actually a part of SRAM C and the DE2 i=
s

No. It's the opposite. 0x28000 maps to the same SRAM block at 0x1a00000.
If you write to one, you see the results in both. However the alias at
028000 can be disabled while retaining access to 0x1a00000. I don't
remember how much of the alias points to VE SRAM (0x1a00000). Maybe it
was the whole alias on the H6.

Also, I can't remember if this was tested on the H6 or H616, but the
VE indeed writes to VE SRAM (0x1a00000), so that part is indeed used
by the video engine.

> using another part of it. The syscon block probably allows switching acce=
ss
> to these different parts of SRAM C.

From what I've seen in the vendor BSP, both drivers toggle the switch.
I believe the goal is to prevent the CPU from having access, rather than
either peripheral claiming it as its own. And that is also what our SRAM
driver does. It claims the SRAM from the CPU. That's all. The toggle bit
pattern used by both drivers is the same.

> Also the sram_c1 node implies it's 2 MiB, which sounds quite unlikely.

That is what the memory map says. Calling it SRAM C1 is probably wrong.


ChenYu

> All the best,
>
> Paul
>
> >
> > Fixes: b542570e5605 ("arm64: dts: allwinner: h6: Add Video Engine node"=
)
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h6.dtsi
> > index 72ce1a75647b..88c6e3e105c0 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -205,7 +205,7 @@ video-codec@1c0e000 {
> >                       clock-names =3D "ahb", "mod", "ram";
> >                       resets =3D <&ccu RST_BUS_VE>;
> >                       interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > -                     allwinner,sram =3D <&ve_sram 1>;
> > +                     allwinner,sram =3D <&ve_sram 1>, <&de2_sram 1>;
> >                       iommus =3D <&iommu 3>;
> >               };
> >
> > --
> > 2.47.3
> >
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

