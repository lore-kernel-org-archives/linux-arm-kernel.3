Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF706C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUqSC25SIAF7Vamaz5rAhqLs7oY6ccTAsBPaZ0Q9oxE=; b=2rzV7QvxETOHTW
	nTt+s9RZ3JKvYuTERqCSbF8yFmAdVwHBylP1/iLZmYeZPYJRotdXiV3pfL/xPsP/PJgiJUZ7GCRlT
	9vMpCjE4ZdQMQKWxu4ijZPvmubS0G190MXhcSQvXQ0IT6og2fjg75PA99xbvlZWW6S1xXgz9xH/Ul
	DSXmowaFlg5mTpQzhHYdLx1VYp/zOdiosRx5puXJZFrKuBNgrys3XIBDrLuLFZFKp8MHJQ58AZ/2g
	uZr1z4jsRi+3JS5240Z/0lRis+ROe7cKeS+jA62GBRWWyq4qnbwrKdVMLBRok12MAWRT5Dlc5HzRJ
	+YaSuZa20lIGpyFyS+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKIb-0000000DFcS-1isI;
	Tue, 05 Aug 2025 16:14:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJFX-0000000D6Gg-1QyO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:06:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7B542BCD;
	Tue,  5 Aug 2025 08:06:38 -0700 (PDT)
Received: from [10.1.29.177] (e137867.arm.com [10.1.29.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7233B3F673;
	Tue,  5 Aug 2025 08:06:42 -0700 (PDT)
Message-ID: <3fd74c08-2950-46a9-a191-a635f379a8f7@arm.com>
Date: Tue, 5 Aug 2025 16:06:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 4/7] arm64: entry: Use preempt_count() and
 need_resched() helper
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-5-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250729015456.3411143-5-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_080647_430724_369174C1 
X-CRM114-Status: UNSURE (   8.73  )
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
Cc: mark.rutland@arm.com, sstabellini@kernel.org, puranjay@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, liaochang1@huawei.com, oleg@redhat.com, kristina.martsenko@arm.com, linux-kernel@vger.kernel.org, broonie@kernel.org, chenl311@chinatelecom.cn, xen-devel@lists.xenproject.org, leitao@debian.org, ryan.roberts@arm.com, akpm@linux-foundation.org, mbenes@suse.cz, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 29/07/2025 02:54, Jinjie Ruan wrote:

> The generic entry code uses preempt_count() and need_resched() helpers to
> check if it should do preempt_schedule_irq(). Currently, arm64 use its own
> check logic, that is "READ_ONCE(current_thread_info()->preempt_count == 0",
> which is equivalent to "preempt_count() == 0 && need_resched()".
>
> In preparation for moving arm64 over to the generic entry code, use
> these helpers to replace arm64's own code and move it ahead.
>
> No functional changes.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>


