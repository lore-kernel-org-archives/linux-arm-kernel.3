Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF634C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LMs9nwAbFqUimrlcZAU115LhNSVWWcRlkMoxh2fsVs=; b=IfaTj/dXVBH4v+tzUhptLDaxNV
	SUvLcedgvEQFmJERZ/4WcDO0YXxI8+3K6MUIksT7vR1LKqb++J1HyKqwoc7Iwlnx6QVVsoHDvw85t
	G+5a2J6HSvPiHOVBDrXrNiarmMbsQWE88mf1Zf5vs0m6M+6HNu7P2kcX2kQiOsp7p8jhSQ0JiPtvf
	uPmR0HB0PFj0FfAuF+VMxZKUVW5nnt72gIldbi6Q8UQVXB+yu011S7wC96QQAl5KFpAukxN3G5esM
	bipP6ueilNUREu4ntlvXUWK4aXz38Nn9lm75GZWvr2nSxGxFezSE0nr7vLMaJFRqOINIfZLFamOlr
	rq82DhoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRfT-00000008Eht-3GOn;
	Wed, 09 Jul 2025 10:04:47 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPkB-00000007sbV-0Htw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 08:01:33 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so1025941766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 01:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752048089; x=1752652889; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+LMs9nwAbFqUimrlcZAU115LhNSVWWcRlkMoxh2fsVs=;
        b=clzgCDRVjSAye2hj84pRAZ5ey8KPHojmZBqPbwCsM5qGPTKs/cPVs7IlHP1M9ymM/F
         u75jMfm0EWO+aI81vg0Kp+ZZpm+uEHCgDXM5XHnliiJvjnWh1xaiZikXn/GUKK5wbesL
         jnUqHbL4xIovfECQk98r9/qLICSkE+G8gqMYSIaBGUuCmJrGD1h8y1bjTdPgeLnWIJhM
         6yTy2FGowpAgf7L2c+7ZDwYqUZ3VVsSMxiLIah8B0Q8qy43dtMevE+PX5N0Q3viNp1F2
         RDxg6kT60R0rdtOvd9fycQ6EvOFO4MaiyDOZ4we2SpDq7ou8wkFA+I0pJhJb6A1xXOrk
         JtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752048089; x=1752652889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LMs9nwAbFqUimrlcZAU115LhNSVWWcRlkMoxh2fsVs=;
        b=JUHsPCoQZyY97bWeYSu+ofXlecB/C/WOGBYihbjyCIQwSqv5qFD4515lSCBZ7GRD0D
         pOHVgQpMiWqXNtXOjWvx3vDUXTljE8vhykgdxyIVQ5FCSutjFt5FR6nHt3R9EcyZ/W3F
         ENTvGk633YfU5vFXeqGv5YPKs/KrDMklUMd1Bkmbv7d5KEQyYYf2DGcMnKF6PU7rI0+c
         PIEl99XeUsPsJMIrN/PiR7YYmKbzW9wUGsxSH3ni7HdwOG+ru67Y0+RH+o6CUBUKr6d8
         Jq5hBrOUzW7u4NM45aYtnnpNPIpAYIg/NNapcZh6RKVwT9JOzBpoAllEpvi1iHRXtnut
         izEg==
X-Forwarded-Encrypted: i=1; AJvYcCUuQltmbOCJL1jEyxHa92tqv4moq6+6aPqotNS6YzHrardt/5/Aev1Q+2ptKmcMNVf3UhD1Z2KVYBWwCSZqxBju@lists.infradead.org
X-Gm-Message-State: AOJu0YwHfuae8J5JZpB+aNCTm56EncZgUOvQyK7t/WgcgPjI4ZmcVjw3
	go1Y1sJsYftf/FPepjaduqtHDcMKNqsHQWXlCHQO/UwDbnyg9fE7iPFbZGs3Y1cJefU=
