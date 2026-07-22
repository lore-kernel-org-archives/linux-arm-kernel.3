Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654B2C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vll96HvxjohoJS+PNU+ieDa/RF4H+N4kRxOCCao22w=; b=xm35jfBe76FXbDsFGaIqAUwP/Q
	r7aorJ2evtUjiqGayQL9ZLgMsgOp5j8PgbWILrUIOSoUWVw7zD9rNvS3UciuPFU/KwS8rOQkWCnZ4
	b2IWID0MXfHMUfWQNIqeGntyaC/DdsBVOP/goi2qaP/p6FHE4/VEEn38YLBpIrAFSTmKEUxLuqGWD
	Wt2pMJeTxIRz0pfBM0Rz5DidbiHy4eJ/CCQZdkmDzhhu9xK/bqzQd6Jbx26J2Gb4C+HaTslak7uAC
	KCgrJSsm4gius19ewsCvomSy1dZLd9ExYHd7qcryEiGvzKllaRvJGe1yZcQOAk1aMgqYUvhPeiOaV
	AsSmxfkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWMw-0000000BnS8-0IOT;
	Wed, 22 Jul 2026 12:48:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWMt-0000000BnRa-29RQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 12:48:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so36491105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 05:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784724490; x=1785329290; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3vll96HvxjohoJS+PNU+ieDa/RF4H+N4kRxOCCao22w=;
        b=TOeEQkwCl+eD2JHeRGzdIwwP3Gc6IHCoMQITVBoUNI7P+OIFYOV378muft1yPuDFMb
         YB77ZRxqf7HWTIsEwjjKDas/DTiM5FivQdqFt/MqSeg6bI4yTFlGZkoKv+B4PTxLL14Y
         FIJAZeeliEhb0Lx2jEbV9rmx6n4KXILLab/uHp9hMOJICK84jKR/2JDc1DmM6Xf4AZ8/
         xvSxZniT3VfL+hcXoQElazedwZtir8XZayHwP7tcKkWd7GHFwR55Y/8gGeuaqmm7W0r/
         MYYeNsLbmwsu1beujb+kreF24xzM765yyqxvH+tEgZh6FAR97yJCUyKi/3KrrVQRFwuc
         ykAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724490; x=1785329290;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3vll96HvxjohoJS+PNU+ieDa/RF4H+N4kRxOCCao22w=;
        b=pWHP8IXMrnweu9UCMiKeWNqIAHZqRS7tN2du0HKAg/cPnKFxgHkGcfDMm8FPw49EzQ
         6Wf7XUgfiis3EXAtVRqQtRyqkVUENMOyfkgOs8X8Wkz/HV8ZEP5euBbgtZGAf6ruUfmn
         MrwWTqpVUV+N4iQDzj6TBgrsiQXGpHDcLgG/28NWxcQ4cI1ervdx13rvHluZQ0hQ1/vP
         2qBKAcKNXP63WCStzfQVK3juXEaem6eRoTbETYSGuMxnCz6dc7eLougFdfeBoYp4zmgy
         TDd1Mr5ImxfTrRfx8G3IvsZc8CAxAhDLSCKMuIZX0HKqcIcdzigIg0TQFaMliB4+1M1K
         zI5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr6A/dkNm5Pr1YvayBF7evNCJf2lyBgUz+dZASBgty1RG9dUUt+nZ0xB7sBGOGpvgv+d4wdcfnDK7Oaw415dZxJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwP711ju4+37e0wpKcLMD8ATsqBzDewJEHSie/TVaRb5DfHWqXc
	TjZb3EOg+jgZhccMxhQ72qYEVWF50wrOHhn3aGPNm4OyhAnZUA//eGhwL0PWggm9530=
X-Gm-Gg: AR+sD10MiNhrRmOUFrGpyil4qoQChOoInDsepoP6A1lvzTDov5FAqZEwdDwMIcTSHOQ
	JlallXhuXCZvxgVAF0gVqyH0M6xRphMWRPplCFCUfdE54lKUi5eLLKEAoTcLHMddrx5SXWXjn/Q
	RBPuRnmdzcyQcKXFfKI3AiXICHl9RnxokuK70TkOhMy42gQaz6sA5v8NhfIKqBr+Qj+E4eHCbaW
	6303qZtmQ86KZzx/wwcMIQvR60zfhrq7sf14aToFQDknL5OQp9DdOuJHIduz0pQYD2/zSnLvvGC
	8bJlhxUSE+3PBK9kmes234UBT9HQN0UplNvU1Vf7ol8QoaJc8aRxV6Va7q0rz4zeVjlAnkLoqnV
	bS0GKxeMLKTYYM6H9WrLScoKEalNSLEZRP9m/ItH7YmMTWHwsO1yyWNNxPQK8IAcvsEanEBMoNz
	2T3lElmgtR+lCp
