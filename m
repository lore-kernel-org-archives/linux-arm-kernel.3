Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B47FCD0CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97eoOi05XfqfUDZA6loiU0vnpMAfSn6Hbq1joU+epks=; b=TRXYx6194bPBG6bz8KZI5jA1MW
	kQdDpjVab97Jn2iwVhQndKBwJK8dYOufxq0N/rw3+Bq88pzhwaW05UnC0KR0MSMO+VPzuy/cK9y9P
	LJ2aZ2LsLkeNe0GsCN181+wmBWVEC7kF0KEEqz6eRg+hRo5tVgvzvYVLzRIfftmqFkbPr0/xG0nZQ
	gc68krefDCBIg6RHgXcOFg49HAikh/cwJac0ocVIHIf05/P7noc8AGgJJZ/P5BfPzMo7fd46eY0vl
	YXttcBTzzDjPoh+oZy25TB0Jzdb4gUWaZkHYxwpalH5umFPcgynrZZnyjZ4HkMkfFN6HONty6YboD
	Rf2qduMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mA4-000000082Xu-3GMM;
	Wed, 18 Mar 2026 08:21:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mA3-000000082Xn-25Op
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 08:21:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 975956091C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471D4C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773822110;
	bh=97eoOi05XfqfUDZA6loiU0vnpMAfSn6Hbq1joU+epks=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RnPCsHzcYkcJSGxnba9XuP5YLObs3kFXGSanIUeDsX+qnH8JEaSH6cvjQyAc8aDrU
	 Ae0q2rGQH28nZy1/2Sxln6n4cSYezg864Jb4kTPUFq/raqO5ygGxTfi3wPc/iCO+dh
	 UF9ZrSJxYWJ2UTj9cKkSPDDFCOa/4NH0jrkeN9e9mYryXzz4AOnEq7O183Bm3sIoa2
	 qpSftObxpe2faBWEKYGcPnXrebicLFk045zl9H2sV4aVYkgycNsS3o8m9UFnhjrCy9
	 EILcYY5v+prynuhfVPP6g0cm2dHwnaOwSulFJNeYgHEXMlcdSj16lTdm84s0nFzCYi
	 UObBZofK14uyw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a27c021b58so146684e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 01:21:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMK4Ru3tkvbyAwBufZzs+KR8B/WUxyOYLWj94uh2fcxerDXPHmApT0IOZKLmla+a850nA3p5lt364MC4CtKFUp@lists.infradead.org
X-Gm-Message-State: AOJu0YzYsEjqhYAsyjay79dxI0Cl0FxogHSLn7d2EqqF4vNYqpguXCnE
	s3YRMN94pqqxfGV3xpepECrPDsAINjhrpwiBbm+8w+tXdRvWhW8uAFC+EphY0Gvm7n1HipiNgrQ
	krEPG/Uor9Zq3RSyX41RjLKShajJDKWQiuTrTOm3rPg==
X-Received: by 2002:ac2:428d:0:b0:5a2:78fa:2700 with SMTP id
 2adb3069b0e04-5a2796a2d14mr689838e87.23.1773822108866; Wed, 18 Mar 2026
 01:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260226143615.65788-1-bartosz.golaszewski@oss.qualcomm.com>
 <84da053d-97d5-4d07-8e76-b162a5b23d2a@kernel.org> <CAMRc=MehMLoBL573cWjQNN2eCiTCyqCv1xwVKqfkZ5isBhBUaA@mail.gmail.com>
 <10bb25d3-2f46-4b62-affb-31257d51e24f@app.fastmail.com> <CAMRc=MfupCCr8J+qnJACVeri4nZZCnULWaRgSvi4LWs4J3-5vw@mail.gmail.com>
 <9132501f-76e9-46c0-839d-bde7246c3883@kernel.org> <244fdbad-0d9f-42bc-a005-5f5ef34d067d@app.fastmail.com>
 <20260227-wolverine-slogan-7af0661f6e44@spud> <c9df99ef-9bd6-43a0-9f22-721bd6bfc90c@kernel.org>
 <20260227111748.ddqdf4avpvfzu4cm@DEN-DL-M70577> <CAMRc=MdrrzoL3r-Br2pvR=TXxXVdS_ouf1ikNysd=GuhR1V84g@mail.gmail.com>
 <d9f9884e-b4f4-4f38-9732-66ff90408b4d@kernel.org>
In-Reply-To: <d9f9884e-b4f4-4f38-9732-66ff90408b4d@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 18 Mar 2026 09:21:36 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdsnPLJdZfkiHGh6F1X5AS5eL9TrmjzcrhO-d-=f=sX2Q@mail.gmail.com>
X-Gm-Features: AaiRm516b7kOIHDyg8tVWG6sY6m_JWDG30xasrUUjkqX-QEfUYN_aTeRhsWOiNY
Message-ID: <CAMRc=MdsnPLJdZfkiHGh6F1X5AS5eL9TrmjzcrhO-d-=f=sX2Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig: provide a top-level switch for Microchip platforms
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Daniel Machon <daniel.machon@microchip.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	robert.marko@sartura.hr, Steen.Hegelund@microchip.com
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

On Wed, Mar 11, 2026 at 9:58=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/03/2026 09:32, Bartosz Golaszewski wrote:
> >>>>
> >>>> Here's the previous discussion when this was added not too long ago:
> >>>> https://lore.kernel.org/all/20250811122053.4bfyoefln7wpz2a4@DEN-DL-M=
70577/
> >>>>
> >>>> Daniel is probably the one that "needs" to answer this, I think the
> >>>> lan969x is added recently enough for this to not be particularly
> >>>> disruptive.
> >>>
> >>> I don't get arguments there. The policy is one ARCH per vendor, so wh=
y
> >>> exactly upstream would like to "having more granular control with
> >>> separate"? That's downstream or vendor wishlist, not upstream.
> >>>
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>
> >> The out-of-tree defconfig impact is minimal for us. As Conor mentioned=
, lan969x
> >> was added fairly recently, so the number of affected users should be s=
mall.
> >>
> >> /Daniel
> >
> > So can this be picked up directly into ARM-SoC please?
>
> This should go rather via Microchip ARM64 tree.
>

Hey Microchip maintainers, can you please pick it up for v7.1?

Bartosz

