Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C24CC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 11:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUChWjt71VPmia75gz5xduzzakDkmA+fb7VBCASsQLs=; b=5AhiExxVBQ2VrF
	5//Xhwhy9+C3Z8bTEycxoVPti2sdvfD864rQHoQuh6oJ4Dc6shGdISlaCyU1+9KHC67KxyoPLb44+
	MCWhJhz++bZG347FHVIPwfSScJNSkhdMg0Pkel+8zN+CLx5KdKqbCwN77bO2+SQ9S59bRe7VPDbeg
	DLjzIcn42iY4kERRyWuMd7UalLTM3dk9o7Y1Qzutw8/1uc28iciUvv7mEb8Nx2kKhUu3mjWsvzUsB
	pwprtqoIe38OgsaIvkf1a0igloE2p5RyTCLeJIWflxbnjCwd9+2dNezQ18WzYh1XU2Z+jZPKOF9E4
	IuLqmxFY4YsGtOwkh4IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASSp-0000000FK9E-1YAP;
	Thu, 01 May 2025 11:52:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASDc-0000000FITf-2O3j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:36:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A901106F;
	Thu,  1 May 2025 04:36:36 -0700 (PDT)
Received: from [10.57.47.79] (unknown [10.57.47.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE1233F5A1;
	Thu,  1 May 2025 04:36:42 -0700 (PDT)
Message-ID: <0b3186c4-7d75-4559-8601-7c835ec7139a@arm.com>
Date: Thu, 1 May 2025 12:36:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] arm64: debug: split single stepping exception entry
To: linux-arm-kernel@lists.infradead.org
References: <20250425153647.438508-1-ada.coupriediaz@arm.com>
 <20250425153647.438508-8-ada.coupriediaz@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250425153647.438508-8-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_043644_659715_08F03726 
X-CRM114-Status: UNSURE (   9.51  )
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

> +static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
> +{
> +	enter_from_user_mode(regs);
> +	debug_exception_enter(regs);
> +	do_softstep(esr, regs);

I spent some time digging into the preemptibility of this, specifically 
to be able to fix the reported issue with PREEMPT_RT [1].

 From EL0, the only possible path for the single stepping exception is 
to call `uprobe_singlestep_handler()`, which only operates on the 
task-local uprobe state with proper checks in place and raises a Thread 
Information Flag. The uprobe TIF is processed before returning to 
userspace in `do_notify_resume()`, which is already preemptible. The 
shared uprobe state contained in `current->active_uprobe` is created by 
the preceding BRK and reference counted. It is only cleared when the 
uprobe single stepping is processed.

Thus I feel it should be safe to enable preemption for this exception 
from EL0 in v2, combined with my other comment moving the BP hardening 
to `el0_softstp`. From testing, it seems to fix the reported issue with 
PREEMPT_RT [1].

> +	debug_exception_exit(regs);
> +	local_daif_restore(DAIF_PROCCTX);
> +	exit_to_user_mode(regs);
> +}
> +
[1]: https://lore.kernel.org/linux-arm-kernel/Z6YW_Kx4S2tmj2BP@uudg.org/

