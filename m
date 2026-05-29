Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E79CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uo3Lj6en5uJFwNsoGFoFrZluPF7HDMxmD9kpI0nqTIE=; b=dmvX2VBgjGS3pbEEC22N8BlwcK
	AVNHwUgkybKP8YTJh1BweATJ7z1OtwkAEcLBRlWVZua41A9d5+aiP88dSGxDX3NrBYX2SZjdtK6cY
	XppiEiKVL10xhoYkBTnLglHo0H/Az7spTy4EfhwwvCWf5qcA3X8PxJwKRKEMUpySFtiv3z0Yd7Ag0
	bXrAfR+wJzvC+/k9XQxSZI5oVWTeBjFbbmMtzsKUXD/PZFVx3GuNVYU3b2DKwMhHuggbo+JwEK3AH
	78zaGUbRT6X//R2Q8R00JaP2jmTv2a1jyuGOmmI/pyh7GvNwb/crj9xMR4TbfC3IfqJ+F3wgVCpbl
	QHl6bOXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzt0-00000007rT9-2fvU;
	Fri, 29 May 2026 16:16:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzsz-00000007rT3-0GbB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:16:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 74A4D605CF;
	Fri, 29 May 2026 16:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEAE1F00898;
	Fri, 29 May 2026 16:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780071396;
	bh=Uo3Lj6en5uJFwNsoGFoFrZluPF7HDMxmD9kpI0nqTIE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HCpooG0gwWBsjDrMl/d8yDPOqD936gfXTRkXK4hjnGqSRYlorbU2+R/k/sZCBQqzz
	 Kd3kQpeh2KzcTx92eVnBd0N+5gFEQ86R1z/BnSfv2NIyT2HnLH8sinhP+Cx2h64OaM
	 WX30yNNlUkZRO1IG1ErpoT5c9XpcwEclSaVB1aWGyca0enN9DYH8iT3aI+qk8yngEv
	 HHKVdPZeH3x83lsKta5fesz+Vc/uatnFtfiCRvnVoPTPJS2tEBISEEuuadwpZOfdc0
	 RIPWVMWcnlxR3fiKd6s9SjQza0UAZpAaWuPuKf+SfhXVsJClU0aL+zBBp9NDbJ59QM
	 JlQmJY5vlaGZg==
Date: Fri, 29 May 2026 17:16:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: will@kernel.org, xueshuai@linux.alibaba.com, saket.dumbre@intel.com,
 mchehab@kernel.org, dave@stgolabs.net, djbw@kernel.org, bp@alien8.de,
 tony.luck@intel.com, guohanjun@huawei.com, lenb@kernel.org,
 skhan@linuxfoundation.org, vishal.l.verma@intel.com, rafael@kernel.org,
 corbet@lwn.net, ira.weiny@intel.com, dave.jiang@intel.com,
 krzk+dt@kernel.org, robh@kernel.org, catalin.marinas@arm.com,
 alison.schofield@intel.com, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, Michael.Zhao2@arm.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-cxl@vger.kernel.org, Dmitry.Lamerov@arm.com,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev, Terry Bowman
 <terry.bowman@amd.com>
Subject: Re: [PATCH v5 06/10] ACPI: APEI: GHES: move CXL CPER helpers
Message-ID: <20260529171619.78f914bb@jic23-huawei>
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-6-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
	<20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-6-2e0500d42642@arm.com>
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

On Fri, 29 May 2026 10:50:46 +0100
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Move the CXL CPER handling paths out of ghes.c and into ghes_cper.c so the
> helpers can be reused. The code is moved as-is, with the public
> prototypes updated so GHES keeps calling into the new translation unit.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
This is going to clash with the series Terry is working on for CXL error handling.
I think this patch in particular:
https://lore.kernel.org/all/20260505173029.2718246-6-terry.bowman@amd.com/

That series is high priority to land from a CXL point of view. +CC Terry

Subject to that,
Reviewed-by: Jonathan Cameron <jic23@kernel.org>

Patch left so Terry can see it. No comments.

