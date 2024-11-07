Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0672BD4337D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 17:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UwowlylA6AIUxnupqsBpgpXD1xGTxlGCKAu++1GW+o=; b=Cb+mQzKERWItygQvDB5GY0Jc9W
	7v7ig7wvYiW+W7Sa8WisHbGOW/q0A5Fd8iQoHfNw8k7TYin8bMvrBBinEHcndX/VkiVFJF8aGSX76
	9ivW9X/l4Z+ZmSShUEI7hUEEMPzQGO7zGi+fDWfcX5qcNr4nII21pl75Q8YTHH6xth+ypt4yd+CjW
	PPwUKCTbBjT0pSv7N6FmWZuin4Xk0/57pvgNvVy/IetSPU8pbPqzhNgkBMePI9VDJT09fDptBe71I
	V8j8enZFVrtdWnuMz2GgC2R+qEJNXH9ZTsvPEKd/HCZ5ueWvWUtyFqLRwSJBZjsIgHw0JgOgUHdVu
	5EkceI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t962R-00000007m7F-1Yf5;
	Thu, 07 Nov 2024 17:11:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t960f-00000007lez-3rc5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 17:09:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2C5A5C062E;
	Thu,  7 Nov 2024 17:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243F8C4CECC;
	Thu,  7 Nov 2024 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730999369;
	bh=9f54dxIl3eMwRNQ9RNH0nhNpQ6mFCD7DUPK+U+I+s2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1ceALmOpXVDmMxRbzPEfjf44ktMb8IJIw5lCn4O2WlljA5gnCeFuqPvPRcu98S4V
	 6HAILwGAs7kg8T56TOAySl75Sp1LxU3tBT53AkwaWgpikEnuuALLIP2KJZJwpXv6W0
	 9Ghf5BuxO0K+n81/KZhb1PcxyiH6msIl3EWOog8mq1rYdc0o1rizGr+Kn5BdR+CKJh
	 +H11tCH5HBVLIDlDemnlhdooj3Z8xdwOlQJdtkPLI6fgPxN8/TSnVpBXbmdzifW4MQ
	 qAExp1IDuQTjDvnnukK3cn4UfHgedhjHz6g+pX4clyeJlf6w0mAtZu13eHXdULURBr
	 2TkK3rA5gn+Gw==
Date: Thu, 7 Nov 2024 17:09:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
Message-ID: <20241107-slip-graceful-767507d20d1b@spud>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <20241106-bloated-ranch-be94506d360c@spud>
 <7c2f6af3-5686-452a-8d8a-191899b3d225@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yB3ZUxT4SMqLRowR"
Content-Disposition: inline
In-Reply-To: <7c2f6af3-5686-452a-8d8a-191899b3d225@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_090930_067575_08C2B8B6 
X-CRM114-Status: GOOD (  20.00  )
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


--yB3ZUxT4SMqLRowR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024 at 06:15:51PM +0800, Joey Lu wrote:
> Conor Dooley =E6=96=BC 11/6/2024 11:44 PM =E5=AF=AB=E9=81=93:
> > On Wed, Nov 06, 2024 at 07:19:28PM +0800, Joey Lu wrote:
> > > +  nuvoton,sys:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: phandle to access GCR (Global Control Register) reg=
isters.
> > Why do you need a phandle to this? You appear to have multiple dwmacs on
> > your device if the example is anything to go by, how come you don't need
> > to access different portions of this depending on which dwmac instance
> > you are?
> On our platform, a system register is required to specify the TX/RX clock
> path delay control, switch modes between RMII and RGMII, and configure ot=
her
> related settings.
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: stmmaceth
> > > +
> > > +  mac-id:
> > > +    maxItems: 1
> > > +    description:
> > > +      The interface of MAC.
> > A vendor prefix is required for custom properties, but I don't think you
> > need this and actually it is a bandaid for some other information you're
> > missing. Probably related to your nuvoton,sys property only being a
> > phandle with no arguments.
> This property will be removed.

I'm almost certain you can't just remove this property, because you need
it to tell which portion of the GCR is applicable to the dwmac instance
in question. Instead, you need to ad an argument to your phandle. The
starfive dwmac binding/driver has an example of what you can do.

--yB3ZUxT4SMqLRowR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyz0QgAKCRB4tDGHoIJi
0lP1AP97tmKwKt+UudFKraxNYO3cXznEar2+8w3QtbqK/bnqlwD9H1utLpv2RnF0
zj3DwLQ3RnwTIwDLuyIHy2v/2FNbawI=
=i7sq
-----END PGP SIGNATURE-----

--yB3ZUxT4SMqLRowR--

