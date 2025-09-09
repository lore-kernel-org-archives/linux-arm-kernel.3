Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D0ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ho6btbW8dbb/3BQNUmdGkuJ/GydXGeEO2nOokfa+dSw=; b=P3WPcNXPjfuDUmAC5zDswX7o9U
	SBcAULuHVWLtAzdtkTOuMgThdIsfyFeP4Z2Op+tNL+Gl8mwmxyoX6BsOFrj6RwY9nVeUZWET7Tso9
	JjwLiq+xBTRbsJeX4rLA4qRGmUmbIRYiBMghS3j/dFGu8BUwdhGphvLba1mUJLZgDA52i6DFL3ZzM
	7k7r24BNerXKJTErTQPlVOkWodfCdN7xUiXAtglvD4RDplkxLS+VsMNLHZePe829P55zRuSPbssLq
	5/JOr/JbOXqOJANcs0g5MS3ZxouJRurXWY7F0MP7150sz9EUWuLNIyHWeEoovC0MFO/6elbSl+Ihf
	ck5E7vzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26f-000000095En-3Wm5;
	Tue, 09 Sep 2025 17:26:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1MU-00000008ZNi-1KTE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:38:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A908660226;
	Tue,  9 Sep 2025 16:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D94C4CEF4;
	Tue,  9 Sep 2025 16:38:28 +0000 (UTC)
Date: Tue, 9 Sep 2025 17:38:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] irqchip/gic-v5: Fix kmemleak L2 IST table entries false
 positives
Message-ID: <aMBYAbq_dlDB9HLH@arm.com>
References: <20250811135001.1333684-1-lpieralisi@kernel.org>
 <aK4MQ3dur0cyluGl@arm.com>
 <aL7Znv7XgqFPq2Jb@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aL7Znv7XgqFPq2Jb@lpieralisi>
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

On Mon, Sep 08, 2025 at 03:26:54PM +0200, Lorenzo Pieralisi wrote:
> On Tue, Aug 26, 2025 at 08:34:27PM +0100, Catalin Marinas wrote:
> > On Mon, Aug 11, 2025 at 03:50:01PM +0200, Lorenzo Pieralisi wrote:
> > > diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> > > index ad1435a858a4..e8a576f66366 100644
> > > --- a/drivers/irqchip/irq-gic-v5-irs.c
> > > +++ b/drivers/irqchip/irq-gic-v5-irs.c
> > > @@ -5,6 +5,7 @@
> > >  
> > >  #define pr_fmt(fmt)	"GICv5 IRS: " fmt
> > >  
> > > +#include <linux/kmemleak.h>
> > >  #include <linux/log2.h>
> > >  #include <linux/of.h>
> > >  #include <linux/of_address.h>
> > > @@ -117,6 +118,7 @@ static int __init gicv5_irs_init_ist_linear(struct gicv5_irs_chip_data *irs_data
> > >  		kfree(ist);
> > >  		return ret;
> > >  	}
> > > +	kmemleak_ignore(ist);
> > 
> > Nit: if you ever respin, please add a short comment on why this is a
> > false positive (easier to see it in the code than the git logs).
> 
> It was merged as-is (have been away for a couple of weeks) but I can send a
> patch adding the comments to clarify the code as a follow-up.

No need to. One can always do a git blame ;).

-- 
Catalin

