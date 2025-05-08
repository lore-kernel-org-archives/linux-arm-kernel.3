Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3CEC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xJARQkGD6OzSwCc2dOa2nBAlpXubIp8vef7Mr3omBk=; b=oPIrOvQChVW/YhT4MBccLlAK6r
	BXXqSVw/UxvL0BFu3gWECFTMFOj4ooOZODM4NgP/RAFJkgI7ib8TZkzwCw1j5oQw536tgxQ41NcKd
	qHMqak1csAald8z7iMVWOeyWVyD2T5Vj8/KcedWmnyNEmOulI/psMh0SYRPq1rQcWme1Nfhxelpty
	21OjmpSQyPwR6jsgfdwhtf/GilwQP/YEtwShK7BOuRBcbaUah1RcIjrCiaCxV2ssJx7ss3hhjO24r
	O9pei1dWDJc9MzVc5ob5n59VYi4NVhuXIYa7Sh8NujIEjCu2vpfpw86SKoKsQj3WU5kdFx43nvaqk
	eNN1oqRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxYG-00000000G3B-43ai;
	Thu, 08 May 2025 09:28:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxFl-00000000DB2-0GNF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 09:09:18 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso4448395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 02:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746695355; x=1747300155; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5xJARQkGD6OzSwCc2dOa2nBAlpXubIp8vef7Mr3omBk=;
        b=hv14wsZjBv+onuYTcFHAQ0RyQFS/tef//0c9gZ3f9WxF/EnW9ZamSpc6Xvaxxjq25T
         3P0YoG9WqrkuNEr0BhSEsMHoNAbkLOcSWxgdqxWz7f2yeI/tnuOkuOh1i++NZ+pkkVgg
         8hI9iRDhV5r/uOwOoL3RpIZr6VEXwRotbkKTW5+1xOGHcr0jLUBeYBKKqt7LrkKMJEaW
         6FyBuZxNlz5Aq9jbAarIIO08E+iyk24b/G5ILhtsZLYA+BoiWRF2t11D8y68KBvKKFHK
         9H60a5G11DbYGHYxhaSHXpqxPvdUKqWDF9GqhFf3K/VXwHloFnPbumS0HORv+KbaVi+T
         EBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695355; x=1747300155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xJARQkGD6OzSwCc2dOa2nBAlpXubIp8vef7Mr3omBk=;
        b=Or28Opawgv8cdHPxPGKqwPwd9DXZuau4OiVvbGB+vn0i3qE6/KfeAOd6ZrrKLzZqNI
         6XRsbxtI1h9/FkStXzmgxPKPk54wJq7WURvLmN5NL8DAwklGgLWYvmXRfrr0fAMlGX0h
         vO/YsPiYUCdTD8/+Vf1OGfgab256Zwro6JbuoOCAOBnTWlKqhUU9rwuusW0+qSmAD4hT
         ybZZOeWvdwFL859MeFWBv86liY94A43rUley8NnJGKCYzSMWd07ZuRWjCrnReyCLlW7H
         Wnek5dC6JMSDjt5tMtBUb4WGL9XwIAaB9EaWOpchdqKBRIjzecyca5b2xOO9STD9wp1G
         Gvxg==
X-Forwarded-Encrypted: i=1; AJvYcCUcgTvx0kIH6H1vMjG35Xtv7b3/9FduuCM92i3st/yu0KyYlzFXo8T3AKxMeQXCIRiIy5lXZO4C9Og/w+ABksms@lists.infradead.org
X-Gm-Message-State: AOJu0YxdDn9h8fO1sFZP0t4R+tHY1MXnvuqChicRTNFc9qBdMsNA65WJ
	86J96S1awdP8l1E9qBQL5VgZIbTAF51P1tR9QXFlgF9qpR3b021z
X-Gm-Gg: ASbGncuChY3++Ib4nLyXU6ELw0e3yb5/7ljYE2fpj3F5AOTUeaYkdxJwvcSjhfZTDHx
	v0KeqIq7waDbHklavvZuD3GIKyDqk69kdrv8UpN6V32lwTjmvUfyfxCDdE4eOenWpvhrfU4l2sM
	u4jCB7OskdLiJR5KdZGk9KfAa4uEiaoHSYPfQqEJU2n8hgfDv61CEjmny6tnuNOtlWfWNu9Ne9i
	ZN2m7vijtSSGaTHqeArWtYrGn0s/RpOYQGmMsekXiZb/i7luZnWCKclb8c7lLsDhPMfIMXehBUh
	C8I1QYAVeJe6AXX6tfZ04BSk3gt0CmClzcB1X/jS01HS4wCZIV6wkSPdjDB+KpuO9ooQKj/ei4X
	cqa+X4mcfAxFACszFqpGHys2CboU=
