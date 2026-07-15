Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CABCC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 16:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lQdKSmRz9WhvxdTzt01CBN7vUfgGKc2JFY2x/IMYok=; b=VXbK65obBKfrBLl+j3z/scFmyX
	fEIeaBULwRJiuyGbRIfM/d7ly7P0NGDLZTq5WN1MpuIAY2UEDwoMDsGE5slIBR4n/S9Ftsgdo2T1I
	5QbQfoVC9sXMBhPwN+3mSHAkh6bKHgBfQC2Y9sjhwFkGRuSflENyOo3lN1fX6Xn3AUv+XLLYc1W/R
	6Jw4RnlbKENE7Pg5gLdDOt/AH080OjMFwpAivtGTguY7CvZ2GH5abMotqgmD/r2x+WPm2yuHe2iuj
	5wiVoXNQrno/OYzHQhZqj3XcacM5xzeZxcaAWJqk6gJm0+J5iZt7MouaEosScKmFtN1gZegnf21l7
	7d0+Vbjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk28A-0000000FPGK-0FxO;
	Wed, 15 Jul 2026 16:06:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk287-0000000FPFl-3q2c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 16:06:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so40455155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784131597; x=1784736397; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+lQdKSmRz9WhvxdTzt01CBN7vUfgGKc2JFY2x/IMYok=;
        b=aQlygb2b82IImQ6CW4GykMRHtO0W+NFRqiwFN83a4fmuxdf3wsbj+N29eRJW5CLNRX
         su1SKhjdT0NOL07Wjnf7jOXlx2FQBtQoAemAqWq3iJEyxsq03vm7637zoqGAEdoXDu3U
         BRkYio7LZgpGLg538mFi3lCZjkyA8eSuvd2HzwgjbMzwMfBh0Xcf/7XkRFW6vx6mUhkH
         Q1DbP0jwwzzlebIUL3ZE49jgYmCyUsUoETn5BEpyHPsvvvQRMbBG/0wivS6EC3k9YyiG
         XDhW0AUEGMXCY+AZZfBvtPu1tC62PqMeg8/QadXZKRDcgM411fd7tgi9PIy3ebyTSr5c
         OX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784131597; x=1784736397;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+lQdKSmRz9WhvxdTzt01CBN7vUfgGKc2JFY2x/IMYok=;
        b=Saw7Xcm3kPcNWX8cVqllDMNhGfdKc3nOX6jGRJ8sEtyyT3axhjntL+HBwgtzkJFhsD
         GylbYWKtO3wbXaaY5NtZJxTbG6/fU0ro+FUZTsOPQGe8eW251vZu733p/EHkUoIw9Itz
         6px0I9QVcSNTZllFwFOY/xBZO2otDCC2v4QF/OBrq+SAwvUTiOfKfct58pTQv7FGOPmX
         BoslW+lnGjI1njDZt1Dl9NsWBo77VIbp7OWoZpqdxKiwb77ARm/OEFoZChqdCM7msZ4R
         mu/b+0QBigLKWZ3bZyH7tISa7LKBR06pVLtOA/I5C4m4KbTQmA6WrkOyqmsHq5la4Qy5
         uBeQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro95c+r7bEVU/NVSeF+Osu26V/1gYTQrnT8X1hcT7V+KPTauYVedYF1TRRo7/fyMgac0fAVPpXOeU0xL6oM8zQL@lists.infradead.org
X-Gm-Message-State: AOJu0YziYFA242NDe2bLtUTqcCo+IpLf7BzdF+YGOhY9/Q6MMncquiFm
	p2xk3Xw5fAzECwaELFzNTlf7ibP7pQ1yxTXwPYxzfO9Chro6Zm+7FF7LSVas0LJ1hm0=
X-Gm-Gg: AfdE7ckKUFkq77dE5pIaiWeUV5hkLiUQalvIF1DhIvUf7d5L8x212JQliANmwxCrgmY
	t0Tu0mYHuk6t+mtysdwUroimh5nzc4YUdHPCxaWu8wSi8wd5knTYhfzHNTnlsbt4VfPzlGePu9x
	eMPtmyiVyHkgrG0RI4Vx9Ikl3BbDxxZ3X+Nhw7llBGaUi9GT52FwVs99jSFYmlJ3MBK7o1NT6hX
	d/jY4yKUVjibyYHT2n3zKi/QTnvorYJfm4nhisW/eOAMB/DcZsY/S4plVAHwfVKMyNJloJuGJ7w
	ECgPpDgneHUxZrFSgBUNRs+J3tDIbt9qwhVZK+ajl5YEZGg5yAl/kwEVSA5wvIY7Ae3fiMvA/mN
	9ZBvgQQLHWUgSC67c/Ts/SmQPPpg/mRoHayqxGbOu1y7MIa+Uw6d2nyNJgTytKfXJUGBDSA5CuL
	cOlAAvZu5axuJxhOHuxdYuEy8Zw85/4W+FSSY=
X-Received: by 2002:a05:600c:8b6d:b0:495:3fc4:81b4 with SMTP id 5b1f17b1804b1-495403fcaadmr9759685e9.30.1784131597440;
        Wed, 15 Jul 2026 09:06:37 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:d62b:a557:d06c:e9ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm232743795e9.12.2026.07.15.09.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:06:36 -0700 (PDT)
Date: Wed, 15 Jul 2026 18:06:27 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v21 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <alewA9ubkYKHpnuj@linaro.org>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
 <20260713-qcom-qce-cmd-descr-v21-6-bc2583e18475@oss.qualcomm.com>
 <alYGGu7_3G6mJAzQ@linaro.org>
 <CAMRc=MevqXga1u-XC8LYc3hnjjzmdESntsSGYP25XECeeySfJA@mail.gmail.com>
 <alepDnRJmRLbFGRQ@vaman>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alepDnRJmRLbFGRQ@vaman>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_090640_016647_8049A093 
