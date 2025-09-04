Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558B1CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 08:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmX5Pq7jfd5FzhfjR9wnPLjhNm2M1cF7IIhjksMYdsI=; b=xeWA/8N7Du5aqQHxE8Y55R0vV8
	keFPaxzcvc/XtJBQ7Z6W2ZLNtV+ERgooQLyTlI4TfBmgK7/0YMu7ohrxl5TACeFxQ6DjOXiTvm6/0
	25krrb7tnthiYstIKWuS+PuchuH47N81d/Zn3Kp9/mt6t9VPUN5+WsSh6D7sl7lx9YWb9WAdtsPtV
	xgODAAlZFJB4zgAk9awx3Slp1AHbEGxsVFV7A7CWx2gvbgS4EqGEi+oXaFoyL872oiLMZfi1Wftsq
	c1FXixrcLNbdHLNMCNP0UIC4dYRmOylxRBQfrjbGsucuPukOlVirsXLjAuRyGfrAx4AlJ3NkUxA/9
	Nvr5VEew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5g0-0000000AM0W-3FQX;
	Thu, 04 Sep 2025 08:50:40 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4tQ-0000000A3je-36kQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 08:00:30 +0000
Date: Wed, 3 Sep 2025 23:55:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756972826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OmX5Pq7jfd5FzhfjR9wnPLjhNm2M1cF7IIhjksMYdsI=;
	b=tbjDuSDakHEfcVYr/n/bNLfegBIaJ9t8nplAQtUlsEpGaIkGxJRojABDG/FyPnxsLCSME9
	PwzS6R+OywkMOUAhHb53Iuj8KvV+wvMlxzTKSNpK4EPHBw1yJ3Qv2EJb4Ko2/xEYB0y6Ua
	pR9LjKNOgTeVqHe0ooImOyHQkTbLfuU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH v2 2/2] KVM: arm64: VHE: Save and restore host MDCR_EL2
 value correctly
Message-ID: <aLk38kyxyoe0CYq-@linux.dev>
References: <20250902130833.338216-1-alexandru.elisei@arm.com>
 <20250902130833.338216-3-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902130833.338216-3-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_010028_923063_9B3B4752 
X-CRM114-Status: GOOD (  10.55  )
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

On Tue, Sep 02, 2025 at 02:08:33PM +0100, Alexandru Elisei wrote:
> Prior to commit 75a5fbaf6623 ("KVM: arm64: Compute MDCR_EL2 at
> vcpu_load()"), host MDCR_EL2 was saved correctly:
> 
> kvm_arch_vcpu_load()
>   kvm_vcpu_load_debug() /* Doesn't touch hardware MDCR_EL2. */
>   kvm_vcpu_load_vhe()
>     __activate_traps_common()
>        /* Saves host MDCR_EL2. */
>        *host_data_ptr(host_debug_state.mdcr_el2) = read_sysreg(mdcr_el2)
>        /* Writes VCPU MDCR_EL2. */
>        write_sysreg(vcpu->arch.mdcr_el2, mdcr_el2)
> 
> The MDCR_EL2 value saved previously was restored in
> kvm_arch_vcpu_put() -> kvm_vcpu_put_vhe().
> 
> After the aforementioned commit, host MDCR_EL2 is never saved:
> 
> kvm_arch_vcpu_load()
>   kvm_vcpu_load_debug() /* Writes VCPU MDCR_EL2 */
>   kvm_vcpu_load_vhe()
>     __activate_traps_common()
>        /* Saves **VCPU** MDCR_EL2. */
>        *host_data_ptr(host_debug_state.mdcr_el2) = read_sysreg(mdcr_el2)
>        /* Writes VCPU MDCR_EL2 a second time. */
>        write_sysreg(vcpu->arch.mdcr_el2, mdcr_el2)
> 
> kvm_arch_vcpu_put() -> kvm_vcpu_put_vhe() then restores the VCPU MDCR_EL2
> value. Also VCPU's MDCR_EL2 value gets written to hardware twice now.
> 
> Fix this by saving the host MDCR_EL2 in kvm_arch_vcpu_load() before it gets
> overwritten by the VCPU's MDCR_EL2 value, and restore it on VCPU put.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

