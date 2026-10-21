Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BBF606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m7tlYOJD;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DRkcpboT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cz8+V7XCKKhBDpf80aiJInY1iYNOWN4+wC7qm69EtcE=; b=m7tlYOJDSQTBUAViVB0quaIH2r
	R4DiehncHFII4XRRShuEK/0zC3WyunObS1fPBYRgfC/g0KCELu+r1X5HjFesv374KjrpvccjS+y0B
	GACclxX1sn03s/8CBkfbHEhl8say82WiHCp/JaQI8qJmqbT7HuEbjOQ1jnea8EXfBFn23GeYma6CV
	LVnmCbpu4VHJMZaGqQ9mHw86dS6QRzlmPV3MOH3IjxNNRsBxTYvTgZru5eh3BMBgstiEhZubICKVO
	hnFw+KOsX8A1aBtBl4kccEBXYrxuQ0Rc+Yg6Nb9bAqkwD5snQI5Iopma8NO+aXJ1fDGFilmDF8wJG
	RVnrfnbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJT5T-0000000BYDu-2HVG;
	Wed, 21 Oct 2026 09:58:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJT5Q-0000000BYD0-1v3L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 09:58:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75B8216F8;
	Wed, 21 Oct 2026 02:58:14 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4FE73F7D8;
	Wed, 21 Oct 2026 02:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792576697; bh=IDazUdpoih0dXqrNnstcGcC5WHNZlytoR2PIn318lzU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DRkcpboTgyBklO5nuoilzcuW60prH769ubwJBYdbsa7qFkOBtmzSkDopdCyhAq/Vf
	 0xUBoqHSlTFtlUGpNPuruwGePjNOawfP0umRaLeQQ9ORXwAvjKwdlEFaU0NFOaBVsD
	 x51xk7Lm3RaVhL6tF2NWgRDq+mj7fmlqjVsqiIGY=
Message-ID: <5d487949-9195-442f-97af-acb9e3fdfb0d@arm.com>
Date: Wed, 21 Oct 2026 10:58:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 5/7] firmware: arm_rmm: Activate the RMM
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-6-suzuki.poulose@arm.com> <arZmXFw5Jw2IbAmA@arm.com>
 <a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com> <araketG70TIKeNuf@arm.com>
 <12e83d88-de4c-4230-aac2-1796123320ad@arm.com>
 <70d47475-e26e-40e1-b409-b0c16aecb8c0@arm.com>
 <195cdfe4-a55a-453f-9c34-620738eca244@arm.com> <arqrZ_Auk9BYOopa@arm.com>
 <0f68dcff-1dfe-4515-9912-515ca6457674@arm.com> <arudWVBPXcnUvYNh@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <arudWVBPXcnUvYNh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_025820_541360_8C3864EF 
X-CRM114-Status: GOOD (  15.81  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29/09/2026 12:15, Catalin Marinas wrote:
> On Mon, Sep 28, 2026 at 07:28:20PM +0100, Suzuki K Poulose wrote:
>> On 28/09/2026 19:01, Catalin Marinas wrote:
>>> possible, to defer the RMM activation until the first user (still do the
>>> RMI probing as an initcall). If we run on RME-capable hardware and
>>> firmware but don't care about realms or TSM, we still get the normal OS
>>> functionality.
>>
>> Would you prefer this in the first drop of the RMM ? Or is this
>> something we could add as a separate series ?
> 
> I think we could add the deferring as a separate patch, maybe together
> with the KVM bits. An advantage of keeping it here if we merge this
> first is that we still exercise the activation path without full realm
> support or TSM. Otherwise a lot of this would be dead code until the
> other series arrive. Either way, do it as as separate patch on top of
> this series.
> 

I have been looking at the "on-demand" activation support and came
across the following design decision.

* We have KVM_CAP_ARM_RME which advertises that KVM can create Realm VMs
   to the userspace. A VMM could check this before it creates a Realm VM
   using KVM_CREATE_VM with type=RealmVM.


Now, we could delay the RMM activation as late as the KVM_CREATE_VM and
kick it off while we initialise the kvm as part of kvm_arch_init_vm().
But if that fails, we would fail the KVM_CREATE_VM.

The question is, what should KVM_CAP_ARM_RME indicate ?
We could initially enable the cap based on the presence of RMM (but not 
activated). However, should we turn the KVM_CAP_ARM_RME=off when we fail
to activate the RMM ? Is that senisble ? (i.e., runtime disabling a cap).

Cheers
Suzuki