X-Received: by 2002:a05:600c:474e:b0:493:915b:dc4a with SMTP id 5b1f17b1804b1-4954a3d005amr297618495e9.8.1784724489524;
        Wed, 22 Jul 2026 05:48:09 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:7ae3:a857:e482:495])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bffefsm131520645e9.9.2026.07.22.05.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:48:08 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:47:56 +0200
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
Message-ID: <amC7_M-HjVZ3sQuT@linaro.org>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
 <20260721134853.2B2401F000E9@smtp.kernel.org>
 <amCGXUUd4VmuQRGD@linaro.org>
 <CAMRc=MfBNB0pvv1kPPcswE4Y2m7PXBO49bwJg=v0+aY=JmJKWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfBNB0pvv1kPPcswE4Y2m7PXBO49bwJg=v0+aY=JmJKWw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_054811_592792_1A04EF27 
X-CRM114-Status: GOOD (  39.46  )
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

On Wed, Jul 22, 2026 at 02:34:52AM -0700, Bartosz Golaszewski wrote:
> On Wed, 22 Jul 2026 10:59:09 +0200, Stephan Gerhold
> <stephan.gerhold@linaro.org> said:
> > On Tue, Jul 21, 2026 at 01:48:52PM +0000, sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> >> - [High] State leak causing hardware misconfiguration on channel reuse due to uncleared `lock_scratchpad_addr` and hardcoded direction.
> >> - [High] Channel state corruption when `bam_slave_config` fails validation.
> >> - [High] Infinite BH workqueue loop and unratelimited log flood on memory allocation failure.
> >> - [High] DMA API violation: `lock_ce` buffer shares a cacheline with frequently CPU-modified struct members.
> >> - [Low] Unused assignment of `hdesc` in IRQ handler.
> >> --
> >>
> >> --- Patch [6]: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM locking ---
> >> commit 8b44c5e4935cbb61832adb3262df00b3b606a283
> >> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >>
> >> dmaengine: qcom: bam_dma: add support for BAM locking
> >>
> >> This commit adds support for BAM pipe locking by prepending and appending
> >> dummy command descriptors with LOCK/UNLOCK bits when starting DMA on a TX
> >> channel. It uses a peripheral-local scratchpad address communicated via slave
> >> config for the dummy writes.
> >>
> >> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> >> > index f3e713a5259c2..411c60c4433e2 100644
> >> > --- a/drivers/dma/qcom/bam_dma.c
> >> > +++ b/drivers/dma/qcom/bam_dma.c
> [...]
> >> [ ... ]
> >> > @@ -1064,6 +1197,7 @@ static void bam_start_dma(struct bam_chan *bchan)
> >> >
> >> >  	lockdep_assert_held(&bchan->vc.lock);
> >> >
> >> > +	vd = vchan_next_desc(&bchan->vc);
> >> >  	if (!vd)
> >> >  		return;
> >> >
> >> > @@ -1072,6 +1206,24 @@ static void bam_start_dma(struct bam_chan *bchan)
> >> >  		return;
> >> >
> >> >  	while (vd && !IS_BUSY(bchan)) {
> >> > +		/*
> >> > +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
> >> > +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
> >> > +		 * already have bam_locked set and must not trigger a second pair.
> >> > +		 */
> >> > +		if (!bchan->bam_locked) {
> >> > +			ret = bam_setup_pipe_lock(bchan);
> >> > +			if (ret) {
> >> > +				dev_err_ratelimited(bdev->dev,
> >> > +					"failed to setup the pipe lock, deferring transfer: %d\n",
> >> > +					ret);
> >> > +				queue_work(system_bh_highpri_wq, &bdev->work);
> >> > +				break;
> >> > +			}
> >>
> >> [Severity: High]
> >> Does requeuing to a high-priority BH workqueue upon ENOMEM cause CPU
> >> starvation? Because system_bh_highpri_wq executes in softirq context,
> >> requeuing immediately without sleeping prevents the memory reclaim needed
> >> to resolve the GFP_NOWAIT failure, leading to an infinite spin loop.
> >>
> >
> > It looks like my suggestion to queue_work() again in the error path of
> > bam_start_dma() wasn't great if we end up causing an infinite spin loop.
> > We do need to retry somehow or report an error though, I don't think
> > aborting and leaving the desccriptors completely unhandled is an option
> > either... :(
> >
> > One option would be to try to avoid the allocation and write the lock
> > descriptors directly into the FIFO, but this will probably get really
> > messy as well, since you would need to carefully modify the FIFO
> > management in several functions ...
> >
> > I don't have a good spontaenous idea how to solve this right now. :/
> >
> 
> Pre-allocate the lock descriptors (if needed) in bam_prep_slave_sg()? As in:
> call bam_make_lock_desc() in bam_prep_slave_sg(), store the descriptors and
> make bam_setup_pipe_lock() return void as it will no longer be possible for it
> to fail? It would just grab the preallocated descriptors.
> 

I considered suggesting this, but how do you know which descriptor needs
it in bam_prep_slave_sg()? It's just the allocation, afaict it doesn't
tell you anything about the order in which they will be submitted. :/

We could always allocate the extra lock descriptors and waste the extra
memory for the descriptors that won't need it. That should work, but is
also not great ...

I was hammering at the code a bit earlier to try the "write the lock
descriptors directly into the FIFO" approach. It has some advantages,
but also makes the FIFO management quite a bit trickier, hard to get it
right without full concentration. :')

I _think_ it could potentially work, but if you have a simpler idea I'm
also happy to throw away the mess I started. :-)

Thanks,
Stephan

