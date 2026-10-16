Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBED8CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 07:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRdkht83PecwdZYGF4/EuY654Yjjl+PVaSprnxYvdgs=; b=sPcf7EQsu0sUkXiIrOWPGLbhTX
	OWe1fpny/iP/2CCxeI66r0kEyFO2tNHpfFacmNBJb9gnJkFePmYxaUzvRLaNixUKq4P8QhUPnU/Sk
	QBYFB9Cn68TRpXOPxH+6rprypXpjczJEIRvFv+hG9oEOrDjzaNFxxji6LWBkSyL7P3o486G2gZw4A
	4b5CoUuCHmzMdhQNGHrP6966pCAS6ZboVrpw6i9gCEq9vdGkFMRi+6AwtgiA29M6Vn+cXYbSF19HC
	7xySXXGvUnclgiyTIQFQCoQ29jDoAHgqrZp07QPSlCSHzm6ArOmmGKipxLDTB6h8l2iEx3Ye1XnLe
	XZwzAh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcEn-00000002Dmh-48lC;
	Fri, 16 Oct 2026 07:20:21 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcEl-00000002Dlj-2ABV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 07:20:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so437385f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 00:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135217; x=1792740017; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRdkht83PecwdZYGF4/EuY654Yjjl+PVaSprnxYvdgs=;
        b=soZvAZ0Kij3JLIN3YNhpnwY0qZ11UBTiGmGHjE9b8q6mJkEv4Hau+pFKeXXyGGVhqU
         ikMoAUzU6qkVPO3CvgrKJ4ddpPwrDrQE65nw06A5pQ7zIAbTDc6DYOdWALYRHJioZNgp
         ZLMCil8DK7mDvyP7hjyPl2fMopjdVA09kO+LgLvPPQJUIpftnf3Sd0EEETXQjuqdBjds
         G4qpZM0Rm6kdV9+oMuD1o6opCkA8uCpJQc42tbsmMYaWL1wZUgN+MzUOpQ/G+Ejs9uDW
         BOz3QBIyyHwDiDCi7gF1nhhRYsFCK7zhfD5Jp5EuPGZXyHKD0Mo/YMj5TGjLcfCMO+wB
         P/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135217; x=1792740017;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rRdkht83PecwdZYGF4/EuY654Yjjl+PVaSprnxYvdgs=;
        b=R/NaTnApsMLnZSCM51sw2D8g5EDCp6Ht8CL2VaWcHKgqImuDVHU7LwM7RI+CH7qk/R
         dKxasJ7k2W3PTGH/dwpuvQO9Hd7HdGSCWmapxeBpWHhqhKInRp3xKvkik4tFluMW4cPC
         BtNo0Ai4NkfToVBeT0BIW9S0Q+zG++oIOeSFhsCz5i1gGVoqN9YXZRFYE9Ye1pTXPbBe
         SQtaqn/TLKAi48Sw79iZ1Dj8dDyFxenPK5w+R9Rm8JjHoSL0+ji0k5SVzIAdbRcC5sDE
         oV2m/5OZ34hS26b2d3dsSjFY5+viNY6sRv6cHlNQO2UW7a/xlXeT/d7x51v89qc84BXe
         n/3g==
X-Forwarded-Encrypted: i=1; AKwUvByf9x18zMfvD6jBeyVBGCKb4qHBaFviTHp9eM2mNfZ1t/zaDsEv9ZXZX/B+yujhoIo4j4hFe+Plc5GcI18qFW/y@lists.infradead.org
X-Gm-Message-State: AFq9FYKiTyb8HHvS+Y7tuwp0M6qhKjfm2LzPMPdcPesGCDTnfmgO6n18
	+GyZcbtBxhJFEgmYt2a3vQbxt82csaA/CY0voNHa8Fx78IRaz+lWXMaW
X-Gm-Gg: AYBFou24ynptEkcc9frobw6YwsFrymrdIF/EBaqh0ut3LTA3LjfEFGiz4329oTLL5Og
	fx9bUoO55RgkIBp4nfSYlRczL9AOkkNYUYrx2ob1BCV4+IWYnu5kYh7SOO5cONzqW7tv6oB0wb1
	jY8MuFAK432N40VUPb3pbhncTjLGDVEybaFohr8XznGxCafsLyWrh4ZoZHUbHJzgw/QmzSc+Tuw
	AUG7asV6wmsx9bBUWBgZjC3rFWGAa8JRaO6DGS0fI7+lp1Z7zoHDnlVs6Xj3WVeE6cqzeObYIRg
	w/olr8oq65r06kYkvAFeJmo7GNuZmq0GGM1K8WqwxqJhj2dNk8PoZYHEz6PIcICTkcAF+igiS6b
	sLT9cuLq+739NK3nRIHfYiI5yDdjOukGnRDJxPaAoPDPgQFEUfL+1E4G2+nL+WurusOdMrn6zIG
	10+e5qVmeXjwnO97wPDSzmdHhBNLWYQ/X6EyfKPaVzot0Z1fGi5ahBIEhcejivBM9VsFXe22aou
	NFzh78WRrkFURHQPYB6gu79THEQ2NEphEzl3FgpVWE3Jj3LAQoPN7k1
