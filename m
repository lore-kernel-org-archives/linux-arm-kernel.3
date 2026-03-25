Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98403103A9B5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+CEHpwsHIER8I63faEhiFYEb2i+3YFWejlcfad6d70=; b=J36AZr85WTptrFsJ2km99dMIcl
	5oLiCfDYUDdQMp5ZCq3bhjo3/49NLpIOvhkqjQEFCWaBNDyhv6r6dgmFBgLqsL8z41yNH6N7Z+pc0
	yiFlpZEBNfatYZSZ/VrtZHtwzkirgacSvOh/By6XaG2clctcVYJaYUAYQvWcZWEGOKbHt3ScQk3TM
	8+np7nJK9AlCZHLJxr06VjE96gw/ekRPEaZ/I3JOzOZx+pK0S1LLoOGEkl+NrtN5jh7RJNvqylYHa
	TDQbdveYegcIVx8Fprybsnz9wqy81iNgKqTPUqwOa2GkncO2G5/IMZBGQhh+DqvO8HKsAxYVC3TRs
	nOaAi+rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MTM-00000003GOY-3YMM;
	Wed, 25 Mar 2026 11:32:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MTJ-00000003GNV-09Do
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:32:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9388F1CDD;
	Wed, 25 Mar 2026 04:32:17 -0700 (PDT)
Received: from [10.57.19.213] (unknown [10.57.19.213])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 200E93F915;
	Wed, 25 Mar 2026 04:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774438343; bh=CxcNnv3bvWvpaqMJwSfMUPZRdGgLZM5A+Xb79R5Z4oM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=FNR9beFUs8r+ioyNQ89JAQIsEcDy8ieVpjLH77MUhzSPkgAIBpEKEezItjyRGacZz
	 +wCtsWOS53DhjqpQojZrW0hOjl0qsrIsLNCBmP8YwfmdWZXB3MnV6tOOPHb/dd6mpc
	 AHpNhzvLWmD2fO70m0FSmJrKvlqbSr7cxBgFNxmU=
Message-ID: <70fb8f35-1874-421a-87f9-5adf53f41ba2@arm.com>
Date: Wed, 25 Mar 2026 11:32:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Gavin Shan <gshan@redhat.com>, Steven Price <steven.price@arm.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <abyAbPIkDn2bGZwd@p14s> <37bc1222-6fc7-48f0-94d3-6eaac420aa55@arm.com>
 <0b7121e7-3c74-4303-a200-01d2b7c535ce@redhat.com>
 <9247d9ea-64b4-4e8e-81f8-3c8e00750acf@arm.com>
In-Reply-To: <9247d9ea-64b4-4e8e-81f8-3c8e00750acf@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_043225_158036_CDA235F1 
X-CRM114-Status: GOOD (  20.46  )
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

On 25/03/2026 10:16, Suzuki K Poulose wrote:
> Hi Gavin
> 
> Steven is on holidays, so I am jumping in here.
> 
> On 25/03/2026 06:37, Gavin Shan wrote:
>> Hi Steven,
>>
>> On 3/21/26 2:45 AM, Steven Price wrote:
>>> On 19/03/2026 23:02, Mathieu Poirier wrote:
>>
>> [...]
>>
>>>>>
>>>>> The TF-RMM has not yet merged the RMMv2.0 support, so you will need to
>>>>> use the following branch:
>>>>>
>>>>> https://git.trustedfirmware.org/TF-RMM/tf-rmm.git topics/rmm-v2.0-poc
>>>>
>>>> This RMM version is expecting a RMM EL3 interface version of at 
>>>> least 2.0.  Do
>>>> you have a TF-A to use with it?
>>>
>>> You should be able to use the 'master' branch of the TF-A repository.
>>> For now you need to set RMM_V1_COMPAT=0 to enable 2.0 support.
>>>
>>
>> In upstream TF-A repository [1], I don't see the config option 
>> 'RMM_V1_COMPAT'.
>> would it be something else?
>>
>> [1] git@github.com:ARM-software/arm-trusted-firmware.git    (branch: 
>> master)
>>
> 
> suzuki@ewhatever:trusted-firmware-a$ git grep RMM_V1_COMPAT
> Makefile:       RMM_V1_COMPAT \
> Makefile:       RMM_V1_COMPAT \
> docs/getting_started/build-options.rst:-  ``RMM_V1_COMPAT``: Boolean 
> flag to enable support for RMM v1.x compatibility
> include/services/rmmd_svc.h:#if RMM_V1_COMPAT
> include/services/rmmd_svc.h:#endif /* RMM_V1_COMPAT */
> make_helpers/defaults.mk:RMM_V1_COMPAT                  := 1
> services/std_svc/rmmd/rmmd_main.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_main.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_main.c:#if !RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_main.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_main.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_main.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_rmm_lfa.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_rmm_lfa.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_rmm_lfa.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_rmm_lfa.c:#if RMM_V1_COMPAT
> suzuki@ewhatever:trusted-firmware-a$ git log --oneline -1
> 8dae0862c (HEAD, origin/master, origin/integration, origin/HEAD) Merge 
> changes from topic "qti_lemans_evk" into integration
> suzuki@ewhatever:trusted-firmware-a$ git remote get-url origin
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git
> 
> 
> 
>> I use the following command to build TF-A image. The RMM-EL3 
>> compatible issue is
>> still seen.
>>
>>      TFA_PATH=$PWD
>>      EDK2_IMAGE=${TFA_PATH}/../edk2/Build/ArmVirtQemuKernel-AARCH64/ 
>> RELEASE_GCC5/FV/QEMU_EFI.fd
>>      RMM_IMAGE=${TFA_PATH}/../tf-rmm/build-qemu/Debug/rmm.img
>>      make CROSS_COMPILE=aarch64-none-elf-                               \
>>           PLAT=qemu ENABLE_RME=1 RMM_V1_COMPAT=0 DEBUG=1 LOG_LEVEL=40   \
>>           QEMU_USE_GIC_DRIVER=QEMU_GICV3                                \
>>           BL33=${EDK2_IMAGE} RMM=${RMM_IMAGE}                           \
>>           -j 8 all fip
>>
> 
> 
> 
> 
>> Booting messages
>> ================
>> INFO:    BL31: Initializing runtime services
>> INFO:    RMM setup done.
>> INFO:    BL31: Initializing RMM
>> INFO:    RMM init start.
>> ERROR:   RMM init failed: -2
>> WARNING: BL31: RMM initialization failed
> 
> This is definitely the TF-A RMM incompatibility.
> 
> Btw, the shrinkwrap overlay configs in tf-RMM repository should work.
> But unfortunately the Linux/kvmtool repositories are pointing to
> internal repositories. The following patch should fix it and get
> it all working. I am working with the tf-rmm team to fix this.

This is now fixed in the branch :

https://git.trustedfirmware.org/plugins/gitiles/TF-RMM/tf-rmm/+/refs/heads/topics/rmm-v2.0-poc/tools/shrinkwrap/configs/cca.yaml

Cheers
Suzuki


