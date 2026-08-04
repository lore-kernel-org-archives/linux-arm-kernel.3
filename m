Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59E1C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wyjvMKvhAcJreTXfeaRljIo44c1fS4JMWl0lopeTOU=; b=bFm8V+zwSFxNAhADf3o9D8OWRU
	LJbY3Nxu/MtU4KV9U2XUG/IJaifpUCALzBXabyiO8hVBdASc6uDllctnYpQn9QBSLu+Qlg28p7Q5f
	3q754O33PridfVAp05uwtSeTFXU8ejZvU5QePFK8cwKwiqQZTle6cYmOy/Uo/NxKN9gcpaXFa1cvq
	QQIObB9QjFj4UhZuoMPrEPbn11zOw2+TzFIHkIlaFlt9Rx79RgvKYjbo4g1iwzNqd5tk+Onfprxuk
	y/BbLnkWoB438W0kGurJxEmgJdX9xVrcM+QhaHes0e1LqJns7wCZzO7RRIJLCxPKyY9gBUOQXw7jz
	IxYi2HrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrF9T-00000001vB9-1xTA;
	Tue, 04 Aug 2026 13:25:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrF9S-00000001vAw-0JOk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:25:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B1A8404D2;
	Tue,  4 Aug 2026 13:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294781F000E9;
	Tue,  4 Aug 2026 13:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785849949;
	bh=4wyjvMKvhAcJreTXfeaRljIo44c1fS4JMWl0lopeTOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FmqZl9Fol+ZLScWCrNFkjh56XTMy2ufbmJSsdKBe8HXMYmw4W/XP4gDcaraS3Fv7G
	 usGqat3c/TjgPagCirQz4DeFr87nERBj4itU7pslemBxvRqyrpMPe6TmGZJI2ryYbo
	 u9+s/rJV1wTDhj3ItK1GHaor0geHno0bouLKxgwOhZeCVdiDeTeN98Vu6zlXIoMyr3
	 qElG0HcmBzxIsQyLDOwW5wt3XvrIzlRvGCyOoOL77+tffknud+j+i+bq7CYGOVO3ps
	 jJMFKb209Vxipz+keGOXjrcbotLhHmdWO4NnSfyraIqWfruwDNaLxgCVpcD43KOg34
	 8Hp4hCRzTe0fQ==
Date: Tue, 4 Aug 2026 14:25:42 +0100
From: Will Deacon <will@kernel.org>
To: Kameron Carr <kameroncarr@linux.microsoft.com>, aneesh.kumar@kernel.org
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, longli@microsoft.com, mhklinux@outlook.com,
	catalin.marinas@arm.com, mark.rutland@arm.com,
	lpieralisi@kernel.org, sudeep.holla@kernel.org, arnd@arndb.de,
	thuth@redhat.com, linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v3 1/6] arm64: rsi: Add RSI host call structure and
 helper function
Message-ID: <anHoVr_PRkBHRGu3@willie-the-truck>
References: <20260721201148.1441143-1-kameroncarr@linux.microsoft.com>
 <20260721201148.1441143-2-kameroncarr@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721201148.1441143-2-kameroncarr@linux.microsoft.com>
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

On Tue, Jul 21, 2026 at 01:11:43PM -0700, Kameron Carr wrote:
> Add struct rsi_host_call to rsi_smc.h, which represents the host call
> data structure used by the Realm Management Monitor (RMM) for the
> RSI_HOST_CALL interface. The structure contains a 16-bit immediate field
> and 31 general-purpose register values, aligned to 256 bytes as required
> by the CCA RMM specification.
> 
> Add rsi_host_call() static inline wrapper in rsi_cmds.h that invokes
> SMC_RSI_HOST_CALL with the physical address of the host call structure.
> This will be used by Hyper-V guest code to route hypercalls through the
> RSI interface when running inside an Arm CCA Realm.
> 
> Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
> ---
>  arch/arm64/include/asm/rsi_cmds.h | 22 ++++++++++++++++++++++
>  arch/arm64/include/asm/rsi_smc.h  |  7 +++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/rsi_cmds.h b/arch/arm64/include/asm/rsi_cmds.h
> index 2c8763876dfb7..9daf8008e5da2 100644
> --- a/arch/arm64/include/asm/rsi_cmds.h
> +++ b/arch/arm64/include/asm/rsi_cmds.h
> @@ -88,6 +88,28 @@ static inline long rsi_set_addr_range_state(phys_addr_t start,
>  	return res.a0;
>  }
>  
> +/**
> + * rsi_host_call - Make a Host call.
> + * @host_call_struct: IPA of host call structure
> + *
> + * This call will fail if the IPA of the host call structure:
> + * * is not aligned to 256 bytes,
> + * * is not protected / encrypted,
> + * * is RIPAS_EMPTY
> + *
> + * Returns:
> + *  On success, returns RSI_SUCCESS.
> + *  Otherwise, returns an error code.
> + */
> +static inline unsigned long rsi_host_call(phys_addr_t host_call_struct)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(SMC_RSI_HOST_CALL, host_call_struct, 0, 0, 0, 0, 0, 0,
> +		      &res);
> +	return res.a0;
> +}

As I've mentioned to Aneesh on two occasions already [1][2], this code
should be moved out of arch/arm64 before we add anything else to it.

Thanks,

Will

[1] https://lore.kernel.org/r/agsNO9cc7H-b0H8L@willie-the-truck
[2] https://lore.kernel.org/r/al_svOwkb5SleTWg@willie-the-truck

