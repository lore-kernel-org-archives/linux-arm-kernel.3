Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610CCC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 10:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEjJzYsdHCDfg7DEYH2Vg3tOhB12CqNu2FmVJukJ7SE=; b=DC4eIe+HYrXcbkIr4KHP0SIfuU
	d9xI9+XOigIUIEo1GsFGDhNqNpyFVDIiTFDu+aDsOX2bmKEWPEgSVteKMPXPAJj3o2NKxO2SSiHdz
	pRfRs8GzYXhyR3L00UTJO9TyeCSzpFvC4jm1bkHRbJEi84w1IHYB9d+pKtE9BgBM5xo2lIGC1KMKR
	uwmNqk4HSk893BFCvQjGT+tzZ/24PbF0avtMN7VjWFA2c1P18LhBQPORZHG1z+eu/UQyIz4366QV3
	xGJ06qs1VyqnGDvDUUPDa9wo07v57EHSg4navmTPjJL3V8mbi5K14M8oIca6BiyhCFdLN7EjgiGrw
	NF2bC5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCy4M-00000000KJn-2L9H;
	Thu, 08 May 2025 10:01:34 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvjW-000000000Pw-1omx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 07:31:55 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a0b6aa08e5so959167f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 00:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746689513; x=1747294313; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aEjJzYsdHCDfg7DEYH2Vg3tOhB12CqNu2FmVJukJ7SE=;
        b=G4fm2T6iHLzUb1rqQfZg4B6/NeajtuOO3zOo4m0jULcLa1qoPVolcU4Lp33JB78Cg9
         msyGN7022/GD1VSAE3wYf0INO5VMK8aS330JmLu0vnKqKIVmqmGSySFfBvOGlkoWpNTF
         Qkxfq/DgRBd+CNE4ymfXJtehTX6ttAuwBJIGs03xGUctTkHFO7B00hOsbtRFEDddEzxj
         XclYRrMjOvf5hP+w8GoimylPcAg0FYtDvNjxhJrGHvPbm1eOWEkrpaj6Uzm/jOvErNhy
         tlaNBCY6R1SNlIY8fbVsgm5sSriU0HZAAT9ClzPhW621z+q6F1+3PRm/UCVtPb30/v4R
         pRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746689513; x=1747294313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEjJzYsdHCDfg7DEYH2Vg3tOhB12CqNu2FmVJukJ7SE=;
        b=ByDl9Ruayhu9gVApdWTFeQayXlQoS5UAx6YiH+sEgFsarwyIdebE58W0073yvtDai8
         D51QFVrsDM3KC06R5Ir20iZxGd4ApPzBHE6IwGgx/7WCXSfKmwsYweJJ7z9Lol8oqHvv
         Tt5KS0/hK3JH06nkPpb8CiS0tjyYboKyxC3lkyst3dPgSa/XSa5PdQcFROvNNcJO1NT1
         whdZEeeQhGiIO9f6hkdKHQuPHVdzysPOgsvQzJx3Lh0KBnAj1+U/CUV8WquoXRp+jILF
         ErjzZCqQz4kKERmxZUittiV+vEX+kqFjfoUP1v2Nkr6h8RI4MVS+8T3aU74aBZZh7769
         bSWA==
X-Forwarded-Encrypted: i=1; AJvYcCV10tPdmg8DAnVikUm2nferqXUiEtT9Jb+mUEkiHR9dw+sKrPDqg3rTMkajSQ2zMrRrdchql6u1X3RrFs9LFPaZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/9VX16REmF9YU7pnu5pwBrcG49gKZgwoeM0YZkqePuMAKDw4r
	Mmn9DlzBgv18QYgv6cuD10CrAIb29gGc+y4ijgKzJVYb8oOUpn66
X-Gm-Gg: ASbGncueGIlwc/Re6wXcDJFpQYNrrUdIbgBC3aoEKZCvuYFMe72jpj3dgkcBzdsKgA/
	souZFYUJamUgZCY1nG8X2GvCAQ0EBMzMY+dsTPM05ID2Go8V96M/mzOrTjP8BkvTVuA6paD7bH3
	qvwlHkesvr0aIua1zd2xU7MEbfa9poBk8EA5/GnFh2EsIqe78cZGj4IDNCV5zZUOIZcALUTYVwv
	VScXFbx9VMfkZLzRuw9gLm3WGYAHTSZJCMGiH7hrFIwLRig4sEZ875H4RFmV6lOkUGGZTpbUosA
	BxXe8hOl4etd/hIup9i/SWV4UhkfL7Ae/bmymBkSjqlBozkmRHU3YDMDUo5E8r+gyIPdJYJ7KcV
	Z2xOw0jAaNrLM8MTGtRUoGFt8+N8=
