Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350B3FB519C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 06:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CMtQUtwLNCZO96qDPJxNdbEJ+SZVWz86MVqoqQUYgg=; b=HzrROs2Rg4lqgrUXVzVRLwDVKe
	vhgX1W83l9U8mAUmjsB8cp1GxVvIGUpooFER7wXvm2zjlwTpKVC+E5XGHLqj4M4T379AoYfGti3dh
	AJcLi8PVmrfSzugJm0bxNt0csqiW4o1Csh5ovWZLqHGlbTjZdKuXzsq6eA24gzD7reviVi130piOg
	RY3nxXeU/RSd1AWuM+ESfBXg1O3hFohJxttx+ux8zBpXUTl/Czpbx7sn/rFZZ4KxDFNmMu4JOGQ0H
	4FZd3bAk8pL5FGHGDAYUWqetJiuFNaJtG5Mtx9vYjGLfmrHOZCoFCDeHEq/z9DIgEom7RohQBp5ZO
	sgr4r+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9zqp-00000005yxx-3L7h;
	Tue, 07 Apr 2026 06:23:51 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9zqn-00000005yx8-0vDy;
	Tue, 07 Apr 2026 06:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1775543022; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=6CMtQUtwLNCZO96qDPJxNdbEJ+SZVWz86MVqoqQUYgg=;
	b=Pirslxf/rA1aLBxkqPLwgtvb5qAxttFluRmfPkPWWnB6GAqkmcARaKjAMt3JyU8jmzK3OQ2mes+dB3M8yZ73UByqerk5PVKa+X7YvjkZTVVI2j/mE7yLI2kPQ1RCUkq1Chypx0TP8+ML4DxyaX6XxN1ojSj31okMC8s0RULLP00=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X0albEE_1775543013;
Received: from 30.74.144.138(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X0albEE_1775543013 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 07 Apr 2026 14:23:34 +0800
Message-ID: <2a216ee2-aebb-42ba-b2aa-826488448bbe@linux.alibaba.com>
Date: Tue, 7 Apr 2026 14:23:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] mm: change to return bool for the MMU notifier's
 young flag check
To: Sean Christopherson <seanjc@google.com>
Cc: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, akpm@linux-foundation.org,
 david@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
 <545847c132da5d957cfc74ab19e849b16127aa8f.1773890510.git.baolin.wang@linux.alibaba.com>
 <67c670e2-c98f-490b-bbb9-2960f8175b5a@lucifer.local>
 <66e78b59-f96c-4277-b7d7-473b68ed413f@linux.alibaba.com>
 <adBJTXeE6G2vQNKX@google.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <adBJTXeE6G2vQNKX@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_232349_701473_DBB295B7 
X-CRM114-Status: UNSURE (   5.15  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 4/4/26 7:12 AM, Sean Christopherson wrote:
> On Fri, Mar 20, 2026, Baolin Wang wrote:
>>>> -static __always_inline int kvm_age_hva_range(struct mmu_notifier *mn,
>>>> -						unsigned long start,
>>>> -						unsigned long end,
>>>> -						gfn_handler_t handler,
>>>> -						bool flush_on_ret)
>>>> +static __always_inline bool kvm_age_hva_range(struct mmu_notifier *mn,
>>>> +					      unsigned long start,
>>>> +					      unsigned long end,
>>>> +					      gfn_handler_t handler,
>>>> +					      bool flush_on_ret)
>>>
>>> Can we please fix this terrrible indentation while we're here :)?
>>>
>>> static __always_inline bool kvm_age_hva_range(struct mmu_notifier *mn,
>>> 		unsigned long start, unsigned long end, gfn_handler_t handler,
>>> 		bool flush_on_ret)
>>>
>>> Would be nicer, thanks!
> 
> No, please keep this as-is.  KVM's preferred style is exactly this (and I personally
> find mm's style much harder to parse).

Um, Andrew has already queued v2[1] into the mm-stable branch. Do you 
want me to send a follow-up patch to restore the original KVM coding style?

[1] 
https://lore.kernel.org/all/cover.1774075004.git.baolin.wang@linux.alibaba.com/T/#u

