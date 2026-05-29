Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572BBCD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4M+It2DOv5k9KjwYe9tzppT1ZADxs54n1EqbAeaJ720=; b=QxMpHw0RpbjDkAZVygNbdthM/r
	V8HN7HNTCECpNAUaJUB+1XyGMv6CzNGeu2UZDybxpuphYWJxfV5kNDLqtbyPKu6ul8B2e8AIIM0et
	Cva+eAfVe8gyIiwHbuLkHXbBHjcAbXXbvvIjwb3IdwLjNXU0zUOj0L52auu55bmPrxoej4Ug1qK2f
	9gz27XED73KNB4/LKD8luBZbtDI4U8AUR7fT6dZmLivUMkmIu5irFzWu8tVYYlw8AMZOldbuJwGmi
	xF8jlroyETlj1bF8AhTolzF00BF8x4vfKSuitqtcI5X/UdHwikjYaSpIxDxqDA/JgtXp7DDMztBct
	CvvANJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0ff-00000007xHx-46oX;
	Fri, 29 May 2026 17:06:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0fc-00000007xH5-40Jo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 17:06:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E4313408CD;
	Fri, 29 May 2026 17:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08591F00893;
	Fri, 29 May 2026 17:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780074411;
	bh=4M+It2DOv5k9KjwYe9tzppT1ZADxs54n1EqbAeaJ720=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SP6p72pip/TZBBTPfI6xJt9s5UzA6binmI5dRPsEByPLuFHi5uyL5UYdE8bdSHQaK
	 tggLikbsoalo8nS1PkmzssxJbu9eVzYH/XiBmA58ftVjJcuZW+1ohhVAC5LB21QdLO
	 oGCFs3Z50GQocKQNRfiY/XOpzHcG3dHvfn3y8lOO1A4lTOdYUmHfsy+/Vj68eBdvlP
	 wNp474s6YWglQC/Cp+xQvxvmqiOkmYUetZsumkvZu+Z/4TRhGwojOPkLDmWdP3EBq/
	 zXiKyDgjFvZB6Ku/zB36Kb4XtrGNWFt7iuVxUawWOWRtqTWeE3i953yDfR380EWquV
	 /HVuWv7/PVBoQ==
Date: Fri, 29 May 2026 18:06:36 +0100
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
Subject: Re: [PATCH v5 10/10] RAS: add firmware-first CPER provider
Message-ID: <20260529180636.78cbc75f@jic23-huawei>
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-10-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
	<20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-10-2e0500d42642@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_100653_099125_7B315F1C 
X-CRM114-Status: GOOD (  43.59  )
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

On Fri, 29 May 2026 10:50:50 +0100
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Add a firmware-first CPER provider that reuses the shared
> GHES helpers, wire it into the RAS Kconfig/Makefile and
> document it in the admin guide.
> 
> Update MAINTAINERS now that the driver exists.
Sashiko had some interesting comments on this one. Please take a look and
reply to the thread if any look plausible but aren't!
https://sashiko.dev/#/patchset/20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com

The irq thread / force_sig() one is something I'd not have
considered. I obviously haven't tested it and so it might be wrong :)

A few things inline.

Jonathan


> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> ---
>  Documentation/admin-guide/RAS/main.rst |  18 +++
>  MAINTAINERS                            |   1 +
>  drivers/acpi/apei/apei-internal.h      |  10 +-
>  drivers/acpi/apei/ghes_cper.c          |   2 +
>  drivers/ras/Kconfig                    |  11 ++
>  drivers/ras/Makefile                   |   1 +
>  drivers/ras/cper-esource.c             | 257 +++++++++++++++++++++++++++++++++
>  include/acpi/ghes_cper.h               |  10 ++
>  8 files changed, 301 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/admin-guide/RAS/main.rst b/Documentation/admin-guide/RAS/main.rst
> index 5a45db32c49b..84219d25a072 100644
> --- a/Documentation/admin-guide/RAS/main.rst
> +++ b/Documentation/admin-guide/RAS/main.rst
> @@ -205,6 +205,24 @@ Architecture (MCA)\ [#f3]_.
>  .. [#f3] For more details about the Machine Check Architecture (MCA),
>    please read Documentation/arch/x86/x86_64/machinecheck.rst at the Kernel tree.
>  
> +Firmware-first CPER providers
> +-----------------------------
> +
> +Some systems expose Common Platform Error Record (CPER) data
> +through platform firmware instead of ACPI HEST tables.

Given the data doesn't come through HEST but rather in places it points to and
that is via a different type of platform firmware it seems to me this
bit needs a rewrite.

> +Enable ``CONFIG_RAS_CPER_ESOURCE`` to build the ``drivers/ras/cper-esource.c``
> +driver. The current in-tree firmware description uses the
> +``Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml`` binding.
> +The driver reuses the GHES CPER helper object in
> +``drivers/acpi/apei/ghes_cper.c`` so the logging, notifier chains, and
> +memory failure handling match the ACPI GHES behaviour even when
> +ACPI is disabled.

Rewrap.  Line lengths appear very random.

> +
> +Once a platform describes a firmware-first provider, both ACPI GHES and the
> +firmware-described driver reuse the same code paths. This keeps the
> +behaviour consistent regardless of whether the error source is described
> +by ACPI tables or another firmware description.
> +
>  EDAC - Error Detection And Correction
>  *************************************
>  
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a9714603a7d..c14638cd97f6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22265,6 +22265,7 @@ RAS ERROR STATUS
>  M:	Ahmed Tiba <ahmed.tiba@arm.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
> +F:	drivers/ras/cper-esource.c
>  
>  RAS INFRASTRUCTURE
>  M:	Tony Luck <tony.luck@intel.com>
> diff --git a/drivers/acpi/apei/apei-internal.h b/drivers/acpi/apei/apei-internal.h
> index 77c10a7a7a9f..c16ac541f15b 100644
> --- a/drivers/acpi/apei/apei-internal.h
> +++ b/drivers/acpi/apei/apei-internal.h
> @@ -8,6 +8,7 @@
>  #define APEI_INTERNAL_H
>  
>  #include <linux/acpi.h>
> +#include <acpi/ghes_cper.h>
>  
>  struct apei_exec_context;
>  
> @@ -120,15 +121,6 @@ int apei_exec_collect_resources(struct apei_exec_context *ctx,
>  struct dentry;
>  struct dentry *apei_get_debugfs_dir(void);
>  
> -static inline u32 cper_estatus_len(struct acpi_hest_generic_status *estatus)

As below. I'd not expect to see this moving in this patch given all the precursor
code movement patches.

> -{
> -	if (estatus->raw_data_length)
> -		return estatus->raw_data_offset + \
> -			estatus->raw_data_length;
> -	else
> -		return sizeof(*estatus) + estatus->data_length;
> -}
> -
>  int apei_osc_setup(void);
>  
>  int einj_get_available_error_type(u32 *type, int einj_action);
> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
> index 0ff9d06eb78f..a7691aa5011c 100644
> --- a/drivers/acpi/apei/ghes_cper.c
> +++ b/drivers/acpi/apei/ghes_cper.c
> @@ -46,7 +46,9 @@
>  #include <asm/fixmap.h>
>  #include <asm/tlbflush.h>
>  
> +#ifdef CONFIG_ACPI_APEI
>  #include "apei-internal.h"

Why is this dance needed? Add a comment.

We'd normally expect a header to safe to include if it's not used with
any stubbing done in the header.

> +#endif
>  
>  ATOMIC_NOTIFIER_HEAD(ghes_report_chain);
>  

> diff --git a/drivers/ras/cper-esource.c b/drivers/ras/cper-esource.c
> new file mode 100644
> index 000000000000..83f7a910e50a
> --- /dev/null
> +++ b/drivers/ras/cper-esource.c

> +struct cper_esource {
> +	struct device *dev;
> +	void __iomem *status;
> +	size_t status_len;
> +
> +	struct cper_esource_ack ack;
> +
> +	struct acpi_hest_generic *generic;

See below - maybe this can just be embedded here.

> +	struct acpi_hest_generic_status *estatus;
> +
> +	bool sync;
> +	int irq;
> +
> +	/* Serializes access while firmware and the OS share the status buffer. */
> +	spinlock_t lock;
> +};

> +
> +static int cper_esource_copy_status(struct cper_esource *ctx)
> +{
> +	memcpy_fromio(ctx->estatus, ctx->status, ctx->status_len);
> +	return 0;

Seems an unnecessary helper. In particular if it returns 0 always
no need to do so or to check the return value.

> +}
>


> +static int cper_esource_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct cper_esource *ctx;
> +	struct resource *res;
> +	int source_id;
> +	int rc;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&ctx->lock);
> +	ctx->dev = dev;
> +	ctx->sync = device_property_read_bool(dev, "arm,sea-notify");
> +
> +	ctx->status = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(ctx->status))
> +		return dev_err_probe(dev, PTR_ERR(ctx->status),
> +				     "failed to map status region\n");
> +
> +	ctx->status_len = resource_size(res);
> +	if (!ctx->status_len)
> +		return dev_err_probe(dev, -EINVAL, "status region has zero length\n");
> +
> +	rc = cper_esource_init_ack(pdev, ctx);
> +	if (rc)
> +		return rc;
> +
> +	rc = cper_esource_init_pool();
> +	if (rc)
> +		return rc;
> +
> +	ctx->estatus = devm_kzalloc(dev, ctx->status_len, GFP_KERNEL);
> +	if (!ctx->estatus)
> +		return -ENOMEM;
> +
> +	ctx->generic = devm_kzalloc(dev, sizeof(*ctx->generic), GFP_KERNEL);

Lifetime of this is shorter than that of containing structure. Why not just
embed it and avoid need to allocate here?

> +	if (!ctx->generic)
> +		return -ENOMEM;
> +
> +	source_id = ida_alloc_min(&cper_esource_source_ids, 1, GFP_KERNEL);

Maybe a comment on what is special about id 0

> +	if (source_id < 0)
> +		return source_id;
> +
> +	ctx->generic->header.type = ACPI_HEST_TYPE_GENERIC_ERROR;
> +	ctx->generic->header.source_id = source_id;
> +
> +	rc = devm_add_action_or_reset(dev, cper_esource_release_source_id,
> +				      ctx->generic);
> +	if (rc)
> +		return rc;
> +
> +	ctx->generic->notify.type = ctx->sync ?
> +		ACPI_HEST_NOTIFY_SEA : ACPI_HEST_NOTIFY_EXTERNAL;
> +	ctx->generic->error_block_length = ctx->status_len;
> +
> +	ctx->irq = platform_get_irq(pdev, 0);
> +	if (ctx->irq < 0)
> +		return ctx->irq;
> +
> +	rc = devm_request_threaded_irq(dev, ctx->irq, NULL, cper_esource_irq,
> +				       IRQF_ONESHOT,
> +				       dev_name(dev), ctx);
> +	if (rc)
> +		return dev_err_probe(dev, rc, "failed to request interrupt\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id cper_esource_of_match[] = {
> +	{ .compatible = "arm,ras-cper" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, cper_esource_of_match);
> +
> +static struct platform_driver cper_esource_driver = {
> +	.driver = {
> +		.name = "cper-esource",
> +		.of_match_table = cper_esource_of_match,
> +	},
> +	.probe = cper_esource_probe,
> +};
Common practice to not have a blank line here. Keeps the
structure and the macro visually closely coupled.

> +
> +module_platform_driver(cper_esource_driver);
> +
> +MODULE_AUTHOR("Ahmed Tiba <ahmed.tiba@arm.com>");
> +MODULE_DESCRIPTION("Firmware-first CPER provider");
> +MODULE_LICENSE("GPL");
> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
> index 511b95b50911..a78d4a773129 100644
> --- a/include/acpi/ghes_cper.h
> +++ b/include/acpi/ghes_cper.h
> @@ -80,6 +80,14 @@ static inline bool is_hest_sync_notify(struct ghes *ghes)
>  	return notify_type == ACPI_HEST_NOTIFY_SEA;
>  }
>  
> +static inline u32 cper_estatus_len(struct acpi_hest_generic_status *estatus)

I'm surprised to still see code movement in this patch. To me this should have
happened earlier in series. 

> +{
> +	if (estatus->raw_data_length)
> +		return estatus->raw_data_offset + estatus->raw_data_length;
> +	else
> +		return sizeof(*estatus) + estatus->data_length;
> +}
> +
>  struct ghes_vendor_record_entry {
>  	struct work_struct work;
>  	int error_severity;
> @@ -108,6 +116,8 @@ int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
>  int ghes_estatus_cached(struct acpi_hest_generic_status *estatus);
>  void ghes_estatus_cache_add(struct acpi_hest_generic *generic,
>  			    struct acpi_hest_generic_status *estatus);
> +int ghes_register_vendor_record_notifier(struct notifier_block *nb);
> +void ghes_unregister_vendor_record_notifier(struct notifier_block *nb);

Why are we seeing these here now?  Stray from earlier patch?
Which c file are they in at this point?

>  void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
>  				   int sev);
>  int ghes_severity(int severity);
> 


