Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4B3606A319
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 05:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4rWdni1L;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RbFy2B73
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TQDIQpzHb58nAG54hsnGaeLsZebKKo1ep1+3YouILiY=; b=4rWdni1L8S2mvC8uQNk1sFQOvI
	CiOM+4SmpG9vV3oFQCOja0eoQ//shqzeM/24oNQm3r7C0r3VVWsQ/xyFNrqZgSxJQY+Ja+x3usbN+
	Xp/X5Y/bCRtcbXd/kxQLquShr2zD3M3pVRdrJIkCz28DGHOu9T5nXPnUS+anzsKWR6OvkmhkWeyOs
	8rp5IsrHvpwROz0S0sMq140+lUlk6HSbKTfM0mKQsxZJ5NJwrs2WSRxy3Kv6SKCQt7d119+v3HKr0
	q1XqNnScoz9rKGwqhwZjesPuGAcEVTznoTGjrp6GbbDvJoBLgwp9wCt1CJ41yB7e5X9+0losIsscE
	Sv13/XRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK7r4-0000000FWT5-3AG0;
	Fri, 23 Oct 2026 05:30:14 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK7r1-0000000FWSg-2c3r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 05:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1792733404;
	bh=TQDIQpzHb58nAG54hsnGaeLsZebKKo1ep1+3YouILiY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RbFy2B73JbdoEwfaZWhw72GGEJ3S18LQVSnu9FB2tp1F62GzNCSAOofV6+ci8j/Qr
	 NTYVIp1W/oSlHcqIpvTGpB3P/t0t0A09IlS1viMM4Mm6czL5gHH9bx4m1QqVQ8wC7F
	 IzPS02S41/QbiwcDyvOPp6AvSa2KUzSIbE9pOo9bG2AsdWi2lakCY1Ys73g5AND+XT
	 yGPPp0XOqjHlK89VohWNdpL155tzNh4xKK69MIdZo6GxV7XGp2AbbxhnYxsrUGuDXO
	 3I1q7aT8mkBYV5hED70/dnKARVm3ekeqWzmRG4UJQJITTHNMQApkJ1lowql7kF/44L
	 i8ZDdGnYoSVnw==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4DFF76C53B;
	Fri, 23 Oct 2026 13:29:56 +0800 (AWST)
Message-ID: <b4bb2f36bde9df1e052a70076fb70118cf3c607c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 2/4] soc: aspeed: Move UART routing driver to
 drivers/uart-routing
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Joel Stanley
	 <joel@jms.id.au>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Oskar Senft
	 <osk@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jani Nikula
 <jani.nikula@intel.com>,  Vitaly Lubart <lubvital@gmail.com>, Hanjun Guo
 <guohanjun@huawei.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Breno Leitao <leitao@debian.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>, James Morse <james.morse@arm.com>, Paolo Abeni
 <pabeni@redhat.com>,  Stephen Hemminger <stephen@networkplumber.org>, Dave
 Penkler <dpenkler@gmail.com>, Jakub Kicinski <kuba@kernel.org>,  Jonathan
 Cameron	 <jic23@kernel.org>, Dan Williams <djbw@kernel.org>, Mukesh Rathor	
 <mrathor@linux.microsoft.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Alexandra Winter <wintera@linux.ibm.com>, Julian Braha
 <julianbraha@gmail.com>, Karthikeyan KS	 <karthiproffesional@gmail.com>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, 	openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Date: Fri, 23 Oct 2026 15:59:55 +1030
In-Reply-To: <20261019100643.49099-3-changhuang.liang@starfivetech.com>
References: <20261019100643.49099-1-changhuang.liang@starfivetech.com>
	 <20261019100643.49099-3-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_223011_891470_121337DB 
X-CRM114-Status: GOOD (  19.53  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-10-19 at 03:06 -0700, Changhuang Liang wrote:
> The Aspeed UART routing driver is not really a SoC driver: it only
> exposes a serial crossbar through sysfs, and the same hardware block
> exists on SoCs from other vendors. Move it to drivers/uart-routing/ and
> convert it to the common framework living there.
>=20
> The register layout description, that is the list of selectors with
> their register offset, bit position, field mask and routing targets, is
> kept as it is; only the surrounding sysfs plumbing is dropped in favour
> of the framework. The per selector option lists become separate arrays
> because the framework refers to them by pointer instead of embedding
> them in the selector.
>=20
> The Kconfig symbol and the platform driver name are unchanged, so the
> sysfs paths documented in
> Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing stay valid
> and existing configurations keep working.
>=20
> Also update MAINTAINERS to add entries for aspeed-uart-routing.c
> based on the file authors, as the file currently lacks maintainers.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +
> =C2=A0drivers/soc/aspeed/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 -
> =C2=A0drivers/soc/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0drivers/soc/aspeed/aspeed-uart-routing.c=C2=A0=C2=A0 | 601 --------=
-------------
> =C2=A0drivers/uart-routing/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +
> =C2=A0drivers/uart-routing/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/uart-routing/aspeed-uart-routing.c | 415 ++++++++++++++
> =C2=A07 files changed, 443 insertions(+), 612 deletions(-)
> =C2=A0delete mode 100644 drivers/soc/aspeed/aspeed-uart-routing.c
> =C2=A0create mode 100644 drivers/uart-routing/aspeed-uart-routing.c
>=20

I'm certainly in favour of moving code out of drivers/soc/aspeed, and
having a small subsystem to handle this is fine, but it's not clear
what happened to the direction of doing this by designing a user ABI
for pinctrl?

https://lore.kernel.org/all/CAD++jLm7hQnCHACsZH0LVnXuCJm0dZ6Bq0hAyOTvVomy6W=
VRug@mail.gmail.com/

Existing code would need to be converted, but motivating that with the
JHB100 support would seem sensible?

Andrew

