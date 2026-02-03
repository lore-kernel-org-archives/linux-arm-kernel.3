Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D955E7FDFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 00:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74/WSz0klXArild+qNTMXu5HAVoXnsR2VdubFzeU5OA=; b=IkACwH26Bf7gNaHuGE4Ohaqk/z
	jITrKpIBLe9VPEyQ8CjPI4wa1PTjVOB4gWod3rUl+b+PAcYWMLC/2KE4EAFfxOUmlfuYG2KvxFxaE
	MDNvwbCV0Kc5DjjBGjzh7crulM0hTX0kzc1m9hV/w/dVbkQfc1Dm/epqYZKiu7DZc4QdZCYwQ/ZCe
	UaqVZ2ZuAO93MYVY8JmkciOwVnVlNJPCZnF7q1tEwvEVzXoLagl/mzFr33Lt49umBW3Npthsqx5mc
	IqNu237ZZ0nUnumlkjPDfQBZJ9d5wqF+pSS8EPXp7wvMMZjUbTj8abagxe7hckqiN13+a89SLLGEE
	3QF/W8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn43D-00000005mK4-0EJf;
	Tue, 03 Feb 2026 00:13:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn43A-00000005mJj-29Qh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 00:13:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4C6840788
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Feb 2026 00:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C11DC2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Feb 2026 00:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770077623;
	bh=74/WSz0klXArild+qNTMXu5HAVoXnsR2VdubFzeU5OA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SLKNESQlId2a8NRBPqQGZn5WQjpkO5B1FQAiWsXcyI2CQfb2MOzMr8PyOLEITeCtC
	 ah/G74xhRjV+qR6QUViFKxyCgI2yV32+bx9Fb8DsFOS/6Fazi7g+XSQQvvmTQUg/J7
	 6jr2y2e6Ow0o373DXuwc4umHP1HyRVq7oln5T+yfrDISudc3Lgl5zlD0oFn48YAudH
	 6G2lBoo7GvTwP9S4ZOb3mipAwYeslFdCIX7ULeH8NbLehbuiHk7Dimv2MAG2JqTT7U
	 wWQiE5zxT1111IeOerlvWrvsrqTGiiAhilgJy7FaXD2n3pA2wLa3r01oovsdoK+P8V
	 bsbASbxsi8V9w==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64938fce805so4505956d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 16:13:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWLAFDngb9iwvHbp05Z9HHsil28EAttYB3W0yTMuvyx4lUTP9ZtZD3SI2PvLiAR9znHGDNaBarOKm5h05a1fUI@lists.infradead.org
X-Gm-Message-State: AOJu0YwyQq0ZDsPHTX8lL2aXTD2GaDNLAjcUVrYBZHPHSrDEyy3x8FaZ
	FhWmVcQIn5vy2fHVC4YfD2C1VTE1pvWSSaQxGx/NZiAlrIOIUOxP9TyUqEugoJfAVD/80LzdbV9
	1BsNHO5/hCYNUIywMooH0mFNqvOx/oOk=
X-Received: by 2002:a05:690e:1687:b0:649:b1d2:4915 with SMTP id
 956f58d0204a3-649b1d24adamr8861755d50.48.1770077622616; Mon, 02 Feb 2026
 16:13:42 -0800 (PST)
MIME-Version: 1.0
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
In-Reply-To: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:13:31 +0100
X-Gmail-Original-Message-ID: <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
X-Gm-Features: AZwV_QjrSedGM9ncbmebsgpUkO7L1UvY-Meo5qc4rUg0SMHd3RslWKmtaKN7o7g
Message-ID: <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andrew@codeconstruct.com.au, BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_161348_745827_40CAD540 
X-CRM114-Status: GOOD (  19.74  )
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

Hi Billy,

thanks for your patch!

On Fri, Jan 23, 2026 at 4:41=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> This series is motivated by the pinmux and pin configuration register lay=
out
> of the ASPEED AST2700 SoC, which exposes several limitations in the curre=
nt
> pinctrl-single behavior on bit-per-mux platforms.
>
> On AST2700, pinmux registers are laid out contiguously per pin, with each=
 pin
> occupying a fixed-width bitfield and pins packed sequentially within shar=
ed
> registers. While the existing pinctrl-single,bits binding can represent t=
his
> layout, doing so requires manually constructing offset/mask/value tuples =
that
> do not map naturally to the hardware model and are error-prone to maintai=
n.
> In practice, describing pinmux configuration in terms of <pin_index func_=
sel>
> better reflects the underlying design, improves DTS readability, and redu=
ces
> the chance of mask or shift mistakes, while still preserving
> pinctrl-single,bits as the preferred and fully supported binding when pre=
sent.
>
> AST2700 pin configuration registers follow the same per-pin packing schem=
e as
> pinmux, with both multi-bit and single-bit fields arranged sequentially p=
er
> pin. However, the current pinctrl-single pinconf offset calculation assum=
es a
> linear per-register layout, which does not align with this bit-per-pin sc=
heme
> when bit-per-mux or function-mask configurations are in use. Aligning pin=
conf
> offset computation with the pinmux logic ensures consistent and predictab=
le
> behavior and avoids incorrect pinconf operations on such platforms.
>
> In addition, on many AST2700 systems the SCU register range containing th=
e
> pinctrl registers is commonly reserved by a top-level syscon node or by
> firmware. In this configuration, devm_request_mem_region() can return -EB=
USY
> even though the registers are valid and intended to be shared. Since
> pinctrl-single is a direct MMIO-based driver and does not integrate with
> syscon/regmap, failing probe in this case prevents any pinmux configurati=
on
> from being applied. Treating this condition as a warning allows the drive=
r to
> initialize while still reporting the shared-resource situation.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

I would need the pinctrl-single maintainers to review this before merging.

I personally would not try to extend pinctrl-single for this, I would
write a custom driver using as much of the existing helpers as I can
and use the pinmux =3D <...>; DT property.

Yours,
Linus Walleij

