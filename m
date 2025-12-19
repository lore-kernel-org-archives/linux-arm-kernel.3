Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64585D711D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlXr7igiWKsjjzIb+5AsG+BOhT+y2sXxD6hRFSbAez4=; b=yYY2QIXcG3FbN7c98VfV3pukJI
	g6P9ydSrxjzwKmG6rYIb4Evj4HbcGFboQv5ADcZ5/pT9k9v/C+EIp14Lfdb85LY3dYJlNZ1s1IQdc
	+XhIBhBXkNmNv7J8Uz7AlOSRDMwXMSmNk5VzGnWggVSykDN+OIPKBxFIW8fYRjHAdaXdLOZuTTwXK
	sHjwk1Fw3NkhEmjSLQ08/Uct2TR00CE74xA3AC9zbQExFz38yFGUPciaiC1hxbcQzrEVA0NmGMARc
	yEppc59bz40LEY2IR9eH4gw55f+PM4vzpYVo7dS6WaSm2vKWMXCMHYdsvGZK08LF/4vmCBAAb+NQ2
	rd16wDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWER-00000009tNw-08W2;
	Fri, 19 Dec 2025 08:53:03 +0000
Received: from mx-relay03-hz2.antispameurope.com ([83.246.65.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWEM-00000009tNU-42Vc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:53:02 +0000
ARC-Authentication-Results: i=1; mx-gate03-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=XlXr7igiWKsjjzIb+5AsG+BOhT+y2sXxD6hRFSbAez4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766134353;
 b=VefSu8fgmHvPOagvXvKcKWFCdSDQe5mdOLYhOm4TPt905dl1g8gqeuTe8lZVYjP6xH5OYaid
 Ta3UxluG5XCLnagHfIxdOAM4PAdetifTcIu4WyGT+I1ZHF9tAPOp8MAn42s5cZL6efgB4EjmnH2
 Ex5aPTnSnXkzEiFvMenenow6LNWvQ+KhBqcWxRhKidgNF3SWdigbbXrAPXQ7TSUI7Kond2eAdzr
 tSMgnuION1YVkrwwlOdNo4jNLTqwh5QU2gon7VwVYb0w9Bmt3ZRLJioa8khwRDnKcZsoQkVm9LA
 39WzmiOYLhoKiVYlcKcKCZPPr3wNLnhSiEG/O2xq/uk0A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766134353;
 b=iL0BAjD2PVv+lDBqtDe/WtQQ1r0GN7+KrwhrKhDmxca9297dCBZNqRZrsFZu4B8Msa4SIQe1
 XabN/qoev+tMXG2qXeDEGq96yeylU43IHpHKZ/SQe9i/MKPpWo+lpAb56roVzKxRgSSvZxkMslO
 D0YP0zqDZOH7T69T4cGk67b4YRjAe5WZ3S6tQbDTgFjocxLwrGBE+Rk41FWSk3ajv+GK7fIAg+C
 aX8pBGkqSL0WBHVk47f/l8377lQGOzapmXUd2VFoMLWJX3Jh+9qG/3vGwNaXzxMQ2YchUZwMyqS
 hCEtoxevdvsdk9JbR7c5A+AoROgheNrsNhpsft779M+nQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay03-hz2.antispameurope.com;
 Fri, 19 Dec 2025 09:52:33 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 4751A220D57;
	Fri, 19 Dec 2025 09:52:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 0/6] Support TQMa8QM
Date: Fri, 19 Dec 2025 09:52:15 +0100
Message-ID: <24355727.EfDdHjke4D@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay03-hz2.antispameurope.com with 4dXh9s3M9TzYd7D
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: d9ceb68c40de01de860771274803b5bf
X-cloud-security: scantime:2.014
DKIM-Signature: a=rsa-sha256;
 bh=XlXr7igiWKsjjzIb+5AsG+BOhT+y2sXxD6hRFSbAez4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766134352; v=1;
 b=go0uTF/11CH+7sUrcd00EmbW+4egnQTToaeN3O+N9ueaw8uv9mUzqL9Nr5tOw4FqTR2E35KU
 XZprG+IsPE42PcgcN57qWpCwXI5Et4SpJcWqvYGh023vsIvSGyUrbdRM4qqaU1chd+bVaAsQETL
 IjPrOk06arYz5wmF3tCvi4NplrYNorRTr7gR1rzcHS+WB/QZRpB5w/XY9xjmvbPFVGqe+ACH2TY
 6d6n2AiJeME3iC4dsoUS/9F/Ls0sRiRNaKauJmWjWDu/CgxddXE3Xxlvbz6qEq7jpzWKMiZgXni
 37ny+SFfDsHCTnmTNB/HqkqV23mIQ7b8z62l4j9ATMcsA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_005259_280451_934F9839 
X-CRM114-Status: GOOD (  15.09  )
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

Am Donnerstag, 18. Dezember 2025, 16:28:39 CET schrieb Geert Uytterhoeven:
> Hi Alexander,
>=20
> On Thu, 18 Dec 2025 at 16:22, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> > this series adds support for TQ's TQMa8QM. The first 3 patches are prep=
atory:
> > 1. Add support for clock-output-names for clk-renesas-pcie. This is nec=
essary
> > as clk-imx8qxp-lpcg.c (driver for phyx1 phyx2 clock gating) reqiures th=
at
> > property on the parent clock.
>=20
> Hmm, clock consumers should have no business with the names used by
> clock providers, even less so whether those names are specified in DT
> or not.

Well drivers/clk/imx/clk-imx8qxp-lpcg.c does exactly this. AFAIK not just
the ones references in DT, but also hard codes ones.

The root cause is that clock-hsio-refa and clock-hsio-refb in
arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi are setting platform-specif=
ic
GPIOs in SoC .dtsi...

My current idea is to use fixed-factor-clock instead:

> &hsio_refa_clk {
> 	compatible =3D "fixed-factor-clock";
> 	clocks =3D <&pcieclk 0>;
> 	clock-div =3D <1>;
> 	clock-mult =3D <1>;
> 	/delete-property/ enable-gpios;
> };
>=20
> &hsio_refb_clk {
> 	compatible =3D "fixed-factor-clock";
> 	clocks =3D <&pcieclk 0>;
> 	clock-div =3D <1>;
> 	clock-mult =3D <1>;
> 	/delete-property/ enable-gpios;
> };

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



