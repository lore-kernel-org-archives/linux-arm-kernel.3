Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05013C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSbZIZTtDLUKMqLM4SJXPxGgeFGM+l932pt1k5vRiOM=; b=1ePSafthprRLdALXJmcHuZseyL
	+BqnyER4hoBJ68LqIgu4BnEqj0AHD9M0hNyJUj28E59J4Wxago0NjqlVKEn2CEuF1IY5ve9YcTr+a
	xRLcdfHdwtXlVK2WOqzYcGfPv7t3QqhnWCPBlXvd2NC21d1KUTWemgJXHQJ+o+SachEKxc02QD7e6
	nG7qDmikSxQ3TyNHPkzcb3p9RZAqtimhLjf7JNExYuU0wiq7ZJlZnz5yq4ua1lSm2di5jJHiDE0Jn
	nhQTR6scI5Q7ny5kvB4XKGP3jWEWtEa+NZ1GJcI0+qIw7MDrdiV5s963sQIejxTtvDETTWofsOgau
	mAxwkmvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6Gh-00000004Q6b-0DEf;
	Fri, 10 Jul 2026 08:07:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6Gd-00000004Q5b-0sv0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 08:07:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4629051c9d1so376378f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 01:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783670845; x=1784275645; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSbZIZTtDLUKMqLM4SJXPxGgeFGM+l932pt1k5vRiOM=;
        b=pxrBHY9HQbfWo1OZtxQmpvKAiex7un5pTd6aYS2VW0G87iEgImhrAoZl1S8x1pGzjU
         r6Lye7bTomYOcpvq4i1vZABaizbdnbAtFrhxuf7KgX2kOn1yKNCyqtEe9ArGlpcgVXEm
         wP4Qk/VhmTAw3+3vRyQ6u1EYUcN70GU+JRN+yn6kYzcF+HNhAo3Vu59b07X0wu+B2XMU
         JjCZ9oP0Ksj3FNfaWPksAPG6EW36x8n1C9fGJju9JkX6vgQTCR1HvXC24Ba3Av6ZP1n+
         8teJEyk2aQLWWt6rpwnU2kqNbDdCrwaVAsAgUSXNPq4vOk6FMjYalTKLTrgpQdMtJpFg
         b7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670845; x=1784275645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSbZIZTtDLUKMqLM4SJXPxGgeFGM+l932pt1k5vRiOM=;
        b=jCnQD/ZK9gqmEInOllrGGNZPkOpIzLT8ycIfqCG8dDycNlLboaX2iNJLQuFGM6jlJe
         y6EwQAzAuapIyEsjxb0SYovbcJ+j99vZ3HYXwa8OVy1Tl0/6DEOmC7wNL9M4gL1pEp3p
         DPaj4GRs+VMl2WH9jflaeAiaJCk+DVAlrImoyMHXZKIHDXrwhmQVGdBESLgtvHh6/qES
         aIIVjcam8GM748nzdQuC02LrGFO/dgjWVzqrBHlD+lHKYj7jvC2BEO+H85OY6U0Dc79K
         yVRPYutwILzCgz8cfXk9GD4OeE6dCovUnu5EbgZCgtP5RoRBd2iBLrzPRsN+H39oEZwn
         BMgA==
X-Forwarded-Encrypted: i=1; AHgh+RoxB0OvODtgu9avg62MEczY92nit84UszD7S06n8ZmpFtK6Bpt8bzPyG2MmOxLhkqHqhnVEb/V31pW4RK/d8Myf@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ//2QlxbMCh1RlqNg+aAUT1gD5/h6KMmz+Lnhf4ja18gc+TUO
	m4zSLrHit9BGd4w2SyD8RtCV6opNP0TRttjJbHeY3FC1NO+JARf6OFekuX+wus07caI=
