Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997FDC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 04:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+GedT4iAX7BPa6QoQlxCDrNvaxf9KZLzwRNGrPIl9A=; b=n7UXjj44tXF1XvSMJuHvEL0BMp
	uQ6bFjcDrmx3Q0eM6N1OdekfpyIJWWK43gs7y7y8o0pSpe4yCXvJLsZ9S+cWWQWdN7QT++fH9mtO7
	FRXsj44MsPbQFpeGtaFGG2SJ4eE3ZytjifYq3C82wLw0VMLvvn3Aj8C0zV4whizFDdM/0oo6RSFPs
	yHXzIEF4E5kyjSbPd/ubtF74VvSiH9R0R8yyIDkDMOuJ0wURjzvVfspmJGbjR4Daw0QnU/miGNBbD
	6LF2GuIXcKw/WPK0EvI7cHx4Cp7yrd8VlKYkbUQjUiprQdTcTsMjixDjNDJhGE/2DcglThZl+R79k
	ylv1gNyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udiX5-0000000GD5R-39gI;
	Mon, 21 Jul 2025 04:53:47 +0000
Received: from mail2.coasia.com ([112.168.119.159] helo=spam.coasia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udiTz-0000000GCg7-3Xeu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 04:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1753073433; bh=9+GedT4iAX7BPa6QoQlxCDrNvaxf9KZLzwRNGrPIl9A=;
	l=1085; h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=Uvvy++8uXAZT7wQyLTLKlhWrF4/HJYJuQlkMPGfzfmUnjNa0Iv/+C3bv485JfEIdg
	 hGSF/X8W3fGI96go6sPPazEIcxe8ZZVTX04e8+lJ5aKhW7D2iMIC3SrVQu+oUL+6wu
	 EoszgB7FDfPFRyt/FxJUVmWI819LBz24tb80Fhas=
Received: from unknown (HELO ?192.168.36.110?) (115.23.218.194)
	by 192.168.10.159 with ESMTP; 21 Jul 2025 13:50:33 +0900
X-Original-SENDERIP: 115.23.218.194
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: ksk4725@coasia.com
X-Original-RCPTTO: krzk@kernel.org,
	jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	hgkim05@coasia.com,
	mingyoungbo@coasia.com,
	smn1196@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	ravi.patel@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Message-ID: <bfdc2eddde554e1d1808dd8399bc6a693f681c9b.camel@coasia.com>
Subject: Re: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
From: SeonGu Kang <ksk4725@coasia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Jesper Nilsson
 <jesper.nilsson@axis.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus
 Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: kenkim <kenkim@coasia.com>, Jongshin Park <pjsin865@coasia.com>, GunWoo
 Kim <gwk1013@coasia.com>, HaGyeong Kim <hgkim05@coasia.com>, GyoungBo Min
 <mingyoungbo@coasia.com>, SungMin Park <smn1196@coasia.com>, Pankaj Dubey
 <pankaj.dubey@samsung.com>, Shradha Todi <shradha.t@samsung.com>, Ravi
 Patel <ravi.patel@samsung.com>, Inbaraj E <inbaraj.e@samsung.com>, Swathi K
 S <swathi.ks@samsung.com>, Hrishikesh <hrishikesh.d@samsung.com>, Dongjin
 Yang <dj76.yang@samsung.com>, Sang Min Kim <hypmean.kim@samsung.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
Date: Mon, 21 Jul 2025 13:50:34 +0900
In-Reply-To: <847e908b-1073-46ea-93f3-1f36cc93d8b8@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	 <847e908b-1073-46ea-93f3-1f36cc93d8b8@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_215036_152319_F44E6A83 
X-CRM114-Status: GOOD (  13.73  )
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

2025-07-10 (=EB=AA=A9), 09:07 +0200, Krzysztof Kozlowski:
> On 10/07/2025 02:20, ksk4725@coasia.com=C2=A0wrote:
> > From: SeonGu Kang <ksk4725@coasia.com>
> >=20
> > Add basic support for the Axis ARTPEC-8 SoC.
> > This SoC contains four Cortex-A53 CPUs and other several IPs.
> >=20
> > Patches 1 to 10 provide the support for the clock controller,
> > which is similar to other Samsung SoCs.
> >=20
> You should explain here (and in DTS patches or the bindings) the
> hardware, that this is Samsung SoC.
>=20
> You could also explain the differences from Exynos and proposed
> handling
> of patches (because this is odd)
>=20
> Also, entire patchset has wrong and incomplete SoBs. Your SoB is
> missing
> everywhere, others have wrong order.
>=20
> Please read submitting patches first.
>=20

This Custom SoC is owned by the Axis (OEM) and manufactured by the
Samsung (ODM). It has standard Samsung specific IP blocks.
Regarding SoB, sorry I missed to add submitter's signoff. We will take
care in next patch series.

>=20
> Best regards,
> Krzysztof


