Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501F9D6A25B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 22:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmfl4ABMHKTZoUV+lq2tWxxUXbB701RvLpr8o/rw01k=; b=18bWZKgLuLt2FwGQl7OfKG2f8V
	THJ6TyyhsBGEfsbxi6SButfR/DsbhArQwBuj7YbUfd/BOZwtbKJkitEqvGSUB1LOz4KGhK21M27r2
	kacMk1IKmfj6WCEruXYbfjQbbz02Qj/Kkfa1br+hjOZ8sqsYc8EAQp339IPjjhsLwGfN3wYH1uSL0
	v+ABP+tri7G0RyzseMzFl9wf7u9kVeHVmr8YdVk4aQ/G6yivbdOqy8ESjGHtYEd2GmKRKfPl/fo9m
	2ho8Omu/FGNyXQ34KjXsBfFrxBZE+F1E1jIRmfIVR1e2gaEQkn25Nk394TdFsBRxOsEolXMsdoT2B
	m8SgGEiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBimg-000000012ep-0zLr;
	Thu, 14 Nov 2024 22:57:54 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBilh-000000012Tl-40jy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 22:56:55 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ff57619835so11337791fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 14:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731625011; x=1732229811; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pmfl4ABMHKTZoUV+lq2tWxxUXbB701RvLpr8o/rw01k=;
        b=g+G5kWLinPBoFhU8juQ08taV33Kxo/XYDoXNvGfLq6gcWKjLmcgVNCZPCEnoLkydEw
         zdBymXAq3wgd0A8B+8O8clEzpWU428jgenEwM6WrkByXaT1K8XDLBASgtHlo05D2o4V5
         3GWpYW6w1LdGNu2J4pLLnF3GNW8wZNZaTPYQ/NWABIRbPdrX9KSouhw7M9A5UhSBjhdV
         upOi4WnhXEmyPKPjXN6QVsE7iT1bpz+9FHFB8CoAP3/HY3FAH8Qhunje6/UWhQyliaXU
         pY7Zq8ClcGi+ZYqUzfO8NBdppIbjj3+NZQS+FyPPKzVL+RhNk3qN1Oqe2PSmu0+NwQnh
         mYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731625011; x=1732229811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmfl4ABMHKTZoUV+lq2tWxxUXbB701RvLpr8o/rw01k=;
        b=EAuIBflyhZ4AZ3j3qKcCLZZ18vL2D0nexLBKmbWeGu+ItTD1SLi9eM81slZdlMQ9fD
         wti4t4HQLUrAjV5zCSDE538dhBDLkm0+O9bhjAK13eONHAVRshuJtUYChvasDtedAPbH
         e2eC0J1SDwPREu41QSGEJ7aEuUfI9P714ZK+msAN3Y+h8U/SB2MmSEWJjs0Ng4DiIwKZ
         4LbwnLZQZssm/v1V0zTO0hVK+NcDwKDEt7T+t7ezHDV/WtHZ15mNB46U/mfrFUHGuhKZ
         iUvZH27DDpfMgmIzaRyyYC2hs6Ku1NskMyIXX7+0RSQtpqKhFNQ+TF0wMkVZKWXHbnWp
         xM5A==
X-Forwarded-Encrypted: i=1; AJvYcCVsqdy9T/HwksfdB8otcN2zNapGXRzXuvVev20GG2ouCbN8L6XWKQ1y0uVN3QWqhDaxGIb2hB6yrGxpHVsAcoui@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6wCjRWjFGmjQJiamZfP9FmPS/q6OZgMEjnfsBD1knULtedCfH
	zaYUwyvWzoIxMaNzxkCEmAbBp+tlyEdgwLVwdiWy5fP5mkVfq9Kdo0NL3ILvmbc=
X-Google-Smtp-Source: AGHT+IEhSysQVbCIC6kPYuyMdKoQmxs6cO/QkESpuAOJA6wYmBlWbrN9ca+N830zp4N5gFihdpMAbg==
X-Received: by 2002:a05:651c:221b:b0:2fb:597e:28f5 with SMTP id 38308e7fff4ca-2ff5664c8c2mr17825561fa.2.1731625011301;
        Thu, 14 Nov 2024 14:56:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff598907bbsm3303891fa.107.2024.11.14.14.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 14:56:49 -0800 (PST)
Date: Fri, 15 Nov 2024 00:56:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v17 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
Message-ID: <mcyes5nikfr6ptzorlttrzvtjgh5zugmbo5ao3pkh4q2r5h6j4@vonmpvsqykv4>
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_145654_014282_0A0FAECF 
X-CRM114-Status: GOOD (  43.27  )
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

