Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47DCCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXb2xoWF36PJ82m6BEQX2BdaIWmKUFdyItrBQFX0b8c=; b=lL3r1Wula8eN+PIqZ/o2YlHsUh
	+5sr97+ZeT57wi29QkKalUUujbORx8HGSziAfDF1I2M4qPsv744MWsK7CSS7+LJhQwNvzz4LaeoOp
	Eh3x2tYgV2Spdvhbvs2IpniiPKxhuudKV9+KxjhR+TvVx08MGJsjLQ1ghgTPh0EzUMC/lknoEqK4G
	Z2A8PXG4/oCPpnBu/VcoauRIV7ovZvF8xsNAE2VwZ8JikNA3o0Eo3kIPFMh8X2lofUObjOhlkfYRT
	J2efc5tUuygexkQ8P+yd4yrX5kWDUHMmNCS0HC3mUCYK+vTMQx3geT8g6HsG85BaDhK5Zm/Ynl3aa
	X2cAbAUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hgw-00000007XBq-0SIb;
	Fri, 17 Oct 2025 10:28:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hgv-00000007XBf-1six
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 10:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:Cc:Subject
	:To:Message-Id:Date:Content-Type:Mime-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AXb2xoWF36PJ82m6BEQX2BdaIWmKUFdyItrBQFX0b8c=; b=FgWIzCxFiJpQzHb6/20S0rJYcN
	QFiQurygEgeDUJ+Tyv7EdGDOGNXugqZA9cMl2pKnahTRNsjqp+t7HH8uR5livjX1/Yg33T/RFqef8
	UhLQC+U8y70oDKCPZgXXMbgU7gDRIgdRdR5dbXL7PbZCZKqQPKZd1BywJGxPs0U1H+9GTV61CQpk7
	0gjU6qsPCIBXkEAVSh5E+65KuDNVb3BC+3k8VU033b7DFKYCVXbM2DNqHPju5FXqvrDofedAZfqyC
	YaTsA0hPLrEvAKVG35+l1E2qEhUGuywsYWpAvCgv5PBDfkrPA4tvBh+wNHzWmrxPJdnBw2pJd4x8k
	zoA4k49g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hgW-00000007TJx-3U25
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:28:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D46749073;
	Fri, 17 Oct 2025 10:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4ACC4AF0B;
	Fri, 17 Oct 2025 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760696843;
	bh=AXb2xoWF36PJ82m6BEQX2BdaIWmKUFdyItrBQFX0b8c=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=ivyB4e0+t/GWg+1SNSB43y07tXoByzNyL5FagwcIOvm/vwYuJGFvPkac++hLkjZFg
	 gi/QmUs86qqqH9c1OOwq1pfIwq0ooGvegZODBLL27kaWwKkb5L+kZtzbwFFRFRPBII
	 KJ+LMHtEKKhObCscaZra1PV9fj3VsNG4E08+JMrOKqkRN/z9N6k4CFz5Q1t4ga5iVg
	 IrFA4enPWxzurEv+mkZ2HM0GjBublSHznMwhAwrbRSGeCsXnbTQ6YPiXUWgCGwsZ5N
	 N2zfXogkrJJtT3sn7nr705gDpKZGvh+Imyi849qPBjGE8L4MU5d4ZIo8Mh+0zZGXfE
	 9gV+S93/twu+A==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=209572d5d449fea800561efc9231a1c1fc1c44a605e3fc288225d653e647;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 17 Oct 2025 12:27:18 +0200
Message-Id: <DDKIXTB6YXUM.3VY1GNCC6GFCN@kernel.org>
To: "Michael Walle" <mwalle@kernel.org>, "Nishanth Menon" <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Subject: Re: [PATCH v1 1/2] rm64: dts: ti: k3-j722s-evm: explicitly use
 PLL1_HSDIV6 audio refclk
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251017102228.530517-1-mwalle@kernel.org>
In-Reply-To: <20251017102228.530517-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_112801_887263_495B9585 
X-CRM114-Status: UNSURE (   6.88  )
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

--209572d5d449fea800561efc9231a1c1fc1c44a605e3fc288225d653e647
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Oct 17, 2025 at 12:22 PM CEST, Michael Walle wrote:

> [PATCH v1 1/2] rm64: dts: ti: k3-j722s-evm: explicitly use PLL1_HSDIV6 au=
dio refclk

Dang. I just noticed the subject has a typo. Will fix it in the next
version, or if there are no futher remarks, could it be fixed while
applying?

-michael

--209572d5d449fea800561efc9231a1c1fc1c44a605e3fc288225d653e647
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaPIaBxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gJfwF+MlA538hR89tlDMYyXTdFilZkhwrQOqDO
KX70l82R34q8yCx2xEAatnjiIiI4D9FvAYDevXZvMHZLxxjOJwsBxB2A0CyDYCAr
eos4cbNK+BO7LLznbJ+6BkL4Gy2I9IQviL0=
=jeCh
-----END PGP SIGNATURE-----

--209572d5d449fea800561efc9231a1c1fc1c44a605e3fc288225d653e647--

