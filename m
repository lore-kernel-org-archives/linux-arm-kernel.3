Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C17FCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 13:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taKCx9Nb2TPnSGhHCZQBj99OEa8LzQ1Cza/JYYLK7UI=; b=uDUQ6rLxe+J/pfRP0k/hRWQqpM
	3AMS05hsa7p/wjVOwGNBxYvFcBpqKfPTmnGV67wLutQGlEmo8GVpzbe+NkLaF6ROzwU1YdpiBbSah
	A0keuAi2SUrxBD2jjY0ihozO8pw/irrdI5JGer1QCTF8i4X0DFx5F5RuXoKXJQGG6DvGEaOd4vdk3
	W9V2lwwqFIoaXpFmimGk6SiUqM+xi/MOfbBj1yGRGoEZc+cNQzkVkIkaIGxnAH3caEQp0EcUiS5Wv
	0cpAQPh1VTklKpdCMaAx8A5E/oW7uU3gY4Y4i3CTbWxm7qYjJSPw+znBRzS+QvJ5wD5MHQliKGIUN
	5OAeS+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNW1y-00000005aoP-1xPp;
	Thu, 14 May 2026 13:23:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNW1w-00000005anZ-10Iz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 13:23:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 333281762;
	Thu, 14 May 2026 06:23:05 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BDAA3F836;
	Thu, 14 May 2026 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778764990; bh=52lWMczGKHZvEJn7oAy5U2Gjb81vsaAdQyKAug/jxIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcQTSWwmow5qyPzQbZ75EveQmTxgqPM2UdSpBqi7eQnlwFLAGQ/YXnmnH1rg/pkfg
	 OYimjJRdH5gb4e+D/Xu6TEaYnxSUtEA4ky2sS6g+efEhXcciz/318ClKBtWQx5IzTR
	 wrALKYw4YlhnPiMuHinwCzEzy/0prDOnHzVuM6HY=
Date: Thu, 14 May 2026 14:23:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <agXMuSIGAEXz88xY@arm.com>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514094030.42495-2-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_062312_365531_B4CAF0CF 
X-CRM114-Status: GOOD (  13.40  )
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

On Thu, May 14, 2026 at 03:10:28PM +0530, Aneesh Kumar K.V (Arm) wrote:
> diff --git a/drivers/firmware/smccc/rmm.h b/drivers/firmware/smccc/rmm.h
> new file mode 100644
> index 000000000000..a47a650d4f51
> --- /dev/null
> +++ b/drivers/firmware/smccc/rmm.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _SMCCC_RMM_H
> +#define _SMCCC_RMM_H
> +
> +#include <linux/platform_device.h>
> +
> +#ifdef CONFIG_ARM64
> +#include <asm/rsi_cmds.h>
> +void __init register_rsi_device(struct platform_device *pdev);
> +#else
> +
> +static void __init register_rsi_device(struct platform_device *pdev)

Nit: static inline here (I think Sashiko mentioned it on a previous
version.

> +{
> +
> +}

And unnecessary empty line between curly braces.

Just these notpicks for now. Suzuki and Sudeep already covered the
splitting of this patch and we need to agree on the sysfs hierarchy.

-- 
Catalin

