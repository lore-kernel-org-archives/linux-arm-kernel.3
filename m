Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA3DC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 06:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfk4cJE/2TH75hcZwf8G295/UuF1Hgth6EccecOFI0w=; b=I0C0AjIuTjxbWqNDkMLgyZx9XO
	MzLVbdrFjuYNRu3HcW4t+ys02zu9VjiiEgUpUsaC6QOlt4FQUjmw1HIh4Tps2RCpkfzAAZmYiMc2j
	Qt9qBShjtIDdj0PNY0LqtODGPKBK26V4yuQbScvj0BmI4uaC3qmXSTacBqAfVGNgn6EJduqUKEqtI
	h2OTYDXCG8T8VOlJl247FX/H35AjMFmoLFqNYTYlhlmTCr1qSnoWZjNcSuv3WrnVkosUTKg0zsejT
	cSQ4XS7GD3uArXOq/FWRbG28mimoYmL2pb10YRjpD77UgytCh+S2rZPCauZA4CrsbGCz9si06UUMh
	jhqMpbqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zRp-0000000CkQY-0qlZ;
	Fri, 25 Sep 2026 06:30:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zRm-0000000CkPs-2Ldl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 06:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790317813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yfk4cJE/2TH75hcZwf8G295/UuF1Hgth6EccecOFI0w=;
	b=KroggXHR1fMwwuU+378JKkSYvLAQn6eNXgBemoOBS83tUSIQbyCbp6iTujkZ4n91EUyilz
	G51DWqVOS6MXiUyk3ztWjn8ciBaCOmetlfTYgyHL7cPfw9E3PGgj1gF1CW6AKkhonGBzP4
	gzW+3/9P2X8wZSxy30V039iJg/AsLxg=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-Q2bdqFt9N8SJyy8io5yNYw-1; Fri, 25 Sep 2026 02:30:10 -0400
X-MC-Unique: Q2bdqFt9N8SJyy8io5yNYw-1
X-Mimecast-MFC-AGG-ID: Q2bdqFt9N8SJyy8io5yNYw_1790317810
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8688139460bso625520b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 23:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790317810; x=1790922610;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yfk4cJE/2TH75hcZwf8G295/UuF1Hgth6EccecOFI0w=;
        b=WVf+dUiR67VnHKINaSWqZoIKyPdjP05ZPECiAkHLuohYgP4WnD86D7MiDrcAgCxk4O
         iXpy4RWB0h4OELIF2njTeeBo4l7cwsxqBPLyhbA+8GRhJJmOnhL2FgA3dKYWEItWjxJv
         mm2A/OSVKt+6dKZAUo4JCHZlPbF/LqbY7zo5GEZtV2jKFvpj0d46JxeytHa/FL+MbvwO
         8dDg1GEKdV3yr3gGkGh8HZdPM9ajy5VXgIMgCnuOtLbz3flKjspnAuovKNcPddaBp9hz
         eQNwnaTMuuTZOJpAkyVSLT5fV8NzL2nd3CtTeec9jc1HzJI0TAnjiZpOSFMJFKIvdSO9
         a6Ng==
X-Forwarded-Encrypted: i=1; AKwUvBzJZPOJ4JLfFn/R7EAb1pCxnvSVif3mbMEibUKNsg71KRHZdh8aPHeTKkXLPxsCMqdczv76Wpw9ATQfGYJlBG5p@lists.infradead.org
X-Gm-Message-State: AFuF++k7GS4D56UFp4SBC0Jk+HJfa6aX3p/asMIvu+Nu6NhokDHHv4b5
	UB3Y3sHVHu8yJOA2TRRDGubIJfjTsXUX5GAHryWjv5k9UEaJcXif8ThIGCoVmkt2FNSYc+L+Ai3
	4OWHUiDALaBCRPxX2kpR0WNJDVVrZxSVFhkP3JZAPhbLuHo5t2Mc5hPdTG5xyFCLmXSOAiTc0XW
	u6
