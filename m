Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EB5C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 21:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocL48N0azq4XQo6lTJ0uGSQUcUQGguK7kbKdujwlOjs=; b=1DuddllHT3PgTyBE3A34Rt7Ck1
	G6shpyDROdWMxpu2zx3n3QU/wAqJker2tljGy08AnOcbM9ILSWkHMjBthVyWvOWYHD/PiNh/ok3c0
	zsj2eihopaTnfhB+AgLnHL8j5ZMDQSg0d2rg6NwMGEYyc+VsoapNU860TlPUNO6+wcHXojfR7P4A2
	rOJ94lVZVyfltPNYKzXNmQ++Bd7x6YB6Mp8/JySyrTnDPz5qL/iK8x/4fHP5nWW2h4WvAKuvHIBNK
	5v22SxBKUWbTJ5EdL+N5gXc/Rf4GRIJ8M/ARAVByo4uSzsBvR1FtKA8iOo8lpF40bEmJePRBbuGto
	/nlCdEdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7Kf-0000000Fygn-2XCq;
	Wed, 15 Jul 2026 21:39:57 +0000
Received: from mail-ej2-x01.google.com ([2a00:1450:4864:34::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7Kd-0000000FyfF-1AWy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 21:39:56 +0000
Received: by mail-ej2-x01.google.com with SMTP id a640c23a62f3a-c00c21c58b2so91720466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 14:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784151591; cv=none;
        d=google.com; s=arc-20260327;
        b=m0HWUpqQ+E0BoSYfCrUEK3n4syZkeZ5hvLXODeefwy8NWubO5DPTcyGqm9XXm0GJWU
         y4nbCu2tfiBasbNGpTdPFrSJIyJy5brFalPMswBZtDbZ/tm09EhkEiP9Zqx57JCB7H8S
         kxXOv3bykZfNZUwFfkVR3jFJGeffuA+GrUHLipPOJNi33Yhd904pU0v6qQtcgRiwaAzg
         agcHw/DHuzx+2/ykreETvZqSPQEucvNHM1bkdc96/zFFPfci4ks7hJp9QbidFDmIY4YH
         Ng3DVwI8IYc9qlAo2bNrVc+NsVqAACPU/9o7SidTUhfDINwk1UXs/C20O31d11B6tJ4r
         LV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ocL48N0azq4XQo6lTJ0uGSQUcUQGguK7kbKdujwlOjs=;
        fh=eEJyqxOtx9fVu/FsaOewfjNWda8AnBaxBCfG2r3qpyM=;
        b=TQxq2i/wDs+RM6uIEu2y0xY587asIof/At1Nq/Pb+VNOCD22omASFi9972ioya7ZlW
         NIrRZAaWT7wyY1wZr8a6eHeGlGzO1acmvxtkcfOqiZrErezyW3PpgIwJr25VKamYxIji
         qOweoMrJfGCvsYbzc8zlu1i6ZTO353gMw18Xicz/mAAMgLaCmouo8rjjV4SAaw+aYQGV
         r2o5s5Vx58WbL1jtElsYeB06H8l9v3Wggs2oWl8S2SDNUBL//uV4hy1D+58ZaJmrJ3Re
         02SsDn6nNV4l7pyDoNE3K63TzH7NDHZrMK5dG6axRmrkqnyt9VLKQxS8L3I2SZedLxeO
         u9RQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784151591; x=1784756391; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ocL48N0azq4XQo6lTJ0uGSQUcUQGguK7kbKdujwlOjs=;
        b=Qbb2wcu0wpSDe3PMbhBCdqjSwEm1uPQyojZ1zwN1nDDjCrIHXMVQlsnu+94FAVhyyN
         eJoHJQ05npG/KZmLkPANJk5AuN5A59uYCdxPD8JXw2WckpmcEp86dw0EPk9eg8kKCLPH
         DgYr3IuNXMJviWYd8njoEjg1Iak6GWfnI4nNZfaHowaCkYBa0xT5LJYcVnIsNWZJZqKw
         tyXraQwvXYJurvAN4qcfdCDDWbJgugtar8Jj26WI1O8eTGh5L6gaLMlzK09e77IZZEc8
         UVrw5CMC5XhAeIe178xQXeTVlidLOnwTNZCOMvFwWssdpGVutIpU2ThUSVng8eL8dIm5
         aw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151591; x=1784756391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ocL48N0azq4XQo6lTJ0uGSQUcUQGguK7kbKdujwlOjs=;
        b=Rs6JQz6ShjF1MSDLG+6iouziBxtmRcyotyt3PBTKCGW86x6LNYJEIock93oCG27+qP
         o/AvbkieaW4HhKT63efNAUKCnmq0cgMX6jhvTL7aZ891k91zolKusaK2XaT2OkQQnmp4
         xW4EiuMBODPmJJ41RU2qEkAbZh0nK/c/PytUN1Qp+dSh9ZtIdSwjRrzSwgmElKxIwcTl
         EyDI5EXe4MyGQyOJ/1G0UfVs8LzINmsyyg2YZgBLnrC0yoGeyzOWnQ1kGr/+TF8bbkCq
         imi9ceQ/0L8JI0DESaYym5xPKgm4Lz+anJ8nXOfcNmoKH6vnOpX9MGoI7WFvHdg+yWTK
         8ieQ==
X-Forwarded-Encrypted: i=1; AHgh+RohNq2k8uVKpYWXyeBL0VR9YkBVHt/gPkQFUZpeimgoiqtH7KcQ9hR7uUz1mvlv8Gssuu9Gm7hUTDHYhvLmf0fh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2pFgzubTempKMzsVWF8y2qlJ4En6b1vWebBwEWH0+go8H4PCZ
	PL5vMELVXDI+pSkEHYX9deYElZA50VAT/usbkE9NSIWgV7YTuY+2fLXsX2LVY48SQzHYg714LHj
	cdZPHCf2Nc1XnHF78i0i7J1VfFX3lqWk=
X-Gm-Gg: AfdE7cm16dfp0LsvuHVi71YPvgzbEanirISXxPUhNzzNo9lhImwZk3tV3f4L7rvEawd
	YxoWT4iJF14SCBZqMDwgZu5ysD7UM5HDpTA7qoMi1rHLHy5IIRiE111LKbTJDsQelYhDMBwlUwY
	C4hfPHo/BxHjeL+lMtvY+WdDz5dyBcE4hHeVVBY/jJ4Y1ArK4fm73KIVeEEsxRUiONBVFGSsYG5
	06ajzSrqng/25AbP2JQmKnSEIIkJChoDtbAZ3X6571LS7Tj6eJYUHRc3V2OyhyG
X-Received: by 2002:a17:907:c317:b0:c12:68f5:e083 with SMTP id
 a640c23a62f3a-c16794fbce8mr296353766b.64.1784151591115; Wed, 15 Jul 2026
 14:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-2-coiaprant@gmail.com>
 <dc21b2fc-ae11-4fde-a5b9-09e2c6bee5c9@bootlin.com> <CALj3r0gWyfHHp0S4=71M1-TjgHKcgGax4Lr0DzPi37Q69-iCwA@mail.gmail.com>
 <685d91a3-be6f-42c6-9e23-07629e21bcee@lunn.ch>
In-Reply-To: <685d91a3-be6f-42c6-9e23-07629e21bcee@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 05:39:39 +0800
X-Gm-Features: AUfX_myJ66lYjr_Qz6cecGRXkAPSo59po4VpMAdHmLlPvDjxBLGd-D-lw51lYoE
Message-ID: <CALj3r0hrKt7T6_aZJ_cOJ=akPgShsau6-whcrrWekJE6H-z05w@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] net: stmmac: move XPCS lifetime management to
 platform drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	robh@kernel.org, krzk+dt@kernel.org, heiko@sntech.de, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	Christian Marangi <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_143955_514932_8D255B18 
X-CRM114-Status: GOOD (  13.72  )
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

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B47=E6=9C=8816=E6=97=A5=E5=
=91=A8=E5=9B=9B 03:57=E5=86=99=E9=81=93=EF=BC=9A
>
> > I actually spent all night debugging call traces caused by the current
> > stmmac PCS lifetime management, and it was not a pleasant experience.
> > The code feels like accumulated technical debt that should be cleaned
> > up.
>
> Russell King will strongly agree with you, if he was around. The
> phylink integration into stmmac causes a lot of pain, and he wanted to
> rip it all out and start again. But doing that without breaking stuff
> is going to be interesting.
>
> If you feel up to it, have a go. But take a good look around first,
> make sure you understand the different variant, internal vs external
> PCS.
>
>         Andrew

Hi Andrew,

Thanks for sharing this. It's reassuring to know that I'm not alone in
finding this code painful.

I fully agree that ripping it out and starting over would be a huge
undertaking, and I'm definitely not confident enough to take that on
right now - especially given the risk of breaking existing platforms.
My current focus is on getting this RK3568 SGMII support into a
mergeable state, rather than attempting a full redesign of the
stmmac PCS layer.

That said, I'll keep this in mind. Once my current series lands and I
have a better understanding of the different PCS variants, maybe I'll
be in a better position to contribute to that long-term effort.

For now, I'll stick to the incremental fix that this series provides.

Thanks,
Coia

