Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E68CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 14:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJkfGbWQ8DKwLCLdQal42ea+EEF76F0Bpw81JJEN1eM=; b=ovz1k3WIrZpPITeG2Qd2Lvscig
	iBVoVHuJ32qNJwf3oFoOlhaD1CZR7EbmPeO9/VD2xyLMwnmDmxDD3T1hFLBc6Uh9un73Xb2Lua0sn
	buaANePjKXhq8vkJvJGaJwgu4nO2Mk71t5UQJWI/1wXSxLrqdZ5dJVjsp/e8Bt0XuS3QuYf2VMFmh
	iOs5b3drBojNDXiw8DQESfrgsnpfiF2EduqIIP+hZ79bWfA6NAwSW/s6tG1zF09q8ZX3zLCd+an6q
	yokPIqFp8HdG7JNTvW5bGvo67jBvDE1OrEb3B2CY7fjbXGhYgYl6ibFdOFs+/GCRWXMOlmmUbYIsr
	aZ4OWiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hrv-0000000Aifm-0mIL;
	Mon, 22 Sep 2025 14:50:19 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hrs-0000000AifR-42yR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 14:50:18 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-57a59124323so3314168e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758552615; x=1759157415; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PJkfGbWQ8DKwLCLdQal42ea+EEF76F0Bpw81JJEN1eM=;
        b=mR17aaK7MsxSkvPTd8Pkye8yEGmRwg9QDW/W/WwcAOjQftyTmnhWA0bzAzb8BIiNju
         onUmzRjZ291u00modfoKjbjVhnGFXkLB491JYzZq33rrQ5vxwFScuvjpd+8ODCwkOf9k
         ewkUYcoXokW7ZgDL6NRiYk1rnWkHkfnezvF3SkigQFl/+fy61AWZXwUn9CIEkN8qRlbI
         psPVBtRYFTJrLWwo4h107v01XIkhLeJOdj8OnBY22y7o7Fi6QAm8cD7NEB0JKnjy9Etl
         o3juV2Emyl8QpCFzZVoW2UTRkynPX4Y7amqsSgbNFWrADkQSTHVzKqwBdnd9cWwN1sXl
         ClnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758552615; x=1759157415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJkfGbWQ8DKwLCLdQal42ea+EEF76F0Bpw81JJEN1eM=;
        b=VGX9+Q4LTLQJ+g4TRplGSUpnuieyUHziUN9f75NYzohigbcJdOBlwMOS2KfNfYwl7Y
         zNDjmdgeB8so6AVjTyhX8rL6TPmxtlN0hEHLWlVY0xampw9LQ6YxayNNEnzGPQ9M8pfu
         k5n/a2ZDfXmIr8lCInteGewYj5b9sVxxIsX2Miwsve0q399T9DX1F1qmnXgEZrIWmWxx
         yx4+PMcBYJM+v53B7aNAZSvl7ZqrwiYIXNBHv+HZZNaaRfTtYA5gI5l1U4TJgd/XD6ZG
         fT2mBGBvSeGRaYycPT+pFbpWqC/tCzwoKPaIYCL9EYbLxlit3vPnS4k1xpKvmbn5iiel
         AJEw==
X-Forwarded-Encrypted: i=1; AJvYcCWF3YRvIKENtpfxMI1nD42acKt5FeJybr/g5y+DCyJOhXEq5d6BVpfHbHfGdcONpBkC8lFNf+CWupZ8Sq2w3xhM@lists.infradead.org
X-Gm-Message-State: AOJu0YyR68/bAMe8XGCcOV2XsU+97A+o5fEqQo2hN5BCNm9sMbLB/ekw
	fybtDS1pbTtVjIfX9yvrjWAY9bsBEKkAwgO+5QSfpXYl7RDnlxhLb7Am
X-Gm-Gg: ASbGnct4uQz8M2t8HSY3HFYYtbUFxDEpE0PClZrRd/+FgyxOKJtw9WzW1xU78clfQMi
	NTSGStLQoz7uPWh6bBovKAjhSO6pDh0JRTc1FXm5ZVHt7pzQAHcaMdeqMoTkDlnpBaaT4x/y6wy
	Yb7P9gD18FjnngV+/kkBNucwXgLtWc2pa+BZOP5PwdbFJ8INaiVLconSorJJ797YVULVWPKGQKS
	zGUHtl627JK3AWI9u9YhoHIxyduAYJsnMYu9D/CQTkFILaAEJSk7njDFM507lG2rCC/weyJ1zPV
	beSw4IONCFWfgfOI7+al/jNasr9KLPg1Mtmd4qT6PZ2Et+Xp9nL4tupbACcXCHDerBmoUmSjw7X
	KNAk8p0LdrcebfrxYGExGmmEx2tBSWJ/ZNJoQqu2XtgV6NveXEBmLWkiAM84=
