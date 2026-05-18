Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE45CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ql/TB5Fnvwszgz6NHH2PAJghSE7VzH8sGOmqwzlwv/w=; b=QHcAeaogLNn/zv4tmI9vPfxyhw
	TPHRl5QKuhFVxO7WWY4MU+6zfJKI30OuQeCtLXXq1ldsLRT6SQZDBbaRqEYMdY79gRGhE2seMFUpV
	b0eIdgwtELGF17Nl5q8UA6JFimhmFOMI873Eb2oaSNY8JcovQCjTOyAOgXeiRKG8vyi+fjiMLe+N+
	Z7Vr5fALwLN3V37hGCn4iXj9mDPZGa2RXaZdBitHnUjRFur0PUW5/85tQQHfz3ti1grZKPCgKv3w3
	9rTgU2UHVlLQaKmML9y+yCgqEQy50xe5H5g5yZzAt3DHp15av27wCq4KQACdYtO8mBjM5hn6beawu
	fqSW7fKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOygW-0000000FvwN-0qR4;
	Mon, 18 May 2026 14:11:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOygU-0000000Fvvu-0TvB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:11:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B512143A55;
	Mon, 18 May 2026 14:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7A7C2BCB7;
	Mon, 18 May 2026 14:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779113465;
	bh=dNTK27n/XJgH33ISdED46BJpCMX/A0Twn4BMGEKrFfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rlb+C+7EFLw9iDZnS247E6fEBlfX46YAbiIEoTsYbK6xFuhqtOVkUBjo+AHQrfvVj
	 9QgIyKvL4cM5Y/HOyLKV0RzpnX5wBo2i/bDtQEIMYo75+hV7JP9HhbS+JfXks4isj0
	 MYvpPHTbjEqFlNDxiEL/wi/Fd8W0NP9eWbjb+UUZpSadZvKZlb5nLRgvIZL4+Pvqjd
	 IZirM4JqVL/6ZaEhZVkxBLCTygGt+PXS5/kI0VBmCNkNhmgV6F7iTZxUXnU86fvHFC
	 3f+v16FAbqB6chJdMKbEBRB4fXJj8a/9fZ9Q0JC8UOqgb9veDUgAbY6ZmvNQO1I9D9
	 pJYtzGUL4/aEA==
Date: Mon, 18 May 2026 15:11:01 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm_mpam: add MPAM-Fb MSC firmware access support
Message-ID: <20260518-orchid-bat-of-influence-ae1ccc@sudeepholla>
References: <20260429141339.3171205-1-andre.przywara@arm.com>
 <20260429141339.3171205-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429141339.3171205-4-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_071106_206836_4ECBE1CC 
X-CRM114-Status: GOOD (  17.58  )
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

On Wed, Apr 29, 2026 at 04:13:37PM +0200, Andre Przywara wrote:

[...]

> diff --git a/drivers/resctrl/mpam_fb.c b/drivers/resctrl/mpam_fb.c
> new file mode 100644
> index 000000000000..bfb5798c74b0
> --- /dev/null
> +++ b/drivers/resctrl/mpam_fb.c
> @@ -0,0 +1,158 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2024 Arm Ltd.
> +
> +#include <linux/arm_mpam.h>
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/gfp.h>
> +#include <linux/iopoll.h>
> +#include <linux/list.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/printk.h>
> +#include <linux/processor.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +#include <acpi/pcc.h>
> +
> +#include <asm/mpam.h>
> +
> +#include "mpam_fb.h"
> +
> +#define MPAM_FB_PROTOCOL_ID	0x1a

This is only possible place where referring to SCMI is Okay but good
that you have avoided by keeping it MPAM_FB_PROTOCOL_ID. You can add a
note if that is helpful but other than that remove any reference to SCMI
from this file as it is not needed and might be misleading.

Consider a system that just implements SCMI for sake of MPAM_FB_PROTOCOL
and need not be completely SCMI conformant in terms of base and other
protocol if it is not used on such a system. Using or referring SCMI must
give a misunderstanding that SCMI is needed for this to work.

> +#define MPAM_MSC_ATTRIBUTES_CMD	0x3
> +#define MPAM_MSC_READ_CMD	0x4
> +#define MPAM_MSC_WRITE_CMD	0x5
> +
> +#define MPAM_MSC_PROT_ID_MASK	GENMASK(17, 10)
> +#define MPAM_MSC_TOKEN_MASK	GENMASK(27, 18)
> +
> +#define SCMI_CHAN_RSVD_OFS	0x00
> +#define SCMI_CHAN_STATUS_OFS	0x04
> +#define SCMI_CHAN_STATUS_FREE_BIT	BIT(0)
> +#define SCMI_CHAN_FLAGS_OFS	0x10
> +#define SCMI_CHAN_FLAGS_IRQ		BIT(0)
> +#define SCMI_MSG_LENGTH_OFS	0x14
> +#define SCMI_MSG_HEADER_OFS	0x18
> +#define SCMI_MSG_PAYLOAD_OFS	0x1c
> +

However, there is nothing SCMI specific in all the above, plain PCC shared
memory layout and hence SCMI needs to be dropped. Also you don't need
all these offsets if you use acpi_pcct_ext_pcc_shared_memory directly.

-- 
Regards,
Sudeep

