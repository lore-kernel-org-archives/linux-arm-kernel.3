Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC36C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 04:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxELm9JZG3yKkBZZ33qtCi2pLAO/qCPDSQRXT6O3LAA=; b=qBkGvNdjgj1QffkLNTkIuwI62M
	nIfz+BgZ9tuglb8MpWAElyb0M0Ms0iCzOeTa1zYfRAN3h7CwsBbIjwQwqCy3Q6XOeKn5t1GLmda7e
	Hgh7PhLb6hkZ/Z+Em5DFHLkBVLuVaMGiyXmfTIBc0FfJkzZlW+w2QvH4ZJcNffPkKCXsaP4pmMp8G
	SoE+lIGKXsbYJ55MM2r/MvoVaImz3QkUx2GUGCcKL0bFipF3dyB6HU4zfpTRQ9VdNhi8QwNBxM7kD
	yBSVsW94bL7BoyGIkpMLKe7dYYQecc+dTgRiVzZGbdPIH+S81NSuYswUhaETlI49XVMuP1X2tQvsG
	rNXpiCCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKIp-000000033wc-2n2M;
	Tue, 04 Mar 2025 04:54:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKHF-000000033nB-0yEz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 04:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741063987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AxELm9JZG3yKkBZZ33qtCi2pLAO/qCPDSQRXT6O3LAA=;
	b=PfLrP8smbPJMv1Y9VtbaPb1iy2OWVPZGoXHqWmxlwgTPS8HELYSkl1LZYsZgdq6x64y1pt
	0+PSGLXE0U9FVoKMn42PTmb2AdElsUDQvf/tk/1ic5YMMYWZkofLKqyer09z4VglnvDf/W
	QaI51u3DOQVLV2DnUV8+LggjauAl3Pw=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-AJ7lNoljOC-WMyD9AV8JLQ-1; Mon, 03 Mar 2025 23:53:01 -0500
X-MC-Unique: AJ7lNoljOC-WMyD9AV8JLQ-1
X-Mimecast-MFC-AGG-ID: AJ7lNoljOC-WMyD9AV8JLQ_1741063981
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2233b764fc8so93228705ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 20:53:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741063981; x=1741668781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AxELm9JZG3yKkBZZ33qtCi2pLAO/qCPDSQRXT6O3LAA=;
        b=bgJGSL1knX7nQ3mOiOM/OEXBzktKnjFeVMuYZhjPBR2m/lrsKzU+N3A6Q/1UHBFXIa
         +A1OXMdqkrm6NF2AbsuPFaJ3syzkMPNYh0z2KQXAVQ2u1PyLGfjbupGaudcdXYV2jYwj
         TvwPNcChlvzsO4Kt9ukQi0zR+8dc137wVe2hwPAK2+YYf+grL0lAqNScWGkVZI7gnqCp
         eVrNKG0AvklJE6RZNg0Lc7FFORlQaUpeKhFAQN6BCTsosbwgY1SZ03yb88TufHKdob9Q
         D0AF0vjOHHt8DcZgE7z7arTZJtY/Gkyzq9AcOcZDrGDTTJt3G8rIuIiX0StRrgcMp9Dy
         V2xA==
X-Forwarded-Encrypted: i=1; AJvYcCXraj7npQkRzXdPdP/5kl/uD1B9y+pW3cSQpWbfy7bVv3VzJ3Pgdp3fWVNjVLpv75BA4gX8tkrzZLbdBwwnuoTp@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq+c+cv7I51JTQsT/SSoBiK3qjVIA+pSv+Mr/RzsZWuVQ8OOyd
	Km/MhVGIi3V3xUTl/i/ghGvg/yzvy9f6ZypqvKBXP+gN+Fs0D/6Op6wxX55ID1ci91phBX/lNoD
	TZHDuV2aLA0PELncZSZ2SaUcB5CQKdF6zejA9neV7btqcW7GgrDshK7LGe2onfKl9df/l6yoo