On Thu, Nov 14, 2024 at 09:37:16PM +0530, Bibek Kumar Patro wrote:
> This patch series consist of six parts and covers the following:
> 
> 1. Provide option to re-enable context caching to retain prefetcher
>    settings during reset and runtime suspend.
> 
> 2. Remove cfg inside qcom_smmu structure and replace it with single
>    pointer to qcom_smmu_match_data avoiding replication of multiple
>    members from same.
> 
> 3. Add support for ACTLR PRR bit setup via adreno-smmu-priv interface.
> 
> 4. Introduce intital set of driver changes to implement ACTLR register
>    for custom prefetcher settings in Qualcomm SoCs.
> 
> 5. Add ACTLR data and support for qcom_smmu_500.
> 
> Resend of v17:
>  Addition of minor fix of the build warning reported by kernel test robot [1] by powerpc_random config [2].
>  [1]:https://lore.kernel.org/all/202411140748.6mcFdJdO-lkp@intel.com/#t
>  [2]:https://download.01.org/0day-ci/archive/20241114/202411140748.6mcFdJdO-lkp@intel.com/config

Nit: then it's not a resend, but a new iteration. RESEND literally means
resending the same patchset.

>  
> Changes in v17 from v16:
>  Tags provided earlier not collected yet on patch 1/5, 3/5, 4/5, 5/5
>  due to the following revisions:
>  - 1/5 : Move the CPRE workaround out of qualcomm specific logic and gate with config
>          , update the silicon-errata.rst file
>  - 2/5 : No changes - reviewed-by tags collected
>  - 3/5 : Move the compatible check before assignment of callback as suggested.
>  - 4/5 : Add the actlr setting for *adreno variant* of MMU-500 as well.
>  - 5/5 : Due to changes in 1/5, minor refactoring had to be done before adding table.
>  Link to v16:
>  https://lore.kernel.org/all/20241008125410.3422512-1-quic_bibekkum@quicinc.com/
> 
> Changes in v16 from v15:
>  - Incorporate Dimitry's suggestion on patch 4/5 to use dev_dbg instead of dev_notice.
>  - Fix kernel test robot warning [1] coming for 32bit architecture configuration.
>  - Updatingthe tags
>  [1]: https://lore.kernel.org/all/202409230343.Q8KnYl2w-lkp@intel.com/
>  Link to v15:
>  https://lore.kernel.org/all/20240920155813.3434021-1-quic_bibekkum@quicinc.com/
> 
> Changes in v15 from v14:
>  - As discussed with Robin and Dmitry modify the actlr table and logic to use
>    compatible string instead of sid, mask for device matching which is
>    similar to qcom_smmu_client_of_match mechanism.
>  - Expand the comment in qcom_smmu500_reset to document reason why CPRE bit is re-enabled again
>    after arm_mmu500_reset resets the bit.
>  - Rearrange the series in order to keep prefetch setting patches in the end.
>  Link to v14:
>  https://lore.kernel.org/all/20240816174259.2056829-1-quic_bibekkum@quicinc.com/
> 
> Changes in v14 from v13:
>  Patch 6/6:
>  - As discussed incorprate changes to carry out PRR implementation only for
>    targets based on MMU-500 by using compat string based SMMU version detection.
>  - Split the set_actlr interface into two separate interface namely set_prr_bit
>    and set_prr_addr to set the prr enable bit and prr page address resepectively.
>  Patch 3/6:
>   - Fix a bug in gfx actlr_config which is uncovered while testing the gfx actlr setting in sc7280
>     during PRR experiment which prevented clients on certain sids of gfx smmmu to be skipped during
>     setting up of the ACTLR values : Fix involves swapping the arguments passed in smr_is_subset to make
>      device smr <from devicetree> a subset of actlr_config table entries < defined in the driver>.
>  Patch 4/6, 5/6:
>   - Sort the actlr table values in increasing order of the SIDs.
>  Link to v13:
>  https://lore.kernel.org/all/20240628140435.1652374-1-quic_bibekkum@quicinc.com/
> 
> Changes in v13 from v12:
>  - Fix the compilation issues reported by kernel test robot [1].
>  [1]: https://lore.kernel.org/all/202406281241.xEX0TWjt-lkp@intel.com/#t
>  Link to v12:
>  https://lore.kernel.org/all/20240626143020.3682243-1-quic_bibekkum@quicinc.com/
> 
> Changes in v12 from v11:
>  Changes to incorporate suggestion from Rob:
>  - Fix the set and reset logic for prr bit as pointed out in v11-6/6.
>  - Rename set_actlr_bit function name to set_prr.
>  - Add extension for PRR name as Partially-Resident-Region in comments
>    for set_prr function.
>  - Add few missing sids for sc7280 in patch-5/6.
>  Link to v11:
>  https://lore.kernel.org/all/20240605121713.3596499-1-quic_bibekkum@quicinc.com/
> 
> Changes in v11 from v10:
>  - Include a new patch 6/6 to add support for ACTLR PRR bit
>    through adreno-smmu-priv interface as suggested by Rob and Dmitry.
>  Link to v10:
>  https://lore.kernel.org/all/20240524131800.2288259-1-quic_bibekkum@quicinc.com/
> 
> Changes in v10 from v9:
>  - Added reviewed-by tags 1/5,2/5,3/5.
>  Changes incorporated:
>  - Remove redundant PRR bit setting from gfx actlr table(patch 4/5,5/5)
>    as this bit needs special handling in the gfx driver along with
>    the associated register settings.
>  Link to discussion on PRR bit:
>  https://lore.kernel.org/all/f2222714-1e00-424e-946d-c314d55541b8@quicinc.com/
>  Link to v9:
>  https://lore.kernel.org/all/20240123144543.9405-1-quic_bibekkum@quicinc.com/
> 
> Changes in v9 from v8:
>  Changes to incorporate suggestions from Konrad as follows:
>  - Re-wrap struct members of actlr_variant in patch 4/5,5/5
>    in a cleaner way.
>  - Move actlr_config members to the header.
>  Link to v8:
>  https://lore.kernel.org/all/20240116150411.23876-1-quic_bibekkum@quicinc.com/
> 
> Changes in v8 from v7:
>  - Added reviewed-by tags on patch 1/5, 2/5.
>  Changes to incorporate suggestions from Pavan and Konrad:
>  - Remove non necessary extra lines.
>  - Use num_smmu and num_actlrcfg to store the array size and use the
>    same to traverse the table and save on sentinel space along with
>    indentation levels.
>  - Refactor blocks containing qcom_smmu_set_actlr to remove block
>    repetition in patch 3/5.
>  - Change copyright year from 2023 to 2022-2023 in patch 3/5.
>  - Modify qcom_smmu_match_data.actlrvar and actlr_variant.actlrcfg to
>    const pointer to a const resource.
>  - use C99 designated initializers and put the address first.
>  Link to v7:
>  https://lore.kernel.org/all/20240109114220.30243-1-quic_bibekkum@quicinc.com/
> 
> Changes in v7 from v6:
>  Changes to incorporate suggestions from Dmitry as follows:
>  - Use io_start address instead of compatible string to identify the
>    correct instance by comparing with smmu start address and check for
>    which smmu the corresponding actlr table is to be picked.
> Link to v6:
> https://lore.kernel.org/all/20231220133808.5654-1-quic_bibekkum@quicinc.com/
> 
> Changes in v6 from v5:
>  - Remove extra Suggested-by tags.
>  - Add return check for arm_mmu500_reset in 1/5 as discussed.
> Link to v5:
> https://lore.kernel.org/all/20231219135947.1623-1-quic_bibekkum@quicinc.com/
> 
> Changes in v5 from v4:
>  New addition:
>  - Modify copyright year in arm-smmu-qcom.h to 2023 from 2022.
>  Changes to incorporate suggestions from Dmitry as follows:
>  - Modify the defines for prefetch in (foo << bar) format
>    as suggested.(FIELD_PREP could not be used in defines
>    is not inside any block/function)
>  Changes to incorporate suggestions from Konrad as follows:
>  - Shift context caching enablement patch as 1/5 instead of 5/5 to
>    be picked up as independent patch.
>  - Fix the codestyle to orient variables in reverse xmas tree format
>    for patch 1/5.
>  - Fix variable name in patch 1/5 as suggested.
>  Link to v4:
> https://lore.kernel.org/all/20231215101827.30549-1-quic_bibekkum@quicinc.com/
> 
> Changes in v4 from v3:
>  New addition:
>  - Remove actlrcfg_size and use NULL end element instead to traverse
>    the actlr table, as this would be a cleaner approach by removing
>    redundancy of actlrcfg_size.
>  - Renaming of actlr set function to arm_smmu_qcom based proprietary
>    convention.
>  - break from loop once sid is found and ACTLR value is initialized
>    in qcom_smmu_set_actlr.
>  - Modify the GFX prefetch value separating into 2 sensible defines.
>  - Modify comments for prefetch defines as per SMMU-500 TRM.
>  Changes to incorporate suggestions from Konrad as follows:
>  - Use Reverse-Christmas-tree sorting wherever applicable.
>  - Pass arguments directly to arm_smmu_set_actlr instead of creating
>    duplicate variables.
>  - Use array indexing instead of direct pointer addressed by new
>    addition of eliminating actlrcfg_size.
>  - Switch the HEX value's case from upper to lower case in SC7280
>    actlrcfg table.
>  Changes to incorporate suggestions from Dmitry as follows:
>  - Separate changes not related to ACTLR support to different commit
>    with patch 5/5.
>  - Using pointer to struct for arguments in smr_is_subset().
>  Changes to incorporate suggestions from Bjorn as follows:
>  - fix the commit message for patch 2/5 to properly document the
>    value space to avoid confusion.
>  Fixed build issues reported by kernel test robot [1] for
>  arm64-allyesconfig [2].
>  [1]: https://lore.kernel.org/all/202312011750.Pwca3TWE-lkp@intel.com/
>  [2]:
> https://download.01.org/0day-ci/archive/20231201/202312011750.Pwca3TWE-lkp@intel.com/config
>  Link to v3:
> https://lore.kernel.org/all/20231127145412.3981-1-quic_bibekkum@quicinc.com/
> 
> Changes in v3 from v2:
>  New addition:
>  - Include patch 3/4 for adding ACTLR support and data for SC7280.
>  - Add driver changes for actlr support in gpu smmu.
>  - Add target wise actlr data and implementation ops for gpu smmu.
>  Changes to incorporate suggestions from Robin as follows:
>  - Match the ACTLR values with individual corresponding SID instead
>    of assuming that any SMR will be programmed to match a superset of
>    the data.
>  - Instead of replicating each elements from qcom_smmu_match_data to
>    qcom_smmu structre during smmu device creation, replace the
>    replicated members with qcom_smmu_match_data structure inside
>    qcom_smmu structre and handle the dereference in places that
>    requires them.
>  Changes to incorporate suggestions from Dmitry and Konrad as follows:
>  - Maintain actlr table inside a single structure instead of
>    nested structure.
>  - Rename prefetch defines to more appropriately describe their
>    behavior.
>  - Remove SM8550 specific implementation ops and roll back to default
>    qcom_smmu_500_impl implementation ops.
>  - Add back the removed comments which are NAK.
>  - Fix commit description for patch 4/4.
>  Link to v2:
> https://lore.kernel.org/all/20231114135654.30475-1-quic_bibekkum@quicinc.com/
> 
> Changes in v2 from v1:
>  - Incorporated suggestions on v1 from Dmitry,Konrad,Pratyush.
>  - Added defines for ACTLR values.
>  - Linked sm8550 implementation structure to corresponding
>    compatible string.
>  - Repackaged actlr value set implementation to separate function.
>  - Fixed indentation errors.
>  - Link to v1:
> https://lore.kernel.org/all/20231103215124.1095-1-quic_bibekkum@quicinc.com/
> 
> Changes in v1 from RFC:
>  - Incorporated suggestion form Robin on RFC
>  - Moved the actlr data table into driver, instead of maintaining
>    it inside soc specific DT and piggybacking on exisiting iommus
>    property (iommu = <SID, MASK, ACTLR>) to set this value during
>    smmu probe.
>  - Link to RFC:
> https://lore.kernel.org/all/a01e7e60-6ead-4a9e-ba90-22a8a6bbd03f@quicinc.com/
> 
> Bibek Kumar Patro (5):
>   iommu/arm-smmu: re-enable context caching in smmu reset operation
>   iommu/arm-smmu: refactor qcom_smmu structure to include single pointer
>   iommu/arm-smmu: add support for PRR bit setup
>   iommu/arm-smmu: introduction of ACTLR for custom prefetcher settings
>   iommu/arm-smmu: add ACTLR data and support for qcom_smmu_500
> 
>  Documentation/arch/arm64/silicon-errata.rst   |   3 +-
>  drivers/iommu/Kconfig                         |  12 ++
>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |   5 +-
>  .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  |   2 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 105 +++++++++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    |   3 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu.h         |   2 +
>  include/linux/adreno-smmu-priv.h              |  14 +++
>  8 files changed, 140 insertions(+), 6 deletions(-)
> 
> --
> 2.34.1
> 

-- 
With best wishes
Dmitry

