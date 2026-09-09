Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B934DC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2cEgJRWmsKaQwVNGpUyNlGqDWKK2HXsEcFeFfwESss=; b=WALTJyP0yWyHWfvhaI0R0ey3ZG
	xRLhin58GcspdXwDZmJLLhjgjxfb3r3/wnUPh8Z4jQwf4TbOwGpQyJM5W1B+ArTwpXdKnGbs9DRXr
	/pzU0yXFDTrN6qiWrK6/1YMevLhxLqZfPh4OV/9tJJ1UzPmqI1P+JX+5MbVdbYRW/omXgxnX140Rs
	Pu78w5Fcm4KoaaL0HmOsoQOG1LOtk3LFEYI2daIdKG3Msdngjf7XBiup3/VEjCwcPhNPAIyp6Ttop
	0KNDfMNXasd0ylg6J6JtzpElwmNEZp9UljlTRbH0VRP/Kyyj4Whhdu3kEBne8ha9/J8arxyQ1Np3u
	Jz4Fl8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IjJ-0000000BqwZ-2jVt;
	Wed, 09 Sep 2026 13:52:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IjH-0000000Bqw4-1Li2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:52:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42A4F176B;
	Wed,  9 Sep 2026 06:52:42 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D96BF3F7B4;
	Wed,  9 Sep 2026 06:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788961965; bh=0e+vVbTn7gtjt+ndYPN+Yizq0HsnlJMP58UYCyMUZOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Esc5UWw4fKnlt/HxqgDDr4fptKWfnfQBakSmMsDI1AQng2kJ1KlAf2z1pXVfuhiEA
	 DwlFBwnYkNFrr2nZ2dxOQpc8wESu8h59eS5xYd9P99CiZ7A+0SniEM8K9KVJoHdCp2
	 9DCtlV43WnuuliMeTCs7hxjSk7+PhoPWPKp8O8Ao=
Message-ID: <ce968e53-58b4-440c-94f4-fdba08dc6dc5@arm.com>
Date: Wed, 9 Sep 2026 14:52:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 00/20] KVM: arm64: CCA: Add basic plumbing for Realms
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <CA+EHjTzr-r1FRuJ-X3E38_SSHsNSz_vdO-8sFOtBdsiB3V_x=g@mail.gmail.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTzr-r1FRuJ-X3E38_SSHsNSz_vdO-8sFOtBdsiB3V_x=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_065247_408477_F17F9141 
X-CRM114-Status: GOOD (  11.55  )
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

On 09/09/2026 14:18, Fuad Tabba wrote:
> Hi Suzuki,
> 
> On Tue, 8 Sept 2026 at 17:22, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> ...
>>   3) NEW: Enlighten KVM arm64 about the different VM types and use call backs for
>>     the VM type, rather than spilling the is_this_type_of_vm() everywhere. This is
>>     not complete yet, but it is largely functional. Adds VCPU and Stage2 MMU related
>>     callbacks with support for the existing VM types.
> 
> A design thought on the vm_flavor dispatch tables. They're
> hand-maintained arrays indexed by enum, and a gap fails silently at
> runtime, not at build: arm64_vm_s2_ops[] has no VM_REALM row, so a
> realm VM would get NULL ops.
> 
> How about something like declaring it unsized with
> BUILD_BUG_ON(ARRAY_SIZE(arm64_vm_s2_ops) != VM_FLAVOR_MAX), as
> host_hcall does? A non-NULL check of the selected ops' mandatory
> callbacks at VM init would catch the s2_ops naming typo Sashiko
> caught, where the rows point at zeroed forward-declared structs.

Agreed, I will add that. The VM_REALM S2 ops will come in the next part,
as we can't have anything meaningful without the RMI backends.

Thanks for the review !

Cheers
Suzuki


