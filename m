Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636B7C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1s8IO0Gv34ic+NyjGbuv0eajc3hFNRAjyrWOVejEoE=; b=ZvvqNp6O5vUp3LS0fkQNP0Qsg2
	jF4EwIUGJTdOiJGYwGnJHYO+l4oAzlmdSCH83INEcmAhG8hvJJFqmKHc6L59c51Ai1COVbRQpKbiJ
	97P7phiGZrdyr1wmWuPg1VQk6KKcBwwzVlHPkpaLSRnNIokqy9yaM/spmUnGeo6aeKK91PGhuDPXS
	k33ijizAIG/J6MSWq3yOFVsv3uc1S+ALqNMuqf78Peb9L/2cJ/fixRlSaIRz/fGeZrVxziyDLOVsn
	8ZmA+tgRmnSwP3V3GOcWVhJRUtP3Mm/CrcOY/GhbKdn9pWd0MnUzK8rFNaD/kfFynaGB3GG0Pen1k
	PGLk5Qbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsb8-00000005fIx-2mEz;
	Mon, 17 Aug 2026 08:21:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsay-00000005f7p-13B4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:21:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B59C44023E;
	Mon, 17 Aug 2026 08:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D621F0155D;
	Mon, 17 Aug 2026 08:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786954883;
	bh=x1s8IO0Gv34ic+NyjGbuv0eajc3hFNRAjyrWOVejEoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tt0kpmoWJircA3aou5fJbNek/4Ftg+oS8Wyls3V/YQsZUP8U2KD4mH7iu9hJWa6i4
	 LadYIzR19hmaYnCUoif0qj1XCL2z38wHQkbky2X/oi72QcFMPd5ETny+EpPEsEys9o
	 pIMEouYN3NjXZplLFykLh3iIThgqD+6CeH3Obf+GfFZUkOrugfqWXP4E10XaDBp97U
	 iOEKf0lJzBmeyQBCwO1+6lqxYoXvB0prr/UzLsXaVUXyNbM1UGO/ql/+izCebLa0zV
	 t4IswhRpypvWtOB93vmiqF3SMxpQG0Q2wjRr2EKiqNfbxyeom+LwkKoxobFEnn2htQ
	 MpK7pzXn+KeYw==
Date: Mon, 17 Aug 2026 09:21:19 +0100
From: Simon Horman <horms@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] net: xilinx: axienet: Propagate errors from
 optional IRQ lookup
Message-ID: <20260817082119.GU265046@horms.kernel.org>
References: <20260813042012.17631-1-phucduc.bui@gmail.com>
 <20260814170001.GQ265046@horms.kernel.org>
 <CAABR9nFxfzf8QP-wq5iaJRTL+HG+a+tNqqX2daj-=Cwp46hPJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABR9nFxfzf8QP-wq5iaJRTL+HG+a+tNqqX2daj-=Cwp46hPJQ@mail.gmail.com>
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

On Sat, Aug 15, 2026 at 10:13:59AM +0700, Bui Duc Phuc wrote:
> Hi Simon,
> 
> Thank you for you review
> 
> >
> > It would be useful to explain how this problem was discovered,
> > and what testing the patch has seen. Please add an Assisted-by
> > tag if appropriate.
> >
> > Link: https://docs.kernel.org/process/coding-assistants.html
> >
> 
> Greg Kroah-Hartman previously asked about how this issue was discovered
> and how the patch was tested, and I provided the details here:
> 
> https://lore.kernel.org/all/CAABR9nEfPqXAt8wDo597qDS3b3KMaHeF6-swAFg9RLanapDnBQ@mail.gmail.com/
> 
> Regarding AI assistance, I addressed the same question from another
> maintainer here:
> 
> https://lore.kernel.org/all/CAABR9nFgiNv6cnYa3+ZY3KnjbKpcF-JHpZY8TVcR7H40vOoR=Q@mail.gmail.com/
> 
> The answers are the same in both cases, so I hope it is okay to refer
> to those replies
> rather than repeating the same information here.

Thanks for the clarification.

For future reference, I would suggest including something
like this in the patch description.

  Found by manual code inspection.

Others may differ, but I would find that helpful.

> 
> >
> > The same check seems to have been added to both arms of the if/else
> > condition. So it seems to me that it could be moved out of that condition.
> >
> > I would suggest placing it below the existing rx_irq/tx_irq condition
> > which appears a few lines below this hunk so that those and
> > dma_regs errors are still propagated.
> >
> 
> Previously, I understood that errors should be returned as early as possible.
> However, with the current implementation, I agree that your approach
> makes more sense.

Thanks. I agree that early error detection is the norm.
But as you note, the existing structure is a bit different here.

> I’ll send v3 soon.
> 
> Best regards,
> Phuc

