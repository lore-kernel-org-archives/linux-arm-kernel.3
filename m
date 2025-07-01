Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F993C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 13:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vi34imXRGzxQcpccEc7Cb1qT70rZwUXvUstSvpGv+4k=; b=o07iDxiS2S9uT1P/5DEsOpfPpO
	FGHFoh+J8gp311iMbV3F/41l7SRcJ8294D7sDZfmU5syA5j/d+QbO1gl5C3kud8W2ZQ8y88bpPqRd
	bFsfSgbBb++SwU2VVCvHb5elYAOBiuLRQC8w8tqueBQndP2W+3s3bRmAHcxTSMA5CHkUGP3VAkNZu
	/ESROETFVN4RgHjBJRXCru/Tf95+nzSMfvwofBlVZsn9DGj3+stuNoVcXUpnEERrvHPwwSxHZYy86
	KlvAhSyB4nkZ9xfQ2WzKVPqUrenmdKhBlYYFCRcGtBBL1mhn6sqgLQF5VIELM9sGVwGVDxEzz8FTE
	hH4T7zhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbDA-00000005Y1T-1UrS;
	Tue, 01 Jul 2025 13:39:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZYH-00000004w7X-0cqS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:53:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A72AF45E2E;
	Tue,  1 Jul 2025 11:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E77BC4CEEB;
	Tue,  1 Jul 2025 11:53:26 +0000 (UTC)
Date: Tue, 1 Jul 2025 12:53:23 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Li Chen <me@linux.beauty>, "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Hanjun Guo <guohanjun@huawei.com>, Will Deacon <will@kernel.org>,
	Len Brown <lenb@kernel.org>, Liu Wei <liuwei09@cestc.cn>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ACPI: Return -ENODEV from acpi_parse_spcr() when
 SPCR support is disabled
Message-ID: <aGPMM9Nw2-99sWRL@arm.com>
References: <20250620131309.126555-1-me@linux.beauty>
 <20250620131309.126555-2-me@linux.beauty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620131309.126555-2-me@linux.beauty>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_045329_205954_AFD00767 
X-CRM114-Status: GOOD (  20.43  )
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

On Fri, Jun 20, 2025 at 09:13:07PM +0800, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> If CONFIG_ACPI_SPCR_TABLE is disabled, acpi_parse_spcr()
> currently returns 0, which may incorrectly suggest that
> SPCR parsing was successful. This patch changes the behavior
> to return -ENODEV to clearly indicate that SPCR support
> is not available.
> 
> This prepares the codebase for future changes that depend
> on acpi_parse_spcr() failure detection, such as suppressing
> misleading console messages.
> 
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> ---
>  include/linux/acpi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index f102c0fe34318..71e692f952905 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -1503,7 +1503,7 @@ int acpi_parse_spcr(bool enable_earlycon, bool enable_console);
>  #else
>  static inline int acpi_parse_spcr(bool enable_earlycon, bool enable_console)
>  {
> -	return 0;
> +	return -ENODEV;
>  }
>  #endif

Rafael, are you ok with this patch going via the arm64 tree?

Thanks.

-- 
Catalin

