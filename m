Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F6ACD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jq5iqrAjPknTHn9C17DM3G4+YoEa9r9el4N8h5TTtu8=; b=P554Jci1rIvmmhmthwpOgKrdHh
	GeTV2uzati6Ks1T/F+5DEWXsLmDHxe0by+QjcGJcKbP2A8+2PVPi4+cJA43wiYsbIivmJRpbXVsbf
	FnCj6a7U2YlwUqTsNjWtAM8Orfdd8xEDJZA/9Wyu8N+lwmwWwiiNFWgxf+WteaojkHVG50Okq0tuj
	HMM2V1JZta05uhB/XZTE9GAyLuSBZ2SVYALcqp0M753GSSgjs/P3Je+x196i0QmIXjXXdmOxkG3sp
	2ol9X8viT6ojyCRaoxZJ1AU/0WmZ2Fkh5Dml+P6Ebvlu624XIPe+/ghVa31gy9aPY4YqLXrHvwPQ0
	oeH+KBXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzwi-00000007LrC-1qLU;
	Thu, 21 May 2026 09:44:04 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzwf-00000007Lpu-3x9V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:44:03 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so2531702f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 02:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779356640; x=1779961440; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jq5iqrAjPknTHn9C17DM3G4+YoEa9r9el4N8h5TTtu8=;
        b=mUyIh32TzMJ7pbMBbdGRM5WUHLTADQEM8UV/qR1fBkCf1ATwKbRI2mb262yuXZy688
         0wpuPmmuL43/iSOYPWCuvaeDsIOr+UPbJwR7LUKrAQV6GmjMfWVwa8WtWVApkpBnr/hQ
         DxjYh8tC0rV7sfhbnQbuZ6nEyYgLpWcgOuE1e/i4aa1txL/DJlIOH+sQeY1fqkdz1DA9
         jlujXm3SUYOIrmK/VnYNdVrD/+CUNq94x4BoCcOR3E2sAWJaNzymMXr1QzfDaBarYWJz
         wCZLjQXPsdp1iZ8GurXODehgRRkZs6L7QF65jnNPzM+0XpiZAxVOPUoZpSj8Vfmhhff+
         GNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356640; x=1779961440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jq5iqrAjPknTHn9C17DM3G4+YoEa9r9el4N8h5TTtu8=;
        b=iHhwa5/kmE6WQvFJPfjgDBoh61XUKtAacvqB8FirXvbk9LSPYmApDIWitEEgiGbbLO
         P9LhApu9/LUBfwOwbfAZfNe0T5Ha13BkPldyPoMgPCy1M/08id84T85+oqjrtJqJjgGX
         JedBQA60KmjVCXI5p2fYe5EpE0kJJnX2OXXGQu/xN3zysafCtAU46lzqb9xBHvnJm0X9
         3nEY74JnijnWivAp49pdiPV+g3H3m4UYrmQ44++RudUPn5E1x5EdNj7eYz7W0eVN1K5b
         hbCL0y4PblQWyqfcuusB8b9ehyofHjhUj1zG3JevRJ2W1/7GKJDLyu7xJZu2ZuSyYYYv
         dBdw==
X-Forwarded-Encrypted: i=1; AFNElJ+AImhzrixQp1bdYyR73vi8IuDTUIuro/D/P9nm5UtgkiYK78hbxHRAl6rUrwW2tAnw5d5aD0NF2ZRKuGQLASIr@lists.infradead.org
X-Gm-Message-State: AOJu0YymKxJ3TnxD+9WjSFwCfL5AT/GLcJcuhjmmYh3vu4eBF0GwMEfO
	zTpkujlfAoXQpZViEnDpjQtiD0zCUJqgo1F3Cb/4PJm/PxX7ZVV9N8Mu
X-Gm-Gg: Acq92OExRW17x2poCJe+6gOkC37XUUAsHxXr+V4D1ok7zvd0HmvsE2AbfAGlGaHeThH
	Z5sFpwhkA7lmX6JoaOyPT3w6zIFSKvc+ubRO1zS+xdjHhoHAlHqrIyawCPG24AxkFGmiDt+LGA6
	oyeM1DPTQsI6OsJyiiNWkNSLZoV+f8yRvf16txcgz6e0KYJHlhyJvMxQU9F0OKOKid/mU8bzaTz
	VYR41k77OacteKGxQe4eBD0kMYHX2lEi5ihUitvZHVXQiOmHkepOTr3NaL9RszlDaiMt4jxxknO
	TUbAONlqxOUhq2dOI7SIVa0uCGVd1Mt3ZhUgnQO80LEgDBmO1szFFDPU6+lFFevc3YTL4w5Y7ZX
	TdKRK6j5p/O1Hn3H3WkpaR2p2jkcVDQ6gkBDuHrlv6JBWk4UoJX8FO+r6Gg/rlwqB9cc4j+Unzz
	014EAPdmmbYTmQX0DQph1vua5jj37Qjb85K/tdb2AjJnMtrxUJgXFLQjCXelvAepCtCtjANM9Ni
	FnARUJEBzwYJA==
