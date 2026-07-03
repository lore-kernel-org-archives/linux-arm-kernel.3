Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE77C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 23:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zWq6d9o5oCGb91ldInP6TJuiRGBPDVvUdwGfjbWcn0=; b=e2xvvr2x6umWo80dS6UDvOH7C1
	dpLgDb/saLWnY+RCGf7Ma1C8CBItmHD0mbFLNxB6pU51/B5M0D4w9z0WXIrUqhKVYoYu4p+OYZVLI
	5QMMvTqNINwxAdQ/MErw13wGbNgTL+MGoshDT37hKnSwJ6FHw1IDdaSNAO2SIMK/dnIpbibn6+bMC
	ATQm0T7+ub/EN0bFXgPtUAOFDCOCEyCnFNQwgOGtUXL6cAL/YJP+xj54MpcaOVtU4v4U1kcxZUFXm
	DxzhMjxEZhobrYVr2KdpNxWTXHjU/CLqggn1Cbj11DU8eduyc5c/VnOnTbVPWBGVeV22wFBkPJpZI
	Y34/+6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfm8g-00000007y24-2v3J;
	Fri, 03 Jul 2026 22:13:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfm8f-00000007y1t-1sNu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 22:13:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C922600C8;
	Fri,  3 Jul 2026 22:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0871F000E9;
	Fri,  3 Jul 2026 22:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783116816;
	bh=1zWq6d9o5oCGb91ldInP6TJuiRGBPDVvUdwGfjbWcn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S88GP2ALlLALevOAxjhC/nVg8Af4WWLOpceyxmu7ID76dWgbhfHOEZh09gQo9tzsn
	 cWBW5TXP+mmNFMdRPCofDEjDwdKDEtEk+rEh0L/241Z97cPEiC8ZOgcHlNf5MPJYH1
	 QV1LNChYQ3zON2ssUA6eLmMIRvA2vB6nSkC7k1DDSqEZ8HMg9hyN4nrZkc50WiDjlF
	 YPW0QDswGXCyeYjNv5RlrHejc/xlfCjRNOwDtpiT3FrzE9XEYt7cuxoQCkmCxRen3S
	 5uFs+LqS7NrfNy1EHPytjZ6BHxwWvU8rIoaaX9Ew/bqLXwEK590UG1Raop2dgDau6C
	 mVnsIQxo7rehA==
Date: Fri, 3 Jul 2026 15:13:34 -0700
From: Oliver Upton <oupton@kernel.org>
To: Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>
Cc: kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, maz@kernel.org,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] KVM: arm64: vgic: Fix race between LPI release
 and re-registration
Message-ID: <akg0DgQvu4lsESCG@kernel.org>
References: <20260703122601.2617577-2-clopez@suse.de>
 <20260703122601.2617577-3-clopez@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703122601.2617577-3-clopez@suse.de>
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

Hi Carlos,

Please wait a few days between spins, we were in the middle of a
conversation and I didn't have a chance to reply to you since yesterday.

On Fri, Jul 03, 2026 at 02:26:00PM +0200, Carlos López wrote:
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> index 67d107e9a77d..577286069368 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -116,7 +116,15 @@ static struct vgic_irq *vgic_add_lpi(struct kvm *kvm, u32 intid,
>  		kfree(irq);
>  		irq = oldirq;
>  	} else {
> -		ret = xa_err(__xa_store(&dist->lpi_xa, intid, irq, 0));
> +		/*
> +		 * The entry is either empty or contains a dead LPI (refcount=0)
> +		 * from the deferred release path, pending cleanup by
> +		 * vgic_release_deleted_lpis(). Evict and free it if present.
> +		 */
> +		oldirq = __xa_store(&dist->lpi_xa, intid, irq, 0);
> +		ret = xa_err(oldirq);
> +		if (!ret && oldirq)
> +			kfree_rcu(oldirq, rcu);

We need to assert the assumption here that the evicted IRQ has a nonzero
refcount and is pending release. Otherwise I feel like possibly leaking
memory is better than potentially introducing a UAF.

Untested diff below.

Thanks,
Oliver

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 4477f870c7b3..621a83399184 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -116,18 +116,28 @@ static struct vgic_irq *vgic_add_lpi(struct kvm *kvm, u32 intid,
 		kfree(irq);
 		irq = oldirq;
 	} else {
-		ret = xa_err(__xa_store(&dist->lpi_xa, intid, irq, 0));
-	}
-
-	xa_unlock_irqrestore(&dist->lpi_xa, flags);
+		oldirq = __xa_store(&dist->lpi_xa, intid, irq, 0);
+		ret = xa_err(oldirq);
+		if (ret) {
+			xa_unlock_irqrestore(&dist->lpi_xa, flags);
+			kfree(irq);
 
-	if (ret) {
-		xa_release(&dist->lpi_xa, intid);
-		kfree(irq);
+			return ERR_PTR(ret);
+		}
 
-		return ERR_PTR(ret);
+		/*
+		 * The expectation is that only LPIs which are pending release
+		 * could possibly be evicted by storing the new entry. Free the
+		 * old IRQ only if this is the case, as otherwise someone else
+		 * could still hold a pointer on the outgoing IRQ.
+		 */
+		if (oldirq && !WARN_ON_ONCE(refcount_read(&oldirq->refcount) &&
+					    oldirq->pending_release))
+			kfree_rcu(oldirq, rcu);
 	}
 
+	xa_unlock_irqrestore(&dist->lpi_xa, flags);
+
 	/*
 	 * We "cache" the configuration table entries in our struct vgic_irq's.
 	 * However we only have those structs for mapped IRQs, so we read in


