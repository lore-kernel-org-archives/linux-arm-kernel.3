Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8950DC71141
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 10:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xl9Kz303AHWCJmJ1utR89kK9BbAzW0U5PoVQajnmYEE=; b=DYOsXBsrVqLeFype33Mf7WTwGl
	8OEMYVatYwkX79W2jJOhtBFJnaZxMN4JtGARIOnCqyXG5DDjwOEiCVkRF/PxFqUu8XPyAaDE1qaQN
	6Zs/N2p+K/c617rKCm5Ens9z9igNDknvTCdaLJMshXOL62I+EhOIG3uTw+l9f8EnO/Hy0Tk248B8p
	+bnjHw7UVqw0R6slcOJp7XV1NjqZ2lnxrqlVftwjPR5U4wtwqVrfSv7ghnQGRRbCJXWMVGfPo37lr
	tNU4E78NVeiibOXDJFNyrP50spRN4N9+GpGelpvhE+KOhkCYLFmh923E6S9E9Ui2dTDV8U+Fs+nv7
	iN8qINbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfWc-0000000D3id-2JTe;
	Thu, 12 Jun 2025 10:51:14 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPeXG-0000000CrcL-0Hq4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 09:47:51 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-235e1d4cba0so6916795ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749721669; x=1750326469; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xl9Kz303AHWCJmJ1utR89kK9BbAzW0U5PoVQajnmYEE=;
        b=MVZ3MBb1OdcaSE4KJAPSNFTQI+9SPN5Fi70Ha/AvztjRtp6dd0IUZ9/hBd8ivjRgfT
         ZNjeVt7SYmtqVyjyxiQsoBDJMpkPzjmwKJEnZqU+hYbte0FEcsSX4Y94PAwl6CgLLFpn
         V/Wz7p29u/2iaUnQcSPHivh7YYSuZwQvQ446+zWEjE/R7QEaQqVot7hje97tt7xorI+M
         iSn3qbkycl/X86yHkr724aaEVQo/R5tZKAFsN8iZGSp65jM4DxFpk6aWklBb2GnP/PrM
         wHIOIFpf0mf5ps/YQ/860+cmsFfVC7ltNwkxo9D+StHVpfKwKIj55rG+Y2cyrfCh4wC3
         P+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749721669; x=1750326469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xl9Kz303AHWCJmJ1utR89kK9BbAzW0U5PoVQajnmYEE=;
        b=S71Zqi60Tbj9grMMWUffmd3PVKk4K/U25hQZM3EVbFo+l7Vnld002viW4lNNeb2OoS
         eGPuAE/W5uYVWYmG6+8xpH3X3HpeOXNCOkyDcHb3YXkHvu0Cvi88Tx3JyaUcY2s0KF4g
         juD1gkqgWJYRXaVwfy+kX2NX33O8jmYXoEIjRU5RfURKXBsyrGlDwGUba5qd6rCQvGfQ
         +NMWItOe5wjQ8hPqhbinRxULeIPxb1s9bmwdcMMbDjjA+vvTsYN2xt5z+RDk/iT4A9bE
         LjNJXb8rTbfSgFKGK0rtjQKZJwd5QosMiwWBXeXDrZwXA5RfsuDSVQJTYhqH7Klv9paa
         bgkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZofj4WSWiMPv2gNYTDFN+3W5qOO4cfqfBWVKjFSHL6CPT4YbodxUr4VV3ZdReLI2xpgl0ps441NhnAeSomOrF@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb5dGzvOJShCpFx0UyZM2ztKskKZoPPusHuGBHF3P+/3XjagN1
	ZlxS6T+957InPirTveajTttjL7emBN6XH68DSR/lT9nLpoZ0UCN/s9OJ
X-Gm-Gg: ASbGnctPvKpzGdjOUkQj8XrkQYp/7p+6vEAz78Xf2th0k+aZpqHd11EiJLS/ljP8vCn
	Wyr6hi656z+W0MR+Pf7slP88Uokyg7ZwFOfymzWwmku2gKBRIUKSkaf8jubOp3B5+5u6DifzzkX
	i5T0wOAIBbF3QXhq3jSD6BsDee5iAIGciS8ZfU8zbCsnD5NKwOJylRwmP/ZjFjhzFjHkEFRldG+
	DmTN34zreySWjWZdRoFvqodGpRwQtstIcwPPvClNWtLW+ZkoTxaqZH4P+UU/PB7dhmQeinuLXku
	XM+q1G2rX8PQuyZ1b0CVCY464rqV04p80Z3rx9bkAjJuW6qWgoBER/6rsk8Neg==