X-Gm-Gg: ASbGncuvbCNN8gnCvlvO5Z/RYXtOoppY1af8Dm7rc+cg+2o/GkjvlStjqt2jvMCTN4Y
	m9/zarKtAaYpKc/qs9ZAuAW4GvhgWMM5tOKwpKDm1gj05CwoWuhF/Asr7b+BVtRgot4DZC/D6kc
	86Q+TXyFj5jSyfWyR0hFzNtCuPTnncJehMftivjE63f+8uRu2vydiHUuQ6rpTgMNgDPjmjaG1Tq
	UiODxcyNwtWzAtwKXSb/wKiJw9tVQyGpc5xiEyXNIC3j7QpZZ+klKCwSdbuvz4Zlo82scY27OEF
	tbaq660cNLPPKxNEPeyyIk34SplOU2Jp9VMfzfKCMtBFmXXFIVxcvI97TuARoBxFm+g=
X-Google-Smtp-Source: AGHT+IFBXOzd9iwnJcU6ys0n0tOScCaS96LTlgmk4/agHFWXi9OXbwsBntMcLQxbhIAYszAndNvzfg==
X-Received: by 2002:a17:907:874b:b0:ae6:c9b3:57cb with SMTP id a640c23a62f3a-ae6cf549b81mr155596066b.5.1752048089411;
        Wed, 09 Jul 2025 01:01:29 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae3f6b0336asm1061070766b.115.2025.07.09.01.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 01:01:28 -0700 (PDT)
Date: Wed, 9 Jul 2025 10:01:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] pwm: mediatek: Ensure to disable clocks in error path
Message-ID: <xkluxdj7ns3mxul7iadgd675t2yrztr5ywj73z3zimrpqpz5o3@foo6qpnmt7c5>
References: <20250704172728.626815-2-u.kleine-koenig@baylibre.com>
 <ad575b88-80c7-4301-96eb-b34d97c5d5fa@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nlx4gym6ltgwnmyd"
Content-Disposition: inline
In-Reply-To: <ad575b88-80c7-4301-96eb-b34d97c5d5fa@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_010131_249541_B65500F1 
X-CRM114-Status: GOOD (  15.47  )
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


--nlx4gym6ltgwnmyd
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: mediatek: Ensure to disable clocks in error path
MIME-Version: 1.0

Hello,

On Mon, Jul 07, 2025 at 11:33:00AM +0200, AngeloGioacchino Del Regno wrote:
> Il 04/07/25 19:27, Uwe Kleine-K=F6nig ha scritto:
> > After enabling the clocks each error path must disable the clocks again.
> > One of them failed to do so. Unify the error paths to use goto to make =
it
> > harder for future changes to add a similar bug.
> >=20
>=20
> I don't like gotos, but admittedly that's the cleanest option, so:
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

I somehow missed your mail before I sent the patch to Linus for
inclusion into 6.16-rc6. Anyhow it's very appreciated even when spotting
it only today! Thank you and sorry for not honoring that by adding your
tag to the commit.

Best regards
Uwe

--nlx4gym6ltgwnmyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhuIdQACgkQj4D7WH0S
/k4U5Qf/YSzRht495dMD2nqnQVOBbye9Zhk8OhgjT3q/FobP0sdpSL8jtIMYA997
ZBs2YOUYobAvfqlYRLI5GCpBr/3A0Vp8M1oeFb2IL5h7j9QjXHaQL8ZBHNUDZCcJ
Z4o7e6LnVrEnyokwK8NIrfi3VTtJCz3XuXp+f07bNuDLNtPT20dDD+VsHf1+qV9h
2FtzpRlVBXWqu5e9SyVPyjF/Rj2F0HkghPkEGrV+M0nRhMhFzZ92SKzpqzOAnEFg
EcG+foh9umzKYgSOgKEolj11hdHYp1k3Efl2CFRX+CpvP2T6FBr6zRZLiyL3LuNq
Arl5RRU8HtWOl8vMMNFO+D1Crq6r2Q==
=L+fW
-----END PGP SIGNATURE-----

--nlx4gym6ltgwnmyd--

