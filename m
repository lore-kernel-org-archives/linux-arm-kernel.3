Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FD6CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlGhzosbAx/MnTG201aZX89KpmBUDF+NZupmAYmJflU=; b=JSJVjslO9/YMIAsufdeLeeaWkM
	AlGoRn7SPLzQj4cfoY4r232GAZEKGMQYHuKnsEbvYRLd5vR6vls2gqp+OQQZR91E+fPAoMqHFBfmZ
	K6JOi00YJlLkAYAY19w/+zWZ5b53F/lHBLiYSgJpZPYDnVoKi8SKx82ASJBT8I0iJ3aG+45C3rkqI
	g5VEID39Tou7HdxnR+3HOMY4nHoBSBpFlQu5zHZsyIhaL4JrjaH1uqx/0nRB+FqyHJ+CGHZQTJHVb
	ZJFJxs18k7yKlClFZolQToujpxWlm7RgGGx4Ort9Ieo46z3bUyZdB/4UX6h21//KpkGxYvCO4hvNT
	6e84xIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0Oh-00000007Hpp-31eR;
	Thu, 23 Oct 2025 18:50:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0Of-00000007HpS-1Ewj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 18:50:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCBF441B6A;
	Thu, 23 Oct 2025 18:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5E0C4CEFD;
	Thu, 23 Oct 2025 18:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761245448;
	bh=pmkyy2iRIDR1hgrgKOXi1EcISl1p6QEbGBXwWbteuVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZl+5n9uvNCE31Qo09O3KwUURfiUcdSN9aEx/GcGhai6II3myGrfG2YkIFNE0K0V6
	 FX0N2kamEmionLI4TqLH8RGLuO519ty2RvjjIBdULcTN/4ba6bj5x48r8iJti/MwbL
	 jMTEuYkIYYBnuapX9PPyqGPSmgwbr7lQLu5PVeb/UTGgack4qxS/MkMDndWW5Rd7oh
	 YqcQoxNM52fen9U2Gj8m8yalWAhL2WHsxuEk3CQUpUnZwZ3p/t7V5TttjFfteVjiBy
	 2NOUUW1EyXqRAwqGW8djEhLU5c70+B2OFVgFipS3lhJSgS17kFmmV9ggted1bZ6jXl
	 UuFPt1C8HPecg==
Date: Thu, 23 Oct 2025 19:50:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH v4 11/12] dt-bindings: pinctrl: stm32: Support I/O
 synchronization parameters
Message-ID: <20251023-mop-deuce-2a5b364c5cf2@spud>
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-12-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9MD3BrnpDScLq+jf"
Content-Disposition: inline
In-Reply-To: <20251023132700.1199871-12-antonio.borneo@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_115049_353917_6C31FD49 
X-CRM114-Status: UNSURE (   9.97  )
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


--9MD3BrnpDScLq+jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 23, 2025 at 03:26:59PM +0200, Antonio Borneo wrote:
> +        # Not allowed both skew-delay-input-ps and skew-delay-output-ps

I think this sort of comment is effectively pointless, it just
reiterates what the binding says below it. If you wanna have a comment,
explain why they cannot coexist.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> +        if:
> +          required:
> +            - skew-delay-input-ps
> +        then:
> +          properties:
> +            skew-delay-output-ps: false



--9MD3BrnpDScLq+jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPp5AwAKCRB4tDGHoIJi
0nzFAPkB+S3fwX4Vb86zDJEk5T4qXXJxIkXaxZXRkZAETxDq4QEAzciIBv0IWNBE
6H75honujjY5hI9iJiWp4q/TraC1EAE=
=tf6q
-----END PGP SIGNATURE-----

--9MD3BrnpDScLq+jf--

