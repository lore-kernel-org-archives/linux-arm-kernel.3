Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89650D12D7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 07:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRwmAWT8xPVKbim8r7BKJ41XClJL4X8nd2o/c/Tzn4w=; b=gypmJ86suYHCJ7zfi4ZIjfQ/IF
	eH+Geqzs0R983BmUFPplNHyv/NwhBHyX4HhPCZ+KaOHhKXalqz2a0uOZtLzcWNhGEWLLlOA3HNrRE
	tFu4rxLUycuraYvKoEM98NcRZ69xVcZl5mSqmNVSCl6KBgbYA7R0ga9ABchhKriBemhH8qnYTguzY
	ZAULOSabMgg9vBJQTUwbo21kRcKikBB6sZX376Dh0p92mB/yJxgiYucNPwYrDxVweFHSexYDDYVsj
	H7efO3e3KitCMzZPPmRvkJOCkinPdh21Zn+NCCa7JD6ZtrIGfyuhK/VNkR6Hs+SXtO5iNLrItetyG
	pwaMfqKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOcH-0000000GeFn-48aP;
	Mon, 11 Nov 2024 07:13:41 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOZd-0000000GdRX-1GxY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 07:11:37 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-84fd057a973so1621390241.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 23:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731309055; x=1731913855; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRwmAWT8xPVKbim8r7BKJ41XClJL4X8nd2o/c/Tzn4w=;
        b=bLtNlmrmEST9+eR699TrX/F/jGr7eqkR8oAcFtZgyF/KM1iSPXux7yNeXjkT7eei78
         DS394uI6y27rHNiQ70AzPWTdT6eoRLgf7b7/3XcnelqyQAEPRmopvyMQkz4/0FBY4MO2
         q/eAHuU4n3EY2gLX80o7nxOjlBVGXfZo8x/UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731309055; x=1731913855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRwmAWT8xPVKbim8r7BKJ41XClJL4X8nd2o/c/Tzn4w=;
        b=Jv7jcjbx0R7LgJdxEmrELflC78FIVaw2WdU3CgKQLbko2QaRdXcUXkJcSpMF+jnJVJ
         5k9ZRKd1yRW/FVZe4eKUXXS5l888MCCVQULL4RCyzQsFYZGt3KY1uYLUUbCC99i9OIr3
         687hpctzpGA3GXh0jWl0rh620eiGfOSi6ESN8NLRCOB9OIqE3yWRzJwVN1vAUNXcIOft
         MTq+vBjIXCrqBRExZp7jzDNvCFlBc4vo49YtYqmv6dG9E4NVJMfbbkokyU+ygesFxwXs
         mw3WWSsRXQ0RNjOyaxt4T+LUlTNht32+dS3OHR6dria3eRNRRpDhWnrxpY2Sd3n9Dn0y
         5igA==
X-Forwarded-Encrypted: i=1; AJvYcCUrVy5KJtG54Cd9m1e4PM7SZ5aHi7FIUS0Ky73VPdBit2a5gWlMQ6WCA9P3WKokEzOMMkskxbuFO6uNK+pe2CI1@lists.infradead.org
X-Gm-Message-State: AOJu0YyBOwse2SB/iYwq+IemeBCezkQ9ZYn3Qb6UUvu0HtLO6/NMaHF+
	gaY5MV1AZaSSROOaYVLYBARI4v6/Ci68Gj4hB7AHblPyjGK8yX16ltNZZppyFnOdo0FHKAusL+c
	=
X-Google-Smtp-Source: AGHT+IEwE84azzJMlPye8lGvBr+9NH/xNIfgKCpqFT83pOaNee3SKhVWFdTJgkoks3j4oy8ePc3wNg==
X-Received: by 2002:a05:6102:3ecf:b0:492:96b5:aa0b with SMTP id ada2fe7eead31-4aae134d12cmr9078131137.2.1731309054806;
        Sun, 10 Nov 2024 23:10:54 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4aa9ef0a008sm1474707137.19.2024.11.10.23.10.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 23:10:54 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5139cd002b7so1649240e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 23:10:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVx17VbXGosp0GzMm6O76LiI1vlXj2au8oz7hcfmpUumwHYxeckxtFvl9D4g+1Nohmlh+JWH73a2ZThkBdGgPbt@lists.infradead.org
X-Received: by 2002:a05:6102:440f:b0:4a4:9541:e384 with SMTP id
 ada2fe7eead31-4aae165882dmr10240215137.23.1731309053523; Sun, 10 Nov 2024
 23:10:53 -0800 (PST)
MIME-Version: 1.0
References: <20241105093222.4055774-1-fshao@chromium.org> <20241105093222.4055774-3-fshao@chromium.org>
 <b66dbf9e-b35b-482c-9eb7-112ef1f398d6@collabora.com> <CAC=S1ngozo11g1vF2jnHjTLcNmP8tOMsQhK+LR0QWqoeXwSJjg@mail.gmail.com>
 <59f4bcc1-c752-4f2f-8e55-349cc2432b8a@collabora.com> <CAC=S1nhhfwHU5K5ZyUhZBhvz38LOZGLnGN-Rc1ZAup_VTfkpvA@mail.gmail.com>
