Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20297CF2560
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 23:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CkKy4I7Nd+j6TrDrYR1KHm4hZaUOzQggilxM6L2z5U=; b=Z0N6XW+fEOn26LZ634SUL/oo4i
	sQ1zl5dlk6im9xR4gJ8HHuLuZIralR7JPX22E5e8uMzLUs11KDajhnSCRVx4zDgJsKj3sIHua7iQb
	jw8U0mnMWytTxsUZ4P6N50UiJ9cB2FR0LAo4Whpw8cI94g/OaFBVDoguALcFwm86wYCVoF3q8XPxz
	enrWk5wWS0Fwcu2+eFM4uOKJFJeMNuQqlb1JWHNZ3jMa40oXGrWKatFyinZZ4PzdvP1pCP+3+wOM9
	HZYhZmecTxQoifqv886AozHU2RLgIfLbeBddYjNlElcWQtooa1v9Ot3T/UKGG1sL3GK25iY3gPbZw
	qn+YUQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUjD-00000001D9Q-34BK;
	Tue, 18 Nov 2025 23:03:15 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUjA-00000001D8h-3kIT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 23:03:14 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-640d0895d7cso500976d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 15:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763506992; x=1764111792; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CkKy4I7Nd+j6TrDrYR1KHm4hZaUOzQggilxM6L2z5U=;
        b=d0zr14SNKPEKAMkgKxP9FtU3DsE9K2e/q3ztcnVdQH0S5NGvt9vFmHB2QUBG3qQ50X
         qYfvqojn2IYZ5xnOEAzgSCuYeYBg8xNS6byrCIJRdgN8Qg50KEV5F2uukVfv+/x91KZo
         wefaK10udGGFbTd/nUffHgaLLCI1mOUHJfxLuozZE9ERg0Hp78h0qQj+eXYTivuoA/aA
         RF8sL5VY8BSuIZxTkQUPZ2nTmH6j6IAckVwE9T0rIweP8RUaKKLkMbvVzvggeXwV3l/c
         wD3uhw2IH6G3L+FLTNJgKvDrUKBdLDYRpPmrZsb3jLjpqfB0fFNOw/ZrzAnOmlb+YHIC
         BlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763506992; x=1764111792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CkKy4I7Nd+j6TrDrYR1KHm4hZaUOzQggilxM6L2z5U=;
        b=Yo/rbGnPsam1KQpPOQptoORSe9IOEAoVjPUI4bXZ9zsgkr31ok01HY0/o5xlPIEsU9
         1Jq7qmDP/a4aHIIo+8NcFMzUWG/BRUKqhQzRxxz+2Wl7gSp1Z7xpgIa0MhS3L4V4Sn0a
         IylAg1S8ri2jT0WzlIfjfRGQu8zyn4vSIAbZ13lPE23vnhijGBeG3/icCYjXFWEXhJIJ
         TLr9KoQrLXoJ/zD5jLzB7RpCoRRhG+vS1drvYFrq6qs0az0VQ2P1/cgxZG70DuNHsVtI
         3l0TEH6VIDw2ud5t2nzVQzKe/3U5XipANet40htk0ZzrWGkpLOFAAgX7vo7Jbm7RdwCE
         BXyA==
X-Forwarded-Encrypted: i=1; AJvYcCVpdYSntOKaOqgpfrhjbr0XQO91rT1v9Ef79BR7Bb0sG5QdXFd9O+fTWpMAw+5Q47oSKc+PXh9WbXXaHR1FqJLS@lists.infradead.org
X-Gm-Message-State: AOJu0YwFxNEBQtNJ5c19DL1rqM226tidgojnEqTHORdMdGE0AIA9NB5d
	oM7K08Pdj7S+1XUEarYAnNE9OPlQwfCIxLDjMlNIu+efdbnaD/qXsN+a3wMONu/bKlzoqEBd1yn
	KZ53uNewUkCYri6JD3wf0EiM338OmXLdlbrt3A9Cb0A==
X-Gm-Gg: ASbGncueAVoztW94o2iUSFBKNAv+6sTNzMjl5uuRvwKf6s2sdPJ7otVHgHwpmfmZpi5
	U4iUnV//oPhuFiqo/EirzOkU5HrB7yy7J8KtdhqW+u+9oG2nFzj5r5SjXbplNMgEQK5mwRED96Z
	qZn8E9UjA6yIHr8+NErAfrSOLHgV/CTSIWkdreldfPtlr8gmqa5Mx3/n9MR76GdbjHi3zxpWune
	EawvmNDAH58fT9UAgSNEiOSh6t9qKoMMrCJ2MM95hdqBmUINTXHWFMNWUl35lrQtvznvTk=
X-Google-Smtp-Source: AGHT+IEWG/T70U51QkboX+BFArhMW1GqtsSC5NyxbuNNMatQpKCwXgLG1q4spEcInbcCfufWgaMLYLHwYyBGvQc+TgU=
X-Received: by 2002:a05:690e:4106:b0:63f:b985:66b5 with SMTP id
 956f58d0204a3-642ed60ce63mr266853d50.6.1763506991657; Tue, 18 Nov 2025
 15:03:11 -0800 (PST)
MIME-Version: 1.0
References: <20251115100000.177791-1-amadeus@jmu.edu.cn>
In-Reply-To: <20251115100000.177791-1-amadeus@jmu.edu.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 00:02:56 +0100
X-Gm-Features: AWmQ_bnUW-BUpl8V9jWIRwhTERbiqNe1byNfSmfq0uZuXktxGoeLDqptYWTthh4
Message-ID: <CACRpkdbMPGL=s7gmQsRTNpzdBanWHRX857bcg0Jiu0Zfp=hSyg@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: airoha: fix pinctrl function mismatch issue
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	angelogioacchino.delregno@collabora.com, 
	Christian Marangi <ansuelsmth@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_150312_937193_BB57EA74 
X-CRM114-Status: GOOD (  10.77  )
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

On Sat, Nov 15, 2025 at 11:00=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> wr=
ote:

> The blamed commit made the following changes:
>
> -#define PINCTRL_FUNC_DESC(id)...
> -               .desc =3D PINCTRL_PINFUNCTION(#id, ...
> +#define PINCTRL_FUNC_DESC(id, table)...
> +               .desc =3D PINCTRL_PINFUNCTION(#id, ...
>
> -       PINCTRL_FUNC_DESC(pon)...
> +       PINCTRL_FUNC_DESC("pon", pon)...
>
> It's clear that the id of funcs doesn't match the definition.
> Remove redundant #string from the definition to fix this issue:
> pinctrl-airoha ...: invalid function mdio in map table
>
> Fixes: 4043b0c45f85 ("pinctrl: airoha: generalize pins/group/function/con=
fs handling")
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Patch applied!

Yours,
Linus Walleij