X-Gm-Gg: ASbGnctJABFEs81ImHp+lHDlhZUWkloGVoUZQ08gG/8PU3EjgkT1SL+YLo7nym+Iz8c
	Kwpvc5PmCqmppbtoAaDAIvxi1+wJygQsn98kLzgPhhT0kFyepzQ0SqDfif62bys0828iIBi+iHh
	KIiCANHCSNHqhX6x8AnzB0DfnmT9NqC3pBOyr45Y1zhvj/S1nuqX49e73f394kIqGIrHsCpzQyE
	EnC0rdPAyHK0UujtlbucK6tvPiETwEBkkgw+xYIe57S9jx1bZ1i5Q7fLKIfmpcy0ssE5pDBIMQx
	nl3A6tlNPap6rZGfog==
X-Received: by 2002:a05:6a00:3916:b0:730:79bf:c893 with SMTP id d2e1a72fcca58-734ac33818amr25659503b3a.4.1741063980701;
        Mon, 03 Mar 2025 20:53:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrKK12tR3N+mbAAVfdfQ2dTRLheKip2yCmHrOCAijBgggtR8kRt8J5JVYj+IuDCpb/96NhUg==
X-Received: by 2002:a05:6a00:3916:b0:730:79bf:c893 with SMTP id d2e1a72fcca58-734ac33818amr25659458b3a.4.1741063980378;
        Mon, 03 Mar 2025 20:53:00 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362dbde43bsm6584335b3a.25.2025.03.03.20.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 20:52:59 -0800 (PST)
Message-ID: <abec92a5-0158-4d97-bfdc-03e805a4c96b@redhat.com>
Date: Tue, 4 Mar 2025 14:52:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 19/45] KVM: arm64: Handle realm MMIO emulation
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-20-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-20-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZxlHyVIrBXXBr_WInd7543vdC8IsD41CQ1z7mcdNYiE_1741063981
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_205309_354378_602C3729 
X-CRM114-Status: GOOD (  27.41  )
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

On 2/14/25 2:13 AM, Steven Price wrote:
> MMIO emulation for a realm cannot be done directly with the VM's
> registers as they are protected from the host. However, for emulatable
> data aborts, the RMM uses GPRS[0] to provide the read/written value.
> We can transfer this from/to the equivalent VCPU's register entry and
> then depend on the generic MMIO handling code in KVM.
> 
> For a MMIO read, the value is placed in the shared RecExit structure
> during kvm_handle_mmio_return() rather than in the VCPU's register
> entry.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v5:
>   * Inject SEA to the guest is an emulatable MMIO access triggers a data
>     abort.
>   * kvm_handle_mmio_return() - disable kvm_incr_pc() for a REC (as the PC
>     isn't under the host's control) and move the REC_ENTER_EMULATED_MMIO
>     flag setting to this location (as that tells the RMM to skip the
>     instruction).
> ---
>   arch/arm64/kvm/inject_fault.c |  4 +++-
>   arch/arm64/kvm/mmio.c         | 16 ++++++++++++----
>   arch/arm64/kvm/rme-exit.c     |  6 ++++++
>   3 files changed, 21 insertions(+), 5 deletions(-)
> 

