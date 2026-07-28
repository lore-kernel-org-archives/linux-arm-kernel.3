Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C488C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dD+5yzYswGYTYSmTNazeAQDj3/IyAwDz+u9BUEk0yZk=; b=i4NSoVSL8ocSboChQdtw0RtFDR
	SeEsj1KeYGWnGUFzOXL5wK1cFHgJT2+KrXW44jjx8PEnvS0AFeazYdzMAK1T6IqYSsNheXwV3Da0V
	mUQfhpaAii3L2ZuPha0SGnrXnfBt3E65PgkcK/PU5/co6cA5Ij6t6rhXB0vM2tYSb/Y/+eMSCoet/
	mAJnb60i3VlAeIGG35NuKxFPHYVoDMWx2op5szvy3C/Q7aYYCBE43h9LFIssdJIvDMssyRRMWBYmi
	jf76vwWIeM/TlMJoQUo4OEoyuANRBO56HrXALOuY+bsvnRoJFJFyGbZm47V2UuJdNbDJzboZH3MyJ
	rTOVOrGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogtt-00000005Ewz-0wlk;
	Tue, 28 Jul 2026 12:27:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogtq-00000005Ewc-3PYm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:27:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B99E169E;
	Tue, 28 Jul 2026 05:27:05 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3100B3F86F;
	Tue, 28 Jul 2026 05:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785241629; bh=sYYt6cI0080YA60MeNLf3+IrwQthG96nJA0VrCXztJQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e/tMzIazapcHE8Y5I2uvyIENrVnHroCCalDfCKuYAiVeBjo0L7hAc1sdETKNEpFKU
	 6xYMybDFAlq7wJYF4aXXKlFLP/K0jgov6FS0KoLcR8Mszl/9Vj0mvKgRuMwVO9UNsg
	 c3c8z1JGdughm9tnhKM71P8o6AqovBc2afARpahE=
Message-ID: <7219109a-82ac-4a7a-9706-e4db9c243eb5@arm.com>
Date: Tue, 28 Jul 2026 14:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] arm_mpam: add MPAM-Fb MSC firmware access
 support
To: Sudeep Holla <sudeep.holla@kernel.org>, Ben Horgan <ben.horgan@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260723155454.1760823-1-andre.przywara@arm.com>
 <20260723155454.1760823-9-andre.przywara@arm.com>
 <b9502a40-8075-48fc-8ff1-3ae17741ea73@arm.com>
 <20260724-mule-of-sudden-gaiety-9e3933@sudeepholla>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260724-mule-of-sudden-gaiety-9e3933@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_052710_954745_2303874F 
X-CRM114-Status: GOOD (  19.75  )
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

On 7/24/26 20:03, Sudeep Holla wrote:
> On Fri, Jul 24, 2026 at 06:08:52PM +0100, Ben Horgan wrote:
>> Hi Andre,
>>
>> On 7/23/26 16:54, Andre Przywara wrote:
>>> The Arm MPAM Firmware-backed (Fb) Profile document[1] describes an
>>> alternative way of accessing the "Memory System Components" (MSC) in an
>>> MPAM enabled system.
>>>
>>> Normally the MSCs are MMIO mapped, but in some implementations this
>>> might not be possible (MSC located outside of the local socket, MSC
>>> mapped secure-only) or desirable (direct MMIO access too slow or needs
>>> to be mediated through a control processor). MPAM-fb standardises a
>>> protocol to abstract MSC accesses, building on the SCMI protocol.
>>>
>>> Add functions that do an MSC read or write access by redirecting the
>>> request through a firmware interface. For now this done via an ACPI
>>> PCC shared memory and mailbox combination.
>>>
>>> Since the protocol used is only a small subset of the full SCMI spec,
>>> and the SCMI protocol has no full ACPI support anyway, open-code the
>>> (simple) SCMI message generation, for just the fields we need.
>>>
>>> [1] https://developer.arm.com/documentation/den0144/latest
>>>
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>> ---
>>>   drivers/resctrl/Makefile        |   2 +-
>>>   drivers/resctrl/mpam_devices.c  |  27 ++++-
>>>   drivers/resctrl/mpam_fb.c       | 197 ++++++++++++++++++++++++++++++++
>>>   drivers/resctrl/mpam_internal.h |  20 ++++
>>>   include/linux/arm_mpam.h        |   2 +-
>>>   5 files changed, 240 insertions(+), 8 deletions(-)
>>>   create mode 100644 drivers/resctrl/mpam_fb.c
>>>
> 
> [...]

[ ... ]

>>> +
>>> +	writel_relaxed(PCC_CHAN_FLAGS_IRQ, &pcc_shmem->flags);
>>
>> Are you sure it's ok to unconditionally set this irq bit? I know we found out that we do need it set
>> sometimes. What does setting it actually based on what the platform does look like?
>>
> 
> You need to set it if you are not polling the PCC channels for completions.

So I was wondering about that: why does the PCC *user* need to set it 
here? That's probably more of a protocol issue, but to me it breaks the 
abstraction: MPAM-Fb just uses the mailbox provided via PCC, and doesn't 
care about whether it's polling or using an interrupt, because that is a 
PCC detail.
So is there a way to figure this out cleanly? I only found that one 
could possibly chase down the "struct mbox_chan" controller struct, then 
look at txdone_method, or something similar, but that sounds very dodgy?

Do you have any ideas on this?

Cheers,
Andre

