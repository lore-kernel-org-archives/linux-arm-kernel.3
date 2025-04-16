Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FB6C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUZKWP3ewgLZXU4a4yPXkLTdqXeE8hSKRmsLBc6WKYc=; b=rakGZx7ADXuZJjBPLAL4nJcBCr
	NHs7OgBKmxhyl1ESaGtSVQljDRwh3B7VseQCm3shv2JtDblnv2EBH8V0HPxjT8+HUhaSX0tK6TDdg
	TKKf8DbiUBnd/cmZigrSEiPCthXNmx8gsNCUbgcOWv7n56EAwSbCMluI2Z6t4hjnJkAwNGQncYPPc
	sOSp8EM9jcZ6LXqsemsz7GPUdbMvUmPewAZqjMjHnDohDt1HhRlhPpm2eFjnAsoco7lYtsW/GFeXO
	DY6Kcu03QlVBi5OdT/c5BkIh0wQ6Yn9KKcm3sbx+HIig4vXb6MBxNyjx7ITR3ousknOJ/CML8dbjv
	Y3LBh+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55oc-0000000AIXJ-1ydm;
	Wed, 16 Apr 2025 16:40:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55Bp-0000000AAiE-1Fyg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C264EA4A25A;
	Wed, 16 Apr 2025 15:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B43C4CEE2;
	Wed, 16 Apr 2025 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744819239;
	bh=Vz6bk6YGvtsRN2ZEQVaZ0sI/BeiXUIfOnij8CvC8Fuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CImHhWh71IJT8+4R26J6xICoE//1H58e6w3PjnHDwH2nMhUIdie79qzCkxzQ4nzDA
	 rXzhVycoO+M1KZfnWUCNPYw8wSV7Bi8sA4vpi3izzWzIit6zbmqV60IE7zSScr/pLE
	 e5eRoOM9KhD6tZjYZkqe06bDizHxkMRmkH+nPbLj5IKGTKRVDOwwHXL0IkXc2zAXQF
	 vOCp2SD7Iy0mM51VxfrTJ7B5H4n+XFdVklxldigYiSEny8qOz1hv9OOJRiSH47A2W4
	 sLXLz3NYzlJ5/R+CzQQPRnb8/5jwYGQUYKai2SIjiflg29VI6zrr/MZFZwTB7dkvZt
	 U8fLtBQ2KXZqw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u55Bl-000000007DM-3BB9;
	Wed, 16 Apr 2025 18:00:38 +0200
Date: Wed, 16 Apr 2025 18:00:37 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <Z__UJUKaMRoFLYLc@hovoldconsulting.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-3-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415142933.1746249-3-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_090041_478864_F6141407 
X-CRM114-Status: GOOD (  25.77  )
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

On Tue, Apr 15, 2025 at 03:29:31PM +0100, Cristian Marussi wrote:
> Add a common framework to describe SCMI quirks and associate them with a
> specific platform or a specific set of SCMI firmware versions.
> 
> All the matching SCMI quirks will be enabled when the SCMI core stack
> probes and after all the needed SCMI firmware versioning information was
> retrieved using Base protocol.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> RFC->V1
> - added handling of impl_ver ranges in quirk definition
> - make Quirks Framework default-y
> - match on all NULL/0 too..these are quirks that apply always anywhere !
> - depends on COMPILE_TEST too
> - move quirk enable calling logic out of Base protocol init (triggers a
>   LOCKDEP issues around cpu locks (cpufreq, static_branch_enable interactions..)

> +static void scmi_enable_matching_quirks(struct scmi_info *info)
> +{
> +	struct scmi_revision_info *rev = &info->version;
> +	const char *compatible = NULL;
> +	struct device_node *root;
> +
> +	root = of_find_node_by_path("/");
> +	if (root) {
> +		of_property_read_string(root, "compatible", &compatible);

Looks like you still only allow matching on the most specific compatible
string.

As we discussed in the RFC thread, this will result in one quirk entry
for each machine in a SoC family in case the issue is not machine
specific.

> +		of_node_put(root);
> +	}
> +
> +	/* Enable applicable quirks */
> +	scmi_quirks_enable(info->dev, compatible,
> +			   rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);
> +}

> +static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
> +{
> +	const char *last, *first = quirk->impl_ver_range;
> +	size_t len;
> +	char *sep;
> +	int ret;
> +
> +	quirk->start_range = 0;
> +	quirk->end_range = 0xFFFFFFFF;
> +	len = quirk->impl_ver_range ? strlen(quirk->impl_ver_range) : 0;
> +	if (!len)
> +		return 0;
> +
> +	last = first + len - 1;
> +	sep = strchr(quirk->impl_ver_range, '-');
> +	if (sep)
> +		*sep = '\0';
> +
> +	if (sep == first) // -X
> +		ret = kstrtouint(first + 1, 0, &quirk->end_range);
> +	else // X OR X- OR X-y
> +		ret = kstrtouint(first, 0, &quirk->start_range);
> +	if (ret)
> +		return ret;
> +
> +	if (!sep)
> +		quirk->end_range = quirk->start_range;
> +	else if (sep != last) //x-Y

nit: space after // (if you insist on using c99 comments)

> +		ret = kstrtouint(sep + 1, 0, &quirk->end_range);
> +
> +	if (quirk->start_range > quirk->end_range)
> +		return -EINVAL;
> +
> +	return ret;
> +}

> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * System Control and Management Interface (SCMI) Message Protocol Quirks
> + *
> + * Copyright (C) 2025 ARM Ltd.
> + */
> +#ifndef _SCMI_QUIRKS_H
> +#define _SCMI_QUIRKS_H
> +
> +#include <linux/static_key.h>
> +#include <linux/types.h>
> +
> +#ifdef CONFIG_ARM_SCMI_QUIRKS
> +
> +#define DECLARE_SCMI_QUIRK(_qn)						\
> +	DECLARE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn)
> +
> +#define SCMI_QUIRK(_qn, _blk)						\
> +	do {								\
> +		if (static_branch_unlikely(&(scmi_quirk_ ## _qn)))	\
> +			(_blk);						\
> +	} while (0)
> +
> +void scmi_quirks_initialize(void);
> +void scmi_quirks_enable(struct device *dev, const char *compat,
> +			const char *vend, const char *subv, const u32 impl);
> +
> +#else
> +
> +#define DECLARE_SCMI_QUIRK(_qn)
> +#define SCMI_QUIRK(_qn, _blk)

As I mentioned earlier, wouldn't it be useful to always compile the
quirk code in order to make sure changes to surrounding code does not
break builds where the quirks are enabled?

For example, by adding something like

#define SCMI_QUIRK(_qn, _blk)						\
	do {								\
		if (0)							\
			(_blk);						\
	} while (0)

here?

I didn't really review this in detail, but it seems to work as intended
when matching on vendor and version:

Tested-by: Johan Hovold <johan+linaro@kernel.org>

