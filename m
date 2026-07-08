Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B605C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ulKrnpD8tXDSCpSxwsbsqYNUR8mY4krEK4ViHq+duU=; b=l+XvaFOzHnQa0AOjdyKouJOYbo
	6SuxWni/lOA3Ms4oAg1K3UZ8QlT4gedL1vKpctQYQEBQc53Pn9d7nFT7+U5NMJmb06MuRXWIgTQQS
	9S8Y1bvnlviY8ps3h9Djm8KutrxQuJCyqiHcqJkR/HloAmP9ReKrZFynF9Tj4NS+5eyqfgZ8DWnXX
	FR2k/HJdQKu+ulDEJxFUZYjY9jBTrJv1DV7v+BdQ7e82zOZaSVD4miid6HwFQWUOZjRYdZVmYIAA5
	2Hgz/JuEmqqZ947c0G/ORk2KALAmHuJmhUgIGrRELVkCAoBnE924khnr6Dl5+HddRCl6tXDDv3rJQ
	SDv/XLQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRE1-0000000H6EP-3lMN;
	Wed, 08 Jul 2026 12:18:01 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRDy-0000000H6CJ-2NFa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 12:18:01 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4720d22c94aso580410f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783513076; x=1784117876; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ulKrnpD8tXDSCpSxwsbsqYNUR8mY4krEK4ViHq+duU=;
        b=NC6goHplFrR3hGQraPXbE/xV/pjQFGEgWFz6Yk0V0BvLf8FAzuq+0CiKw1QllWgpkz
         WuNyukXJe0jYvMyCq0vsKyzVPzzG/A1dGL/cFa3JU+7efqEu4eI+HD3IsEKrcQZ2o334
         iiGbSG8cfFbH5mUbQV9mXnT3MpXnOXFWl6vBb3TEG7kFA4JbiU6FqPFSNvnnH+44WCJ8
         pghOd9FTHRKQNxBtvLGdn5SHL1PS9GcSiSKaRzOz8Nv7zMVGi4W/wqM0auyyY7tRWG7S
         5ZGOviFRmPoj7nN9wkEIUh/eCiYcBkMa1CJ6sUTA+r8aqq/X3iMjxq/phpX+z+9DZOhX
         82qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513076; x=1784117876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ulKrnpD8tXDSCpSxwsbsqYNUR8mY4krEK4ViHq+duU=;
        b=TDl8y+7QgwKi95+xdiNXCOcuBH/aY8EzPDmRTR7Uf0NEMxaGX8llzfAWb/5xg+iXm9
         7qthRquiUUcIWSBrAyjHvItEt7gWeq+H5RPUb8VrlJ51OXgxPraZCGMKpIMecBM1NvIw
         Nz/pVJ7Sgm5+q1JCFB6HbD4potLPpSwcLAq50eX6x132p6OL8IeENbl57Nh5paJgKOQG
         PPvNHpNJ///IDAcLCXT9XLRAvD8Of9hpg5pmeUX4ZMDq+PJurt2JmSwq+RIFB1LZPrD0
         4wfNeT+zPf/mqHAW+GxnUZluA31o789GnRTbOjDyYy3rZ6El6lEqGNuHidXddWYBu37x
         9ApQ==
X-Forwarded-Encrypted: i=1; AHgh+RqM9EIrtdI7LjP5GZPzhRn7dqTlcloTpiJZycptr/VIQqrl8WqTYdLUltyKQIWCGKRIBdt8Ifg6HeCH1QXTXWkf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4kMpfDtwn5hF2IxO6waGF2Kk8B6vetF/KZOOG0lube6/7rrAw
	S7ZfY6u9Mz0ghAXZw9ydNRr1hwkA+of8/+vsFDsJg3+OKrwn9latTwGM6f9axIy5D0Q=
X-Gm-Gg: AfdE7cm5ViGGh1ExjO/2B0uNGsWWUqjRZx6A18vdDDq9K/yHR1dV8h9t8r2boYahSNI
	bAzuULDO7bpjXsMkqpaGWYbouPIoedms71sAxlx6SSLr+zqpWtV8Dqfwu1VnXASnGjEoAMfsazb
	U8R5vg+Tyq4kuhh1RC3sqfqrkA5Ymv4QeOg8qwTW+GVcQxxRrVMbsnVsv1BE1jH8HTrDCK4TVLj
	loB83MK2GuOiPETsNyC6CMxF7G/N7tNyPXKd53bZAAImM13QcEo3XcN8wfxWG/CJH1TuMnCvyBj
	J0oHi3nbEFzPGxMITrIYzzklqArP+S4brmHjvTVxGnQCa4p81Uyseu5vBI6dod82XcQldJJYlMb
	duHjl9CvM0bkkYT4tVaKLnLRWoyFYAW/yxwsbqNWNpk7dgoVX7thkhfzi7U53bSE4jJbjX2BHEy
	1ZCzXHQIWtSNgT8dLJ3HYICJUi
