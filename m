Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE42CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 05:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqvCi0lCynTmviHWeEa7hB9XA+pHd1N3wbumIZfeiYk=; b=3bwmY1bGDpJP1cQWbx7JFfZMgc
	2bRxki3PXjxI/TL3w/l2grlsgkUilhXgGN5PQuNBJYEk8hpa54/kO1msY3QickIt8QSYu567entx/
	h732eqsuAbrW1+upPA5YmVdfDZ7toz9NQ9bTxCyin906ZO5vg9piglx3X5Pp8tNagHgzJkgr3DW0P
	pA9pSo5VOZxk++PWJFMYuREOPitN4m4xPYDqmQcFM5SI+W/6eA78kQI1daUD282WIW/c6ULVRNfuu
	l4xIQVuh7DGr4zdtm4BIDJ1+/m1S9mhnMwUKHpDJehwAhBG5lapDNUcghWXBKtYgO0dhyYFiPJMGB
	VMwiTkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSSu3-000000057jb-1Slc;
	Thu, 28 May 2026 05:03:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSSu0-000000057j6-1fl5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 05:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779944607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UqvCi0lCynTmviHWeEa7hB9XA+pHd1N3wbumIZfeiYk=;
	b=TCRS/Yg/OTfSo9NmMMzXQV3aSzMKZ4yrfRaE5zr3yKQGyeDMHwud2FEocar9fPgP/lK27j
	z5Y1dWTGNzFVJ/mXQZKjvfkAmKRPTmZgZxMr5DQGdkNbwF2uZ6bzpxR63QwKLZgGGrY9u+
	ycQAxDEuVleGkMK6QwqiAIymSa/XwaI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-TyWKMvwlNomqha8N_ACMxg-1; Thu, 28 May 2026 01:03:25 -0400
X-MC-Unique: TyWKMvwlNomqha8N_ACMxg-1
X-Mimecast-MFC-AGG-ID: TyWKMvwlNomqha8N_ACMxg_1779944604
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba6fe41283so133862175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 22:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779944604; x=1780549404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqvCi0lCynTmviHWeEa7hB9XA+pHd1N3wbumIZfeiYk=;
        b=rJU9URG/WgKQKM0q6Y+/Avu8FR7eMdzariAvYI+RxXjdZ3WSZIDEgUWv7uuiz2BCeu
         OZfwmCgMcwJ7lAwcw+Jkl62/f9HTfTkY1+nlqRYOsCbelx5ZaZeZ1oJ2ZVjR0vn9LrxH
         +UZV1ZcPL7Ch6BWqjQWu4mNBGaWZ5/yULUxO24grJSZnD1vYvYOFLnthbEOlv9YVDYmB
         o+mOjDR4pw+4oRjcK4Kn6FyNvJXymQ837OD3kQhgagyPb0RU0vB2Eu4w/ZkDuPLgoGG1
         BkIeRNQELmV5mxAXbJMc+7UQoJr8/0LOnraz55uRIVERPpo/EXLJVs0zLbO346PmADne
         gdrA==
X-Forwarded-Encrypted: i=1; AFNElJ8Pb26ioZrg/Qzal3Baj8P+AXjdIkyC8anLh1xSgCdcvhm8faY9Kz4x9K8d+j96412qSuMRa1wZGNy4mtsG4hDj@lists.infradead.org
X-Gm-Message-State: AOJu0YwKK26sk1wEv06OVWjW2dRafp/8jTKllsNK7cGeJvi/jHGz3kra
	nMQ+z0B2IPoMkhpfjMfatIwpeVtlkrRearUZRoYid0dk9/ph4VblbBiapc7LJ2nMiBfHAhcODjg
	gHuz0GUsQipYuJ6nQ/WKSHJnKRZVNR7n/oEApUQDBZxnnKOblYqncxDr+kxibZtfgpTYdBmUExe
	jS
X-Gm-Gg: Acq92OHo7i1UMM/ujSuRl7kFDJz+8srLYwyMMGkOc47PiCfUW6OUkIxusniC6CmzPst
	q+Gf5JNuwbq3Aei/k6Er/jCWj5ya3uTcvq5RgRKjjZTzx7HUAX7OZ83y42lPdG4PWZUyKr8L79s
	IIY7d/ZeGCYEzSn5We4JRFeIraX/ayrTHvrrSRNJnfTQ/jhyR8h3S2nTl7Y8T+9kljwchIxJUXU
	S1TGwJwcNj3gTIQT5PGgLfXs+0nWmdcJ0R2YBnWetVoqtxd3PyeXWJ9o9Xx5BmwetMOU8UGsgIp
	aDow7sUPWzBzJp9sCc54VssJXBFmMvCByAnbcCcH01/O3r+D+X28YNM0DxGZTwxsFRuO7ybavri
	5lncKqA9FAOFRttFX1YrHpSuICI1cfR+Z2y/4QKQgiJBGBSXKavdujiRSvQiIyq56CE4PUGp1jJ
	U=
