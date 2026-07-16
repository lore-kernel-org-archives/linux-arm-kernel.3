Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71333C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOISDNQWs3+70L2z0Z/sRRYhHltwdBHFBDQdmATJlRU=; b=JjThqBDvAxSv82Htei3SlRGLaY
	grHWzBz0qe/8oe9U6/+B70VVwqR+WRmX/ZCqHF3hgvE7l+Hc241hnLDws4HmuVU9la1OZM2UzjhE5
	QwdPy9fUJWU9wMzTDGCgXty1D0xsYDmk+0TyQ4rh2bCWH6d14tHefOppB3Tce2WeSrHcf56mtPRRe
	bbhbdQHVNcCwOQQENctXjxJq5A31hb5IDGUK1xK79M68MbopRYo9/NBI90Y3gWUr61XmhSHoVWBlz
	HcoGNCSiyTB5WynkaPeQjYpBEOASYuJnJeCPqZbmezFSG7I4/OF7nQSP+ryJMn1ig291F0+izKOw1
	mKuHePWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTxQ-00000000gVz-0Gbk;
	Thu, 16 Jul 2026 21:49:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTxO-00000000gVq-2lG6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:49:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 885E560A5E;
	Thu, 16 Jul 2026 21:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2030C1F000E9;
	Thu, 16 Jul 2026 21:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784238565;
	bh=eOISDNQWs3+70L2z0Z/sRRYhHltwdBHFBDQdmATJlRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nFA2RyZwvaxjwYUaBF3M0hVJbc/cCntzN4Rkn0dY4KzIkKk/dQa7lNM+h1EoeyW+u
	 RpxJkG2WudhcGwtak8jbY2zB1Yyf4lx6fivlQJMKsBuhQifRrEpcIJek174FxExSr9
	 kwbMTf2Nn/PCeS8iEn1tBpdtiUBaKlJwEQ2aISPTZo+VCqkC45i3bpkNLgiHPGnmS8
	 Cr0ZrjOVwzt89sKbPEtCbeYjV8DXKUrzKMvYJAOREsAM8wnLQ7UVX+arefRXySS8ZD
	 powCgSjKH2/ZfbzCxB++g81cDgnGnLxCkFh9fFHXdcPBz3qZPFB2TbWCEWaVXd74V7
	 LiTLGOu3mAZNA==
Date: Thu, 16 Jul 2026 16:49:24 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
Message-ID: <20260716214924.GA1477674-robh@kernel.org>
References: <cover.1783505329.git.geert+renesas@glider.be>
 <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
 <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
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

On Fri, Jul 10, 2026 at 01:02:39PM +0200, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > > Add a firmware property, for systems where SCMI must be used instead of
> > > direct hardware access.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v2:
> > >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> > >     Pulse Generator".
> > > ---
> > >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > @@ -35,6 +35,12 @@ properties:
> > >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> > >      const: 1
> > >
> > > +  firmware:
> >
> > RPi is doing similar, but I have doubts. It looks way too close to
> > generic "syscon" which is disallowed.
> >
> > I think this should be vendor+purpose specific, e.g.:
> > "renesas,scmi-transport" or "renesas,scmi-firmware"

If you can tell me the resource that a 'firmware' provider provides then 
it is fine, but you can't.


> The disadvantage of a vendor-specific property is that there are more
> cases to handle for fw_devlink, cfr. "[PATCH v2 02/10] of: property:
> fw_devlink: Add support for firmware"[1].

If vendor specific phandle properties are a problem for fw_devlink, then 
we already have that problem to solve and 1 more doesn't matter.

Rob