X-Gm-Gg: AYBFou2b3eeJdhgrmTy3Fy1tlPyXPNMP7YpsxfCa2qSVu5Qsvdepr4gvI9fgbuWko5B
	zFz9SZsFHFi517ddEuWetcdozTUfAsl22ZN04JubuY9jtlRw44QqY9ep4ySxtESNGfrX6x4KCNv
	6MPNoKXhtkXIr1DzXH/LouiVjj8Z2YyS+ljYPtYz0sFxEb6VUftVWIXos5QB3f2MLXxmt21ob2C
	EvBn6tP+msjRDdsjSNZC9XurGByxEErzIo5LxxT2mpGfzfJYNfbfnUVCl45GZZ2qBKLWqJnvxTR
	hjHIy0vCHLUIw+pax1pKe6JBF5VDxz/SuKYl2rvC0lYv89VRaXkT5wS4BPBr/Hq9GM0Ac2H69Yx
	7zOPST/X+5Cmf+MPmKoVffjppw67ilo082lbT13zwaA==
X-Received: by 2002:a05:6a21:7104:b0:3cd:9f99:3381 with SMTP id adf61e73a8af0-3de0e539da5mr4380952637.0.1790317809597;
        Thu, 24 Sep 2026 23:30:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:7104:b0:3cd:9f99:3381 with SMTP id adf61e73a8af0-3de0e539da5mr4380923637.0.1790317808985;
        Thu, 24 Sep 2026 23:30:08 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7879057f2sm709257a12.5.2026.09.24.23.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 23:30:08 -0700 (PDT)
Message-ID: <fd404549-9c40-4fdf-9259-104c28b64c76@redhat.com>
Date: Fri, 25 Sep 2026 16:29:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 0/7] firmware: arm_rmm: Add RMM v2.0 base RMI support
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260924135201.850038-1-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lhOzmKqNTgnU00Q7ycVkP1v9kGhV4bJTf_-oo8I0fLg_1790317810
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_233014_764326_9E0BC418 
X-CRM114-Status: GOOD (  45.59  )
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

On 9/24/26 11:51 PM, Suzuki K Poulose wrote:
> This series adds the generic firmware layer for talking to the Realm
> Management Monitor (RMM), as specified by the RMM v2.0-bet3
> specification[1]. It is the first part of the Arm CCA host support that
> was previously posted as part of the larger KVM series.
> 
> The split allows this RMM support to be used as a base for other work,
> including Aneesh's PCI IDE support with Arm CCA RMM as the TSM,
>   without depending on the KVM Realm support that will follow as separate
>   series. (See more on that below)
> 
> The series adds:
> 
>   * The RMI SMC definitions and direct-call wrappers.
> 
>   * RMM discovery and version checks during firmware init.
> 
>   * RMM host configuration, including the host page size.
> 
>   * Stateful RMI Operation (SRO) infrastructure for commands which the RMM
>     can complete across multiple SMC calls while requesting or returning
>     memory to the host.
> 
>   * Verification that granule tracking is available at fine granularity.
>     Fine-grained tracking allows each granule in the system to be tracked
>     independently, which is required before individual granules can be
>     delegated. A future series will add support for dynamically supplying
>     memory to the RMM for this tracking.
> 
>   * Support for fully firmware-managed systems, where the Granule Protection
>     Tables for memory regions are allocated and managed by firmware. RMM v2.0
>     also allows dynamic GPT creation on demand; support for that will be added
>     in a later series.
> 
>   * Wrappers for the RMI commands that are used for managing the "Realm VM"
>     lifecycle. This is added in to make it easier for the on-going KVM support
>     to evolve in parallel pieces.
> 
> If the platform firmware cannot manage the granule tracking or the GPTs, we
> bail out and deactivate the RMM, reclaiming any memory that we have donated.
> 
> The RMM v2.0 spec introduces Stateful RMI Operations (SROs), which allow
> the RMM to complete an operation over several SMC calls while requesting
> or returning memory to the host. This allows interrupts to be handled in
> the middle of an operation and lets the RMM dynamically allocate memory
> for internal tracking purposes. For example, RMI_REC_CREATE no longer
> needs auxiliary granules to be provided up front, and can instead
> request memory during the operation.
> 
> This series applies on v7.3-rc2 and a branch is available at [2]. The KVM
> CCA support that builds on this series is available at [3] as an integration
> branch. The KVM support depends on guest-memfd-in-place conversion support v13
> from Ackerley [4], we plan to split that into parts, which apply cleanly on
> v7.3-rcx without any dependency and is in progress. This will be made available
> as soon as it is ready. Until then [3] shows how this base series enables KVM
> CCA support. You may find the tf-RMM [5] and kvmtool support [6] below.
> 
> [1] RMM spec : https://support.arm.com/documentation/den0137/2-0bet3/
> [2] This series: https://gitlab.arm.com/linux-arm/linux-cca.git cca/cca-host/fw_rmm/v19
> [3] KVM CCA v17 integration branch: https://gitlab.arm.com/linux-arm/linux-cca.git cca/cca/cca-host/kvm-v20/integration

