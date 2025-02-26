Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6F5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 10:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5i64C+XznY5VpwulJeuZ+fGDTRMIkf91taLlh/OqCYg=; b=xU9O0jZiSK0I2c56uLUTVyeGyu
	8FtSF2swwvRGzq0+Gl5fO/ffBb5nunKIZNIowDT+SQjfPPujdwbZLf1B5hk/GKazuSJQVaLv/qGE8
	irB3427k/lb24VVx+Pkm+JiyO/Mu10/fEOygbfTt7eFWLJ0itgTYIXKYSCEY+F0X1f1SUPQxSJ/9s
	zSI/QiXOV6bd12XP2BQS+ASeL2NYYf288R9AxH9fNzDgcDoYov6nnuDcLSURGBAoXtkdL6WP9EJq3
	PI2TtLBVnJG33rT6eWaGuo8N+1IiF3JJWLSqdaQhWGb9n0LvtpCWfJwfxztEURoW0elQINK2LUMjx
	oi8lvUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnENU-00000003Edi-3Lyj;
	Wed, 26 Feb 2025 10:10:56 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEKm-00000003E64-14Tu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:08:09 +0000
Date: Wed, 26 Feb 2025 02:07:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740564485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5i64C+XznY5VpwulJeuZ+fGDTRMIkf91taLlh/OqCYg=;
	b=v3oArvu02FM6YGN1u5zf71hgLXwsJiDLOoixvpr0JJxGDToNzSws1vy6oss7NnNd8QLMuf
	jXOClnDeec7Zloq5DQ06f6pJ3TgqLvLP5eJvRdYELi7pYpaQVAMLQhW4x/74A5DLZUYbf6
	buE2h0UDSplp4UTtyq26wCWwcbHcCmM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, mark.rutland@arm.com, will@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, broonie@kernel.org, qperret@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v1 1/3] KVM: arm64: Initialize HCRX_EL2 traps in pKVM
Message-ID: <Z77n_Gv0X0bolONW@linux.dev>
References: <20250214150258.464798-1-tabba@google.com>
 <20250214150258.464798-2-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214150258.464798-2-tabba@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_020808_702787_6BB1471D 
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

Hi Fuad,

Series LGTM overall, one comment:

On Fri, Feb 14, 2025 at 03:02:56PM +0000, Fuad Tabba wrote:
> Initialize and set the traps controlled by the HCRX_EL2 in pKVM
> when the register is supported by the system.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/pkvm.c | 46 ++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 3927fe52a3dd..668ebec27f1b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -58,6 +58,30 @@ static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
>  		vcpu->arch.hcr_el2 |= HCR_ATA;
>  }
>  
> +static void pkvm_vcpu_reset_hcrx(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> +	struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
> +
> +	if (!cpus_have_final_cap(ARM64_HAS_HCX))
> +		return;
> +
> +	/*
> +	 * In general, all HCRX_EL2 bits are gated by a feature.
> +	 * The only reason we can set SMPME without checking any
> +	 * feature is that its effects are not directly observable
> +	 * from the guest.
> +	 */
> +	vcpu->arch.hcrx_el2 = HCRX_EL2_SMPME;
> +

The comment isn't wrong, but we don't support SME at all in KVM at this
point.

Any objection to dropping this bit? I can fix it when applying the
series, no need to respin.

Thanks,
Oliver

