Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75A4CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 18:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lp4vtffxigjSJ7RW/i4Jgv4QK66o94cv0dvcll4cQ/M=; b=AIC2dSFC5ZowPf/dShDWSx3p3Y
	37tQrz0U1NThhxXf/sC3Njplrk4P0hFEAIj4svLbhtn3pmoiVgc2qVhmji2jyxsnxVOYceh3NUqf7
	vm5RfebsYpXqYgbqFJPypC/LMkiqls+a8NLAuhoThesPKDQhfSAScZ3ZCay4Rs8K4OLlAVgkpSYtB
	YgK7DesF3dWpzis+6ZUtWuFUxfUsjQXOI/nO2YQNbyagla3cKfwfUwhkuJdy5I5xhuJPw4q2xDe9l
	owF7PmpaX/tDyGcbAf3NuX0xSmEQyLkHIuRnmQ0IKGMo5n2hQqJ1GSl/ZZ7jy2vtjZSwCXrSmKjUo
	nfvsf7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2Gv-000000088z5-261Z;
	Fri, 29 May 2026 18:49:29 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2Gs-000000088yU-2CaK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 18:49:28 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45ed18d8a1bso2904741f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 11:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780080565; x=1780685365; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lp4vtffxigjSJ7RW/i4Jgv4QK66o94cv0dvcll4cQ/M=;
        b=LKeRhmpWJg5fBJs0nMUtr/1TyIoGP0Bm8ld6ymjwkiJgiHYHgiXGpI0cZcHPdkdPCl
         Bu7ow82e+I121pbSAmltw8NH/5Ce1jbmH7w1/z9TzZ4RcGX9mKGvlm1M6/DUt9mZUIrz
         FJhYapd0c+9EHW64G4xiJUQVV9fI8QaDde8/2q6cbgZ1Haeh9cOFM6B3hqpzpv2bfMSi
         gCP3gsQgGJNTBupwlHlgYIr9aL4pHI/HFS02zEaGfEtXktyOtAbZLOJ8LH4o7174b2Px
         JBXDsgScbxu6QPbzYScBfNlGV4+nqia5YWTFb3xXDweCRC8xqofiag3iufBdPTW2SJAD
         45jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780080565; x=1780685365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lp4vtffxigjSJ7RW/i4Jgv4QK66o94cv0dvcll4cQ/M=;
        b=jDrdg1QrX1SSnpaaxbuXvd4VkgVEfNaaZ7eJDZ4oJhebjAcpBOXySL+IvfXVdA31w2
         vviAlxw9q6UZp1D1DH9CExT17JXWfgPVS5RexsZcp7LYmUK0TI9jyMeiY3BbpjNmITSj
         5BIH/QHr9ulihRqruCCa5c4sAAuGeDBUWtwJCTBYKvEXyploYasIWNuLqtnewkuiQkdR
         MsZ2KSJlFxAP6M8gKoM6Q3ej46wX1cM78bCosivx8zBcKd6UkrI7U5VXEJPEH+UsJBUm
         q3oE/4sR1dU0847AQgFNNjtcMnx6kw7E0KNwRzx+PVzjugdL7l31T0dsSnAXTzY1I9jw
         Vwcw==
X-Forwarded-Encrypted: i=1; AFNElJ9L7HJEmT1hwLjgDeg4LqD+Z/ZT89hoq5/nhdsIqb+dPwJ/78K17QfOfRXCFCuLkIuHySZ5lLEjqScT2jGfWDJQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzgxJZ9d1vF+szJwu9wlUbRUzJETnTpoQUkq/esZRSSMHOZJ3Ec
	mDpCRNGuh3GMbvcF01UklKU8Zkjb+nPZT6JRBeMP7XHOaIO1mRjneVRmyaq4BIaHyAk=
