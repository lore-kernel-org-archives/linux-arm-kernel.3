Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A65F3C991
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9Krqet/w+WruYW9U6+bIPUbLQY4fGgqZ1DYvOfOZNg=; b=YRLXvXhzw2Sa36OSMipnkT6lIp
	0eiV6ZELwrSPuNfo9Qc7Z5lY8REwW7Y+aCbVrlzx0WKX5i9Xil+crM0x/Z0oUu24Yf4i5D/wyAGQm
	9jmW1LMHfAZuOK+Iez8mWpcXP8jSLZfGLiaKSN1pLYw1am0n+JTUFHInVR6drdkC/2cT09Uji2don
	LQ6xzsWZp83eP4DfOQt7/Zp5BAMQt1t7w9KX91kKYbrbZOL2g1c060crP3IqkQ3Xj7QAh682uU6HX
	OBDYd+yPxFmM1YwhLGED1IJmFaSEs4jipKrWh6Q7/olIQDzNfNU0jATB/fUthN89/8viiN3apJoYg
	Jxjw21IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuOi-00000002K9m-39u5;
	Tue, 24 Feb 2026 15:32:28 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuOg-00000002K9O-0EKj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:32:27 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fL1tB2VYdzJ46Bq;
	Tue, 24 Feb 2026 23:32:02 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 1ED894056A;
	Tue, 24 Feb 2026 23:32:24 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Feb
 2026 15:32:23 +0000
Date: Tue, 24 Feb 2026 15:32:21 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ahmed Tiba <ahmed.tiba@arm.com>
CC: <devicetree@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<Dmitry.Lamerov@arm.com>, <catalin.marinas@arm.com>, <bp@alien8.de>,
	<robh@kernel.org>, <rafael@kernel.org>, <will@kernel.org>,
	<conor@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <krzk+dt@kernel.org>, <Michael.Zhao2@arm.com>,
	<tony.luck@intel.com>
Subject: Re: [PATCH v2 03/11] ACPI: APEI: GHES: move CPER read helpers
Message-ID: <20260224153221.00000420@huawei.com>
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-3-347fa2d7351b@arm.com>
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
	<20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-3-347fa2d7351b@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_073226_401543_6C27FEAA 
X-CRM114-Status: GOOD (  20.37  )
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

On Fri, 20 Feb 2026 13:42:21 +0000
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Relocate the CPER buffer mapping, peek, and clear helpers from ghes.c into
> ghes_cper.c so they can be shared with other firmware-first providers.
> This commit only shuffles code; behavior stays the same.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
Hi Ahmed,

Most of the comments in here are about changing the patch break up.
Basic suggest approach is move stuff as it is needed, not in advance of
that need.  So when you move the function to the c file, only then add what
it needs to the includes / header.

Jonathan

> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
> index 63047322a3d9..7e0015e960c1 100644
> --- a/drivers/acpi/apei/ghes_cper.c
> +++ b/drivers/acpi/apei/ghes_cper.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   *
> - * APEI GHES CPER helper translation unit - staging file for helper moves
> + * APEI GHES CPER helper translation unit - code mechanically moved from ghes.c

In the long run, no interest in where it came from. People can
look at the git history for that. 

>   *
>   * Copyright (C) 2026 ARM Ltd.
>   * Author: Ahmed Tiba <ahmed.tiba@arm.com>
> @@ -17,10 +17,176 @@
>  #include <linux/slab.h>
>  
>  #include <acpi/apei.h>
> +#include <acpi/ghes_cper.h>
>  
>  #include <asm/fixmap.h>
>  #include <asm/tlbflush.h>
>  
>  #include "apei-internal.h"
>  
> -/* Helper bodies will be moved here in follow-up commits. */

If you just do the file creation with this first move, then we don't get churn of
comments like this one.

> +/* Read the CPER block, returning its address, and header in estatus. */
> +int __ghes_peek_estatus(struct ghes *ghes,
> +			       struct acpi_hest_generic_status *estatus,
> +			       u64 *buf_paddr, enum fixed_addresses fixmap_idx)
> +{
> +	struct acpi_hest_generic *g = ghes->generic;
> +	int rc;
> +
> +	rc = apei_read(buf_paddr, &g->error_status_address);
> +	if (rc) {
> +		*buf_paddr = 0;
> +		pr_warn_ratelimited(FW_WARN GHES_PFX
> +"Failed to read error status block address for hardware error source: %d.\n",

Unusual indenting.  I'd just fix that whilst you are here. Don't worry about long line.

> +				   g->header.source_id);
> +		return -EIO;

> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
> index 2597fbadc4f3..2e3919f0c3e7 100644
> --- a/include/acpi/ghes_cper.h
> +++ b/include/acpi/ghes_cper.h
> @@ -74,21 +74,21 @@ struct ghes_vendor_record_entry {
>  	char vendor_record[];
>  };
>  
> -static struct ghes *ghes_new(struct acpi_hest_generic *generic);
Huh. Static forward declarations in a header?  That never made sense. Fix it in the
earlier patch and remove the statics from the declarations.

Actually no, just bring them into the header only when you need to. So as part
of the patch that moves the caller or the function.



> -static void ghes_fini(struct ghes *ghes);
> +struct ghes *ghes_new(struct acpi_hest_generic *generic);
> +void ghes_fini(struct ghes *ghes);
>  
> -static int ghes_read_estatus(struct ghes *ghes,
> +int ghes_read_estatus(struct ghes *ghes,
>  		      struct acpi_hest_generic_status *estatus,
>  		      u64 *buf_paddr, enum fixed_addresses fixmap_idx);
> -static void ghes_clear_estatus(struct ghes *ghes,
> +void ghes_clear_estatus(struct ghes *ghes,
>  			struct acpi_hest_generic_status *estatus,
>  			u64 buf_paddr, enum fixed_addresses fixmap_idx);
> -static int __ghes_peek_estatus(struct ghes *ghes,
> +int __ghes_peek_estatus(struct ghes *ghes,
>  			struct acpi_hest_generic_status *estatus,
>  			u64 *buf_paddr, enum fixed_addresses fixmap_idx);
> -static int __ghes_check_estatus(struct ghes *ghes,
> +int __ghes_check_estatus(struct ghes *ghes,
>  			 struct acpi_hest_generic_status *estatus);
> -static int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
> +int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
>  			u64 buf_paddr, enum fixed_addresses fixmap_idx,
>  			size_t buf_len);
>  
> 


