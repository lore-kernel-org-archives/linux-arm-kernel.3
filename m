Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0B9CD6E6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVuZuEBIULjzQABGGJSQfIDgV0lIC+f74CyYOz83UH0=; b=cwOVAPafLy2TB9EMqxf47oRYMT
	DVGZNSH6aHKpLDiehcc3V4m0UUgIpscoMNSREAOn27X7OKKOkFKSdpzgZCqJwzRNwlucJYDoOv5t7
	m298zqCjfekRh4/GqZaO570GUfJwrnBlKPdvaN+AUWI5gUvWfjUklDZJiV9+XQc9ViW1UdHiw6sLr
	8ApmQtcl2A9W+/V670JDxmDtpuYPKgrXtmidGPYyd2i8UGV7jlOfcMWxuwrZEBassKjhPh/xWCotN
	/q5ccdq1I0UMcFWAZuXvKpFidOjRd9tbS6eDJprCvvgddos3x2ouFI1fldVGnP9p0aR4wTg8Fd9dC
	RjynMhhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9ui-0000000GzNG-2npN;
	Thu, 04 Jun 2026 15:23:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9uh-0000000GzMs-2jFF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Jun 2026 15:23:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pVuZuEBIULjzQABGGJSQfIDgV0lIC+f74CyYOz83UH0=; b=owntsuAXb9GUQz/kCVnq93ffSk
	kgsOSqB+ofq6nsUx4piE0FyaiyEHX1+S5INZw3vCwm/FgMgTkxXFSMBQyeJ0jdzfBPPqgev9RoR/k
	xvF06tRkplVtDCsVe7yCbm0NShxaF1C9y8CI5NWu2XxzdIBUZ5jJy59l7MtPQAdMs/njoc/hMI3gF
	dzwoSHXWgMbg2kQ4bdGbYpmCQ0OzNDsDR9I0vsSgAJEGC9ufyN9zyyAv9JSYfsc9QQBREnqEaIT2+
	X951uVZwNJac02WZKb/sIo3VDYPikS/4iUaYllQAxm6WGIi10BnvePMur1pAeEaTrh70J+IJFCy5i
	eAebvC1Q==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV9ue-0000000EVV6-3Wnf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 15:23:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV9uP-0008Cm-TC; Thu, 04 Jun 2026 17:23:01 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV9uP-0016D7-1k;
	Thu, 04 Jun 2026 17:23:01 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV9uP-00000000CcW-1o5o;
	Thu, 04 Jun 2026 17:23:01 +0200
Message-ID: <f92114a3658185b57bffe546c0f4079a9d39afce.camel@pengutronix.de>
Subject: Re: [PATCH RFC v3 0/5] ZTE zx297520v3 clock bindings and driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney	 <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 04 Jun 2026 17:23:01 +0200
In-Reply-To: <2062167.PYKUYFuaPT@strix>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
	 <5620a8969da87612a2d89578be656b5d00662635.camel@pengutronix.de>
	 <2062167.PYKUYFuaPT@strix>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_162316_993151_A004CA74 
X-CRM114-Status: GOOD (  15.11  )
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

Hi Stefan,

On Mi, 2026-06-03 at 23:49 +0300, Stefan D=C3=B6singer wrote:
> Hi Philipp,
>=20
> Am Mittwoch, 3. Juni 2026, 11:50:14 Ostafrikanische Zeit schrieben Sie:
> > When there is no interaction required when operating the clk/reset
> > bits, I prefer the reset driver sitting in drivers/reset as an aux
> > device, especially when register access can be abstracted via a shared
> > regmap. Some of the reset drivers under drivers/clk just predate the
> > aux bus.
>=20
> There are two interactions:
>=20
> The register lock because all LSP and at least one TOP register contains =
both=20
> clocks and resets.

That could be solved with regmap.

> Shared register definition: in the case of the LSP clocks breaking up the=
=20
> composite definition would sacrifice readability.

That is a matter of perspective.

I had a harder time validating that the resets[] array is properly
initialized from the two different composite arrays because of the
unordered reset_ids, and some remaining resets[] being filled via code.

It would be much simpler if you split the reset definitions out into a
single, separate, const array, indexed by reset id. In fact,
I would suggest this even if you don't intend to move the reset code.

> Neither of them are insurmountable and I can certainly arrange a separati=
on if=20
> asked to - but my preference is to keep them together.

I'll leave this up to the clock maintainers.

regards
Philipp

