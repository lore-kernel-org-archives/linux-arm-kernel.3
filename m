Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB6FC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4P7GUp/MmoSYGvIOevuz861A5gtSjkC93eopwwOdts=; b=caykeIOLNQSj6cxzuq9hwcSLpA
	xdoud4PHGha9hD1aFoce9QR2VLo4WvHiXa7KvUQTKF9Tbipz8HAn1gsu2Z7/TeYqn+B9csFaPRpUD
	5U4k83zJRCrQrpZonWvvkzhD1ded4Cn2Hv4MLf76lPp/OxqKxtlLMmS3fHU6sLs8RYH/phcKktSsW
	sFbWzLy1lzHCzbz939sSTqlrCZd2mgHzbrBFZFMCd533lFQuaHcR+7hoEFgH8CqB3hkhVmyeUk8HX
	YwuFE5tlQ+viP8o6Bfua5SdvwCfphY/VgrhIIJZQIGveqlpOZjVT9jGepvp4YNe8x2liW2gompDJf
	rYQXeP4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwEm-000000003ll-460A;
	Thu, 08 May 2025 08:04:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwCq-000000003c4-0PW5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 08:02:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so4972725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 01:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746691330; x=1747296130; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w4P7GUp/MmoSYGvIOevuz861A5gtSjkC93eopwwOdts=;
        b=HRrmfSbKH0tWFji2YeN4AfDsU1yfc4xF9cxRyeWnmOIR0hIm7m6vPDSD7/CrsxMitK
         ncQKffd3khIPh8bR3pvJz0VnzI9cdMfh9g0Ifo8F25XaVQq82YW/FDgrFblYcSWp9o2T
         oL+PV4vMrpHOkh1qfyGOKKolt3+gtdxnBrZRITgjctlB7try43yeQZCGo0Rqwg1Sb3Kz
         B9gNN8QDdCXqcPFl3l5IsT04enFAWA8PnGpgX8ri5yB5DlDomAF1Hm8piAECXXRRfk/f
         Ac0azmpkKXruTjN7M2360m0HkwfWhPwy8vLTyh4Sa6B1y9oobfnh3CrJoUai78j+4/Q+
         PJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746691330; x=1747296130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4P7GUp/MmoSYGvIOevuz861A5gtSjkC93eopwwOdts=;
        b=AAPm/r1NRNRt900UCPRGmta+P9vo1K2Qv9rkyJw4EuTdaQJcjp+mZHd5QOl5rfN05K
         MIcMP7bxjQC6CzOiMsUu+lVLNo4QjEqbK5gWyKBixrwQuT25mdJ/QVRJCsdHiAvVPwD1
         Uh5bGxb2/XqSqb1aFPF9tkRLrryzygbKl9R/POe6p+rTgZaRraWPnvsMhmymDhiR9PeC
         +K+47U22eK899sKh/ibYNB5LoaWyWCLr83bvTMJiwA0fNCPj8dmLitYRGk2V0u2xq+Sw
         JzEnqWs0kJ1twxvEAvqRUXmG86g8NitRmg/eRPsDcbfZseQSWV7w19oZnrbyG6ZxCxrC
         HiFA==
X-Forwarded-Encrypted: i=1; AJvYcCWSS90rnbTG6wTqqMlIRBEr4BtncS+9KzoVm8hl7tp2impqIuy1KBnry2RTdzuMbsdSLEGMLLqtjq0JfuAzhd4s@lists.infradead.org
X-Gm-Message-State: AOJu0YyvQ1a+Mc+pO23NMFujmkMYYlHRXR2AsR9k69oZXw+fBNo4A1OK
	0XWqJi2ooYY6hERldbtx1WAoTtmQ/H2bUNBc10hHIR8d4LCRrLql
X-Gm-Gg: ASbGncsykVinjtAT4i2fGJUYswg7A1cMKF0iziCdsjHolfXPP05kcUWwFXeay2v8yX0
	ZZPHoSFXdmZYl0kfUbzKDhqE2wn3S1YbsYsxuXF7InYVXkw0wEcfuFkW4MN7Uukf2KU1fw7Gfd7
	51SjRST7ZFXT0vsqkkT9YohOLbGdPZZoZak9yT3PftxIbb85llfzJyWM/sYjdg+GGx7QqJ73XNC
	t99MPgOcLz8NecVOAxSxHrehS10Qu5dbZYzcRPDQzSkiZIbExWzrHN68lP0gyEkA+WQNZ/xm8Wz
	eyaSPnZ28jQKwmdkRFiJk06r8A4i2MeVBsil+amvNQBHat5cvtuhn3ycvFKPmW9jTpC81p5Big6
	TKkECMGKPXubryT20NvFfvAJnN/I=
X-Google-Smtp-Source: AGHT+IFlxePKQi6HEnSGaurdqKQsN2yyAvjgz+TUgP4f9rs+wkZwgrv9s5iq6PW2s9d4n/gu1XoG2Q==
X-Received: by 2002:a05:600c:1388:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-442d034b2b7mr11858745e9.28.1746691330469;
        Thu, 08 May 2025 01:02:10 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3285c7sm28119685e9.3.2025.05.08.01.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:02:09 -0700 (PDT)