X-Gm-Gg: Acq92OGI+RApm7+nd+35F1mlN8hxp3mcMgGqgcwJpScpP6jqgr1SnzGm4uZF7iDNLgk
	95/hpBzqCKbCSdozY18MDfcHU9Uv8DJ+6SQdJT6HZbFIvDu9HqmpTE1gdC1w0XtPLM1Gxr4agno
	9HXxlUSx78HC9r1UdTuEZTkJlQdXihiedBY7LG8N9qzuncCgnCGTFU2zyXobaNTl5mP2cqb5Ajw
	W1ECwZRF+OH61JolIDrcS/xZKEEdjgyNhj7anxD4u+02cUBeoGtuwXZS/oInfhpcWDkY/UbyF1K
	1KK28K00ulmHSq4LZgc1F3nnmJKaHlumD8vf5SFNY2X8bwsd5uMzT8bsbBAJWcvWfK84rPf8jVG
	/JLMLIrkOSoxbb3icv+hc/lphiZd1TtK3yjbZHtt3AM4Z1bQuIBJtk+IsnVAuwC9ezoH1YOtd4T
	zyrxaX/vRhoHgin/q5i8CrxWielrTd5GebXaoY2T8=
X-Received: by 2002:adf:e609:0:b0:43e:aa88:f1a1 with SMTP id ffacd0b85a97d-45ef6b92502mr1248001f8f.30.1780080564532;
        Fri, 29 May 2026 11:49:24 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef34b47eesm6096276f8f.9.2026.05.29.11.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 11:49:23 -0700 (PDT)
Date: Fri, 29 May 2026 20:49:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Andreas Kemnade <andreas@kemnade.info>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Amit Sunil Dhamne <amitsd@google.com>, Samuel Kayode <samkay014@gmail.com>, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
Message-ID: <ahnev6lMK5tiUybP@monoceros>
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
 <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
 <DIV4J6UGUQGG.28KL8EGBZWJSJ@ubuntu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pzwfvojoqum2whq2"
Content-Disposition: inline
In-Reply-To: <DIV4J6UGUQGG.28KL8EGBZWJSJ@ubuntu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_114926_891911_B159202F 
X-CRM114-Status: GOOD (  13.20  )
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


--pzwfvojoqum2whq2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
MIME-Version: 1.0

Hello Joshua,

On Fri, May 29, 2026 at 07:29:08AM -0400, Joshua Peisach wrote:
> For macsmc-power,
>=20
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>

Thanks!

> (I'm not sure if one can "Review-by" a specific section of a singular
> patch, but also the other changes in the patch look fine to me, so
> consider it reviewed as well.)

I think what you did is quite usual. The restriction doesn't make it
into git history this way though. Another usual idiom that can be found
often in git-log is:

Reviewed-by_ Joshua Peisach <jpeisach@ubuntu.com> # macsmc-power

(intentionally added did s/:/_/ to not make tools pick up this line).

Best regards
Uwe


--pzwfvojoqum2whq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoZ368ACgkQj4D7WH0S
/k7D9wf+K/Kbjth006e5cY3RbjoS8K9jW3NQ01G+VBxY+lHExj1dG+49FF1HI8kt
qfulP3y/YdWSh2JA4Iu/NK5mHfXtx3IWR9T8IuNyDfXpEJECZipp2WG77R9slfko
t4zpckQ+iaOMoUDYB7CB93ltVHaeYHp3Y079Vm1cylL5z2/tessr8YqNr+o5lP/l
c/36Uyh8+f0J9Vm+OEsK5r4lyPA9YxyotfCCx4qbxxAjgGbQUW+rj6MZgm5AGfmK
rcXLESM1abNV6atU3liVQQQhtTPw4t6YXGDZVfGZbyMLtuZTrVZKCQF24odWnbJ6
juiDjaO5lCkS75qD+EK1IeT4tTF/hw==
=+SnX
-----END PGP SIGNATURE-----

--pzwfvojoqum2whq2--

