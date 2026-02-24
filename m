Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762E4F3C991
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=th8oyztfLOQgsAePew2Ea9c9epWfEYTmUdUBoQvDVlo=; b=Q7XaCHoasMNH21B6YVXgoz3LvV
	m12iDbA9Q8/mMkloCkD2rri0Eiiz3xDr/ugMcrxMcXUV/rLEQN6TPUxYxpb6DOVeEIdfa6tXGIkTJ
	9TT2qR6UZhnZVFsJ+wAF8QgHXg+QBNOwEkWn4O4X+zT5TplUoW6+oBYeqUXhpMzppGvn33hMv0n0C
	aymI6bL5smnQpUyMkBFUWBBy//ezDv1aGczwL65XpW6pabI4NJYAEKu+/2vnEDTY1AAGDoD1/u5j6
	AWH0rEXB8/34YFUFfWPFJoxLwUwIMcTVjwYDMcSQdZqQpm4T4mDfjUM1iFqA1AFrIdrp6csIJSqWJ
	pswwqDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuFN-00000002IrX-2h5M;
	Tue, 24 Feb 2026 15:22:49 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuFK-00000002IqU-1yti
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:22:48 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fL1fp4W6xzJ46g6;
	Tue, 24 Feb 2026 23:22:10 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 612B64056A;
	Tue, 24 Feb 2026 23:22:32 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Feb
 2026 15:22:31 +0000
Date: Tue, 24 Feb 2026 15:22:30 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ahmed Tiba <ahmed.tiba@arm.com>
CC: <devicetree@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<Dmitry.Lamerov@arm.com>, <catalin.marinas@arm.com>, <bp@alien8.de>,
	<robh@kernel.org>, <rafael@kernel.org>, <will@kernel.org>,
	<conor@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <krzk+dt@kernel.org>, <Michael.Zhao2@arm.com>,
	<tony.luck@intel.com>, "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 01/11] ACPI: APEI: GHES: share macros via a private
 header
Message-ID: <20260224152230.00000531@huawei.com>
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-1-347fa2d7351b@arm.com>
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
	<20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-1-347fa2d7351b@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_072246_812966_56E204DA 
X-CRM114-Status: GOOD (  26.97  )
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

On Fri, 20 Feb 2026 13:42:19 +0000
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Carve the CPER helper macros out of ghes.c and place them in a private
> header so they can be shared with upcoming helper files. This is a
> mechanical include change with no functional differences.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
+CC Mauro as he's been doing a lot of work on error injection recently so
can probably review the use of the various structures much more easily
than I can!

My main comment is on the naming of the new header.

Jonathan


> ---
>  drivers/acpi/apei/ghes.c | 60 +-----------------------------
>  include/acpi/ghes_cper.h | 95 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 96 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index f96aede5d9a3..07b70bcb8342 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c

>  
>  static struct ghes_estatus_cache __rcu *ghes_estatus_caches[GHES_ESTATUS_CACHES_SIZE];
> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
> new file mode 100644
> index 000000000000..2597fbadc4f3
> --- /dev/null
> +++ b/include/acpi/ghes_cper.h
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * APEI Generic Hardware Error Source: CPER Helper

There is other stuff in her usch as the GHES acks etc
in ghes_clear_estatus(). So I think this intro text
needs a bit more thought.  The boundary is already rather
blurred though as for example cper_estatus_len() is only
tangentially connected to cper.

> + *
> + * Copyright (C) 2026 ARM Ltd.

Doesn't make sense to ad this copyright in this patch as so far
it's cut and paste of code from a file that you didn't write (at least
not in 2026!)

Might make sense after a few patches, in which case add the copyright
when it does.