> ---
>  drivers/acpi/apei/ghes.c      | 132 -----------------------------------------
>  drivers/acpi/apei/ghes_cper.c | 134 ++++++++++++++++++++++++++++++++++++++++++
>  include/acpi/ghes_cper.h      |  11 ++++
>  3 files changed, 145 insertions(+), 132 deletions(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index 81ac51632f21..85be2ebf4d3e 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -383,69 +383,6 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
>  #endif
>  }
>  
> -/* Room for 8 entries */
> -#define CXL_CPER_PROT_ERR_FIFO_DEPTH 8
> -static DEFINE_KFIFO(cxl_cper_prot_err_fifo, struct cxl_cper_prot_err_work_data,
> -		    CXL_CPER_PROT_ERR_FIFO_DEPTH);
> -
> -/* Synchronize schedule_work() with cxl_cper_prot_err_work changes */
> -static DEFINE_SPINLOCK(cxl_cper_prot_err_work_lock);
> -struct work_struct *cxl_cper_prot_err_work;
> -
> -static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> -				   int severity)
> -{
> -#ifdef CONFIG_ACPI_APEI_PCIEAER
> -	struct cxl_cper_prot_err_work_data wd;
> -
> -	if (cxl_cper_sec_prot_err_valid(prot_err))
> -		return;
> -
> -	guard(spinlock_irqsave)(&cxl_cper_prot_err_work_lock);
> -
> -	if (!cxl_cper_prot_err_work)
> -		return;
> -
> -	if (cxl_cper_setup_prot_err_work_data(&wd, prot_err, severity))
> -		return;
> -
> -	if (!kfifo_put(&cxl_cper_prot_err_fifo, wd)) {
> -		pr_err_ratelimited("CXL CPER kfifo overflow\n");
> -		return;
> -	}
> -
> -	schedule_work(cxl_cper_prot_err_work);
> -#endif
> -}
> -
> -int cxl_cper_register_prot_err_work(struct work_struct *work)
> -{
> -	if (cxl_cper_prot_err_work)
> -		return -EINVAL;
> -
> -	guard(spinlock)(&cxl_cper_prot_err_work_lock);
> -	cxl_cper_prot_err_work = work;
> -	return 0;
> -}
> -EXPORT_SYMBOL_NS_GPL(cxl_cper_register_prot_err_work, "CXL");
> -
> -int cxl_cper_unregister_prot_err_work(struct work_struct *work)
> -{
> -	if (cxl_cper_prot_err_work != work)
> -		return -EINVAL;
> -
> -	guard(spinlock)(&cxl_cper_prot_err_work_lock);
> -	cxl_cper_prot_err_work = NULL;
> -	return 0;
> -}
> -EXPORT_SYMBOL_NS_GPL(cxl_cper_unregister_prot_err_work, "CXL");
> -
> -int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data *wd)
> -{
> -	return kfifo_get(&cxl_cper_prot_err_fifo, wd);
> -}
> -EXPORT_SYMBOL_NS_GPL(cxl_cper_prot_err_kfifo_get, "CXL");
> -
>  static void ghes_vendor_record_notifier_destroy(void *nb)
>  {
>  	ghes_unregister_vendor_record_notifier(nb);
> @@ -464,75 +401,6 @@ int devm_ghes_register_vendor_record_notifier(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_ghes_register_vendor_record_notifier);
>  
> -/* Room for 8 entries for each of the 4 event log queues */
> -#define CXL_CPER_FIFO_DEPTH 32
> -DEFINE_KFIFO(cxl_cper_fifo, struct cxl_cper_work_data, CXL_CPER_FIFO_DEPTH);
> -
> -/* Synchronize schedule_work() with cxl_cper_work changes */
> -static DEFINE_SPINLOCK(cxl_cper_work_lock);
> -struct work_struct *cxl_cper_work;
> -
> -static void cxl_cper_post_event(enum cxl_event_type event_type,
> -				struct cxl_cper_event_rec *rec)
> -{
> -	struct cxl_cper_work_data wd;
> -
> -	if (rec->hdr.length <= sizeof(rec->hdr) ||
> -	    rec->hdr.length > sizeof(*rec)) {
> -		pr_err(FW_WARN "CXL CPER Invalid section length (%u)\n",
> -		       rec->hdr.length);
> -		return;
> -	}
> -
> -	if (!(rec->hdr.validation_bits & CPER_CXL_COMP_EVENT_LOG_VALID)) {
> -		pr_err(FW_WARN "CXL CPER invalid event\n");
> -		return;
> -	}
> -
> -	guard(spinlock_irqsave)(&cxl_cper_work_lock);
> -
> -	if (!cxl_cper_work)
> -		return;
> -
> -	wd.event_type = event_type;
> -	memcpy(&wd.rec, rec, sizeof(wd.rec));
> -
> -	if (!kfifo_put(&cxl_cper_fifo, wd)) {
> -		pr_err_ratelimited("CXL CPER kfifo overflow\n");
> -		return;
> -	}
> -
> -	schedule_work(cxl_cper_work);
> -}
> -
> -int cxl_cper_register_work(struct work_struct *work)
> -{
> -	if (cxl_cper_work)
> -		return -EINVAL;
> -
> -	guard(spinlock)(&cxl_cper_work_lock);
> -	cxl_cper_work = work;
> -	return 0;
> -}
> -EXPORT_SYMBOL_NS_GPL(cxl_cper_register_work, "CXL");
> -
> -int cxl_cper_unregister_work(struct work_struct *work)
> -{
> -	if (cxl_cper_work != work)
> -		return -EINVAL;
> -
> -	guard(spinlock)(&cxl_cper_work_lock);
> -	cxl_cper_work = NULL;
> -	return 0;
> -}
> -EXPORT_SYMBOL_NS_GPL(cxl_cper_unregister_work, "CXL");
> -
> -int cxl_cper_kfifo_get(struct cxl_cper_work_data *wd)
> -{
> -	return kfifo_get(&cxl_cper_fifo, wd);
> -}
> -EXPORT_SYMBOL_NS_GPL(cxl_cper_kfifo_get, "CXL");
> -
>  static void ghes_log_hwerr(int sev, guid_t *sec_type)
>  {
>  	if (sev != CPER_SEV_RECOVERABLE)
> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
> index 131980d36064..d7a666a163c3 100644
> --- a/drivers/acpi/apei/ghes_cper.c
> +++ b/drivers/acpi/apei/ghes_cper.c
> @@ -12,10 +12,12 @@
>   *   Author: Huang Ying <ying.huang@intel.com>
>   */
>  
> +#include <linux/aer.h>
>  #include <linux/err.h>
>  #include <linux/genalloc.h>
>  #include <linux/irq_work.h>
>  #include <linux/io.h>
> +#include <linux/kfifo.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/math64.h>
> @@ -321,6 +323,138 @@ void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
>  	schedule_work(&entry->work);
>  }
>  
> +/* Room for 8 entries */
> +#define CXL_CPER_PROT_ERR_FIFO_DEPTH 8
> +static DEFINE_KFIFO(cxl_cper_prot_err_fifo, struct cxl_cper_prot_err_work_data,
> +		    CXL_CPER_PROT_ERR_FIFO_DEPTH);
> +
> +/* Synchronize schedule_work() with cxl_cper_prot_err_work changes */
> +static DEFINE_SPINLOCK(cxl_cper_prot_err_work_lock);
> +struct work_struct *cxl_cper_prot_err_work;
> +
> +void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> +			    int severity)
> +{
> +#ifdef CONFIG_ACPI_APEI_PCIEAER
> +	struct cxl_cper_prot_err_work_data wd;
> +
> +	if (cxl_cper_sec_prot_err_valid(prot_err))
> +		return;
> +
> +	guard(spinlock_irqsave)(&cxl_cper_prot_err_work_lock);
> +
> +	if (!cxl_cper_prot_err_work)
> +		return;
> +
> +	if (cxl_cper_setup_prot_err_work_data(&wd, prot_err, severity))
> +		return;
> +
> +	if (!kfifo_put(&cxl_cper_prot_err_fifo, wd)) {
> +		pr_err_ratelimited("CXL CPER kfifo overflow\n");
> +		return;
> +	}
> +
> +	schedule_work(cxl_cper_prot_err_work);
> +#endif
> +}
> +
> +int cxl_cper_register_prot_err_work(struct work_struct *work)
> +{
> +	if (cxl_cper_prot_err_work)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&cxl_cper_prot_err_work_lock);
> +	cxl_cper_prot_err_work = work;
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(cxl_cper_register_prot_err_work, "CXL");
> +
> +int cxl_cper_unregister_prot_err_work(struct work_struct *work)
> +{
> +	if (cxl_cper_prot_err_work != work)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&cxl_cper_prot_err_work_lock);
> +	cxl_cper_prot_err_work = NULL;
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(cxl_cper_unregister_prot_err_work, "CXL");
> +
> +int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data *wd)
> +{
> +	return kfifo_get(&cxl_cper_prot_err_fifo, wd);
> +}
> +EXPORT_SYMBOL_NS_GPL(cxl_cper_prot_err_kfifo_get, "CXL");
> +
> +/* Room for 8 entries for each of the 4 event log queues */
> +#define CXL_CPER_FIFO_DEPTH 32
> +static DEFINE_KFIFO(cxl_cper_fifo, struct cxl_cper_work_data, CXL_CPER_FIFO_DEPTH);
> +
> +/* Synchronize schedule_work() with cxl_cper_work changes */
> +static DEFINE_SPINLOCK(cxl_cper_work_lock);
> +struct work_struct *cxl_cper_work;
> +
> +void cxl_cper_post_event(enum cxl_event_type event_type,
> +			 struct cxl_cper_event_rec *rec)
> +{
> +	struct cxl_cper_work_data wd;
> +
> +	if (rec->hdr.length <= sizeof(rec->hdr) ||
> +	    rec->hdr.length > sizeof(*rec)) {
> +		pr_err(FW_WARN "CXL CPER Invalid section length (%u)\n",
> +		       rec->hdr.length);
> +		return;
> +	}
> +
> +	if (!(rec->hdr.validation_bits & CPER_CXL_COMP_EVENT_LOG_VALID)) {
> +		pr_err(FW_WARN "CXL CPER invalid event\n");
> +		return;
> +	}
> +
> +	guard(spinlock_irqsave)(&cxl_cper_work_lock);
> +
> +	if (!cxl_cper_work)
> +		return;
> +
> +	wd.event_type = event_type;
> +	memcpy(&wd.rec, rec, sizeof(wd.rec));
> +
> +	if (!kfifo_put(&cxl_cper_fifo, wd)) {
> +		pr_err_ratelimited("CXL CPER kfifo overflow\n");
> +		return;
> +	}
> +
> +	schedule_work(cxl_cper_work);
> +}
> +
> +int cxl_cper_register_work(struct work_struct *work)
> +{
> +	if (cxl_cper_work)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&cxl_cper_work_lock);
> +	cxl_cper_work = work;
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(cxl_cper_register_work, "CXL");
> +
> +int cxl_cper_unregister_work(struct work_struct *work)
> +{
> +	if (cxl_cper_work != work)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&cxl_cper_work_lock);
> +	cxl_cper_work = NULL;
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(cxl_cper_unregister_work, "CXL");
> +
> +int cxl_cper_kfifo_get(struct cxl_cper_work_data *wd)
> +{
> +	return kfifo_get(&cxl_cper_fifo, wd);
> +}
> +EXPORT_SYMBOL_NS_GPL(cxl_cper_kfifo_get, "CXL");
> +
>  /*
>   * GHES error status reporting throttle, to report more kinds of
>   * errors, instead of just most frequently occurred errors.
> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
> index 51725f25c516..dd49e9179b63 100644
> --- a/include/acpi/ghes_cper.h
> +++ b/include/acpi/ghes_cper.h
> @@ -20,6 +20,7 @@
>  #include <linux/workqueue.h>
>  
>  #include <acpi/ghes.h>
> +#include <cxl/event.h>
>  
>  #define GHES_PFX	"GHES: "
>  
> @@ -106,5 +107,15 @@ void ghes_estatus_cache_add(struct acpi_hest_generic *generic,
>  			    struct acpi_hest_generic_status *estatus);
>  void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
>  				   int sev);
> +void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> +			    int severity);
> +int cxl_cper_register_prot_err_work(struct work_struct *work);
> +int cxl_cper_unregister_prot_err_work(struct work_struct *work);
> +int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data *wd);
> +void cxl_cper_post_event(enum cxl_event_type event_type,
> +			 struct cxl_cper_event_rec *rec);
> +int cxl_cper_register_work(struct work_struct *work);
> +int cxl_cper_unregister_work(struct work_struct *work);
> +int cxl_cper_kfifo_get(struct cxl_cper_work_data *wd);
>  
>  #endif /* ACPI_APEI_GHES_CPER_H */
> 


