Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C5CC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OU1UYYzgK2OnsQUDtZlUXsO0y8vH10YtQbu83GhdYec=; b=jOjiRavXnDDd+N6eXfPbMwEcvB
	UIIkJJnRtcZKQgNR3JXracJCA0CXRw4XUn4ebflAJkPzzrb9f1ROStXTYVOKRPAQhzwQ9YElrligy
	2hyn6fxW13sICCk9mlP7YGp9YSYBn1zXB2vB3CjdVvocuh7ZKxPbtfvVHMUPhPUV/oN48u+gFEoqi
	+Oakw8VZAz+9V1qtwFDB3ZBJK5nSNiw0tMebSVan9aRw88a8JXhWnMN03EQBKplU7opTTmM0a09Io
	+Nnya4v8wg2qzhI3LFBXEfxQYvrZv132pO3FWhEruSMjqGsGR+gBCj07nXmkb3AXURtyKeGPHAXIF
	GyeVKTCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojMU-00000005aWQ-1MXy;
	Tue, 28 Jul 2026 15:04:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojMT-00000005aWG-2Vh2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:04:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D6AC660A89;
	Tue, 28 Jul 2026 15:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DEAC1F000E9;
	Tue, 28 Jul 2026 15:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785251092;
	bh=OU1UYYzgK2OnsQUDtZlUXsO0y8vH10YtQbu83GhdYec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dwgtnfnnoetGxkNWCraCuFJ0wy+gNQtppjs7e8vtB01nHBGxtOI89/oujAOaFFNKH
	 jvj2iF6k5jRwlfpUOAWiuAQW7dG5Vm47p0oimg4Hj6BZtfH4LxJUFsokUoRQoAz3YY
	 YAV+nV0QpSQ+y0hOIKnrs84dt69Q5ToRmidWF6mI5wq+Z+njqSOf5CmrAwpAoBR1VK
	 H8GriH7jHWyXl8ENgHcHnXy3S7S699/hhbK3lfJ3ReGcyYEbyusxJdynD9TZ4ZbftI
	 4N1L2rxWH+7R0HHWPByIkeDzP/EMDHIzLih2wWCQs0yE6eh11axrQs3DKKgmoJZF0K
	 tsBoySQX2Pf7g==
Date: Tue, 28 Jul 2026 17:04:48 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jonas Gorski <jonas.gorski@bisdn.de>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Kevin Cernekee <cernekee@chromium.org>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: iproc: reset bus after timeout if START_BUSY is
 stuck
Message-ID: <amjDbiXiq6Rse0Ir@zenone.zhora.eu>
References: <20260717085507.34209-1-jonas.gorski@bisdn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717085507.34209-1-jonas.gorski@bisdn.de>
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

Hi Jonas,

...

> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index b5629cffe99b..86ca4c2221c4 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -803,6 +803,17 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_iproc_i2c_dev *iproc_i2c,
>  	}
>  
>  	if (!time_left && !iproc_i2c->xfer_is_done) {
> +		/*
> +		 * The controller may fail to clear START_BUSY after a timeout,
> +		 * reset the controller to recover in that case.
> +		 */
> +		if (!!(iproc_i2c_rd_reg(iproc_i2c, M_CMD_OFFSET) &
> +		       BIT(M_CMD_START_BUSY_SHIFT))) {
> +			bcm_iproc_i2c_enable_disable(iproc_i2c, false);
> +			bcm_iproc_i2c_init(iproc_i2c);
> +			bcm_iproc_i2c_enable_disable(iproc_i2c, true);
> +		}
> +
>  		/* flush both TX/RX FIFOs */
>  		val = BIT(M_FIFO_RX_FLUSH_SHIFT) | BIT(M_FIFO_TX_FLUSH_SHIFT);
>  		iproc_i2c_wr_reg(iproc_i2c, M_FIFO_CTRL_OFFSET, val);

the patch makes sense to me, but can I have an ack from the
Broadcom folks? Ray? Scott?

Thanks,
Andi

