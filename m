Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E988C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOLlzqOvF05B7j1/cu0Mg0IOPy7P+W/8Ezls8+sFmRc=; b=IXly0NqIKfqE3YqQlUVwyIEXeF
	xjwZNXpaFFvyHqpARM9bxgetanaA5ttCUAe7+pypimm+8mBi21vKAWlRswpGomxituaGIeddgGqOD
	qaf3a8waDT8jLsoZpfMDL20VVQMfM3oiRa2KVeBufBW8XwbxGKNH7ciSCJ8ri/vcNuyh/7F8iPFZQ
	+yh/uMtWIb+FhmNQ6Vw6g1IyXuY1gL5JccVj8GC/QiQsvH1Lp1Pr4LaYkoeZ0CD+iw/VCgLKe87cW
	xTGQVI06yaEmAF1EeNTxJHBUT/wAUe8kj46QYyfWzz5AY4ShwE6RV1A9S3QasW9emdEJ+iOK+rxve
	KRMVKbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQcW-0000000AW4q-0P9P;
	Thu, 17 Jul 2025 15:34:04 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPnK-0000000AP9i-2UD5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 14:41:13 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-73e5523ef8fso314156a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 07:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752763270; x=1753368070; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KOLlzqOvF05B7j1/cu0Mg0IOPy7P+W/8Ezls8+sFmRc=;
        b=kZpWMYE0IyE/lFGd9g8KwDM+Qt4N0Vs55AO5WwEDs36W0aNct/StSr0J58xpV37W/u
         7wt4X6K1Uk7GhCAEq+nZj+C5ohJsr7J4Nlq8X1LDbU1Tn50Px50hF5FEIX8t3KPJrnWy
         VHp+93XhW7V3+Bu6yfKaZbIUR1uJM9i1yBAkqs5ZjZkJUVmdudNOY+BHf1R79XlzSYBw
         GfpifFIh/k2Zv9DL2wETjRbNrWrVwa0nprr49ObT8ZBlcjZMQhLdbJcFRBlHWVyXu8fo
         HderYN3+zn3ZBkTDRBjxLFWC5xpBjMdgpdhmidhm65rWiGWa//T4zYVGLdpLArIzeOAu
         k/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752763270; x=1753368070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOLlzqOvF05B7j1/cu0Mg0IOPy7P+W/8Ezls8+sFmRc=;
        b=OGzNRlmc8vDKivDpMcE7r6YUiPwBz3Y3RJkwMeLETwOr6F3K156iB3wHTVbbK9cX2m
         x6ikm4XwETv/U2K0Fxgl/0tS91VzoJhe9NL6Z8YJo0BDax8SHuRQe5mqofwJXHK2esUw
         kzuCSbGHRUsUgasFNGgeemjclBwwJCgToWBGiXoUrSxXQkyI5Igkdm8Ggc+dv2T/53fy
         70+aypRNiwDG9KjBTlYoIXCWfSAItmfP7io3Sc/rFilqw6SFZ3AJZFVQK1uGAXhd7slF
         Ep/nxz27PnR1ko5+3BMS9Wg9osWK4skL/sWxj4V0/SVUtxr2W0dHjRXbzXn1nC3Nlt+k
         WSrg==
X-Forwarded-Encrypted: i=1; AJvYcCVWFCsxJcJzYmSwfa+9WFcVmUfpjUMStpZvMh7biKLquXJU64NkhjqZvvLCTRTE21uSqHDx2QiTkXG43CVlQ1Ka@lists.infradead.org
X-Gm-Message-State: AOJu0YwgVMTHS84l1xSmKqYcacrurnL40ztaNmFgsb4bx5eJpAawzaYK
	eFo6y/5UE2K+PrYRFgynDRW74KEGkmhRPeJyiwcNxKfGBRO3UADDOZgWgpeHgeyT7eA=
