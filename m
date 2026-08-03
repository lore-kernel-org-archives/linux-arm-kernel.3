Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B27C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrKzYeyOhtjxus5/rOyPZy/UTcZUltmutyIQFJL0B1s=; b=kERhUuuVxYoK2anYz2Kw4Zq55Q
	0zI5znFHaUu5EwpUbkfeozqqu6ZHPTyBlO8m7pyV7RRzUIyeyGtGJobFAt+xVzC4bgDVZAWKlAqkT
	6MQl/d3OIqbPPBz0q2r6pXlxpa3fg4EGADYLomyHO+Jh/bkkv2snwGMsxKILUP9oWyGZTKL0bQpTK
	saiP3DVL4vW3OwKpv9WIdhwabTYmF7q/mOkv1sdLBVWnCD+QQsIau1ZWwh8kxWT1QtTt7Md5wn+M0
	+t5mel45EKjas3k5rtimXLzh80F/M0uLG4k7mCSCz6dg9wWG/kR4sR5er6kjUfenA91iHihf8nV7o
	NBHreJow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrl9-0000000H1Gt-262T;
	Mon, 03 Aug 2026 12:27:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrl7-0000000H1GO-03RV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:27:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E41815A1;
	Mon,  3 Aug 2026 05:27:04 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5270D3F66F;
	Mon,  3 Aug 2026 05:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785760028; bh=UrKzYeyOhtjxus5/rOyPZy/UTcZUltmutyIQFJL0B1s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mIbt1K2D988i5XdJ6j2cuWhhcH8Co8ofC3JbVMTmFMqu7ahSjgnRWNk4gjYzRmwKh
	 +1T2999Qwo/wkhKxmQKJLbuOthlToFj00lek3N6ULG92vsMzHMDDJ+1WroiZh9+Rm+
	 Qs0bkUjPYlBo8uDUktYN7whl7FhsSt93IGH+ca+0=
Message-ID: <840d1dec-457a-4e32-b4f5-19a896d68511@arm.com>
Date: Mon, 3 Aug 2026 13:27:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 21/45] arm64: gicv3: remove GIC_PRIO_PSR_I_SET
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-22-vladimir.murzin@arm.com>
 <321b03aa-6703-4aca-a6c5-ac142d876532@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <321b03aa-6703-4aca-a6c5-ac142d876532@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_052709_097813_72621F93 
X-CRM114-Status: GOOD (  10.74  )
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

On 7/28/26 13:08, Jinjie Ruan wrote:
> 在 2026/7/28 0:34, Vladimir Murzin 写道:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> `GIC_PRIO_PSR_I_SET` was used to keep track of sections of the kernel
>> where interrupts always need to reach the CPU and could not be masked
>> via interrupt priorities, or DAIF bypassed the status of the PMR.
>>
>> This flag unmasked IRQs when OR'd to GIC_PRIO_IRQON and ensured that
>> that IRQs were seen as disabled by the `local_irqs_...` functions,
>> as they would only check the PMR if pseudo-NMIs were enabled.
>>
>> This is not needed anymore as our IRQ masking APIs now know how to handle
>> interrupt priorities properly and in parallel with DAIF : remove it.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> It seems that the reviewed-by for v1 is missing.

I think you had some comments on v1 [1], so I didn't want to apply the
tag prematurely

[1] https://lore.kernel.org/linux-arm-kernel/2b14daf3-576f-4b37-b233-e0e1e2c76f2d@huawei.com/

Cheers
Vladimir

