Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21BCCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 08:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKc8XxajgpbAp4oVO14ZVT8GcMgk2YyFp+iJHnnAnH0=; b=ofsLjbxUggE7WArANfHcelqrKr
	pR3tyYSmw2s/vax2OZEdaEYPH4FyZEitauGwLVIj2Rdlh5XQwsDTEDlMSF/qR/XnYqVNPKDygtvXm
	pAYhpkoAmqshdSHnjI5Ga/zeEIXi3Yhrlt0ZGPVCjjE7BkLrd3k9eR3uS39y89QqhQmge5zqYgjGV
	cd3HKG0T9edjDboC8aqyZV31jA028S+xenfztAge2mcvmUConAscag2m8VsWqW9j5rCrG5cVwW00F
	2HqBle2eEaFbHC/QD26TD1+G9DALLlk95DtJdb5q9sW0ZLYtUHyF+/G8RLxLHeEF9LmX25kRGCY7E
	QPDlFf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPc1Q-00000003u3N-2Xel;
	Wed, 20 May 2026 08:11:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPc1P-00000003u33-06SU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 08:11:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A21160129;
	Wed, 20 May 2026 08:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C5B1F000E9;
	Wed, 20 May 2026 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779264678;
	bh=OKc8XxajgpbAp4oVO14ZVT8GcMgk2YyFp+iJHnnAnH0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mjgbrDyHAwE4phsUGFHlwC6BKr4Qv3BbzjXDsShbVAPXWah5VfDWClSp+e6szyxtE
	 KaY7dH3A4XNyUQOJ1brykGyoNe+l/1+Ps0DIgm60Mt4mm1ydENLR9tHrZAvvw6SMgf
	 vslRBPUFWEJEadChaOawl3sdcllFEcbA3SHO+P29CgBZwP7kH4Tdvp6+0VHFa7gqBj
	 KcCsgtsYOS14fLZHqhExO11mOLCLe4S8kLjKYyEqLwH03QnFEzz9c7osx270wNc9h3
	 uMspfxaUPhVwR8oa0AWhTw2F7836aBYDSNsqTmctafsVQFi4s0MK91frJMkI9uPW6o
	 6Y1/QLy25w8nA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
In-Reply-To: <yq5apl2txmav.fsf@kernel.org>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh> <yq5alddm5a6w.fsf@kernel.org>
 <2026051404-headboard-cabbage-e09a@gregkh> <yq5apl2txmav.fsf@kernel.org>
Date: Wed, 20 May 2026 13:41:10 +0530
Message-ID: <yq5azf1uqz4x.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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


Hi Greg,

Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:

