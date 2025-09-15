Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C101CAC59C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkqLPPhwp3NLt6yybUUBOI+18CkgZjGtJx1gNUIBcDc=; b=bOttwT85fKa0xtO2juWQlHLlXP
	AS1NBZ9hvnc0twJVSY24I0iSN5tr94HX0HpMKFTnE9BwsVIjoFrR84GVN56yQEDI+kLMdHkosoTtU
	lllegchx+YGyhcfY8fRWaC13qpIVDcqoPBsFc+kqs1Q8WsRny5X8wI8XVR3bbDBmfTpP9jaqGpZLL
	KNN+SrRpVyKoGvEDHZZfqeO8fCTcd+V85tAcpUYgZCnAQCMFJ7AiBuq4Gf0HFp5cKWXbGJhucDJFi
	KKhbJGkuwhdZTZqwi6myis7QJUTi+fzgLmD7wrqQt2n1hXSd5pa8O3KUKXRP8Bi25Wr3jka7Y/12V
	UF+q0NRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAK4-00000004jMC-2Kcl;
	Mon, 15 Sep 2025 14:36:52 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAJy-00000004iHy-3xzc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:36:48 +0000
Message-ID: <c6c1694b-c5aa-4b1e-baef-c48546d28539@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757946748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkqLPPhwp3NLt6yybUUBOI+18CkgZjGtJx1gNUIBcDc=;
	b=OvMI5NrdjNUTgE/ZWXff6E0jRDjEwfgbls7DPegTCZuxtMKrEgmo3dtptEo8zNw/mXuf22
	vpsUTYC891Is6G5J+xvxYYIM5SQVSke8fVYIyre+hDEbLtumXrfowJWMm4yHl2oEY2kUZP
	oxC/5K/6hvQXKnF1bJ2UCnIKtVwalTY=
Date: Mon, 15 Sep 2025 10:32:24 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v2] coresight: Fix possible deadlock in coresight_panic_cb
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@linaro.org>, Linu Cherian <lcherian@marvell.com>,
 James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org
References: <20250911153315.3607119-1-sean.anderson@linux.dev>
 <20250912093534.GF12516@e132581.arm.com> <aMP95WqHyIQq8TcS@e129823.arm.com>
 <6d833ea6-328f-4743-abfa-fb09b168849e@linux.dev>
 <aMTzdJRGdTCBZyo1@e129823.arm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <aMTzdJRGdTCBZyo1@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_073647_120939_A4D5A33D 
X-CRM114-Status: GOOD (  23.40  )
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

On 9/13/25 00:30, Yeoreum Yun wrote:
> Hi,
> 
>> > Hi,
>> >
>> >> Hi Sean,
>> >>
>> >> On Thu, Sep 11, 2025 at 11:33:15AM -0400, Sean Anderson wrote:
>> >> > coresight_panic_cb is called with interrupts disabled during panics.
>> >> > However, bus_for_each_dev calls bus_to_subsys which takes
>> >> > bus_kset->list_lock without disabling IRQs. This will cause a deadlock
>> >> > if a panic occurs while one of the other coresight functions that uses
>> >> > bus_for_each_dev is running.
>> >>
>> >> The decription is a bit misleading. Even when IRQ is disabled, if an
>> >> exception happens, a CPU still can be trapped for handling kernel panic.
>> >>
>> >> > Maintain a separate list of coresight devices to access during a panic.
>> >>
>> >> Rather than maintaining a separate list and introducing a new spinlock,
>> >> I would argue if we can simply register panic notifier in TMC ETR and
>> >> ETF drviers (see tmc_panic_sync_etr() and tmc_panic_sync_etf()).
>> >>
>> >> If there is no dependency between CoreSight modules in panic sync flow,
>> >> it is not necessary to maintain list (and lock) for these modules.
>>
>> Yeah, I was thinking about this as I was preparing v2 of this patch.
>>
>> > +1 for this.
>> > and using the spinlock in the panic_cb doesn't work on PREEMPT_RT side.
>>
>> What do you mean by this? I am using lockdep and it did not warn about this,
>> so I assume that on PREEMPT_RT IRQs remain enabled in this path.
> 
> Hmm, I don't believe this.
> When you see the panic(), it explicitly disable irq.
> and preempt_disabled() before
> calling atomic_notifier_call_chain(&panic_notifier_list, 0, buf);
> 
> also, atomic_nofier_call_chain() is rcu critical section.
> 
> As you know, since the spinlock becomes sleepable lock in PREEMPT_RT
> this is problem.
> 
> The reason why lockdep doesn't report this problem since it was disabled
> before panic notifier chain by calling debug_locks_off();

Ah, that makes sense.

--Sean

