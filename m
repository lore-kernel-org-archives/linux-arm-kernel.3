Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BACD74961
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZkmG5LDdBWcr5F9UYs40lXE33P3xPwDRyGsRHQ2ZJw=; b=EDJ0N3Y21RRLNgTKTnfy5Al/Zb
	3pLytR/Vuglyf1AE6fFvxaJRcDW6sT4LgTUg5GRJOBQTwVTa6PE4c11k7gGHPdIFr5Ae5edn+YOis
	TK4jjP0ZE7I98Q0mMyAdtdIIHwGaEa+PFOiF4QNccwA4ETBR/ocerlQ8klf+Fuqfk+TP5X0xrdmZG
	8UY1XreHD03RnDF+vVbTq9zcMNZLdS5XK5CnphVe+AgCgzjVQjhaVxWWm4/wNlUOrnieN1eDOT7UW
	YCZMs2EqrSUdbe4qr8qV8eQJNUg3JeI2uEoPQ6xQf+KzKsEoS22ff2m2DrZunTKiyeGTKFb0iyn0Q
	bW4z9NjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVZ0-00000009oBW-3Geh;
	Fri, 19 Dec 2025 08:10:14 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVYv-00000009o7G-0o1v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:10:12 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9ZkmG5LDdBWcr5F9UYs40lXE33P3xPwDRyGsRHQ2ZJw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766131782;
 b=X4mI4VHaBxE0/+ehtN9i+VE8VPCvSqSAm3BJrM1n1YP2CCwEAJheNlFPK+WMqK5HL6fMHgPT
 ByjrSxUOv/FxL8yueqtlBFill3DVRNBsLjStXrSPGQMeU2MR/OzsJVW3qbLWXmUyu+jbqxcyjk7
 qJlPTidBXec4iDCduUnaQ0np/hWXLaj9tRd8NLkmSbbS0c/2K9/1s1kOZR8WwkmnBJaga5R76/2
 C19Bl7jyBnAl90YDiBvyoePPSsd2Vy9QY5jtFZy8xkSQudXd5AUiPCQC8wzByIrxJy9uVDZrlU+
 S/93sufcBEAOCz5ye/deith7IMMwL9fwu5sLSPGhnlfEQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766131782;
 b=tB0uwzvCPaIELBOjqEXzBTPzlFRFWWt8AZI8n6AdZ7IMisxNd0DOe9hHFMTuY/zpXWgfV4sN
 dP3+9qaD8YUxNyNH41ub9SOMHBvAsnM1bO0mE6NKtKZSHqTULOBtFSw+HQhF+6RvvHCVrm5XCKf
 kOCEBC6GPt8ED4ez8D+oToPiqNN6+X3yd+t3rvv/OD+aIKfyX39QT1n742opBIq6iJim/qSIpBv
 0/1GO/IVEOPpyIEjjRknb17tDzQgACvsPWk7cWajIA2t1gJRRr9sgp3TNIU44iuDOaFD2N8ubZ0
 +0fj5Jywj1peEHAFdP+m4I11FKyATcLP5cqyJAJiusAOA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Fri, 19 Dec 2025 09:09:42 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AC51CCC0DAC;
	Fri, 19 Dec 2025 09:09:23 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: Re: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names property
Date: Fri, 19 Dec 2025 09:09:23 +0100
Message-ID: <3357591.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
 <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dXgDN6fwtz3yb91
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 5b88bc5d9b014baba218eed2fec8b5d2
X-cloud-security: scantime:2.167
DKIM-Signature: a=rsa-sha256;
 bh=9ZkmG5LDdBWcr5F9UYs40lXE33P3xPwDRyGsRHQ2ZJw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766131781; v=1;
 b=sUOax3OHuP0Rc/DYC7B3YC22/lEa7q8muFhN368aAo+wsLqYCAbXtxjzzh3HdhQktHypc93I
 19DjsUmYO/So8h1A+hMhanRXvpAztX3DhVgyDn2fxSCgXi4Yzh2J1+wRCbVkdZhwy6gty/b9zYK
 tzNWUxEriscwbiWfouzrrkZJPc+aUTpNhmbcVsBF9nVn8JcIU4EhjcnuQsdbPmLDhdHEJDbqXCE
 T5WGg6APhX48Q7x5/PMVLzIwZmdZ8PqV93daAZUgMiDA+d+xTxe27Uq2wgeQ7OD0TiZu4Kj3GAu
 lhQKuQT6ixW6R7EFJpTi/eakwWVsRy2tbdT/VbMBcvkPA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001009_691455_2CE1E262 
X-CRM114-Status: GOOD (  11.92  )
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

Am Donnerstag, 18. Dezember 2025, 16:26:10 CET schrieb Geert Uytterhoeven:
> Hi Alexander,
>=20
> On Thu, 18 Dec 2025 at 16:21, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> > Add "clock-output-names" which is a standard property for clock
> > providers.
>=20
> Why? Isn't that property sort of deprecated?

It is? Oh, I wasn't aware of that. Maybe the property should be
marked deprecated in dt schema then.

Thanks and best regards,
Alexander

>=20
> Will be replying to the cover letter next...
>=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



