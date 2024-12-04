Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7A5E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgOnyvSPsysP0N8uHf75Ej+i9XPK5nyimRqQNT4YvFw=; b=kqSixGT95qfiWn6NH4SAo+oYGZ
	LiqoiAUE6nuDDAJRvvX1ElD42hGRm11mQLers/p3Y21pZyn/C1tt92SFuQ/n2OP6fJxZy1MDl+Fa7
	MWt531WnOVeerYduhnb5up42NGMgJYn7xLBe0lMfh+wqc4MTSlzr7dfREJAHcjPtS56wMse0mgZFm
	fwdv559lJDZyGXUyxhQXZ4V8kcWRxIPd/tsDCvGIw6d4r+yYHVsx1kpkEb58QvxvsPfdg7rahR/cW
	s1iuzYxw1Jvx5rlEHBnAnDNWOVWv5qU2NpBNp565K9t/qZFTZFvUrCxh1+qMCFX6hTjaA358Bz1gP
	KZHE33SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIq4w-0000000CmNe-3oh9;
	Wed, 04 Dec 2024 14:10:10 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIq20-0000000ClcQ-0Pc7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:07:09 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e3995f1fe30so4247891276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 06:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733321227; x=1733926027; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgOnyvSPsysP0N8uHf75Ej+i9XPK5nyimRqQNT4YvFw=;
        b=FNavVz4wIQDLKvw7op1p4qzDLQMJtUOGSvDs0YiHWg0v4Z3tCGfhwID4neDbj7r6hY
         4lnI41rGq1JNUwXOH4huW4pnIDf8l/ZHmkxiDtHvs/p1y2PV5D84Vj2Qzdq+yKP57oOy
         gHDDS0U+yLA+CeV139m0jUc1ssLWXdqx10lg4UiP8h5pANlZwV4jekLshbwwGYOjrb0X
         lJGv+If1HR52m2WFHBGE1dWBlgfUqn4wRCOoGJO4oD5vNCuvX5iKAX2VVPT46Ur1PFyt
         YYfILiFOIrbshjuOGo97DXyC43i5q4PWU97UXGOKkzF1OUi3cj1oX5zY3N+VW3odogmH
         oGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733321227; x=1733926027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgOnyvSPsysP0N8uHf75Ej+i9XPK5nyimRqQNT4YvFw=;
        b=HRnPPseq8mTUqy+Js7zO+L/LWaF3oF02VA/Q0ZQASVFtuHqRFWBxsq85WOHthkA7xv
         LGj9RKFaUoFkcosgIDX/f2F/uNaRLFx08hswuwewbgZqByTYDftrAQOXQj7HV0Pm4Zah
         epP3lhj3JgDH/WrcSOYKPjEbomqeV+AAA5FaNXLeGd7ylzC38Z+LSuXBNJarbZUTGdSW
         Rly9cIsD5GDQMjBzXtd3mhwkt0GUD+9pjS3FFDtlmYmJ2/7pMx9a2mx/qdF3CakEBJIK
         RZAKSqJv8eocw8JGVeK5x0EXwJCcrDvG6z1717raaH9IfblVcil9ZJG1xmQsscRAMliG
         QuNA==
X-Forwarded-Encrypted: i=1; AJvYcCW/7JCYgOsmnhjETPIJuCSMNBrhc1bDMej/C/7+VYK5gQgb1RrkQlkVGKirDmfIB5uTxSnPlet3K5booHDc2umT@lists.infradead.org
X-Gm-Message-State: AOJu0YzXTjmNJQLIiXWEjql5fH4XIWfEhUXAxawE9dvTfheygbz4R3CO
	b8cdP89H+yZ5y2XDMIojtxcyup8gIXDazwsD9zrlRlfPko1tdK9YSZFEEkhXGcPpD0nnVH6gh+0
	4grV0X6S6o/U/VTHooP/16tpe3OTLJ+Bg61V8y1SvdPhCfczVtlU=
X-Gm-Gg: ASbGnct9g6tC9Kx5jTq1hQrFgZ09+W0xOQ39c4pGC0N+WtFz4CA+MEDYPPFVfkHgVRe
	qigv/DbndhtwiSewFI5nWaDmjb05TQw==
X-Google-Smtp-Source: AGHT+IHdSV8FvjpPXzF7FPk1hnZCveFPl+7GVKODFFqqEft20XPKzT/tp/zHk5OEUZhTvdJwQSxDZSuS6skZEdlIf8c=
X-Received: by 2002:a05:6902:150d:b0:e39:3168:ec4 with SMTP id
 3f1490d57ef6-e39d39edb7bmr5375982276.4.1733321226883; Wed, 04 Dec 2024
 06:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20241204102904.1863796-1-arnd@kernel.org> <20241204102904.1863796-9-arnd@kernel.org>
In-Reply-To: <20241204102904.1863796-9-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Dec 2024 15:06:54 +0100
Message-ID: <CACRpkdaj4DqETs8ueH9mVuGWfu4LgvWNKy-fb+3NKaUaCZY=tQ@mail.gmail.com>
Subject: Re: [PATCH 08/15] ARM: update FPE_NWFPE help text
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_060708_141283_2DA6028C 
X-CRM114-Status: GOOD (  13.96  )
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

On Wed, Dec 4, 2024 at 11:30=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The help text is seriously outdated and predates the introduction of
> VFP floating point units that were available as early as some ARM926
> based systems.
>
> Change the help text to reflect that this is now a legacy feature
> and that it will go away along with OABI support in the future.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

On my affected silicon everything is custom compiled with
software floating point, so:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

