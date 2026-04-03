Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D4FE7E37E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 11:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9l7YRnXiJeaUSputbifksPPi0XaXtllvN3GOhiFO6oo=; b=yBMW/dMLLb+g/2bthb1sMnjtzh
	6Fumy02DBPBWYRg+rojCW44Uw++q1Tr0h8U/0KgHLT0W3uKLtfq6lcjxqMLcZ6eyn3uy3tuptZ4WW
	/ZBMRBuExmBn6ff6P8b2tduYNQLpH8wziSdtyx2uMOHpv51VbJg+XX/HIPVmbvMEkjuG7ws5+GR1a
	W3k2wrZhiTDXVuJr1y5BpOFomo1RYZP0cdWCoqK91clzGUYfei2misJrE1M2nrj4V8jx+bEhSzjWG
	8s9lo+1TUjGt/p+D+cCMbqTr/iJpdlhb6tg0o8l/cOLvVjXDYYCBtgqy+Wms9iDUJxhDevBhkN8Mf
	DInoLWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8d8e-00000001z20-2qob;
	Fri, 03 Apr 2026 11:56:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8d8d-00000001z1u-0Y1J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 11:56:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2AAF760008;
	Fri,  3 Apr 2026 11:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3A6C4CEF7;
	Fri,  3 Apr 2026 11:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775217393;
	bh=9l7YRnXiJeaUSputbifksPPi0XaXtllvN3GOhiFO6oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eLufVd3zXy9jubkTC9dwkw2QYzwtvaWjru+m4ZdRkawSNi9+nrDNC6gUO4mGVS6/R
	 gkBybMRFcG6wp9frSh1UrnRTFmFAIWeWQ6JjhxrMtKfvi/L8jlqp4jSjvl7EXEDDzs
	 ZtNPjIHE0ChL+R5ThH0m0bg+INk64ahwnxdcJwFR/q6vQTBSBkwaCRWtjZT24m2vTQ
	 7MxtkfclOy/wmKMdP417H2f+HSQV3sLIh5VH4IlCqqK1iv9HKmpZHIBbN8ejL1uHof
	 f/augOwXmiWn/yGSuidAzKcnlp7ywm1cPXBOrcNHhnI6tgb8ARqohzJKj7eqgaBFB+
	 mw/4aiwR3j/hQ==
Date: Fri, 3 Apr 2026 12:56:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Robin Murphy <robin.murphy@arm.com>,
	Leon Romanovsky <leon@kernel.org>,
	Paul Burton <paul.burton@mips.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Eric Dumazet <edumazet@google.com>, Toshi Kani <toshi.kani@hp.com>,
	Christoph Hellwig <hch@lst.de>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Johan Hovold <johan@kernel.org>, alexander.stein@ew.tq-group.com,
	andrew@codeconstruct.com.au, andrew@lunn.ch,
	andriy.shevchenko@linux.intel.com, astewart@tektelic.com,
	bhelgaas@google.com, brgl@kernel.org, davem@davemloft.net,
	devicetree@vger.kernel.org, driver-core@lists.linux.dev,
	hkallweit1@gmail.com, jirislaby@kernel.org, joel@jms.id.au,
	kees@kernel.org, kuba@kernel.org, lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux@armlinux.org.uk, mani@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, robh@kernel.org
Subject: Re: [PATCH v3 8/9] driver core: Replace dev->of_node_reused with
 DEV_FLAG_OF_NODE_REUSED
Message-ID: <fdbe1d8b-d323-414d-a705-cf2dbafe2fcc@sirena.org.uk>
References: <20260403005005.30424-1-dianders@chromium.org>
 <20260402174925.v3.8.I806b8636cd3724f6cd1f5e199318ab8694472d90@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7NZIk4CoO0re4Kx0"
Content-Disposition: inline
In-Reply-To: <20260402174925.v3.8.I806b8636cd3724f6cd1f5e199318ab8694472d90@changeid>
X-Cookie: The Korean War must have been fun.
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


--7NZIk4CoO0re4Kx0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2026 at 05:49:54PM -0700, Douglas Anderson wrote:
> In C, bitfields are not necessarily safe to modify from multiple
> threads without locking. Switch "of_node_reused" over to the "flags"
> field so modifications are safe.

Acked-by: Mark Brown <broonie@kernel.org>

--7NZIk4CoO0re4Kx0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPqucACgkQJNaLcl1U
h9BRKQf+LiK4wJzBJvOcF8tPspBBv5slh1Rv07RAYfhsMajrfvb91fBup9erBnC7
uop2lhbeef3E4GYUNM3af2BFUVTr6Q2yQsCgV5p3nED9j4EZmCsCSp3X0Hbcc+S1
RmxEf3FESw5jl5dAifyRzEtHhqMmQoiJiWHstiX08tmRvb230IM4SoMj9/XTx/hJ
qZLOPBhvbwfqLgqtzR6YbvKHy+eG/muzoWEC6sNgi5JBsNQEeCY0Dp4nSfxbN1i6
VGMAgiL64FDOsOQ3BG7hFoQ0OFAsOB2CiaPDKh4qopTzS+avykiGQvxzCn4XfBfo
8ZM+Nrnu/VYKm5P6K3uIcHF11UpYhg==
=Rocu
-----END PGP SIGNATURE-----

--7NZIk4CoO0re4Kx0--

