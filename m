Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E525CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 15:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zkn44FjR+pCfEjpttwFCzM+vdwVOm3Tq+gRyYYZrqaw=; b=K63UBsZMT0Lt7+MtdJ337LRwXs
	x0W8iun92F2DpwZtLYJVolX+jSEPjRU++TzU7uWusA0qU/84iLLA09cEEz4jphQYUg3UM4qDdcAOo
	3m+zHMXUydtz7LkBpaT4Nad7PiNQJT79TuBhX+miBn/H5LlYTUzxGA8Vrji+/N6o/YN0QXYKl4KUQ
	t2/+TA8Rq5nNRNpV1zDYKYWxGJEL/6dtaygbngLVSJgtMDMMBZinPHeHcPAKqYsrdgKiBj4z/vLF7
	ZXfHh+X1+1Lh/cctwswUzyocvkTAgKDDfx8DzQumxxAQEh4Zsqco4x/M5MsDsJlfyp0T9XTvXqhr5
	fI1P0iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1dQ-0000000GMMe-2ZIs;
	Mon, 17 Nov 2025 15:59:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1dP-0000000GMMR-1A8v;
	Mon, 17 Nov 2025 15:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Subject:
	Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:In-Reply-To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Zkn44FjR+pCfEjpttwFCzM+vdwVOm3Tq+gRyYYZrqaw=; b=jEH0w12r8gH4bKIddMNv97wwa+
	fJAh4RacflTEbW+nku99OfzjPxFln6BBW0NL1u3Sl/efKUXVwKcW8rBSA6SkBqxIDULeMSDJIVcos
	htFmoflAJggUc5M0WkJb1iPsOtSfC4tHG2X7ljXAOcsW5VAx+UVumja3uyaF+0754/hVm36BFKWZm
	UZo8PU7NFEqx3Jp12jYCXOR9pEhSC6Kkdb1ObekulrOtiB58npLWy6SN6EzT/o890sEfZkkhPycD/
	R+xXaWkMk5T47wdtxKgPHrU4u03W9YaAGHdHeWxFdQ8ZsRBVH+L1t5cUMBMfxTc6oD95sqnK7uK3V
	zY9Bsb3w==;
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0lh-00000007b0R-3VGo;
	Mon, 17 Nov 2025 15:03:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id D540841095;
	Mon, 17 Nov 2025 16:59:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1763395149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zkn44FjR+pCfEjpttwFCzM+vdwVOm3Tq+gRyYYZrqaw=;
	b=C/KqexO6h7lCq322ARNRT5+LGtjamGKURkllK3HzjYPHOKO9anlQ9NZ7A6nMfVY0JJmEr6
	AUcCqnVVFSWbcP1G6B2+XD6fpN3hpt3UMc3HkCbS/itsh2YIWPbChNvUNF6kB4Wr4pg524
	xncW8KuE0cfGMsYpvmDrGcGTWB94CziDsnu/UdoBqFNVDe0mZphVfLrqHes/XibvRfT4kQ
	A355rmGB9ABLCSljkVTlTOkGCSXo7EByB/NmHg5T6VrgaghIGlHn4ixJomMtGonqWEZTnl
	5tdONmWdhYwJtUasEUF/pLGlkPryYIH+QkXvy0btaKmwHxax6los3e4QVCvtVQ==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <aRrIhA1uv_aIneOc@geday>
Content-Type: text/plain; charset="utf-8"
References: <cover.1763197368.git.geraldogabriel@gmail.com>
 <8f3cc1c1-7bf7-4610-b7ce-79ebd6f05a6e@rock-chips.com>
 <257951b7-c22e-9707-6aba-3dc5794306bb@manjaro.org> <aRrIhA1uv_aIneOc@geday>