X-Google-Smtp-Source: AGHT+IFcvDKfo6/rF+Nh3kI8hFqr1RyQcXaBGgCXhniYJNNce82tXdBX88O2hhL6GYKhS7xRDvOPEQ==
X-Received: by 2002:a05:6512:2344:b0:57e:216b:7605 with SMTP id 2adb3069b0e04-57e216b7873mr1995745e87.49.1758552614400;
        Mon, 22 Sep 2025 07:50:14 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57ea29ee5ddsm890447e87.19.2025.09.22.07.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 07:50:13 -0700 (PDT)
Date: Mon, 22 Sep 2025 16:50:11 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 5/7] i2c: davinci: calculate bus freq from Hz instead
 of kHz
Message-ID: <aNFiI_4HAP5sBSTP@gmail.com>
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
 <20250922-i2c-mux-v1-5-28c94a610930@gmail.com>
 <CAMRc=MdMMQxFfkMPHaUg9nMWuW9F1p+PT2i-ggcU5SSFKOVGKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kLmsbuz1Pkyj0gi4"
Content-Disposition: inline
In-Reply-To: <CAMRc=MdMMQxFfkMPHaUg9nMWuW9F1p+PT2i-ggcU5SSFKOVGKQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_075017_032659_A1F8DF9F 
X-CRM114-Status: GOOD (  18.01  )
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


--kLmsbuz1Pkyj0gi4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Bartosz,

On Mon, Sep 22, 2025 at 07:42:43AM -0700, Bartosz Golaszewski wrote:
> On Mon, 22 Sep 2025 08:21:00 +0200, Marcus Folkesson
> <marcus.folkesson@gmail.com> said:
> > The bus frequency is unnecessarily converted between Hz and kHz in
> > several places.
> > This is probably an old legacy from the old times (pre-devicetrees)
> > when the davinci_i2c_platform_data took the bus_freq in kHz.
> >
> > Stick to Hz.
> >
>=20
> This looks good but would you mind also changing the name of the field to
> bus_freq_hz in order to leave zero change of misinterpreting it in the fu=
ture?

Thanks for your review!
Sounds fair, I will change the name to bus_freq_hz in v2.

>=20
> Bartosz

Best regards,
Marcus Folkesson

--kLmsbuz1Pkyj0gi4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmjRYh4ACgkQiIBOb1ld
UjIFaQ/+LAQ/eyJkvpFrJeZXJSpKHC7TjT/6INLurYa43ACv+OmVxYjnHFi6gpWi
biuX98wrOiTY967DDBgQnlCAl72iirRfxCkImgv0HPg7MfeLiXarhLWwJzYbzp/2
h/3v2LB3wOJGw+OnWkiDCVXgpT5ti1ME/5S2cx1DAK1RrgCWJhPRzEF6mWWrXEvX
hnrqSnf6OWFGN7SW2yegp0R5beRjKvZeI9Cg+A1x496RfRQKgEffQ6VxB50Y5iSx
4odYxRmVIEz9FSnWEhULeB77mgWT2F4vo0KokWd47MBznwwYDcIxtXnZMyW1Kqgb
0bPDZFqGnIvSQtgOo2tTiL7pAMvxncaWkvFMRmNFX+T+e8SjK0XyP+G0/IDETqoa
T2k4HPloV4P0a5szKoIzvjaS+SlvMN5F+26XW9k/V9lP7GL+tOFFhy21CJArjU2L
lRQ8SQLEIKu4JLs6RoVyOYiG+eFuwaaFTrzfBR1gULhMDrzBbT0k2nDrMjvWfGqI
wsMHXrGqb6eWNq/Vx0sWV5BNLFl5vL38a9bXL0Gv6Lpmc2p7I9SSYcTe9eNR7nVK
g2S8L/ivdCgXP/n9j1hmQrfACVKQec/DjxT9/HyXVwThXVUXso98DRdNOhZJyg5x
letC7sGiSN1Pr+P2PAhHYYS33zg2kXad7jm0sHRM8zh89RCJsBg=
=vtDu
-----END PGP SIGNATURE-----

--kLmsbuz1Pkyj0gi4--

