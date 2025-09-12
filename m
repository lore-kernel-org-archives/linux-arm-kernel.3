Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E05CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KE1W/r+N8sTKSy321MZ4n/oyG8LmkGslI8PJ1jlVKTs=; b=Jj0OaB9C8CW0quiQMwXYwH5M6u
	XOmyrYBuyj8jrmoQ+5p5V8eHU9BK6iTwDYoZDAaxS7hQB53QXwwKy+THuAwu6BPdYzedz+7+N0D7+
	q4iJxTgNCFaVl7P2IQORvRJ+AiQjK5pVy/T//yT6hfTgHIuX7phNFc4PFWYfGKFRT0+bXDVNtHXTk
	obXd5wrnsIWR/ZsNeL6TLv2nbEej9yo21g68jL3fYvIeHujCs3XIQ957ZkeeBiHKP5K50TJuIjPRl
	jyL2ZNvDsIVTQ4MUxvFHEZA/bL+DQzjJWggys5fbrk6S1SRNiGO231n5r3EfqVmri+9fYDged1DxF
	CWTRQrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4xU-00000009yXW-0JPJ;
	Fri, 12 Sep 2025 14:41:04 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4xR-00000009xhA-3NqS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:41:03 +0000
Message-ID: <6d833ea6-328f-4743-abfa-fb09b168849e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757687936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KE1W/r+N8sTKSy321MZ4n/oyG8LmkGslI8PJ1jlVKTs=;
	b=DPxH7wWyt9AZqvJa+AsTpWqx+6kaakUlHGOVOps7k2s3j31Mq1ZMggEha6nkdR/z5Fx+0R
	iAHnA9xypPTGPI90VAuKJ0TLayj/SMbvwIA5RuWC+2HL5XVAim/E779dbk+htsPxXZbh1B
	PaKLQgEKd4EjtukTxm7HdtcNxtzDE9E=
Date: Fri, 12 Sep 2025 10:38:44 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v2] coresight: Fix possible deadlock in coresight_panic_cb
To: Yeoreum Yun <yeoreum.yun@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Linu Cherian <lcherian@marvell.com>,
 James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org
References: <20250911153315.3607119-1-sean.anderson@linux.dev>
 <20250912093534.GF12516@e132581.arm.com> <aMP95WqHyIQq8TcS@e129823.arm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <aMP95WqHyIQq8TcS@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_074101_994019_512B93BF 
X-CRM114-Status: GOOD (  16.94  )
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

On 9/12/25 07:03, Yeoreum Yun wrote:
> Hi,
> 
>> Hi Sean,
>>
>> On Thu, Sep 11, 2025 at 11:33:15AM -0400, Sean Anderson wrote:
>> > coresight_panic_cb is called with interrupts disabled during panics.
>> > However, bus_for_each_dev calls bus_to_subsys which takes
>> > bus_kset->list_lock without disabling IRQs. This will cause a deadlock
>> > if a panic occurs while one of the other coresight functions that uses
>> > bus_for_each_dev is running.
>>
>> The decription is a bit misleading. Even when IRQ is disabled, if an
>> exception happens, a CPU still can be trapped for handling kernel panic.
>>
>> > Maintain a separate list of coresight devices to access during a panic.
>>
>> Rather than maintaining a separate list and introducing a new spinlock,
>> I would argue if we can simply register panic notifier in TMC ETR and
>> ETF drviers (see tmc_panic_sync_etr() and tmc_panic_sync_etf()).
>>
>> If there is no dependency between CoreSight modules in panic sync flow,
>> it is not necessary to maintain list (and lock) for these modules.

Yeah, I was thinking about this as I was preparing v2 of this patch.

> +1 for this.
> and using the spinlock in the panic_cb doesn't work on PREEMPT_RT side.

What do you mean by this? I am using lockdep and it did not warn about this,
so I assume that on PREEMPT_RT IRQs remain enabled in this path.

--Sean