s/v17/v20 ?

> [4] Gmem inplace conversion https://github.com/googleprodkernel/linux-cc/tree/guest_memfd-inplace-conversion-v13
> [5] TF-RMM https://git.trustedfirmware.org/TF-RMM/tf-rmm.git main (commit: 134266ae)
> [6] kvmtool https://gitlab.arm.com/linux-arm/kvmtool-cca.git tag:cca-kvm-v20 (Also cca/kvm-v18)
> 
> Known issues: RMMv2.0 spec.
>   * RmiOpMemDonateReq:count (Uint14) is incompatible with RmiAddrRangeDesc4KB
>    (Uint10) and RmiAddrRangeDesc16KB (Uint12). i.e., a larger contiguous request
>    may not be satisfiable by the host. This is resolved in the RMM spec, by clamping
>    the upper limit on the number to match the RmiAddrRangeDesc* and will be published
>    in the next release.
>   * RMM to clarify the scenarios that triggers the RMI_BLOCKED and the
>     recommendations to limit the cases.
> 

Applied this series on top of upstream linux v7.3.rc4. The built kernel can boot up on
GH200 machine and CCA host emulated by QEMU with various combinations: 4KB or 64KB base
page size, CONFIG_ARM_RMM_RMI is {Y, N}. The RMI is only detected and configured on CCA
host when the base page size is 4KB because RMM only support 4KB granule size at present.
Details can be found from TF-RMM/runtime/rmi/granule.c::smc_rmm_config_set(). Besides,
some of the added functions based on the RMI calls aren't covered by the tests obviously.
So I think this series doesn't introduce regressions at least.

Tested-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin

