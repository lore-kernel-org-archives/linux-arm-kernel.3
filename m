Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E991CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tkcu8uPHbEXRcb2a56j7ZJ/z6mbAMTK+VhMf9lAZ9Pg=; b=KpN16zEpgO2szQgkK93fqMvKJY
	ZadPbcQKAL1qNp1eYOVQEJ6E+f1wtfxJZMjPwW0sluahItyWE2zXloj+InK9alapEHNLPBconKH8D
	ZmXzgqPZ9rulax2LHCok2SP3fYA3/LevBF2Rt63XAa64XYrf2XHVP5BBrMiT7NP//g4d5ur9RPzX0
	M6KlPLgQqKQIRGpZAp7SphngdcrcOK2fQx6YU98WZ12O6599YSpZe0veEh66yojgRDaIbMn12znHI
	ZlXXLaCgOoo4tV2RP82bntGLFoMDQyRbaznxwoLk5hPytoM04ivB2YVtYmvXeI3pgbP7JPJcl4z0L
	XUCxaj6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfOV-000000014t9-3nac;
	Mon, 08 Sep 2025 17:11:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbtb-0000000HMkW-2Rdb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:26:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0960A601A4;
	Mon,  8 Sep 2025 13:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0101CC4CEF1;
	Mon,  8 Sep 2025 13:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757338018;
	bh=K5YU/SfllwjVRMTHft5NGcsCbcC7qR5QHQ2I/4K/QBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n7k3WpDhlg6x0fgsmQLBmhKS3oYCqbOYBc21up4iOhWkKFzjJg261RsJwZxcHmGxj
	 QaClm1dXvCcJgyUsWYUuAqo+gFjAXFY1egBqWyu4J9P+4bKpxnqBdv8xHYnZ49CLbB
	 iHRGKT214MIZG6jKQKnr/xDXql7TMdyAlLEyvSFDcXG0yaerWmF/Nd5VX3a9JF19yz
	 kLsboesKeznkfg7jkzpaAs5nulSxvQWaj0Sux3PWTwiJfnZH6CmilNcM4XhKoAGeAl
	 Dn2TkRuvHdj+ideEQpPmdBz8jDkrqOqS/qH+cS5FHH7r8qoEWaRKxtJchPcyVLDYyS
	 ObT7LvzWhmsvw==
Date: Mon, 8 Sep 2025 15:26:54 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] irqchip/gic-v5: Fix kmemleak L2 IST table entries false
 positives
Message-ID: <aL7Znv7XgqFPq2Jb@lpieralisi>
References: <20250811135001.1333684-1-lpieralisi@kernel.org>
 <aK4MQ3dur0cyluGl@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aK4MQ3dur0cyluGl@arm.com>
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

On Tue, Aug 26, 2025 at 08:34:27PM +0100, Catalin Marinas wrote:
> On Mon, Aug 11, 2025 at 03:50:01PM +0200, Lorenzo Pieralisi wrote:
> > diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> > index ad1435a858a4..e8a576f66366 100644
> > --- a/drivers/irqchip/irq-gic-v5-irs.c
> > +++ b/drivers/irqchip/irq-gic-v5-irs.c
> > @@ -5,6 +5,7 @@
> >  
> >  #define pr_fmt(fmt)	"GICv5 IRS: " fmt
> >  
> > +#include <linux/kmemleak.h>
> >  #include <linux/log2.h>
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> > @@ -117,6 +118,7 @@ static int __init gicv5_irs_init_ist_linear(struct gicv5_irs_chip_data *irs_data
> >  		kfree(ist);
> >  		return ret;
> >  	}
> > +	kmemleak_ignore(ist);
> 
> Nit: if you ever respin, please add a short comment on why this is a
> false positive (easier to see it in the code than the git logs).

It was merged as-is (have been away for a couple of weeks) but I can send a
patch adding the comments to clarify the code as a follow-up.

Thanks,
Lorenzo

> >  
> >  	return 0;
> >  }
> > @@ -232,6 +234,7 @@ int gicv5_irs_iste_alloc(const u32 lpi)
> >  		kfree(l2ist);
> >  		return ret;
> >  	}
> > +	kmemleak_ignore(l2ist);
> 
> Same here.
> 
> -- 
> Catalin

