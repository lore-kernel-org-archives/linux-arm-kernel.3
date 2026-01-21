Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120A0C44525
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 12:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HjdByAbPJTeDuGEDNiYTUtgD0UckMjRF1RPmGXvzV8=; b=C1npAvvm4S7VrzvekkOTPqbPwq
	SUY02dPS9wcOEngKobO3ETi7eSU7FYPFiZK14ddVBIB2UCDfNabN7bS1yyEI0QW0tRwNlhJg0ODSz
	JxOiptKLQSnsU7rEMv4z5Vcqqd1DUV/f5VsRbn4HI1A2QhXcG9hhkEu022nGueA8VWUv+z5FvRHe5
	nL3gWNH1dLYW8D+NHPVKeYfKH1KBxR/kXJDxLo8mpOc5odTl1BwB/6z2TcQcakDclyXLBBWCIPR50
	qM6Z7rqVoJvmTTEB2m4AzfEHr//iwBVEmx+60iP2wa2GMWnG/pvyV4CepG5UmG4SJ29TZB9ffTACp
	LtXGnV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXXq-00000005RpV-2Lqx;
	Wed, 21 Jan 2026 12:42:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXXp-00000005RpE-1mwo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 12:42:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22137600C3
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 12:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAA9C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768999363;
	bh=0HjdByAbPJTeDuGEDNiYTUtgD0UckMjRF1RPmGXvzV8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UnVC/BhAV8RExjfRBGxd4SayHpkI6BXVApiddURNH6LADLweuCDo1yeyzxzzcjMKt
	 MNmEBWXfNGJ/p7Wg1W+pMupV/HHb7qvugLSoAFgklqtk/REb8XEEB9KfAXCZes1942
	 rY6K4B8xvhtKwh5ACxg0EykQDuq46vPZLAbl4G3hJ8VrEk99svpl4XvZ32gcUZSMxg
	 9ggkZOIeMQD+lgwX/pdji+pctRty4i7P5G1gCLjpL3IVfClR+H2k0YoV1a5hPhpliT
	 re4rsZjSWR0PC4HxDmXFVifTZsgaA6x4Sd/nqvrq9MruUBraCOoRiax28OHE38+a3K
	 L5qypK48qfwbw==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-646e2b3600fso5881695d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 04:42:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUyCOmLOZp/dIjJZF189TJ04zyHCS8Qd1IAQqarUK0Y9GOjqZlOXmDD3kpxKTPnaO5iEdxbDZM15gvSfs7kIdXX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7BlvUls/0ClNIN/G45Fs03hjnjWTXo2k9cVTTQTVoVzwJOqnr
	GJyuJqu47sjy7p/J5y0XUWjJJSKzNwUx5q8d3M+PPV/dm94JKwiqLiRgSmAVoDW6hG+mkuI0QIx
	4XlstaEg6CCujecUhqP9/46tp2Voz3gs=
X-Received: by 2002:a05:690e:188d:b0:644:60d9:7525 with SMTP id
 956f58d0204a3-6491651e69dmr12004302d50.87.1768999363203; Wed, 21 Jan 2026
 04:42:43 -0800 (PST)
MIME-Version: 1.0
References: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
In-Reply-To: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 21 Jan 2026 13:42:31 +0100
X-Gmail-Original-Message-ID: <CAD++jLkSmV1kVT+c2Nk-oWMS7WPgeu2NbF0yt4SUVsTmAUjq3g@mail.gmail.com>
X-Gm-Features: AZwV_QiQRH_FgyO-4O8MQg7hUCGXaZg8vwoF5MWGo_Re4DDhsmu71vEaHa_pOBQ
Message-ID: <CAD++jLkSmV1kVT+c2Nk-oWMS7WPgeu2NbF0yt4SUVsTmAUjq3g@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add Aspeed G7 sgpio support
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	bmc-sw@aspeedtech.com
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

On Sat, Jan 17, 2026 at 12:17=E2=80=AFPM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:

> The Aspeed 7th generation SoC features two SGPIO master controllers: both
> with 256 serial inputs and outputs. The main difference from the previous
> generation is that the control logic has been updated to support
> per-pin control, allowing each pin to have its own 32-bit register for
> configuring value, interrupt type, and more.
> This patch serial also add low-level operations (llops) to abstract the
> register access for SGPIO registers making it easier to extend the driver
> to support different hardware register layouts.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Changes look reasonable to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

