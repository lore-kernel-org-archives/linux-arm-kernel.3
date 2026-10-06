Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DC8CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 13:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ve6FyCySopgjKeMpIP/0QU8qxdOqPiBfDjjpOehpCoY=; b=tj9bdcVCs2ItE7LHi40JHLhnO/
	xfMML0D6oQ3WiNctczburWgSgVS9w+Ip+/xhXY/HDvcTvurCCalOJNrJJyPLevWf0NRm4SSQmPWYD
	5Vi4JJiJQbvfSwGot4+NbLiGIDzFXA6NMGJ4jAT9vZUrD0YV8N+JoNzARo16qk0BI+7JAskASCN3H
	mYWCrmfFuw/OW/Coqxemh8A9JvY/qpyd5obL0fjnZOa8AKf5zrmCSjmeIIxPXyHPVJOnDPjA74hvd
	uR0t7AF5y7CJ0jpmGGQjc11esND+G4HFja6OUH7ZAoUN6E47hxSq410/03rRO5O7t3jlk/aZsCDud
	YRooE+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE56j-00000000qdL-1762;
	Tue, 06 Oct 2026 13:21:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE56h-00000000qdC-1o6U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 13:21:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC49C601E4;
	Tue,  6 Oct 2026 13:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB3A1F000FF;
	Tue,  6 Oct 2026 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791292882;
	bh=ve6FyCySopgjKeMpIP/0QU8qxdOqPiBfDjjpOehpCoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VdQe8ZD7EPqTDHxtueMopqyaA1HhJuYlOfkK5y35AbXr7QAEUOVHdzh02IY0Ui1sS
	 dTmdQ2Wqr/EJ9L500f7BIdOdngJN8ypO5dwzdm9U4V4xc1ZozSS/Z0+DJ1npqgwDWN
	 CLLY3/r6Pe9nVzsx4VPzR1fcFViQfNV7ATamTawPejNpLVkCDAoVKHge+ujnFUTIoS
	 o8oRA8gLvsrOM3JdZIy3gPrfNiNDr0IrGpRPZQZocUpVHpCa8s43/eNkWQZGUExh5G
	 o11rGxaWa5eVuns9oAa9KUMbn3A9UkiiXgTdvDIXe69dUfMG7ktRxa1Dkao+9iTntX
	 kckAQe/EUYfSg==
Date: Tue, 6 Oct 2026 15:21:18 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@kernel.org>, Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	dmaengine@vger.kernel.org, Frank Li <Frank.li@oss.nxp.com>
Subject: Re: [PATCH v3 15/18] dmaengine: ste_dma40: Use power domain for LCLA
 SRAM
Message-ID: <asT1zuk9WNJU4p9M@parshuram>
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-15-9352be6b86b1@kernel.org>
 <CAPx+jO_KJJ6ORKuw6VJmtZAOEnzVz0+bq3bEFupAK_4UROKBAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO_KJJ6ORKuw6VJmtZAOEnzVz0+bq3bEFupAK_4UROKBAA@mail.gmail.com>
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

On 24-09-26, 15:26, Ulf Hansson wrote:
> On Mon, Sep 21, 2026 at 12:49 AM Linus Walleij <linusw@kernel.org> wrote:
> >
> > Replace the LCLA ESRAM regulator with runtime PM.
> >
> > Use the SRAM device that owns the ESRAM34 power domain.
> >
> > Hold that domain while DMA transfers are active. The DMA controller is
> > runtime PM IRQ-safe, so keep taking explicit LCLA runtime PM references
> > from the descriptor preparation path instead of relying on a runtime PM
> > device link from the atomic transfer path.
> 
> A bit of an orthogonal problem, but related to the above. The irqsafe
> thing have been discussed in the past for DMA controller drivers.
> 
> Would it possible to get rid of the irqsafe configuration for the dma
> controller device, altogether?
> 
> I don't recall exactly, but not the entire consumer DMA API is allowed
> to be called in atomic context, but perhaps that is not sufficient to
> allow us to drop the irqsafe configuration for the DMA controller
> device?
> 
> If not, I wonder if the consumer of the DMA (like an mmc controller)
> should be assigned as a consumer device (using device links and
> DL_FLAG_PM_RUNTIME) of the DMA controller device. In this way, the
> consumer (mmc) would be able to control the supplier (DMA) through the
> device link directly using runtime PM. This could potentially avoid
> the requirement of having to use irqsafe for the DMA controller
> device. Maybe someone already tried this?
> 
> If the irqsafe configuration can be dropped, in some way or the other,
> this patch could become less intrusive, as all that would be needed is
> to create a device link to sram device using DL_FLAG_PM_RUNTIME.

That is a consequence of dmaengine work running in tasklet and thus
softirq mode. The dmaengine tasks need to run with a higher priority to
enable higher dmaengine throughput. We have plans to move to WQ_BH [1], but
I think that runs in softirq mode as well...

[1]: cover.1786384168.git.allen.lkml@gmail.com
-- 
~Vinod

