Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F25C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 14:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEEkoiFhJTTNltysI4HnUNrjjey/OwLRpiIq5KPrSIs=; b=fMd/XR8bqq75cMlMgduQXXEyzH
	hSlvLePd5F/x8JsbFZiZv3uT9BOHruFyIoO8/KizLsb/i05XPrJZBKrFRG4QAQG8BUzHxsPSDoaKA
	mDaXmLx1kYzFfmBH8KTxmqcoZfc4vRq3eymyPa3h71tIUqNIaDMrA7MVSdCQz/wYDkSu9GKkVM53u
	hGXFqJY7DQ45VmKvwkOG9vjssznemvZYUmZ+kI4Hj8Br7Mx8BZA3vQF2NLGBUExKTY83jpLElBjaE
	YdmFC5yQ5eSMh7Ad0sQWNDdOE2AM+CWTurlCBWGbl7AclxtUm+vT+15zLFFyyCHzq7CWNkej+YAOW
	XlvV3y6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuQk-00000009DEz-1LR2;
	Wed, 19 Mar 2025 14:30:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuNP-00000009Cg6-46LN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 14:26:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E07B0FEC;
	Wed, 19 Mar 2025 07:26:42 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B0373F673;
	Wed, 19 Mar 2025 07:26:31 -0700 (PDT)
Date: Wed, 19 Mar 2025 14:26:26 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	acme@kernel.org, namhyung@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	broonie@kernel.org, yury.khrustalev@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64/gcs: task_gcs_el0_enable() should use passed
 task
Message-ID: <Z9rUEtZtNXhVnarO@J2N7QTR9R3>
References: <20250318204841.373116-1-jeremy.linton@arm.com>
 <20250318204841.373116-2-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318204841.373116-2-jeremy.linton@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_072636_057425_C6674CC8 
X-CRM114-Status: GOOD (  18.95  )
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

On Tue, Mar 18, 2025 at 03:48:35PM -0500, Jeremy Linton wrote:
> Mark Rutland noticed that the task parameter is ignored and
> 'current' is being used instead. Since this is usually
> what its passed, it hasn't yet been causing problems but likely
> will as the code gets more testing.

Are we sure nothing is relying upon the bug?

For example, in copy_thread_gcs():

copy_thread_gcs(p, ...) {
	...
	gcs = gcs_alloc_thread_stack(p, ...) {
		...
		if (!task_gcs_el0_enabled(p))
			return 0;
		...
		< actually allocate here >
	}
	...
	p->thread.gcs_el0_mode = current->thread.gcs_el0_mode;
	...
}

Either that later assignment is redundant, or copy_thread_gcs() was
accidentally relying upon task_gcs_el0_enabled() reading from 'current'
rather than 'p', and this change opens up another bug...

Mark.

> 
> Fixes: fc84bc5378a8 ("arm64/gcs: Context switch GCS state for EL0")
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> ---
>  arch/arm64/include/asm/gcs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
> index f50660603ecf..5bc432234d3a 100644
> --- a/arch/arm64/include/asm/gcs.h
> +++ b/arch/arm64/include/asm/gcs.h
> @@ -58,7 +58,7 @@ static inline u64 gcsss2(void)
>  
>  static inline bool task_gcs_el0_enabled(struct task_struct *task)
>  {
> -	return current->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE;
> +	return task->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE;
>  }
>  
>  void gcs_set_el0_mode(struct task_struct *task);
> -- 
> 2.48.1
> 

