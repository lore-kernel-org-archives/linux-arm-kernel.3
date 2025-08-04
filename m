Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB56C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTN6DQNpcMHKpy2OvEV2qP5hGAy9yu+IDmfs1+NjDFw=; b=RXMUv3gHtRd6BeqQ4es7H3d56O
	WmRb4m9t6B6b2MqsEQrwvXmIrqljYENYAb2yXvWmLNlfE/F6pfH8WPb6RrKh91HwDUKNOJWxgKIYj
	s5cjOs2aziUR3KuTzplqM/BJ52vK2+fApmzvppr5sPXUAkTWWm2reuLcHIaFjgPOG5BIsaeLQ1ZND
	DeUJtEoHtWspFosWf6UO7jAotV7w4vSe3bK4vVlvUThLGv8vSWZMkRewL0Rkl3L747lWaspPl0+DU
	lfjgNojNWRGtmP+JIhLJ/2Q1/DmOvtIDHXgLxMu6kiZNNR8eNxXCd3u5VqsvPOU79S9sWnk3+txd+
	O5WiG2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiso4-0000000AE2X-2ftC;
	Mon, 04 Aug 2025 10:52:40 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisSy-0000000ABxK-0KB7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:30:53 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6154655c8aeso5825797a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 03:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754303450; x=1754908250; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jTN6DQNpcMHKpy2OvEV2qP5hGAy9yu+IDmfs1+NjDFw=;
        b=PwHNYzHf7lgCbkRdfzVdriWoSjhl6gE4iDiRKi6IYp5OsoCLG2n8HHw/8YjqWdc3Ya
         hCQmZTBhSbV4Ve7xCPAz3SkGPvieJt3IWHnSoQ5QcZl8EHoVjkzTbFmIvo5haFalvh3D
         85tm92TjAaFFfHH816ZYUtDQHkcOMyLHIz1qO6Rdyih3b1sc/W93FI/NjTSXq6SFsxkq
         OynMUguYLYX+LWE9zWo4O6nIriJz/DXFcZuqTkxVF9MHB6usTUutok5HiZUyOL8M0nKj
         qRoL2tqGZ3J3txwyC8m21MRY8c3E+dudTPq+qdtuKv1bsmzcbjuSboyzwVTPlQAeUOi6
         X7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754303450; x=1754908250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTN6DQNpcMHKpy2OvEV2qP5hGAy9yu+IDmfs1+NjDFw=;
        b=OjBzCP8m1Fv3WWt+JyBBDkfIj01HZSs3VPpbH6tgW1xwzQnuIOGtqf348IK0SPaE/+
         6ORn+5wr/zJF4oaAygDmcCU4472e35H+RxLEgCNN6nGyJPsRxuGMixB8ij91ZaoDrvuF
         lVanH3cSfYQStDCUm/zuGgTyQTCyOqjw+MOLj5vo4H5Qp9YN2mgDNP2+BHNs9M0UWwVe
         IeK73AD2ArnDu3HZPLZsywaJWhkQLXH3ltqdV71JgM9raeaCrP+rFLYqlXWlZ1sWrnms
         ykPOujCuDoSTDaAouRptfiItmDMHF4VzkQjx4D7q2/eYNM7l5jF4MvOiQYq3O/fwGADP
         QxBA==
X-Forwarded-Encrypted: i=1; AJvYcCWXHY1sibIuJmA0arNOGQBZHL7YogLCnbPAB3hLAEuUnnjs7ybl6KrNjjfr24W6q3ogrJ9xv+J2tc8auaoinmob@lists.infradead.org
X-Gm-Message-State: AOJu0YwvNS2e9NZJMbyKo2QeqOoaqXd18xKE4WeHx5wgeoK2GhQvEQ4T
	O1j9eo6pCq1Uts4gbeTUkwdH4IhdSk1iyC53WiPn6/TAMeLvilgPk1MZhLAV4kGWLs0=
X-Gm-Gg: ASbGncsLla3YRrByt+2+rwpoUJi1cq+LLynMpZCO2ePJ6C9DnfKwQex08xeYMlccGYl
	ESxmZBsf4bYA0HPXMUJrZIXgT3G8AdqCh71BtzKXdr6wb93E1eFpnNLiyDwuBdzwF4zst+rsPUh
	puTDKLcyLHJFwDK357IyGBvpLvbtJL18ayLjC9pUNYSdd6FnFdbw2XeyYsEtleq7bM9djqSTMIA
	y4EiJpct338kf6ZW07wQHp1AAWVOIfyYDeL/tdB1J4g1rK7oynd+SsQVq8KUXTATYyYpQm10tLJ
	9fe+cv64z5UBIfNse/N2JScXap3n/u2NLlwjf09AP3v8SI1gn41WS/xYhV5KZqE7WAUjuRW6uXe
	KWeD4oE6HQuWs7P7CD99LhVeSrbA=