Date: Thu, 8 May 2025 10:02:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
Message-ID: <hitexxuelppvbdd3hyxf3qoncdizj6mvhiuhp63s7qpgkgqd6f@63xybk6n6dfn>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-6-thierry.reding@gmail.com>
 <b6d4f40d-9ad2-48c7-a5a1-55b2ebc4e21d@kernel.org>
 <apxlsl54wyigk7yovtrb2tadhhsad5ti7hdvueisjcdjzfk443@4q3fv6pjaac5>
 <f346c140-52f6-4209-b62e-53dfa2c8c7c4@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uokfqxsit7nwu6f5"
Content-Disposition: inline
In-Reply-To: <f346c140-52f6-4209-b62e-53dfa2c8c7c4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_010212_137143_2DFE2BB9 
X-CRM114-Status: GOOD (  31.37  )
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


--uokfqxsit7nwu6f5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 09:37:27AM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 09:31, Thierry Reding wrote:
> > On Thu, May 08, 2025 at 07:48:22AM +0200, Krzysztof Kozlowski wrote:
> >> On 07/05/2025 16:37, Thierry Reding wrote:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> This doesn't currently contain any stream ID or memory client ID
> >>> definitions, but they will be added in subsquent patches.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>
> >> <form letter>
> >> Please use scripts/get_maintainers.pl to get a list of necessary people
> >> and lists to CC (and consider --no-git-fallback argument, so you will
> >> not CC people just because they made one commit years ago). It might
> >> happen, that command when run on an older kernel, gives you outdated
> >> entries. Therefore please be sure you base your patches on recent Linux
> >> kernel.
> >>
> >> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> >> people, so fix your workflow. Tools might also fail if you work on some
> >> ancient tree (don't, instead use mainline) or work on fork of kernel
> >> (don't, instead use mainline). Just use b4 and everything should be
> >> fine, although remember about `b4 prep --auto-to-cc` if you added new
> >> patches to the patchset.
> >> </form letter>
> >=20
> > get_maintainers.pl lists 13 people and 7 lists. That's *way* too many
> > recipients for something as trivial as this series, in my opinion, so I
> > tend to curate the list of recipients manually. I guess I went a bit
> > overboard and should've at least listed all DT maintainers explicitly.
>=20
>=20
> Usually that's a sign you combine too many subsystems into one patchset,
> so the solution is to split, not remove maintainers/lists from CC.

This is literally only DT bindings, includes and DT files. These can't
be split apart any further without causing other objections.

>=20
> >=20
> >>> ---
> >>>  include/dt-bindings/memory/tegra264-mc.h | 13 +++++++++++++
> >>
> >> Filename based on compatible.
> >=20
> > The compatible string for this is nvidia,tegra264-mc, so I don't know
>=20
>=20
> so nvidia,tegra264-mc.h
>=20
>=20
> > how much more you'd like me to make it based on that. Do you expect me
> > to add the nvidia, prefix? In that case it would be inconsistent with
> > all of the 8 other Tegra MC includes that we have in that directory.
>=20
>=20
> Same story as for every other case, why this would be different? All of
> them - amlogic, mediatek, samsung, qcom, every soc - move to new style
> since some years, why this one should be different?

Because we've used exactly this naming convention for more than a
decade. I get that it's nice to have consistency, but do you really want
me to go and churn all of these files just so we can add a vendor-prefix
and drop a redundant suffix?

Thierry

--uokfqxsit7nwu6f5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcZP8ACgkQ3SOs138+
s6HmwBAAsoRxhX8O9IY2rHF8lF9Rcg3IVjljdM/eVTB10iCxx6f7rrbRkSPu3TqJ
38j87L7XAyoyKvtj2YgHZZyl+yWQ08I6K+bOGQsDlnXwAI9JCRb8pFTd2L/bZXMu
iGbutScoOA3oUPU6x4jxlq6MP4dRYFLjHezt7J0GLdCgKFKL3nSbDGg1H0sAdD4I
dReJM05WczlF7dwRhLHBxU6GBLrmPMSosDwuW10E0sN5iLr3q9OkzhWW4qhW3NS9
hxigpZ8jwDEv1kjsuSP5buKtZJqAmvaOfEldSikN8taOe2cC3g1oJ47mnp0qAV7B
3AhEmdqDJRPzhuAFSJ5wutdjCr57iGPacYXQKzMlQa6twqpipbQEbK8UyH9MHURP
7yAhU7bvz3WKeu9NBjHNMnmIWyE8mdAQuc4TujI86Asy2ST6M5DPsYaQbBwtV8aq
eyKzCo0QzOlqfzE7tajKqN+HsZlCrH2imBCMXvBE76iykECTHMnYenq61ZlnsQYz
VLrBfmMvt639YkpGIpmZndBhknYArQGr2LwcyfxOYtRIX74ft6I5yOS/guG1sX52
f/386CC/9uIplxfRkJwli7I6vGd80g5eZHvFsF3zrUPDhpJ9gpZlIbwGxB3wYZP9
oNyujUfSx9hKg8NpWgDM4k4lyfhsv7VprUuekRrM45Do2KXYVx4=
=Ejv8
-----END PGP SIGNATURE-----

--uokfqxsit7nwu6f5--

