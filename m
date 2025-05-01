Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4310FC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 11:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XqJTYM3iJZfx02nqatQ9/bBAklljGooRy22NXfs7NCc=; b=LnLzwYyFjXfUAy
	/AUKgga9oKqzAc+woMnrsWyml+aRk07tUuLxvreehDiyaD90ZlqneeIJLFQH2zWPni9W87R+vGGBH
	1tLrhFxTVTCjJXILDt+v3y4a6FRmblV12YoaTJ7d5VLhnvRf3baX0r88o+0zCrz/XU3EkS/ypjuBI
	0ugFn+upiARBz7OA6yxQnl9xkuepmpQVgrSyUmiBcZiTN3JEpj6irqdww/ku/5Nlove0UuRN6S94U
	N2U2fUdlu+Tv9BCp77g9WWNe3erlWTbO8LUZ5wkAc/cp/J9S45QUcsCM9TxOS01Gw6NeZkeYfmH94
	IKg8CTXIDoMibMhnHIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARuz-0000000FGeF-15xK;
	Thu, 01 May 2025 11:17:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARt2-0000000FGIe-181Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:15:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EAA9106F;
	Thu,  1 May 2025 04:15:17 -0700 (PDT)
Received: from [10.57.47.79] (unknown [10.57.47.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 086493F5A1;
	Thu,  1 May 2025 04:15:23 -0700 (PDT)
Message-ID: <b09e5369-1902-4c81-9246-026b9f60e21a@arm.com>
Date: Thu, 1 May 2025 12:15:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] arm64: debug: split hardware breakpoint exeception
 entry
To: linux-arm-kernel@lists.infradead.org
References: <20250425153647.438508-1-ada.coupriediaz@arm.com>
 <20250425153647.438508-7-ada.coupriediaz@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250425153647.438508-7-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_041528_352425_81D41508 
X-CRM114-Status: UNSURE (   7.22  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 25/04/2025 16:36, Ada Couprie Diaz wrote:

> +void do_breakpoint(unsigned long esr, struct pt_regs *regs)
> +{
> +	unsigned long pc = regs->pc;
> +
> +	if (user_mode(regs) && !is_ttbr0_addr(pc))
> +		arm64_apply_bp_hardening();
After some thinking around the single stepping case, I will be moving 
the `arm64_apply_bp_hardening()` call earlier, in `el0_breakpt()`, 
similarly to what is done in `el0_pc()` ; likewise for the other 
relevant patches in the series.
That way, it can be in `noinstr` code, allow enabling preemption in 
`entry-common.c` for the debug exceptions it makes sense for, and 
removes the always-false check from the EL1 path.