X-Received: by 2002:a17:902:c94f:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2beb0366400mr275002485ad.1.1779944603824;
        Wed, 27 May 2026 22:03:23 -0700 (PDT)
X-Received: by 2002:a17:902:c94f:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2beb0366400mr275001935ad.1.1779944603275;
        Wed, 27 May 2026 22:03:23 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm221300525ad.36.2026.05.27.22.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 22:03:22 -0700 (PDT)
Message-ID: <8b648b59-c411-4126-be18-686d2927f24a@redhat.com>
Date: Thu, 28 May 2026 15:03:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 24/44] KVM: arm64: Handle realm MMIO emulation
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-25-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260513131757.116630-25-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yTqTDjVsPCk-AmqK3N10XgIhJWDgnNlOh66602xd1xQ_1779944604
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_220328_513089_B3CB5491 
X-CRM114-Status: GOOD (  29.49  )
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

Hi Steve,

On 5/13/26 11:17 PM, Steven Price wrote:
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
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v7:
>   * New comment for rec_exit_sync_dabt() explaining the call to
>     vcpu_set_reg().
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
>   arch/arm64/kvm/rmi-exit.c     | 14 ++++++++++++++
>   3 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
> index 89982bd3345f..6492397b73d7 100644
> --- a/arch/arm64/kvm/inject_fault.c
> +++ b/arch/arm64/kvm/inject_fault.c
> @@ -228,7 +228,9 @@ static void inject_abt32(struct kvm_vcpu *vcpu, bool is_pabt, u32 addr)
>   
>   static void __kvm_inject_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr)
>   {
> -	if (vcpu_el1_is_32bit(vcpu))
> +	if (unlikely(vcpu_is_rec(vcpu)))
> +		vcpu->arch.rec.run->enter.flags |= REC_ENTER_FLAG_INJECT_SEA;
> +	else if (vcpu_el1_is_32bit(vcpu))
>   		inject_abt32(vcpu, iabt, addr);
>   	else
>   		inject_abt64(vcpu, iabt, addr);
> diff --git a/arch/arm64/kvm/mmio.c b/arch/arm64/kvm/mmio.c
> index e2285ed8c91d..6a8cb927fcca 100644
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
> @@ -138,14 +139,21 @@ int kvm_handle_mmio_return(struct kvm_vcpu *vcpu)
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
> @@ -167,14 +175,14 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
>   	 * No valid syndrome? Ask userspace for help if it has
>   	 * volunteered to do so, and bail out otherwise.
>   	 *
> -	 * In the protected VM case, there isn't much userspace can do
> +	 * In the protected/realm VM case, there isn't much userspace can do
>   	 * though, so directly deliver an exception to the guest.
>   	 */
>   	if (!kvm_vcpu_dabt_isvalid(vcpu)) {
>   		trace_kvm_mmio_nisv(*vcpu_pc(vcpu), esr,
>   				    kvm_vcpu_get_hfar(vcpu), fault_ipa);
>   
> -		if (vcpu_is_protected(vcpu))
> +		if (vcpu_is_protected(vcpu) || vcpu_is_rec(vcpu))
>   			return kvm_inject_sea_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
>   
>   		if (test_bit(KVM_ARCH_FLAG_RETURN_NISV_IO_ABORT_TO_USER,
> diff --git a/arch/arm64/kvm/rmi-exit.c b/arch/arm64/kvm/rmi-exit.c
> index e7c51b6cf6ce..8ec0d179eba2 100644
> --- a/arch/arm64/kvm/rmi-exit.c
> +++ b/arch/arm64/kvm/rmi-exit.c
> @@ -25,6 +25,20 @@ static int rec_exit_reason_notimpl(struct kvm_vcpu *vcpu)
>   
>   static int rec_exit_sync_dabt(struct kvm_vcpu *vcpu)
>   {
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	/*
> +	 * In the case of a write, copy over gprs[0] to the target GPR,
> +	 * preparing to handle MMIO write fault. The content to be written has
> +	 * been saved to gprs[0] by the RMM (even if another register was used
> +	 * by the guest). In the case of normal memory access this is redundant
> +	 * (the guest will replay the instruction), but the overhead is
> +	 * minimal.
> +	 */
> +	if (kvm_vcpu_dabt_iswrite(vcpu) && kvm_vcpu_dabt_isvalid(vcpu))
> +		vcpu_set_reg(vcpu, kvm_vcpu_dabt_get_rd(vcpu),
> +			     rec->run->exit.gprs[0]);
> +

{ } is needed here.

>   	return kvm_handle_guest_abort(vcpu);
>   }
>   

Thanks,
Gavin


