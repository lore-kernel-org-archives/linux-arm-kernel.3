Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B1FFB3D19
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULFIaSHr+U1hs7BguxDFrpMkjq8/YKam+FczzkYyfWY=; b=urzG/28AunggYzLuVVVpeykqf3
	InvXrjQezlwtuEwCtW8Iql4/9hdCy4/xQgS/QlS9txc3zSx7Ns2eX2hWu3jvX5r48zV9cD0Usucpr
	/zm20LP+p1BGybZvlZ/e08mO/9jsuoYt6u2Op7ng2S2rjAo1tyV9cJK1RcTbIQrUDJS+izguw6NZ6
	+YIjxQRQHxprDOFxADeUARRGIjYdsVDxUxM4++MmLoJklLh0qcqPkdyTT/VbBA71vUlmVJD7vUDMT
	Z074Fqw/O+z0hgm4WGZ1uHA3p5Es8EJP55Ir0zWYxXrHXPtVkZ9v9Z6HKo/K5Df8wyrsRVXR9urzj
	U9keZ7Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AJv-0000000B7Q9-3pmS;
	Mon, 30 Mar 2026 10:58:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7AJt-0000000B7Pm-2xbm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 10:58:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B3351C01;
	Mon, 30 Mar 2026 03:58:02 -0700 (PDT)
Received: from [10.57.13.56] (unknown [10.57.13.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D4A13F915;
	Mon, 30 Mar 2026 03:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774868288; bh=mONBCtbmbPff0A3dabS2nwwbs9ct9e5u1BA9P4VrR5c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O7cDYZFHXEzuxS8cQTR9gIEc1iShETlDG4sQ/XazlOkV5Mry75J+eICB0NiKv1k8b
	 vleJTNMbKT4ovAUQsnrDoU09OL258RoFomntVNwjHtTcFp2F0bgoQYw7qTcvmA15iV
	 0fBuYUY/dJ4ycbTn4G3WwWoi/4cWPdqxRX0+03BQ=
Message-ID: <053a048d-bcb7-46ef-a4c2-c5d0c84a3177@arm.com>
Date: Mon, 30 Mar 2026 11:58:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 34/48] arm64: RMI: support RSI_HOST_CALL
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-35-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260318155413.793430-35-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_035809_900866_68A0E5F2 
X-CRM114-Status: GOOD (  21.55  )
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

On 18/03/2026 15:53, Steven Price wrote:
> From: Joey Gouly <joey.gouly@arm.com>
> 
> Forward RSI_HOST_CALLS to KVM's HVC handler.

Minor nit: Please could we add a line or two, explaining what 
RSI_HOST_CALL is ? e.g.:

Realm's can talk to the hypervisor using the RSI_HOST_CALL, which
the RMM forwards to the KVM. Handle them as regular hypercalls.

Suzuki

> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> ---
> Changes since v7:
>   * Avoid turning a negative return from kvm_smccc_call_handler() into a
>     error response to the guest. Instead propogate the error back to user
>     space.
> Changes since v4:
>   * Setting GPRS is now done by kvm_rec_enter() rather than
>     rec_exit_host_call() (see previous patch - arm64: RME: Handle realm
>     enter/exit). This fixes a bug where the registers set by user space
>     were being ignored.
> ---
>   arch/arm64/kvm/rmi-exit.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/kvm/rmi-exit.c b/arch/arm64/kvm/rmi-exit.c
> index b4843f094615..7eff6967530c 100644
> --- a/arch/arm64/kvm/rmi-exit.c
> +++ b/arch/arm64/kvm/rmi-exit.c
> @@ -116,6 +116,19 @@ static int rec_exit_ripas_change(struct kvm_vcpu *vcpu)
>   	return -EFAULT;
>   }
>   
> +static int rec_exit_host_call(struct kvm_vcpu *vcpu)
> +{
> +	int i;
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	vcpu->stat.hvc_exit_stat++;
> +
> +	for (i = 0; i < REC_RUN_GPRS; i++)
> +		vcpu_set_reg(vcpu, i, rec->run->exit.gprs[i]);
> +
> +	return kvm_smccc_call_handler(vcpu);
> +}
> +
>   static void update_arch_timer_irq_lines(struct kvm_vcpu *vcpu)
>   {
>   	struct realm_rec *rec = &vcpu->arch.rec;
> @@ -183,6 +196,8 @@ int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
>   		return rec_exit_psci(vcpu);
>   	case RMI_EXIT_RIPAS_CHANGE:
>   		return rec_exit_ripas_change(vcpu);
> +	case RMI_EXIT_HOST_CALL:
> +		return rec_exit_host_call(vcpu);
>   	}

Probably we should move the RMI_EXIT_HOST_CALL case addition in 
kvm_rec_pre_enter() to this hunk to keep all in one place ?

Otherwise, looks good to me.

Suzuki


>   
>   	kvm_pr_unimpl("Unsupported exit reason: %u\n",


