Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B89CE8E8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bCYWtAOVAoz7K5tYQKyYohM0VdNcKN2It0cd1+edXw=; b=VEtMLgsXvDzJGizcrR1wcCc0gn
	bP7ApU1pYB7oMW2M04A9Ti+rR8gGZt1/gxK5D5EjlAYBW1Ia8MZksvd0+JMzk9lomVc8ep4ocMF6K
	4DGzfQN43o9HRFZUmXHAJMSTuaXyW5hTLzkF2scQ7fIs22zp1gzzK9smemJ9xTUvXXFw70vxTtis+
	jmVq/clz6Tu+05ZPGWbVPXNRRR6pFhs4mqstt5mbU1oYJbRUi1pfwEd35+M0hSxfJWS6uPG7TVIAo
	3Av2trPmrwLorum0o8IbjTuWfFS+Kyb8qpKATK55Fq/jnm6UrByG1Aga8Lzmgs8eQc49ESCqscrOC
	WeLPs/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t403s-00000000z7F-0tH7;
	Thu, 24 Oct 2024 15:47:44 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zxM-00000000wzP-3szP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:41:02 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d51055097so762783f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 08:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729784459; x=1730389259; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0bCYWtAOVAoz7K5tYQKyYohM0VdNcKN2It0cd1+edXw=;
        b=p3VeoB3+EguDxdgYWFZzedXeN4hmo1lMNUO26bl9/7PJ1RDHnbDDYTdtnxfj9rsm4T
         15+rIuOKDP0YbpyozfFmk2aHVCj6OzTawyvCPOA8AW50vJ6Om3HMZTCDrKTGjNuiTlZ9
         LlA5zimtjZCsQxOF59mp77aRqVkIYf3ucp9fGkhbUvIMmec1epF+0spOXQyBmV7W/1ap
         6ykBIF3ZkaOVE0svWaF+Gnx8t6w1DzlQw2SXvzdonrsM+ATffmkw4zDvRmytjWCZ32jv
         wjH4186Rke39FpLKvhzCQsjX71c5svtHJFXmiiPXkeXKQ+CxcWqerYfPl098ebxLYtjW
         w2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729784459; x=1730389259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bCYWtAOVAoz7K5tYQKyYohM0VdNcKN2It0cd1+edXw=;
        b=Jw2cIz+7qgnJ6m+FP8f1oei9SAyqbczrFpL6QwJlNl7SzX0zNy0LvIKuIFU6KKRAmP
         yssMvT7kTSfgd1tSD0gJAlqCaf3/vaDV324QGOBKIeDfvZO6O0PpBjSvU2ApIuqtD3Sd
         Mlcfsujz8gJqHp2/60c0qZOVsdlQYqGNabw/ipjtKMM/uZTVbk/4jpcaH4SHlsOboLxX
         9Q8fVatKJkgC8hYw/19NMUwP5QVYNMLTqcT7vm3NGwgFWE1ZNk5z/eX2+IBj9DIfy1WU
         twVl70cC1qh/3KROeFABWmrWCYsxfCLz2+9W0Io0sVGi0AOcak9QdYOGEZI/88ACw3ir
         sFQA==
X-Forwarded-Encrypted: i=1; AJvYcCVHp8RfNtIwBaGmE2Oe+0dOd1y/Vevl5H0aEiiKSxtrQjBtnYY4tC7w0abyl83mU3QW5ZzF3CN5muIhNxa3bTs1@lists.infradead.org
X-Gm-Message-State: AOJu0YwR9jRFmRxQc/MqgVIQIFEtdH7HZXvsrsWNuBWp3ZcFpLHUnw6d
	cBsNAd6qiRu3ZznwpeVUvvGmPcQTNnEeeJebszOMbM8qjLBCO2Hhk3VGawiTs7U=
X-Google-Smtp-Source: AGHT+IERp2/eNZzsX4yv8fUUuhjp6KA5+OA5MDnyg6uPYvR/RwNU6G6ctkdJPcWzcvsaqhcAR5Qg3w==
X-Received: by 2002:adf:f7cb:0:b0:37d:461d:b1ea with SMTP id ffacd0b85a97d-37efcf898d0mr4107198f8f.48.1729784458868;
        Thu, 24 Oct 2024 08:40:58 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a64dc1sm11574470f8f.65.2024.10.24.08.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 08:40:58 -0700 (PDT)
Date: Thu, 24 Oct 2024 17:40:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH v1 0/2] Enable WDT reload feature
Message-ID: <nm4ckxv6swajr6hnqlkq5uoo6ncjzlg6yfxroftat6dubiefyi@xbhi4dvqacxm>
References: <20241024071548.3370363-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a7vvl5mbgvv3nbps"
Content-Disposition: inline
In-Reply-To: <20241024071548.3370363-1-billy_tsai@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_084100_991161_C6E255ED 
X-CRM114-Status: GOOD (  12.30  )
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


--a7vvl5mbgvv3nbps
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/2] Enable WDT reload feature
MIME-Version: 1.0

Hello,

On Thu, Oct 24, 2024 at 03:15:46PM +0800, Billy Tsai wrote:
> Aspeed PWM controller has the WDT reload feature, which changes the duty
> cycle to a preprogrammed value after a WDT/EXTRST#.
>=20
> Billy Tsai (2):
>   hwmon: (aspeed-g6-pwm-tacho): Extend the #pwm-cells to 4
>   hwmon: (aspeed-g6-pwm-tacho): Support the WDT reload

Huh, I'm not convinced that extending #pwm-cells for that feature is a
good idea. Unless I'm missing something none of the other supported PWM
chips can do that, so I hesitate to change a standard for it. I suggest
to make this a separate property instead.

Best regards
Uwe

--a7vvl5mbgvv3nbps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcaaoUACgkQj4D7WH0S
/k7IrAgArevIMEswllDmtB0TRJ5jEVNA4EsDQ9gZpjcVMdMbOCk91dxWPNaRWLqz
ZUO6YMK+BjGJDbYkAI1x0i73kN3YXUSAxcAAAiKeltHm3LgGqmJgNYFSGiGfyWfr
RZTNj7fkFkLBIJvsuuTV3JpVFuYpd0Sb9kWnsClMTwGoY8macjZEJU9E7syerxE4
soEUTZpYo8Rnj7qAIoBQJaj8R8wjlpzlT2Mge6xQ+DefHx4fCKuACjtmR+wzQVuq
4EE/51+wMfTDdzk2ZTjJwjYHQYTSGHoNSUhgBxtSqve5A8Onb4NRidJbXj2Hk51x
GC8JYGqYPWON7jZmu5rUFjw8yD+kLw==
=TvtQ
-----END PGP SIGNATURE-----

--a7vvl5mbgvv3nbps--

