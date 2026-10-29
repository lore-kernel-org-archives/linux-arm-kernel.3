Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD95B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 19:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0dPXZUcZ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XAuzTLXi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mB8QQ9/vuRBF76kR+CudZygjTkN8E4l9aL3S24NkFsU=; b=0dPXZUcZYFohfdawqJdrkPPBEp
	HyM8BuGZ8n0lPCofrTjB2SRhRu4eS6XwOYkrJoWInULmq9XEwpMNQZ+5OiERFP41u2VBpfaabRv8I
	VHlId3i40H16MEawaJfskBhRrZj9Nq/EehtsYKCkMNxhLF0hjnhiRXHx1q2dsbjpNrkNR5NhuZo9d
	C7jcFNaRcl22kK0r5lVsE6AKCGhf6hyBkEsumL1d0aYA4omt1wO31jCMHw8SDMcfTV9Q6aV1XQsry
	i7GAAtYmQ/cZqgEQfrKb9+oh14p4CwZCKsd8JLzEnMOlVylwYrjxowQog6gEpL2og43+j9Au7mBo3
	iHRxz9ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVgl-0000000AEib-2mqU;
	Thu, 29 Oct 2026 19:21:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVgj-0000000AEi8-2nwD;
	Thu, 29 Oct 2026 19:21:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A64443552;
	Thu, 29 Oct 2026 19:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5314B1F01816;
	Thu, 29 Oct 2026 19:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793301685;
	bh=mB8QQ9/vuRBF76kR+CudZygjTkN8E4l9aL3S24NkFsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XAuzTLXiGvC8VQP+nWevpaO+TsHjId4xLBvJWdQcv63R3x9XoN+Q/vGXj4CVBc57I
	 pC5q33SQ0UrPpJ1emPMBwAXIwrB8UexTYCEbNzxV37Ssahkr6ehEcyJU04FsmfLkYI
	 fe3vP4rgoJ4SnriSyUAoZ2v8mH8VIpTcj95TJalpCKYqaf9JiXglZfxreTyyjVku5v
	 UzebI4qJiXKPLFsg0hsAIlqFX7reNKWjEQuqgiHmG1dDsqeUY+cYAWmoINte08cOoH
	 r5U+rE8gAv4g2hVhVCGijCSqa7pUL4JR0vuQj1cEujEepOxfKU5rTzXL4CtaA+1ZtS
	 cKUispFNm1INw==
Date: Thu, 29 Oct 2026 19:21:16 +0000
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
Subject: Re: [PATCH RFC 08/18] dt-bindings: interrupt-controller: add Zhihe
 A210 PLIC
Message-ID: <20261029-untimely-zeppelin-b623272dac92@spud>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-8-74d58ce85bd8@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xQea4YahfBZW6fDj"
Content-Disposition: inline
In-Reply-To: <20261027-a210-scmi-v1-8-74d58ce85bd8@iscas.ac.cn>
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

--xQea4YahfBZW6fDj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--xQea4YahfBZW6fDj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOcrAAKCRB4tDGHoIJi
0lkuAP4j1Syr4NaSYo5EgKM2vK/7/8yKlgaO3jdnsqLsLpiHOgD/UFmkhvm6cmzg
4hrX0XP8cpTtSUPiXYnApAVxiVf1CgM=
=4vU2
-----END PGP SIGNATURE-----

--xQea4YahfBZW6fDj--

