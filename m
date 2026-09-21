Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2542C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVtYuumek0WMIWjuGEPO90mon01B6iduoFhN2E7u5ZE=; b=RrGxHJuCpBhaGhJ0K4SmJ9xnN6
	6IiswbKB/EM0BryV9lC78ShYYoU/lMuoYKFoKXc6a2OBD+bffUr06Tj8MyR15C+WBUC7EqbcyYVzm
	BEHAa5QilxY8B+frf8SLcPizVWEZyQwob4qtIt0HLTuxeM28n1kQniWmgN72m3kVCxfugzECdKur+
	pHy+08oRh1jGCOy4UCx2rAvdVhOE8ARhycwZu0dR56/bHo9Bxg5rlMIHMB7Wf6QwIjfeQLlIqzS4g
	gZy5txvECUPGxic3PgwsBl1kUlKJc2z7sdMKKiMIM8SKfpkc2X+5/kfIsrgcwa7HGzinl6DQ4tQ+s
	MukkoCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ejA-00000002M7e-2sI5;
	Mon, 21 Sep 2026 14:10:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ej7-00000002M76-2DPb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:10:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DFAD2F;
	Mon, 21 Sep 2026 07:10:33 -0700 (PDT)
Received: from [10.0.152.207] (e121487-lin.carmbridge.arm.com [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D34F73F86C;
	Mon, 21 Sep 2026 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789999836; bh=xD5VlxpK5bB7PWiAg02WFHu3BTD2BA1f4uQVw+wQhKA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GjiRM1NsbOwNkRKbnQRkT8dzU8/Usml86HHRQTYM2JZZuAaWsiXeerwOrTSLmOE+F
	 QWyJPWEOHJrqTyjSENo5uvKtkiKS4fJ1QY0t9f/VfY9XFO64M4tiN4BznkBRai/57u
	 FL+ikc3m4R/4Ytd25iCWVIXbLfIFk/Eim4k0RMI4=
Message-ID: <38ea1138-cc80-41de-9eb5-cd03571c4717@arm.com>
Date: Mon, 21 Sep 2026 15:10:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/38] arm64: interrupts: Add common exception state
 helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 maz@kernel.org, lpieralisi@kernel.org, liaochang1@huawei.com
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-4-vladimir.murzin@arm.com>
 <03e261b4-10da-4530-b28a-5512e399d2e3@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <03e261b4-10da-4530-b28a-5512e399d2e3@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_071037_628258_0165CC09 
X-CRM114-Status: UNSURE (   9.91  )
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

On 9/17/26 10:10, Jinjie Ruan wrote:
> 
> 在 2026/9/14 18:20, Vladimir Murzin 写道:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>

[snip]

>> +
>> +static __always_inline
>> +arm64_exc_hwstate_t arm64_inherit_exc_hwstate(struct pt_regs *regs)
>> +{
>> +	arm64_exc_hwstate_t state = {.daif=regs->pstate & DAIF_MASK};
>> +
>> +	if (system_uses_irq_prio_masking())
>> +		state.pmr = regs->pmr;
>> +
>> +	return state;
>> +}
> Hi Vladimir,
> 
> This helper looks more related to the 5th patch "arm64: entry: Introduce
> entry specific exception masking helpers", as it is entry-related.
> Moving it to 5th patch may make it easier to review.
> 
> Best regards,
> Jinjie
> 

Hi Jinjie,

Sure, I'll move it there :)

Thanks
Vladimir



