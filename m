Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F5AC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 13:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekPT5VREXyTo7IvgpNJfGqCy+Q9+hG3P3Q6HvU7wtDM=; b=BoOiZ1YZszhETXjHfUABQAYF00
	UCvEhhNEnmf/hY4J/7n7AJJ81wFQBpXL2ciTZ7FFFumBRXrLJoxQyTm3lARhaWEgAwG2XJ23TXrNp
	MKQ5EDM0dXuBO1oMC+L5oPbLrl5EXOd1bP5KNAVJa0vI/ZjdaLc2q32gS6tyP17L1H1F3Mis2Myzy
	RdJt7KglFbZya/BhDLhjmOsUVF78Ix6sgtRS+EM78DkvF2Z+rZZU87ttkJSlqkCXj0+TTgD9ArtFg
	g9NIDGfObPqqpuGLqG8WWTKlvSjovLTHxBVYxwlIkPkY/iQxCungh52T/0fR5hmzDkmncKFClL4C+
	hgKaLbag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZsBU-00000005hyq-3Bup;
	Mon, 20 Jan 2025 13:51:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZsAD-00000005hl2-0sv4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 13:50:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0817C5C5B77;
	Mon, 20 Jan 2025 13:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E79C4CEE3;
	Mon, 20 Jan 2025 13:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737380999;
	bh=ekPT5VREXyTo7IvgpNJfGqCy+Q9+hG3P3Q6HvU7wtDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZlqwG6usKeVgktDjvMgMWW+p+paYghSd0qaE9dR8dp6y15JyrWZREpXw9RPWUdfLu
	 v+F+RQBQqUs88VHw47QMppmQvVfFIAHpMg2brKZEPJnvDkaM0++DoUjCSQITb0PwXi
	 CQD2T5FAROtQO3+vFNBlGt1zq+AMe8Cd7m3+zDfRvOB93d7wpOaKefl4dVAallBDZ6
	 i5jDpkCVGySyethrRbxI/BmEyvFzF08eMKkDI6LWz7UiLipq57OCMUIjz/dIlrJJsf
	 W5FKcUa3g8zPX/43Fr2TKeCbBKLYxJyh4C6DXU6t/qwWmLTDKjXpsS0iSoGYdtxiWL
	 gdUJ09dogpfpA==
Date: Mon, 20 Jan 2025 13:49:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] spi: zynqmp-gqspi: Improve error recovery by
 resetting
Message-ID: <c1a3f172-700e-4079-a501-b3f3f08b41aa@sirena.org.uk>
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
 <5942e111-24ba-4d1b-bd4f-6b81dcc6c5dc@sirena.org.uk>
 <87h65xi977.fsf@bootlin.com>
 <1026d44b-0907-4835-bc95-32f9bbcf4831@sirena.org.uk>
 <8c9e6a12-e64f-4658-94e8-77469f393a0e@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9dv0D5YciXBsjgUa"
Content-Disposition: inline
In-Reply-To: <8c9e6a12-e64f-4658-94e8-77469f393a0e@linux.dev>
X-Cookie: No lifeguard on duty.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_055001_321478_48F3A8D0 
X-CRM114-Status: GOOD (  17.44  )
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


--9dv0D5YciXBsjgUa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2025 at 04:46:23PM -0500, Sean Anderson wrote:
> On 1/17/25 13:41, Mark Brown wrote:
> > On Fri, Jan 17, 2025 at 07:31:08PM +0100, Miquel Raynal wrote:

> >> Yes, unless the timeout is reached for "good reasons", ie. you request
> >> substantial amounts of data (typically from a memory device) and the
> >> timeout is too short compared to the theoretical time spent in the
> >> transfer. A loaded machine can also increase the number of false
> >> positives I guess.

> > I'd argue that all of those are bad reasons, I'd only expect us to time
> > out when there's a bug - choosing too low a timeout or doing things in a
> > way that generates timeouts under load is a problem.

> There's no transmit DMA for this device. So if you are under high load
> and make a long transfer, it's possible to time out. I don't know if
> it's possible to fix that very easily. The timeout calculation assumes
> that data is being transferred at the SPI bus rate.

In that case I wouldn't expect the timeout to apply to the whole
operation, or I'd expect a timeout applied waiting for something
interrupt driven to not to be fired unless we stop making forward
progress. =20

--9dv0D5YciXBsjgUa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeOVIEACgkQJNaLcl1U
h9BBuQf/YxmGXFN3bvsT+wvdAmzRP3BLKBHbrKm6SRHibYXb0uzIv0CnmhwcxPeI
gRPuv9X5KJUEeWBnK/uErCuisfmGB68sIo7lvvCKrwhMaXZmqfFt79QACig5QQDz
JASKZt13yublMzZQPAxrn9q09gB43Tqt+rJMntTijfL8f6Tk0fTT8m2FFSJRAGaJ
bfdLIgUWLDKyWDRCoJCP52A8XTf5wTJH8DV8iS+sW349p7tnfTrVNVk+jUnDz6OR
oEUMqc3Bk2JXGLMETvnwI6pVeVS6EIsmXLcgOjNAMbBHeg2HmESlViwi9aCO7bk7
ErHBsB+skFh4mx4GnntI2Zvoyg/tsg==
=dRmQ
-----END PGP SIGNATURE-----

--9dv0D5YciXBsjgUa--

