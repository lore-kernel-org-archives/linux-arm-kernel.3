Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FBAC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 14:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1zNXC882j0BCwBxeji6HC1ZHjIGfjhbbSn9tIs8/0s=; b=e/VfsIFsVxwLAoG6p2ICZqbf44
	rhZWKBmP1czKzUFEMjPs9sd1JI6BLXF5l6P8fuKQJhW5kJ/4Zptmu2rFzIj/W+xTDc8a9R2KUWaDk
	GMrhxQUOfOr15DqYQjWmLQdjQx0JZW61sRT4om5BbYOPdbCqx79aB8mXH3vx1unGpCP5yMrOi1cID
	j6xhkNJdi4oE0ZLT/rKWwvgOZXw82mjaYcqhhN2vmsV55mOJQubX20ppiqeptUuHqmPbol8GVrs0m
	JVRKZGtqRoRkXB13XWc1yejc6/Bm9gKDQJue3siLK3h6PiP92I0pH/rzq9W9dLAr02AKER//dDEOh
	bm76cR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXpK-0000000C0yb-487q;
	Wed, 22 Jul 2026 14:21:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXoi-0000000C0vf-1Yeh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 14:21:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso32916935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784730058; x=1785334858; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1zNXC882j0BCwBxeji6HC1ZHjIGfjhbbSn9tIs8/0s=;
        b=v7tOeYCgD0cL7pTkMXfThcGAVOyeFFr8z37O9MWcKjfDAsdNCSS75WnqI91OADnUoP
         Fi3enEMc5aYv7UKGvE7D2IxGfPyEbixmbotRF/lfxfhe0sFDqwP+auJR+wx55xkjIP3+
         2cWuO719rIX5+I2zvFV4XHeEzcgMq2KJgn9sFY7Rec5jSynMF0qvFZgqaMFFvLIEmM37
         h49cggYoPCkLAn2EQybGxMRNQtOc3sVkSUhXY1DYHJZ8OtRJ4IHLD1/ThJFSOV9FjtRX
         HcTup33IYjK51NorO+k/oYPP9wQbvhvGCsKDIr1TY0HPBHCzD4f9SsNRFC6X1+mczbnw
         LI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730058; x=1785334858;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1zNXC882j0BCwBxeji6HC1ZHjIGfjhbbSn9tIs8/0s=;
        b=RsfYTngPMteqj+8KIwowQ0SVQcK1EABJpcy6IO5cQvVMFWcPU39jXVZo0TxNbYUXD2
         zTxRV2WwF9UQ/Hp2OUhERssaJmH1TIep5zbF+jFGGEO8r+7vc7nRQ3SWtK65APmo/EdG
         xRzyXiNoqFFxBohDsiO1MYGNEX4h/fUSE6fFWHLnn2OofTYv5VD6BWG6glB4kdpjrA3K
         xsT3HVKVzcc5q1/FmnZgPte0kuTS/AVl0VSyeAVoOhxzao8GvQwv/5K8BOkLwv8JU2EZ
         lMoXb1iV1NaoJtYMSy3NzKR/7WSplSdxnYEbS4hEaNf4247lnEOxRavXpLd7gnMEjYbb
         927g==
X-Forwarded-Encrypted: i=1; AHgh+RrQcSEuWBBsFBfjZcDBS1xGif/6ZA2GIMeJtlQPySeOxURvblFqFbIJiah72sZVBhKs8FPySfTdEZEebxU8TOHP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3jMSKXLLk7oZNkKoMfWbbXcIjlGFkW9aXMJT4e8HLzCp21+9c
	2dTcu4SQx+R2Ur6lnFufcZuIa6Q4ikCES694dJFpNrHJCd8PK69RNRYLxEXOB5jTQyniVhsY6tD
	CGFK52p0=
