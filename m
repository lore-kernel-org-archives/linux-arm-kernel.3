Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE7DD6ACF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kf2W34FmVqhav9Kb3EBbbg9M3oEUNfw7cJUk9rYjbjI=; b=FMYPhG93K+bK56gkp9lOUa+C4I
	W56JXEfpSuJRyoFxoqfZFK0myD4U3wz14I721cckW/mlPCO1rAfpSrSLUme+KKtTcrsNITQPXVrWX
	Aciypms+W8sg0fXojP9+8uwOW4A4LcdDRH83IaqO6q/iNh76wHs4MrwnCC+b1MxF6QQMtRB+AGb5L
	YcszyUlSNd06ufYIkjLVrXqJnxauKT9C2i/MQlkq0E00Ft6Oqg60eWAdmg10OAmq52oxx+mxI92eS
	6iJZip9Uoz6skFh8vLzGCxYKiaHmiOhld+JwkJRU1HfEdTLqZcbTKslDYgFQndrViCi1G89MmKeQ3
	zDVvgJpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLYE-0000000DiyE-2Rw7;
	Wed, 27 Nov 2024 17:10:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLXF-0000000Diu9-3xoA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 17:09:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6AB175C4EED;
	Wed, 27 Nov 2024 17:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D015C4CECC;
	Wed, 27 Nov 2024 17:09:02 +0000 (UTC)
Date: Wed, 27 Nov 2024 12:09:54 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, bigeasy@linutronix.de,
 clrkwllms@kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, nd@arm.com
Subject: Re: [PATCH 1/9] coresight: change coresight_device lock type to
 raw_spinlock_t
Message-ID: <20241127120954.0facd34f@gandalf.local.home>
In-Reply-To: <20241125094816.365472-2-yeoreum.yun@arm.com>
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
	<20241125094816.365472-2-yeoreum.yun@arm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_090906_030947_2F79FE66 
X-CRM114-Status: GOOD (  12.28  )
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

On Mon, 25 Nov 2024 09:48:08 +0000
Yeoreum Yun <yeoreum.yun@arm.com> wrote:

> @@ -853,17 +851,14 @@ EXPORT_SYMBOL_GPL(cscfg_unregister_csdev);
>  void cscfg_csdev_reset_feats(struct coresight_device *csdev)
>  {
>  	struct cscfg_feature_csdev *feat_csdev;
> -	unsigned long flags;
>  
> -	spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> +	guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
> +
>  	if (list_empty(&csdev->feature_csdev_list))
> -		goto unlock_exit;
> +		return;
>  
>  	list_for_each_entry(feat_csdev, &csdev->feature_csdev_list, node)
>  		cscfg_reset_feat(feat_csdev);

We should start documenting what is not real-time "safe". That is, if this
code is executed, we have a loop here that holds a raw spin lock. This
appears to make the time the raw spin lock held to be non deterministic.

If someone is running PREEMPT_RT and expects deterministic behavior, they
cannot be using this code. That is fine, but we should probably create a
document somewhere that notes this.

-- Steve


> -
> -unlock_exit:
> -	spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>  }
>  EXPORT_SYMBOL_GPL(cscfg_csdev_reset_feats);
>  

