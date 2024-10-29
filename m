Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B964BD5B176
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 09:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+tIuf+pw7VgqaoFXTVPLLVE0V3c5Y1bGL0baofA3s8=; b=g0Qjg4vfe9qqz1JBqOBHDaU2ET
	QkCQL2kyGYJu50HWA5JZnl50hk77vJ+iD3EvdvnzD7E4jGHShURufqLy38TYqbF3ZEqLQZSGJ9JTh
	gmPDF70IcKBmxL17B28SlwjBqiApNVFtrE5Gc0UPT7lUYeuK+azI0Nd/fEeTZzyyqoB84xhqdPKdY
	IgI9+uCXWDiu2++0g3wQ8AAc3SQAh5atmvZ9ll49WEBlsDlYrwqLqJRz8+lr65RBpSVtQsg9GaTrz
	xjRH4n4fmqZvomrzLC7Vih8DuIUTQCN6kXVgv/b+urIvR/9UAeCnQLS05xhouMJ8s46A/YDHwh90Z
	xx9qzw0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iEr-0000000DpUu-13EX;
	Tue, 29 Oct 2024 09:10:09 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5i1M-0000000DmF6-1pxq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 08:56:14 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d4c482844so3487238f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 01:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730192170; x=1730796970; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q+tIuf+pw7VgqaoFXTVPLLVE0V3c5Y1bGL0baofA3s8=;
        b=U0/jA7OzWXpuXZrAGVwiqj5vkYQitd1RgN3soTSM5wruRiEuJE7db1a8frx6VCidVE
         yx2EcwQAx16mkxFk8paHzppWk2y/pFtSSpmfW6MEzD84cycjlhO1qwmqb1JtVhmWFuLA
         PX5l4EAnnnxvtyhNEkMskbjuFc8Wgaj+TKhGe4dSUASGrl4VPlDxFFgPKKGrWnlqLPyq
         mOAwx1Qc5rnc9BYSscnGxfepH8oPFy7IgFEnDPt/0IIuFAI9D2pbACKrSYfE65Ld4YaQ
         KQzFDJjx1ITPZ5t3HL8H9KtWAWsIciT00d1XuvXHqp3PCyiFZj0lyxgw6Xj4BtHtQE8O
         cwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730192170; x=1730796970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+tIuf+pw7VgqaoFXTVPLLVE0V3c5Y1bGL0baofA3s8=;
        b=KA1v5lsFAF/F7Oj7i9n7J1pOVjxokOgwUwnl0Xh39Y25aGqu07FTjnAMvIPjwHcdFC
         B8nOZ2qVrxVsErZOJlyRLocIP1zQUcP/gT5l9D7trkH7tkpwuRodYP1nQDrlp7rQXC0o
         bmxi4NgkB0BYlKdS1BzX7BcQkQNYXOz9E5sbTEN5RX/XIYALxTh6I1BMlrfeg3KyKJzO
         nm/edOjev0bYJ9I8s9a0xI3XcZgFnAT8P51xnm1AQ6RptN92d6eTA2qDuXNRDepaPreh
         7AK88LxGuyJ4vc/Jt8aFOck0fgj2MAmbBUTNkGUfoMRiMVeBF9kxVmYyEAvtoPNoeMwW
         xyQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW8Pz+33VDTj5RBYL8s+szT/KeRwU+hHbmC6FedvBihmpvX81zBUlCiZwXlvjACxbihNuAEZ/YwlH1uQtDV+wF@lists.infradead.org
X-Gm-Message-State: AOJu0Yzom8iewP3L9g+/M73YPJon02Rx1LpHIoS67tIa8RWRHYWYgS0P
	LRInoHKxpv1jyi+tuQ/56hQEO8kBCaVQSMjHcF7SYfAcnzEsauqq5ouyzTP43Dp1reIFQ/9vFLQ
	E
X-Google-Smtp-Source: AGHT+IEA5JJWXtQoHZ0PdS/MJdUSxxPT9oA+1aQ+m1nReUn2taETur8wxSZ4YWpYW5tyNcpUGNlwNg==
X-Received: by 2002:a05:6000:1f11:b0:37d:52d0:a59d with SMTP id ffacd0b85a97d-380610f2bd6mr7564818f8f.10.1730192170391;
        Tue, 29 Oct 2024 01:56:10 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b132fbsm11900069f8f.4.2024.10.29.01.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 01:56:09 -0700 (PDT)
Date: Tue, 29 Oct 2024 09:56:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Aleksandr Shubin <privatesub2@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <4ioz6f6efs2uhf5mitb4xhebqeryyz5ukple4fkn54wpqep3c4@4ktefld35c3s>
References: <20241011102751.153248-1-privatesub2@gmail.com>
 <20241011102751.153248-2-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ulmatopmaqdyrkp3"
Content-Disposition: inline
In-Reply-To: <20241011102751.153248-2-privatesub2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_015612_516107_1549CFBF 
X-CRM114-Status: GOOD (  12.76  )
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


--ulmatopmaqdyrkp3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v10 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
MIME-Version: 1.0

Hello,

On Fri, Oct 11, 2024 at 01:27:32PM +0300, Aleksandr Shubin wrote:
> +  allwinner,pwm-channels:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The number of PWM channels configured for this instance
> +    enum: [6, 9]

I wonder if the number of channels is a property common enough that we
can use "num-pwm-channels" here instead of a vendor specific property.
Or would you suggest a different name? gpio-controller nodes have
"ngpios", so maybe "npwms"?

A quick grep suggests we already have:

	fsl,pwm-number in mxs-pwm.yaml
	st,pwm-num-chan in pwm-st.txt
	snps,pwm-number in snps,dw-apb-timers-pwm2.yaml

As a follow up this could then be used by pwmchip_alloc() to determine
the number of channels if the passed npwm value is 0.

Best regards
Uwe

--ulmatopmaqdyrkp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcgoyUACgkQj4D7WH0S
/k4BJwf8DvGu76czyjVYmp+JyjZGGyzYFVym3ObWj8LAQZ7pr5F6O61BxMrIC/a4
RWe9joUnrwLy+UJgxerMNtgS1TgnCgb2r8VzdheUJcDwTjPBAPvaa8eOpybmRtSq
TxJcKF0qlT8bGtWZjRsx/UYKWLZUrrhgOt7CM0LY4kubCeDEwruXHZSy/FtuPvlM
STFxNDN8fT7KuaqVY7HYvYZw6tOROAwFaxQhMWUIWQIruQyF4+WJ2bVgBQM77bxK
OgE8BcqpFcCB2NU0qnyDXMqalDPYeh9necn8LrbQ0qXtE11vn5+bOlJvOHQhet8x
DYJfsCSOcurHrnvmYo50GYpNdoJUrA==
=2jh3
-----END PGP SIGNATURE-----

--ulmatopmaqdyrkp3--

