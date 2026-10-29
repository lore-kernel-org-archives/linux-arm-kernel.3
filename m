Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8175A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 19:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2rWLqLrp;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VuzKxIaK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sxufEbmJccbPCMBIVWCkzuEvgvSqJww+j7Cv/utg30c=; b=2rWLqLrpNvks8Z+kKUFThHs9lH
	ZmMlIR4OxCWv+WZMRTVXi69dGXqo5gmpTApUpNT3qSlnj9kfRdYI5LuMx6xxNnZhel1fcwWQyLa/A
	uSLjMNu4+/gOVE5YGjNzQMbYdaaQg2Q3HxlQ38D8IiXzpx5532oifLlL/z7yjgbEWmq6C1mkViqAO
	nOPQZBiyCa+kMzOMGrngaJ1dhjyPswf11UFcEyaLIcEukNI79PD8Zsd/v/OglbI5GlyevNz/pLJZd
	bTmWSajkLJVjNvs5U6puidcMHgtPCzgwCwQaIjoO+vkwVBka2h/Y+TwClArW6rzfPtbQ02Rqysxt4
	IuI13gVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMWBk-0000000AHws-2LIH;
	Thu, 29 Oct 2026 19:53:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMWBj-0000000AHwT-1d37;
	Thu, 29 Oct 2026 19:53:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 69519600C8;
	Thu, 29 Oct 2026 19:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6E11F01816;
	Thu, 29 Oct 2026 19:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793303606;
	bh=sxufEbmJccbPCMBIVWCkzuEvgvSqJww+j7Cv/utg30c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VuzKxIaK1tOS0QvcCfnoS3lX532BUYdgQ2HPsgUhMZ57Uaj2IxhzN4UsDX4okAdIV
	 4opVn1/ygbhMc3z3Z2yppkD7zhFyP37vkwDSlDx2iEf9G7+wdVk6sfHh8+Un6xEr5x
	 0fB1tbaKdt/TyEQFA95vSPN8K9e2ffoUIk+N71AeIkY1emvKO+t+Wfv/M8mdo9cSyp
	 ab3W9pWHEO/+P0R7Rhthj0dtNhUigysikpMynCiEKBkBzqkpxUtUkQpCSxS/hsU5dD
	 5tXjrkzTznS4xWo7lvxqskebO5FC52ObdsIa1JFXqSnNtfc6b9ihbEGbJokZRlQcVg
	 3HBIIifVij5zQ==
Date: Thu, 29 Oct 2026 19:53:17 +0000
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
Subject: Re: [PATCH RFC 12/18] dt-bindings: serial: snps-dw-apb-uart: add
 Zhihe A210 UART
Message-ID: <20261029-imagines-suggest-46436f99114a@spud>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-12-74d58ce85bd8@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NHW4k1IZxtJrQ5WH"
Content-Disposition: inline
In-Reply-To: <20261027-a210-scmi-v1-12-74d58ce85bd8@iscas.ac.cn>
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

--NHW4k1IZxtJrQ5WH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--NHW4k1IZxtJrQ5WH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOkLAAKCRB4tDGHoIJi
0uS0AP9yvaqaeXIgZ6Q8UiuXm3rCSxIas74cfCcrHRrYUjPouAD+I1PZv3LKS1gm
ahygoYVVdGzKpaSEjzWcHGQkXEqtnQc=
=IozQ
-----END PGP SIGNATURE-----

--NHW4k1IZxtJrQ5WH--

