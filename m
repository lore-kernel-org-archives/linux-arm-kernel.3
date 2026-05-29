Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F11CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJKm4DQd8wLymlnydE/tYUEbKfRJqcyMFKjOdZG+S0A=; b=YClf1qtDGWdi82tSu8DjOhex4u
	bnlCHDvmCmEGjK6cdjqqPHLiiYqE3k+C6XA52jR66rOejA8xUUY1RaQHu0W2y2NOCy3lLqgUHZIt4
	lO6Tq/id8HimJ7+BH5cgEh5HeObHtcu5FSu9zo/MHvrd82lT9kwJxv3nenPyeTIded6cAYszHhlLI
	xBp8B2HEIcw8fo2JlEVDY8EpSI7FM0IEz/QNS01SNEj5J1niux0W70lOa7xcz6H8Wltfaw/NVyeDe
	7d+DAYOFH/lac6ZHP07cidy6hNVFM5GIMnfffsSPhW6goE5r2rUdIE6UlxVOt2dPVtzWeqhbwX212
	WXoUQ5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT08e-00000007tYD-2tb0;
	Fri, 29 May 2026 16:32:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT08c-00000007tXr-2bYA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:32:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 17549605D0;
	Fri, 29 May 2026 16:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0001F00893;
	Fri, 29 May 2026 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780072365;
	bh=NJKm4DQd8wLymlnydE/tYUEbKfRJqcyMFKjOdZG+S0A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mX8PGa38Wq6NozoBBfp4pcg9DjDIcytpq0mrX99CXq9anID9csliTdSxABivMZ+R5
	 qIJ3d4b86aqP+Z4OXEE8CfMUBrm/fQDTGVqH6dg/KFIOFr6iNmGtvxAch1/1xcIs9J
	 OeRW+vk1DUCqjnMXaP4B9emGolgupQs3TBMZp/75CyS5S+0HvhwkGY4FP+xh/zP5Gk
	 IYPthMuJJYDzdHvKGSgWLe7LG3ZJEvPe+0qPUI+ZnljD7xIpdwg5B+swXd2yryYzlj
	 kr3c8aGuNlb8/zcGGjmAexOs75NVeIn0+Nw0hBluFglUAculi5lm4O9ofCC+07zkWp
	 7txTu1m/+e6gw==
Date: Fri, 29 May 2026 17:32:29 +0100
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
 linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v5 08/10] ACPI: APEI: share GHES CPER helpers
Message-ID: <20260529173229.18843384@jic23-huawei>
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-8-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
	<20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-8-2e0500d42642@arm.com>
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

On Fri, 29 May 2026 10:50:48 +0100
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Wire GHES up to the helper routines in ghes_cper.c and remove the local
> copies from ghes.c. This keeps the control flow identical while letting
> the helpers be shared with other firmware-first providers.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
Mostly looks fine.  The one bit that rather makes this exercise of breaking
out generic code look dodgy is the ifdefs in the generic file.

I'm haven't looked closely but that to me implies a coupling that should not be
here.

Jonathan

