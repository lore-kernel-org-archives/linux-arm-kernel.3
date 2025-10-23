Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1BFCCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 11:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37Yl+KETe5V9EL+UtNnf15uR9Kp8+QHeooIKMU4FSCE=; b=q3xzTghKapGtacEw/JJoGfMKwU
	rHey6GlHVVLiiGiY8vODlk9tDPOOtxFbMTItAX17pwwd5wunMzdm+nN12XyL4HUpFos92yV7vWbd2
	xAGnlknDH5yJ5YVTIuKBeYpZ4r5tQw6tzA1Cjr3xmXjPOE4ZrTJ8K7r9AzD2Xw7GfzgyU49jlP8o1
	mM1Em1lXzoxPZCsMLptqRfITmM3ymlSpQFWrFCUUxZ6/yiwvafE3SAWfSd5z/W9+r1FUsPQVIuf02
	4/bZQRHdp47i6duDd48U2HL9CR+bVR8t3asRx7F+3t2q8P8pdYvmVCjctHvW3voLZpcH6sbD5jq/H
	+b5nMjbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtFh-000000062PP-1Isf;
	Thu, 23 Oct 2025 11:13:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtFf-000000062NF-004m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 11:13:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B32E04AC7D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 11:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A01C4CEFF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 11:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761217982;
	bh=VSofXPKltqSzfUAWfolhUYjZILc/jZGqF+OMoYUXiPg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f/9otqDCFyr/bE8MPe6ch3MwaJ1kyi5Kq9EIZzV9+hO+1AqinNOOZIBZfpxkZRBqx
	 bptX2Z7iZb5DDWZPoMUACkW/5EdPelk3FYviPAFMHF+r1xSgv+FD44cW5wPzUX7Vyc
	 UPCAoHqzRafCo4j3+dqcrjFjn6PVF/Z7dw9lvFYJ6AmGmD8inamXBApCsgijcdvu3k
	 yXw1KqlJ3tglPWS5WMKmaV+7TnJPTBD6NZi4BjsttO4YmL8W2P0xo+qTjb1yXtETSh
	 XAnPXhkXsJd8nEoZ9xMO9tYn/xk0twYm9keODkjt+L08SGR9DeHjrO2bSqxLW2ppEq
	 Fk5NvYeEA7B8Q==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-637e9f9f9fbso1264101a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 04:13:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQ48Or8zF2vy0WhW7Mvbe0txlNXxniWb65X6Ov1kNbRGa9h24SXPlBPjhuC0Pg900X5OEkuyj/DSXYIboiGfWs@lists.infradead.org
X-Gm-Message-State: AOJu0YxZcEJT27C94CI+PNnivm84hX4QAUpWI58Rv6jqfK1L1P2xLZ6t
	8+VlXYVUARPwwQ95V56KJ0EOv9lUv/IJDmAektCiTM6oypg8tFMix84z7ChyE5itbOM+j3sOuIX
	RvFuudN/4JGurB98SRhoO3Z/SJOD5+Q==
X-Google-Smtp-Source: AGHT+IHXTXK9Inhzp31f6w2tfR0eGiG69ffpyx6TLgXjLoQig5J/jMOVgrMAnyrlyG50AeAs4SS7Rb45JstbYWrnInk=
X-Received: by 2002:a17:907:9690:b0:b46:8bad:6970 with SMTP id
 a640c23a62f3a-b6d51c05e68mr217698766b.36.1761217981126; Thu, 23 Oct 2025
 04:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251022165509.3917655-2-robh@kernel.org> <87ms5iqf5b.fsf@bootlin.com>
In-Reply-To: <87ms5iqf5b.fsf@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 23 Oct 2025 06:12:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL+DY4j62m3_BVjC7_o9Hbx4a54UORDNBC+Pg0YAQCO+w@mail.gmail.com>
X-Gm-Features: AWmQ_bmtPaFimucwq25igSrk9S_iboFzoF-uoqSjxWerG3P5s9m5XHzlE7aUD-4
Message-ID: <CAL_JsqL+DY4j62m3_BVjC7_o9Hbx4a54UORDNBC+Pg0YAQCO+w@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: Convert Marvell CP110 System
 Controller to DT schema
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_041303_058682_2371E4FC 
X-CRM114-Status: GOOD (  15.92  )
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

On Thu, Oct 23, 2025 at 1:57=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hi Rob,
>
> > Convert the Marvell CP110 System Controller binding to DT schema
> > format.
> >
> > There's not any specific compatible for the whole block which is a
> > separate problem, so just the child nodes are documented. Only the
> > pinctrl and clock child nodes need to be converted as the GPIO node
> > already has a schema.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> [...]
>
> > +  "#clock-cells":
> > +    const: 2
> > +    description: >
>
> I am surprised you prefer a description to a constraint expressed with
> yaml. Yet, I am totally fine with it.

I don't, but no one has come up with a way to put constraints here and
then apply them to 'clocks' properties as appropriate.

>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks.

Rob

