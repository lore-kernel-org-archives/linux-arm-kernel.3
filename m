Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B13C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 11:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qP0CwaiMm1sOrPWnRedLx8q0TZjAnzqhqLimuXuGChc=; b=RrjsT3pNEGvvCumTwH4avGJuXz
	Hm2DaV+Dl1yv64snHsDbKPgBAmnznB5Kf8YqIpueJXzcRovm/5AOZChJF7ZnEkolytyS+LuTKXes6
	TjBYCr57MVa6hG7j4VfpQxtNdtdkvmvAafXFpoXS4FRJ/c9bevFkHqz0oTyVZwyVLkPgw2pTXCpQm
	BiyuxHj3xbNJ/tbLcK+IoFv0CFT0pTgE57oeeAG5QMvsUk4d+XRyBg4kKHw2LYZZH2gNvVVKKIN8J
	K5AmjFUi09bn9Gk597PJY0SAxU17U6OAZKiIGbRgFSAu0/GL0kU8n8ZNqCo60V5J2OlC45poK0xn9
	+FtrWeTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYOQL-0000000EoCH-1pb6;
	Thu, 16 Jan 2025 11:52:33 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYOP4-0000000EnxR-3kHJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 11:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=qP0CwaiMm1sOrPWnRedLx8q0TZjAnzqhqLimuXuGChc=; b=Atzo783Haw3JAfjQ
	+si3tt+zPq1mu1gFN0tKcCpoaHM8o5EF437BNZc36bpVo/pUHMeI+hixoK/cef7P+V2ZP2WgO14LH
	+aBznzVU0GxIt2UitE2r112aljQ4FlBoix54SnsngxLQRpqRZ+0rL8TD+R0otUWvE8eiDh6sfOQYa
	51cXMtm0wybOB8E5zY8YBsWCNFBVGDFnhGrUhJispmn3RkRW+Q+IjrpbmRi1voyAuVaYjnujjDUug
	uJGDyD2D3MQo09WQkkcTFjDCXLrXyMzu0oZgd3YYhva6YBRWYFrjr7GZhyXVJTE2pxW3oUazTc1vf
	50dsgqPNBvvBZkbYHA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tYOOx-00Ab3B-0S;
	Thu, 16 Jan 2025 11:51:07 +0000
Date: Thu, 16 Jan 2025 11:51:07 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	x86@kernel.org, oe-kbuild-all@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] irqchip/irq-brcmstb-l2: Replace
 brcmstb_l2_mask_and_ack() by generic function
Message-ID: <Z4jyq3xwlkPVrtts@gallifrey>
References: <20250116005920.626822-1-linux@treblig.org>
 <87ed13b2jv.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87ed13b2jv.ffs@tglx>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 11:50:50 up 252 days, 23:04,  1 user,  load average: 0.05, 0.01,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_035114_921688_0245E3A6 
X-CRM114-Status: GOOD (  16.66  )
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

* Thomas Gleixner (tglx@linutronix.de) wrote:
> David!
> 
> On Thu, Jan 16 2025 at 00:59, linux@treblig.org wrote:
> > Replace brcmstb_l2_mask_and_ack() by the generic
> > irq_gc_mask_disable_and_ack_set().
> >
> > brcmstb_l2_mask_and_ack() was added in commit 49aa6ef0b439
> > ("irqchip/brcmstb-l2: Remove some processing from the handler") in
> > September 2017 with a comment saying it was actually generic and someone
> > should add it to the generic code.
> >
> > commit 20608924cc2e ("genirq: generic chip: Add
> > irq_gc_mask_disable_and_ack_set()") did that a few weeks later, however no
> > one went back and took the brcmstb variant out.
> 
> That's too late. The original patch is already applied and I'm not going
> to redo the whole branch for this minor hickup. I've converted it to a
> delta fix.

Thanks.

> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> 
> You cannot add my Signed-off-by to a new submission.

Apologies.

Dave

> Thanks,
> 
>         tglx
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