X-Gm-Gg: AR+sD12Oy1YELVN8SyQ0EH6oWsbdEU4i8s7Otl8WNvsXlskKD1ky+tDyvpU64USFPrP
	bFdil02kSodkGdZar+29Py1I/lp2u2XpEsUusFvTrOFROTPnQm1A+vvq+nPhnBAMvpK9aG6Th5W
	ZJ33UTomzK4shjWeRXkRCNFI09U31i72AyBCr58eqsJTMn0vKnnXC8kErgWMSeuBevtz7gFR5tl
	QNAAUecB3LvXkAjRT3vmYYXqeVWxDqDZwZ3XBBD/ERihhlPwPMlUQ0zpx7jFdQo4sN9w1vvYotq
	qICN1fonkKuLrHt3VRIZKg4cbj70+6WBBYGh6n+hLhm6jqdLCVylSlFRxNPTyQLkmvRXXsJmftm
	gR3LzJHCIYR5hi2X/lM59/pVg6ORt68DfsEN8KyZ7LC067Y5Dd0Z4icBtO4mJIwh3hI7ECeqMcF
	H8JYt3SWhs075s7pnzxymKLe4=
X-Received: by 2002:a05:600c:3b01:b0:495:4fd4:144b with SMTP id 5b1f17b1804b1-4954fd419e8mr224754385e9.21.1784730058312;
        Wed, 22 Jul 2026 07:20:58 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:7ae3:a857:e482:495])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956d475e24sm40717585e9.0.2026.07.22.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:20:57 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:20:52 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <amDRxPkdvbA-iVer@linaro.org>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
 <20260721134853.2B2401F000E9@smtp.kernel.org>
 <amCGXUUd4VmuQRGD@linaro.org>
 <CAMRc=MfBNB0pvv1kPPcswE4Y2m7PXBO49bwJg=v0+aY=JmJKWw@mail.gmail.com>
 <amC7_M-HjVZ3sQuT@linaro.org>
 <CAMRc=MdnSyPmbK0skMx686=wSe52nnuWgCNJ0uSoKs_=HyAq-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdnSyPmbK0skMx686=wSe52nnuWgCNJ0uSoKs_=HyAq-Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_072100_463521_25756B29 
X-CRM114-Status: GOOD (  42.91  )
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

