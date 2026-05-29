Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD8BCD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cfOaGqtXhzo3vVoQAD71kbwV/uATf5IVMb/TrLF8tQ=; b=0IwCrReABKhupchdAPhQwR5ecU
	1Sgryjp6XPlkDVD7vaJxxczrqsYYhbfZwbpF2DuaB7WFalTbC+qZ1DpcdkTnIj3bOTJnJKSMjaw9L
	M/AIkTX6Vn+fglWIYIeJuE46NS8R4JKB4Cp5GiHRdzBTk6dfL22sq8qtztBKoXSz8e2T8aSADSnZh
	t66GBvxenBiwK2FYnx4xh3q9ztLWIyusXbcD0ihzY/VqWKLSwSEYjcsQgtkf/AenhsS4/mjvjVk4G
	tJheJwrTS2fT6EfZ/4wYWICGuLfAnB5u+PPuQbnhvL4PwSOwNhER1+IFI2gJf+ckYkdiqRPmtiKR2
	YtAkNaYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSznF-00000007qiV-0n7a;
	Fri, 29 May 2026 16:10:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSznC-00000007qhr-3B0C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:10:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C33F43505;
	Fri, 29 May 2026 16:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09101F00893;
	Fri, 29 May 2026 16:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780071038;
	bh=0cfOaGqtXhzo3vVoQAD71kbwV/uATf5IVMb/TrLF8tQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FdcVNoNqszKzYLbncqvIj3IKV9TiF7cDek9qbm1jDcGWZPJsGPHvmcI3cdTh2v76a
	 yLrK4Dg3CkohtsWyEPNIQlflDTRRIaJ7zwdyaI0UBOtDjEbWeUKnQsxdH24d2rZd61
	 TqSz7Fz+CpQzmkh7nmzGtCyPSRaegM9l5FiTJXs1mzoNeM7tD5DdY7LdUjAlR3ztf+
	 Qj/Qvww9ZiZJ8PoW+ZF3XeswZDfbU6+x9PYXH4pg56pO2hOLdilYb9Hu50kfc1PSKJ
	 5qLa1+KqQVRd1lnHDxJIE21RH2xC7lTDms6xAs25pKN0KiC+0hdEzTq3IOQsYeVVqs
	 gMZZTLCaFI+2A==
Date: Fri, 29 May 2026 17:10:22 +0100
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
Subject: Re: [PATCH v5 05/10] ACPI: APEI: GHES: move vendor record helpers
Message-ID: <20260529171022.073eb4cd@jic23-huawei>
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-5-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
	<20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-5-2e0500d42642@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_091038_841761_DA8D00C1 
X-CRM114-Status: GOOD (  23.50  )
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

On Fri, 29 May 2026 10:50:45 +0100
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Shift the vendor record workqueue helpers into ghes_cper.c so both GHES
> and future DT-based providers can use the same implementation. The change
> is mechanical and keeps the notifier behavior identical.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
A few questions  / comments inline

J
> ---
>  drivers/acpi/apei/ghes.c      | 86 +++++++++----------------------------------
>  drivers/acpi/apei/ghes_cper.c | 55 +++++++++++++++++++++++++++
>  include/acpi/ghes_cper.h      |  2 +
>  3 files changed, 75 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index adab7404310e..81ac51632f21 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
...

> -
> -static void ghes_vendor_record_notifier_destroy(void *nb)
> -{
> -	ghes_unregister_vendor_record_notifier(nb);
> -}
> -
> -int devm_ghes_register_vendor_record_notifier(struct device *dev,
> -					      struct notifier_block *nb)
> -{
> -	int ret;
> -
> -	ret = ghes_register_vendor_record_notifier(nb);
> -	if (ret)
> -		return ret;
> -
> -	return devm_add_action_or_reset(dev, ghes_vendor_record_notifier_destroy, nb);
> -}
> -EXPORT_SYMBOL_GPL(devm_ghes_register_vendor_record_notifier);

>  #define CXL_CPER_PROT_ERR_FIFO_DEPTH 8
>  static DEFINE_KFIFO(cxl_cper_prot_err_fifo, struct cxl_cper_prot_err_work_data,
> @@ -514,6 +446,24 @@ int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data *wd)
>  }
>  EXPORT_SYMBOL_NS_GPL(cxl_cper_prot_err_kfifo_get, "CXL");
>  
> +static void ghes_vendor_record_notifier_destroy(void *nb)
> +{
> +	ghes_unregister_vendor_record_notifier(nb);
> +}
> +
> +int devm_ghes_register_vendor_record_notifier(struct device *dev,
> +					      struct notifier_block *nb)
> +{
> +	int ret;
> +
> +	ret = ghes_register_vendor_record_notifier(nb);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, ghes_vendor_record_notifier_destroy, nb);
> +}
> +EXPORT_SYMBOL_GPL(devm_ghes_register_vendor_record_notifier);
> +

