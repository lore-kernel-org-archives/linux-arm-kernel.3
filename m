Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE062C53209
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 00:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZoYewpWj+bSF/26xO4yzFQiIfC/mpZ1c8B1kszJ0Mw=; b=RsILgOWUCCj/ufOa2aIrV5aBnS
	UB2qIq05GOSvG+VBpTgOEZ3Gpa1mJR9oDFRrqAA5aq3fZ1aw/pAX7UqjmeYC4FtntDeyZTxoMhPCO
	DipqBh7s+fxECPVQxG5c/F38fFDh/cekuC+aiYHHAmiMzzAkAVsqIqCEg7uQmqyu1lboApSimnPOz
	39OivnG5JVehgJjKDEepbsD+dWtMrb6qb3PjQqWkBU0+qKesbiQVavB3JkX030w/DRCD0CPdDJheL
	RWoraIRUgCz/BuHfs87KMyYMgPrjA4Qpj/J2uzIHfzV1KwjwlaE9qBSZVt/q3pfs/pizyVMuFxYZO
	O/VNDygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woVF0-0000000477H-3YyP;
	Tue, 28 Jul 2026 00:00:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woVEz-0000000477A-33cM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 00:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D11841075;
	Tue, 28 Jul 2026 00:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3A11F000E9;
	Tue, 28 Jul 2026 00:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785196812;
	bh=OZoYewpWj+bSF/26xO4yzFQiIfC/mpZ1c8B1kszJ0Mw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Y0Y0iyM/wY+nw2B1SYNpW2uJ4/n6N0fedtveDy9IMrtD7VamdcX9/xxVgCh4eJQdj
	 x8noIqbRuFgsFiTun6NSgVqB3HqkRBQl0wPzhA22fay2oLI/TA82cSnR7Uk9odX478
	 VXXRd33gm+xvE/mW8vQcoJLpi1ktvmY9hCNf6cXcXrs+mR1C4Ib2IJ/Xe6imku7aJi
	 aRmz0gd0xUieuJSmT47m7XHXOXFPqe4CX4Ht1ebtzzr5tDcZjvb0LL29F4apw6D/WS
	 SwvPZ3wu8Auri4O2zdq4QPY5aunKswDCi0ncpx6vGnhSweHxrrKLtykmzW+85uOFKF
	 U1qtGgUSwQPxQ==
Date: Tue, 28 Jul 2026 01:00:04 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, sudeep.holla@kernel.org,
 james.quinlan@broadcom.com, f.fainelli@gmail.com,
 vincent.guittot@linaro.org, etienne.carriere@st.com, peng.fan@oss.nxp.com,
 michal.simek@amd.com, d-gole@ti.com, elif.topuz@arm.com,
 lukasz.luba@arm.com, philip.radford@arm.com, brauner@kernel.org,
 souvik.chakravarty@arm.com, david@kernel.org,
 subrahmanya.lingappa@oss.qualcomm.com, leitao@kernel.org, kas@kernel.org,
 puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v6 03/22] firmware: arm_scmi: Introduce protocol
 instance notifiers
Message-ID: <20260728010004.35fcac96@jic23-huawei>
In-Reply-To: <20260724144430.1440170-4-cristian.marussi@arm.com>
References: <20260724144430.1440170-1-cristian.marussi@arm.com>
	<20260724144430.1440170-4-cristian.marussi@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 24 Jul 2026 15:44:11 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Allow protocols themselves to register for their own notifications and
> provide their own notifier callbacks. Each protocol can now register one
> unique per-protocol instance notifier block whose callback will be
> registered on the proper notification chain as usual: such notifier will
> be automatically removed during the protocol de-initialiazation phase.
> 

Would be nice to say why they might do this. I'm sure it becomes
apparent later in the series, but anyone looking just this patch
is missing that useful information.

I'd also like something here to talk briefly about why it is fine to
drop the lock briefly on the unregister side.

> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>


> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 8e06e40d1a11..0f9e8dfc6137 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
...


> @@ -2367,13 +2402,29 @@ int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id)
>  void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
>  {
>  	struct scmi_info *info = handle_to_scmi_info(handle);
> +	struct notifier_block *proto_notifier_nb = NULL;
>  	struct scmi_protocol_instance *pi;
>  
> -	mutex_lock(&info->protocols_mtx);
> -	pi = idr_find(&info->protocols, protocol_id);
> -	if (WARN_ON(!pi))
> -		goto out;
> +	scoped_guard(mutex, &info->protocols_mtx) {
> +		pi = idr_find(&info->protocols, protocol_id);
> +		if (WARN_ON(!pi))
> +			return;
> +
> +		proto_notifier_nb = pi->pno.nb;
> +		/* Ensure NULL is visible */
> +		smp_store_mb(pi->pno.nb, NULL);
> +	}
>  

I'd like to see a little commentary on safety of not holding
the mutex over the whole sequence.  Can anything mess around
with pi between the code getting hold of it and the release below?
I assume the refcount is enough.

> +	if (proto_notifier_nb) {
> +		int ret;
> +
> +		ret = scmi_protocol_notifier_unregister(pi->handle, &pi->pno);
> +		if (ret)

Maybe this changes later but if not get rid of ret. It kind of suggests
the value itself is useful in a way that isn't true.

		if (scm_protocol_notifier_unregister(pi->handle, &pi->pno))
			dev_err();

> +			dev_err(handle->dev,
> +				"Failed to release protocol notifier\n");
> +	}
> +
> +	guard(mutex)(&info->protocols_mtx);
>  	if (refcount_dec_and_test(&pi->users)) {
>  		void *gid = pi->gid;
>  
> @@ -2391,9 +2442,6 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
>  		dev_dbg(handle->dev, "De-Initialized protocol: 0x%X\n",
>  			protocol_id);
>  	}
> -
> -out:
> -	mutex_unlock(&info->protocols_mtx);
>  }
>  