X-Gm-Gg: ASbGncsC88hAUIFkmv5aNGUJiZ3VASZXa57imjbqNqwD56xWC9E0n7NJUM2iZGC90J4
	bq1lwlDkvTix76JpCZIgeFxn/NmqI0HfFSZDi+O3ES7sUYlm/CgX/eQ8LLL6ECyf8mxfIjCx65N
	n4BSpobKcb9t5Zmqs7g6EiIF5IhXLe5o3ETXYSEweTmWiy4RCxwU4UB0c1FYf3xBu6bZVIr5MLt
	gb3RJLPnKISiO27TjB8t/BlEuphdJyBGEtrsdB1RyD3KsXhzI9IcGCCqCXLiwMcSRoZnVUXiFlM
	g+TI/vE4HaN3A08vj+raTkxRVfnuQmiN/2C+W3ozuBYH2fQRS1A0MtLNbSzCca1L6/MNzToix1y
	N7oMYerBjdDTXecYwm+L/Hp3JFaht
X-Google-Smtp-Source: AGHT+IHY11r3be2AgKsKzf76injlnJw53F2oFbGYqPw0mSWwU9m3Yv2l9kEZegI+e2J/7Nm8/oQtQQ==
X-Received: by 2002:a05:6830:7202:b0:73d:baa3:82cc with SMTP id 46e09a7af769-73e64aa353bmr4811092a34.19.1752763269281;
        Thu, 17 Jul 2025 07:41:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2c38:70d4:43e:b901])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff8ede965fsm2575267fac.40.2025.07.17.07.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:41:08 -0700 (PDT)
Date: Thu, 17 Jul 2025 17:41:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] irqchip/gic-v5: Fix error handling in
 gicv5_its_irq_domain_alloc()
Message-ID: <5c22b679-853d-410c-973a-ba3c91a54b84@suswa.mountain>
References: <cover.1752693640.git.dan.carpenter@linaro.org>
 <4787a3c4-9713-4b99-9b8a-7ba227e91d02@sabinyo.mountain>
 <aHjBe9k2Igl2iopq@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHjBe9k2Igl2iopq@lpieralisi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_074110_657212_013A70F2 
X-CRM114-Status: GOOD (  27.69  )
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

On Thu, Jul 17, 2025 at 11:25:15AM +0200, Lorenzo Pieralisi wrote:
> On Wed, Jul 16, 2025 at 02:38:22PM -0500, Dan Carpenter wrote:
> > There are two issues to fix in this code:
> > 1) If gicv5_alloc_lpi() fails the original code was checking the wrong
> > variable.  Fix the mixup between "ret" and "lpi".
> > 2) If irq_domain_alloc_irqs_parent() fails, then clean up all the loop
> > iterations instead of just the current iteration.
> > 
> > Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/irqchip/irq-gic-v5-its.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> > index 55360ae9f1f6..8cc8563e27d5 100644
> > --- a/drivers/irqchip/irq-gic-v5-its.c
> > +++ b/drivers/irqchip/irq-gic-v5-its.c
> > @@ -949,15 +949,18 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain *domain, unsigned int vi
> >  	device_id = its_dev->device_id;
> >  
> >  	for (i = 0; i < nr_irqs; i++) {
> > -		lpi = gicv5_alloc_lpi();
> > +		ret = gicv5_alloc_lpi();
> >  		if (ret < 0) {
> >  			pr_debug("Failed to find free LPI!\n");
> >  			goto out_eventid;
> 
> This should be:
> 
> goto out_free_lpi;
> 

Yes, you're right.

> otherwise we miss cleaning up for [0, i - 1] on LPI alloc failure.
> 
> I can fix it up - not sure it is worth splitting it into two patches,
> just let me know please how you want me to handle it.

I don't think it should be split up.  As a reviewer I would be annoyed
by a split up version of this.

I'm a little bit surprised by the offer to fix it up for me...  Is this
going through your tree?  It's probably easiest if I just send a v2...
Let me do that.

regards,
dan carpenter