X-Google-Smtp-Source: AGHT+IHhLvngJtDRD+nYjK9Btm6MhDv0YP4D2zr7z7HuxF1XD76CH+/kMW6iFysL+jWx2aXWWVzh5w==
X-Received: by 2002:a17:902:f612:b0:235:f55d:99cc with SMTP id d9443c01a7336-2364d62da39mr36075835ad.2.1749721668549;
        Thu, 12 Jun 2025 02:47:48 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd613d81dsm966545a12.25.2025.06.12.02.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:47:47 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B44D44241817; Thu, 12 Jun 2025 16:47:44 +0700 (WIB)
Date: Thu, 12 Jun 2025 16:47:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v17 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Message-ID: <aEqiQEMpbekiG6Hn@archie.me>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
 <20250426-imx-se-if-v17-1-0c85155a50d1@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oH2YG5RUiU+HONaV"
Content-Disposition: inline
In-Reply-To: <20250426-imx-se-if-v17-1-0c85155a50d1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_024750_105612_1E02E961 
X-CRM114-Status: GOOD (  11.51  )
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


--oH2YG5RUiU+HONaV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 26, 2025 at 12:31:32AM +0530, Pankaj Gupta wrote:
> +Each 'se-if' comprise of twp layers:
> +- (C_DEV Layer) User-Space software-access interface.
> +- (Service Layer) OS-level software-access interface.
> +
> +   +--------------------------------------------+
> +   |            Character Device(C_DEV)         |
> +   |                                            |
> +   |   +---------+ +---------+     +---------+  |
> +   |   | misc #1 | | misc #2 | ... | misc #n |  |
> +   |   |  dev    | |  dev    |     | dev     |  |
> +   |   +---------+ +---------+     +---------+  |
> +   |        +-------------------------+         |
> +   |        | Misc. Dev Synchr. Logic |         |
> +   |        +-------------------------+         |
> +   |                                            |
> +   +--------------------------------------------+
> +
> +   +--------------------------------------------+
> +   |               Service Layer                |
> +   |                                            |
> +   |      +-----------------------------+       |
> +   |      | Message Serialization Logic |       |
> +   |      +-----------------------------+       |
> +   |          +---------------+                 |
> +   |          |  imx-mailbox  |                 |
> +   |          |   mailbox.c   |                 |
> +   |          +---------------+                 |
> +   |                                            |
> +   +--------------------------------------------+
> +
> <snipped>
> +
> +  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
> +
> +                                Non-Secure               +   Secure
> +                                                         |
> +                                                         |
> +                  +---------+      +-------------+       |
> +                  | se_fw.c +<---->+imx-mailbox.c|       |
> +                  |         |      |  mailbox.c  +<-->+------+    +-----=
-+
> +                  +---+-----+      +-------------+    | MU X +<-->+ ELE |
> +                      |                               +------+    +-----=
-+
> +                      +----------------+                 |
> +                      |                |                 |
> +                      v                v                 |
> +                  logical           logical              |
> +                  receiver          waiter               |
> +                     +                 +                 |
> +                     |                 |                 |
> +                     |                 |                 |
> +                     |            +----+------+          |
> +                     |            |           |          |
> +                     |            |           |          |
> +              device_ctx     device_ctx     device_ctx   |
> +                                                         |
> +                User 0        User 1       User Y        |
> +                +------+      +------+     +------+      |
> +                |misc.c|      |misc.c|     |misc.c|      |
> + kernel space   +------+      +------+     +------+      |
> +                                                         |
> + +------------------------------------------------------ |
> +                    |             |           |          |
> + userspace     /dev/ele_muXch0    |           |          |
> +                          /dev/ele_muXch1     |          |
> +                                        /dev/ele_muXchY  |
> +                                                         |
> +

Wrap both diagrams above in literal code block (use double-colon).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--oH2YG5RUiU+HONaV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEqiOAAKCRD2uYlJVVFO
ozyXAP0aBRO1KFa+AGM5cBvWcVeY8OuEyqTxzHKI/v6k+zKsNQEAvGxANofk/mBi
s+wj3u05E/Xgxa9C5b23RBYacSQLLAE=
=SdFq
-----END PGP SIGNATURE-----

--oH2YG5RUiU+HONaV--

