Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3409ACA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 03:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYC8oY+LrXwAaiDtJ55Vw+0AspCCI39rFIw270qLm/8=; b=kWSeuOhYGAAB0z2Cdz2iCpeFtK
	hr515DWsN7T3IMbnMdiNLyJsJC5kuHjF/CL4Nwym6WYIToqnF6Qzi9ndNCzQa8bN8xYxGy4NhBKrH
	suDiSA7rkOtFCMkaIBs2CTgRtQJZOyDDbbHZk1X+P4EM5HHzGeBC056n8qhm/RjX9ow7EStqIxgIi
	gbag54mGWL8BGHDcGvR3Ti2OCYKPTqPH9meUzzWnU67VeoHGMGD54SXanSWL3i9pXW+2XnaRI1YXH
	0sgu+Ov3ZFTysHl77+0bUSxBDcgJke897jkmuW31fyK4i7LvylXDFUdgMLzowI6c3axvLdx2xV/G6
	AvljAUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwHJ-0000000Hajw-47Oh;
	Tue, 06 Oct 2026 03:55:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwHH-0000000HajZ-0d7O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 03:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791258941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uYC8oY+LrXwAaiDtJ55Vw+0AspCCI39rFIw270qLm/8=;
	b=UZyRd8WbR9H/ek2vX3r6MVBnp74dOwwfntP33dpFRDNCsBgrPPZhaEbSrCTU6WILz8QaaV
	PdsVXIdQjiQl58z0L8cQVEbfXv0tKch7ZNlkfhr/dM1wF6mjj5qjQ9bNjYqLIDSiyCfSIP
	h/F0W9u0F2lChBvjkPCcYG6KtUiMxTA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-82Qr1WaYM3mobwfa4FB9Wg-1; Mon, 05 Oct 2026 23:55:41 -0400
X-MC-Unique: 82Qr1WaYM3mobwfa4FB9Wg-1
X-Mimecast-MFC-AGG-ID: 82Qr1WaYM3mobwfa4FB9Wg_1791258940
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so680101a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 20:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791258940; x=1791863740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYC8oY+LrXwAaiDtJ55Vw+0AspCCI39rFIw270qLm/8=;
        b=SO1W1r+Hi2RMp4kuOk6IaUvMAmiuYXGDW6IJQVyoVNxym9NvKN9dJ79DtCFyieZaAp
         MIQsb/soRS3xJhqfapUlg0bKr7Hmggqw6zCjzrDC2zvvfIwVbo7un1Ba4/aycyJyM3+X
         H2y1TeTA32cSLMHGQpurAOonAYQPZicizH92Rd4BGkNaHyUMdWHKv6LaVRN5C0WQ6KkU
         ZeO8gJzhPOMHTiqsdPEmp0tzONjl81L3UBFoekBfcaIvQFiysCMahTB+iNEau4aK7zMD
         KZjDO3+sg2gfRURihbETcYO8kPhv+f2t2Z8IbKaKQAA9ZRuWuX3/4NKJdkQZXMdWoUp+
         a7QQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOqUfOrGSd18vrsyNbu4ZbeXle+ik5HqmsVmmAIc7EE51dt/p8MY3bXXOP2tPtqZh0LnoJV8hQTKsiV/TIbgKt@lists.infradead.org
X-Gm-Message-State: AFq9FYK2dwxGCe3dBleHOmOn50zHXyqq0uTxYPpb10CvuJsLphcVx5z2
	BcPMq4GgR2AKMeydIJm4i68yZqZXxGcJdRQ6vNoTYm2Qx9WHausRP4zn0aQf0jJjdCpLvkSKTPL
	g48+EMZs28u0hoPK2uw5H21oA+G+HMBvvfzXtHB6BBdMf774CCRMsshkp78V/dVKais1I0hbdQX
	TE
X-Gm-Gg: AYBFou3SbpjbblGhosZ8Dk6aMpLpHmyzGykutDoHsPqO7joDs5/HEyNPNqgzK++ZWMw
	Oamd6qQ4jaOMVxb16yB07OqVgPEn8IcVuyTjy4zdNTQkk5ha9eqCXkGDW4Od23E/ImYn+9AnJkZ
	0IsBzi5EF9na92QJDgmwItG8luQCZAO1PdnCvQn7yAE0mN26p36fCxP6PKO5UJ0hmkk1ZJXkqI7
	WOHl7i6N3jczZhiAYwlgleJFJL9FJMPcFf6lf8mKfbrUfWMsssam8HwZxN8Jl7zmBs05HvC5cPH
	aBdGuOA33eEmpIWLN/oDyfUVbK/CAEsN37bHgkQUqSp4NleGvkzJSSLiPu2xM5cEO2z/rjCsm/1
	QPdkIv4GpcJiA81DVgBjbK1kPASIlitFzd9Pu905t7w==
