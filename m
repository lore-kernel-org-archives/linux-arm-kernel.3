Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CEAC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6aHGun6HH9Jjz0SXo2/6+TaCCNmgNOVS9CK9NRULAA=; b=K3bBPBccv1OwP3tWQsNiamfIz1
	0LJRsZYNtMus9A/YwvKUbIeg9h8WvQCUULWDqL7jhljsNwHkhAhkXSG5Mav4oY4+yc+2qx7LCJfP9
	YMaueA+NSx2BT8gI234rvw8sRbCbkHjmiBOHirm4ZgI6pXz+y8CPG2gJf6sTi7wDnIz3bIvi5XLFN
	ImoDM4RFwJFV7PlelBJqJE4r1QftpzSu+Ha5ms0nGh6O1Tx9vZyelaRd2bHXMmVzZwJ9ILINKvR60
	Ug8EzQiCgXsy1aunUIQbdKIMR/DV+6AxWXRrG43+sqIltDGoodyE4zMdNiedbU06gcrHquvwNIkvc
	jtm2ptdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrit-0000000H12c-0YRT;
	Mon, 03 Aug 2026 12:24:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqriq-0000000H12G-0cHw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:24:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB418143D;
	Mon,  3 Aug 2026 05:24:41 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61A583F66F;
	Mon,  3 Aug 2026 05:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785759886; bh=4zF01dtgm1NXQ5I/sX3PX9kqnAZ74guTvN3eycxiUY4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FkzAIFiWnj2OSPE7mj/tG0BrEvFfZndMteF9vRF33Neb3m9sidmeqMyLPHP4RX8z5
	 +QFfoLyqgtfHot1FV80oj/1VjHYSN/qCBNp3u8+Sh33G1ZdvcEACI1do0QlMBfXh6X
	 I1icIzExyy78M2gsflryAkQnIr5yUdaM0epspayU=
Message-ID: <f875b3b0-76ae-4b55-986e-a95d5e4793f5@arm.com>
Date: Mon, 3 Aug 2026 13:24:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 16/45] arm64: interrupts: Introduce exception
 masking save/restore helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-17-vladimir.murzin@arm.com>
 <57e6edc7-0be8-4ec4-950c-c6b97e0a576b@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <57e6edc7-0be8-4ec4-950c-c6b97e0a576b@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_052448_234418_7CAEA53F 
X-CRM114-Status: UNSURE (   7.20  )
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

On 7/28/26 12:56, Jinjie Ruan wrote:
>> +static __always_inline
>> +void __local_exceptions_cpu_init_mask(arm64_exc_context_t context)
>> +{
>> +	if (context == PROCESS_CONTEXT)
>> +		trace_hardirqs_on();
>> +
>> +	arm64_update_exc_context(context);
> Is following miss for setup_arch()?
> 
>       if (context == NOIRQ_CONTEXT)
> 	  trace_hardirqs_off();
> 

Yup. Perhaps better do

      if (context != PROCESS_CONTEXT)
	  trace_hardirqs_off();

I'll fix that in the next version.

Cheers
Vladimir

