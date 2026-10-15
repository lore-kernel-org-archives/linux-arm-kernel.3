Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEBECC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JJOFG+/Lcmrcjwm8gj4vFxpyUJmGEw18JAOdt4/SQI=; b=pDvHubAEZHxsRj2rDA/xxqIeMy
	fkJoEi9GsoTtMJTgK3/pnxiL4bAmRAbir1KfOBgRRbim8F6nmjAB+tHYDXW3YEXjIWZCs1KCLxmrS
	IY1ZMgldAo9gIuSaqEUXU6GtdICD74gC4oIUXpisy0ZKeQqC6d3o/okf/92yuua42YoIAeLKoPmrm
	rzs+XfwVZUW4NmERLjFIfnRtmBGSvRymJA+e3ZbTiaEPaR/B8eawfc3HWeeecO3LThXj+moA31eK8
	UPIqEvffeUYfThT5MFYswRB5x8Tq5pkNLfEDV61eFiOwl7D1KOg985H5OcJEj5KL0KjTn/c6ZEh3W
	T72C+rYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGu4-0000000H9m1-0Gy5;
	Thu, 15 Oct 2026 08:33:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGu2-0000000H9lh-432p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 08:33:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 17A096022A;
	Thu, 15 Oct 2026 08:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1ADB1F000C4;
	Thu, 15 Oct 2026 08:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792053209;
	bh=3JJOFG+/Lcmrcjwm8gj4vFxpyUJmGEw18JAOdt4/SQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JwtEX01Xl9e48pSRCYcm2j/QK8dOUtKk9gIbbrt0e+cI0HtWc5woePTnUwlnIFD+r
	 LCuP6mS0PzIqCUBYR/j3bI9eNvilXQxXsB+2j+XhvlVyoCFp73VIf/FqhA81fNIWOp
	 kfktbtd9JOrv5UKPQf8+ze7jKl0dE4h52zbvOmvWGaPMfIOXqQk5sAuD7+2lbZro0j
	 r+Y6V0lVwsSpiGBjMb+qHhy6A6lOlzPhvfFP+O/hkYk15csYbbi51FfT6zyBtp/tMC
	 a0TLdQHy1XJO7x/QBudtznXPhgxW+6htLFUJxQtL9gyJLeOpUGZ0Iczd5wGVKcElLF
	 LKYyUeJ1v6cVQ==
Date: Thu, 15 Oct 2026 10:33:25 +0200
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
Message-ID: <20261015-whimsical-amorphous-squid-6166c5@quoll>
References: <20261013103003.373156-1-larisa.grigore@oss.nxp.com>
 <20261013103003.373156-8-larisa.grigore@oss.nxp.com>
 <20261014-valiant-goose-of-revolution-efec17@quoll>
 <fa3a025b-0d82-42df-a4cc-e144d6a97b20@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fa3a025b-0d82-42df-a4cc-e144d6a97b20@oss.nxp.com>
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

On Wed, Oct 14, 2026 at 04:58:30PM +0300, Larisa Ileana Grigore wrote:
> On 10/14/2026 2:10 PM, Krzysztof Kozlowski wrote:
> > On Tue, Oct 13, 2026 at 12:29:58PM +0200, Larisa Grigore wrote:
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: core
> > 
> > I don't get why you added the clock-names.
> > 
> Hello Krzysztof,
> 
> The properties, `clock-names` and `operating-points-v2`, are needed to let
> the generic UFS platform code discover and manage the controller clock.
> 
> `ufshcd_parse_operating_points()` uses `clock-names` to create the

You have only one clock, so my point is that UFS code is just poor, but
if that's the reason to mention its name, then just say that in commit
msg... or probably the ufs-common should be fixed.

Best regards,
Krzysztof