In-Reply-To: <CAC=S1nhhfwHU5K5ZyUhZBhvz38LOZGLnGN-Rc1ZAup_VTfkpvA@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 11 Nov 2024 15:10:17 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj5PVJ=zwZiBLoOCHzsspaRw9ddAH_dXfPayD=LyW5wNA@mail.gmail.com>
Message-ID: <CAC=S1nj5PVJ=zwZiBLoOCHzsspaRw9ddAH_dXfPayD=LyW5wNA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: Introduce MT8188 Geralt
 platform based Ciri
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_231057_820356_682740CA 
X-CRM114-Status: GOOD (  42.66  )
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

On Fri, Nov 8, 2024 at 12:11=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> On Thu, Nov 7, 2024 at 6:37=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 07/11/24 07:58, Fei Shao ha scritto:
> > > On Wed, Nov 6, 2024 at 9:19=E2=80=AFPM AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com> wrote:
> > >>
> > >> Il 05/11/24 10:30, Fei Shao ha scritto:
> > >>> Introduce MT8188-based Chromebook Ciri, also known commercially as
> > >>> Lenovo Chromebook Duet (11", 9).
> > >>>
> > >>> Ciri is a detachable device based on the Geralt design, where Geral=
t is
> > >>> the codename for the MT8188 platform. Ciri offers 8 SKUs to accommo=
date
> > >>> different combinations of second-source components, including:
> > >>> - audio codecs (RT5682S and ES8326)
> > >>> - speaker amps (TAS2563 and MAX98390)
> > >>> - MIPI-DSI panels (BOE nv110wum-l60 and IVO t109nw41)
> > >>>
> > >>> Signed-off-by: Fei Shao <fshao@chromium.org>
> > >>> ---
[...]
> > >>> +&pmic {
> > >>> +     interrupts-extended =3D <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
> > >>> +};
> > >>> +
> > >>> +&scp {
> > >>
> > >> Is this SCP-dual or SCP?
> > >> I see SCP, but I also see a SCP-Dual memory region... what's going o=
n here?
> > >>
> > >> Of course, the SCP-Dual won't work if you don't override the compati=
ble string...
> > >
> > > To clarify, the second SCP core is used for MIPI camera in downstream=
,
> > > and I deliberately only describe the first SCP core here since the MT=
K
> > > camera ISP driver isn't in upstream at the moment.
> > > I had a fixup patch for removing the scp-dual reserved memory region,
> > > but likely it was missing during the rebase... let me check again if
> > > it can be removed, just in case there's firmware protecting the regio=
n
> > > and the kernel shouldn't access it.
> > >
> >
> > Hmm... but the second SCP core can still be brought up, even if the MIP=
I Camera
> > driver is not upstreamed yet, right?
>
> Well, that's true... and it should pave the way for validating the
> driver with the upstreamed DT whenever that becomes available.
>
> >
> > That shouldn't cause lockups and/or other kinds of bad behavior, and sh=
ould
> > bring up a core and just never use it, without any particular issues.
> >
> > If we can enable the secondary core, let's just go for it.. as that wil=
l help
> > specifying the exact memory layout of this board (and failing to do tha=
t may
> > create some other issues, that's why I'm proposing to enable that even =
if it
> > is not really used in this case).
> >
> > What do you think? :-)
> >
>
> Sure, that sounds good to me, too.
> I started only with the essential DT bits to ensure the device can
> boot, which it does, so I guess it's time to bring that back. I'll
> incorporate that in v3.
> I plan to fix up the single SCP core node to SCP-dual directly, so
> please let me know if you prefer seeing that as an individual patch on
> top (either option works for me).
>

In fact, I noticed that it seems to require modifying mt8188.dtsi (and
potentially mt8390-genio-700-evk.dts) to support the second SCP core,
but I want to avoid doing so in this series if possible to keep this
as a pure new .dts introduction (if that makes sense).

I can think of 3 options here:
1. I resend this series *with* the single SCP core enabled in
-geralt.dtsi. And then I send a follow-up series to introduce the
second SCP core and update the affected .dts{,i}.
2. I resend this series *without* any SCP cores in -geralt.dtsi. And
then I send a follow-up series to introduce both of the SCP cores at
once, and update the affected .dts{,i}.
3. I delete the parent (mt8188) scp declaration and re-describe the
dual-core SCP structure in -geralt.dtsi. This avoids touching
mt8188.dtsi and mt8390-genio-700-evk but leaves the dual-core SCP
stuff exclusively to geralt/ciri. I don't know if MT8390 wants to
utilize the second SCP core or not.

I guess (3) is less likely what we want down the line, but that's just
for reference. Any preference/suggestion?

Regards,
Fei

> Regards,
> Fei
>
[...]
> > Cheers,
> > Angelo
> >

