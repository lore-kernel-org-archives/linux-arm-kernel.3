Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CCDD73606
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOZ8Q6FCLQZ3WB4uirBqZt0cl8gviuEYocwvEcQ8h9Q=; b=28Kp84oafQai3GB5fgmXkPe8dz
	xezWrsSECmzny1a34gqrc2ErbvB6VEUjbMTb9WPle7TU6m8hEoDcY53BD1bAucGesxr0lMEQ4mQ+j
	w//sNop+gOTG9FHGT6UtN+T+8VldM9dqxsQdjX3QW7SYU8G1u5hOxfPHCfwswggag5hIo0n9H2i1X
	t6tA86wORlQVZhCHQu65v1mKH0uDyIvqYDOEPe69b87gugp6kZ2LnmzlQUPs3/SFyM4poxSRSaYDZ
	Xta96IoTx8FUVKA+Wd00c9o3XfjFJ7K4d6DLobNPJI98q+W2cJem5e0mvqqfJQS0OyScmev8QBkTL
	7W39areA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHRLK-00000002MXB-00N1;
	Sat, 30 Nov 2024 17:33:18 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHRKJ-00000002MO6-31fi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 17:32:17 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-434a10588f3so17864045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 09:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732987934; x=1733592734; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SOZ8Q6FCLQZ3WB4uirBqZt0cl8gviuEYocwvEcQ8h9Q=;
        b=oXf3CSGwJY093da0+Y5GH96vdF0qPBKhw9MSFHbaAQdKpnp/L6OeVtTD8gwc+hVwiq
         iJ9yv41u/rPql39i3RBjR7YB6WLJcRGkzIZw0H1SR4fYWSeRECuiwttCvDHj8J8iECoc
         3T/fevEyVDkBWOwKKC3x64fv2M9nz00Y3/9pDsOMlINDFIm+rYNulww0PFwcGQB3xoLh
         aPXTKUcQtPdVfZtIhKOyRs8JJUw6nlTsQNCjV4q2DurTgd7Awll8r+GQ7GsMDyaMo6Yo
         vASRNqY6ft7mD4enqIKrpYVugHfpg72p9qaLWLLuzAEYrUCwReflvfMvYqxC2FRh3K7A
         MsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732987934; x=1733592734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOZ8Q6FCLQZ3WB4uirBqZt0cl8gviuEYocwvEcQ8h9Q=;
        b=dxhawibtmCz1T8op1sozLgiUrXv3mOZhj5Pj50QzdpOfbDNT2ad9k1vt4R0i0cKE+T
         cy752u6lV4y1Ru+JnRyOdalxigl0jSonigigXtVR+N+GgXhSXpxw/AF9M1Lzlstzqpj3
         J8JnBGW2mRCqmfGnsHGrytdPhLDUVCRpC/rCHOl3UXUb3kFZ2kMtCXvSAxRpPMY4oKqS
         lhKVZRLLgCAjSaDKBSQht6CClAC5NZmFK2w46/W0Ik1ulhWOUW6mEsm03D7AtvYrvyrK
         NXQtFCVMIVGsfSYofIG2qWXOhn2VncI5fLT6ej64mk7yk3f6qfi4t6uqSoPrrc93afTy
         FS9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7H8YG1sHzMpDawLRulDzuV295Gb7xPI8MLvVqVBuC7rZeU2msRpQidlrw39TPKIRU6m5TxXWaNrI9tEbqovvW@lists.infradead.org
X-Gm-Message-State: AOJu0YyRa8yXgXKVPdSgW/A4vGmEgOp/NQvsXtNcVEtYX8tbR7SK/4eI
	SzBh12q5pDQ1/Oww95/cikTpSZT7gyFlm2YnvmG9Wkht2FpRyWMSZzqnP9xzCV10s7gPzT6pQRt
	naK4=
X-Gm-Gg: ASbGncs6BEX3H7s0+RC7iUQZAKGSWCK2Cc9E7QzfWiRb3JVxY7cMJDAtKaNC7OO72Xe
	Kvoxa5cVX0yo1xcs7G8m4N7f2eNozqHgxIQahuoHLeHfLuLtRYOCP63wQv2UX9uD/3RjfaRTelC
	szsnYnGz4A4n9Ebeg36DbmgJDpbHCX/u2K8tYo6AKPLMPLaccE2WuzKJvazwomMBxLgH9cEWytN
	7EKtN6umeGblOgFKI9dvBl2rcBWOwb/XjEKGzYB5N45BbQ9Id9C11I=
X-Google-Smtp-Source: AGHT+IHkiNAB4xfk4L8GFGwytdkeVXMn+VSFyRg3BFjeYjoj41UI5R3KwxhJ22bTQcmC/wDj50aFbQ==
X-Received: by 2002:a05:600c:1e1b:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-434a9de819fmr142732465e9.25.1732987933613;
        Sat, 30 Nov 2024 09:32:13 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bc5asm90941365e9.2.2024.11.30.09.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 09:32:13 -0800 (PST)
Date: Sat, 30 Nov 2024 18:32:11 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>
Cc: Alistar Popple <alistair@popple.id.au>, 
	Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	linux-fsi@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH] fsi: Switch back to struct platform_driver::remove()
Message-ID: <cu2d4ta3npruekvj52lzlcsyriqahczvhyeic2t2klu6jibeyr@mx4ximrkyxuh>
References: <20241130150530.901263-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dmhrlsx66b3dhebc"
Content-Disposition: inline
In-Reply-To: <20241130150530.901263-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_093216_021813_1B82FDF9 
X-CRM114-Status: UNSURE (   9.26  )
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


--dmhrlsx66b3dhebc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] fsi: Switch back to struct platform_driver::remove()
MIME-Version: 1.0

Hach,

$Subject ~= s/fsc/fsi/

fixed here in the hope to pass the manual mail filters :-) Please fixup
or ask for a resend.

Best regards
Uwe

--dmhrlsx66b3dhebc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdLTBgACgkQj4D7WH0S
/k67TggAsSJvBvjDhM2TdR6oa6ovyvoigzLEjNs743n0SIAq94K0b665RPc4ypHQ
YyEdaAHQjpPGB9GwiesBw1+c8M5Z8nS44tiouFWIG0LsQB1zO84zX09XaCWj3UiH
aTq3Ol+JgLUatPKRtr/YC6/HgC6djNe4KEjGt86kkhJKhdhWsRlHPzfG+MsvrHGo
6wMcfKDp+jd3GyaFDFoNeOVBZCWnm/WG0SaOTzHcUH5ow7o/uwWbUkx4N2lNPjOw
K7uRG7DQqJH4W0PqA47DOQs7a6oLOJ/l7WqocRaXrl0Fz8qgvHDv2Em0BhAwEprP
LnBbye9ub6R44IKfvsTps/681kFV7w==
=Rhqe
-----END PGP SIGNATURE-----

--dmhrlsx66b3dhebc--

