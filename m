Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3A2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpMdBg0t63EKF4kzfIo6lKo7mjyYlKdkf1BbKyjJjb8=; b=Qg5S+5wyQCIq+yvFeEXxY9qwNU
	sbFNmpkCbsNf1bmL3iojDoU8wyADHzoyKa3ejvJoi4wggmAgSLaWlSg4dJQZOmpSQU8/S2htEG6PB
	Lu+/fwmH2DcVNO/FNITVkG/sO66fDugEvs7E2CN9Kvl/DbGWd0J9wUPBnuSd4Qj0I/rrC5yXu5ohD
	vTviORLgIH9I9hsFQyAMUrUqz8AUvPZy5T6OzibTV+RW8cg1Ii1hQPi59XV/ECcklRLuNAcenZcCr
	P1FSaRvtT3Lkc6TBVcuX/kt3vJBr9o1U65nlkXwa9ZklSZJhnfXs53P0b6rSLS1zx3pQXtkvFizLx
	505O6YQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtAy-00000003C8l-0y50;
	Thu, 09 Jul 2026 18:08:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtAw-00000003C8c-0NLI;
	Thu, 09 Jul 2026 18:08:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C656600C3;
	Thu,  9 Jul 2026 18:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4251E1F000E9;
	Thu,  9 Jul 2026 18:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783620520;
	bh=KpMdBg0t63EKF4kzfIo6lKo7mjyYlKdkf1BbKyjJjb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W+rj1TPl91K7+119FECevuFLOiRbrgcbVQD1s8twt7KW/GO0lKiBkvYEousnXc1CH
	 2BPxvEkex3/kJOMcmj0NcXYj1VOdezrGOM/Wgjdln1/mr7g0lsc6UKbU6UnqfeQFx3
	 5z37Xx+RQ1lZE+fy+YO0TK9EkwyZI6jy32DHCygpHAPvGA+BayCRBkVOSshjnDQ7r7
	 IQs8Wymii7Zp/DQsdIM59T4ONrZ6K8gZzAuqyXO8Jv34Q//fv7hTJsb+1Cemp0m7zx
	 1Kb64Z0hcOgX9vP+T7dt4TsIqHXoEYFzEYmohHPp6TjxOQaS3A0EU95l3dinq2Ed12
	 2jfZjqTyrHlGg==
Date: Thu, 9 Jul 2026 19:08:35 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 01/18] dt-bindings: clock: mediatek: Make
 '#clock-cells' required for MT8186
Message-ID: <20260709-clean-sphere-fd769ca48015@spud>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-1-2926da3db6cf@collabora.com>
 <fe7dee8d-afe9-441e-898b-695aacf1aa04@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5zJo2XKDUk4B95UI"
Content-Disposition: inline
In-Reply-To: <fe7dee8d-afe9-441e-898b-695aacf1aa04@collabora.com>
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

--5zJo2XKDUk4B95UI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2026 at 04:01:49PM +0200, AngeloGioacchino Del Regno wrote:
> On 7/9/26 15:42, Louis-Alexis Eyraud wrote:
> > Both MT8186 clock controllers dt-bindings (clock and sys-clock)
> > document the '#clock-cells' property but do not enforce it as required
> > property.
> > As clock provider nodes should define this property in devicetrees, add
> > it to the required property list in both its dt-bindings files.
> >=20
> > Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>=20
> Though you could've done that in one commit, or just skipped the addition=
s in all
> of mt8186/92/95 and went directly for the new one... IMO, it's ok as you'=
re showing
> that there was an actual mistake on the bindings for clock controllers.
>=20
> Same comment applies for patch 2 and 3, btw.
>=20
> Anyway:
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>=20

Prob should have a fixes tag too.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

(sorry if you got this twice, mutt crashed while sending)

--5zJo2XKDUk4B95UI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/jowAKCRB4tDGHoIJi
0qNOAP91iKKhhpgXrRCzsFjML5ImnHOnuqLMoyVV1+9USVf15gEAvSTTG5ZigGyY
hQKGPjuMwYYafVzdOOBrJIzylQJvigw=
=4HEP
-----END PGP SIGNATURE-----

--5zJo2XKDUk4B95UI--

