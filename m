Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF45E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 18:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jSwLJoG7dee5g+IYw1k00x4GMomga97dhl8oz4ghiw=; b=l0egQMTJRTQJh5rbgJ6YMCbNFx
	Q6UKC2BUwuiTtA+orCc32vd7tdpfarvUjUEpOW8SuNDwqzitnxv1NHPzrCNnkO445ePS9j+sztWkC
	CZhmK/nPswGvySYil2iNDmv1pGhVvkkGnBMLefaxYIYZPxvmzizf/LK/at6i7ZsMiTwcfoUHa3shA
	bBLjn/CKpJWyaAEzNCsSMsqf7r8YUUG+to3t2U8Aut3btNcDtS7s6CaDSFB8rRSYKiAy83unO7HAv
	QRhtV7T5UjYA9mgRsXvcnJ9vmq/vNVFQtezhmle39vXWoA1HooUmuKy/gxzSWhzY9nIFkXe2ffwYN
	h73q9yRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWK6R-0000000GdtF-0uNS;
	Fri, 10 Jan 2025 18:51:27 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWK5B-0000000Gdhl-3Hpr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 18:50:11 +0000
Date: Fri, 10 Jan 2025 10:49:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736535004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5jSwLJoG7dee5g+IYw1k00x4GMomga97dhl8oz4ghiw=;
	b=XmxUH1K5Mz1roIxUU7KJg0dQeedtL5n23up15s5LS/dj7Up5NaHx4HgmVCh6Yp9hO5Rv/x
	S1eOcB1PZHFwK0fXE1P1Ld6v3O4dQ1lC3tr/1Fruf8GAt1hWQGUxaeLaar/sZxXfNOL7W1
	9V+VAo3LXUJUUiJb9eZUTmEV0DcnMks=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ryan.roberts@arm.com,
	catalin.marinas@arm.com, mark.rutland@arm.com, james.morse@arm.com,
	will@kernel.org, maz@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v1] arm64: Add TLB Conflict Abort Exception handler to KVM
Message-ID: <Z4Fr1HkKCm9AXSIA@linux.dev>
References: <20250110172411.39845-3-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250110172411.39845-3-miko.lenczewski@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_105010_160732_6BD08E69 
X-CRM114-Status: GOOD (  16.50  )
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

On Fri, Jan 10, 2025 at 05:24:07PM +0000, Mikołaj Lenczewski wrote:
> Currently, KVM does not handle the case of a stage 2 TLB conflict abort
> exception. This can legitimately occurs when the guest is eliding full
> BBM semantics as permitted by BBM level 2. In this case it is possible
> for a confclit abort to be delivered to EL2. We handle that by
> invalidating the full TLB.

typo: conflict

Also, a bit of a nitpick, but mentioning that TLB conflict abort routing
is implementation defined when S2 is enabled is valuable information.

> @@ -1756,6 +1756,19 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  	ipa = fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
>  	is_iabt = kvm_vcpu_trap_is_iabt(vcpu);
>  
> +	if (esr_fsc_is_tlb_conflict_abort(esr)) {
> +
> +		/* Architecturely, at this stage 2 tlb conflict abort, we must
> +		 * either perform a `tlbi vmalls12e1`, or a `tlbi alle1`. Due
> +		 * to nesting of VMs, we would have to iterate all flattened
> +		 * VMIDs to clean out a single guest, so we perform a `tlbi alle1`
> +		 * instead to save time.
> +		 */

I'm not sure I follow this.

At this point we've taken a TLB conflict abort out of a specific
hardware MMU context, and it's unclear to me why a conflict abort in one
stage-2 MMU has any bearing on the other stage-2 MMUs that could be
associated with this guest.

Even in NV, KVM is always responsible for the maintenance of hardware
stage-2 MMUs. So stage-2 TLBI elision in the guest hypervisor should
not lead to a stage-2 TLB conflict abort.

TLBI ALLE1 is a larger hammer than what's actually necessary here. Could
you perhaps introduce a new invalidation routine,
__kvm_tlb_flush_vmid_nsh(), that does a TLBI VMALLS12E1 behind the
scenes?

If an NV guest is playing games at stage-1 across VMIDs then it gets to
suffer the consequences (additional TLB conflict aborts).

-- 
Thanks,
Oliver

