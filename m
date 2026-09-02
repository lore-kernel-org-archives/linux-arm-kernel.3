Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F21C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLwTs9xmppUKbdi2bOeMvZ/h5qCESqEMBwuZx9TeGpQ=; b=qsrF02u/h7HUonAx9aJYZA4MGF
	fQMk22yag0uSIoc+FqkjsWzraGRw9h+1zO6EtpzicC1O0YhmBUG1sNAGesB6ypsBcJw6CdcWV799f
	HUcqeTjwIZgb8OKRcUQsgEiUs7fCe466C3mCiKoo30hDdiqidqyIgXu37pB3g9I9S1CzIOf23nJRO
	lusSofCzyYDi0iGFRL77Vi3biAPh7VVZT8vovOE7EtK/c2blaiM3l+7PqB51/m+IvT4dTOC5Zu7sH
	grnMaKcqiP3+wa2gzCDqc7XgVB143nRYapAHMAq6IHMu/a+1BF6ZzWRy4P1VtNU1CiQOKDRyi0Ou1
	Nc7/lhyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jQ8-0000000EY0r-0RAD;
	Wed, 02 Sep 2026 11:46:24 +0000
Received: from out-90.mta1.migadu.com ([2001:41d0:203:375::5a] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jQ5-0000000EY03-0okw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:46:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=wWMAcNmrAmsZ+u6qURkfvNyJUvvkqHqQ8/i9M/fpIzU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788349578; v=1; x=1788954378;
 b=q91snjZY3waE9GdJpAKriw9pR+9Z8JJtkTRxrSlEJUEfC1cK3gCEhPmlDboaRXVdLkhnRoUS
 Ifjbth7fncOxxaekV+kbUW5N+JFBUcqw2p+z2ECroW6EhHLWGCtdmGzg6vMQh32BBgUrZ8VP8zg
 dZgwRR+exOqk3AJQ/2RGdIpk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b5cf6b654d3c87d5;
	Wed, 02 Sep 2026 11:46:17 +0000
X-Mizu-Trace-ID: b5cf6b654d3c87d5
X-Migadu-Flow: FLOW_OUT
Message-ID: <4a941947-04c5-4be8-9d69-3c131775d307@linux.dev>
Date: Wed, 2 Sep 2026 19:46:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: errata: pass REVIDR when matching target
 implementation CPUs
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Oliver Upton
 <oupton@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260831105444.4065831-1-khushit.shah@nutanix.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260831105444.4065831-1-khushit.shah@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_044621_423518_0C26FC06 
X-CRM114-Status: GOOD (  14.70  )
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

On 8/31/26 6:54 PM, Khushit Shah wrote:
> When target implementation CPUs are provided, is_affected_midr_range()
> accidentally passed the MIDR as both arguments to __is_affected_midr_range(),
> so the REVIDR mask check operated on the wrong register.
> 
> Pass REVIDR as intended.
> 
> Fixes: 86edf6bdcf05 ("smccc/kvm_guest: Enable errata based on implementation CPUs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
>  arch/arm64/kernel/cpu_errata.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 5db8f0619e4b..b33dccfafaf8 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -82,7 +82,7 @@ is_affected_midr_range(const struct arm64_cpu_capabilities *entry, int scope)
>  
>  	for (i = 0; i < target_impl_cpu_num; i++) {
>  		if (__is_affected_midr_range(entry, target_impl_cpus[i].midr,
> -					     target_impl_cpus[i].midr))
> +					     target_impl_cpus[i].revidr))
>  			return true;
>  	}
>  	return false;

Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Thanks,
Zenghui

