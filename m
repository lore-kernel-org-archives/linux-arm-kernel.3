Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D841CF258C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 09:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6P8uDyScu6C9XLSpmcA4XuDYK4jr6mOghRaVnaENW4=; b=bwnpsH5Qtk7riGlmcEeAYMpF6x
	JWYBQc4QoW5mjYopCK3AxqVpOSZ9r62KzS7njDNobabPYSWcVj0zU0EXWT7wH+pgh/uegRc09uMfl
	xtaMFJJ9fN/FJ/Bckppdpk07c8YQiJP8gjFivmqtE7Bzg0Qi3l1IeKHt+VE7s8RJW4ZA3Xb3zZsL9
	xRwrfe+OnF3rWRFcOAmx2A0+aOz7zNnKOw1+mapuetqg/azJhUtAqDoQhYkDBSaPHkMcBkFv/NhTs
	Z+f99HXlFLopkFOLx/S2zb+vUaK78Xa+NzYAeVWPtE65JigBVwgZWNsuY0VikFN10Ee9Kf8krNfp0
	4nAbBefw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLec3-00000002sRs-0xAI;
	Wed, 19 Nov 2025 09:36:31 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLebv-00000002sPp-2lBq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 09:36:24 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-341988c720aso5404146a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 01:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763544983; x=1764149783; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6P8uDyScu6C9XLSpmcA4XuDYK4jr6mOghRaVnaENW4=;
        b=QZRfdCluE+ZemvsAF8O2MdSALGYb4z28zBycu+tx46DXTwb1ePVbUAk+wEPC4ipMnv
         6UAPUUv05GehjGV+9oxS6Afia+bsYxJIPg2jbCV7u7c+2IdbTWsgxXq9lWkxLvtLmJOh
         mb1H7SesFt2oQ8pBicYEFqZYCcIrQFWvJ5UcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763544983; x=1764149783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V6P8uDyScu6C9XLSpmcA4XuDYK4jr6mOghRaVnaENW4=;
        b=DpP3TFiAQEN+7ljFCI0/QC+qxj9w4ahVymdMdMCVbAFcXiaECRpEz/44/Oj4B/HXnP
         ZWKFsqtloroxPrTVMlweOpwGntcefDuuAvxBIYqp1ugg4ACJUSBubCUTWOu2Lo6h55f/
         TzR6aKEy8v3QMtQlPWgzyGr06bERqc9WWJ6jjN6kp1txDsmTjGky38xJrrDI+AhyDrMC
         B89eZfhrNucYK48k2Q3jCs9RntpWESFRocHQFIijwFoufZgZ25ZS0zap8M8DW+ZhiCZ4
         87JANaHUy77xrfwTugMKwak5xn1545uKX3+khTyDQAjVzLaSiS5cgunvko5nyOyL7zdX
         awsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmqNG+giH4hOVqw5JuFIDZpcEywM0Y9WffObPeI5nSj31xk66/h4DqHM2fBSmJ6NNRFXbiTwymoXy1moHDNNpf@lists.infradead.org
X-Gm-Message-State: AOJu0YwIlPi78VEHvPcRHfP2gZhgbtqHwPe+ETDH8LVaAFI8QRiPo5Zh
	uYZGFLu02SCOWnkyBOkevR3+mKIkcATUagtGSqB0o8I4Pwl8Xq/YFZGk33iK9/ogrX+iytYvGXO
	w4/5b4aV2GMCvbX4AswhCoqTxP06vmqjBpHuCkiqe
X-Gm-Gg: ASbGnctSJufUOOfa06EoVldHkI/YZjBys8GDT1OwSoyMTRjy/a+N0CzBvx4OfmlHtb+
	TMri68h0dCOlH9ILqmEokdbZWdk4YEOIW/g2Gf0pTgcEDcD9YqKmyi8PeJQrnPt40Pu2qsPcoks
	VJOdc9wmEXKC9UNTygcI8+BvLqQVViuw42BCkkj2HREBWtB+AbSlI7PDJEa/wCZgvkG5s+wM2NM
	tpC/xYPpFeSLKS2NgOGoxuwLvg+ce2npmQghqM5gv6XT9giu6FsV9Xg6A2RoG1+lNglTI4KkbKi
	bCdh7vfJ2VcwKuChMtiBr7nqAg==
