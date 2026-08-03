Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CDEC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GW6llnCU5d1ZTzWBXwvJSl4a0dky1vOxwjNiMt4GZjw=; b=irWBMDsfUCmLylaoxsLVrGbJUM
	64cp99GwQqm75RdEEI/yLxBQ6O2zTmzWSqDAmIwAz4LqqmrKuXj6ECgY/6OlPiu9Vvcl3iNiLVhIk
	aNVS6IL0Obn3ZSwT5OCtAg9Vpwofi580OWQtj/c1eOh16qLLcY8f7PaOC6yOHY1Tut/P8C91btjaW
	GN1JbX+7p6RkOIY6x7jYz9LZaoFpOJayTELDWsGfgqU9jfAfDzVH6A+63Gcbs58ZhHd8znJwGt4fV
	J7UKsixjtI6S4jsb018mn/sVXHWjmV13QIF7PnY7SpjQbdwvTuP6Qr+gS2GNsUcOc0mIig5gc4D58
	8t51Bd9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqp0a-0000000Ggw8-3zFQ;
	Mon, 03 Aug 2026 09:30:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqp0Y-0000000GgvU-1Ax4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:30:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 145C1143D;
	Mon,  3 Aug 2026 02:30:46 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8A2C3F66F;
	Mon,  3 Aug 2026 02:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785749450; bh=t9vmpN00wXMdtPPVQUqyNd8jRY5+MqtYZz/sUJ2oClY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=j7MflOmgZjK+1LlT9k9XvNAb5V69K0+oxCMOhAr3b+6a/5B9UWThMp3mcsxYp3NYJ
	 dgFXoErS86SN0B5h2yGE0cAVoIEFft1/fYC61E02F88t3XGb4VdhL8pWeq5l9kmK5u
	 Jf7vmWvkAlHBqKDbjYpm26/gWlo+1gDp4UoYvADA=
Message-ID: <768ad583-beea-45d6-bad9-fe5a152b8498@arm.com>
Date: Mon, 3 Aug 2026 10:30:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 10/45] arm64: irqflags: Introduce arm64-specific
 irqflags type
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, ruanjinjie@huawei.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-11-vladimir.murzin@arm.com>
Content-Language: en-GB
In-Reply-To: <20260727163453.7969-11-vladimir.murzin@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_023054_373734_5CE4EDEA 
X-CRM114-Status: UNSURE (   8.27  )
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

On 7/27/26 17:34, Vladimir Murzin wrote:
>  
> + /*
> +  * Internally, we want to independently manipulate and track the different
> +  * interrupt masking mechanisms.
> +  * Externally, the generic irqflags API expects unsgined longs to represent
> +  * the state of interrupts, which are treated as obscure arch-specific data.
> +  */
> +typedef union arm64_exc_hwstate {
> +	struct {
> +		u16 daif;
> +		u8 pmr;
> +		u8 __padding[5];

This padding hurts code generation. It is better expressed as:

 u8 __pad0;
 u32 __pad1;


> +	};
> +	unsigned long flags;
> +} arm64_exc_hwstate_t;
> +