> Greg KH <gregkh@linuxfoundation.org> writes:
>
>> On Thu, May 14, 2026 at 08:07:27PM +0530, Aneesh Kumar K.V wrote:
>>> Greg KH <gregkh@linuxfoundation.org> writes:
>>> 
>>> > On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
>>> >> Hi Aneesh
>>> >> 
>>> >> On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
>>> >> > Make the SMCCC driver responsible for registering the arm-smccc platform
>>> >> > device and after confirming the relevant SMCCC function IDs, create
>>> >> > the arm_cca_guest auxiliary device.
>>> >> > 
>>> >> 
>>> >> There are a few changes squashed in to this patch. Please could we
>>> >> split the patch in the following order ?
>>> >> 
>>> >> 1. Add platform device for arm-smccc
>>> >
>>> > Do not make any more "fake" platform devices please.
>>> >
>>> >> 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
>>> >> it before the RSI changes)
>>> >
>>> > No, move it to the faux api please.
>>> >
>>> 
>>> 
>>> Maybe I was not complete in my previous reply. I did not want to repeat
>>> the entire thread, so I quoted the lore link for more details.
>>> 
>>> 1. We have platform firmware-provided SMCCC interfaces. Based on the
>>> support/availability of these function IDs, we want to load multiple
>>> drivers.
>>> 2. This patch series adds a platform device to represent the
>>> firmware-provided SMCCC resource.
>>> 3. Different SMCCC ranges are now represented as auxiliary devices.
>>> 4. Different subsystems, such as TSM, can autoload their backend drivers
>>> based on the availability of these SMCCC ranges, which are now
>>> represented as auxiliary devices.
>>> 
>>> You had agreed to all of this in the previous discussion here:
>>> https://lore.kernel.org/all/2025101516-handbook-hyphen-62ec@gregkh
>>
>> Then why did someone say "this is a fake platform device with no actual
>> resources"?  That's what I was triggering off of.
>>
>> Again, if you have actual platform resources, GREAT, use a platform
>> device and aux.  If you do not, then do NOT use a platform device.
>>
>> totally confused,
>>
>> greg k-h
>
> I have now rewritten the cover letter as below. Let me know if this
> helps.
>
> Switch Arm SMCCC firmware services to auxiliary devices
>
> As discussed here:
> https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org
>
> The earlier CCA guest support used an arm-cca-dev platform device as a pure
> software anchor for the TSM class device. That platform device did not
> correspond to a DT/ACPI described device, MMIO range, interrupt, or other
> platform resource; it existed only to make the CCA guest driver bind and to
> place the resulting TSM device in the driver model. The same pattern also
> exists for smccc_trng. Creating separate platform devices for such
> SMCCC-discovered features is misleading, because those features are not
> independent platform devices.
>
> This series changes the model so that there is a single arm-smccc platform
> device representing the SMCCC firmware interface itself. The firmware
> interface, including its discoverable SMCCC function space, is the
> resource: after PSCI/SMCCC conduit discovery, the kernel can query SMCCC
> function IDs and determine whether optional firmware services are present.
> Services such as SMCCC TRNG and Realm Services Interface (RSI) are
> therefore represented as children of the arm-smccc device, and are created
> only when the required SMCCC function IDs and ABI checks succeed.
>
> The child devices use the auxiliary bus deliberately: they are intended to
> bind independent feature drivers, not just to provide a driverless object for
> sysfs or other class-device anchoring. They are firmware-provided functions
> of the parent SMCCC interface that are consumed by separate kernel drivers
> in different subsystems, such as hwrng and virt/coco/TSM. Those drivers
> need normal driver-core matching, probe/remove lifetime, and module
> autoloading based on the discovered firmware feature. The auxiliary bus
> provides a MODALIAS and id-table based binding model for that case, while
> keeping the feature drivers off the platform bus. A faux device was
> considered, but not used because it is suited for simple software objects
> that do not need independent bus/driver binding. The faux bus has no
> feature-driver id-table or MODALIAS matching, so it would not preserve the
> module-autoload flow that the current platform-device based users rely on.
>
> In other words, the parent arm-smccc device represents the firmware
> resource exposed through the SMCCC conduit, and each auxiliary child
> represents one discovered firmware service of that parent. This removes the
> unnecessary per-feature platform devices while retaining automatic loading
> and independent subsystem drivers for the SMCCC services.
>
> The TSM framework uses the device abstraction to provide cross-architecture
> TSM and TEE I/O functionality, including enumerating available platform TEE
> I/O capabilities and provisioning connections between the platform TSM and
> device DSMs.  For Arm CCA, the RSI auxiliary device continues to provide the
> device anchor used by the CCA guest TSM provider.
>
> For the CCA platform, the resulting device hierarchy appears as follows.
> Note that the auxiliary device is parented by the arm-smccc platform device,
> so the sysfs path remains under /devices/platform/arm-smccc/:
>
> $ cd /sys/class/tsm/
> $ ls -al
> total 0
> drwxr-xr-x    2 root     root             0 Jan  1 00:02 .
> drwxr-xr-x   23 root     root             0 Jan  1 00:00 ..
> lrwxrwxrwx    1 root     root             0 Jan  1 00:03 tsm0 -> ../../devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0/tsm/tsm0
> $
>
> The series also replaces the old arm-cca-dev userspace-visible dummy device
> with /sys/firmware/cca/realm_guest for detecting whether the kernel is
> running in a Realm.  This keeps the guest-state ABI under /sys/firmware and
> separates it from the internal driver-binding device used by the CCA guest
> TSM provider.
>
>
> -aneesh

Gentle ping, could you let me know if the updated cover letter helps
clarify the confusion regarding the platform-device usage here?

-aneesh