> ---
>  drivers/acpi/apei/ghes.c      | 416 +--------------------------------------
>  drivers/acpi/apei/ghes_cper.c | 438 +++++++++++++++++++++++++++++++++++++++++-
>  include/acpi/ghes_cper.h      |  20 ++
>  3 files changed, 459 insertions(+), 415 deletions(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index 85be2ebf4d3e..f85b97c4db4c 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c

>  
>  static void __ghes_panic(struct ghes *ghes,
> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
> index d7a666a163c3..0ff9d06eb78f 100644
> --- a/drivers/acpi/apei/ghes_cper.c
> +++ b/drivers/acpi/apei/ghes_cper.c
> @@ -13,22 +13,32 @@

>  
>  #include "apei-internal.h"
>  
> +ATOMIC_NOTIFIER_HEAD(ghes_report_chain);
> +
> +#ifndef CONFIG_ACPI_APEI
> +void __weak arch_apei_report_mem_error(int sev, struct cper_sec_mem_err *mem_err) { }
> +#endif
This is non obvious enough that the reasoning for a new weak function should be mentioned in
the patch description.  Why not stub it in include/acpi/apei.h? 

> +
>  static struct ghes_estatus_cache __rcu *ghes_estatus_caches[GHES_ESTATUS_CACHES_SIZE];
>  static atomic_t ghes_estatus_cache_alloced;

> +void __ghes_print_estatus(const char *pfx,
> +			  const struct acpi_hest_generic *generic,
> +			  const struct acpi_hest_generic_status *estatus)
> +{
> +	static atomic_t seqno;
> +	unsigned int curr_seqno;
> +	char pfx_seq[64];
> +
> +	if (!pfx) {
> +		if (ghes_severity(estatus->error_severity) <=
> +		    GHES_SEV_CORRECTED)
> +			pfx = KERN_WARNING;
> +		else
> +			pfx = KERN_ERR;
> +	}
> +	curr_seqno = atomic_inc_return(&seqno);
> +	snprintf(pfx_seq, sizeof(pfx_seq), "%s{%u}" HW_ERR, pfx, curr_seqno);
> +	printk("%sHardware error from APEI Generic Hardware Error Source: %d\n",
> +	       pfx_seq, generic->header.source_id);
> +	cper_estatus_print(pfx_seq, estatus);
> +}
> +
> +int ghes_print_estatus(const char *pfx,
> +		       const struct acpi_hest_generic *generic,
> +		       const struct acpi_hest_generic_status *estatus)
> +{
> +	/* Not more than 2 messages every 5 seconds */
> +	static DEFINE_RATELIMIT_STATE(ratelimit_corrected, 5 * HZ, 2);
> +	static DEFINE_RATELIMIT_STATE(ratelimit_uncorrected, 5 * HZ, 2);
> +	struct ratelimit_state *ratelimit;
> +
> +	if (ghes_severity(estatus->error_severity) <= GHES_SEV_CORRECTED)
> +		ratelimit = &ratelimit_corrected;
> +	else
> +		ratelimit = &ratelimit_uncorrected;
> +	if (__ratelimit(ratelimit)) {
> +		__ghes_print_estatus(pfx, generic, estatus);
> +		return 1;
> +	}
> +	return 0;
> +}
> +
> +#ifdef CONFIG_ACPI_APEI

So after the effort to break the the generic stuff we end up with non generic
bits in the broken out file?  Is there no way to avoid this?

>  static void __iomem *ghes_map(u64 pfn, enum fixed_addresses fixmap_idx)
>  {
>  	phys_addr_t paddr;
> @@ -272,6 +636,7 @@ void ghes_clear_estatus(struct ghes *ghes,
>  	if (is_hest_type_generic_v2(ghes))
>  		ghes_ack_error(ghes->generic_v2);
>  }
> +#endif /* CONFIG_ACPI_APEI */

> +void ghes_cper_handle_status(struct device *dev,
> +			     const struct acpi_hest_generic *generic,
> +			     const struct acpi_hest_generic_status *estatus,
> +			     bool sync)
> +{
> +	int sev, sec_sev;
> +	struct acpi_hest_generic_data *gdata;
> +	guid_t *sec_type;
> +	const guid_t *fru_id = &guid_null;
> +	char *fru_text = "";
> +	bool queued = false;
> +
> +	sev = ghes_severity(estatus->error_severity);
> +	apei_estatus_for_each_section(estatus, gdata) {
> +		sec_type = (guid_t *)gdata->section_type;
> +		sec_sev = ghes_severity(gdata->error_severity);
> +		if (gdata->validation_bits & CPER_SEC_VALID_FRU_ID)
> +			fru_id = (guid_t *)gdata->fru_id;
> +
> +		if (gdata->validation_bits & CPER_SEC_VALID_FRU_TEXT)
> +			fru_text = gdata->fru_text;
> +
> +		ghes_log_hwerr(sev, sec_type);
> +		if (guid_equal(sec_type, &CPER_SEC_PLATFORM_MEM)) {
> +			struct cper_sec_mem_err *mem_err = acpi_hest_get_payload(gdata);
> +
> +			atomic_notifier_call_chain(&ghes_report_chain, sev, mem_err);
> +
> +			arch_apei_report_mem_error(sev, mem_err);
> +			queued = ghes_handle_memory_failure(gdata, sev, sync);
> +		} else if (guid_equal(sec_type, &CPER_SEC_PCIE)) {
> +			ghes_handle_aer(gdata);
> +		} else if (guid_equal(sec_type, &CPER_SEC_PROC_ARM)) {
> +			queued = ghes_handle_arm_hw_error(gdata, sev, sync);
> +		} else if (guid_equal(sec_type, &CPER_SEC_CXL_PROT_ERR)) {
> +			struct cxl_cper_sec_prot_err *prot_err = acpi_hest_get_payload(gdata);
> +
> +			cxl_cper_post_prot_err(prot_err, gdata->error_severity);
> +		} else if (guid_equal(sec_type, &CPER_SEC_CXL_GEN_MEDIA_GUID)) {
> +			struct cxl_cper_event_rec *rec = acpi_hest_get_payload(gdata);
> +
> +			cxl_cper_post_event(CXL_CPER_EVENT_GEN_MEDIA, rec);
> +		} else if (guid_equal(sec_type, &CPER_SEC_CXL_DRAM_GUID)) {
> +			struct cxl_cper_event_rec *rec = acpi_hest_get_payload(gdata);
> +
> +			cxl_cper_post_event(CXL_CPER_EVENT_DRAM, rec);
> +		} else if (guid_equal(sec_type, &CPER_SEC_CXL_MEM_MODULE_GUID)) {
> +			struct cxl_cper_event_rec *rec = acpi_hest_get_payload(gdata);
> +
> +			cxl_cper_post_event(CXL_CPER_EVENT_MEM_MODULE, rec);
> +		} else {
> +			void *err = acpi_hest_get_payload(gdata);
> +
> +			ghes_defer_non_standard_event(gdata, sev);
> +			log_non_standard_event(sec_type, fru_id, fru_text,
> +					       sec_sev, err,
> +					       gdata->error_data_length);
> +		}
> +	}
> +
> +	/*
> +	 * If no memory failure work is queued for abnormal synchronous
> +	 * errors, do a force kill.
> +	 */
> +	if (sync && !queued) {
> +		dev_err(dev,
> +			HW_ERR GHES_PFX "%s:%d: synchronous unrecoverable error (SIGBUS)\n",
> +			current->comm, task_pid_nr(current));
> +		force_sig(SIGBUS);
> +	}
> +}

Blank line here

>  /* Room for 8 entries */
>  #define CXL_CPER_PROT_ERR_FIFO_DEPTH 8
>  static DEFINE_KFIFO(cxl_cper_prot_err_fifo, struct cxl_cper_prot_err_work_data,
> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
> index dd49e9179b63..511b95b50911 100644
> --- a/include/acpi/ghes_cper.h
> +++ b/include/acpi/ghes_cper.h
> @@ -17,6 +17,8 @@
>  #define ACPI_APEI_GHES_CPER_H
>  
>  #include <linux/atomic.h>
> +#include <linux/device.h>
> +#include <linux/notifier.h>
>  #include <linux/workqueue.h>
>  
>  #include <acpi/ghes.h>
> @@ -57,6 +59,7 @@
>  	((struct ghes_vendor_record_entry *)(vendor_entry) + 1))
>  
>  extern struct gen_pool *ghes_estatus_pool;
> +extern struct atomic_notifier_head ghes_report_chain;
>  
>  static inline bool is_hest_type_generic_v2(struct ghes *ghes)
>  {
> @@ -107,6 +110,23 @@ void ghes_estatus_cache_add(struct acpi_hest_generic *generic,
>  			    struct acpi_hest_generic_status *estatus);
>  void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
>  				   int sev);
> +int ghes_severity(int severity);
> +bool ghes_handle_memory_failure(struct acpi_hest_generic_data *gdata,
> +				int sev, bool sync);
> +bool ghes_handle_arm_hw_error(struct acpi_hest_generic_data *gdata,
> +			      int sev, bool sync);
> +void ghes_handle_aer(struct acpi_hest_generic_data *gdata);
> +void ghes_log_hwerr(int sev, guid_t *sec_type);
> +void __ghes_print_estatus(const char *pfx,
> +			  const struct acpi_hest_generic *generic,
> +			  const struct acpi_hest_generic_status *estatus);
> +int ghes_print_estatus(const char *pfx,
> +		       const struct acpi_hest_generic *generic,
> +		       const struct acpi_hest_generic_status *estatus);
> +void ghes_cper_handle_status(struct device *dev,
> +			     const struct acpi_hest_generic *generic,
> +			     const struct acpi_hest_generic_status *estatus,
> +			     bool sync);
>  void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
>  			    int severity);
>  int cxl_cper_register_prot_err_work(struct work_struct *work);
> 


