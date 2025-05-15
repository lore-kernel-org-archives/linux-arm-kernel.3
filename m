Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4948DC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 10:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POTzwtkuPL0ceXGBMbPdM0LikwqhOIrMzGDVn6llJmA=; b=KdEQZtt3RsUa+PaSvpcJsbblwG
	MwxgkORVvRcx6gXAB3uWxYi4TtdKjJgQFNSPftkRfN3dAoK2v6yNFe9JDmXToKQUgOPKGhDJgxthF
	p4GUg34NGsg6OIXfcVvlYHxhQYlhP+aV+CDSwwblY5jRag8ElxEzIJAeZcSGCobFDuVJWKG/X578A
	+veBO85vOI6ZXGGlwVJYdbozQsAhjg+3I+vcRYmfI8XWKE2ztrR97frXs3gRZSz+7EJh4e3GtgewY
	CStTR1BHFqi1JPwUD1ejbkALpSS9n7ARaJjyl5MqhziEtnrFPxIlNg0WLmCwcfcLYM7Iwn9wTHJBP
	CGWSe5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFW3A-00000000KBN-3s4f;
	Thu, 15 May 2025 10:42:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVrL-00000000IUh-0zsl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 10:30:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5DA314BF;
	Thu, 15 May 2025 03:30:24 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DAF53F673;
	Thu, 15 May 2025 03:30:34 -0700 (PDT)
Message-ID: <5d204cf7-c6a0-455c-8706-753e1fce3777@arm.com>
Date: Thu, 15 May 2025 11:30:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] KVM: arm64: Allow vGICv4 configuration per VM
To: Raghavendra Rao Ananta <rananta@google.com>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Mingwei Zhang <mizhang@google.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20250514192159.1751538-1-rananta@google.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250514192159.1751538-1-rananta@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_033039_325845_24F49173 
X-CRM114-Status: GOOD (  18.39  )
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

On 5/14/25 20:21, Raghavendra Rao Ananta wrote:
> Hello,
> 
> When kvm-arm.vgic_v4_enable=1, KVM adds support for direct interrupt
> injection by default to all the VMs in the system, aka GICv4. A
> shortcoming of the GIC architecture is that there's an absolute limit on
> the number of vPEs that can be tracked by the ITS. It is possible that
> an operator is running a mix of VMs on a system, only wanting to provide
> a specific class of VMs with hardware interrupt injection support.
> 
> To support this, introduce a GIC attribute, KVM_DEV_ARM_VGIC_CONFIG_GICV4,
> for the userspace to enable or disable vGICv4 for a given VM.
> 
> The attribute allows the configuration only when vGICv4 is enabled in KVM,
> else it acts a read-only attribute returning
> KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE as the value.
What's the reason for the cmdline enable continuing to be absolute in 
the disable case? I wonder if this is unnecessarily restrictive.

Couldn't KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE be reserved for 
hardware that doesn't support vgic_v4 and if kvm-arm.vgic_v4_enable=0, 
or omitted, on supporting hardware then default to 
KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE but allow it to be overridden? I 
don't think this changes the behaviour when your new attribute is not used.
> 
> On the other hand, if KVM has the vGICv4 enabled via the cmdline, the
> VM absorbs this configuration by default to maintain the backward
> compatibility. Userspace can get the attribute's value to check if the VM
> has vGICv4 support if it sees KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE as the
> value. As required, it can disable vGICv4 by setting
> KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE as the value.
> 
...
> 
> 

Thanks,

Ben