> + * Author: Ahmed Tiba <ahmed.tiba@arm.com>
> + * Based on ACPI APEI GHES driver.
> + *
> + */
> +
> +#ifndef ACPI_APEI_GHES_CPER_H
> +#define ACPI_APEI_GHES_CPER_H
> +
> +#include <linux/workqueue.h>
> +
> +#include <acpi/ghes.h>
> +
> +#define GHES_PFX	"GHES: "
> +
> +#define GHES_ESTATUS_MAX_SIZE		65536
> +#define GHES_ESOURCE_PREALLOC_MAX_SIZE	65536
> +
> +#define GHES_ESTATUS_POOL_MIN_ALLOC_ORDER 3
> +
> +/* This is just an estimation for memory pool allocation */
> +#define GHES_ESTATUS_CACHE_AVG_SIZE	512
> +
> +#define GHES_ESTATUS_CACHES_SIZE	4
> +
> +#define GHES_ESTATUS_IN_CACHE_MAX_NSEC	10000000000ULL
> +/* Prevent too many caches are allocated because of RCU */
> +#define GHES_ESTATUS_CACHE_ALLOCED_MAX	(GHES_ESTATUS_CACHES_SIZE * 3 / 2)
> +
> +#define GHES_ESTATUS_CACHE_LEN(estatus_len)			\
> +	(sizeof(struct ghes_estatus_cache) + (estatus_len))
> +#define GHES_ESTATUS_FROM_CACHE(estatus_cache)			\
> +	((struct acpi_hest_generic_status *)				\
> +	 ((struct ghes_estatus_cache *)(estatus_cache) + 1))
> +
> +#define GHES_ESTATUS_NODE_LEN(estatus_len)			\
> +	(sizeof(struct ghes_estatus_node) + (estatus_len))
> +#define GHES_ESTATUS_FROM_NODE(estatus_node)			\
> +	((struct acpi_hest_generic_status *)				\
> +	 ((struct ghes_estatus_node *)(estatus_node) + 1))
> +
> +#define GHES_VENDOR_ENTRY_LEN(gdata_len)                               \
> +	(sizeof(struct ghes_vendor_record_entry) + (gdata_len))
> +#define GHES_GDATA_FROM_VENDOR_ENTRY(vendor_entry)                     \
> +	((struct acpi_hest_generic_data *)                              \
> +	((struct ghes_vendor_record_entry *)(vendor_entry) + 1))
> +
> +static inline bool is_hest_type_generic_v2(struct ghes *ghes)
> +{
> +	return ghes->generic->header.type == ACPI_HEST_TYPE_GENERIC_ERROR_V2;
> +}
> +
> +/*
> + * A platform may describe one error source for the handling of synchronous
> + * errors (e.g. MCE or SEA), or for handling asynchronous errors (e.g. SCI
> + * or External Interrupt). On x86, the HEST notifications are always
> + * asynchronous, so only SEA on ARM is delivered as a synchronous
> + * notification.
> + */
> +static inline bool is_hest_sync_notify(struct ghes *ghes)
> +{
> +	u8 notify_type = ghes->generic->notify.type;
> +
> +	return notify_type == ACPI_HEST_NOTIFY_SEA;
> +}
> +
> +struct ghes_vendor_record_entry {
> +	struct work_struct work;
> +	int error_severity;
> +	char vendor_record[];
> +};
> +
> +static struct ghes *ghes_new(struct acpi_hest_generic *generic);
> +static void ghes_fini(struct ghes *ghes);
> +
> +static int ghes_read_estatus(struct ghes *ghes,
> +		      struct acpi_hest_generic_status *estatus,
> +		      u64 *buf_paddr, enum fixed_addresses fixmap_idx);
> +static void ghes_clear_estatus(struct ghes *ghes,
> +			struct acpi_hest_generic_status *estatus,
> +			u64 buf_paddr, enum fixed_addresses fixmap_idx);

I'm not sure some of this makes sense in a file named ghes_cper.h
Maybe we just need a different intro comment though.

> +static int __ghes_peek_estatus(struct ghes *ghes,
> +			struct acpi_hest_generic_status *estatus,
> +			u64 *buf_paddr, enum fixed_addresses fixmap_idx);
> +static int __ghes_check_estatus(struct ghes *ghes,
> +			 struct acpi_hest_generic_status *estatus);
> +static int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
> +			u64 buf_paddr, enum fixed_addresses fixmap_idx,
> +			size_t buf_len);
> +
> +#endif /* ACPI_APEI_GHES_CPER_H */
> 