One nitpick below, with it addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
> index a640e839848e..2a9682b9834f 100644
> --- a/arch/arm64/kvm/inject_fault.c
> +++ b/arch/arm64/kvm/inject_fault.c
> @@ -165,7 +165,9 @@ static void inject_abt32(struct kvm_vcpu *vcpu, bool is_pabt, u32 addr)
>    */
>   void kvm_inject_dabt(struct kvm_vcpu *vcpu, unsigned long addr)
>   {
> -	if (vcpu_el1_is_32bit(vcpu))
> +	if (unlikely(vcpu_is_rec(vcpu)))
> +		vcpu->arch.rec.run->enter.flags |= REC_ENTER_FLAG_INJECT_SEA;
> +	else if (vcpu_el1_is_32bit(vcpu))
>   		inject_abt32(vcpu, false, addr);
>   	else
>   		inject_abt64(vcpu, false, addr);
> diff --git a/arch/arm64/kvm/mmio.c b/arch/arm64/kvm/mmio.c
> index ab365e839874..bff89d47a4d5 100644
> --- a/arch/arm64/kvm/mmio.c
> +++ b/arch/arm64/kvm/mmio.c
> @@ -6,6 +6,7 @@
>   
>   #include <linux/kvm_host.h>
>   #include <asm/kvm_emulate.h>
> +#include <asm/rmi_smc.h>
>   #include <trace/events/kvm.h>
>   
>   #include "trace.h"
> @@ -136,14 +137,21 @@ int kvm_handle_mmio_return(struct kvm_vcpu *vcpu)
>   		trace_kvm_mmio(KVM_TRACE_MMIO_READ, len, run->mmio.phys_addr,
>   			       &data);
>   		data = vcpu_data_host_to_guest(vcpu, data, len);
> -		vcpu_set_reg(vcpu, kvm_vcpu_dabt_get_rd(vcpu), data);
> +
> +		if (vcpu_is_rec(vcpu))
> +			vcpu->arch.rec.run->enter.gprs[0] = data;
> +		else
> +			vcpu_set_reg(vcpu, kvm_vcpu_dabt_get_rd(vcpu), data);
>   	}
>   
>   	/*
>   	 * The MMIO instruction is emulated and should not be re-executed
>   	 * in the guest.
>   	 */
> -	kvm_incr_pc(vcpu);
> +	if (vcpu_is_rec(vcpu))
> +		vcpu->arch.rec.run->enter.flags |= REC_ENTER_FLAG_EMULATED_MMIO;
> +	else
> +		kvm_incr_pc(vcpu);
>   
>   	return 1;
>   }
> @@ -162,14 +170,14 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
>   	 * No valid syndrome? Ask userspace for help if it has
>   	 * volunteered to do so, and bail out otherwise.
>   	 *
> -	 * In the protected VM case, there isn't much userspace can do
> +	 * In the protected/realm VM case, there isn't much userspace can do
>   	 * though, so directly deliver an exception to the guest.
>   	 */
>   	if (!kvm_vcpu_dabt_isvalid(vcpu)) {
>   		trace_kvm_mmio_nisv(*vcpu_pc(vcpu), kvm_vcpu_get_esr(vcpu),
>   				    kvm_vcpu_get_hfar(vcpu), fault_ipa);
>   
> -		if (vcpu_is_protected(vcpu)) {
> +		if (vcpu_is_protected(vcpu) || vcpu_is_rec(vcpu)) {
>   			kvm_inject_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
>   			return 1;
>   		}
> diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
> index aae1adefe1a3..c785005f821f 100644
> --- a/arch/arm64/kvm/rme-exit.c
> +++ b/arch/arm64/kvm/rme-exit.c
> @@ -25,6 +25,12 @@ static int rec_exit_reason_notimpl(struct kvm_vcpu *vcpu)
>   
>   static int rec_exit_sync_dabt(struct kvm_vcpu *vcpu)
>   {
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	if (kvm_vcpu_dabt_iswrite(vcpu) && kvm_vcpu_dabt_isvalid(vcpu))
> +		vcpu_set_reg(vcpu, kvm_vcpu_dabt_get_rd(vcpu),
> +			     rec->run->exit.gprs[0]);
> +

A comment may be needed to explain why GPR[0] has to be copied over. The contexnt
in GPR[0] isn't needed by all cases, being handled by kvm_handle_guest_abort().
Something like below.

	/*
	 * Copy over GPR[0] to the target GPR, preparing to handle MMIO write
	 * fault. The content to be written has been saved to GPR[0] by RMM.
	 * It's overhead to other cases like fault due to MMIO read, shared
	 * or private space access.
	 */

>   	return kvm_handle_guest_abort(vcpu);
>   }
>   

Thanks,
Gavin


