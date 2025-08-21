Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6735CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AuarQfa/EvWs/7dY1xaIwVc8Pmz4JcjVQPyAzy+7Oc4=; b=0sabcPD7IH3ADP
	m6imrKxEX6XV6cPJoPJIWL2Zpcmh6pFZlZew0oCNDjcubQmAYcLxxo0tH2UwDptsE7qbcVjXeoiqH
	KCmjYvNvDqeGdq5X1WWp3HkoVMXY7RauAbolufzWVpDvkqYGR9Q9yEt86EYE0ePTW+9tKnxPNkMlK
	z69m4OJ2jZwSe/rbovHL2Pyk66q1CR1eoAmQv5ucbLMh34sHO0lqptaPjOAmRDjQfapYhngnYTu9X
	7b0zv2xqRsCSIdHByPm+FseYSUjvJE1Oznu5bXza//OmuE4ICgPu+BZqC04nYIhHacXqL4rLt4oRx
	aYXuSxN3NaCohQmpSBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFcT-000000011Va-0KP8;
	Fri, 22 Aug 2025 00:27:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up85s-0000000HXR8-2dWa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 16:24:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4A32152B;
	Thu, 21 Aug 2025 09:24:43 -0700 (PDT)
Received: from [10.57.1.220] (unknown [10.57.1.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 595D03F738;
	Thu, 21 Aug 2025 09:24:48 -0700 (PDT)
Message-ID: <9974c597-cc03-42d2-ba3a-3dd05f1a782c@arm.com>
Date: Thu, 21 Aug 2025 17:24:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] entry: Add arch_irqentry_exit_need_resched() for
 arm64
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250815030633.448613-1-ruanjinjie@huawei.com>
 <20250815030633.448613-6-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250815030633.448613-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_092452_705902_0A4AC266 
X-CRM114-Status: UNSURE (   7.57  )
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
Cc: mark.rutland@arm.com, sstabellini@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com, catalin.marinas@arm.com, liaochang1@huawei.com, oleg@redhat.com, kristina.martsenko@arm.com, linux-kernel@vger.kernel.org, broonie@kernel.org, chenl311@chinatelecom.cn, leitao@debian.org, xen-devel@lists.xenproject.org, mbenes@suse.cz, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

On 15/08/2025 04:06, Jinjie Ruan wrote:
> Compared to the generic entry code, ARM64 does additional checks
> when deciding to reschedule on return from interrupt. So introduce
> arch_irqentry_exit_need_resched() in the need_resched()
> condition of the generic raw_irqentry_exit_cond_resched(), with
> a NOP default. This will allow ARM64 to implement the architecture
> specific version for switching over to the generic entry code.
>
> Suggested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
Looks good to me, thanks for the changes ! Reviewed-by: Ada Couprie Diaz 
<ada.coupriediaz@arm.com>

