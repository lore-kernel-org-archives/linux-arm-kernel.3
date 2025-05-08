Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA09C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMpmFs9yHrwvpCn9q4VKyxiOLgjk53pgVJePgrt1J7M=; b=A3Gl3sUIf0Tf1AafrgPn66HSyd
	bMa2k273xgzUkXWwBOx2/x4fLhRBVFmGLzdIvoLQL3oSTQQ6Sn10fzSbw9Z3g2nKMXbc2ob6PrFH8
	eb6Eaq9U2AlAo0sebDA1vsnZkqz/I2r/NJA7DXCjc0IWSVioVaewI1vi82OTRmZzfVQKt/ZMhfD/Z
	bXeXrrOlLcO0Ru4CRDgY6H8WY0vex/soPc806CimlAqS5RNcK8cOv55c6pD27VR5MhtsH2V0Etsi5
	9XUoN74xhihrk+A98JgGdh+oj8icLl+m36S+1kS0cHTJF4U0hX8NW5871/Hhh7K1eQ/GBAYqYayB5
	TsQHNBiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxWL-00000000FlX-0nVR;
	Thu, 08 May 2025 09:26:25 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxBe-00000000Chq-0tuG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 09:05:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso4786795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 02:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746695100; x=1747299900; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jMpmFs9yHrwvpCn9q4VKyxiOLgjk53pgVJePgrt1J7M=;
        b=TH3caP09KVoix46FYe4He6h7IWAq6hf1BDM2f8H84o7P10FBqSjD2+smujvUveK31W
         Mj6FB+mGLPaL6NsFmKupc2rXlr2Fsbd+YLaO6MGrscjmHI/YYJTxmxh3DNWXWFddaPTR
         ysrnVUjIPIilH5K/qgQLe+Ao5EErb2PJ8VV31aatO3RXpIp9Tj+nZTfquiNqkfpy/uo5
         hF3xireUGxkbKE4NZO36kwKAcleH00AThXWs4DnFIZv0O/jJQR3zW1AT2Ob3ViwNBhj6
         vbnHzBB5saatWmCd5SAKgV5mO4JbhJ+kFCZ/Qn4Xja5mXJmKeCaS5DdY2HqTsG09pLPg
         4OWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695100; x=1747299900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMpmFs9yHrwvpCn9q4VKyxiOLgjk53pgVJePgrt1J7M=;
        b=IwaAzXSoZRF9vAQYaND9LbJuaKjenioZcePF7rHMVpot8Q735nPVe6ASbnZrrOXER2
         q90ijIFkZjzxlvsNeusmTtD6WeHh74ri6/knyEmcmVvrz7BXoRTth5E+MZOPt92eqP/1
         LSc2BC1VhDiINP58bmxEM0P/khHfuI5/psnVoA6+NrcrEFdx1a02iFX4T77l7+p56u+j
         r1Ncz1WOrIyUWgZtyY86C0F6FVU80ZEXBxGhJXSZB/ZazpibLDejf71pufU4bzMFzBxL
         q7euip7pp2Ls/Z+SP8LgNTuldF7tJZ4PdoRuOQ/WmQK0ulnRYj/Sf5VVb2vN/Yiu1aCZ
         +F9g==
X-Forwarded-Encrypted: i=1; AJvYcCXaYroMrpjFVyohrtQ0qQx3NNwcKFYTdzrpXbyLjDICNKnmjCCaTMRUAWXX1RgiOnrdMqxeyv0MjfLYzthUbLKd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0xmEB6KsXxMIdpcL3qX/RdR5ani6xtH4pOFrGv3mP/JDktDhn
	RNXAxY1KJQW0kKAk32knzgpJfKT9C202Y/MnLoI9k4Rwv3J45+tR
X-Gm-Gg: ASbGncvvRymjwM4R/AmvBIxFZMlIQHSQlOUsv+eCyt6+eg6N/IdjdXRlwE2MigHRipq
	HVb8n1W+s72NUHthZNpfjFB08uIPp0Hzr3ib2QqWVFwFGJ8tYniDOaN6jls4YnYrMIxrEwIKV91
	6kOD5TnwO5D6g8NGIphigEbGYGA/a21mdLcf+S1HdqMtntiPVziZHyK2juywVDJ5UDr4v4ke6wY
	SL07BM/DZ8AxRF1HOEnPYyVlOQT36iGQ9gwnOEeh4QRwRTsNVjpE2WzolYGh5Gu9TAm/LiRDTyp
	VCutyo3W+XsAkFh91Vw9MZJPvYszzSoryNv95XV0+pLxjafqfkiCmGJNba+tXCn+iW6UjQBEtjo
	TS4N6TMQ3Z0mmd7kCNEYejtLOr9Y=
X-Google-Smtp-Source: AGHT+IE1u972oGQwOb9cGNOeMNv6MEsmM55l6qq0xnnj/vFXN8pi6pWawjcrWO3keTfAh1Rai4cqhw==
X-Received: by 2002:a05:600c:1d08:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-441d44c7addmr64871425e9.16.1746695100108;
        Thu, 08 May 2025 02:05:00 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3809f2sm29850555e9.35.2025.05.08.02.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:04:57 -0700 (PDT)
