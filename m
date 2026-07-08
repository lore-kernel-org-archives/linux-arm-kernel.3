Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534E7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 13:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWprFcj4shuGHq5yxrj4ujGarnc9yIZ52TmhC/6XIwk=; b=qTFDa4mUaCQ701DdqU9S/lOkBZ
	cW2Tapnpr2t4sx4w363RkYmWfAJLW2NsoAuJq/RHa0/kykX4zEmrmoR86q3ezvShozG289kJLsFfL
	dzMJSjz/p7MRSZO22Oc+YDbeLI+lKsHfNpmLThc8P1tTcm/FChZInlqCVvZwefJ35L4lnxXBJJpJo
	uuF/9LgKTVqBQiDBAIZoIgQm7/DAhrQW8ByzakyvEtWbZVRKZiE8107fnlO2vYNic/wwQcUCsYGWX
	qgUPFNDI/QH0Kz9hJavkyjlBaPITXSJZrkGxTyxhYvAolEtiSTzHmNaXMJKGvo+KSHGozPeVBQAEG
	Bv/FIRRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSaG-0000000HDRI-2UgC;
	Wed, 08 Jul 2026 13:45:04 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSaE-0000000HDQh-0pdg;
	Wed, 08 Jul 2026 13:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783518290; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HBq9iS9jB6ewfkBvD6l/hbdZk9lWKDtHUbN71aNOZzsPLaY3iejK0SyY1j/4NBwcd9eUXrS+SniQU/2qJDseInB9kzWsSB1x5o6XcRGzRTkW3fzh9mXmRrTEM38b/bPRWHnLqzQmtdZzhYRN5kTvn5g1GWHdz5W38zNcUGDPR1w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783518290; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qWprFcj4shuGHq5yxrj4ujGarnc9yIZ52TmhC/6XIwk=; 
	b=m6cuxMrOVq4L8VkW/d073JvTz5zzxha3+ZKqTNROYRjUXXEbtxF1PaXWsflkd0SVK0gOre6P4sulmjdLtx0F7J7LCaaYCla+xr1elj1AHOb6EwnWOZdvoZfLQkQ5KHmdyjACCyE8UQsMr+OELEjcVBo68P3XkKdoxRn2PSiEQ64=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783518290;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=qWprFcj4shuGHq5yxrj4ujGarnc9yIZ52TmhC/6XIwk=;
	b=PB5MOWP6bfWP1uYvdd2mougUVnAF9pEe1jEhriEp822oJuoalAbrJcw9fBaiUssu
	cjDdpxFnM0U3H7mB8Krxm0/TwkhW5jVwv7DdRs4J8Eur4cNdBl08RvlqbcuxgegdjJS
	wDFfIWKK2x+8boHirToKdrVaKDl1pBin8nwP48/w=
Received: by mx.zohomail.com with SMTPS id 178351828794519.896016735108105;
	Wed, 8 Jul 2026 06:44:47 -0700 (PDT)
Message-ID: <d1e37bd4f2a05fed6c7bfdc5d9a0fa90c892d608.camel@collabora.com>
Subject: Re: [PATCH 02/15] dt-bindings: clock: mediatek: regroup MT8188
 dt-bindings into MT8186
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,  Brian Masney <bmasney@redhat.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, Philipp Zabel	 <p.zabel@pengutronix.de>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,  Richard Cochran
 <richardcochran@gmail.com>, kernel@collabora.com,
 linux-clk@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 	netdev@vger.kernel.org
Date: Wed, 08 Jul 2026 15:44:42 +0200
In-Reply-To: <20260701193311.GA1402559-robh@kernel.org>
References: <20260701-mt8189-clocks-system-base-v1-0-2b048feea50a@collabora.com>
	 <20260701-mt8189-clocks-system-base-v1-2-2b048feea50a@collabora.com>
	 <20260701193311.GA1402559-robh@kernel.org>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_064502_272435_CDB48B44 
X-CRM114-Status: GOOD (  23.53  )
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

Hello Rob,

On Wed, 2026-07-01 at 14:33 -0500, Rob Herring wrote:
> On Wed, Jul 01, 2026 at 03:11:07PM +0200, Louis-Alexis Eyraud wrote:
> > Regroup the MT8188 clock and system clock dt-bindings into MT8186
> > ones
> > to ease maintainability and have common files for several currently
> > supported SoC or new future ones, that have the same kind of clock
> > controller design.
> >=20
> > Note:
> > The `#clock-cells` property is a required property for all
> > compatibles
> > declared in MT8188 clock and system clock dt-bindings but not in
> > MT8186
> > ones.
> > To avoid ABI breakage, conditional blocks to check this requirement
> > for MT8188 compatibles are added, rather than enforcing it for
> > MT8186
> > compatibles.
>=20
> If the existing DTs are just wrong, then I would just make #clock-
> cells=20
> required. But please update the .dts files so the warnings don't
> grow.
>=20
I've tested to make the #clock-cells required for the MT8186, MT8192
and MT8195 system and functional clock controllers.
I did not see new warnings, so no extra dts patches would be needed.

I'll add new patches (one per SoC) in the next revision of the series
for this, as it simplifies the grouping patches (no more if/then to
require #clock-cells for the MT8188/MT8189 clock controllers) and the
note in commit message could be removed.

> The grouping I would do here is:
>=20
> - clock controller only
> - reset controller only
> - both clock and reset controller
>=20
> That should avoid any if/then schemas.
>=20

By this grouping, I understand you suggest having separate dt-bindings
files, that could look like:
- mediatek,mt8186-clock.yaml: clock controllers
- <name to be found>: reset controllers
- <name to be found>: clock controllers with reset controller
- mediatek,mt8186-sys-clock.yaml: system clock controllers.
- <name to be found>: system clock controllers with reset controller

Is that what you meant?

There is no pure reset controllers for those SoC so no dedicated file
would needed at the moment.
The system clock controllers all have reset-controllers, even they may
currently be not all implemented, so no separate files for system clock
controllers would needed as well.

Also, from what I see the current dt-bindings, the system clocks
controllers for the MT8186/MT8188/MT8192/MT8195 SoC have the #reset-
cells property but it is not required for them (examples:
mediatek,mt8188-infracfg-ao or mediatek,mt8195-infracfg_ao).

With the patches to make the #clock-cells property required, I already
removed the biggest if/else block in mediatek,mt8186-clock.yaml, so
only the one regarding #reset-cells property remains.

So, should I create separate files, following the grouping suggestion,
for the v2 of this patch?

Regards,
Louis-Alexis

> Rob