X-Google-Smtp-Source: AGHT+IG41S3GsRonhNn16HOEl/Shw3ERiMiNQ/XobV2dvSf8q7K1S0aIINLP6AhncWSbg+xfu/0/Tw==
X-Received: by 2002:a05:600c:1c12:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-442d034f0d7mr20647505e9.29.1746695355354;
        Thu, 08 May 2025 02:09:15 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0cafsm19788993f8f.19.2025.05.08.02.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:09:14 -0700 (PDT)
Date: Thu, 8 May 2025 11:09:12 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
Message-ID: <prjmur3ih7kbf2hapdzp4vtbt5cd3coophsm24d2liykosvuda@nwxbvabp2m2m>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-6-thierry.reding@gmail.com>
 <b6d4f40d-9ad2-48c7-a5a1-55b2ebc4e21d@kernel.org>
 <apxlsl54wyigk7yovtrb2tadhhsad5ti7hdvueisjcdjzfk443@4q3fv6pjaac5>
 <f346c140-52f6-4209-b62e-53dfa2c8c7c4@kernel.org>
 <hitexxuelppvbdd3hyxf3qoncdizj6mvhiuhp63s7qpgkgqd6f@63xybk6n6dfn>
 <ca0680d6-f846-49af-8470-3fe10d4f8610@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2244kuj2qj42ob2v"
Content-Disposition: inline
In-Reply-To: <ca0680d6-f846-49af-8470-3fe10d4f8610@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_020917_099974_DA542519 
X-CRM114-Status: GOOD (  26.82  )
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


--2244kuj2qj42ob2v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 10:45:29AM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 10:02, Thierry Reding wrote:
> >>
> >>
> >>> how much more you'd like me to make it based on that. Do you expect me
> >>> to add the nvidia, prefix? In that case it would be inconsistent with
> >>> all of the 8 other Tegra MC includes that we have in that directory.
> >>
> >>
> >> Same story as for every other case, why this would be different? All of
> >> them - amlogic, mediatek, samsung, qcom, every soc - move to new style
> >> since some years, why this one should be different?
> >=20
> > Because we've used exactly this naming convention for more than a
> > decade. I get that it's nice to have consistency, but do you really want
> > me to go and churn all of these files just so we can add a vendor-prefix
> > and drop a redundant suffix?
> No, I want new files. Look:
> 1. Some time ago tegra-1.h was added.
> 2. Someone spotted that there was tegra-1.h, so added now tegra-2.h.
> 3. Now this is a pattern so of course next person, even if asked to use
> vendor prefix, will not, right? Because it would break the pattern. So
> we have tegra-3.h
> 4. tegra.4 - no vendor prefix, because you have already three cases.
> 5. You see where I am going?
>=20
> All of above - amlogic, mediatek, samsung, qcom - had decade of such
> convention. I asked to changed, they used the same argument as you
> ("decade") and then changed.
>=20
> Why this is different case than decade in amlogic, mediatek, samsung and
> qcom?

It's a matter of principle. One convention is as good as another. There
are no clear advantages of one over another. It's pointless and frankly
there are more important things than changing filenames that everybody
has been okay with for the last 10 years.

But then again, I guess you're the boss, and I'm not going to change
your mind, so renaming these files is what I'll go do.

Thierry

--2244kuj2qj42ob2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcdLgACgkQ3SOs138+
s6Hecw//a6tg8o5jcMdrG+ldzPKEF5pPQvK2ubj1X9EzTmzp1x6qUs75VFpMZUqo
mWDmGwcgEGmaYXKQy9nWEEgG2MC953NL1ErEXA9wi1+sgVTDkpqamBTVAcgl6bPs
QE3iStzAR+4Zu66o7Fxnecmz+V7mOa1vjFH4bhGyj7N1JktsTjA9bLaWYkVYmtjZ
2/A4TC53M4o9/UB9PN+9UFKxOgR4Flc9Nwd6uzsj5re2Jh06I/rPhUmDVtv9Bbd6
5ivOAzO+zNsukZtD2BI5gpM/jOeXXUXjbseXeVmT9E3LYWdMV3rfxWuBGWI2bDXE
3XMo2tBLeoDCBMGL6KmYnzhEWeeH5QWxLJDWMqMz0CgFPPoYdC0pq0nyD5VwIGlx
yfMvIZexKg7GviceW982pEzMINSSbjRWSlYJJ7HPB5SWccahac6dpGxI9oY91xAG
m14o9dX6KEDO1JfCzhj7GX7HbgKOMngI9scb5/7ufYw7UE2tI4PWCv4yIu5plYuW
IADBZCsh5pqIBo8eivFLv+vs+wAc7LLM2bAN0Q1cdrvDEHj+7hIYmDAFrHVix+5B
LZmzqVegE971iwGXfrtklVKVW7D0XRTu6utM8D6ZgcSmAB/sRk9PoDnlIjbR7j6A
Su5EjXum0fRALBLusADgQUBIJrfO1Dr0SWDyueSPk5L+meat4HM=
=sTYK
-----END PGP SIGNATURE-----

--2244kuj2qj42ob2v--

