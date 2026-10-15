Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9376CC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+V20DFV5KmqtYyBbhJb85wqCLfg9fnPxzdn/tr5kCo=; b=d2X7YlVLGucJvhNAxZDq9nksvB
	wRfxYaPset4a6NcAZr/KEH82qsStncM4DAY2U1wBTpfAGU+n90JaJlLBERKL5mZ7rCxTnOGRQxuYS
	ig32TmXzKbDKfiwM0HJB+AiWqevkVNV6RQe1p8DSFb0VNxLfRx+RttNR0O3Eg5KsOFv6+0Zx+maAt
	hHZGYb7AVJIa8tHpHVrXFYVuEvSW9eg9BMsykdUJeFfz7OgLCTxZH2Tst9iLM6Gp05r5C+nlfbf41
	P1tWSitSA+XsiV8A9nZqnQXh64XjBbObHLdzLwgpW4E1ryaRFtKxSAvawfbiTwdy3cEgF6V2NZ+EF
	yGadry6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHH52-0000000HBBj-12P9;
	Thu, 15 Oct 2026 08:44:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHH50-0000000HBBX-171J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 08:44:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A3D6C41ADA;
	Thu, 15 Oct 2026 08:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4511F000C4;
	Thu, 15 Oct 2026 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792053889;
	bh=/+V20DFV5KmqtYyBbhJb85wqCLfg9fnPxzdn/tr5kCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L1zup2Foa+qnpqKJYziH6JSt6Q62mAZjn888akXceMvIy/nfa462P73dCgV427kbR
	 LV2LPCKJ7XoAN2aMJEJqFGoB/tmcZTDUZ/E/l2eilNIuLLNAZl3qr/oLLKod8hlR3g
	 26IcCFcdJKZz+gSb3h7QF2voeuzPIVAvAj5utOClBDZsL7Q5UJLI895/cYJVG5JUPH
	 Xa8bJiX7YGban2PEgkYIEEpcK0CuYFym8d00IOPvupYy4yAgLc03/9qabKVH10D3f0
	 Gw2RQA4egcJeUe8ww1/hZJqvKCgiaOyxzngCvTdLxinA5Q/GfB0XpRqyoK9cnTuAt+
	 Ixi8ld+Hs3TcQ==
Date: Thu, 15 Oct 2026 10:44:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Larisa Ileana Grigore <larisa.grigore@oss.nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, 
	Ajay Neeli <ajay.neeli@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Pedro Sousa <pedrom.sousa@synopsys.com>, Hannes Reinicke <hare@suse.de>, 
	Joao Pinto <Joao.Pinto@synopsys.com>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com, 
	echanude@redhat.com
Subject: Re: [PATCH v8 07/12] dt-bindings: ufs: Add NXP S32N79 UFS host
 controller
Message-ID: <20261015-observant-nickel-monkey-2a38b7@quoll>
References: <20261013103003.373156-1-larisa.grigore@oss.nxp.com>
 <20261013103003.373156-8-larisa.grigore@oss.nxp.com>
 <20261014-valiant-goose-of-revolution-efec17@quoll>
 <fa3a025b-0d82-42df-a4cc-e144d6a97b20@oss.nxp.com>
 <20261015-whimsical-amorphous-squid-6166c5@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015-whimsical-amorphous-squid-6166c5@quoll>
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

On Thu, Oct 15, 2026 at 10:33:25AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 04:58:30PM +0300, Larisa Ileana Grigore wrote:
> > On 10/14/2026 2:10 PM, Krzysztof Kozlowski wrote:
> > > On Tue, Oct 13, 2026 at 12:29:58PM +0200, Larisa Grigore wrote:
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: core
> > > 
> > > I don't get why you added the clock-names.
> > > 
> > Hello Krzysztof,
> > 
> > The properties, `clock-names` and `operating-points-v2`, are needed to let
> > the generic UFS platform code discover and manage the controller clock.
> > 
> > `ufshcd_parse_operating_points()` uses `clock-names` to create the
> 
> You have only one clock, so my point is that UFS code is just poor, but
> if that's the reason to mention its name, then just say that in commit
> msg... or probably the ufs-common should be fixed.

I see now that ufs-common already requires clock-names and it's needed
for PM opp, which cannot operate on indices, so it's fine.

Best regards,
Krzysztof


