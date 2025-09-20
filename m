Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038C3CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xe0lcClCPEcf8hl+EDrEGGNTrCD25PEwuESOT223Ua8=; b=GPbFfss8o3p5rUenxrFmi9NJey
	Xp2QvALe8Ybxm3SYNz4hkfXfkv9NqAvlTgAkN0REr1W9udBW7pa7+fTxkxuyxnqZ3Vw/FAl72ixq5
	SYvbBjndCWy7V4nkJoWjq1QVExmHtawVZXRsGvoanP9/y3We426WQnvl6HR1Gj6ZkltoQ5aCV+iUs
	glXluZerS5Ofo2wsvabjnwECwntYqmqyQ0d/0EC1T+bb0fAXlZYvk1aoQnKagTWNGxbJ/FTpW7XTC
	T+wQ8qlsO4K6WcOFb/4ve+j2bLAwghf2wvUkFhxhvJRzZHV+ByCu9vLw96Amq6jJPOCEfcwMam+zG
	tKwX2IAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzuVv-00000005AIW-24dR;
	Sat, 20 Sep 2025 10:08:19 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzuVs-00000005AHn-3Uq6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 10:08:18 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-afcb78ead12so427170066b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 03:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758362894; x=1758967694; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xe0lcClCPEcf8hl+EDrEGGNTrCD25PEwuESOT223Ua8=;
        b=Q7NdWT9fVoJprJDeut7Wu3+qMRH5k7HEmI+gnoekVUly4Ym6AVuVANQGnuRgcMBaoe
         7gWkqkTg5MI98Z0mSvpD9xT/8oBq3BITfAbdRKI5l2JnUjghJ2ktymZO4h8HHqMEEttl
         pAsVlFByAQh9OxzWUpapW1PSNjQY0p3pgrgO6p5GEVcbXrQiMPVW+oIpM20OELMm7SVv
         3tC2cUfaenbEk8A6gnwP5wvqf8+jnlQzaPxHtk7Wos9iNKLWXlnSEadTA30pJ7TADCyq
         JRURSlJRh4HhtQfhWj0R2Sdg/7ox9x84lLZ+y7Y2HGdoWZO9K/FhCjqlYwGP39gvWf/z
         imCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758362894; x=1758967694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xe0lcClCPEcf8hl+EDrEGGNTrCD25PEwuESOT223Ua8=;
        b=crPnYz6pH3KDB6D5OUpDe3QOYR4ryXXGYj88zBt331/64Be7ywPmUueva+ppzuNUbN
         /97VCMRR3GOsmmf9ha4558HlwbVWEj1b2XPgeIXVP0VCPT/fy+qZd4IUglo7f3g7oUSj
         M4s4c7bTugJ4P3gjBePRoN/TZVuD/WAn/6Df0WyqMF4I09EJ2OfHZ3sqpq6L1PjYgsbT
         n/vJDzeVDES3ByYamOdrrKFzURV01QeSonyULxdHwP2+iP79CVLS8Nfms342uqD4xWQ5
         XYvT+/uuK3rdxH3WM7Fa0L5QAHDIUSeHLqH5A5AKIr0GXQ0JtB6cPs4xtg9OesKOGVup
         DkKw==
X-Forwarded-Encrypted: i=1; AJvYcCWG8Dkk2UJpVOnR9K5HmaKye/w/X0bqXto8GvEesSuq9jAw3KuQMjRcse5yGiKn28iiDzzdDYCqnBxDNyj0tf5Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzbonUOjjHmKbN0TDhD2gCpxr0xZzBZc2P0237RnnKeZOZ3wYu9
	7JiIdGAksl88aJ4Ee/Iauxi9OfOqA7r0v7QIPP//L4yX5QNv0OzyupA0ReE89PNnzoKHt60srlj
	w/wIKo6zS5bo8mWDVUxccRv+4uKFJ5mo=
