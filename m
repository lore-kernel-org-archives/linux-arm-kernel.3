Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850F7CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 13:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9WjSlJiO/yCl06s+SrBiBc15vHOc7fvjlmzAutE/kE=; b=rhY9t1cQGZP9BRasnCQ5A5qJnK
	hkhHyqFgGOH791jKTiSuxTpGWqX8nSpwrSoypBvD5eB3/3KJXkU+NAOOoM1O4fVxW3+sI+ZwzaMjb
	SlfHZptW98ErcEiuc0cEwJN15hxyfeoIrMTPOAiT+dITYp1Q+kdjXQfItD4W6Lt29/5+KPyCzrp7d
	fdKF7rrbblWSg3pNCuW3G+xt9Cd8fZtByGI4fWxe60bU7EZIf/pIfO5iAoWQXR3LvP1NCFG/0oOoI
	ozsGzhD4OqKSaXYKdWwXd1xJtOom7ggLacgkV09Lr65qP+giYF80pOUCvEmTeMytxEYas8kaiOJVr
	e8TOkpog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMWN-0000000HP30-3IyN;
	Fri, 07 Nov 2025 13:28:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMWK-0000000HP2Y-1gSz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 13:28:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95A641515;
	Fri,  7 Nov 2025 05:28:41 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E2A43F63F;
	Fri,  7 Nov 2025 05:28:48 -0800 (PST)
Message-ID: <2835dd93-c945-4c19-9d10-0271b14147b2@arm.com>
Date: Fri, 7 Nov 2025 13:28:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: ETR: Fix ETR buffer use-after-free issue
To: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linu Cherian <lcherian@marvell.com>,
 Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
 <176235893222.387743.2128022832743502879.b4-ty@arm.com>
 <CAJ9a7Vji3fFnc-XPhdTxh00QW+AjqLqJo=zt+SMwovttQRwR8Q@mail.gmail.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CAJ9a7Vji3fFnc-XPhdTxh00QW+AjqLqJo=zt+SMwovttQRwR8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_052852_482680_53BC59CE 
X-CRM114-Status: GOOD (  14.67  )
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

Hi Mike

On 06/11/2025 14:14, Mike Leach wrote:
> Hi,
> 
> Is this fixing the correct problem? If we prevent the buffer size from
> being changed while the sink is active - which is probably what we
> should do anyway as no real good can come from allowing this - then
> the problem disappears.

Good point. But this is completely fine for a running "sysfs" session,
as the values are not updated (unlike perf, where the session is
scheduled out and put back in ). So, I don't see why we can't change
the values while the sink is active ?


> 
> Changing the buffer size while the sink is active should return -EBUSY;
> 
> Mike
> 
> On Wed, 5 Nov 2025 at 16:13, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>>
>> On Tue, 21 Oct 2025 16:45:25 +0800, Xiaoqi Zhuang wrote:
>>> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
>>> and enabled again, currently sysfs_buf will point to the newly
>>> allocated memory(buf_new) and free the old memory(buf_old). But the
>>> etr_buf that is being used by the ETR remains pointed to buf_old, not
>>> updated to buf_new. In this case, it will result in a memory
>>> use-after-free issue.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] coresight: ETR: Fix ETR buffer use-after-free issue
>>        https://git.kernel.org/coresight/c/35501ac3c7d4
>>
>> Best regards,
>> --
>> Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> 
> 


