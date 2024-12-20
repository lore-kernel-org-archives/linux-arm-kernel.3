Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FA6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 19:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECbYktccaIa1QdXtSBa1Z1RFkYlF/wIkrmasp+itWD4=; b=yIiZhlaTW8qB6b//UZ1jkcLBDF
	Eblfd7QUCxLgTxwNwncXWpkjtETHVYNZKjNJXAkvV6S7/FqflVgbopF5hD6+22SIZ+NlAPUK4RAzR
	H+6LXwBJyXJKI6acDk6F5qZP7U1wzmt/1cI2dDbjQAPOl/UpaH+OerTm9QawN+P+/EwjDPgoJizPY
	H+Vbar0IehPiR/beCj3mR6Lrp+CX5118PzJ1tioXWDy5ad/IC6P8KkUv5CE6YYc1gTvKGq92UGLfK
	wqf/xDGb+ydXEyzkDBCjbSPU9unD+9kOQXf2I8VdKn+swkuDxEJJmIXGg/Tp4R5KDJj+DPYcN5rly
	rqKt1sSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiu5-00000005yBc-0GTl;
	Fri, 20 Dec 2024 19:43:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOisu-00000005y0z-3CXF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 19:42:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA1B9A41FF8;
	Fri, 20 Dec 2024 19:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AB6C4CECD;
	Fri, 20 Dec 2024 19:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734723723;
	bh=CxGn7Klj0NZdQ41qkc+OiHDFz7q57MzEMRCe/qwiymU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lt5IWLQ1xcngwDOu5pq0XeOMh232j0L6VZGYBxEJTWjGu8/lfocZhtaJO9X9DJQfL
	 4PS/FBtvRLEl8KACH0uhdhlZ6ZC3tyTIlyP57RkYMDLJeuE6oqiYyY8eFgrhYq0E+j
	 gKWgr7ke+r2lq/CucEnF3dDuKeUcjdOwIEze4K/b2N9jV1Br26dJYOGEjEhQ+Jl1li
	 2+3U0lezZq/4FzoThBnVuGb3hJ7TwtTIbDlEwWhNfx6wZP0Q1ffBSGs2y5R2IuCd7M
	 TlbGQc33qLdjwYi7hyP/g1rXaLmJdQ9yPfaNq3eWXSCmX8THkEzfM8ahSf3620wceo
	 7hYgFfFGd4N7Q==
Date: Fri, 20 Dec 2024 19:41:57 +0000
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
Message-ID: <20241220-carving-diagram-a27c04aafb10@spud>
References: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
 <20241219-mbox_request_channel_by_args-v1-1-617a6910f842@linaro.org>
 <20241219-recent-everyone-865b19864693@wendy>
 <d9e635c8-de05-4812-bf2b-11651f6da5c1@linaro.org>
 <20241219-strum-cheese-89e5e60d22c3@spud>
 <463d5955-a056-40e1-a46e-f89ac0dadccf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Xx+aca69A1IHgTcv"
Content-Disposition: inline
In-Reply-To: <463d5955-a056-40e1-a46e-f89ac0dadccf@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_114204_936587_2882B102 
X-CRM114-Status: GOOD (  21.56  )
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


--Xx+aca69A1IHgTcv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 07:51:32AM +0000, Tudor Ambarus wrote:
>=20
>=20
> On 12/19/24 6:58 PM, Conor Dooley wrote:
> > On Thu, Dec 19, 2024 at 03:42:11PM +0000, Tudor Ambarus wrote:
> >> Hi, Conor,
> >>
> >> On 12/19/24 2:11 PM, Conor Dooley wrote:
> >>>> There are mailbox clients that can discover the mailbox channel ID at
> >>>> run-time. For such cases passing the channel identifier via DT is
> >>>> redundant. Add support for referencing controllers solely by node.
> >>> I don't really get your implementation, why not just allow #mbox-cell=
s =3D 0?
> >>> That's what's done for things like fixed frequency clocks that only h=
ave
> >>> a single output.
> >>
> >> Ah, indeed!
> >>
> >> instead of:
> >> 	of_parse_phandle(dev->of_node, "mbox", 0);
> >> I can do a:
> >> 	of_parse_phandle_with_args(dev->of_node, "mboxes",
> >>                                    "#mbox-cells", 0, &of_args)
> >> where #mbox-cells =3D 0;
> >>
> >> Or ... can I pass NULL for cells_name and make the #mbox-cells property
> >> optional and still keeping its requirement of being at least 1?
> >=20
> > I think the mbox-cells =3D 0 approach is preferred, that property is wh=
at
> > marks it as a mailbox controller after all. Perhaps Rob or Krzysztof can
> > comment?
>=20
> I think using mbox-cells =3D 0 is better indeed. In my proposal I
> considered the list to always have a single phandle, thus a reference to
> a single mailbox controller, whereas it may be possible that clients to
> reference multiple mailbox controllers. If so, #mbox-cells needs to be
> defined in all the controllers, for consistency reasons, similar to what
> happens with fixed clocks, as you already mentioned.

Oh right, I had totally forgotten about that, that's a solid argument
for the mbox-cells =3D 0 approach for sure.

--Xx+aca69A1IHgTcv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2XIhQAKCRB4tDGHoIJi
0sK+AQDCcx/lgCTv+Omz3fHAepr8BVUseHHBs+4WzmyKpR3V4AEAqX3itqXBhmyZ
9veirorpUjlotYZvKUMvTmoTRZswTgA=
=SG7R
-----END PGP SIGNATURE-----

--Xx+aca69A1IHgTcv--

