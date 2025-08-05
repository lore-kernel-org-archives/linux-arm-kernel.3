Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF49EC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvxlP81aKz8S/NAeTbKmd9r5u+msKQDBBxTVogFOe54=; b=sqXFc+bFO03ULO
	uPSM4abReGkkHK2AUh/SL97uJrIm8JAcx4c4wvroX34JTudpM1EQlTrGEvMobV7EZxLBM/uD0WPTi
	+YB25sCp576DqXWPZ2Z+WnoNViOaIcjEK+jLPO0G0s/PhWjhle0X9SonOwuSQxzuQz3Uh6mfpXGrM
	RE8B/QFE2oxsDvqa6FvpUZt5n9jdBp+IFkCh9ds2LzRlC4Na2lOT1rFBUU5pICFhnXo+fYpqMSTi9
	goqG+9zbcFsKS/R0SFRUI3qPCFbkPmAA2BhgttfixK+hz2TWTVPTEESTRBVDBU1egTTUZJH5F5nuD
	8DsJf0soKfpy6Nu7EdPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKAi-0000000DEJR-3zn4;
	Tue, 05 Aug 2025 16:05:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJEk-0000000D65B-3vsA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:06:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C11B1424;
	Tue,  5 Aug 2025 08:05:48 -0700 (PDT)
Received: from [10.1.29.177] (e137867.arm.com [10.1.29.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D55FA3F673;
	Tue,  5 Aug 2025 08:05:51 -0700 (PDT)
Message-ID: <beb7e8f2-39f8-499f-a173-b8bf2d3296ea@arm.com>
Date: Tue, 5 Aug 2025 16:05:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 1/7] arm64: ptrace: Replace interrupts_enabled()
 with regs_irqs_disabled()
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-2-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250729015456.3411143-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_080559_031651_072E7FF2 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: mark.rutland@arm.com, sstabellini@kernel.org, puranjay@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, liaochang1@huawei.com, oleg@redhat.com, kristina.martsenko@arm.com, linux-kernel@vger.kernel.org, broonie@kernel.org, chenl311@chinatelecom.cn, xen-devel@lists.xenproject.org, leitao@debian.org, ryan.roberts@arm.com, akpm@linux-foundation.org, mbenes@suse.cz, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 29/07/2025 02:54, Jinjie Ruan wrote:

> The generic entry code expects architecture code to provide
> regs_irqs_disabled(regs) function, but arm64 does not have this and
> provides inerrupts_enabled(regs), which has the opposite polarity.
Nit: "interrupts_enabled(regs)"
> In preparation for moving arm64 over to the generic entry code,
> relace arm64's interrupts_enabled() with regs_irqs_disabled() and
> update its callers under arch/arm64.
>
> For the moment, a definition of interrupts_enabled() is provided for
> the GICv3 driver. Once arch/arm implement regs_irqs_disabled(), this
> can be removed.
>
> Delete the fast_interrupts_enabled() macro as it is unused and we
> don't want any new users to show up.
>
> No functional changes.
>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
Otherwise looks good to me !
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

