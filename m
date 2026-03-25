Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F7AFEA83B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 10:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sff6aifPqIQ5XOB39IkBnAB3O5n4xjkc2dTIJydy5wU=; b=z9KKlfD/5KiVTiluoXzPoW1D8y
	Xw2t1FIiDruPzDEvuPRRJsRKXFXU4g/Q3T42yfK+SsgrUDuUDJ1FdXTTxAktRl5He7BdBWEynlgBd
	ddwj3Ntgm+eV2VpBlNmPliZBdBkQEEDcuLl2M89QDPOEC5NuMTXt/tKjuH7tMZR805nKypKPwHAf9
	ztLEER72zpW56ZgsCC3LribIhbMFDPLkkPnamnSK7pE9Xvf6k40vxTCIFNRou0t4C9HPo5kS/49HK
	vCLCKrCI3kVnTju+kh6R6YWpcJEUpGSklQZ5SBqPnoGVZtIQwUqcnzWoLXYxWJPhbsFSidZgixdRm
	DfO+aq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LJc-000000037Yg-0m0T;
	Wed, 25 Mar 2026 10:18:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LJU-000000037VP-3rDp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 10:18:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3619316F2;
	Wed, 25 Mar 2026 03:18:03 -0700 (PDT)
Received: from [10.57.19.213] (unknown [10.57.19.213])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4488B3F836;
	Wed, 25 Mar 2026 03:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774433889; bh=LC/v5hyd/W73lE56Dbp7kdnqaJWcyniIrrWkSFekdKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Biqyx7ZNA8b96Qa8f6Ai6NrC0kDDpV4XPbO+NJ3K8yhCVck8MOhtOhe6VouMYJVXf
	 +eN2oXcGyf9PZ+tH3zeyyzoKc5ERU6KBOnCBb+3Ud3vqznCeWc/Yalr+o1VhZddjYW
	 I0bunVmnqB1aTrHuI1qus9pqdkVzezI8aSIvwLa4=
Message-ID: <9247d9ea-64b4-4e8e-81f8-3c8e00750acf@arm.com>
Date: Wed, 25 Mar 2026 10:16:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
Content-Language: en-GB
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
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <0b7121e7-3c74-4303-a200-01d2b7c535ce@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_031813_161268_0C315510 
X-CRM114-Status: GOOD (  18.68  )
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

Hi Gavin

Steven is on holidays, so I am jumping in here.

On 25/03/2026 06:37, Gavin Shan wrote:
> Hi Steven,
> 
> On 3/21/26 2:45 AM, Steven Price wrote:
>> On 19/03/2026 23:02, Mathieu Poirier wrote:
> 
> [...]
> 
>>>>
>>>> The TF-RMM has not yet merged the RMMv2.0 support, so you will need to
>>>> use the following branch:
>>>>
>>>> https://git.trustedfirmware.org/TF-RMM/tf-rmm.git topics/rmm-v2.0-poc
>>>
>>> This RMM version is expecting a RMM EL3 interface version of at least 
>>> 2.0.  Do
>>> you have a TF-A to use with it?
>>
>> You should be able to use the 'master' branch of the TF-A repository.
>> For now you need to set RMM_V1_COMPAT=0 to enable 2.0 support.
>>
> 
> In upstream TF-A repository [1], I don't see the config option 
> 'RMM_V1_COMPAT'.
> would it be something else?
> 
> [1] git@github.com:ARM-software/arm-trusted-firmware.git    (branch: 
> master)
> 

