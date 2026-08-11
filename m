Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9B3C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+JrBIR9KJqjw0g48ia2wGzfZuaFqi6veSrCx7lomV8=; b=xFINZzoIbI67Tt7wg4ULlxLMsi
	eSbwRajx36sJLjlK6Q+eqNMRRqFV0uASm7d6NdEW2z8vvwqgo1O86P5xmEdVpDm4OTGZh4TetAAT/
	oHEq3ENbYje917ZqxpSJ3v4+MkLr1M963C8+BKoTix0HL8NlLs9CIN2nqf3Xup04u6njUtuCEUvF8
	0yM/lQA3/rkMBM/rL43U3TD5Q0Qj4O2pgFKc8w52pc9l+uUk0VjLRvQ0OY8yOBKBIhTJ9kqeRYKTY
	6NQLcWfVMe3RJg5cyAVqf7EM/KS6tHOh8XOYnNEBCXmz8DVjnmV2YuLOM6jN3Om9een4BKBeVMS27
	RWQFNoWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpQ1-0000000EVlu-1Anb;
	Tue, 11 Aug 2026 16:33:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpQ0-0000000EVln-1lZI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:33:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E16E140570;
	Tue, 11 Aug 2026 16:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BBC41F000E9;
	Tue, 11 Aug 2026 16:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786466015;
	bh=H+JrBIR9KJqjw0g48ia2wGzfZuaFqi6veSrCx7lomV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U6k1oUjuC6Xyi7Er3dCewRwyPCO5nn0YXn5ra/BgLckfBD0rMBsSM7QvSfh1V+Vsj
	 L3wY5mPQ7I5LKM8gJfj7WnJYpKdGJcLX0VmkmSrba3ftAhpsvc4ZOdgwkVjABoHaxs
	 DHttgTTv0tNRatmX1XLZtPiFGDcC3JzvL719Xdh2f7kgRMdHsdaIlu5z1ZxLxpgQpG
	 f/oJtgI6UwfXfzxhifnVSk7VIDIEGDSsRjDmNDNiZsrn5t1AWMtZBatky7rpYdO2tR
	 A1J554ADS5ABThdwwSvfEafVA7+9QIszgEOEu3aQKP8DqQTv/U98A5wRNzOvkYGjuF
	 R18QbJImBImKQ==
Date: Tue, 11 Aug 2026 11:33:34 -0500
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
Message-ID: <20260811163334.GA2354701-robh@kernel.org>
References: <cover.1783505329.git.geert+renesas@glider.be>
 <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
 <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org>
 <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
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

On Mon, Aug 03, 2026 at 02:01:18PM +0200, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Thu, 16 Jul 2026 at 23:49, Rob Herring <robh@kernel.org> wrote:
> > On Fri, Jul 10, 2026 at 01:02:39PM +0200, Geert Uytterhoeven wrote:
> > > On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > > > > Add a firmware property, for systems where SCMI must be used instead of
> > > > > direct hardware access.
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > ---
> > > > > v2:
> > > > >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> > > > >     Pulse Generator".
> > > > > ---
> > > > >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> > > > >  1 file changed, 7 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > > > > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > > @@ -35,6 +35,12 @@ properties:
> > > > >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> > > > >      const: 1
> > > > >
> > > > > +  firmware:
> > > >
> > > > RPi is doing similar, but I have doubts. It looks way too close to
> > > > generic "syscon" which is disallowed.
> > > >
> > > > I think this should be vendor+purpose specific, e.g.:
> > > > "renesas,scmi-transport" or "renesas,scmi-firmware"
> >
> > If you can tell me the resource that a 'firmware' provider provides then
> > it is fine, but you can't.
> 
> It provides a firmware API, which is not available until the firmware
> provider is initialized.

I don't know what "a firmware API" is. What does it provide? I know what 
a clock, GPIO, reset, interrupt, etc. provider is.

Rob

