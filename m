Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9164EC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 22:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+0KGjJEeMGYRbcevFKEOSgGE0ujrUpdmrmtWjYGodk=; b=pgtupDaE4HKzOd1hZlGevrCvBa
	IB3G/8JWGYCSPYJ9uBqU7K2KrLGiA2yiMmHt7kHvp66BZfrWfud+wrTbrIcFSrO4clDU3mu+DyG5z
	Bsjv2+PwpBb4rGLueDuSQWWpW6zr9D/L/vM9qa5eZz6JThr5tK3pmZlLBph5rgwPWps3K9mfhL1u+
	Gxuj8Om77oNf/rfOSstdJe0lK7WfSL4Nb1iMLcN6D9kp4jBptYvH32lZpZg8jLsIJTGyd30qLyuut
	HQo6PEl6rWza+C7j0TkqVEFYnXDQ16ZbKRieHeINrjkdpUdPqtSG1RXsYwvnHVqna2kT3PUZwbwzo
	WCTlHOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVke-0000000EJb3-18zb;
	Tue, 20 May 2025 22:48:00 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVf5-0000000EIub-21He
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 22:42:16 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-32805a565e6so60440481fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747780933; x=1748385733; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+0KGjJEeMGYRbcevFKEOSgGE0ujrUpdmrmtWjYGodk=;
        b=spfhbEzVNb0HsPalYUfYZkfXWLKqe1694WvJn3goNYwRgFjmSqzTiyXOnK0Is64Aqd
         6Qh4TCNEVTr6rTjovuOygexsAHnZ9pKZSETi52rfOEIoDVSvJno98opTQekIsE5zRDPe
         hLea9HVi5SWfSi0fxwNpIlSUDhKXnM1gQcCMwYxb0TPaxTLlumzmT+OreejlDama5N+l
         uavUqUwYX94US5CZ4WpQwUBvEs/ukayTr4BfCDDK0iEAWnlYmUj5dp5Z1ASKQXpWjkmr
         AwYvE3jLn3leUdSuLgq0e4IoB5hezn2jntscq3OH+L0HidfhXaVWPoa3N6wjeHbG2fKf
         U4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747780933; x=1748385733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+0KGjJEeMGYRbcevFKEOSgGE0ujrUpdmrmtWjYGodk=;
        b=f4gmFZ6rL9MJyHxQK48VLp8y8JRS4+mMCwAnkbzVi/hXDp6/sxtJfTmBB5m+S6A/gD
         dm/sPm8HIW3hw2Bq1eiCBmNlY02repdNpiedZyFhboyk2pQyx+FFMgRc18b4kcJbyVBJ
         dlfy0As7lMHZa1qxX7y+3SCMOc9bXVFpTGCK5w8RgrfW2vQfSWO4ZoliRI7WqbOj4wfI
         +cJIFFISQVkrZ9y5pFyIlaExqurrYlYch+Zf1csGzocso/8OjEk9fJvUo/t8cUl96fiH
         UXNEoe9C2aSDk3j7jZ0nk79l/dZw2Ao/VS+leSqsBbjVduxNJ94+XPAy7lnjexZNS1Wg
         p12g==
X-Forwarded-Encrypted: i=1; AJvYcCVXNHYYdTpkIT03UsmFpzlrKUTIrdH8WodVv3XXPRtD4lBNeb1aOlOZSlw9bv4Ia0z80ldH7LcfitVhDoduUJL4@lists.infradead.org
X-Gm-Message-State: AOJu0YyIqyqxlMz4bTsdBXK9YiheQW83U4vu5a0dJ7hT4NG5w8u3mAM3
	t/43jQJQsUOn8zSqTTFIhUUtYedxrfCc1gSwklPVy3s2SqjWddIQcyWBjLAaR1asnB4APwwV+t5
	j4TgT8RoEuOh+PY0AU0S0TakV2O+CS1RMBtQWO3pn7w==
X-Gm-Gg: ASbGncv8pZjnF2gk7XniHszn3k+QcWcygAFw5IEGLkbjgrD3ARksBFmxHQhrT7DLKSN
	Z6keq4rqHO/v1vG3hraFUAtoJT0AzCOl6svB6mCsHPw1fnGU7GwbTfObNKRaxOnMZPl6YpawUSW
	hpR18lbybxZtHWL0oFAw3SyqLlnPFTq4OY
X-Google-Smtp-Source: AGHT+IHsUCF87aJBJgdi8mRkNqubc6I4D9fZMCMetg4kSiJqDTe01fpVuT5acGVm0IsXULfYXw603PwqUKvGmPST+r8=
X-Received: by 2002:a05:651c:20d5:b0:328:d50:d7cc with SMTP id
 38308e7fff4ca-3280d50d846mr35144561fa.20.1747780933368; Tue, 20 May 2025
 15:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-genio-350-eint-null-ptr-deref-fix-v2-1-6a3ca966a7ba@collabora.com>
In-Reply-To: <20250520-genio-350-eint-null-ptr-deref-fix-v2-1-6a3ca966a7ba@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:42:01 +0200
X-Gm-Features: AX0GCFsxq2qbIdoCh-TtdqObwj9pvVqees80rU3HdDEUCMiHs8dNAK0ZulTRIX8
Message-ID: <CACRpkdYor2+rCZGsZLw=_Wna=0KnyXBaVtx-VahmN6Ky-zZ-Dg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: eint: Fix invalid pointer
 dereference for v1 platforms
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hao Chang <ot_chhao.chang@mediatek.com>, Qingliang Li <qingliang.li@mediatek.com>, 
	kernel@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_154215_533209_80011AE3 
X-CRM114-Status: GOOD (  17.60  )
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

On Tue, May 20, 2025 at 11:16=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:

> Commit 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple
> addresses") introduced an access to the 'soc' field of struct
> mtk_pinctrl in mtk_eint_do_init() and for that an include of
> pinctrl-mtk-common-v2.h.
>
> However, pinctrl drivers relying on the v1 common driver include
> pinctrl-mtk-common.h instead, which provides another definition of
> struct mtk_pinctrl that does not contain an 'soc' field.
>
> Since mtk_eint_do_init() can be called both by v1 and v2 drivers, it
> will now try to dereference an invalid pointer when called on v1
> platforms. This has been observed on Genio 350 EVK (MT8365), which
> crashes very early in boot (the kernel trace can only be seen with
> earlycon).
>
> In order to fix this, since 'struct mtk_pinctrl' was only needed to get
> a 'struct mtk_eint_pin', make 'struct mtk_eint_pin' a parameter
> of mtk_eint_do_init() so that callers need to supply it, removing
> mtk_eint_do_init()'s dependency on any particular 'struct mtk_pinctrl'.
>
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@colla=
bora.com>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Patch applied for v6.16.

If it is needed for v6.15- then I think at this point it will need to
be backported to stable. It also does not apply cleanly on Torvald's
tree, just on my devel branch.

Yours,
Linus Walleij