X-Received: by 2002:a17:90b:4d84:b0:3a7:ef4:74ba with SMTP id 98e67ed59e1d1-3a8546a64dfmr1230259a91.55.1791258939703;
        Mon, 05 Oct 2026 20:55:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4d84:b0:3a7:ef4:74ba with SMTP id 98e67ed59e1d1-3a8546a64dfmr1230238a91.55.1791258939230;
        Mon, 05 Oct 2026 20:55:39 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6e2b012esm1790452a12.29.2026.10.05.20.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:55:38 -0700 (PDT)
Message-ID: <e7b6a49c-f9ba-410d-b7b6-55c01d1c5015@redhat.com>
Date: Tue, 6 Oct 2026 13:55:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 05/23] KVM: arm64: Track the type of VM in kvm_arch
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
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-6-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-6-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ljNGl4lckDvmFexJeYSO4DE0pYZifIn7TVfA7oPCWas_1791258940
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_205543_269609_48BB7E58 
X-CRM114-Status: GOOD (  25.03  )
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

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> KVM arm64 has different types of VMs with all the different modes in which
> the hypervisor code can be run. e.g., VHE, nVHE, pKVM etc. Then there is
> protected VM and normal VMs with pKVM. We might soon add other types,
> e.g., Arm CCA Realm. So in an effort to make the handling of these
> different types of VMs a bit more friendly to the eyes, add a VM flavor to
> the kvm_arch and we could then add handlers for different operations based
> on the VM type.
> 
> Keep the flavor initialisation at the beginning to allow for the detection
> early enough and fail out on any unsupported requests.
> 
> With that, add wrappers for checking the "type" of a VM and replace the
> existing users with the new wrappers.
> 
> Given we already have the construct of "kvm_vm_is_protected" in the core
> KVM code, use that for all confidential compute guests including Realms
> that we are about to add. Adds __VM_PROTECTED marker vm flavor to draw the
> boundary for "protected VMs". In later patches, we would add Realm VMs,
>   which would also be classified as protected.
> 
> Add a explicit helper to detect if a given VM is a "protected" VM under pKVM.
> Change the existing users that precisely want to check the VM type. These
> include :
>    - kvm_arch_prepare_memory_region - For preventing memslot changes after
>      pVM creation.
> 
> All the others are retained as a wider check for confidential guest VMs.
> These are:
>   - kvm_vm_ioctl_set_counter_offset - For disallowing timer offset
>     configuration
>   - io_mem_abort for dabt handling without valid syndrome information
> 
> Both of which are true for Realms too.
> 
> Realms support is restricted to VHE host and thus "kvm_vm_is_protected()"
> checks in the pkvm hyp specific code doesn't need to change, as the only
> protected guests it deals with is "protected pKVM" guests. To tighten this
> init_pkvm_hyp_vm() restricts the hyp copy of the vm_flavor to the ones it
> supports.
> 
> vcpu_is_protected() usage from nVHE hyp code is tricky, as we need to
> convert the vcpu->kvm to the HYP VA before checking the flavor. This
> involves kern_hyp_va() usage in asm/kvm_host.h. To avoid build breaks,
> include asm/kvm_mmu.h to arm64/kvm/mmio.c.
> 
> While at it move the psci_version around to keep the structure packed.
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v21:
>   - Drop kern_hyp_va() and restrict nvhe code to always use vcpu_is_protected_pkvm()
>   - Drop kvm_vm_is_unprotected_pkvm() and open code the check
>   - Move psci_version field in kvm_arch around to keep the structure packed
> ---
>   arch/arm64/include/asm/kvm_host.h      | 42 +++++++++++++++++++++++---
>   arch/arm64/include/asm/kvm_pkvm.h      |  4 +--
>   arch/arm64/kvm/arm.c                   | 33 ++++++++++++++++----
>   arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  2 +-
>   arch/arm64/kvm/hyp/nvhe/pkvm.c         |  6 +++-
>   arch/arm64/kvm/hyp/nvhe/switch.c       |  4 +--
>   arch/arm64/kvm/hyp/nvhe/timer-sr.c     |  2 +-
>   arch/arm64/kvm/mmio.c                  |  1 +
>   arch/arm64/kvm/mmu.c                   |  2 +-
>   arch/arm64/kvm/pkvm.c                  |  6 ++--
>   10 files changed, 79 insertions(+), 23 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


