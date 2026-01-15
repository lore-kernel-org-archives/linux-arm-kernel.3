Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E23D3CCB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 06:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rd4uquxchhYlI1uf+9FDWEl0NlqA5AmaEDZzEOPLiMs=; b=PsmC6BjxgQk2unubsLTqrr3nhq
	V4aPpiwkKfDfBt2nVjfMqJxgjQaA80AwQMBf50NfDTp8IByp76+aypVmTD99lyFR/5F47A6i+3loq
	yn4VyMRx3W2VWWbZwl2i8SUv2UV9R1d5dvftwu2aIxZmT7DQgtQNSHKySP9fJePt/dC6mV9VfE+FP
	fNln89Z2Y5VBM6nuWe1opsii5gYrd/5vhlmiS4O6ThbmDiukzEo52KneMGWmQCyZcm2YKy2I4BV2W
	zX8NoYH9j1IszYzsY7a5cGGqdzmOs3yjPb4Ok1mD7of+Wo7/SQ+PfjI4nWSZVQYj1t36+QWuhpBCJ
	bQjF2uGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGoF-0000000Bqpb-0ID7;
	Thu, 15 Jan 2026 06:26:19 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGoC-0000000BqpL-44N7;
	Thu, 15 Jan 2026 06:26:17 +0000
Message-ID: <e08ada29-556e-4251-b4bb-c122ca3ec3e0@infradead.org>
Date: Wed, 14 Jan 2026 22:26:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: errata: Workaround for SI L1 downstream
 coherency issue
To: Lucas Wei <lucaswei@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, sjadavani@google.com,
 stable@vger.kernel.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, robin.murphy@arm.com, maz@kernel.org
References: <20260114145243.3458315-1-lucaswei@google.com>
 <d10116ae-fc21-42e3-8ee0-a68d3bb72425@infradead.org>
 <CAPTxkvRXmVB9MbPX2vkyhAnLDyJX7YviekOH=y3EcS_1e796Zg@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAPTxkvRXmVB9MbPX2vkyhAnLDyJX7YviekOH=y3EcS_1e796Zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 1/14/26 6:11 PM, Lucas Wei wrote:
> Hi Randy,
> 

>>> +/*
>>> + * We have some earlier use cases to call cache maintenance operation functions, for example,
>>> + * dcache_inval_poc() and dcache_clean_poc() in head.S, before making decision to turn on this
>>> + * workaround. Since the scope of this workaround is limited to non-coherent DMA agents, its
>>> + * safe to have the workaround off by default.
>>
>> But it's not off by default...
> 
> I think it's off by default.
> Would you point me to where the workaround was enabled without cmdline?

I'm probably confused by the Kconfig option defaulting to 'y' but the run-time option
itself is still off by default.  Sorry for the noise.

+config ARM64_ERRATUM_4311569
+	bool "SI L1: 4311569: workaround for premature CMO completion erratum"
+	default y
+	help
+	  This option adds the workaround for ARM SI L1 erratum 4311569.

-- 
~Randy


