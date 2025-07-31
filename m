Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043AAC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 15:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+soWmNBc9updTGPAR9lOjWprsms3YRwbwdAueMEGvbg=; b=QDDphUpK1hqMi7/wYqZK6aWmsJ
	fvlwGSjNyFLUhUHtL3/GPgZqzwco/zSTY9+OYsMvZnqFWc1RFf/vmE0wSK33viYGtErQZIRYRUJmI
	hCnT6pGfOkJp+MoZQa4OoRyA0t4ORR8Dc+EbTcAvYZyNMzdWtrk9TKXqbuUd6+5Fb4zgfq06TWm6L
	1hPu46mhSS31ySvpzKpEZ4zyz8tpYJ3kr5ywXnppuI55acBheWrr5wsR3/t9rxzrwodWdvfzcAd+/
	1GXcHmmngxhHs6Dx6QXHuAgUYCwoa9oDFHQYhND2E0yR/M0AkzCLzTjwvhpu2lXN8YIWSXM1Sf9OW
	vUS0xHDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhV3L-00000003wMW-2VlF;
	Thu, 31 Jul 2025 15:18:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUlV-00000003uaT-3EML;
	Thu, 31 Jul 2025 15:00:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C43E21D13;
	Thu, 31 Jul 2025 08:00:06 -0700 (PDT)
Received: from [10.1.33.50] (e127648.arm.com [10.1.33.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08A3E3F66E;
	Thu, 31 Jul 2025 08:00:11 -0700 (PDT)
Message-ID: <2990c9d8-c957-4443-a2c5-4b62e48dc818@arm.com>
Date: Thu, 31 Jul 2025 16:00:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] sched/deadline: Fix RT task potential starvation
 when expiry time passed
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 jstultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
 <CAMuHMdWZHwr_nmMbVREKC9nQCYigT_gvKH3M9v+oyYqk6FLONw@mail.gmail.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <CAMuHMdWZHwr_nmMbVREKC9nQCYigT_gvKH3M9v+oyYqk6FLONw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_080017_905777_B9E65A56 
X-CRM114-Status: GOOD (  14.99  )
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

On 7/30/25 11:06, Geert Uytterhoeven wrote:
> Hi Kuyo,
> 
> On Mon, 16 Jun 2025 at 14:39, Kuyo Chang <kuyo.chang@mediatek.com> wrote:
>> From: kuyo chang <kuyo.chang@mediatek.com>
>>
>> [Symptom]
>> The fair server mechanism, which is intended to prevent fair starvation
>> when higher-priority tasks monopolize the CPU.
>> Specifically, RT tasks on the runqueue may not be scheduled as expected.
>>
>> [Analysis]
>> ---------
>> The log "sched: DL replenish lagged too much" triggered.
>>
>> By memory dump of dl_server:
>> --------------
>>     curr = 0xFFFFFF80D6A0AC00 (
>>       dl_server = 0xFFFFFF83CD5B1470(
>>         dl_runtime = 0x02FAF080,
>>         dl_deadline = 0x3B9ACA00,
>>         dl_period = 0x3B9ACA00,
>>         dl_bw = 0xCCCC,
>>         dl_density = 0xCCCC,
>>         runtime = 0x02FAF080,
>>         deadline = 0x0000082031EB0E80,
>>         flags = 0x0,
>>         dl_throttled = 0x0,
>>         dl_yielded = 0x0,
>>         dl_non_contending = 0x0,
>>         dl_overrun = 0x0,
>>         dl_server = 0x1,
>>         dl_server_active = 0x1,
>>         dl_defer = 0x1,
>>         dl_defer_armed = 0x0,
>>         dl_defer_running = 0x1,
>>         dl_timer = (
>>           node = (
>>             expires = 0x000008199756E700),
>>           _softexpires = 0x000008199756E700,
>>           function = 0xFFFFFFDB9AF44D30 = dl_task_timer,
>>           base = 0xFFFFFF83CD5A12C0,
>>           state = 0x0,
>>           is_rel = 0x0,
>>           is_soft = 0x0,
>>     clock_update_flags = 0x4,
>>     clock = 0x000008204A496900,
>>
>> - The timer expiration time (rq->curr->dl_server->dl_timer->expires)
>>   is already in the past, indicating the timer has expired.
>> - The timer state (rq->curr->dl_server->dl_timer->state) is 0.
>>
>> [Suspected Root Cause]
>> --------------------
>> The relevant code flow in the throttle path of
>> update_curr_dl_se() as follows:
>>
>> dequeue_dl_entity(dl_se, 0);                // the DL entity is dequeued
>>
>> if (unlikely(is_dl_boosted(dl_se) || !start_dl_timer(dl_se))) {
>>     if (dl_server(dl_se))                   // timer registration fails
>>         enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);//enqueue immediately
>>     ...
>> }
>>
>> The failure of `start_dl_timer` is caused by attempting to register a
>> timer with an expiration time that is already in the past. When this
>> situation persists, the code repeatedly re-enqueues the DL entity
>> without properly replenishing or restarting the timer, resulting in RT
>> task may not be scheduled as expected.
>>
>> [Proposed Solution]:
>> ------------------
>> Instead of immediately re-enqueuing the DL entity on timer registration
>> failure, this change ensures the DL entity is properly replenished and
>> the timer is restarted, preventing RT potential starvation.
>>
>> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> 
> Thanks, this fixes the issue I was seeing!
> 
> Closes: https://lore.kernel.org/CAMuHMdXn4z1pioTtBGMfQM0jsLviqS2jwysaWXpoLxWYoGa82w@mail.gmail.com
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 

FWIW the reported issue is also present on an arm64 rk3399 and
$SUBJECT fixes that.


