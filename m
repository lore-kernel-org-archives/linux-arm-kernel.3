Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EB8606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 19:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=El+tquDn;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=brOEXCv7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B17oc8WpndzlQmt4uZst9Vo/pqlNk6e5++M2mkaal6Q=; b=El+tquDnan3nad87MRMIeuAVWe
	5DcitZrOh2EI5tKvqfMxTiiYx+/cU16e9UV4k2uZQAbaRylEjj1wyyRLwXPB5AAa6uJ17dNKoXFfq
	EOg6zQ7Y/vyuBUREnFa9qsuXvDY5TsXVsxoHB5E/B6eBDdsxMZFPj5YNZQuNIcDdkQFIynYij3Tv9
	qg/92WizRfPVlml5NjUDs4FtuZi0u9epvRx9c+65uOdCb6A+dpk+PE14I/RCAJ+uLeU5akN9Bz5Nw
	OtjcqGaWkGD72jdD0SEkSiV/KHpkj5u0HrKR9cD62SAUzYa3jKZ1HDTNfxD2CYkZBiypBYbvcpirF
	Ty36QyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMW0V-0000000AG58-25IR;
	Thu, 29 Oct 2026 19:41:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMW0U-0000000AG4w-1YvK;
	Thu, 29 Oct 2026 19:41:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 88D1543ACF;
	Thu, 29 Oct 2026 19:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6161F01816;
	Thu, 29 Oct 2026 19:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793302909;
	bh=B17oc8WpndzlQmt4uZst9Vo/pqlNk6e5++M2mkaal6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=brOEXCv7ghTKpvSCrtN65OvP1JadGCZnR0AVm2KJBlxV0jnfcvm7n07hHq4Mch4PW
	 jeJTwdgTw83R/cVx2PB12wW7LD3/R2YQhRNIT0HCmely3WIOwYC6dk4tx9iQNVyHbg
	 qgRTxXF9mAHV48jYAQbxR3qgNwaieg8rz+bceWBFC4pjbvIH88oRy7QjmWMgyfVf4z
	 nssGbpdnDpBaA5bEaHABoRakiIFsG1msCoONk67sNi0kwAdX+8/Oq8Rr01h/hz++ST
	 LVooCNqdQZfm058k1ywEaJRDI3bLgvMnSi3vDRpbZOKDaljUABd0W0D/57Jb3FpHbw
	 USl/lW2gvgPug==
Date: Thu, 29 Oct 2026 19:41:40 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 09/18] dt-bindings: riscv: add Melon Pi V1 and V2
Message-ID: <20261029-repacking-pastor-380e92e1ce94@spud>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-9-74d58ce85bd8@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dsKkk7RTBz7aJOQa"
Content-Disposition: inline
In-Reply-To: <20261027-a210-scmi-v1-9-74d58ce85bd8@iscas.ac.cn>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--dsKkk7RTBz7aJOQa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--dsKkk7RTBz7aJOQa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOhdAAKCRB4tDGHoIJi
0uF7AQClUV/fqro5Tr5TDnC2Mpw74PScgpYqEc454b6R/ZRx7gEA+KLcCpIvyNI6
XIZZZW4Uf2sDbwWWSY6vEUwZk24bcQI=
=fYYP
-----END PGP SIGNATURE-----

--dsKkk7RTBz7aJOQa--