X-Received: by 2002:a05:6000:40cc:b0:47d:ede0:f8ff with SMTP id ffacd0b85a97d-47df073b1a4mr2646073f8f.9.1783513076033;
        Wed, 08 Jul 2026 05:17:56 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:28ff:335b:63e2:fdd2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm45642623f8f.37.2026.07.08.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:17:55 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:17:51 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
	brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v20 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <ak4_vsdef9MJd1Yv@linaro.org>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
 <20260629-qcom-qce-cmd-descr-v20-6-56f67da84c05@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-6-56f67da84c05@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_051758_658706_2B2AF48D 
X-CRM114-Status: GOOD (  33.93  )
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

On Mon, Jun 29, 2026 at 12:01:08PM +0200, Bartosz Golaszewski wrote:
> Add support for BAM pipe locking. To that end: when starting DMA on an RX
> channel - prepend the existing queue of issued descriptors with an
> additional "dummy" command descriptor with the LOCK bit set. Once the
> transaction is done (no more issued descriptors), issue one more dummy
> descriptor with the UNLOCK bit.
> 
> We *must* wait until the transaction is signalled as done because we
> must not perform any writes into config registers while the engine is
> busy.
> 
> The dummy writes must be issued into a scratchpad register of the client
> so provide a mechanism to communicate the right address via descriptor
> metadata.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

I finally found the time to try this for the qcom_nandc driver on
MDM9607 (with scratchpad_addr = nandc->base_phys + NAND_VERSION). It
seems to work fine and my initial impression is that it does solve the
crashes/corruption when both Linux and the modem access the NAND in
parallel. (Hard to reproduce, needs a bit more testing.) Thanks!

It feels a bit awkward to call dmaengine_desc_attach_metadata() with the
same scratchpad_addr for every descriptor (especially because you store
it globally), but I also don't really have a better idea how to pass the
address for the dummy register.

> ---
>  drivers/dma/qcom/bam_dma.c       | 189 +++++++++++++++++++++++++++++++++++++--
>  include/linux/dma/qcom_bam_dma.h |  14 +++
>  2 files changed, 196 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index f3e713a5259c2c7c24cfdcec094814eb1202971a..f4f258994264a234f60debd3e66e31a6b35d1dc5 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> [...]
> @@ -919,13 +977,23 @@ static u32 process_channel_irqs(struct bam_device *bdev)
>  			 * push back to front of desc_issued so that
>  			 * it gets restarted by the work queue.
>  			 */
> +
> +			list_del(&async_desc->desc_node);
>  			if (!async_desc->num_desc) {
> -				vchan_cookie_complete(&async_desc->vd);
> +				struct bam_desc_hw *hdesc = async_desc->desc;
> +				u16 flags = le16_to_cpu(hdesc->flags);
> +
> +				if (flags & (DESC_FLAG_LOCK | DESC_FLAG_UNLOCK)) {
> +					if (flags & DESC_FLAG_UNLOCK)
> +						bchan->bam_locked = false;
> +					bam_dma_free_lock_desc(&async_desc->vd);
> +				} else {
> +					vchan_cookie_complete(&async_desc->vd);
> +				}
>  			} else {
>  				list_add(&async_desc->vd.node,
>  					 &bchan->vc.desc_issued);
>  			}
> -			list_del(&async_desc->desc_node);
>  		}
>  	}
>  
> [...]
> @@ -1064,9 +1220,23 @@ static void bam_start_dma(struct bam_chan *bchan)
>  
>  	lockdep_assert_held(&bchan->vc.lock);
>  
> +	vd = vchan_next_desc(&bchan->vc);
>  	if (!vd)
>  		return;
>  
> +	/*
> +	 * Wrap the issued work with a LOCK/UNLOCK pair exactly once, at the
> +	 * start of a fresh sequence and only when there is real work to lock
> +	 * around. On a re-entry after a full FIFO, we see the BAM is locked
> +	 * and must not add another pair we simply continue loading the
> +	 * remainder of the same locked sequence.
> +	 */
> +	if (!bchan->bam_locked) {
> +		ret = bam_setup_pipe_lock(bchan);
> +		if (ret == 0 && bchan->bam_locked)
> +			vd = vchan_next_desc(&bchan->vc);
> +	}

I *suspect* though that Sashiko is right about the new race condition
here if new descriptors are queued while the hardware is busy processing
a locked sequence.

https://sashiko.dev/#/patchset/20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05%40oss.qualcomm.com?part=6

Any idea how to fix this?

Thanks,
Stephan

