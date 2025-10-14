Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22341CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 10:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SST2tUDCfONLzLh1X/LzBzSP0JnB0PVfddf7rjPrkRQ=; b=OF/dmH8PtWmeSu
	x1qzY4QYe7yqEN6bkAiQBFxiwFfQfXEJRNRCDuEjnf/7bUUCSl0xRgk+BfEAIyB9B1RiQLTu5WJGb
	K/5PbNbOoUlhJZBhwJBLbFIYUqXzzzIE+TF8KERRjTdbhnNqFEYQ+UU3E+h9Acg0H6XQejqIJuWaC
	xAZi9gk7Lba7Y0K4W2BllafvFjXgavVdZzNkolQhg0VWfdUlKhnAn+CBy8upOi1+RtiUkevu0vyiA
	oDU07eiOdKaqeqdoa4t2RmjD6j/k8xwHn0UDWS71+z1DTZYhXUEF3ZZk1OPrXV5vUkckKfFsui5NW
	OiLwA3T4ZTayu0NF3sXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8c2Z-0000000FtQq-0Qx8;
	Tue, 14 Oct 2025 10:13:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8c2W-0000000FtQC-3qXI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 10:13:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A3C41A9A;
	Tue, 14 Oct 2025 03:13:47 -0700 (PDT)
Received: from [10.1.25.198] (e137867.arm.com [10.1.25.198])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E56D3F6A8;
	Tue, 14 Oct 2025 03:13:54 -0700 (PDT)
Message-ID: <37b8fe61-318e-4bb2-9935-93014c74368c@arm.com>
Date: Tue, 14 Oct 2025 11:13:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: debug: always unmask interrupts in
 el0_softstp()
To: Mark Rutland <mark.rutland@arm.com>
References: <20251013174317.74791-1-ada.coupriediaz@arm.com>
 <20251014092536.18831-1-ada.coupriediaz@arm.com>
 <aO4b_Ubig2FXowLa@J2N7QTR9R3.cambridge.arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <aO4b_Ubig2FXowLa@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_031357_002578_7E295926 
X-CRM114-Status: GOOD (  16.21  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 14/10/2025 10:46, Mark Rutland wrote:

> On Tue, Oct 14, 2025 at 10:25:36AM +0100, Ada Couprie Diaz wrote:
>> EL0 exception handlers should always call `exit_to_user_mode()` with
>> interrupts unmasked.
>> When handling a completed single-step, we skip the if block and
>> `local_daif_restore(DAIF_PROCCTX)` never gets called,
>> which ends up calling `exit_to_user_mode()` with interrupts masked.
>>
>> This is broken if pNMI is in use, as `do_notify_resume()` will try
>> to enable interrupts, but `local_irq_enable()` will only change the PMR,
>> leaving interrupts masked via DAIF.
> I think we might want to spell thius out a bit more, e.g.
That's fair, your version lays it out better and is probably more 
accessible !
> | We intend that EL0 exception handlers unmask all DAIF exceptions
> | before calling exit_to_user_mode().
> |
> | When completing single-step of a suspended breakpoint, we do not call
> | local_daif_restore(DAIF_PROCCTX) before calling exit_to_user_mode(),
> | leaving all DAIF exceptions masked.
> |
> | When pseudo-NMIs are not in use this is benign.
> |
> | When pseudo-NMIs are in use, this is unsound. At this point interrupts
> | are masked by both DAIF.IF and PMR_EL1, and subsequent irq flag
> | manipulation may not work correctly. For example, a subsequent
> | local_irq_enable() within exit_to_user_mode_loop() will only unmask
> | interrupts via PMR_EL1 (leaving those masked via DAIF.IF), and
> | anything depending on interrupts being unmasked (e.g. delivery of
> | signals) will not work correctly.
> |
> | This can by detected by CONFIG_ARM64_DEBUG_PRIORITY_MASKING.
This could be "This was detected [...]", as that's what I did to detect 
the error,
but happy with either : we don't need to bikeshed this !
> With or without that, this looks good to me, so:
>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
>
> Mark.
Thanks for the quick review,
Ada

