Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE9B105A596
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 13:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knQrS10xE8pCiFxKeddUKvT0NROChU5ox+YUb1+I4Jk=; b=BzF6m2IhAFO5+xzguxa9se/Scp
	+pP+IA8eTOx7JxtmK8aE6kKo0fZANkh9CfdzR3JG9p1r9uiPPDXdyBmMPtGl8IvsSw1zzQ5ef8B6t
	bzYEebT77z7xrPtCVUHPM2HIpYIdPdcxC/xW1ZYl7sLFFSbmQ9Hw03EWwVo+KNalFEINxl6WweZW4
	9jvAMK0lhD1OxQLNiB/iVc9Ymp89nEya9kG7ph5tNrurpc8MCLJE829wHV5zJVy5ScX9NfGwqp5sl
	cKdtaMjdAxe9TCOYA0iPuop0nvdXowKp+utsFVDvzR2HbsZAMRDQh73ZXdF4b/3DdMtwvjnAqKXYU
	/I4A9M+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0foT-0000000E786-0RFm;
	Thu, 12 Mar 2026 13:10:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0foP-0000000E77j-3WzM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 13:10:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D39C8402C0;
	Thu, 12 Mar 2026 13:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87868C2BC86;
	Thu, 12 Mar 2026 13:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773321048;
	bh=knQrS10xE8pCiFxKeddUKvT0NROChU5ox+YUb1+I4Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D/PFIyj91n4cjwbkmFrtz1Zp7ltSngsuz/KUHloIpRJcdahbkIMAiUXROd+gGnVOb
	 Iw1Iwc0yAYWvNNZj178FpoLhC5TYOP7Pmp1fvWRDqKAhRMDg2WEuxAeCb6MGSU+Egk
	 73pdalxpbDWCtEsQSVXUKwDlYH4Y0Kha4cPztJa4sDX6hpbUPusZIkB1784SyljfPI
	 4ghgvGGPrpjQ8jiHYiC6WIp9P/SdZcDym9Br0ffyKZF1aEOJDShPudm+SEdxa1e666
	 oUO3wjvTpZz7btpB1PIgJk2lhCAtBhOW9K/0XQJ0gA1R51AQv5NUJOana1FjpgzVs1
	 R1gBn/o3oM87A==
Date: Thu, 12 Mar 2026 13:10:41 +0000
From: Mark Brown <broonie@kernel.org>
To: amitsd@google.com
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v8 4/6] lib/linear_ranges: Add
 linear_range_get_selector_high_array
Message-ID: <500e053a-9919-4c63-a042-30a5e5f09c6f@sirena.org.uk>
References: <20260224-max77759-charger-v8-0-eb86bd570e9c@google.com>
 <20260224-max77759-charger-v8-4-eb86bd570e9c@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z6vnm6QHpA1WTayS"
Content-Disposition: inline
In-Reply-To: <20260224-max77759-charger-v8-4-eb86bd570e9c@google.com>
X-Cookie: I feel better about world problems now!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_061049_908519_AC5E092C 
X-CRM114-Status: GOOD (  11.65  )
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


--z6vnm6QHpA1WTayS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 01:45:34AM +0000, Amit Sunil Dhamne via B4 Relay wr=
ote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Add a helper function to find the selector for a given value in a linear
> range array. The selector should be such that the value it represents
> should be higher or equal to the given value.

Acked-by: Mark Brown <broonie@kernel.org>

--z6vnm6QHpA1WTayS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyu1EACgkQJNaLcl1U
h9BlIgf/WMBGgptFYb7yIkxGUKOn+mEm5q45nldetnrV4TDR6/fAFjQxqU/GOzxS
+RPqXEnr6F/3iDWu5WJimjJi9gjJmxkw52yeg39ccZj3DOA2IrooBLGMRFMOqaj6
CVnKmk6oOv71y0xclOYuRpt3je4UIYAwViaJds5ASxPTi2qnDSmjDVez2iBwbuwr
FJZKbzW7hqrcGiRLLkU5TS1+BzMSP/G1ErzLcduQ24Vtc5zwys6wpnkny7ma8URw
eQVUJX+avpSiNGQxBSlOcFUypkh9ISW7OVo67fk76i9MfPiIJZw+g9YtwPKmq7pG
2YWuApGAT4LC24MHQDEFu9Umvmuvqg==
=sJI6
-----END PGP SIGNATURE-----

--z6vnm6QHpA1WTayS--

