Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554C4C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 18:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRzZo2BIrzS2/3EuB48709dCjGwV5yrxCu6+EuEuEXg=; b=BRSjsO52w+3vdyMdQdGMTMAR02
	g/TpoJr3C3oyTWj92xPmJprngAlHVkzfoD1iXftbXggpQNV1aNLEZ/LGmZGdv+WHUJWPSsEGG6Uxh
	6fcnP4ujYlXXdSzRat20PJQfJWXxnLoJPKfCx6JoJPALxtWXfqxsHebCWSIznKK9aAKSpuDVP3pFN
	7nEGHT3xmpBS6L145QmTtEZkyWnYc1FYcRuV2azqvEvvQzHlsWEjIt1AGeSt+iIBkwdB62jPlB4Uc
	kzNwirasnNXQIiIpHWi4ApzNMx8aApcPllrfdiKY5qS8IUMP/pwAn45VJ7Oac1yIwdRTYyT16GNsd
	6tFMksyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyw2o-00000001KGb-0NfO;
	Tue, 25 Aug 2026 18:38:46 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyw2l-00000001KG1-16c2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 18:38:44 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cede6375caso20955ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 11:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787683122; x=1788287922; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eRzZo2BIrzS2/3EuB48709dCjGwV5yrxCu6+EuEuEXg=;
        b=LhHp7jnkCmXCcJDsNO8T+OXxZxsn5XOKJIs2YbnkC6dGeGnlmmZEOSsia480UEslqZ
         K51GEuhHzn77310u2vMmmykcmTi3L2Ir8OtIQkPlZngfxB1sa8DzKzPLVoyhWXgGw0To
         Fmr9AboegcMdDKzrbN0y7GO30IMoqBH7BQeICp9Vvz/o6ZtnE06zrMZNwwZ0TzLY+m75
         Sft0gfjuSryZmqGHc6Fb7EGc6FYLSh5w1XQNKFA70QtsrCX65E+aDRVD4xAvCTXNSLIz
         Ks7wrceFD4sMQIeb/e6BGl1Iv2hfe/lvNRbwe/zeAkCsAraWQvZUvMktbm2yTM081/S+
         47Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683122; x=1788287922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRzZo2BIrzS2/3EuB48709dCjGwV5yrxCu6+EuEuEXg=;
        b=B2UBqcuylyn5XCnnVvrJf6iYNojjOBr0N4dz2hpx00Nk7twlUl1wHX36J+XQG7GbA2
         z1yFHdeKJebgGQY4q+2s48xwqNLW+ZrJ/jN6gY8UqN/4oY57S4kLI5pCoYcUDW/vjy9E
         9yCvobqdPMUF//xR+nhelYFiYo5TBYraiPurkE5OKc6yBkpIosB4SjQqUWFmocwEweEd
         XxI+4sOUBDVThhoApnb7CSE4xxOtZB+1+HTIoiypNTKpy6gMjOPqguN2w4BzkZq583+X
         49puFHt4R9PolLNrvX5KaR4vpEQxMldifefWN7XRoSxU8c1aPP169pmf60MxlAEeOanI
         idNw==
X-Forwarded-Encrypted: i=1; AHgh+RrmjqoKrrb1RdbeDGN/p+aI8j6BupNc0KPVQRifkneh58dy8gyCcIBoLAyja879eYzxavMCQS3R8tXQkp1EevIx@lists.infradead.org
X-Gm-Message-State: AFuF++nl95ZE1UWtfPAKNPS1b6jpWneqen5W4xv+PTJ0SQkA/Nq/+wmP
	yManFhOggHEgE6xy2iAXy3gZj4XL1tQdgGma4oNsiKxIZibC0+Ioo8opEzhjn0I5FA==
X-Gm-Gg: AR+sD13jBYXLIEH2AFqUUtisLWfdJh8yJ1LHq5n1vKOEJMAf0p92K57lSd4LnvSTq6k
	WSRZzotAEC2YLw1/ILiw9BZV9ZFArzEYIL4and261b6Xc6ZgtvWz7D6EKZThV9UrzfDVUDqSGsQ
	vAk0DE00GRC3b7+CbT9NRTrpos/Kg/0p5mctSCfVqmnBWLmTs/rwpibdqbrDTFM/+DTYMaABvP4
	OiJ/aVtfAW7S/zKQyZPxna3GGoa4iuNQ7A9HKvzvB2iPCl6hQvrHbh+2a6gC2ISe9mjmvrxkObR
	EK1AfSBoiz7kvmba9+gfc0dWn6/LvAZZ043MK4XTAln4HXAu6MfN+MyMRmtfWPX+PDqJM6sKftv
	oy+qq6tyrDPG1xhBkxXc/LaesKF97o64ndItuSwWKMdbCUXBgATR35NNXYomjjxmtCRCgR6hJS4
	V5j/XgoKTF3bVHXDF4J6AtRedSJwWMiRe5PVac7IMhbp8E0wQxHMezwd91EU2ZzCDm3cbqYW2dY
	5/f3thaeSoW6cb0rNQk9bwyQA==
X-Received: by 2002:a17:903:440c:b0:2cf:9ec1:ea6e with SMTP id d9443c01a7336-2d6e077122amr9153765ad.8.1787683121595;
        Tue, 25 Aug 2026 11:38:41 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3967083e4b0sm26532a91.3.2026.08.25.11.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:38:41 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:38:35 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 07/12] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <ao3hK8tdOPLvbpfK@google.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260728210928.1050849-8-praan@google.com>
 <178767577113.3356902.16348370784507904981.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178767577113.3356902.16348370784507904981.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_113843_364871_DD094EE1 
X-CRM114-Status: GOOD (  20.83  )
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

On Tue, Aug 25, 2026 at 01:36:11PM -0300, Jason Gunthorpe wrote:
> > [ ... 52 lines skipped ... ]
> >  		while (!queue_has_space(&llq, n + sync)) {
> >  			local_irq_restore(flags);
> > +
> > +			/* Avoid waiting for space if the SMMU is suspending */
> > +			if (Q_STOP(READ_ONCE(cmdq->q.llq.prod)))
> > +				return 0;
> > +
> >  			if (arm_smmu_cmdq_poll_until_not_full(smmu, cmdq, &llq))
> >  				dev_err_ratelimited(smmu->dev, "CMDQ timeout\n");
> >  			local_irq_save(flags);
> 
>  [Severity: Critical]
>  Can this loop bypass the Q_STOP check if a suspend happens concurrently?
> 
>  If a thread enters the while loop because there's no space, and a concurrent
>  task sets the CMDQ_PROD_STOP_FLAG while space becomes available:
> 
>  1. arm_smmu_cmdq_poll_until_not_full() updates llq.val with the latest global
>     state, which now includes the newly set STOP_FLAG in llq.prod.
>  2. The loop condition !queue_has_space(&llq, n + sync) now evaluates to false,
>     causing the thread to exit the inner loop.
>  3. This bypasses the Q_STOP(READ_ONCE(cmdq->q.llq.prod)) check inside the
>     loop, as well as the Q_STOP(llq.prod) check at the top of the do-while loop.
> 
>  The thread would then successfully cmpxchg the new producer index with the
>  STOP_FLAG set.
> 
> Make sense to me, having arm_smmu_cmdq_poll_until_not_full() reload
> the llq and then not loop again from the top skips the Q_STOP
> flag.
> 

Right. I guess we should check the condition again after exiting the
loop or add the point of commitment to this space loop somehow. I'll
take care of this.

Thanks,
Praan