> Changes since v18:
>   - Use _ULL version for masks spanning beyond 32bits
>   - Add GENMASK, FIELD_* friends for RMI_ABI_VERSION_*
>   - Consistent naming for masks and order the fields by MSB to LSB (missed out
>     ones.
>   - Rename RMI_RETURN_ => RMI_RESULT, RMI_RETURN_INDEX => RMI_RESULT_DATA_LEVEL
>     and add relevant Rmi types for clear indication on what they represent.
>   - Read and cache all implemented RmiFeatureRegisters (5), use ARRAY_SIZE()
>     droping the macro for the number of registers.
>   - Fold sinlge caller rmi calls to the caller (rmi_features)
>   - Drop "default y" from Kconfig
>   - Don't loop forever with RMI_BLOCKED, instead retry once and return to the
>     caller.
>   - Move rmi_config_set closer to rmi_configure.
>   - Use __free() cleanup for rmm_config object
>   - SRO: Clamp the mem donate request count to RMI_MAX_ADDR_LIST (the max we can
>     hold in the struct sro, to prevent overflows in handling non_contig requests
>   - Donate gathered memory when sro list runs out of space for non_contig case
>     and donate the rest in the next iteration
>   - Fix handling of buggy RMM for rmi_delegate_range()
>   - Add comments for the exported interfaces rmi_delegate_range(), rmi_undelegate_range()
>   - Move rmi_granule_{,un}delegate_range() closer to their callers
>   - Clarify the requirements for rmi_granule_delegate_range()
>   - Fix return result to -ENXIO if the MEM_OP is unknown
>   - Handle unsupported RMI_OP_MEM_CONDITIONAL, bail out early
>   - Rename "out" lable to mem_donate, where the actual donation happens
>   - Switch to use readable loop construct in donate_noncontig, add comments
>     to explain what we do.
>   - Add comment, make the code reader friendly for caching the entries not
>     consumed by RMM.
>   - Add documentatoin for rmi_sro_execute()
>   - Avoid mixing gotos with __free cleanups for arm64_init_rmi()
>   - Convert the remaining nested if for results to early return based.
>   - Pass out_top for RMI_ERROR_RTT in rmi_rtt_destroy() [ This boosts the
>     Realm tear down ]
> 
> Changes since v17:
>   - All RMIs are now issued using smccc-v1.2 helpers as mandated by the RMM
>   - Add a helper function to reclaim an RmiAddrRange entry, which may be partially
>     consumed. Used by rmi_sro_free and by rmi_sro_donate_*contig to reclaim
>     partially consumed granules.
>   - Move all RMI wrappers that are used only by rmi.c out of the arm-rmi-cmds.h
>   - Rename macros, varibles to match RMM spec
>   - Handle buggy RMM cases and sanitise the output values
>   - Change sro_state.addr_count to int, giving us better handling of overflows
>     and RMM bugs.
>   - Avoid splling literal pools on stack for sro initialisation.
>   - Print error messages for critical failures during RMM init
>   - Use scope based cleanup for SRO object
>   - Prevent overflow for donated_granules output from buggy RMM
>   - Handle corrupted addr_count in the sro
>   - Handle buggy RMM when the out_top is not changed with RMI_SUCCESS
>     for delegate/undelegate range calls
>   - Rename free_delegated_page => rmi_free_delegated_page
>   - Rename donate_req_to_unit_size => donate_req_to_block_size
>   - Introduce rmi_addr_block_size_to_bytes() helper to convert a RmiAddrBlockSize
>     encoding used in RMI_DONATE_REQ and RMI_ADDR_RANGE Descriptors, replaces
>     donate_req_to_unit_size(). Matches the RMM spec.
>   - Rename unit_size => block_size_fld, unit_size_bytes => block_size etc.
>   - Explicitly check for MEM_CONTIG/CAN_CANCEL fields to match the RMM spec values.
>   - Rename free_delegated_page => rmi_free_delegated_page()
>   - Drop RMI_BUSY, RMI_BLOCKED checks from rmi_*delegate_range as they are already
>     handled by the rmi_smccc_invoke() used by the SRO.
>   - Ensure RMI_OP_RECLAIM output is valid before consumption
>   - Use GENMASK()/BIT() for masks consistently for RMI SMCCC defintions
>   - Rename RMI_{ADDR_RANGE, DONATE}_SIZE => RMI_{*}_BLOCK_SIZE
>   - Reorder the definitions for MSB to LSB
>   - Add definions for RMI_OP_MEM_*CONTIG and RMI_OP_CAN*_CANCEL
> 
> 
> 
> Steven Price (6):
>    firmware: arm_rmm: Add SMC definitions for calling the RMM
>    firmware: arm_rmm: Check for RMI support at init
>    firmware: arm_rmm: Add support for SRO
>    firmware: arm_rmm: Activate the RMM
>    firmware: arm_rmm: Ensure the RMM has GPT entries for memory
>    firmware: arm_rmm: Add wrappers for Realm related RMI commands
> 
> Suzuki K Poulose (1):
>    firmware: arm_rmm: Configure the RMM with the host's page size
> 
>   arch/arm64/Kconfig                |    1 +
>   arch/arm64/kernel/cpufeature.c    |    1 +
>   drivers/firmware/Kconfig          |    1 +
>   drivers/firmware/Makefile         |    1 +
>   drivers/firmware/arm_rmm/Kconfig  |   25 +
>   drivers/firmware/arm_rmm/Makefile |    2 +
>   drivers/firmware/arm_rmm/rmi.c    | 1072 +++++++++++++++++++++++++++++
>   include/linux/arm-rmi-cmds.h      |  558 +++++++++++++++
>   include/linux/arm-smccc-rmi.h     |  505 ++++++++++++++
>   9 files changed, 2166 insertions(+)
>   create mode 100644 drivers/firmware/arm_rmm/Kconfig
>   create mode 100644 drivers/firmware/arm_rmm/Makefile
>   create mode 100644 drivers/firmware/arm_rmm/rmi.c
>   create mode 100644 include/linux/arm-rmi-cmds.h
>   create mode 100644 include/linux/arm-smccc-rmi.h
> 


