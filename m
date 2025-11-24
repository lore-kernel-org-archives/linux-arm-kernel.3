Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D015FCFD317
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEgJ128ZUOfkCcA85lf0OJhDZt0Y5Vj1N4M+aqDJZuA=; b=KHun3u8SryCMuvgDegwI2nA8fB
	/SnwpTecNHjv5ySA49U9ng3qQjlOZYh9uY4sajrm2MZ7xG81dHgNj7qgmocFwMKNfd/1sZCdWwDfC
	1PqEB3AGxDY5ENz4CnLzcezDPxeqqhNoptaxnF+ARcJ72SPzeR/0rffb70SscPOKxYiZ9SMJiTIby
	PsNgnpw8EkaElrBtvSJLs7eSXyJDVbHLLAK2yv6+aq4WzaiBznt7f7vvzr32kyN9jytx1QAlrJTw2
	GYXnNbBxGVsULlvDiwqm3tY6fpRzX3bsQZM7Rg/DwjmN0I5ymBHcwZtBL7GN3L+/Kipi6a/0ts08R
	uOUc17+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTye-0000000BRHM-2bLc;
	Mon, 24 Nov 2025 10:39:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTyb-0000000BRGm-3VdD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 10:39:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 923C0497;
	Mon, 24 Nov 2025 02:39:11 -0800 (PST)
Received: from [10.1.39.148] (e121487-lin.cambridge.arm.com [10.1.39.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6B8C3F6A8;
	Mon, 24 Nov 2025 02:39:15 -0800 (PST)
Message-ID: <ff581325-199a-4bcb-bf5b-43a6f5ec64be@arm.com>
Date: Mon, 24 Nov 2025 10:38:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] KVM: arm64: Add pre_fault_memory implementation
To: Jack Thomson <jackabt.amazon@gmail.com>, maz@kernel.org,
 oliver.upton@linux.dev, pbonzini@redhat.com
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 isaku.yamahata@intel.com, xmarcalx@amazon.co.uk, kalyazin@amazon.co.uk,
 jackabt@amazon.com
References: <20251119154910.97716-1-jackabt.amazon@gmail.com>
 <20251119154910.97716-2-jackabt.amazon@gmail.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20251119154910.97716-2-jackabt.amazon@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_023921_924534_DFE3688E 
X-CRM114-Status: UNSURE (   7.14  )
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

Hi Jack,

On 11/19/25 15:49, Jack Thomson wrote:
> From: Jack Thomson <jackabt@amazon.com>
> 
> Add kvm_arch_vcpu_pre_fault_memory() for arm64. The implementation hands
> off the stage-2 faulting logic to either gmem_abort() or
> user_mem_abort().
> 
> Add an optional page_size output parameter to user_mem_abort() to
> return the VMA page size, which is needed when pre-faulting.
> 
> Update the documentation to clarify x86 specific behaviour.
> 
> Signed-off-by: Jack Thomson <jackabt@amazon.com>

It works quite well for a few cases I have, so FWIW

Tested-by: Vladimir Murzin <vladimir.murzin@arm.com>

Cheers
Vladimir

