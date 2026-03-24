Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08B4FEC0EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0y69qIEGCPqFuuJ2Tzr1X5t4bRXW9fTU1QTOCs5F7a8=; b=PigxaTbh1LLmYRUDw924cLDh7w
	v42vwJJBdxJf/eHJnMEhakARUTQ+to+aGI1D9snY71CYFSVyrW1HZilY61hpB3UyDjRVrRVnpZKMs
	iTPwk1l4an6eisWjvWA97G9GMs9Jz2lTeZhHvntOWb9e6sxDeFvl8reWp2vMymdItmeKo/9je1g8t
	Zukm7YySQyVwMRtINuvrhrbKzMxZF1oUPxr13V5sUUQwrVp5VQvg+1OyrUJncz5QlXjuT5WjlxTS2
	QWAT1NiBaWtDmAmSmsuQNZ7WIFkYqTS1avdDBXsdwvsYb3GaQVJpgzgSAEfR72a3KLPO+lkTXx57a
	BNfesp9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55Z6-00000001zzd-21t1;
	Tue, 24 Mar 2026 17:29:16 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55Z2-00000001zya-1eGl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 17:29:14 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fgH7X02xyzHnH5b;
	Wed, 25 Mar 2026 01:28:24 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id BC76F40587;
	Wed, 25 Mar 2026 01:28:57 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Mar
 2026 17:28:56 +0000
Date: Tue, 24 Mar 2026 17:28:55 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ahmed Tiba <ahmed.tiba@arm.com>
CC: <linux-acpi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-cxl@vger.kernel.org>, <Michael.Zhao2@arm.com>, <robh@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Dmitry.Lamerov@arm.com>,
	<rafael@kernel.org>, <conor@kernel.org>, <will@kernel.org>, <bp@alien8.de>,
	<catalin.marinas@arm.com>, <krzk+dt@kernel.org>, <linux-doc@vger.kernel.org>,
	<mchehab+huawei@kernel.org>, <tony.luck@intel.com>
Subject: Re: [PATCH v3 01/10] ACPI: APEI: GHES: share macros via a private
 header
Message-ID: <20260324172855.000032fb@huawei.com>
In-Reply-To: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-1-48e6a1c249ef@arm.com>
References: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-0-48e6a1c249ef@arm.com>
	<20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-1-48e6a1c249ef@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_102912_589944_0B776BF8 
X-CRM114-Status: GOOD (  14.22  )
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

On Wed, 18 Mar 2026 20:47:58 +0000
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Carve the CPER helper macros out of ghes.c and place them in a private
> header so they can be shared with upcoming helper files. This is a
> mechanical include change with no functional differences.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>

> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
> new file mode 100644
> index 000000000000..a38e3440b927
> --- /dev/null
> +++ b/include/acpi/ghes_cper.h
> @@ -0,0 +1,103 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Shared GHES declarations for firmware-first CPER error handling.
> + *
> + * This header groups the GHES declarations that are needed by the shared
> + * CPER handling path.
shared CPER is unclear.  Start with something broad like:

GHES declarations are used both for ACPI APEI handling and xyz.

I'm not sure I'd put any additional justification here beyond such a
simple sentence.

> + *
> + * The split lets GHES and other firmware-first error sources use the same

I would consider rewriting this.  What split?  Not obvious from what you have
in this header.

> + * code for reading status blocks, caching records, handling vendor data,
> + * and reporting errors, so the non-ACPI path follows the same behavior as
> + * GHES instead of carrying a separate copy.
> + *
> + * Derived from the ACPI APEI GHES driver.
> + *
> + * Copyright 2010,2011 Intel Corp.
> + *   Author: Huang Ying <ying.huang@intel.com>
> + */
> +



