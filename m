Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48438C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 10:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/naG/xoZwuf2fYA+uBKAM89q9+AO574sF2+gvZbru0=; b=OEOH2/mx8hP/yMAgXg8S4heeFI
	j9fnsb7IB0WwD3VIp5Dlkdw9VlYHVojNso+MAia+GCAlFPwAm71zeQrGEF55xc7Nsf5dIPS2bKL/a
	J2KyCZsZarmpzCrevlEdofEL9xniddkhGKXiGR04XkP8q+Hth4DAstBo6JM7WG2L05MznMu3SX537
	sn+BsOS3F41q3pD1UZ4nIXerV7QU82HOzGvUO4mQzBOChNU6/rJjjfON+YSjDXdU66E3VlExV60l1
	4VptALgG6tEVRECtTR0abQBz9AJdJSjciORf8b8T3Y3c34nqF/SFTDwobanI7t1J45RyyPqynvdUP
	A/c29UYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWSh-00000004dtJ-0fKo;
	Wed, 23 Jul 2025 10:12:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueW7U-00000004ZLf-3gxf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 09:50:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E8E33601E2;
	Wed, 23 Jul 2025 09:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13554C4CEE7;
	Wed, 23 Jul 2025 09:50:35 +0000 (UTC)
Date: Wed, 23 Jul 2025 10:50:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	broonie@kernel.org, yury.khrustalev@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/8] arm64: uaccess: Add additional userspace GCS
 accessors
Message-ID: <aICwaQZxK5Spjj8G@arm.com>
References: <20250719043740.4548-1-jeremy.linton@arm.com>
 <20250719043740.4548-5-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719043740.4548-5-jeremy.linton@arm.com>
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

On Fri, Jul 18, 2025 at 11:37:36PM -0500, Jeremy Linton wrote:
> +/*
> + * Unlike put_user_gcs() above, the use of copy_from_user() may provide
> + * an opening for non GCS pages to be used to source data. Therefore this
> + * should only be used in contexts where that is acceptable.
> + */

Even in user space, the GCS pages can be read with normal loads, so
already usable as a data source if one wants to (not that it's of much
use). So not sure the comment here is needed.

> +static inline u64 load_user_gcs(unsigned long __user *addr, int *err)

Nitpick: name this get_user_gcs() for symmetry with put_user_gcs().

> +{
> +	unsigned long ret;
> +	u64 load = 0;
> +
> +	gcsb_dsync();

Might be worth a comment here, see the one in gcs_restore_signal().

> +	ret = copy_from_user(&load, addr, sizeof(load));
> +	if (ret != 0)
> +		*err = ret;
> +	return load;
> +}

Otherwise the patch looks fine:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