On Wed, Jul 22, 2026 at 07:11:10AM -0700, Bartosz Golaszewski wrote:
> On Wed, 22 Jul 2026 14:47:56 +0200, Stephan Gerhold
> <stephan.gerhold@linaro.org> said:
> > On Wed, Jul 22, 2026 at 02:34:52AM -0700, Bartosz Golaszewski wrote:
> >> On Wed, 22 Jul 2026 10:59:09 +0200, Stephan Gerhold
> >> <stephan.gerhold@linaro.org> said:
> >> > On Tue, Jul 21, 2026 at 01:48:52PM +0000, sashiko-bot@kernel.org wrote:
> >> >> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> >> >> - [High] State leak causing hardware misconfiguration on channel reuse due to uncleared `lock_scratchpad_addr` and hardcoded direction.
> >> >> - [High] Channel state corruption when `bam_slave_config` fails validation.
> >> >> - [High] Infinite BH workqueue loop and unratelimited log flood on memory allocation failure.
> >> >> - [High] DMA API violation: `lock_ce` buffer shares a cacheline with frequently CPU-modified struct members.
> >> >> - [Low] Unused assignment of `hdesc` in IRQ handler.
> >> >> --
> >> >>
> >> >> --- Patch [6]: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM locking ---
> >> >> commit 8b44c5e4935cbb61832adb3262df00b3b606a283
> >> >> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> >>
> >> >> dmaengine: qcom: bam_dma: add support for BAM locking
> >> >>
> >> >> This commit adds support for BAM pipe locking by prepending and appending
> >> >> dummy command descriptors with LOCK/UNLOCK bits when starting DMA on a TX
> >> >> channel. It uses a peripheral-local scratchpad address communicated via slave
> >> >> config for the dummy writes.
> >> >>
> >> >> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> >> >> > index f3e713a5259c2..411c60c4433e2 100644
> >> >> > --- a/drivers/dma/qcom/bam_dma.c
> >> >> > +++ b/drivers/dma/qcom/bam_dma.c
> >> [...]
> >> >> [ ... ]
> >> >> > @@ -1064,6 +1197,7 @@ static void bam_start_dma(struct bam_chan *bchan)
> >> >> >
> >> >> >  	lockdep_assert_held(&bchan->vc.lock);
> >> >> >
> >> >> > +	vd = vchan_next_desc(&bchan->vc);
> >> >> >  	if (!vd)
> >> >> >  		return;
> >> >> >
> >> >> > @@ -1072,6 +1206,24 @@ static void bam_start_dma(struct bam_chan *bchan)
> >> >> >  		return;
> >> >> >
> >> >> >  	while (vd && !IS_BUSY(bchan)) {
> >> >> > +		/*
> >> >> > +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
> >> >> > +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
> >> >> > +		 * already have bam_locked set and must not trigger a second pair.
> >> >> > +		 */
> >> >> > +		if (!bchan->bam_locked) {
> >> >> > +			ret = bam_setup_pipe_lock(bchan);
> >> >> > +			if (ret) {
> >> >> > +				dev_err_ratelimited(bdev->dev,
> >> >> > +					"failed to setup the pipe lock, deferring transfer: %d\n",
> >> >> > +					ret);
> >> >> > +				queue_work(system_bh_highpri_wq, &bdev->work);
> >> >> > +				break;
> >> >> > +			}
> >> >>
> >> >> [Severity: High]
> >> >> Does requeuing to a high-priority BH workqueue upon ENOMEM cause CPU
> >> >> starvation? Because system_bh_highpri_wq executes in softirq context,
> >> >> requeuing immediately without sleeping prevents the memory reclaim needed
> >> >> to resolve the GFP_NOWAIT failure, leading to an infinite spin loop.
> >> >>
> >> >
> >> > It looks like my suggestion to queue_work() again in the error path of
> >> > bam_start_dma() wasn't great if we end up causing an infinite spin loop.
> >> > We do need to retry somehow or report an error though, I don't think
> >> > aborting and leaving the desccriptors completely unhandled is an option
> >> > either... :(
> >> >
> >> > One option would be to try to avoid the allocation and write the lock
> >> > descriptors directly into the FIFO, but this will probably get really
> >> > messy as well, since you would need to carefully modify the FIFO
> >> > management in several functions ...
> >> >
> >> > I don't have a good spontaenous idea how to solve this right now. :/
> >> >
> >>
> >> Pre-allocate the lock descriptors (if needed) in bam_prep_slave_sg()? As in:
> >> call bam_make_lock_desc() in bam_prep_slave_sg(), store the descriptors and
> >> make bam_setup_pipe_lock() return void as it will no longer be possible for it
> >> to fail? It would just grab the preallocated descriptors.
> >>
> >
> > I considered suggesting this, but how do you know which descriptor needs
> > it in bam_prep_slave_sg()? It's just the allocation, afaict it doesn't
> > tell you anything about the order in which they will be submitted. :/
> >
> > We could always allocate the extra lock descriptors and waste the extra
> > memory for the descriptors that won't need it. That should work, but is
> > also not great ...
> >
> 
> Oh, I was thinking about having pointers to lock/unlock descriptors in struct
> bam_chan and to just grab them in bam_setup_pipe_lock() when needed and then
> next time we enter bam_slave_prep_sg(), we see we consumed them so let's
> re-allocate them. And of course: don't do it at all if pipe locking is not
> supported.
> 

Sadly, I think(?) from the API perspective it is valid to
dmaengine_prep_slave_*() a couple of buffers and them issue them
separately, e.g.:

	desc1= dmaengine_prep_slave_*();
	desc2 = dmaengine_prep_slave_*();

	dmaengine_submit(desc1);
	dma_async_issue_pending(chan);

	// do a bunch of other random stuff
	// bam_setup_pipe_lock() consumes lock descriptors

	dmaengine_submit(desc2);
	dma_async_issue_pending(chan);

In this situation, we wouldn't have any lock descriptors allocated
anymore?

Thanks,
Stephan

