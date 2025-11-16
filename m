Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF9FCD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 12:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNn0qP/249kJDQzGSS/F/L8+NQ46eWkZ/7Q+EwQ3/5A=; b=uqiVtC5OLXFV5Y
	+Wqz7CPP3c5Dxi6TRsh+YnaEmVWYjxMGyPQITjicgwQQsDzSGQFYBP7A32WkG/F6xYTcs2qIViGZs
	gTqyygoH8VyQlDHru8AhVLa1MSbAZpOQlChOczSbT62Aaf2JYADp11YQ5cGmlzWgVN8OaQuco6gOI
	u+iGbWg1IBygZ8z/HyVkit1zuRo2Z0tOSHgKH8VUaujVOn5uNrV/+QApQFi7GRs+hoB4yY15Xpr8r
	mzdzn4dfUwGCoNbcniWGPBlBiUZ3MWWjSvJNNT3m0if5rxRC+RGAKdU/FKyL7UBMfU3WT6JngS672
	P7iYHcnlf45dT8QZUMXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbXy-0000000Ebvy-0drw;
	Sun, 16 Nov 2025 12:07:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbXu-0000000EbvX-43IS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 12:07:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3151A43650
	for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 12:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8307C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 12:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763294873;
	bh=iNn0qP/249kJDQzGSS/F/L8+NQ46eWkZ/7Q+EwQ3/5A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=m9bQeEPgYrSLZI637fXuUKI8PVad8FU3ii4iMgR2lx+EE18IZlvLI8V1QQpE3APAp
	 +lniZsf4NXDG9QQ1bhI4jowjW+8emoAyRM5cbpi7SGIwj4lls6Ows7eKfgnYJR7FvD
	 3BbuBnlv61bZgehE/8Kb1NjBRRk+2M+atX0g5tZ4/5Pja5/KCazyxxLpBQaIhya0jd
	 rYQ/bf5zlZyU14VBtFbQJmeURdA2YJ6KfK2BgxremSmP6cIVwEZMGuVcvYW4XrQyjM
	 5saxI+Q3o6VvHMFFYHr1pQ7AKNgwRbqiw4NTBcNYpSjyKTTXab714xPMoeVwlwxZhK
	 LOJkLBBLHfNlg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37902f130e1so27392981fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 04:07:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXAlt0y+u1HfBBnASv7HzNjLB7ponlrrj5kch2ULrrXTb2j7kQuIo03gZQi0QZBpiZHmBfEDfzPGhX0SHZX+gE@lists.infradead.org
X-Gm-Message-State: AOJu0YwW673p0s62B+g6Ve89hOeooRgFtzYYrXN0ksvDgvenPJoQRGcG
	CGXAuJm/jh+vDLHXJuISCCA7ehzb1ISMvrlVsKjSIlY0l9hdS0sO1fIQrjxGPsryxLphkmTgsVy
	3TFovWC5ErQ1U4nHdYx/jr1N8nXW4gKg=
X-Google-Smtp-Source: AGHT+IEvIN8OBOVj188eKaOm21h0kLrZfEbd8gXOEWO1ViahGfGkiAHVWIOgpRFEEEODq4tccJOhUGpdSt0NBiXPH2A=
X-Received: by 2002:a2e:8a87:0:b0:37b:b00b:7988 with SMTP id
 38308e7fff4ca-37bb00b7bccmr18734591fa.29.1763294871956; Sun, 16 Nov 2025
 04:07:51 -0800 (PST)
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251116-pigeon-of-optimal-blizzard-2cb3b3@kuoka> <4b4ebcc2-491a-42d3-9758-60de80ce5eb6@kernel.org>
 <10753322.nUPlyArG6x@jernej-laptop>
In-Reply-To: <10753322.nUPlyArG6x@jernej-laptop>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 16 Nov 2025 20:07:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v65tBHCE7RYPBKKD2j5=rwoH1+pYasNbF5X1=GMSumcHsg@mail.gmail.com>
X-Gm-Features: AWmQ_bnmhrPCrlQnEh24KiJ1VDf4jAXcqEIaG3lMOfIOQYYG1c8ox1KSD4eS4QE
Message-ID: <CAGb2v65tBHCE7RYPBKKD2j5=rwoH1+pYasNbF5X1=GMSumcHsg@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: display: allwinner: Update H616 DE33 binding
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, samuel@sholland.org, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_040755_044308_A2BFE27F 
X-CRM114-Status: GOOD (  26.39  )
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

On Sun, Nov 16, 2025 at 8:00=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Hi!
>
> Dne nedelja, 16. november 2025 ob 12:33:55 Srednjeevropski standardni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> > On 16/11/2025 12:33, Krzysztof Kozlowski wrote:
> > > On Sat, Nov 15, 2025 at 03:13:46PM +0100, Jernej Skrabec wrote:
> > >> As it turns out, current H616 DE33 binding was written based on
> > >> incomplete understanding of DE33 design. Namely, planes are shared
> > >> resource and not tied to specific mixer, which was the case for prev=
ious
> > >> generations of Display Engine (DE3 and earlier).
> > >>
> > >> This means that current DE33 binding doesn't properly reflect HW and
> > >> using it would mean that second mixer (used for second display outpu=
t)
> > >> can't be supported.
> > >>
> > >> Update DE33 mixer binding so instead of referencing planes register
> > >> space, it contains phandle to newly introduced DE33 planes node.
> > >>
> > >> There is no user of this binding yet, so changes can be made safely,
> > >> without breaking any backward compatibility.
> > >
> > > And why would you configure statically - per soc - always the same pl=
ane
> > > as per mixer? If you do that, it means it is really fixed and interna=
l
> > > to display engine thus should not be exposed in DT.
>
> Not sure I understand what you mean. H616 SoC has 6 planes which are
> represented with single DE33 planes node (see previous DT binding).
> Driver has to decide initial allocation. For example, 3 planes for each
> mixer. However, nothing prevents to allocate 1 plane to first mixer and
> 5 to other. You can even allocate all 6 planes to one mixer and none to
> the other, if board has only one output enabled.
>
> In any case, plane allocation is runtime decision and has nothing to do
> with DT. Since planes are shared resource, their register space can't be
> assigned to only one mixer.
>
> See [1] for example how this would look like.
>
> > >
> > > Describing each IP block resource in DT is way too granular.
> > >
> >
> > BTW, everything is update, thus subject is really non-informative.
>
> I guess "fix" would be more descriptive.

Or maybe be more specific, like "split out layers register space to
separate binding / node".


ChenYu

> Best regards,
> Jernej
>
> [1] https://github.com/jernejsk/linux-1/blob/d93d56d92db52c7ff228c0532a10=
45de02e0662c/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi#L181-L235
>
>
>
>