X-Google-Smtp-Source: AGHT+IG1yR4rGhWUtkmkWIDRYUZ1wU83cR5nh3D7k/LMR2j9TYQMYoaizk99YqloQtl2YMEFecyY4g==
X-Received: by 2002:a5d:59a6:0:b0:3a0:b84d:816f with SMTP id ffacd0b85a97d-3a0b991fa38mr1910968f8f.14.1746689512640;
        Thu, 08 May 2025 00:31:52 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3441sm18991273f8f.26.2025.05.08.00.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:31:51 -0700 (PDT)
Date: Thu, 8 May 2025 09:31:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
Message-ID: <apxlsl54wyigk7yovtrb2tadhhsad5ti7hdvueisjcdjzfk443@4q3fv6pjaac5>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-6-thierry.reding@gmail.com>
 <b6d4f40d-9ad2-48c7-a5a1-55b2ebc4e21d@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e3xoqdmdt4ognzxn"
Content-Disposition: inline
In-Reply-To: <b6d4f40d-9ad2-48c7-a5a1-55b2ebc4e21d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_003154_475895_ACEF190D 
X-CRM114-Status: GOOD (  22.35  )
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


--e3xoqdmdt4ognzxn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 07:48:22AM +0200, Krzysztof Kozlowski wrote:
> On 07/05/2025 16:37, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > This doesn't currently contain any stream ID or memory client ID
> > definitions, but they will be added in subsquent patches.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
>=20
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> </form letter>

get_maintainers.pl lists 13 people and 7 lists. That's *way* too many
recipients for something as trivial as this series, in my opinion, so I
tend to curate the list of recipients manually. I guess I went a bit
overboard and should've at least listed all DT maintainers explicitly.

> > ---
> >  include/dt-bindings/memory/tegra264-mc.h | 13 +++++++++++++
>=20
> Filename based on compatible.

The compatible string for this is nvidia,tegra264-mc, so I don't know
how much more you'd like me to make it based on that. Do you expect me
to add the nvidia, prefix? In that case it would be inconsistent with
all of the 8 other Tegra MC includes that we have in that directory.

Thierry

--e3xoqdmdt4ognzxn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcXeYACgkQ3SOs138+
s6FnRhAAku1QkoTdXibdp5EpZgLKfuxNx35sXUWwmNNtesCln01v1iYHZOaLyb+K
iwKOk7FgCfezvEJme9J9h3EV/8vIC+yb6mloPJoxTdAhlg3cdNZsoEP6S4DMSsrW
075z/nHmiDElbmm/SvdI/rKzgLZpIR7AyLSdDPWCPJl37V4C1tjLsBbYvwh1D2Xg
z4uwCrJxXHgXiK+AS4BD2sHFxJBkbiCjBHAPj1l6aVAs+sEbhryPYHihLaZeDcMr
+5IcuQ5Uh7X+0U83bAPUoi+q0SwELcZA5ZMqnVSEAE/sCjc3Go5umZxXLXD3AevS
oRRy3bks+flYkWoXNB6+V+Ii2hnUml7OunJglKk0o9aGiUjhabyylYWUv5BnrO+v
/rLl9m7JdeTU5nywOP+du5ajzss+0LuQokF6ZJ4DcFob+vRrOYIsCUCzvpXvuwiN
NCf7iDwl1fqG3yHZOI4l1KuwZjsdYQwKaek2U7SxcxuRoerdHPggNJ0i40hBNy6L
oD8LRRTeblZ1XiIqkLEs4fiMNsANUHtTip11osb8OihjqhF/vHp7xi60vCwLjF2L
YjQP/NTFeJP+vo8y4R2shkRC34en9Bw6kzQMdHjWRsFHpwJafVVU9Afti16r98eo
5GnykrXF8WzThPYOT8e+VcJ7OXPwCHNbewJ2x1W3N3opQHbnUJc=
=FUct
-----END PGP SIGNATURE-----

--e3xoqdmdt4ognzxn--

