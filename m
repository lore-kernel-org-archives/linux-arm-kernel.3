Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C70BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unMncNq2brLx3SFqedtBHI7Svfe3aKAUdpwvabhKt5s=; b=G8N1TRrZeimBUFZzAt2B86wA2j
	OV63v1fkBBb1ozAxM3bXjb63lKke1GIG7oaQmTsJTN0bGF7wLnTgdzM9lu92sxV8d0mhU4R0BighH
	V+VE/mPReJFYl08lWW9tF7c5epNh/KEcb0yE3ivdMHbuKlIyZ9exy3m6XcOagrxNKBLcKhKscO1yu
	XczFE1CDthLzcaiROT50tETn35CaEOfVxYI4/RX6s5RmA41v6/GcYxMlSuQ2Th6TTvsPLYDHSy57T
	aQmhaFrWEHasCyCreWLTqNwa2xXtHRZ0/UUYVAKDnUSAVFh59/z0daKUg7bPqWKfhZpyHKoXieDYQ
	aan54Z0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z7I-0000000EgJp-0eHl;
	Thu, 24 Apr 2025 16:08:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7y8q-0000000ERxD-06Tq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 15:05:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4394a823036so11259545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 08:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745507130; x=1746111930; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=unMncNq2brLx3SFqedtBHI7Svfe3aKAUdpwvabhKt5s=;
        b=JDkp/JkEfkKqLXpjWlqs/qjjC8LXkyhLtaY2XovIfo/ZKAB3ceJtvFEA0N3nU8sLxg
         AJBqMjijhgpFr2fpbpKKuxQLzpTvEWJqu8VfWLkCKTHs1M2DXZEOq0WubML45UhKmn7+
         JKOvfFMYU3x4wawExK8gJ110TToRsTDwYJJVddqllFO0od4dKtyppsd3gigtVjH8ughB
         1q7Qb/IWUFUK/Ib5MMH47UINGbDRAjbAbvxZ1GiSkDWNfq8Mo5rQi/UIesD9l6PWidJX
         mD3m7tUtOo9yGIucF2B8lGPSlRW0pEo4o7ixD3WEJ90G8AcfyawvkWUhv+617irCX6kG
         FbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745507130; x=1746111930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unMncNq2brLx3SFqedtBHI7Svfe3aKAUdpwvabhKt5s=;
        b=II8dAQNryTw6D0iL3UJeqZjp0UOZN098a0JBNbGLzKLU2lp0HqMmQDRI2zTVZwPwWU
         vaN5rMXOSRqpveBp1Temznz7fMeP7xS1auc6rfCUW1WE98n/hNSL1XKCDksclw1AljCm
         uJJhqGMT13/qpndbJroDS2NqmCmndNQB9lb+Z+CVWgzCQVM9iMmJ8c48Jl+ZUqHRmTIU
         YPU+bd5cvb9T6HtmI9nnHInZF6egyJ1Zt+3eBb/0zsmNFjBoAm1FJBYq2paJLt/qOBpJ
         QB/4lw8a1l//mOD88Rxbq92UaosH3FwhPniDcwHiQw9eYhIkHqMs/c27322QPntHvUjP
         3j5w==
X-Forwarded-Encrypted: i=1; AJvYcCVHDVsBAiJerso1beWbtXf5lpjVtcNpCrl3CVoFkKbaDhCdffoVBn0Mr05/5tgcT2+S6y7LWrb5NQhkldQdwZT5@lists.infradead.org
X-Gm-Message-State: AOJu0YyR0Zflar8zAL6zA47Rm97oF3BMDyJIJlMe/6D/S+WoguPVLPgX
	oXlh1rtCzfJ60gjL8BKx7iL1VNyfB7jquC6zbKmagneVKtWPN91ByzxUs1IthWo=
X-Gm-Gg: ASbGncslgbkHemY1yWMjcabwJ7JYTfDjTf4awmbdhCKB8tBXBCwOXINrQ6scObTE6Gg
	7hLb5J7KD61oKbjqiBaUELDWwRpAUu6AkZPkPLgj/NrrgqmmEqK49o8UNd95GvZttMy2qbAAiNU
	ZOoRXlQl4I1WthfRLEGOa3WbkEo5479IGoHJBuTT4svTjlx73VzfAM/PCMQLCY6x8awYYFvRvjf
	UUN8qPLgk4XD0aOMG1UGLs52WqDTeKIdbF9X74HWgncIYM1pxKQUWMiIb/199BgepD8xBtMXYaG
	6YfaSaJRojRCscUDlQ6JYNaYxLsrAGlzDnuPKYg0EPc3ELJLcD4Woy/Ii2Gt9Zuq8b3b6oaOvez
	+AVs48Jk=
X-Google-Smtp-Source: AGHT+IGZerVnzzo+3licesW6Rjehtmkd5CAagkG0LYgOKDQGkVRLoR8KgscNzd0tm4Vv9ry8z/vBqw==
X-Received: by 2002:a05:600c:698d:b0:43c:f332:7038 with SMTP id 5b1f17b1804b1-4409bd76f40mr21710945e9.21.1745507126313;
        Thu, 24 Apr 2025 08:05:26 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4408d8d191bsm63019605e9.1.2025.04.24.08.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:05:25 -0700 (PDT)
Date: Thu, 24 Apr 2025 17:05:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vladimir Zapolskiy <vz@mleia.com>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Purva Yeshi <purvayeshi550@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: lpc32xx: Add #pwm-cells property to the two
 SoC PWMs
Message-ID: <hbz3gikjqwuqmexzrxis43gmxcviiryihi7pdp3btdb3sopqi4@mssyr62bunxk>
References: <20250403104915.251303-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kubdbvpqoinlop4p"
Content-Disposition: inline
In-Reply-To: <20250403104915.251303-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_080532_261450_06CB988D 
X-CRM114-Status: GOOD (  16.12  )
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


--kubdbvpqoinlop4p
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: dts: lpc32xx: Add #pwm-cells property to the two
 SoC PWMs
MIME-Version: 1.0

Hello,

On Thu, Apr 03, 2025 at 12:49:14PM +0200, Uwe Kleine-K=F6nig wrote:
> If these PWMs are to be used, a #pwm-cells property is necessary. The
> right location for that is in the SoC's dtsi file to not make
> machine.dts files repeat the value for each usage. Currently the
> machines based on nxp/lpc/lpc32xx.dtsi don't make use of the PWMs, so
> there are no properties to drop there.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

I wonder if this patch is still on someone's radar. I didn't hear
anything back and it's not in next.

Best regards
Uwe

--kubdbvpqoinlop4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgKUzAACgkQj4D7WH0S
/k773QgAt0YvjENQdbx0qGBqEFrZ7A2MKIrQOmIzi5tHb4ZU5atUQjFVrspi85w7
8E9dp57nMgLABhMSLsq9jFfOCEConixxOGhnnQ3uw8wi04mFHmicB0DJTIMAbT9S
4VqYdC6GDtQXZfTjoSIYhas3c5n140j9rNEDYKvbmKfQye2cp6YifjKxeeWEF92M
vB/e9r4X//tv3o3ZqrgRYuAan8T6xF7XjxyqHieZ3JcP+ZD/MwRksBMMgQBMLXyE
uI1vrPLOKMiakQICU4pTT+JRR2+Kj0XufdXfAI+oz5GEiR8JwDDAl8XCdna6Vfjd
KRhgqVp9RXsYnuWiOjkkCa80mr/xqQ==
=nKWo
-----END PGP SIGNATURE-----

--kubdbvpqoinlop4p--

