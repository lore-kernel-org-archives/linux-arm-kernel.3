Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE01C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/TUy7tChyr2xwquZvVEdcGFOqKLEPlcpj9YucCF8RM=; b=eAoUEtMBX41OqIlLHrqg9NcGSR
	ESDwVcXLSZH8kVepaZ20zLBXi0Yp/bTgIBE5ka6CKgXyDGkis5HtKHVfG5VXPAFsOtZ5rQmBPfO3p
	KISoqgJM86w+dQGqm45INnKRcc0rMltEumQGzjfIH2jOK5KC9EO8DFgU+RwpXdtofCZixe3QPS5UW
	n6f3+uMVoUamPCjLiUNgYSc4GhOd/fGODJ43FjAV6gXhuw1pgNPjsV/7n8uCQf3eIYZ3MJWRIBQCL
	tZK7qBwhyUiWsrr9lA3siqwtNveQwk5XYaEFJb0efJPmkTbO0S5f2DCWYck0iHiWrSo7rDFtBQafP
	oHRnvjag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwAH-0000000EMKV-1KDF;
	Wed, 15 Jul 2026 09:44:29 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwAE-0000000EMJ9-20rw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:44:27 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wjw9t-0007kR-EY; Wed, 15 Jul 2026 11:44:05 +0200
Message-ID: <e89fd487-ea3f-42fd-8647-6fa74ac991e8@pengutronix.de>
Date: Wed, 15 Jul 2026 11:44:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] media: v4l2-mem2mem: support running multiple jobs
 in parallel
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
 <20260606-spu-rga3multicore-v1-5-3ec2b15675f7@pengutronix.de>
 <aae16dbfb26c8ee7e54247ca4d123b15748d623f.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <aae16dbfb26c8ee7e54247ca4d123b15748d623f.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_024426_554945_45120279 
X-CRM114-Status: GOOD (  29.67  )
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

Hi,

On 7/10/26 11:18 PM, Nicolas Dufresne wrote:
> Hi,
>
> Le samedi 06 juin 2026 à 00:06 +0200, Sven Püschel a écrit :
>> Add support for running multiple jobs in parallel for SoCs containing
>> multiple identical devices. An example is the Rockchip RK3588 SoC,
>> which contains two identical RGA3 devices. Therefore it is desirable to
>> have the kernel schedule the work across all available devices and only
>> expose one video device to the userspace.
>>
>> Previously the curr_ctx member of a v4l2_m2m_dev was used to track the
>> currently running context. But the currently running context will always
>> be at the top of the job_queue. As the TRANS_RUNNING flag can be used to
>> check if the queue head is already running, the curr_ctx member can be
>> completely dropped
>>
>> To avoid queueing too many parallel jobs, the
>> v4l2_m2m_set_max_parallel_jobs method is added. It allows a driver
>> to set the number of parallel jobs and avoids calling device_run when
>> the given number of jobs is already running. This is set to 1 by default
>> to prevent parallel job runs. Drivers with the need and support for
>> scheduling jobs can adjust this value accordingly.
>>
>> Note that this change doesn't allow a context to be used multiple times
>> in parallel. So a single stream won't be able to utilize multiple devices
>> at once, but N streams can utilize up to N devices. This is caused by the
>> fact that a context is not added multiple times to the job_list and also
>> holds the job_flags to distinguish if it's currently running.
> I do prefer this over Detlev proposal, so let's move toward this. Would be it
> cleaner though to first remove curr_ctx and then add
> max_parallel_jobs ?

Nice idea. I could move the max_parallel_jobs variable and the new 
function to a new small commit.

I could also move the whole looping and counting of running jobs over 
the jobs to the new commit. But this would cause replacing the curr_ctx 
variable with a `list_first_entry(...)->job_flags & TRANS_RUNNING` and 
drop it in the commit afterwards to replace it with loops.

While the commits would look a bit nicer in the latter example (as the 
removal of curr_ctx wouldn't also prepare for parallel jobs), I think 
the addition and direct removal style is frowned upon and therefore I 
tend towards the first option. On the other side I'm unsure if a 10 line 
patch to just add max_parallel_jobs variable and function with 
everything done in a (removal) patch provides benefit or harms to get to 
the related changes.

>> @@ -252,13 +266,11 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
>>   static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
>>   {
>>   	unsigned long flags;
>> +	struct v4l2_m2m_ctx *ctx;
>> +	struct v4l2_m2m_ctx *chosen_ctx = NULL;
>> +	u32 running_jobs = 0;
>>   
>>   	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
>> -	if (NULL != m2m_dev->curr_ctx) {
>> -		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>> -		dprintk("Another instance is running, won't run now\n");
>> -		return;
>> -	}
>>   
>>   	if (list_empty(&m2m_dev->job_queue)) {
>>   		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>> @@ -272,13 +284,30 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev
>> *m2m_dev)
>>   		return;
>>   	}
>>   
>> -	m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue,
>> -				   struct v4l2_m2m_ctx, queue);
>> -	m2m_dev->curr_ctx->job_flags |= TRANS_RUNNING;
>> +	list_for_each_entry(ctx, &m2m_dev->job_queue, queue) {
>> +		if (!(ctx->job_flags & TRANS_RUNNING)) {
>> +			chosen_ctx = ctx;
>> +			break;
>> +		}
>> +
>> +		running_jobs++;
>> +	}
>> +	if (running_jobs >= m2m_dev->max_parallel_jobs) {
>> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>> +		dprintk("Maximum number of parallel jobs reached\n");
>> +		return;
>> +	}
>> +	if (!chosen_ctx) {
>> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>> +		dprintk("All jobs already running\n");
>> +		return;
>> +	}
>> +
>> +	chosen_ctx->job_flags |= TRANS_RUNNING;
>>   	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);

This is the most prominent example on how to split it up. E.g. either 
keep everything in the curr_ctx removal commit (and just use 1 for 
max_parallel_jobs) or use list_first_head to check if we have a curr_ctx 
and drop it afterwards for the counting logic.


Sincerely
     Sven


