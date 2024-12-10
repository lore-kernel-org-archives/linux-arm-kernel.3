Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5C8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CfpFkLkZqxgcX4QF5aNknnKi2/XJy2DSDzk2hxLc1o=; b=cTlln4sOmWw2NN+6M0qUHKP4CC
	m+7JtySfg/RTWeUkJj2aJOVZVanUftKU8e0srr/dFkuDssXPUxPRz7mrJANlMDIMQiKSno+fpujWM
	E9omjfOzxSmZ98v9sbxB0krFG3R1bC6cqXsNo0L7TJtgxe7+3inV+MsquNLUyr0fLciTU/5/M6Tlm
	gFEoXHi2fGMXhXqZrFNO39gpa+S8VZgOgIuBV59bnKFwJPXEerC5C70KWAU7t03Q/lYkl2Fjs/UP3
	TwnX0X9zsPXIuk6Ai22U273MyMxfyHGIgUgl+8Pp0f2PcLA5JBkWIv/7yDbNk/jWdCPsQWr9XgVOH
	Q11OF3NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxFc-0000000B5ly-0ER9;
	Tue, 10 Dec 2024 10:13:56 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKx6f-0000000B4EW-3OqZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 10:04:43 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5187aa2c97dso531731e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 02:04:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733825078; x=1734429878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CfpFkLkZqxgcX4QF5aNknnKi2/XJy2DSDzk2hxLc1o=;
        b=erDiWzNfuz7eFIxSQSojvwCh+boJCYyFylsPReN6NUsvAnkDhaUj6qnVW7Lr0S9ruA
         6Eq2nftPYsp+zLTrzPLh6oQz4rsSE9qbotF0rOkgwqnBLl4fD+6djtyMeBIYXP/5KyRK
         q2SqMqyYzxH0gHbIwf6IfK5+EZrjxKf6lcK0TLGZR0uHGKKOOBPHLZ8uUYg1nDWdhwLM
         eJSQyfiqo6OTuL4Jy5I4FAd9AtncllVHqPuYCxPuquUOkNfD+Rqe3tJEkxn5pR2YwosC
         hmFWqL/D2pXp3oV59ra8AxSa2bmkQ2tGHQkfe1ReBai6xFyFPOPzrAeTxp18HP3cf5cP
         h9dA==
X-Forwarded-Encrypted: i=1; AJvYcCW+5w8DTyeiBwAkhqUDy+fjP43Rwjsvi3Mc5uHxaDX3ncc4IenZRRtY7G4cOjJStmMFi4+dlZrzE8jthoNEHii/@lists.infradead.org
X-Gm-Message-State: AOJu0YyXOH8+td0ypX9iscHtcpuf/ubd4zLumXnXy6M+ODQx0vK26ujB
	5ujVdcVoQnhkSns8MeMnog26XAy2b2TIfYYLWtQk9TINw+KQZPyXN8xYbJC1
X-Gm-Gg: ASbGncvG0fp2Ax5sNSMMvfqIj6QfXQGihbzCxTB3j9gfS+oZ07rgzgOp6DmCbe2XrAQ
	3N9cerZrivlJK9KtdR4UF1VwMjHQK2oAJDS7b8ezQBVOoGlT7jCFYmvGn03CyX6MQhonOHN+ejS
	JKT3nuevLZo2nlwlWHfK7KCnXwtvJysTYNtsZQ2Nw/xHB3Wd+6Vy17GU+9ZFesnFR0tFrT3tOOV
	zA3I6UZVpJCwp6ZzLu0MwrE9IqI61O13l+OZ1E7fbjvc+tUJYS80Tj1d15iDG8Ejq7L5wkhSyB3
	u5wo6i6vFiV1c0TH
X-Google-Smtp-Source: AGHT+IFiCnBy93qbWsE8+JMLzcXzWNdt6yqc12MbbR1OMSrGASeaMC8Llip4nQf1RL2m+3sTcF9s4g==
X-Received: by 2002:a05:6122:17a3:b0:517:4d53:4272 with SMTP id 71dfb90a1353d-5188853fff4mr3661723e0c.7.1733825077595;
        Tue, 10 Dec 2024 02:04:37 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51606dc43efsm722748e0c.32.2024.12.10.02.04.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 02:04:37 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85c4c9349b3so811795241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 02:04:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW39MDGXmP4toL/DFbnPuWI4q5I/dBBm4osLJNRUeodDsxjfiUWc3M7SxFvICkAEaODnlt+vq43AzZ3Ub/mB66X@lists.infradead.org
X-Received: by 2002:a05:6102:162c:b0:4af:f2e2:7b56 with SMTP id
 ada2fe7eead31-4b11623a2c7mr3989869137.25.1733825076815; Tue, 10 Dec 2024
 02:04:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1733156661.git.geert+renesas@glider.be> <87jzcg1d2f.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdWF7NcmKYzvF4Dfjh3S5MccbJrpSphK5BhxXNnhxgtmYQ@mail.gmail.com>
 <87y10tvhw1.wl-kuninori.morimoto.gx@renesas.com> <87y10pmjd6.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y10pmjd6.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 11:04:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVEdLvSRRUOwZR_jzpvjAM_zr++Bbxph21QzXLLsjY7mw@mail.gmail.com>
Message-ID: <CAMuHMdVEdLvSRRUOwZR_jzpvjAM_zr++Bbxph21QzXLLsjY7mw@mail.gmail.com>
Subject: Re: [PATCH 0/5] arm64: renesas: Add R8A779G3 White Hawk Single support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_020441_849029_C0001C05 
X-CRM114-Status: GOOD (  16.36  )
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

Hi Morimoto-san,

On Mon, Dec 9, 2024 at 8:00=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > -              - renesas,r8a779g2
> > > -              - renesas,r8a779g3
> > > +              - renesas,r8a779g2 # ES2.x
> > > +              - renesas,r8a779g3 # ES3.0
> > >
> > > but decided against doing so, as "ES3.0" would become stale as soon
> > > as Renesas releases "ES3.1". Alternatively, I could use "ES3.x"
> > > immediately.
>
> It seems using "ES3.x" is a good idea.

Thanks for checking, I'll add these comments while applying.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

