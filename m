Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26391C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8dZ0cLO+3lu8dDLMfrc3hqACkcnzlbweOM08iAToro=; b=COplwARy62/6/xNIHWm569MLkr
	m4royJOwzecruDCcW2LGsdXYWlPTDMA5lpjMeNb6Xvye+2Fu1epq8/vf2nehUCyDkDYY/zHvNfP0k
	JsSA9qZp6g4s6b9ZjAJPtf8zCx/R7sHQmMt3P3h8eL5u9Wq0O7nX+lox9mWZlkJSR/PUmdfXmzv0a
	6t7HCvH3KRUhv06Ig0wHORDPsEUL3VQsuB2Gc+3pFmF/tsnVrCQwuXF+rnc8MWflHTYpIhntc53q4
	Xm2/591xYdsP2+Wqq3Zi0hixH/9zo5zC3a6lFB4hdUOu6DA1ilvW4QslS92DIm3rVwnnov6jUl+To
	vnNkqjug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR0h-0000000AYul-0OHN;
	Thu, 17 Jul 2025 15:59:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQNi-0000000AUiI-2L6l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 15:18:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C02785C6A57;
	Thu, 17 Jul 2025 15:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D86C4CEE3;
	Thu, 17 Jul 2025 15:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752765525;
	bh=Jw+UufvGG9YoXeX/nFnnouHPq9n7dVmvn+Bie3jDHBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e69wEdF7/wu2NNbteCHp+xXQoVctHXe5Ybgobxf+pddr4vSu5vqcHmV+ouuoU3iWz
	 ysx9L7jOmtyRhQ8h9k9Sa7IoMhPoHhKj6y8GlCQ8yCdGOsRrZmiX4YgYrzxCfvaCSO
	 8V8lX167yI5kxnDhHeBsh5o0N6ZsEAyxqyjzuroMJB2jnaapO3h9gWgmDg1EXOkNK5
	 498azzqhrCdaZfJZs4nO4VJBjSP5Bwb6ZVtllbmTVRFCwY9QLdgB56tgeN+FISA9af
	 2mrE01RsEv8uLPu6Vr/xmwvDNjGXdSyaX/XwHx7Y4A4lL2wRmkbN5kGlDMaZRdOrX8
	 YOs1/LuW1gzKw==
Date: Thu, 17 Jul 2025 17:18:41 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] irqchip/gic-v5: Fix error handling in
 gicv5_its_irq_domain_alloc()
Message-ID: <aHkUUWFk/AIxh1Nj@lpieralisi>
References: <cover.1752693640.git.dan.carpenter@linaro.org>
 <4787a3c4-9713-4b99-9b8a-7ba227e91d02@sabinyo.mountain>
 <aHjBe9k2Igl2iopq@lpieralisi>
 <5c22b679-853d-410c-973a-ba3c91a54b84@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c22b679-853d-410c-973a-ba3c91a54b84@suswa.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_081846_680975_74A5C790 
X-CRM114-Status: GOOD (  33.85  )
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

On Thu, Jul 17, 2025 at 05:41:06PM +0300, Dan Carpenter wrote:
> On Thu, Jul 17, 2025 at 11:25:15AM +0200, Lorenzo Pieralisi wrote:
> > On Wed, Jul 16, 2025 at 02:38:22PM -0500, Dan Carpenter wrote:
> > > There are two issues to fix in this code:
> > > 1) If gicv5_alloc_lpi() fails the original code was checking the wrong
> > > variable.  Fix the mixup between "ret" and "lpi".
> > > 2) If irq_domain_alloc_irqs_parent() fails, then clean up all the loop
> > > iterations instead of just the current iteration.
> > > 
> > > Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  drivers/irqchip/irq-gic-v5-its.c | 14 +++++++++++---
> > >  1 file changed, 11 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> > > index 55360ae9f1f6..8cc8563e27d5 100644
> > > --- a/drivers/irqchip/irq-gic-v5-its.c
> > > +++ b/drivers/irqchip/irq-gic-v5-its.c
> > > @@ -949,15 +949,18 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned int vi
> > >  	device_id = its_dev->device_id;
> > >  
> > >  	for (i = 0; i < nr_irqs; i++) {
> > > -		lpi = gicv5_alloc_lpi();
> > > +		ret = gicv5_alloc_lpi();
> > >  		if (ret < 0) {
> > >  			pr_debug("Failed to find free LPI!\n");
> > >  			goto out_eventid;
> > 
> > This should be:
> > 
> > goto out_free_lpi;
> > 
> 
> Yes, you're right.

While at it I'd rename the label, out_free_irqs or something like
that, now we are doing more than freeing an LPI.

> > otherwise we miss cleaning up for [0, i - 1] on LPI alloc failure.
> > 
> > I can fix it up - not sure it is worth splitting it into two patches,
> > just let me know please how you want me to handle it.
> 
> I don't think it should be split up.  As a reviewer I would be annoyed
> by a split up version of this.
> 
> I'm a little bit surprised by the offer to fix it up for me...  Is this
> going through your tree?  It's probably easiest if I just send a v2...
> Let me do that.

I just wanted to help. FYI Marc has sent a PR today mentioning these patches:

https://lore.kernel.org/lkml/20250717122306.4043011-1-maz@kernel.org/

I think that keeping the CC list is good so that Thomas can pick them
up if he pulls the branch.

Thanks again for fixing these issues.

Lorenzo

