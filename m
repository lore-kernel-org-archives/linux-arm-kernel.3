Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C76C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/B6iAfkVFjx7sDfCWC2hIpuHaw1ArUQ8xKSTxqrriQ=; b=VV4I9HR5OLTcF9ubsrpBRqePMl
	ARTFc4QfjZ4S49I52Xr6toQuc7OjlJagXJeEzzgVrP62RdpsLSFZGzRm/7FPz4/7ND1+xMoLeJd1b
	MB3f8AiIRauiaZ64UezPPhyf8olixIBr1FaPCMhUqh4T2UuC9WWNKOOyBODM+ARt6IHZ6Kcx8u+87
	5hOjcIWMUzHCSOfBvNeNnR78xqNs8ZMCDXDPf4eBlb0bfYltFMZtg94bWu2K0uM9ufXiAKBp8A8AU
	ovxm4ZbLyFtYwm0XAL4YMuR1zydasQk+f4O6UGo9nLCR93oSjiTst4JZYqcAPNwVfpizSmMV6NUAK
	ZEm2T92g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nYU-00000009npC-1C71;
	Thu, 10 Apr 2025 08:46:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mxQ-00000009gNO-1m5W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 08:08:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 01A73A42C6A;
	Thu, 10 Apr 2025 08:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 355EFC4CEDD;
	Thu, 10 Apr 2025 08:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744272499;
	bh=8ND6dqJylzytwK8QGY61NBtBW3bbGF9AnqUq6PCX2cA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=etC/ghh+hxK8w7jbzUsZMabc6XyIzS5CT4Mg7Fa7JrIL5CyE1k2PVwADgAFE9Vean
	 /0aYjyCiEReq33iNmBth8wdQ2Nh5tYasEmVOc6J07KJ+LzQkWTqUyZs9Rl0TLenf2o
	 riSY3QobJLrHdYdAGrHu8KJivKEY6d5RZfDXb7yzEC8GbDZVy1znKo4POOMqT+69gW
	 rTR843N8sbkhlXfRYMPovrzBekXMQA+E3bajLciYq6oa8idjQRxqJK0DSNEDbSeW4S
	 5blEih3PumxcILI8AMhng0P5Z/d7bzOb6KXm1VBfxZawaNRApNjonNqMHmcA7EhlaQ
	 YuimoL7vdE6zA==
Date: Thu, 10 Apr 2025 10:08:12 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 22/24] irqchip/gic-v5: Add GICv5 ITS support
Message-ID: <Z/d8bP9GceSVpJAU@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-22-1f26db465f8d@kernel.org>
 <87jz7ttb7l.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz7ttb7l.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_010820_531814_20112317 
X-CRM114-Status: GOOD (  15.83  )
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

On Wed, Apr 09, 2025 at 08:57:02PM +0200, Thomas Gleixner wrote:
> On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> > +	guard(mutex)(&its->dev_alloc_lock);
> > +
> > +	its_dev = gicv5_its_find_device(its, device_id);
> > +	if (IS_ERR(its_dev))
> > +		return PTR_ERR(its_dev);
> > +
> > +	ret = gicv5_its_alloc_eventid(its_dev, nr_irqs, &event_id_base);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = iommu_dma_prepare_msi(info->desc,
> > +				    its->its_trans_phys_base);
> > +	if (ret)
> > +		goto out_eventid;
> 
> As 0-day already complained, guard() and goto does not mix. the simple
> solution is to do
> 
> foo()
>         guard()
>         return __foo();
> 
> Then you can put the gotos into __foo()

Yes even though its usage in this function IIUC is technically fine,
there are other kernel functions where the guard(mutex) is at the
function entry with gotos that follow.

Regardless, bad idea to mix them, as documented, thanks.

Side note: the bug the bot caught is because I moved the guard(mutex)
lower in the function and incidentally got past gotos (and gcc did not
catch it, it has to go up to W=2 to barf).

Anyway - as I mentioned in the cover letter, the current IWB driver
design, (patch 23 - where the guard(mutex) bug is and more readl_poll_*
boilerplate :), sorry), is a bit of a question (should I move it to
DOMAIN_BUS_WIRED_TO_MSI with the fixed eventid caveat to solve somehow),
or is it OK "as-is", treating it basically as an ITS hardcoded plugin ?

Thank you very much for having a look.

Lorenzo

