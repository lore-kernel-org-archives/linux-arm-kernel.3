Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA9FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 21:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3AyGAijYqYgOgHQR7L9d8btXgT+uidlAsKc8Qo2ewk=; b=cA4DSTgMM7rslMW0seBzZuspdn
	JDH6PtoZLGMQVYu73JwShfJ29MaRj0LDFgUhZipKvg4ab0jC5ShiAGR3sJYOowYScBqOaIvKjllnH
	OPyvZrgd+3wdsLZODwXN7P6G6amkFtJCEBQGENbrSx3UDc2b2RCyv36b1hajbrGswWRrUWtSbqBFM
	h2o3D5YDNyuIy04WjV4o8N626GcDs28Ob9HqL3qN5u48T1CO+Iwf+Ef0BC1aw5npzYjgdLIw5uZu3
	3+G7xgmjXhWYh2jH8HgRfSej367oMbsCvzs0T59/SJc20n1h1/h7Qsy8FJuOG6KU+yipLeDFFiNyB
	UNfPk+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTUW-00000009X6f-2z5Y;
	Wed, 12 Mar 2025 21:19:52 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTSr-00000009WyQ-3nMi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 21:18:11 +0000
Date: Wed, 12 Mar 2025 14:18:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741814287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N3AyGAijYqYgOgHQR7L9d8btXgT+uidlAsKc8Qo2ewk=;
	b=gqGnRc88hux9lbrnVxYQRdyKyDt4MJa18YG4n8yivznQI2fZptvDXvQakLM+ZAi8JSenHg
	bNWcugfm8kRNaWtNMSwYnVZTwpCDVCfQ6T4hcRsXy95beKjTfNbM8667Vbc8Rnhv3A5DxX
	TwENYecYloS9cQ+jbcLLnF5fTA1hqBk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Andrew Jones <drjones@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, devel@daynix.com
Subject: Re: [PATCH v3 4/6] KVM: arm64: PMU: Reload when user modifies
 registers
Message-ID: <Z9H6CWz1Z_v7DxvI@linux.dev>
References: <20250312-pmc-v3-0-0411cab5dc3d@daynix.com>
 <20250312-pmc-v3-4-0411cab5dc3d@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312-pmc-v3-4-0411cab5dc3d@daynix.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_141810_155518_2C5F10E1 
X-CRM114-Status: GOOD (  13.24  )
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

On Wed, Mar 12, 2025 at 08:55:58PM +0900, Akihiko Odaki wrote:
> Commit d0c94c49792c ("KVM: arm64: Restore PMU configuration on first
> run") added the code to reload the PMU configuration on first run.
> 
> It is also important to keep the correct state even if system registers
> are modified after first run, specifically when debugging Windows on
> QEMU with GDB; QEMU tries to write back all visible registers when
> resuming the VM execution with GDB, corrupting the PMU state. Windows
> always uses the PMU so this can cause adverse effects on that particular
> OS.
> 
> The usual register writes are already handled independently, but
> register writes from userspace and ones for reset are not covered.

Ah -- that explains why you're moving the KVM_REQ_RELOAD_PMU from
kvm_arm_pmuv3_enable().

> @@ -4259,6 +4262,9 @@ void kvm_reset_sys_regs(struct kvm_vcpu *vcpu)
>  	}
>  
>  	set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
> +
> +	if (kvm_vcpu_has_pmu(vcpu))
> +		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);

nitpick, but maybe this can be added to kvm_pmu_vcpu_reset() instead.

Thanks,
Oliver

