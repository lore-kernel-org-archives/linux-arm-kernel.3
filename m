Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA51CC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 13:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmhwOnsyr4ClUyrLPc+K6s28iWciaHYVAbVXM4qvulg=; b=BxjlsTRUKEjjgG7djgN9NA+Us3
	MMKRwIqnR05F/lSTnBuKnHPqLKivuc282i2pUvyUzd/DdMJGnAIIvW5TXEIBe3j/cGA6lYVEu/x1+
	dV6KomiHYdu9uFrAN0chmomzKbZaH46IHBhqSv/H5dNe/8kJzkG9c8FJgTqgmvZphbEFt7jHfy9bx
	8Ajbf4dyTJ0JSIedIStpqzMzTnatDk2vEWygsjdCYjg6VVX1849dWjMb7IWJxvPaEV85qE3VNBVI3
	xZYNM2+yU7WKbDArnmh3Gwwd8lcbCbEitYWsAaiyZWm59Q5AEifMh4fOrZp0wpsL6CRRM6O3bNAnn
	OwP092HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl5SV-000000048go-20tg;
	Sat, 18 Jul 2026 13:52:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl5SE-000000048fh-2za6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 13:52:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4953ddae026so27027205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784382703; x=1784987503; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NmhwOnsyr4ClUyrLPc+K6s28iWciaHYVAbVXM4qvulg=;
        b=Igsu7TLHUWZO1zeqbVqmpBGzFPDjmPolLcRD0aeWn8LXsmdLev+GSMJQZ8KFYkX/YF
         IBhTr0zUBqKNtoGvhGpq/ya1HyNsniLh9YvTAqXWj9s/1OwEPMML4gSZIkWd8syBlcWu
         lvTax3qGO2WKJr0y5RYzYN+TPkFAyS2Laa4HxVRZO214KIvg2eIQkYxC6dULgw8lS1kD
         JW5+Ujayqe3yEt8edhvs3PwQWv8+5jbKVe8L/JZDSuiQ3o8RxefdjrZuZYuJ50SM0E+e
         6/2QfEo9dpW4uqbhpr2nZF53vNFaOcA1UJXBEFSnyibr+RQWm4EvZXjt4yMLYXvOZAPV
         Pnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784382703; x=1784987503;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NmhwOnsyr4ClUyrLPc+K6s28iWciaHYVAbVXM4qvulg=;
        b=hl3QQcHFouvXALxpp3fdbScNJncw23Buh8hHOAkbkaxJ2g5s0i+YGd5iClf5cJQvSb
         Whdyd2t00OZrS/q9zX86KWjYjeRGmVOfSDFbHgkgzxji9wrwBk2cXJnrnJeeJnFk+Aao
         Z+q+mIzzlZil+aVDjfzjp+mDIKRw+Hb0TYiGL/zuYpPBiMF+c9/1EJYGl3qFQn57hvx6
         pWZ4VsfCi9BUGXoOz6BBTzxVTthDfDe8kuSjf2oDQrui0chW/FmF+NTHzyrWCWyf2ltV
         KiKRXPQVpnA/hT/ZuSbU8sSfTkSwmTyrjqr4JVlqPnyxc63GCkbZh2SVl24P8nde7Wvv
         RxTQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWdexTooz85ZEZzX6kurh+S9iEnwOhRoQgPYoQXln26ltUumLzkaZFNQGeI/+whZC8l/lIokNLFjy37EFrnTuL@lists.infradead.org
X-Gm-Message-State: AOJu0YziMT/Cs8QLinMwn8M2/XdwE+ig6aFnU/t7D+4ekXvHQfT6tDXz
	D2ignFEh6TJcRhspfl4FBrf4SjiSVkZh4wyZ19k26SeubxusOeHrIvDl+V+ZnyyUWXE=
X-Gm-Gg: AfdE7claUEyAmFDdOof3tE8aLB3vTmB2HCbpLVKZa68kcaHOW2kHDBHUOl68i90AIDb
	fDsqRPwsukX1nwnJstcZ2sgdCcrKhML530/H77ncivJ4ATDTsdMsn/2sc72Q9Kg5MJFiZY7SWcX
	fxV5Rffjmaw9nWeRYhDlJcMRJJrfPdS0+kMFBP3Xbwumk+amagdesS/mfbJJe/JK/x95x5hVIOg
	FH+GY3beoKlN0TCRCtbqQMS4Wj7n129zlaIBGhVw03PN2wWtpGRmqdHtlSG5uiT00iicLvk8xsQ
	uieKPYB6ON2lG3M5XczFCjNlO5JnidbsaSdglcZOTVK6mnGuom4zEWF+du0RZUHTAYyclezxDfK
	TWeVdRAqt53Dl3EhmsEBVDQcS2I6vLuRNayFyPrMxa4+ZXU8yTcxeaBO/JDuRdYxrF4/2QDtzrD
	bUlnezI6U=
X-Received: by 2002:a05:600c:5882:b0:495:441a:39d2 with SMTP id 5b1f17b1804b1-4954a402f2amr56064715e9.21.1784382702902;
        Sat, 18 Jul 2026 06:51:42 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49549a3e56fsm125239405e9.5.2026.07.18.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:51:42 -0700 (PDT)
Date: Sat, 18 Jul 2026 15:51:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <aluEcXhBE-koqBaI@monoceros>
References: <20260716-axiado-ax3000-ax3005-saradc-v4-0-810527a9d27f@axiado.com>
 <20260716-axiado-ax3000-ax3005-saradc-v4-2-810527a9d27f@axiado.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yilug374dphh6m6v"
Content-Disposition: inline
In-Reply-To: <20260716-axiado-ax3000-ax3005-saradc-v4-2-810527a9d27f@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_065147_144949_9D01C0B4 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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


--yilug374dphh6m6v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 2/2] iio: adc: add Axiado SARADC driver
MIME-Version: 1.0

Hello,

On Thu, Jul 16, 2026 at 10:53:02PM -0700, Petar Stepanovic wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't explicitly include <linux/mod_devicetable.h>. I'm working
on removing that header and <linux/platform_device.h> already provides
of_device_id.

Best regards
Uwe

--yilug374dphh6m6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpbhOgACgkQj4D7WH0S
/k4LzwgAqUsEtKBg3XgyxAvu4y7B4B4jSS6/on1s515DyGFwKexOluTvela8r2+u
fCLS0KTyCMzgs/r2Ht9WdrF7m24uHy4nYmttIOwOdk5ChYfCDlyYorB8uXVdHW0q
FaJRUGcYXKQ55vSbfNmmAt3RVmQj922qyja4NHpVU5mg0H7ic0rQ1WXmD+g0irJW
wR+cDY78sJRZ8FmNkgjA4XxLu9i252uMG39NB6xQqgazs32SCfNZnVQAyGBBGAoE
+atUSsl8IEV7PQnT4oeAY5Dhh4p4AQ9r9MzUmWL7EPkIyO98GqOdl4vglsRKg2hg
Bea+oa/lxGKZOkoO+wuPkU0H1qdXrg==
=zIaY
-----END PGP SIGNATURE-----

--yilug374dphh6m6v--

