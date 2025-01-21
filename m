Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CF8C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 16:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQcpKD+KJDuVJj3F4wa6P8a/bpfKsiibTn0ATqZgmkg=; b=WCBpZWSj9tQJGEH+YI+p8tF8di
	le3DiOTtZcpknpcFBHdjujdLz2R5kMo7VRgYtPvO3XhrcPtyI4M4216TCaI8GaZLB0MuaJGJ2p4IB
	7AqWb1ewp/pVk17Rqd0915f1Ay1u+OAaSveURzdjiNnCt/LhsinS/IspKRER/+YhovICOPNlJXCwW
	9PJFM6hqVbKHRT30T5xcHRSjgaaFsz8IOLGwMWt9kGw9d/wOrl8K0D8DywU9T3h95yILVz+ISBK5U
	+8uQH9dHzi7dPmABZ2XTabn5gy0ZO8oswIkx/7gZPrgZnlRH1u6YTqixdVDULgHYDBo/lxCHs/Z8s
	S0zqfjyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taGiL-00000008Iol-2tRh;
	Tue, 21 Jan 2025 16:02:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taGgm-00000008IPe-0Zus
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 16:01:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ADD61A41C44;
	Tue, 21 Jan 2025 15:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6055C4CEDF;
	Tue, 21 Jan 2025 16:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737475274;
	bh=iQcpKD+KJDuVJj3F4wa6P8a/bpfKsiibTn0ATqZgmkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NuPgY0cIhJi6iFxI0ERs2b1yTwsg8I00IC/5PCfqCljGQClTB0lQ7tNHds7xDkTb+
	 mslZAaucrQQWJgLuPHbGoGyjjgklTTSZ5Qmh9nQMyOt/pPadM7JJBpB/3nMpmsbVDz
	 5VZ45hTOBVvLs1racWwsfTYYPjKLYRMu/SEsiLwq6HcMaX5NziLsj8GGOwunZcpWNP
	 C4QYl1l4evg3o+XHegXAojiPxHSUx4cy4ZbtFFwPfXASG6wYOu6cDRCcR01UIFhWpf
	 zIujOTg0YHFI/xbxKuCTVMFfB4vCcSXjl0zdOSMsZrLSIqGHhh2NHktw27ahWZis96
	 4ZN0DJhVnvpCA==
Date: Tue, 21 Jan 2025 16:01:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>,
	"git (AMD-Xilinx)" <git@amd.com>
Subject: Re: [PATCH 5/7] spi: zynqmp-gqspi: Split the bus
Message-ID: <f1310bb6-48ef-4bdf-a359-f34b0d849a4d@sirena.org.uk>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
 <20250116232118.2694169-6-sean.anderson@linux.dev>
 <DM4PR12MB76932590B9A6BB1CC17AD67FDCE62@DM4PR12MB7693.namprd12.prod.outlook.com>
 <1f7cb52d-31a4-458c-9b81-b46bf56fd8a8@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SkwomuF90JxgE8Ws"
Content-Disposition: inline
In-Reply-To: <1f7cb52d-31a4-458c-9b81-b46bf56fd8a8@linux.dev>
X-Cookie: <Manoj> I *like* the chicken
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_080116_246173_50F24903 
X-CRM114-Status: GOOD (  11.95  )
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


--SkwomuF90JxgE8Ws
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 10:53:53AM -0500, Sean Anderson wrote:
> On 1/21/25 08:19, Mahapatra, Amit Kumar wrote:

> > IMHO, restricting users to fixed names is not ideal. A better approach =
would be to=20
> > introduce a Device Tree (DT) property for the bus number and select the=
 bus=20
> > accordingly.

> Why? It's not an artificial restriction; it reflects the hardware. And th=
is is how
> SPI busses are typically represented. If you have two SPI busses, there s=
hould be
> two devicetree nodes.

Perhaps the thing is more that the buses are named instead of numbered?

--SkwomuF90JxgE8Ws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmePxMQACgkQJNaLcl1U
h9DOhQf/YOzVrfNHnRJnwGRbPbNkofZBmWsqC+oClntJtsfCIOd+yZ9XffNE+XTW
d3wV2ZC9xSBHQxmlnNT+FKuujIDWCsPmhuOgoxAgs349j3eot+CXTgbAxbZXGnm2
F/wdLFQZ5kL+CN7J6z3KmHMoP2rEjl0EBVhnsRWL9JdayOiq6TNGQFpHm+QN15rq
6TXvF4UAYiBi6q+quTy+gMjBMPJKMHOO1/O3sf64+TO+t38e0vxUziV9a2IoCqcL
2OaKjv4UxFuufz5KmxVkxaOknpSQITnTdBdu8XSApSM0DfFmEWzVluFh+XgD8hnH
0L02vm82OcjZRvMrs4TZ2pTYlc71KA==
=Zc1a
-----END PGP SIGNATURE-----

--SkwomuF90JxgE8Ws--