X-Google-Smtp-Source: AGHT+IHSUiWGu/+IUmZfr7UuZTzuzqt4FpzSovbXhqhrTAZ/3nG/5APGMONyYDA0Ula6YRbTqUNTlg==
X-Received: by 2002:a05:6402:4403:b0:612:a86b:ac79 with SMTP id 4fb4d7f45d1cf-615e6eb6935mr6975874a12.2.1754303447934;
        Mon, 04 Aug 2025 03:30:47 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-615a8eff8d3sm6674755a12.6.2025.08.04.03.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 03:30:47 -0700 (PDT)
Date: Mon, 4 Aug 2025 12:30:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/8] pwm: mediatek: Simplify representation of channel
 offsets
Message-ID: <g4qrehzi44mgvmy76wnrhabmin454wwrngubvvikgjv3w5udl7@wmxrly3mxoiu>
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
 <20250725154506.2610172-11-u.kleine-koenig@baylibre.com>
 <e3495f99-4a78-4910-9b67-6c25dfe7f989@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eaj2ceowxzk5qqet"
Content-Disposition: inline
In-Reply-To: <e3495f99-4a78-4910-9b67-6c25dfe7f989@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_033052_111679_B49B4F27 
X-CRM114-Status: GOOD (  20.21  )
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


--eaj2ceowxzk5qqet
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/8] pwm: mediatek: Simplify representation of channel
 offsets
MIME-Version: 1.0

Hallo AngeloGioacchino,

On Mon, Aug 04, 2025 at 10:50:01AM +0200, AngeloGioacchino Del Regno wrote:
> Il 25/07/25 17:45, Uwe Kleine-K=F6nig ha scritto:
> > The general register layout contains some per-chip registers starting at
> > offset 0 and then at a higher address there are n nearly identical and
> > equidistant blocks for the registers of the n channels.
> >=20
> > This allows to represent the offsets of per-channel registers as $base +
> > i * $width instead of listing all (or too many) offsets explicitly in an
> > array. So for a small additional effort in pwm_mediatek_writel() the
> > three arrays with the channel offsets can be dropped.
> >=20
> > The size changes according to bloat-o-meter are:
> >=20
> > 	add/remove: 0/3 grow/shrink: 1/0 up/down: 12/-96 (-84)
> > 	Function                                     old     new   delta
> > 	pwm_mediatek_apply                           696     708     +12
> > 	mtk_pwm_reg_offset_v3                         32       -     -32
> > 	mtk_pwm_reg_offset_v2                         32       -     -32
> > 	mtk_pwm_reg_offset_v1                         32       -     -32
> > 	Total: Before=3D5347, After=3D5263, chg -1.57%
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
>=20
> What if we do, instead...
>=20
> struct pwm_mediatek_regs {
> 	u16 pwm_ck_26m_sel_reg;
> 	u16 chan_base;
> 	u16 chan_width;
> };
>=20
> struct pwm_mediatek_regs pwm_v1_reg_data =3D {
> 	.pwm_ck_26m_sel_reg =3D PWM_CK_26M_SEL,
> 	.chan_base =3D 0x10,
> 	.chan_width =3D 0x40,
> };
>=20
> static const struct pwm_mediatek_of_data mt7986_pwm_data =3D {
> 	....
> 	.reg_data =3D &pwm_v1_reg_data,
> };
>=20
> ...that should reduce the bloat even more :-)

Having the three u16 directly in pwm_mediatek_of_data is cheaper because
=2Ereg_data is a pointer and so 64 bits wide (on arm64) and so bigger than
3xu16. Also having the data directly in pwm_mediatek_of_data saves one
indirection and so it should also be slightly faster.

Best regards
Uwe

--eaj2ceowxzk5qqet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiQi9IACgkQj4D7WH0S
/k6FSwf/bHraub08qdDH7NGDbse/dAus/PfuLOMMUmvWdr3WYZSQWeXZpzuysXdx
iX3pSR6SloJ3NDNN04P1in8Dj6VoPVVk+6xsyiJKfKLTq5mgJ/qcMrB0xXSI0gII
6JQi0z26kRjVF2x4642gsDRjQzztfJwiZpW7XfJtrxJfmWLua4gvTngXai3TS6tk
C9pmm9I8WkZm7TNKBa7mzYgqjeet4tuSujRZiOAwMtBKh8lT/RSZvv2cIeon31Uh
1FKeSzDTO3WyMiTC17z7WpZlWVxpAefUGaqsfa/3tYImC4xWvi+4cscMIPVjJCe/
SFIRoPIZusi/eUHVETsQ4f57cYg0IQ==
=UIdE
-----END PGP SIGNATURE-----

--eaj2ceowxzk5qqet--

