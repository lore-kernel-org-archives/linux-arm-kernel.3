Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7438C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUjHyH6HmXVFmTlFTdnAzd5uQQ145Vl4gtHgdpNsWlE=; b=35JaYShfg84GHtuxQ4KmA234A/
	wwJux2K4B0ddSksWtnQ+cVvWR3YfBp4EabRLBeEyV4fFcpS4XJ5kmHP9LrfVnzcQSknpiYNe6qboq
	+knFyOYxkr4/vx5cppvQGrae4VqlSfltJwYTyOGsHDoJlPgavVSaLf+1q9oAMML+WPU2UJZu8kxO2
	PVrbQJG+s02GnoIcgwy/Nwe8pvo5cxxLQ3rmbzMjxWar+aVoQ/HOuhhNKeXjRu1Q7nODwULkjzbCM
	9Uf9EOdepEJqZwvoJ0yaGMbnj179ZIMfyzCbt4pT7ByZYDxXih3pfdVzlkFKLJUEYiEcVc5XSSQkO
	HDc32RUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYp8-00000006fBx-35FX;
	Fri, 21 Feb 2025 19:36:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYnf-00000006ezw-0zHa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:35:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A07321688;
	Fri, 21 Feb 2025 11:35:17 -0800 (PST)
Received: from [10.57.85.121] (unknown [10.57.85.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 693213F59E;
	Fri, 21 Feb 2025 11:34:58 -0800 (PST)
Message-ID: <0ad3894d-25c1-4f49-b37c-dda01f5221ab@arm.com>
Date: Fri, 21 Feb 2025 19:34:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: extable: Add fixup handling for uaccess CPY*
 instructions
To: Robin Murphy <robin.murphy@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Tong Tiangen <tongtiangen@huawei.com>,
 James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20250218171430.28227-1-kristina.martsenko@arm.com>
 <20250218171430.28227-2-kristina.martsenko@arm.com>
 <e71d053a-d37c-478a-bfb0-23dbc6b6a0b2@arm.com>
Content-Language: en-US
From: =?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>
In-Reply-To: <e71d053a-d37c-478a-bfb0-23dbc6b6a0b2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_113503_321950_32A4496D 
X-CRM114-Status: UNSURE (   6.01  )
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

On 20/02/2025 18:55, Robin Murphy wrote:
> On 18/02/2025 5:14 pm, Kristina Martšenko wrote:
>>   +static bool cpy_faulted_on_uaccess(const struct exception_table_entry *ex,
>> +                   unsigned long esr)
>> +{
>> +    bool uaccess_is_write = FIELD_GET(EX_DATA_UACCESS_WRITE, ex->data);
>> +    bool fault_on_write = esr & ESR_ELx_WNR;
>> +
>> +    return !(uaccess_is_write ^ fault_on_write);
> 
> Nit: isn't that simply "uaccess_is_write == fault_on_write"?

Yes, that's better.

Thanks,
Kristina


