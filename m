Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C836CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmDSIyiMjLOS6FNqDMNTo7i77Y8KzxKQl8j6kjAwCZc=; b=NmjqKYignBXqrCHALQWlpg3tOe
	Z50c2Hy+5aZ5RqbwWrUXr3/75q/Robp9O/3aTXnhvqGitIt9crYXcvxnlWlt+uASpFmuvnozymHLt
	PlR2y1o0nHct5WrxCHR+sDt+Jh/CZdt3T0qfQbT20mCDivplN0bwUai3QT0/sZi5UxjOz53BfO02F
	n8V1kyaZxjHbE+kjFHycSLItn3aFQea7RWYCBPiT0+/zsQBFUubRP8XuSKe6gmaMp6lwKrMzqR4Pm
	bBgWqr9M984Q0TX27Y6dZZJq6PkrCuRcaj/J7dvNM34zGuQGreUrS2jHRDhwNTM5/KX6Fy4TXOYug
	tXELHJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgLI-0000000FfmD-0Wq4;
	Tue, 28 Oct 2025 09:50:16 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgLF-0000000FflK-2A3F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 09:50:15 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-586883eb9fbso7176334e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761645011; x=1762249811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmDSIyiMjLOS6FNqDMNTo7i77Y8KzxKQl8j6kjAwCZc=;
        b=wEbEjZbhXZL08GiK8P0KfdJU2Smi0OhPvdyAgFBscoRUZmLXOWSTMBSIlJeOPbeG2W
         uxlIwlODRXdvID8zBTlvhzvEkwfon6OWK0UBKdNsmQ0p/Ljsoq49myrvuQgeT4i3X1B9
         Y+ZFjC/GHnVO7uGG7B36Ar2lXSHmHmSfSvQz4AqkOvNVoZHJtSuP+3YK8OhoswUzR0Db
         LlgFMypHIlnnl7v2EmXRW94KoWzDjANCxx7fIuN4+Vp55EOhe0VQezXvWNa9bUDNtjeV
         63DtF1jn3q8nko1FdlPj7p7LWG9XGIVxP+LSpCtZZyiyNnXFbG/kRG2fXdD07jq99LyR
         rrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761645011; x=1762249811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmDSIyiMjLOS6FNqDMNTo7i77Y8KzxKQl8j6kjAwCZc=;
        b=qJHXB1/kfN0srPrerXNZvO/BQl/QIhd3ZRDasmA6K/P1I+fgMQmU/O62vhyMysMwD5
         8hex8QA2/ZR8e023cfv3xrbtPPPNn/NMq7CY2EJrAr5tOl/KFz07nahjg04gUM5hKYYD
         e9SeAWuEp+FZy3ADVJ4ohgIpqItyc9OJk/52/U1AQlnhPxOOz1AYYpwZrUHv4gGmkW3s
         ouQ78GoOynfpwAHyEdas1VpgFxBAEircGwcEEnpAT8R/+evx06gEtWgrbU4mJcLOdu/A
         N7BC8QApohBZ82kZMXDoV3NKFm/9lRgb2hYBrNhAc+rhdPCtqNdE9acbCUDuwEqY+wnp
         i5Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXogEbGfmLsxGaRhrk4/8+VVeKgWgKyAc/ERQ8R76yJSWKS5hVFeNFqWcuX/mQ3XbEBB4/v61nkAOD3aV9viXIc@lists.infradead.org
X-Gm-Message-State: AOJu0YzyMY1Pdi0EHzAFfLu2pFCCBhYmfO4ufSryHxUKaTse9BKySfTd
	nvMoohTe6TJeky2kizl9IRWEdDyv6NHDWphSpleW4ruQOa/CjV0XHW138gCVqw3pqjwNrXwU4Dm
	IgzNmCq2Ti2AgkrAsFH1C2gfil5WDBCan+NmS1MB3pw==
X-Gm-Gg: ASbGncvy3JnEyGORMYX1cGdLj8NoBWpNwYevP73Ph1n/g4VIojwwSyCLj81RrGfsGI8
	QtqoruNrFSDPnsvlnEeLqtuycadnO+dMiX3xb4K3m9kHiyLWyguaiW3Bd0nboZAKyz1riUtQNhQ
	dxRvuw+D3vsTnYEJgc2eGtghqY5U3c2aEhZMfwsQlw9+6ppj53e7WKQZjpTOh62S3Afv45i9Kcb
	pJ5J+INwFPl7Gi25HsOUmg7yUkHMvxURnnzjwKqLmRjWyatFvY5//Utjw0MWyDxWxDOTps=
X-Google-Smtp-Source: AGHT+IHu10ZcVMp1t6exa1PSxkHFxphXG1r4t9C5bsmjcMdzTg/t9I8b6zTS7ONgJ3VxrVunoD4N4GDJPwxaS7n75Xw=
X-Received: by 2002:a05:6512:3f15:b0:592:f521:2334 with SMTP id
 2adb3069b0e04-5930e993ec9mr1158884e87.8.1761645011316; Tue, 28 Oct 2025
 02:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20251022165509.3917655-2-robh@kernel.org> <CACRpkdYioyktQ5is6TJnkgX=MHk2-zf-XO-gx6sKcST2GABNiA@mail.gmail.com>
 <CAL_JsqJh=ccCR_TR2sgMJJ9ChkBC4zx0d0s_imGjHNt0Mbp=Bg@mail.gmail.com>
In-Reply-To: <CAL_JsqJh=ccCR_TR2sgMJJ9ChkBC4zx0d0s_imGjHNt0Mbp=Bg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Oct 2025 10:49:59 +0100
X-Gm-Features: AWmQ_bk9HCEe5H9YQN8PNyspfsZbmH034UWjFM55zKwIU8N8qdRalyjCgv2QCTw
Message-ID: <CACRpkdY0+0UTkpXurB3E1Skce+Kcbti9-Z_2-d-f4yM-HuK_Dw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: Convert Marvell CP110 System
 Controller to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_025013_562514_967F0B5C 
X-CRM114-Status: GOOD (  15.95  )
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

On Tue, Oct 28, 2025 at 12:26=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
> On Mon, Oct 27, 2025 at 4:58=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Wed, Oct 22, 2025 at 6:56=E2=80=AFPM Rob Herring (Arm) <robh@kernel.=
org> wrote:
> >
> > > Convert the Marvell CP110 System Controller binding to DT schema
> > > format.
> > >
> > > There's not any specific compatible for the whole block which is a
> > > separate problem, so just the child nodes are documented. Only the
> > > pinctrl and clock child nodes need to be converted as the GPIO node
> > > already has a schema.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >
> > Patch applied!
>
> I already applied as it is clock and pinctrl.

Yeah I saw, I dropped it now!

Yours,
Linus Walleij