suzuki@ewhatever:trusted-firmware-a$ git grep RMM_V1_COMPAT
Makefile:       RMM_V1_COMPAT \
Makefile:       RMM_V1_COMPAT \
docs/getting_started/build-options.rst:-  ``RMM_V1_COMPAT``: Boolean 
flag to enable support for RMM v1.x compatibility
include/services/rmmd_svc.h:#if RMM_V1_COMPAT
include/services/rmmd_svc.h:#endif /* RMM_V1_COMPAT */
make_helpers/defaults.mk:RMM_V1_COMPAT                  := 1
services/std_svc/rmmd/rmmd_main.c:#if RMM_V1_COMPAT
services/std_svc/rmmd/rmmd_main.c:#if RMM_V1_COMPAT
services/std_svc/rmmd/rmmd_main.c:#if !RMM_V1_COMPAT
services/std_svc/rmmd/rmmd_main.c:#if RMM_V1_COMPAT
services/std_svc/rmmd/rmmd_main.c:#if RMM_V1_COMPAT
services/std_svc/rmmd/rmmd_main.c:#if RMM_V1_COMPAT
services/std_svc/rmmd/rmmd_rmm_lfa.c:#if RMM_V1_COMPAT
services/std_svc/rmmd/rmmd_rmm_lfa.c:#if RMM_V1_COMPAT
services/std_svc/rmmd/rmmd_rmm_lfa.c:#if RMM_V1_COMPAT
services/std_svc/rmmd/rmmd_rmm_lfa.c:#if RMM_V1_COMPAT
suzuki@ewhatever:trusted-firmware-a$ git log --oneline -1
8dae0862c (HEAD, origin/master, origin/integration, origin/HEAD) Merge 
changes from topic "qti_lemans_evk" into integration
suzuki@ewhatever:trusted-firmware-a$ git remote get-url origin
https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git



> I use the following command to build TF-A image. The RMM-EL3 compatible 
> issue is
> still seen.
> 
>      TFA_PATH=$PWD
>      EDK2_IMAGE=${TFA_PATH}/../edk2/Build/ArmVirtQemuKernel-AARCH64/ 
> RELEASE_GCC5/FV/QEMU_EFI.fd
>      RMM_IMAGE=${TFA_PATH}/../tf-rmm/build-qemu/Debug/rmm.img
>      make CROSS_COMPILE=aarch64-none-elf-                               \
>           PLAT=qemu ENABLE_RME=1 RMM_V1_COMPAT=0 DEBUG=1 LOG_LEVEL=40   \
>           QEMU_USE_GIC_DRIVER=QEMU_GICV3                                \
>           BL33=${EDK2_IMAGE} RMM=${RMM_IMAGE}                           \
>           -j 8 all fip
> 




> Booting messages
> ================
> INFO:    BL31: Initializing runtime services
> INFO:    RMM setup done.
> INFO:    BL31: Initializing RMM
> INFO:    RMM init start.
> ERROR:   RMM init failed: -2
> WARNING: BL31: RMM initialization failed

This is definitely the TF-A RMM incompatibility.

Btw, the shrinkwrap overlay configs in tf-RMM repository should work.
But unfortunately the Linux/kvmtool repositories are pointing to
internal repositories. The following patch should fix it and get
it all working. I am working with the tf-rmm team to fix this.



--8>--

diff --git a/tools/shrinkwrap/configs/cca.yaml 
b/tools/shrinkwrap/configs/cca.yaml
index 1c0455ba..0d70a582 100644
--- a/tools/shrinkwrap/configs/cca.yaml
+++ b/tools/shrinkwrap/configs/cca.yaml
@@ -25,8 +25,8 @@ build:

    linux:
      repo:
-      remote: https://gitlab.geo.arm.com/software/linux-arm/fkvm.git
-      revision: stepri01/cca/v13-wip+sro
+      remote: https://gitlab.arm.com/linux-arm/linux-cca
+      revision: cca-host/v13
      prebuild:
        - ./scripts/config --file ${param:builddir}/.config --enable 
CONFIG_PCI_TSM
        - ./scripts/config --file ${param:builddir}/.config --enable 
CONFIG_PCI_DOE
@@ -50,5 +50,5 @@ build:
          remote: https://git.kernel.org/pub/scm/utils/dtc/dtc.git
          revision: v1.7.2
        kvmtool:
-        remote: https://gitlab.geo.arm.com/software/linux-arm/fkvmtool.git
-        revision: stepri01/cca/v13-wip
+        remote: https://gitlab.arm.com/linux-arm/kvmtool-cca
+        revision: cca/v11



Kind regards
Suzuki


> 
> Thanks,
> Gavin
> 
> 
> 


