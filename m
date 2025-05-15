Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAB6C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rD/lfR5shuV5ybJiCLvktNaWi4MFp7KktRo4ZjU2ZsE=; b=Zdp8IBKIyaUsScEiXP92cwfeLD
	d25uTt/1KdRPLk0jPtc38/HubQpnRYIyeFryP6qyra4miHVjnwHp/iCziG1FulPgXbsIg/6SlUGhT
	aOX5Z09EeHNMIvRs8cCYAADVN18IG30yDWqxsEswuiDVGMfFSt4WiinzZih7G3MmZP3OUhjvwBg2T
	JPI96Wl1Em0jDep2TXJ0oe8aF/QvM5CyYRwh0U+EqEMWNsd2wznv82UyyeBFINETvXc29cBXVMfXv
	ad9N3Y/Ky5fuOvxPT22F+XdJYLG62Gr05X463tRu+Iq1S5U3/Qo5BEsKQWbmZQ6NUAHPj5m3A7glz
	oWG9BATA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFbou-00000001JxU-22Cz;
	Thu, 15 May 2025 16:52:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFbl3-00000001JPR-440W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 16:48:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3B5A14BF;
	Thu, 15 May 2025 09:48:20 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B05A3F5A1;
	Thu, 15 May 2025 09:48:31 -0700 (PDT)
Message-ID: <89c75451-8a30-42c1-ba2a-a63b818a1a04@arm.com>
Date: Thu, 15 May 2025 17:48:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] KVM: arm64: Allow vGICv4 configuration per VM
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Mingwei Zhang <mizhang@google.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20250514192159.1751538-1-rananta@google.com>
 <5d204cf7-c6a0-455c-8706-753e1fce3777@arm.com>
 <CAJHc60w1rYc9guoideuKpKaukuCyvxu3S7Fidoy3Lh94+_xDiw@mail.gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <CAJHc60w1rYc9guoideuKpKaukuCyvxu3S7Fidoy3Lh94+_xDiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_094834_049746_2D9E13B1 
X-CRM114-Status: GOOD (  19.42  )
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

On 5/15/25 16:55, Raghavendra Rao Ananta wrote:
> On Thu, May 15, 2025 at 3:30 AM Ben Horgan <ben.horgan@arm.com> wrote:
>>
>> Hi,
>>
>> On 5/14/25 20:21, Raghavendra Rao Ananta wrote:
>>> Hello,
>>>
>>> When kvm-arm.vgic_v4_enable=1, KVM adds support for direct interrupt
>>> injection by default to all the VMs in the system, aka GICv4. A
>>> shortcoming of the GIC architecture is that there's an absolute limit on
>>> the number of vPEs that can be tracked by the ITS. It is possible that
>>> an operator is running a mix of VMs on a system, only wanting to provide
>>> a specific class of VMs with hardware interrupt injection support.
>>>
>>> To support this, introduce a GIC attribute, KVM_DEV_ARM_VGIC_CONFIG_GICV4,
>>> for the userspace to enable or disable vGICv4 for a given VM.
>>>
>>> The attribute allows the configuration only when vGICv4 is enabled in KVM,
>>> else it acts a read-only attribute returning
>>> KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE as the value.
>> What's the reason for the cmdline enable continuing to be absolute in
>> the disable case? I wonder if this is unnecessarily restrictive.
>>
>> Couldn't KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE be reserved for
>> hardware that doesn't support vgic_v4 and if kvm-arm.vgic_v4_enable=0,
>> or omitted, on supporting hardware then default to
>> KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE but allow it to be overridden? I
>> don't think this changes the behaviour when your new attribute is not used.
> 
> KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE is reserved for the exact
> situation that you mentioned (no GICv4 h/w support  or if cmdline is
> disabled/omitted).
> Regarding defaulting to KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE,
> wouldn't it change the existing expectations, i.e., vGICv4 is enabled
> if available and set by cmdline?
I was suggesting keeping the defaults the same when your new gic 
attribute is untouched but in the same way that it overrides enable to 
disable you could also allow it to override disable to enable.

Based on Marc's comments this does not seem desirable. As things are 
now, and with your changes, setting kvm-arm.vgic_v4_enable=1 at boot 
implies a promise that vgic_v4 works on the system. As there is broken 
hardware we can't take this promise for granted.
> 
> Thank you.
> Raghavendra

Thanks,

Ben