Date: Thu, 8 May 2025 11:04:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
Message-ID: <hndrlfzdmbg7fq4g4w7rlftcgyb3p3yphmyf7cejgbnxfyj4am@7w6x4s5kxqat>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-5-thierry.reding@gmail.com>
 <1ec7ed24-a4fe-450b-8f99-34aae6ed2c4d@kernel.org>
 <3gpirue4rr5hpgynzzadzlr6i2fvdhaugcutyqyfoeix2zf3fu@xpbdadb5nynu>
 <b20ad0cf-f49b-4c78-ab67-adf3a4c55cf0@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2clf4e2raimg3bgd"
Content-Disposition: inline
In-Reply-To: <b20ad0cf-f49b-4c78-ab67-adf3a4c55cf0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_020502_257367_28A05774 
X-CRM114-Status: GOOD (  31.86  )
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


--2clf4e2raimg3bgd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 10:42:33AM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 09:53, Thierry Reding wrote:
> > On Thu, May 08, 2025 at 09:40:02AM +0200, Krzysztof Kozlowski wrote:
> >> On 07/05/2025 16:37, Thierry Reding wrote:
> >>> @@ -0,0 +1,9 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>> +/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved.=
 */
> >>> +
> >>> +#ifndef DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
> >>> +#define DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
> >>> +
> >>> +#define TEGRA264_CLK_CLK_S			2U
> >>
> >> Abstract IDs start from 0 or 1, not 2. Also drop "U".
> >=20
> > These are not abstract IDs, they are defined by the BPMP ABI. We cannot
> > change them, otherwise it'll completely break.
>=20
>=20
> You mean from the firmware? Sure. You have entire commit msg to explain
> all unusual things here...

It's not unusual, though. This has been the convention for a number of
years now. But yeah, I guess I can be verbose and repeat all of these
details for each new generation...

>=20
> >=20
> > For similar reasons I'd like to keep the "U". These definitions are for
> > the most part directly imported from the BPMP ABI headers, though we do
> > try to be selective about what we add, to avoid adding hundreds of new
> > lines in one go, and several safety-checking tools run on these headers
> > that happen to require the "U" suffix to make sure these have a defined
> > type.
> >=20
> >>> +
> >>> +#endif /* DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H */
> >>> diff --git a/include/dt-bindings/reset/tegra264-reset.h b/include/dt-=
bindings/reset/tegra264-reset.h
> >>> new file mode 100644
> >>> index 000000000000..31d89dcf62fa
> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/reset/tegra264-reset.h
> >>> @@ -0,0 +1,7 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>> +/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved.=
 */
> >>> +
> >>> +#ifndef DT_BINDINGS_RESET_TEGRA264_RESET_H
> >>> +#define DT_BINDINGS_RESET_TEGRA264_RESET_H
> >>> +
> >> This is empty, drop.
> >=20
> > We have three people currently working on additional drivers for this
> > SoC and they all need to add to these two files. Adding the empty file
> > here makes it a bit easier to coordinate things, making the resulting
> > conflicts trivial to resolve.
>=20
>=20
> Bindings are supposed to be complete (see writing bindings doc), this
> means also bindings headers. If the constants come from firmware, they
> are defined so I really do not understands why they cannot be published n=
ow.
>=20
> Unless you mean that this is a new SoC and the firmware is not yet
> fixed/finished, but all this must be explained in the commit msg.

These are fully defined, but they are also close to 500 IDs, most of
which we won't be using for a long time, so it seems wasteful to dump
them all in here at once.

But I don't care all that much, if you want all of them, then that's
what you'll get.

Thierry

--2clf4e2raimg3bgd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcc7cACgkQ3SOs138+
s6FPfBAAhnb2gwUU4ZHYaDFUBgtXwCwDkJEn7vQHfLLDJ66fQANgj1Yy92wlPEBT
NYSoLWi4GeH4qpNNxp5KF/0HWgK57yX7AATvTQEVCSydzdBLKFhhFpEbtA+WFyPo
4L9UH07KMxZIO3L9U62c85m1htDkCgySHO4nY6lxp+kalE82dFaJ02ckudrWH0R5
1dp+c+onM833RPE+Q83Rx8VQGd1pT8dR+AnK5/fPwUIeRiLVCvxOg7ql71/L+vQg
BCG21GaYvPRNce8Kt4DRyvpMS/aSimr7/AZX4MzaysF7sBdGYi1LzvJvvQ8mkLoS
iF3+d5ieP88G0IrFfnr688OZUgH87uOPuBvPUOjv3aPcHS0O0Eh3fs5d4RenGCOJ
3boezcTxYltqBx116nuGWuibmlZpuIqnp08kz5SdXyUkB5AqO8LLDfeidXxJorfA
iurYvaZbjvw/LNiv+JBK1QAJuXBTpwOYahU7ZtXWRF56Gk1V8tf9WoEI7Lxr90Ec
Q4vLQ10mqazLSZC5s2pwPdd/i/aEMG3j9GI9V3df3xWV47kMfEt25NaaaL+o1gvD
lHT3MVsnuyE/ALPcAqxKe/zyNHezQVK+l0wMaBYvjjPIWD4K+yf8Hf9reTx5UgPL
2W+MC8MfwC7NxllLWdvUVJlPCA5oKWslCmDqk+Pqg4lWlcUrg2w=
=I6j+
-----END PGP SIGNATURE-----

--2clf4e2raimg3bgd--

