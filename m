Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0ABC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 15:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTV8+yiU3k6de+WXb2mc3kleT5uKD/pTgFM6tA8U944=; b=DpT3O7xhNStlImXm/I9qPlTYLb
	MgyoSJEr0886fLBJOsTGfGxwWNnqA1ybN0K42ZmcTv9LCgqT/ZWer/Ue0ljC5/G1tqyTT8xYTf+jZ
	ovU7ATdWAIGdmon9jOArwjDJX8Om8YSsRHBU17tPJmVyUNq1rsZZaLbqpgaWM2aRr15nxRVXBbnDK
	7YKEeIuKno9D1qDHtLRQIe/bFSd4evuFg2ljVBlpZmGGSdZOMXT3Vq+u+DTZoQqCguYfw6MXpwex3
	aEOSk97WM4ISUqfEYSxhtvzWTulm6l4t4Bl3uOwECI2QPLNQH63ZpzeLSpTTLornJCoyX6QM1uXP9
	oJpppIhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpovQ-0000000Csf8-1Ihe;
	Fri, 31 Jul 2026 15:13:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpovO-0000000Csea-1zXc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 15:13:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8154D6004E;
	Fri, 31 Jul 2026 15:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60F21F000E9;
	Fri, 31 Jul 2026 15:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785510805;
	bh=MTV8+yiU3k6de+WXb2mc3kleT5uKD/pTgFM6tA8U944=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HxP/lZcOvqnIe4XpjhtStBYWqaYQt6Y3gGgUIo5MSchImNpRdjJiq647xJ9Bm1fQe
	 wZwB97DxcT/x2LqDiRkFzzd7mCXIE1zcD3ZIQVgHfOLQKtK/R3R/eRTByRvM06K0f6
	 Z+BotDBFfnogB147dv4WBKlWTudpymSgZXBCZ2q3chljlWjkGdyk7lnRyDpLXPVaC4
	 wainOZ6tHOCQnCM7iKE0XGVHraLbCcQIdlY/q8P8E6+iLVqUVzwR54QgwSrtse35O+
	 otxVUJE1lbqGrHAgk+0SJxnVuxVbimCC6b0KcEBU3ybTKO2YVWEou/0xjKt9u5/s7H
	 Xnsp+Qi9W1L5A==
Date: Fri, 31 Jul 2026 16:13:20 +0100
From: Will Deacon <will@kernel.org>
To: Linu Cherian <linu.cherian@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4 6/6] arm64: cpufeature: Detect BBML3 based on
 ID_AA64MMFR2_EL1.BBM
Message-ID: <amy7kPXnaPHmWMwc@google.com>
References: <20260723044034.2983651-1-linu.cherian@arm.com>
 <20260723044034.2983651-7-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723044034.2983651-7-linu.cherian@arm.com>
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

On Thu, Jul 23, 2026 at 10:10:33AM +0530, Linu Cherian wrote:
> Add ID_AA64MMFR2_EL1.BBM based BBML3 feature detection in
> cpu_supports_bbml3() so that cpus with the feature would
> not have to be added into MIDR based supports_bbml3_list.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>  arch/arm64/kernel/cpufeature.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 896bafdb00b1..dbd7d187520c 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2133,6 +2133,12 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
>  
>  bool cpu_supports_bbml3(void)
>  {
> +	u64 mmfr2;
> +
> +	mmfr2 = __read_sysreg_by_encoding(SYS_ID_AA64MMFR2_EL1);
> +	if (SYS_FIELD_GET(ID_AA64MMFR2_EL1, BBM, mmfr2) >= ID_AA64MMFR2_EL1_BBM_3)
> +		return true;

This is a bit of a nit, but I think it would be more consistent to use
has_cpuid_feature() here instead of __read_sysreg_by_encoding(), similarly
to how we handle kpti in unmap_kernel_at_el0() (which also has both an
ID register field and a list of MIDRs).

Will