Why did these two move inside the file?  It is a bit odd to leave the devm calls in
a different place to what they are wrapping. I guess someone argued for that in an
earlier version? (hopefully not me ;)  
If the move puts them in an ifdef block then I'd not bother - it's tiny code and
to me doing this is more confusing than just leaving them where they were.


>  /* Room for 8 entries for each of the 4 event log queues */
>  #define CXL_CPER_FIFO_DEPTH 32
>  DEFINE_KFIFO(cxl_cper_fifo, struct cxl_cper_work_data, CXL_CPER_FIFO_DEPTH);
> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
> index 0a117f478afb..131980d36064 100644
> --- a/drivers/acpi/apei/ghes_cper.c
> +++ b/drivers/acpi/apei/ghes_cper.c
> @@ -14,12 +14,17 @@
>  
>  #include <linux/err.h>
>  #include <linux/genalloc.h>
> +#include <linux/irq_work.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/list.h>
>  #include <linux/math64.h>
>  #include <linux/mm.h>
> +#include <linux/notifier.h>
> +#include <linux/llist.h>
>  #include <linux/ratelimit.h>
>  #include <linux/rcupdate.h>
> +#include <linux/rculist.h>

I'm not seeing anything reason for most of these new includes.
Probably in the wrong patch


>  #include <linux/sched/clock.h>
>  #include <linux/slab.h>
>  
> @@ -266,6 +271,56 @@ void ghes_clear_estatus(struct ghes *ghes,
>  		ghes_ack_error(ghes->generic_v2);
>  }
>  
> +static BLOCKING_NOTIFIER_HEAD(vendor_record_notify_list);
> +
> +int ghes_register_vendor_record_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&vendor_record_notify_list, nb);
> +}
> +EXPORT_SYMBOL_GPL(ghes_register_vendor_record_notifier);
> +
> +void ghes_unregister_vendor_record_notifier(struct notifier_block *nb)
> +{
> +	blocking_notifier_chain_unregister(&vendor_record_notify_list, nb);
> +}
> +EXPORT_SYMBOL_GPL(ghes_unregister_vendor_record_notifier);
> +
> +static void ghes_vendor_record_work_func(struct work_struct *work)
> +{
> +	struct ghes_vendor_record_entry *entry;
> +	struct acpi_hest_generic_data *gdata;
> +	u32 len;
> +
> +	entry = container_of(work, struct ghes_vendor_record_entry, work);
> +	gdata = GHES_GDATA_FROM_VENDOR_ENTRY(entry);
> +
> +	blocking_notifier_call_chain(&vendor_record_notify_list,
> +				     entry->error_severity, gdata);
> +
> +	len = GHES_VENDOR_ENTRY_LEN(acpi_hest_get_record_size(gdata));
> +	gen_pool_free(ghes_estatus_pool, (unsigned long)entry, len);
> +}
> +
> +void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
> +				   int sev)
> +{
> +	struct acpi_hest_generic_data *copied_gdata;
> +	struct ghes_vendor_record_entry *entry;
> +	u32 len;
> +
> +	len = GHES_VENDOR_ENTRY_LEN(acpi_hest_get_record_size(gdata));
> +	entry = (void *)gen_pool_alloc(ghes_estatus_pool, len);
> +	if (!entry)
> +		return;
> +
> +	copied_gdata = GHES_GDATA_FROM_VENDOR_ENTRY(entry);
> +	memcpy(copied_gdata, gdata, acpi_hest_get_record_size(gdata));
> +	entry->error_severity = sev;
> +
> +	INIT_WORK(&entry->work, ghes_vendor_record_work_func);
> +	schedule_work(&entry->work);
> +}
> +
>  /*
>   * GHES error status reporting throttle, to report more kinds of
>   * errors, instead of just most frequently occurred errors.
> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
> index 1b5dbeca9bb6..51725f25c516 100644
> --- a/include/acpi/ghes_cper.h
> +++ b/include/acpi/ghes_cper.h
> @@ -104,5 +104,7 @@ int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
>  int ghes_estatus_cached(struct acpi_hest_generic_status *estatus);
>  void ghes_estatus_cache_add(struct acpi_hest_generic *generic,
>  			    struct acpi_hest_generic_status *estatus);
> +void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
> +				   int sev);
>  
>  #endif /* ACPI_APEI_GHES_CPER_H */
> 


