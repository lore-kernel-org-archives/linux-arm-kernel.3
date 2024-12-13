Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E65E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1rNdYHDYoiCGuHVL3rWEPS5yGZ79mGZop8iOafjBsg=; b=dxTcFF+U2VMr3OyVN3ZT2Idl4T
	rzkMeKCq0kHLxZlhhacwe5bgIiKEQUpgUdmG++AEHVmkarSjUsvSoX1ldI8XQRawGil8ahbgcYZo0
	2263t342As4lrc3jytz+heLet66PUie5onHXabcQzz6nQL6CNIKfzsDuqfgaDVxqNUQZkB/mohgic
	kjDU8PUBDLBcL7fm7+Xwe8oJObTtoby3hBoTC6qD1F1gIuyIqJFAjBU9OYCsUzOuExKo+TkiIMZWL
	AO0D6pYHGxDag/lDz7FIybJNWPQoSmOltW7weekGRaWVsNA+gm8eBD8HIK6u7/jvWuTtj0Xs053zZ
	4fmoUUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8W6-00000004P4X-26UU;
	Fri, 13 Dec 2024 16:27:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8V2-00000004OvY-0Smt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:26:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4512D5C6142;
	Fri, 13 Dec 2024 16:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16AEFC4CED0;
	Fri, 13 Dec 2024 16:26:41 +0000 (UTC)
Date: Fri, 13 Dec 2024 16:26:40 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] arm64/signal: Silence sparse warning storing GCSPR_EL0
Message-ID: <Z1xgQGNZzR6h0Uly@arm.com>
References: <20241211-arm64-gcs-signal-sparse-v2-1-c22f37216135@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-arm64-gcs-signal-sparse-v2-1-c22f37216135@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_082644_188309_4E7502E0 
X-CRM114-Status: GOOD (  16.64  )
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

On Wed, Dec 11, 2024 at 01:00:35AM +0000, Mark Brown wrote:
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> index 14ac6fdb872b9672e4b16a097f1b577aae8dec50..08d51fabdb9d47c848f14c9b25d6be04f109c2ee 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -39,7 +39,7 @@
>  #ifdef CONFIG_ARM64_GCS
>  #define GCS_SIGNAL_CAP(addr) (((unsigned long)addr) & GCS_CAP_ADDR_MASK)
>  
> -static bool gcs_signal_cap_valid(u64 addr, u64 val)
> +static bool gcs_signal_cap_valid(unsigned long __user *addr, u64 val)
>  {
>  	return val == GCS_SIGNAL_CAP(addr);
>  }

Another personal preference - addresses should be (unsigned long),
pointer to be accessed (... __user *). But we could even scrap this
function, there's a single caller to a one-line function.

> @@ -1094,15 +1094,15 @@ static int gcs_restore_signal(void)
>  	/*
>  	 * Check that the cap is the actual GCS before replacing it.
>  	 */
> -	if (!gcs_signal_cap_valid((u64)gcspr_el0, cap))
> +	if (!gcs_signal_cap_valid(gcspr_el0, cap))
>  		return -EINVAL;
>  
>  	/* Invalidate the token to prevent reuse */
> -	put_user_gcs(0, (__user void*)gcspr_el0, &ret);
> +	put_user_gcs(0, gcspr_el0, &ret);
>  	if (ret != 0)
>  		return -EFAULT;
>  
> -	write_sysreg_s(gcspr_el0 + 1, SYS_GCSPR_EL0);
> +	write_sysreg_s((__force u64)(gcspr_el0 + 1), SYS_GCSPR_EL0);
>  
>  	return 0;
>  }

Looking through the code, do we have a similar problem in
gcs_signal_entry()? Or do we rely on sparse ignoring (unsigned long)
casts?

Whichever way we go, I think we should have consistency between these
two functions.

-- 
Catalin