X-CRM114-Status: GOOD (  39.76  )
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

On Wed, Jul 15, 2026 at 09:06:46PM +0530, Vinod Koul wrote:
> On 15-07-26, 14:43, Bartosz Golaszewski wrote:
> > On Tue, 14 Jul 2026 11:49:14 +0200, Stephan Gerhold
> > <stephan.gerhold@linaro.org> said:
> > > On Mon, Jul 13, 2026 at 03:01:07PM +0200, Bartosz Golaszewski wrote:
> > >> Add support for BAM pipe locking. To that end: when starting DMA on an RX
> > >> channel - prepend the existing queue of issued descriptors with an
> > >> additional "dummy" command descriptor with the LOCK bit set. Once the
> > >> transaction is done (no more issued descriptors), issue one more dummy
> > >> descriptor with the UNLOCK bit.
> > >>
> > >> We *must* wait until the transaction is signalled as done because we
> > >> must not perform any writes into config registers while the engine is
> > >> busy.
> > >>
> > >> The dummy writes must be issued into a scratchpad register of the client
> > >> so provide a mechanism to communicate the right address via descriptor
> > >> metadata.
> > >>
> > >> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > [...]
> > >> ---
> > >>  drivers/dma/qcom/bam_dma.c       | 191 +++++++++++++++++++++++++++++++++++++--
> > >>  include/linux/dma/qcom_bam_dma.h |  14 +++
> > >>  2 files changed, 198 insertions(+), 7 deletions(-)
> > >>
> > >> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> > >> index f3e713a5259c2c7c24cfdcec094814eb1202971a..f08549ee3872eece85884606d6ee9e540ee688ca 100644
> > >> --- a/drivers/dma/qcom/bam_dma.c
> > >> +++ b/drivers/dma/qcom/bam_dma.c
> > >> [...]
> > >> @@ -686,6 +702,35 @@ static int bam_slave_config(struct dma_chan *chan,
> > >>  	return 0;
> > >>  }
> > >>
> > >> +static int bam_metadata_attach(struct dma_async_tx_descriptor *desc, void *data, size_t len)
> > >> +{
> > >> +	struct bam_chan *bchan = to_bam_chan(desc->chan);
> > >> +	const struct bam_device_data *bdata = bchan->bdev->dev_data;
> > >> +	struct bam_desc_metadata *metadata = data;
> > >> +
> > >> +	if (!data)
> > >
> > > Doesn't really matter much, but since the parameter exists you might as
> > > well add
> > >
> > > 	&& len == sizeof(*metadata)
> > >
> > > here to be sure.
> > >
> > 
> > Ok.
> > 
> > >> +		return -EINVAL;
> > >> +
> > >> +	if (!bdata->pipe_lock_supported)
> > >> +		/*
> > >> +		 * The client wants to use locking but this BAM version doesn't
> > >> +		 * support it. Don't return an error here as this will stop the
> > >> +		 * client from using DMA at all for no reason.
> > >> +		 */
> > >> +		return 0;
> > >> +
> > >> +	guard(spinlock_irqsave)(&bchan->vc.lock);
> > >> +
> > >> +	bchan->scratchpad_addr = metadata->scratchpad_addr;
> > >> +	bchan->direction = metadata->direction;
> > >> +
> > >> +	return 0;
> > >> +}
> > >> +
> > >> +static const struct dma_descriptor_metadata_ops bam_metadata_ops = {
> > >> +	.attach = bam_metadata_attach,
> > >> +};
> > >
> > > I'm not sure if we have discussed this before, but could we avoid
> > > re-programming the scratchpad_addr all the time by placing it into
> > > struct dma_slave_config -> peripheral_config? It still feels awkward to
> > > me to place a global constant configuration value into per-descriptor
> > > metadata.
> 
> The concept is that a dmaengine can handle multiple peripherals, so the
> peripheral is always per desciptor
> 
> > Yes, this was discussed several versions ago. I went with using
> > dmaengine_slave_config() until v11. I think Vinod or Dmitry requested we change
> > it to the metadata.
> 
> metadata seems better fit for this.
> 

Modelling this as descriptor metadata is really misleading. You call
dmaengine_desc_attach_metadata() on a specific descriptor, but then the
bam_metadata_attach() above just writes it globally into

desc->chan (struct dma_chan) -> to_bam_chan() (struct bam_chan)
-> bchan->scratchpad_addr

The descriptor that you pass in is completely unused. If you call this
on a different descriptor later with a different value, it will just
change the global configuration for the previous descriptor as well (if
they are submitted together). It will always be like this, since it's
the entire channel (and descriptor sequence) that is locked and not an
individual descriptor.

dmaengine_slave_config() operates directly on the struct dma_chan, so it
is IMO the right place to add this. That makes it clear that this
configures something for the entire channel.

I don't think that breaks support for multiple peripherals connected to
a single BAM (dmaengine). A BAM pipe (channel) should always belong to a
single peripheral. And even if it belongs to multiple peripherals, we
still need a single "scratchpad_addr" to use for the lock/unlock
sequence.

I would avoid using struct dma_slave_config->dst_addr (like in v11) [1]
though, since it's more a "address to dummy register" now than the
actual dst_addr of the peripheral. That's why I suggested
struct dma_slave_config->peripheral_config.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20260302-qcom-qce-cmd-descr-v11-7-4bf1f5db4802@oss.qualcomm.com/