X-Gm-Gg: AfdE7cl3Vqbwk7yaPtAsM1sBbQTQqR//nYqHB6WW4GLhk4daA3mEzCD3ZKE+R0Fxbd4
	Zaq9br5e8AwJYldJrZ/PucQpQa8B7Xc0ztYxI1OhMojmMciQ8AbXbBAV9LQk/S8c38tF+B08dIt
	dFJ87Fdt9dbiD1+KRTqahea4zE4OpuxW8NVnXCMLuSu0roBhtCsm6c7yUAIgtzn6JLIstGgXhoW
	H4NCl/Xx8zpX8sinOlDYZ4o3gms2tN8N/TDtJbIw+uue2RgWfVkaxE7kda2EjBNWhv6qXDJQa5T
	ydV2WycnUgdFf9xXPaUne5cHrD9H52WDs3QmNm5X/Z2MhdwVG0CL74hwSIs2g6TIXf1XnY5h7LV
	DA8/RlTg5kSpuT2omtVg9npSVF8hyK84z8dPG0RkiAk7LM+vxg4hAEqwKja/afB5PW1RChEr4Rg
	1fFuWFwxGmQuxp8VT08FnRIeb55/PRZp6FHHQGLVE1fv6uSQb2vXKHo4dBkvnMS/2I4Pn/nJ71E
	KI9
X-Received: by 2002:a05:6000:2f81:b0:475:f0f0:9ed0 with SMTP id ffacd0b85a97d-47df081bb63mr11161402f8f.59.1783670845331;
        Fri, 10 Jul 2026 01:07:25 -0700 (PDT)
Received: from localhost (p200300f65f47db04fbea22a44ee9ba38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fbea:22a4:4ee9:ba38])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039bcdasm60375423f8f.21.2026.07.10.01.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 01:07:24 -0700 (PDT)
Date: Fri, 10 Jul 2026 10:07:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Lubomir Rintel <lkundrak@v3.sk>, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] pwm: pxa: Depend on OF and simplify accordingly
Message-ID: <alCn7yq5ltsRAP5j@monoceros>
References: <20260705083910.3502207-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5tb4hvlljts43piz"
Content-Disposition: inline
In-Reply-To: <20260705083910.3502207-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_010727_263227_05E84D90 
X-CRM114-Status: GOOD (  15.96  )
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


--5tb4hvlljts43piz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: pxa: Depend on OF and simplify accordingly
MIME-Version: 1.0

Hello,

On Sun, Jul 05, 2026 at 10:39:08AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The SoCs that this driver actually works on all imply OF already. (ARM
> selects USE_OF unless some archs are enabled that cannot be selected
> together with ARCH_PXA or ARCH_MMP, ARM64 and RISCV select OF.)
>=20
> With OF known to be enabled a few conditionals in the driver can be
> simplified.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
> Hello,
>=20
> while doing a treewide cleanup I wondered if these conditionals are
> relevant at all. A bit of research found they are not. We will get over
> losing compile coverage for COMPILE_TEST && !OF.

I applied this patch to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

for the next merge window.

Best regards
Uwe

--5tb4hvlljts43piz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQqDkACgkQj4D7WH0S
/k7m5Af9EqKXVKajJznf7LCaNjAtLjnYKXogyd5DJe9y4h12iiQ4E0L16zTpUquA
+d8H4y6WBqv5Sw/V1kHyXR4nva8Hjse/yb9oVj9PzSCs/bfseheHbPyKGgJ635V+
N0YEJAYFE9cyv9h1EFpkpJ0lr7jgjTfv/j/XGZ/jaX1o637SKwlYRu/UCVghyU9U
ddbPgQuE1VdQeFwHn71waBzEf1Pa4xboL1VKpqAxVJYl5YWYmyLhyG24Jy45VSzI
1RfIyMrMfBpcjhp7W74SmhrlceCWG4ihxmgGOOb+eDtQ8k2YRo9eT6Z1vc9efPFq
Pi3mXdk0vITyiipLDathqGOmy46Yuw==
=5MWJ
-----END PGP SIGNATURE-----

--5tb4hvlljts43piz--

