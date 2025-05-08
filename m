Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62105C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwi7sCtDX51ZGKS5LVFhbnLaBH9GwDYSvsuCgTwEto8=; b=QN9uFWy8njXroy
	BDB//CAHbC5uTNLFy+NaFjUPs7ZacUPuUDJt7GbUKRjJdfMz8RaaAVu6JT+9yd0Cxid0oqC87akrO
	mZbBR9qOUoBOFT8J5p/yW+9l+A+BaQv1q7xDp+VQJM2Idei/CzpFwC4KbccfVf8USoS6xV72pfLgU
	SuSk/VSVdVMlZefKrY0XzoOGNMeJSSCaJSO8LKJf6l466LGLiHZzo/wIaYq1tCzMVbhdwoLJuNrkY
	pRbhN58GWXdT1S4UKnW6zzp7s+0iB9UyQHwRqDTttV3BHSNBfUyXzNAQSuAzsF270dS14GbFzmZB4
	1sx3BWY7zm0n6RkN69gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2BZ-00000000uWR-3ZhP;
	Thu, 08 May 2025 14:25:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1W4-00000000mqd-17Lr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:42:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EE4E106F;
	Thu,  8 May 2025 06:42:11 -0700 (PDT)
Received: from [10.1.26.156] (e137867.arm.com [10.1.26.156])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B1C33F58B;
	Thu,  8 May 2025 06:42:20 -0700 (PDT)
Message-ID: <6e861958-da74-4761-abb6-c7f3b56f7784@arm.com>
Date: Thu, 8 May 2025 14:42:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64/debug: Drop redundant DBG_MDSCR_* macros
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250508044752.234543-1-anshuman.khandual@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250508044752.234543-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_064224_351122_3A748A50 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Anshuman,

On 08/05/2025 05:47, Anshuman Khandual wrote:

> MDSCR_EL1 has already been defined in tools sysreg format and hence can be
> used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
> macros become redundant and hence can be dropped off completely. While here
> convert all variables handling MDSCR_EL1 register as u64 which reflects its
> true width as well.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc5
>
> Changes in V2:
>
> - Changed reg, val width to u64 in cortex_a76_erratum_1463225_svc_handler() per Ada
> - Changed mdscr register width to uint64_t in enable_monitor_debug_exceptions() and
>    install_ss() per Ada

Thanks for the changes, the patch looks good to me now !

Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>



