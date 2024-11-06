Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D53D59F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmGjdX560phYOMnUGNxDLQ5D/ndLDKNLI3vEydTFtCw=; b=TksB8paMgoE3xiLhjmUNBDL/5D
	cnPrlUNw559x1UEpZavDHagT4ki6PRSU+yHGovbT4Ub7sLynEXJ4iH4ZeuKEz0KtcqY9TpzUZY0o6
	zmxgVuNXwoKxkFgb5OZWNu8fPVN9jsWG6QQaW3dEbgAXJzoJfyQB4vjS7a8xGzolom2L4oucfue5f
	czH0bhI/bokp3M3d54OFQA9oyFMgQeMJJJ0sxzybwZXcpwdGmipNyukNfDIPDUsPfQTVvCyHBlm5s
	ZMP+CTWOqa8bIOsv8DgUqyD4/B07YSflSssVaFie96ooC6GvwGyfddLTndB7TdG6GOixPrSx5SMWU
	eKq7ItaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kyV-00000004Nfz-0VeL;
	Wed, 06 Nov 2024 18:41:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kwl-00000004NV7-19cF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 18:40:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87976A44246
	for <linux-arm-kernel@lists.infradead.org>; Wed,  6 Nov 2024 18:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230AAC4CECD
	for <linux-arm-kernel@lists.infradead.org>; Wed,  6 Nov 2024 18:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730918402;
	bh=SmGjdX560phYOMnUGNxDLQ5D/ndLDKNLI3vEydTFtCw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HiaX0aVmnYDwQi1Mprx35gxtFUh51uKtM3AfDW7o9VCSmYB3XVRFF/M8U7HPXF0vu
	 FAmDvyhuKkGkdhrT3RmsPz55QO/y3EGQCBhtgvtFCa+KjFHdRy/afetwGs1Rw6gSKk
	 r/OIZzxh0BimPBhaOLQUwxuin3luyclt+SAcxs6y9y6GmXff+jhAGImPeQi1VHxV3z
	 pvsb39HX+2U708QRqNamTBvNYqMzGl4dl1H/CcOvkx6PgnKNhMnWxwkpK6yAgpijH/
	 CMipdIGWnj1AbbzP7kpyYau9eqkHOlLDbZDtA0AC6HFXEnj9Zi1L/vsuiIpF8RuL4q
	 JILh5dvYzWqdg==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e29687f4cc6so94999276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 10:40:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNbqkCgAjJBCQpTBpwQG3+z3pNgVKKiwP8o9hWSFScSIMDe2cSpZHgwp5bBMfKfXQD0Mt7gvlw/f+6BwEFmhmx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz10zUniTiHniDEX7BNsW0Fbhaj0PDm5A+J4XD54FCqoDN6UpIQ
	+PLiwwCP6LVtPFI6xmLzb/ekSfp+8GVjsan9PGuldkMnREo9WK63oh+tGyFTQ2CtCP6kHNkFAby
	mO0S1QXMmjM5K4Lpju7OzVMDncA==
X-Google-Smtp-Source: AGHT+IHqHyWQZr3Kb4+lAVzkmrlMi6Kb562fzbCmjQZmI/dxFlh/J4Eg8RThK7adMjkoNv6+1SjeqeFuuO+ig4Pv6ms=
X-Received: by 2002:a05:6902:15c7:b0:e2e:3431:b754 with SMTP id
 3f1490d57ef6-e3302696128mr18078053276.50.1730918401410; Wed, 06 Nov 2024
 10:40:01 -0800 (PST)
MIME-Version: 1.0
References: <20241014193528.1896905-2-robh@kernel.org> <87r07p8x12.fsf@BLaptop.bootlin.com>
 <0A5AFF77-D888-4151-9C15-15A408709857@fw-web.de>
In-Reply-To: <0A5AFF77-D888-4151-9C15-15A408709857@fw-web.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Nov 2024 12:39:50 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKfpVVVh6L0PLmieBO3qMFpcDfWFwd+5=qzH_MbeZt31Q@mail.gmail.com>
Message-ID: <CAL_JsqKfpVVVh6L0PLmieBO3qMFpcDfWFwd+5=qzH_MbeZt31Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: marvell: Drop undocumented SATA phy names
To: Frank Wunderlich <linux@fw-web.de>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_104003_406640_83647617 
X-CRM114-Status: GOOD (  15.88  )
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

On Wed, Nov 6, 2024 at 12:34=E2=80=AFPM Frank Wunderlich <linux@fw-web.de> =
wrote:
>
> Am 5. November 2024 17:28:57 MEZ schrieb Gregory CLEMENT <gregory.clement=
@bootlin.com>:
> >"Rob Herring (Arm)" <robh@kernel.org> writes:
> >
> >> While "phy-names" is allowed for sata-port nodes, the names used aren'=
t
> >> documented and are incorrect ("sata-phy" is what's documented). The na=
me
> >> for a single entry is fairly useless, so just drop the property.
> >>
> >> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >
> >Applied on mvebu/dt64
> >
> >Thanks,
> >
> >Gregory
> >> ---
> >> Cc: Frank Wunderlich <linux@fw-web.de>
> >>
> >> There's also this 2 year old patch fixing other SATA errors[1] which
> >> was never picked up. :(
> >>
> >> [1] https://lore.kernel.org/linux-arm-kernel/20220311210357.222830-3-l=
inux@fw-web.de/
>
> Hi
>
> How to deal with my patch pointed by rob?

I believe it will conflict with mine. Can you rebase on top of
mvebu/dt64 and resend it.

Rob