X-Received: by 2002:a05:6000:144c:b0:43d:7b90:fa23 with SMTP id ffacd0b85a97d-45ea3be3772mr3377859f8f.29.1779356639760;
        Thu, 21 May 2026 02:43:59 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa93d291sm1325006f8f.36.2026.05.21.02.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:43:58 -0700 (PDT)
Date: Thu, 21 May 2026 11:43:56 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/4] mfd: max77620: override PSCI poweroff handler on
 Pixel C
Message-ID: <ag7TenB3GrdLABuk@orome>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <20260514-smaug-poweroff-v1-3-30f9a4688966@tecnico.ulisboa.pt>
 <ag65LXrLLbbeTbTb@orome>
 <367bb557-81a0-4286-8788-0e7272cc4d02@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kyo4eqmpt3lalhdw"
Content-Disposition: inline
In-Reply-To: <367bb557-81a0-4286-8788-0e7272cc4d02@tecnico.ulisboa.pt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_024402_003616_A40341DC 
X-CRM114-Status: GOOD (  18.31  )
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


--kyo4eqmpt3lalhdw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] mfd: max77620: override PSCI poweroff handler on
 Pixel C
MIME-Version: 1.0

On Thu, May 21, 2026 at 11:23:11AM +0200, Diogo Ivo wrote:
>=20
>=20
> On 5/21/26 09:52, Thierry Reding wrote:
> > On Thu, May 14, 2026 at 04:47:21PM +0200, Diogo Ivo wrote:
> > > On Pixel C, shutdown must be handled by the MAX77620 PMIC rather
> > > than the PSCI SYSTEM_OFF call, whose firmware implementation is:
> > >=20
> > > __dead2 void tegra_system_off(void)
> > > {
> > >          ERROR("Tegra System Off: operation not handled.\n");
> > >          panic();
> > > }
> >=20
> > Ugh... sounds very familiar. We have similar stub implementations on
> > Jetson TX1 and/or Nano, if I remember correctly. Luckily newer platforms
> > seem to have proper implementations for these.
>=20
> Yes, on my TX1 I was encountering the same problem. However in that case
> is it possible to update the firmware with a proper implementation?

I tried, but there were complications, both technical and logistical
because of the point in the product lifecycle. At this point I don't
think it will happen, unfortunately.

Thierry

--kyo4eqmpt3lalhdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoO09gACgkQ3SOs138+
s6GuSQ/8CPg1NBYsjjKRV7KIC6rIuDMgYyusSWnMeTTINGkRyrRTQ/29IQ/CDaW1
Fqb9aXXWRjpk52os2I5jf5cZaUuQAzZadeXENiiKb5ExxLxeu1zF8AHaMjEcZilh
zTcD9fCQplEPbwr7iDz61gE/4qfEnYd/5Zi4lCq8MdPE3UNTfXnlFHxjoIYkqbqw
XO82jFix9weBG53lM3QbhiM/96GpHKFrTForciy0bytmXC/EF5skQMdM/gSPyrTo
b3dTmdSOhO+KYmUJlGoOTRmb38hNQyx/Ymo70W3H8V88J8MR5rFPMQm7TI4QfzAt
gEeD1SQ6EupOblWkF0dWYQFSuDJrQeUw2c/CHu5bLj2Ci6sSjOIVdf5/XuUmdN/B
SFZhQ8t+5fchGNYR+/3a4HlHiu2OoOqHoAqayN+ifPuCNTwA92dOCf0875YW0e5l
wvIRMgOR89ywTaY4Thb09RXmiTA/tNK93Dulv+iv4nsefVJ1UD0MBO1a/4r/2aJl
6L1jVljbWHkq+n3hgFnzAUIuXGJIKAMqHljJ5pFWuNz1EP0E3JEOnARv8Xachzze
cc5LNxHTB3/XxZW5KXmj+gHitoWei4d9szdP31JDHhrdCZTsHsT7miZXB1i8FYQB
B7Ephp8VZY4jSkK+pX1czf4apy7bs2hmCedC8hva2cEuJXzfXbU=
=MWck
-----END PGP SIGNATURE-----

--kyo4eqmpt3lalhdw--

