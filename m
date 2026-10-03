Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18BACA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 05:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0S4V3r3aKfZmbIl0XJRimbrKxX7ZpuYfEuvFEb6BMW4=; b=ubG3JtNvZG27BELTswXDC5rGSl
	x7v/7cixBDASh4FcPr/Bbnj18uhnSguV2zF+LkzfAPsO4sMLcISGJ1SIaKL2wu4ZES36/9VuvahD0
	0BUYODPMCCJNpzYVK6CYDdK0jd5bwz6taDH4TKLc8YyAXM0wunR1DcLEmkwV3E6v82E+bDV4RsliN
	hhqXRMg8l5Cm7KLg8JQPUk7DI4HDgMoPOIB6mC2zVR707SH9Z6ohQYTDxSzsHNXtAse7ClAQ08D/W
	NUYyJCxV6xgLc3ajAgablvLi5vlBpMGMXUq0BRGh2PhJ0N1LQJ3mhZsbF2FQJ1OiGw7v6Sx4f0Yfh
	rhDIkxNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCsgw-0000000D4Wh-2Y21;
	Sat, 03 Oct 2026 05:53:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCsgr-0000000D4W4-34Pg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 05:53:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2A862F;
	Fri,  2 Oct 2026 22:53:38 -0700 (PDT)
Received: from [10.57.8.170] (unknown [10.57.8.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6D383F85F;
	Fri,  2 Oct 2026 22:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791006822; bh=Y/5WUAxYLssgu4Iz+g+/3NBSAG3D07mwZyV0pgPP1qU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l2zLONPof6gNkcOzAA4NcwT1p7hp3q0YKZisEyAbUksNskY75KsVsFtdpWNBcPDwQ
	 AHC0wncAulPsibkhe2v1hdDo9fSjgHlahQlDCc5zmMcWZUjVZEXP1kf4J9FU/ILqUv
	 sjI866VD2ar0oJ+Vqeolkz9ZrKqc3O76UrB2FEhE=
Message-ID: <83e79119-b331-4640-b2c7-cc8135d71c77@arm.com>
Date: Sat, 3 Oct 2026 06:53:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, will@kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com,
 jonathan.cameron@oss.qualcomm.com
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-6-suzuki.poulose@arm.com>
 <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
 <86se2o2rbs.wl-maz@kernel.org>
 <CA+EHjTwHuJ0u_TTP46zNFKFmBP124XHHLUVhkAUSyfhe92=41w@mail.gmail.com>
 <86pkxs2npx.wl-maz@kernel.org>
 <CA+EHjTy4rb+6z0bqh7sPqACES0EDpURdeoyiFGmdw3p0PENcOQ@mail.gmail.com>
 <86o6dc2ka1.wl-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <86o6dc2ka1.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_225345_906724_6189E6A7 
X-CRM114-Status: GOOD (  12.57  )
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

On 02/10/2026 16:29, Marc Zyngier wrote:
> On Fri, 02 Oct 2026 15:37:00 +0100,
> Fuad Tabba <tabba@google.com> wrote:
>>
>> Hi Marc,
>>
>> On Fri, 02 Oct 2026 15:15:06 +0100, Marc Zyngier <maz@kernel.org> wrote:
>> [...]
>>> Honestly, we introduce the flavor stuff to make it easy to match
>>> things on a particular VM type in a readable way. So why isn't this
>>> reading:
>>>
>>>          if (vcpu->kvm->arch.vm_flavor != VM_PROTECTED_PKVM)
>>>                  return;
>>
>> I know this is a sketch, but just in case: that's inverted. The sync
>> only applies to non-protected pKVM VMs (EL2 ignores it for protected
>> ones), so it would be != VM_PKVM.
> 
> See what I meant about this stuff being completely intractable? I
> still have no idea what it means! ;-)
> 

Just to be clear: unprotected_pkvm() != (vm_flavor != VM_PROTECED_PKVM).
Rather, unprotected_pkvm => (vm_flavor == VM_PKVM).

And the code wanted to bail out early for !unprotected_pkvm(). We can
stick in "is_protected_kvm_enabled()" for unprotected_pkvm predicate

But, I can drop the helper and use the vm_flavor check.

Cheers
Suzuki

> 	M.
> 