Date: Mon, 17 Nov 2025 16:59:05 +0100
Cc: "Shawn Lin" <shawn.lin@rock-chips.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Johan Jonker" <jbx6244@gmail.com>, linux-rockchip@lists.infradead.org
To: "Geraldo Nascimento" <geraldogabriel@gmail.com>
MIME-Version: 1.0
Message-ID: <4afa0534-5458-ac0c-6c92-38ed52aea00b@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH 0/3] =?utf-8?q?PCI=3A?==?utf-8?q?_rockchip=3A?=
 =?utf-8?q?_5=2E0?= GT/s speed may be dangerous
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_150350_025565_3AD85B71 
X-CRM114-Status: GOOD (  25.42  )
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

Hello Geraldo,

On Monday, November 17, 2025 08:02 CET, Geraldo Nascimento <geraldogabr=
iel@gmail.com> wrote:
> On Mon, Nov 17, 2025 at 04:57:11AM +0100, Dragan Simic wrote:
> > On Monday, November 17, 2025 04:42 CET, Shawn Lin <shawn.lin@rock-c=
hips.com> wrote:
> > > =E5=9C=A8 2025/11/15 =E6=98=9F=E6=9C=9F=E5=85=AD 17:10, Geraldo N=
ascimento =E5=86=99=E9=81=93:
> > > > In recent interactions with Shawn Lin from Rockchip it came to =
my
> > > > attention there's an unknown errata regarding 5.0 GT/s operatio=
nal
> > > > speed of their PCIe core. According to Shawn there's grave dang=
er
> > > > even if the odds are low. To contain any damage, let's cover th=
e
> > > > remaining corner-cases where the default would lead to 5.0 GT/s
> > > > operation as well as add a comment to Root Complex driver core,
> > > > documenting this danger.
> > >=20
> > > I'm not sure just adding a warn would be a good choice. Could we =
totally
> > > force to use gen1 and add a warn if trying to use Gen2.
> >=20
> > I think that forcing 2.5 GT/s with an appropriate warning message
> > is a good idea.  That would be like some quirk that gets applied
> > automatically, to prevent data corruption, while warning people
> > who attempt to "overclock" the PCIe interface.
>=20
> Alright, I'll send v2 with this suggestion in mind. So that driving t=
he
> core at 5.0 GT/s will require patching and compiling own kernel.
>=20
> > > Meanwhile amend the commit message to add a reference
> > > of RK3399 official datesheet[1] which says PCIe on RK3399 should =
only
> > > support 2.5GT/s?
> > >=20
> > > [1]https://opensource.rock-chips.com/images/d/d7/Rockchip=5FRK339=
9=5FDatasheet=5FV2.1-20200323.pdf
> >=20
>=20
> Shawn, URLs have the bad habit of changing or simply disappearing, so=
 I
> don't think it's a good idea to put URL in the commit message.

Ah, it's actually perfectly fine, there's always Wayback Machibe
to rescue references/URLs that may disappear over time.  Wikipedia
relies heavily on exactly that mechanism, for example.

[2] https://web.archive.org/

> Also, the datasheet just mentions that RK3399 supports only 2.5 GT/s,
> it does not mention possible damage from driving the core at 5.0 GT/s=
.

True, but having an additional reference doesn't hurt, especially
because the revision history mentions, albeit vaguely, an update
to the PCIe specification in version 1.1.of the datasheet.  Though,
if we had the version 1.0 publicly available for comparison, that
would've been much better. :)

> > Also, rewording the patch summary as follows below may be good,
> > because that would provide more details:
> >=20
> >   PCI: rockchip: Warn about Gen2 5.0 GT/s on RK3399 being unsafe
> >=20
> > Or, if we'll go with the automatic downgrading, like this:
> >=20
> >   PCI: rockchip: Limit RK3399 to Gen1 2.5 GT/s to prevent breakage
>=20
> Dragan, these are good ones, thanks. Though I think I'll omit Gen1/Ge=
n2
> wording since I know how much Bjorn dislikes those terms.

I'm glad that you like those, and I also thought about not including
the GenX parts, because they're basically a bit redundant. :)


