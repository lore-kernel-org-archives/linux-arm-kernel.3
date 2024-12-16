Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F8FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 20:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vR3jb2+JWQ/JgXRLTRGechUkf1+2/IOW/JKHMXJKLU=; b=weDsr2WmshYT8zDVb4ccvoQWGv
	DsbLf1KRs2cKAVjA562KI9T8xUAmh99w1qLl6SUKuZEjl1LBhPBKbVrlZHChidn24VRushdBgdp2/
	/7w57bIPAEJ08iQuvHmumx31jp1Jm0uGkrm20xjlrlUbn91JpR1zGkNP6V0nGnbvJOY83RSCxMkhH
	us20nY2S3JP+JnG7pq8Px2NUck9QmSe2ScmnF+l0vUxQg57vqPF0BZ895AVI6neqzm9D5XvMNwEnL
	nia4JNh3ZqtYHuiQ0HWOc6M6ZlpapRuWIVgzyahuj76WoW/ViMoSwHJMiq0T9cU/AHuLPAlx/fbxV
	AVtECzoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHGb-0000000BBo2-3fhi;
	Mon, 16 Dec 2024 20:00:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHFW-0000000BBb8-0f7J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 19:59:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7E9EDA41A6C;
	Mon, 16 Dec 2024 19:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610BAC4CED0;
	Mon, 16 Dec 2024 19:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734379165;
	bh=9pg4FXAuFe/CPveJLo1jazZb+qVovMGyDclZS6yjorc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r4HqgMKaDL2s1piTwpNzo//zvQB0yLx8SqNF5Knx/Qzmnzk1oSxA4oejBzeO8aspj
	 z+Z8EE61K2BFCQWoPh2pKtn5ex2TCasTLFSU1GCTekiuIIi3CVpycVliAZKgDTq0gg
	 p95h/C8CoxyIvuMlbCKzjWz8vlADfBz/DQf/TC6SNuFcy5iELXRYghwMgooSaV2r8W
	 oEodblxCK9ZeQ1w7muO6AJzbxYVMvukbJmhP0VV8LWfaP15EF2rKzzTyRGWCZiCg+4
	 +jqKMG+cjQ1fk3e8JTrIYdi16VvzZ98OGuzrs1yKxF+XO8qS/blGwUWRxwAXHgy2Bc
	 /R1OD10pcmJQg==
Date: Mon, 16 Dec 2024 19:59:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Frieder Schrempf <frieder@fris.de>,
	linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>, Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 01/11] Revert "regulator: pca9450: Add sd-vsel GPIO"
Message-ID: <20241216-unchain-respect-1c344203a140@spud>
References: <20241127164337.613915-1-frieder@fris.de>
 <20241127164337.613915-2-frieder@fris.de>
 <20241128-candle-guzzler-b7ea4e5ce643@spud>
 <b5456480-a68f-4e71-831b-f145453e2646@kontron.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6Wi4ZHhW6IIDtlCK"
Content-Disposition: inline
In-Reply-To: <b5456480-a68f-4e71-831b-f145453e2646@kontron.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_115926_331596_14FB67BC 
X-CRM114-Status: GOOD (  36.98  )
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


--6Wi4ZHhW6IIDtlCK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 04:59:06PM +0100, Frieder Schrempf wrote:
> On 28.11.24 6:37 PM, Conor Dooley wrote:
> > On Wed, Nov 27, 2024 at 05:42:17PM +0100, Frieder Schrempf wrote:
> >> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>
> >> This reverts commit 27866e3e8a7e93494f8374f48061aa73ee46ceb2.
> >>
> >> It turned out that this feature was implemented based on
> >> the wrong assumption that the SD_VSEL signal needs to be
> >> controlled as GPIO in any case.
> >>
> >> In fact the straight-forward approach is to mux the signal
> >> as USDHC_VSELECT and let the USDHC controller do the job.
> >>
> >> Most users never even used this property and the few who
> >> did have been or are getting migrated to the alternative
> >> approach.
> >>
> >> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >> ---
> >> Changes for v2:
> >> * split revert into separate patch
> >> ---
> >>  .../devicetree/bindings/regulator/nxp,pca9450-regulator.yaml | 5 -----
> >>  1 file changed, 5 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/regulator/nxp,pca9450-r=
egulator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pca9450-reg=
ulator.yaml
> >> index f8057bba747a5..79fc0baf5fa2f 100644
> >> --- a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulato=
r.yaml
> >> +++ b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulato=
r.yaml
> >> @@ -77,11 +77,6 @@ properties:
> >> =20
> >>      additionalProperties: false
> >> =20
> >> -  sd-vsel-gpios:
> >> -    description: GPIO that is used to switch LDO5 between being confi=
gured by
> >> -      LDO5CTRL_L or LDO5CTRL_H register. Use this if the SD_VSEL sign=
al is
> >> -      connected to a host GPIO.
> >=20
> > Your driver side of this, that I wasn't sent and cba downloading an
> > mbox of is not backwards compatible. The code has been there for a few
> > years, are you sure that there are no out of tree users or other OSes
> > that use the property?
>=20
> Yes, this is not backwards compatible. I introduced the original meaning
> for the sd-vsel-gpios property based on some misunderstanding of how the
> hardware actually works. Therefore I'm quite sure that except for the
> cases where someone copied my erroneous implementation into their
> devicetree, nobody has really any reason to actually use this.
>=20
> In-tree all users have been removed (one fix still included in this
> series). Of course we can't be fully sure that there isn't someone out
> there having non-standard hardware (SD_VSEL not connected to
> USDHC_VSELECT but to GPIO only) and using the old sd-vsel-gpios, but the
> probability is very, very low.
>=20
> IMHO taking the small risk here is better than keeping the misleading
> implementation which will likely cause confusion and failures in the
> future. But of course that's not up to me to decide.

Given that the !property case retains the behaviour from before, only
those with the property are affected - which means if it does end up
being problematic then it can be rectified at that point in time.

> > tbh, I think all 3 of your dt-binding patches should be squashed rather
> > than drip-feeding the conversion. It makes more sense as a single
> > change, rather than splitting the rationales across 3 patches.
>=20
> Ok, if you like this better in one change I can squash these for the
> next version.

Sounds good, sorry again for the delay getting back to you.

--6Wi4ZHhW6IIDtlCK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2CGmAAKCRB4tDGHoIJi
0pO5AQDDH9YtmHz8YalRyuddqOb/sFuBFnCARsqnUFpN8oFinQD/Q3AD0LQOpMpo
yJ9zX1H8uFekOTFcji5o0ncP7pwLtQc=
=VUPv
-----END PGP SIGNATURE-----

--6Wi4ZHhW6IIDtlCK--