X-Gm-Gg: ASbGncu9L6rXgDAhtqJskdEYQTT/ubmOgd/Q2zZjsT3n+RIjHxNR+WiKUKrxb5z5rJB
	2ngFVO2JOza9aIPIyAE/VSXIaMolkBMwlaEJKl4kUPBUkgO3tXEedF4EcPRGK3Pi5Q+Z4bIbl3o
	Li1I0LC+2ZuylYx5HfvxXGEv4eihmeioUKMx9Dg/H91ixaaTQHuUh1v1HJoN6dSPNMndZbgcNwl
	+/h64g=
X-Google-Smtp-Source: AGHT+IEWE29T6cV4r5UuETqqGeQnjCtI+yhJUtdEO1Ev8BuF7jZN0enwt/bBX1nmZpGKZUqSfijRG8c7SGSTF9FDuo8=
X-Received: by 2002:a17:907:972a:b0:b04:4046:db6b with SMTP id
 a640c23a62f3a-b24f567c816mr645963466b.45.1758362894355; Sat, 20 Sep 2025
 03:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAOprWosSvBmORh9NKk-uxoWZpD6zdnF=dODS-uxVnTDjmofL6g@mail.gmail.com>
 <20250919-lurking-agama-of-genius-96b832-mkl@pengutronix.de>
In-Reply-To: <20250919-lurking-agama-of-genius-96b832-mkl@pengutronix.de>
From: Andrea Daoud <andreadaoud6@gmail.com>
Date: Sat, 20 Sep 2025 18:08:03 +0800
X-Gm-Features: AS18NWCh31p-viGL3PfP7OcvBtJwzsD-69eILq-7ZVP3bQSbKG7MfpPrWXV11mM
Message-ID: <CAOprWott046xznChj7JBNmVw3Z65uOC1_bqTbVB=LA+YBw7TTQ@mail.gmail.com>
Subject: Re: Possible race condition of the rockchip_canfd driver
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>, Elaine Zhang <zhangqing@rock-chips.com>, kernel@pengutronix.de, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_030816_891999_FB7E1F04 
X-CRM114-Status: GOOD (  25.42  )
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

On Sat, Sep 20, 2025 at 3:04=E2=80=AFAM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> Hello,

Thanks for your reply!

>
> On 18.09.2025 20:58:33, Andrea Daoud wrote:
> > I'm using the rockchip_canfd driver on an RK3568. When under high bus
> > load, I get
> > the following logs [1] in rkcanfd_tx_tail_is_eff, and the CAN bus is un=
able to
> > communicate properly under this condition. The exact cause is currently=
 not
> > entirely clear, and it's not reliably reproducible.
>
> Our customer is using a v3 silicon revision of the chip, which doesn't
> this workaround.

Could you please let me know how to check whether my RK3568 is v2 or v3?

>
> > In the logs we can spot some strange points:
> >
> > 1. Line 24, tx_head =3D=3D tx_tail. This should have been rejected by t=
he if
> > (!rkcanfd_get_tx_pending) clause.
> >
> > 2. Line 26, the last bit of priv->tx_tail (0x0185dbb3) is 1. This means=
 that the
> > tx_tail should be 1, because rkcanfd_get_tx_tail is essentially mod the
> > priv->tx_tail by two. But the printed tx_tail is 0.
> >
> > I believe these problems could mean that the code is suffering from som=
e race
> > condition. It seems that, in the whole IRQ processing chain of the driv=
er,
> > there's no lock protection. Maybe some IRQ happens within the execution=
 of
> > rkcanfd_tx_tail_is_eff, and touches the state of the tx_head and tx_tai=
l?
> >
> > Could you please have a look at the code, and check if some locking is =
needed?
>
> My time for community support is currently a bit limited. I think this
> has to wait a bit, apologies :/

No worries, I will debug myself, and hopefully send a PR if I found
something out.

>
> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

Regards,
Andrea