X-Received: by 2002:adf:e194:0:b0:48d:db77:d124 with SMTP id ffacd0b85a97d-48ddb77d4ccmr30168211f8f.6.1792135216962;
        Fri, 16 Oct 2026 00:20:16 -0700 (PDT)
Received: from silicon.doe.home (194-118-146-41.hdsl.highway.telekom.at. [194.118.146.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8d12sm3220071f8f.36.2026.10.16.00.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:20:15 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 mfd@lists.linux.dev
Subject: Re: [PATCH v13 04/13] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Fri, 16 Oct 2026 09:20:09 +0200
Message-ID: <D_WXy70pRh6G3mLeAQ5LsQ@gmail.com>
In-Reply-To: <179198492486.839288.18023026004912443161@kernel.org>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927-zx29clk-v13-4-70d8f673386c@gmail.com>
 <179198492486.839288.18023026004912443161@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartSBEYK6dqR3etXguuqPrywA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_002019_563032_BAC0FA05 
X-CRM114-Status: GOOD (  14.25  )
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

--nextPartSBEYK6dqR3etXguuqPrywA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Date: Fri, 16 Oct 2026 09:20:09 +0200
Message-ID: <D_WXy70pRh6G3mLeAQ5LsQ@gmail.com>
In-Reply-To: <179198492486.839288.18023026004912443161@kernel.org>
MIME-Version: 1.0

Am Donnerstag, 15. Oktober 2026, 17:34:06 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb=20
Lee Jones:
> --- checkpatch.pl (3 issues) ---
> Line 227: WARNING: DT compatible string "zte,zx297520v3-topcrm" appears
> un-documented -- check ./Documentation/devicetree/bindings/ Line 228:
> WARNING: DT compatible string "zte,zx297520v3-matrixcrm" appears
> un-documented -- check ./Documentation/devicetree/bindings/ Line 229:
> WARNING: DT compatible string "zte,zx297520v3-lspcrm" appears un-document=
ed
> -- check ./Documentation/devicetree/bindings/
> ----------------------------------
>=20
> Is Checkpatch right?

No and yes - the bindings were the first 3 patches of my series. Since you =
are=20
cherry-picking the mfd patch only, the bindings will obviously be missing.

The bindings got merged into the clk tree and made their way into Linux-nex=
t=20
already. I guess we can either ignore checkpatch and the issue will resolve=
=20
itself when the trees are merged together or I resubmit the mfd patch when =
the=20
bindings made their way into kernel/git/lee/mfd.git . At that point I can a=
lso=20
re-add the MAINTAINERS change and it should apply without conflict.

I am still fairly new to this - is there an option or issue I missed?

--nextPartSBEYK6dqR3etXguuqPrywA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrR0CkbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoivEIP/0vSfR3/njgy0m1LUgVO
q+5cFYUtXHEkTjMCC9Q+aMIgABBs0SuqM6RR5Rl3VJe5Mv7oqMFg9y8bAu+8+fxn
wc20CEh9mqrONVRIpI9XleietOAuGLQiOEA7TMLpBJUZcGgAbmmrWR5RFIbff7AX
xTD2LumJqjHDxvFgzTpZCotBjcRdXbz9OdGDZktoolRSX7ytW0EpCMIbtMxHgjVp
kXQs03o4E6LjFU5d72FpIFR2wKLMRah37age3BllAZt/34RtVjPb/KZtARSMAOGZ
rpvXE6CjYhZ336gPYfcqEOFGcrix7X4krLw9HDCukXILHtMIcDAy/9d+42yL3gXf
yqcQ9w9o8BBNpWoLM5FttbLXu+YgkAkdd4nLCnrZDRseJ+EeBRYM38ARM09q5yie
GorF56gygRU5iua1+FzC/cPOsynDoXErJVeqf7uF5kmLjEDkW0HnWRTd4hMJ7GMI
lb61VJSbCft1qkWXgwRbkOKAfjcW8F3oTWfKJmNJV/e/rTlfgiNAxoKjtfQ+SDNG
BYcy06GCOI3ec0pSeGp6wJDr5/+/ULQr04Vm9t0CGvZXXhCy+r+jVa9gpT82iRbZ
f9RTyjHnhjnsH4PZVOyqWQvE2zvimN7AwLp9LjFZosE5vyNOUHSaopJBzLy2En7T
3XFhbOb1zyS57Sj8yBtDKIF2
=pb5+
-----END PGP SIGNATURE-----

--nextPartSBEYK6dqR3etXguuqPrywA--




