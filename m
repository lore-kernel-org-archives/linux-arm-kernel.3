Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933D7C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 10:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Azc/C3HhF90ci37ecBaOzx+YdXBirsxcxvj2DFleSo=; b=leqJiKB63jcAlIUKcsXxucoYGD
	pLfE4bnFvRJqbU2VSG9GIjpE1WdYdVdJZhDzWn23qKw3o5F484eyb0R9SYUp5TDZ1QyUe0gDONg4t
	JQc+oA0b0CS2LF1AeBCOkETac4SmAYMSl5ONXp6p0v2ZEeW5HQRbc5ETqyQEVBaHFkX8oI3aO8dQp
	yCdX5gZpq8XExrGJzNZsMRxS8NQd3j/cY8+MxRZySihQk35Nv7FrCIJOJSdZnL9JKv7Yrt4z3qwOS
	omYOhT7XisdSwu7DMKXT5861uI6zw3+8FEuf10WmDtLBpKRPV0j6YAUDvJJO+7sfCfCTYg9ipktri
	oAc7kifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7slG-0000000GCT9-0KQU;
	Sat, 19 Sep 2026 10:57:38 +0000
Received: from mail-m20521016483.xmail.ntesmail.com ([205.210.164.83])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7slB-0000000GCSj-3BsR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 10:57:36 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e5ef389a;
	Sat, 19 Sep 2026 18:57:28 +0800 (GMT+08:00)
Message-ID: <7e456d83-96b2-443b-ae51-af64e7e8a150@rock-chips.com>
Date: Sat, 19 Sep 2026 18:57:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] Possible scheduler bug on Rock 5B RK3588 on 7.2.5
To: No SPAM here <nospam@gdead.co.uk>
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-arm-kernel@lists.infradead.org
References: <f15f8166-c1e4-45dc-9ddd-4ec887e415eb@gdead.co.uk>
 <d6232ccc-9876-435f-bea8-43cd169dd185@rock-chips.com>
 <BxAg81spRPHPsVOcNI5jR9tsii3Wi5a_k_BYW6owu3n6D3jn4N6dbkksomSb82KFdp8nT-mY4cyiZzDFHCqtuskOIYxZwBOzAvyYVRy18KQ=@gdead.co.uk>
 <e045dc5b-5b03-4840-ade9-2c8f98c8c885@rock-chips.com>
 <iENNazJ40aK7PPjVcvf8KUzlTm4HMyT85UPc2ez-MfyeJjE2HWX1ujGXIA3BGRwegyOJEZQ86kV7UElMjyBc6V5uCkGyK4NRCdw74ZfJwI8=@gdead.co.uk>
 <11cdc24a-962a-4f44-b91c-445c2ac80c02@rock-chips.com>
 <xGiWqaX7b8GhLlCq5j9_HQ4_L9QWBKmOCsGtfwlLj_hvU8X14OFNW0JWnELcIitXbkxa0JbsyNPLfY8YA8CnRJ6mI2IzJ3kNNPoShy3xcs8=@gdead.co.uk>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <xGiWqaX7b8GhLlCq5j9_HQ4_L9QWBKmOCsGtfwlLj_hvU8X14OFNW0JWnELcIitXbkxa0JbsyNPLfY8YA8CnRJ6mI2IzJ3kNNPoShy3xcs8=@gdead.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa0b95061f003a7kunme8f5713bfdd417
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSB1MVktDQkJNHRhJS0pOQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=iVBQqsbBaFOj0oSc1oW9Xoq8zTcSQidnNeY2MRYM3p0x2W43yDkd1KA71xQF5qy35h0bSU7JWliWpgnTkRmpnvdqscf4EGsC0rlf387TNb7c6/rcp5jBtU+Lh15cx90+dajnRbT3JroBG7MHzBsLvID8trA606mDITWe34ozJgo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=0Azc/C3HhF90ci37ecBaOzx+YdXBirsxcxvj2DFleSo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_035734_619477_568A8614 
X-CRM114-Status: GOOD (  15.64  )
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

On 9/19/2026 12:11 AM, No SPAM here wrote:
> I have now retested with kernel 7.3.0-rc3 and this bug appears to have been fixed. The same command now runs all 8 cores at 100% for the duration of the test and the resulting numbers differ (in favour of the 6.18.52 CLUSTER=n kernel) by a maximum of 0.25% which is measurement error.
> 

Thanks! Looks like this series fixes the problem:

https://lore.kernel.org/all/20260720-rneri-fix-cas-clusters-v6-0-bb500bf4afd4@linux.intel.com/


> Thanks for your attention. This can be marked as solved.
> 
> Trevor
> 
> 
> Sent with Proton Mail secure email.
> 
> On Friday, 18 September 2026 at 02:22, Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
> 
>> On 9/18/2026 3:15 AM, No SPAM here wrote:
>>> Hi
>>>
>>> On Thursday, 17 September 2026 at 03:37, Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>>>
>>>> Hello Trevor,
>>>>
>>>> On 9/17/2026 9:21 AM, No SPAM here wrote:
>>>>>> Would you mind trying to disable `CONFIG_SCHED_CLUSTER` and checking whether
>>>>>> the problem still reproduces?
>>>
>>> trevor@rock-5b:~$ uname -a
>>> Linux rock-5b 6.18.52-current-rockchip64 #1 SMP PREEMPT Mon Sep 14 11:36:19 UTC 2026 aarch64 GNU/Linux
>>> trevor@rock-5b:~$ grep CONFIG_SCHED_CLU /boot/config-6.18.52-current-rockchip64
>>> # CONFIG_SCHED_CLUSTER is not set
>>> trevor@rock-5b:~$ sar | tail -5
>>>
>>> 18:50:15        CPU     %user     %nice   %system   %iowait    %steal     %idle
>>> 19:00:15        all     99.89      0.00      0.11      0.00      0.00      0.00
>>> 19:10:15        all     99.89      0.00      0.11      0.00      0.00      0.00
>>> Average:        all     99.89      0.00      0.11      0.00      0.00      0.00
>>>
>>> Been running stress --cpu 8 since 18:47 and so far it is using all 8 cores at 100%. It would normally have shown the 7/8ths problem after 20s or so, maybe 2 or 3 minutes at max. So I'd say this setting is definitely involved.
>>>
>>
>> Thank you very much for testing. I'm not a scheduler expert, but I see
>> that CONFIG_SCHED_CLUSTER is enabled by default on arm64 [0].
>>
>> Peter is the maintainer and author of this series.
>> @Peter, do you have any further insights? Thank you!
>>
>> This thread background is here[1].
>>
>> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7bd291abe2da09f59dca81f35a4ec220e5e138a2
>> [1]: https://lore.kernel.org/all/f15f8166-c1e4-45dc-9ddd-4ec887e415eb@gdead.co.uk/
>>
>> --
>> Best,
>> Chaoyi
>>
> 

-- 
Best, 
Chaoyi


