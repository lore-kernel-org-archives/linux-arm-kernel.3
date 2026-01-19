Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9435CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 08:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVFQ2VhlUGL3S4WauLlV3B8KQC4Wodlr1rVUWlqqLU8=; b=qdd0stx0OZDhLmmvjHQx3pZQEd
	Widp17OupsTM1f+Hz+df9yiVeso+MiF+1XWAGuMFXWC9jJtndAOdfuWPageYetrNa5QrSSbL0UyWg
	PZNrhIbbSbu4lawXb9hlOw5vNzdpqWxgX6IC8fowNvulkknRLEkMmmYhClu5gmRP5b2C4nLP4QTAr
	XF57/4a/E45Gs+XE1Meb3aVimCqQ8I3rUZk0QPnJd2jeM/sDK2TO7In6WvmUopOOaYPbbmiDdUAp8
	xrTUacHc755j6n5A0PHeVMh2Sxh0mca8GaphgAN1rpE1dvrHWkTZwoXdZWrSj0dlW2iC3MluHskNt
	G6kPk6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkTs-00000001XwN-3Bim;
	Mon, 19 Jan 2026 08:19:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkTn-00000001Xw4-2Q30
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 08:19:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86A476014F;
	Mon, 19 Jan 2026 08:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E46C116C6;
	Mon, 19 Jan 2026 08:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768810758;
	bh=KnZdaxE92jWhgcahWpcW1Rw0cpfimRfmShRC4yQuhFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XcrbC98RoIX7bAtmn6KsYQ5JJuJKDZp+ID7EqV3TmcY7ENSUA0pMyi3XccUImgNcu
	 1e+C2iuXfVsurXF1vopPUnMH/Z69SZdydbBpB+P8jOuIH3f1y/dXRIU9X+iFbMF6uz
	 6Zo2qC3PkIrqj3e1xzJQFcbf7epFyjEgroYrAtk7UHAN6oQAVGZCTYRm0ZochvWAck
	 djeizrCyv3JYK17pqNfPOU0a9omzW5w/SrCwH2CGaU06EqLddKRzevMqV5uiRkBFiZ
	 8KHjbJPA9YFNDnK/n3beVOV3mWhACZ3r1NG6itw2xOKcE/UzAIyyQp7GCXxs0d4JCN
	 0LtpfDO81RYaA==
Date: Mon, 19 Jan 2026 09:19:12 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 0/6] irqchip/gic-v5: Code first ACPI boot support
Message-ID: <aW3pALPxn4i9fiDO@lpieralisi>
References: <20260115-gicv5-host-acpi-v3-0-c13a9a150388@kernel.org>
 <aWy9T3VDyXpVG41z@lpieralisi>
 <87sec30yhk.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sec30yhk.ffs@tglx>
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

On Sun, Jan 18, 2026 at 03:47:03PM +0100, Thomas Gleixner wrote:
> On Sun, Jan 18 2026 at 12:00, Lorenzo Pieralisi wrote:
> > I have noticed you pulled this seris into tip (thanks !) - there
> > is a strict dependency on ACPICA patches in [6] though as I tried
> > to convey with the paragraph above and dependencies below:
> >
> > prerequisite-message-id: <12822121.O9o76ZdvQC@rafael.j.wysocki>
> 
> Duh. I completely missed that.
> 
> > I don't know what's best/easier to handle this dependency but it is there,
> > I don't want it to cause you any trouble so I reported it as soon
> > as I noticed.
> 
> I zap it from my tree for now until that's sorted.

Hi Rafael,

I think the simplest way to sort this out is for this series to go via
the ACPI tree if that's OK for Thomas, given that the ACPICA code will
go via the ACPI tree anyway and there are other dependencies on it there
I assume (this series is fairly self-contained).

Or I can hack together a patch that provides the ACPICA structs needed in an
irqchip header file, conditional on the ACPICA version, add it to this series
and remove it at 7.0-rc1, it does not make much sense to create this churn
given that ACPICA code will be merged this cycle but it is doable.

Please let me know how we can handle it.

Thanks both !
Lorenzo

