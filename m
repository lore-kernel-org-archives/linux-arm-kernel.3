Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1C3F3C99B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1cp8Z5CCWo4EJ0AMk81gMpfdV0mY63qZ7Ju40BPup0=; b=mApHYzTbf9xhzVHNVqbOPGeoeN
	qYpWMlMcLCPUdU1X8u+Dkr2rdE3mDMmo3L30GrqXIR1V4+5aYkfp0XN6o4gN9eraZrlODcSaEyHdu
	chx3YMcJGLxG3pWoTWzyHBQRIRtOEwsohERL5EOq0Dt2h0ytQeCqdVs3ochtDj4Pq9pgEnLg/M41g
	YDbJA9sqjJSDgRSDmc0/1iPtLRUDPMsblnvtsxTZrKQZKFleOUVpU3QNJm3W01Hlh5WffT6Q5i2Zn
	godetOoQxpKqI5CvryVyN75klxZjnI7aXk/rMLhsChfTBL0BwWVZ8DbZAp2bCjNF7mx/P5FJTqmmK
	5iYokhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuQX-00000002KIF-0bxA;
	Tue, 24 Feb 2026 15:34:21 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuQR-00000002KHi-0ZhG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:34:19 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fL1wG0MXHzJ4678;
	Tue, 24 Feb 2026 23:33:50 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id C841E40573;
	Tue, 24 Feb 2026 23:34:11 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Feb
 2026 15:34:10 +0000
Date: Tue, 24 Feb 2026 15:34:09 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ahmed Tiba <ahmed.tiba@arm.com>
CC: <devicetree@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<Dmitry.Lamerov@arm.com>, <catalin.marinas@arm.com>, <bp@alien8.de>,
	<robh@kernel.org>, <rafael@kernel.org>, <will@kernel.org>,
	<conor@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <krzk+dt@kernel.org>, <Michael.Zhao2@arm.com>,
	<tony.luck@intel.com>, <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v2 07/11] ACPI: APEI: GHES: move CXL CPER helpers
Message-ID: <20260224153409.0000191a@huawei.com>
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-7-347fa2d7351b@arm.com>
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
	<20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-7-347fa2d7351b@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_073415_480782_03AA04A5 
X-CRM114-Status: GOOD (  20.89  )
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

On Fri, 20 Feb 2026 13:42:25 +0000
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Move the CXL CPER handling paths out of ghes.c and into ghes_cper.c so the
> helpers can be reused. The code is moved as-is, with the public
> prototypes updated so GHES keeps calling into the new translation unit.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>

+CC linux-cxl.

I haven't looked closely but suspect the same stuff on code movement and patch
break up applies here.

Thanks,

Jonathan

> ---
>  drivers/acpi/apei/ghes.c      | 132 -----------------------------------------
>  drivers/acpi/apei/ghes_cper.c | 135 ++++++++++++++++++++++++++++++++++++++++++
>  include/acpi/ghes_cper.h      |  11 ++++
>  3 files changed, 146 insertions(+), 132 deletions(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index 9703c602a8c2..136993704d52 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -383,138 +383,6 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
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
> index 627f6c712261..673dca208935 100644
> --- a/drivers/acpi/apei/ghes_cper.c
> +++ b/drivers/acpi/apei/ghes_cper.c
> @@ -9,10 +9,12 @@
>   *
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
> @@ -319,6 +321,139 @@ void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
>  	schedule_work(&entry->work);
>  }
>  
> +
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
> +				   int severity)
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
> +DEFINE_KFIFO(cxl_cper_fifo, struct cxl_cper_work_data, CXL_CPER_FIFO_DEPTH);
> +
> +/* Synchronize schedule_work() with cxl_cper_work changes */
> +static DEFINE_SPINLOCK(cxl_cper_work_lock);
> +struct work_struct *cxl_cper_work;
> +
> +void cxl_cper_post_event(enum cxl_event_type event_type,
> +				struct cxl_cper_event_rec *rec)
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
> index c5ff4c502017..4522e8699ce0 100644
> --- a/include/acpi/ghes_cper.h
> +++ b/include/acpi/ghes_cper.h
> @@ -15,6 +15,7 @@
>  #include <linux/workqueue.h>
>  
>  #include <acpi/ghes.h>
> +#include <cxl/event.h>
>  
>  #define GHES_PFX	"GHES: "
>  
> @@ -99,5 +100,15 @@ void ghes_estatus_cache_add(struct acpi_hest_generic *generic,
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