X-Google-Smtp-Source: AGHT+IFkJsk4Xd41I5vYWSfC3DKAzGdHtv51O5Xe9lMmz3RD5rmx400+VHDPT6OGH/nk7mlg0LJRo3cilMQ8GtEQZ1E=
X-Received: by 2002:a17:90b:58e4:b0:33b:d74b:179 with SMTP id
 98e67ed59e1d1-345bd413350mr2018676a91.27.1763544982832; Wed, 19 Nov 2025
 01:36:22 -0800 (PST)
MIME-Version: 1.0
References: <20251119071126.1719405-1-wenst@chromium.org> <18342493-54f9-4e5c-be05-568a3026663e@kernel.org>
 <CAGXv+5EnfwRA1SMvt=3n7gj1gS3BndXKNVfmfkC=y6n2A3VsdA@mail.gmail.com>
 <d8f3eb00-c7a6-425a-9e69-a01bc3532f0c@kernel.org> <CAGXv+5HePVim+-fx0bG-geBHp3kLQbNGLyknGRx=LgLZ7H+DUQ@mail.gmail.com>
 <d8194781-56b1-49d5-a3a0-31360ee208b3@kernel.org>
In-Reply-To: <d8194781-56b1-49d5-a3a0-31360ee208b3@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Nov 2025 17:36:09 +0800
X-Gm-Features: AWmQ_bkq790FPnbaW-3x2fv9oE4JznTqbDdzK5BBuOgkVlnutqSDLVP4wnWyDkw
Message-ID: <CAGXv+5FwrudX5JwbSTkRMNjOUPmbjzP+qJ7FMrgX0Jj52HvrQw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: firmware: coreboot: Document optional device
 specific properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Julius Werner <jwerner@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_013623_718138_F041E803 
X-CRM114-Status: GOOD (  31.84  )
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

On Wed, Nov 19, 2025 at 5:26=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/11/2025 09:54, Chen-Yu Tsai wrote:
> > On Wed, Nov 19, 2025 at 4:13=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 19/11/2025 08:32, Chen-Yu Tsai wrote:
> >>> On Wed, Nov 19, 2025 at 3:13=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>>
> >>>> On 19/11/2025 08:11, Chen-Yu Tsai wrote:
> >>>>> Coreboot, or the ChromeOS second stage bootloader, depthcharge, wil=
l
> >>>>> insert device specific properties into the coreboot firmware node w=
hen
> >>>>> there are valid values.
> >>>>>
> >>>>> Document these properties in the binding.
> >>>>>
> >>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/firmware/coreboot.txt | 9 ++++++=
+++
> >>>>>  1 file changed, 9 insertions(+)
> >>>>>
> >>>>
> >>>> TXT files cannot receive new properties. You need to first convert t=
o DT
> >>>> schema.
> >>>
> >>> OK. Let me look into this.
> >>
> >> After the conversion you will hit another problem - you need vendor
> >> prefixes for these, because only generic properties can come without
> >> them. Otherwise (without vendor prefix) these would define the type fo=
r
> >> all other bindings, which probably is not what we want.
> >
> > I understand the concern. But given it's specifically under the
> > /firmware/coreboot node, which is inserted by coreboot, doesn't that
> > already serve as a namespace or vendor prefix?
>
> Unfortunately not or not completely. Properties have single type
> globally (with exceptions). This means whatever you write here for
> board-id will affect every possible future board-id property.

IIUC you mean it applies to every "board-id" property that is under
a node that matches the compatible "coreboot"?

Is there any way to limit the match also by path (and not just node name,
which I know is possible)? If we can limit the scope then maybe it works
out?

Or perhaps you are worried that some other new binding with a broader
scope defines "board-id" and thus conflicts with this one?

> >
> > FWIW the ship has already sailed for naming. The first three properties
> > were added to depthcharge [1] and coreboot [2] in 2018. The last proper=
ty
> > was added to depthcharge in 2023 [3]. That is what has shipped in immut=
able
> > firmware on ARM-based Chromebooks since the RK3399 days. The coreboot
> > change was presumably added for other devices.
> >
> > This change only serves to document what the firmware already provides.
> > Whether they should be grandfathered in or not doesn't change what the
> > firmware already does; it just makes it more well known. It's not going
> > to have any effect on validation either, as the properties are supposed
> > to be inserted by the bootloader, not added statically to dts files.
>
> If you convince Rob then it's fine, but I don't want to accept
> downstream solutions just because they exist. This opens the door for
> every vendor to implement what they want and later ask for forgiveness
> ("oh it is already there and we cannot change shipped devices"). I mean,
> this was fine back 2010, but that was 15 years ago.

I completely understand, and yes this does have that feel to it.
But FWIW the change is in upstream coreboot.


Thanks
ChenYu

