Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B2DD3E792
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 11:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZE5gMQxi5ialv0YcfS3/n3aNDuHEfuy9b3GVhqdNeyA=; b=1SMTmxSsGJLVQnwDlrfqlCRfIX
	2BYcSjA0PqJ4hka0NRUOmQuukOb3xC03KCEwXFysXmbQ2pqLY16ux4p/GdiGxwDM3o6pS9rcGRlcp
	fMQymNea7x2tZS7QKqE3GJcvfWcigVHRW7WQhFk3/Y6hzPRos/TLAUnFpguzQ6cRm51Uv67hJelxv
	etyVMSJntd4lW27JKXt5dqROrSDco9EHKY41b9K791Q22N7SIx09kT6DMpL5aMSCXPRpafv4ehX4z
	CUL3/Rdrp17Q7E1MN3+7mV89M7z9B1rh7LvN8rgvTSNkTQtFptiqzh5KwwK9b2+SK3b97y1aNurht
	uGfm7n2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTf7C-0000000GYyP-06Zg;
	Thu, 11 Dec 2025 11:45:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTf79-0000000GYxp-0axd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 11:45:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FEEAFEC;
	Thu, 11 Dec 2025 03:45:33 -0800 (PST)
Received: from [10.163.80.88] (unknown [10.163.80.88])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A13493F740;
	Thu, 11 Dec 2025 03:45:38 -0800 (PST)
Message-ID: <e702e529-efe3-41a4-953c-cdf838b4e7c5@arm.com>
Date: Thu, 11 Dec 2025 17:15:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: ptdump: use seq_puts() in pt_dump_seq_puts()
 macro
To: Josephine Pfeiffer <hi@josie.lol>, catalin.marinas@arm.com,
 will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251018170416.3355249-1-hi@josie.lol>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251018170416.3355249-1-hi@josie.lol>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_034543_247429_1D901CF3 
X-CRM114-Status: GOOD (  16.23  )
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

On 18/10/25 10:34 PM, Josephine Pfeiffer wrote:
> The pt_dump_seq_puts() macro incorrectly uses seq_printf() instead of
> seq_puts(). This is both a performance issue and conceptually wrong,
> as the macro name suggests plain string output (puts) but the
> implementation uses formatted output (printf).
> 
> All call sites pass constant strings without format specifiers, so
> using seq_printf() adds unnecessary overhead for format string parsing.
> 
> This bug was introduced in commit ae5d1cf358a5 ("arm64: dump: Make the
> page table dumping seq_file optional") in 2016, where seq_puts() was
> replaced with a new pt_dump_seq_puts() macro that mistakenly used
> seq_printf().
> 
> Fixes: ae5d1cf358a5 ("arm64: dump: Make the page table dumping seq_file optional")
> Signed-off-by: Josephine Pfeiffer <hi@josie.lol>
> ---
>  arch/arm64/mm/ptdump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> index ab9899ca1e5f..a35fcd62bf75 100644
> --- a/arch/arm64/mm/ptdump.c
> +++ b/arch/arm64/mm/ptdump.c
> @@ -35,7 +35,7 @@
>  #define pt_dump_seq_puts(m, fmt)	\
>  ({					\
>  	if (m)				\
> -		seq_printf(m, fmt);	\
> +		seq_puts(m, fmt);	\
>  })
>  
>  static const struct ptdump_prot_bits pte_bits[] = {

LGTM and also did no see any problem while dumping via the
sysfs file /sys/kernel/debug/kernel_page_tables

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

