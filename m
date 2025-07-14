Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF98C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 22:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XuX/PYpEN8nAtv8oHkTyRtLKNxOjbkUhAeP/vk/0C4=; b=kQIi1LDtqx/Wz3aZFV16+sn4g7
	Id7LqyJuysq8lXlmb97G628RtrXoSiWg9/e4JHwY3Mh1lpNbhkHyur7iEKhCS3xhtLEi7MWzpSxsC
	1Xo6TeWz6vd4OYL5PhCwTVwsx7pDfa1fZ3qJ5SD92g8gesk69xJmhQCZoULgA4ZprZkDCIKOJfopw
	0ibLCzIrkigWRBiPCEZyEebA4NKK3lPERJluQFbX2nvk5OHvo9Xp+SSm5S7WgkncX3Fo6eOdNQ2rd
	9xUu3P680DNevch1nNr8TNTDz7MCB0UWZe+iVz2WBy1VMw1rFEFn71m6fblFPvxVgc2Ik/eUGwW8H
	j5pXo0fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubReD-00000003P2J-1epy;
	Mon, 14 Jul 2025 22:27:45 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubRbl-00000003Orr-3HnK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:25:16 +0000
DKIM-Signature: a=rsa-sha256; bh=4XuX/PYpEN8nAtv8oHkTyRtLKNxOjbkUhAeP/vk/0C4=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1752531826; v=1; x=1752963826;
 b=uBtMImE8MkSWBszj0mA40VHczqtf8SMXQ+Djm8Dkyh0so7//byOoCXCmE9OkaVtPsNlGaeEi
 DkSO1G1RHzD3hG5xKWZyX6nhG/w4WlcGmHfsrI0K4Ll8fgKLRcF4TMnCnHzzAQbiP2QlxP3TjAR
 jyPutFkgO0QlnVBVd/OvljASXZB+pOsnQ7KZy8StpEBa4/AH2ui/c0eO7VWtScoT1COiJjCAuGk
 V3UIZqWWbSyGQlkPzClEB3duAVeBfjpgouVSPnbx7Y9P72J0KfYUJFsWuE0dFUbPJY05rphxsst
 iJ0hXcfiTtZgtrAKpukggmMvZPiarK78NijZlLIkM1iAQ==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id acbc0645; Tue, 15 Jul 2025 00:23:46 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, David Wronek <david@mainlining.org>,
 Karel Balej <balejk@matfyz.cz>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, soc@lists.linux.dev,
 linux-mmc@vger.kernel.org
Subject: Re: [PATCH v16 1/5] dt-bindings: mmc: sdhci-pxa: restrict pinctrl to pxav1
Date: Tue, 15 Jul 2025 00:23:45 +0200
Message-ID: <3028096.e9J7NaK4W3@radijator>
In-Reply-To: <20250711-hypnotic-aloof-nuthatch-f3761c@krzk-bin>
References: <20250708-pxa1908-lkml-v16-0-b4392c484180@dujemihanovic.xyz>
 <3379810.44csPzL39Z@radijator>
 <20250711-hypnotic-aloof-nuthatch-f3761c@krzk-bin>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_152514_854438_3D4844B9 
X-CRM114-Status: GOOD (  11.31  )
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

On Friday, 11 July 2025 09:31:55 Central European Summer Time Krzysztof=20
Kozlowski wrote:
> On Wed, Jul 09, 2025 at 07:33:01PM +0200, Duje Mihanovi=C4=87 wrote:
> > Would it then be acceptable to declare the pinctrl properties in the top
> > level and define each controller's respective description: and items: in
> > the allOf: block?
>=20
> just min/maxItems should be enough in each allOf:if:then: sections.

I guess for now. Later however I might need to add a state_uhs setting to t=
he=20
pxav3 driver; is the method I described right for this or is there somethin=
g=20
better?

Regards,
=2D-
Duje



