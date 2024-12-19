Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BD1E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAQLVdwutb+8hdf8yPs2vBsQPPGJ9HU+Aj5HIuMPLTg=; b=OvVBJhHFAZkjI0XmkiQH9hVquy
	yQYHnAITXaItshlz7nDMEx6fwskTlPtXgUExefRrH6xZX2T4a6HifJYR0z978S9Ucr+lotF03KCm5
	En2lDFi63cgK8cHfZbuH397OWmqugLDjKu48r2CT9EErJvSpob3QjZ9C9uklcAEqXNFG553LwE/lv
	xY9XUY+QJH+J69WCz2qq2UsDCZSFj/pfKa3OizbKYIIAoyyDGbw/MGhJ/UQtX6EXr1AtioTF4rW0u
	PN9jsygRwAnyZIjNplWObVJX7ywwCbqumpgMZeYMRfQcOCLvNRHhE/eJzPYCuD74bD+0zDbvFs4vS
	OaOlFKGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLkN-00000002n0m-3faO;
	Thu, 19 Dec 2024 18:59:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLjH-00000002mrQ-12uw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 18:58:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3CDFE5C4648;
	Thu, 19 Dec 2024 18:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC152C4CECE;
	Thu, 19 Dec 2024 18:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734634714;
	bh=5lJoFb1ogNkglTJoNJUT9Eg7QJAB+5pbzROZLHfkCpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lB0N5s/bKTVhnO7BJ8QaT49JXljtgwDxlfMye3BIVI1hOVMPL02R5XhntzwgLdfP8
	 udwDWZn5NeE0siZQLSGXI4LFIqaxvvzyVQLdmIbEHUXIPliojANnksZHWGPHsWYcJc
	 /u827GSe3Z26XuJU5ZSSCqvVC6zkZyRdK5mZG7hTnVr3h7/iW5bFTyBGreB9+CAt31
	 qVvOQ2Bsoef04MklW089E6u6XPHpom55P4/QEEZJIzRa2s6Mia0OgjVHBb+hlchkNj
	 mLYU7Y7S48T9sdIUfmJf/EIFo3BHExVhVKsbqxGh6VOM6A6TMVC9SBdrhEk39QNNhD
	 kMgqToinn3edA==
Date: Thu, 19 Dec 2024 18:58:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
	peter.griffin@linaro.org, kernel-team@android.com,
	willmcvicker@google.com, daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: add support for referencing
 controllers solely by node
Message-ID: <20241219-strum-cheese-89e5e60d22c3@spud>
References: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
 <20241219-mbox_request_channel_by_args-v1-1-617a6910f842@linaro.org>
 <20241219-recent-everyone-865b19864693@wendy>
 <d9e635c8-de05-4812-bf2b-11651f6da5c1@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7uEMfKSFSh7bUHVr"
Content-Disposition: inline
In-Reply-To: <d9e635c8-de05-4812-bf2b-11651f6da5c1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_105835_332541_84D4E4B2 
X-CRM114-Status: GOOD (  16.75  )
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


--7uEMfKSFSh7bUHVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 03:42:11PM +0000, Tudor Ambarus wrote:
> Hi, Conor,
>=20
> On 12/19/24 2:11 PM, Conor Dooley wrote:
> >> There are mailbox clients that can discover the mailbox channel ID at
> >> run-time. For such cases passing the channel identifier via DT is
> >> redundant. Add support for referencing controllers solely by node.
> > I don't really get your implementation, why not just allow #mbox-cells =
=3D 0?
> > That's what's done for things like fixed frequency clocks that only have
> > a single output.
>=20
> Ah, indeed!
>=20
> instead of:
> 	of_parse_phandle(dev->of_node, "mbox", 0);
> I can do a:
> 	of_parse_phandle_with_args(dev->of_node, "mboxes",
>                                    "#mbox-cells", 0, &of_args)
> where #mbox-cells =3D 0;
>=20
> Or ... can I pass NULL for cells_name and make the #mbox-cells property
> optional and still keeping its requirement of being at least 1?

I think the mbox-cells =3D 0 approach is preferred, that property is what
marks it as a mailbox controller after all. Perhaps Rob or Krzysztof can
comment?

--7uEMfKSFSh7bUHVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2Rs1AAKCRB4tDGHoIJi
0nLvAP9ToMBHB4C3Rre2xvEvPhvlw39ZEfEZy++feDZz4E+SrAD+PHASE/M2kEJi
ylZ8oz0XIwxFixxF8qqyAlSnOzgynAs=
=RjlM
-----END PGP SIGNATURE-----

--7uEMfKSFSh7bUHVr--

