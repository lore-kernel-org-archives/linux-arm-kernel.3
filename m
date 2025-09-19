Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39C7CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 22:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wejgJvJ+telvOoqvjuYRyYA1GW2xJkDX688ipOO2264=; b=jp9yW9Oc02np9/NfwfeecHBRre
	5xDU16QenRuZr2euPC86cPs3A4b/1izlU3+epev1QvBKwnCtfDKoBLBz9BnAjwyhEifh7sTE/+wne
	tjDE8wZ2jQjwLX6zyvOr6ULYwWKhlJRnozUY5SpuoCSdycETPPCVjal+pb5dBcXII0p2AitXMELOP
	VpX8mnSTo9FRC8jxrCJiroZAl5Omkt4czo2XyQYhTpDraHHJ2h+haGtcAeKVaOC8UD+ParXanHzbx
	KWWqISz9iMUKuhLldO5RbGaO85TBMb8IPIZv/3yYACN2inJMIUkbJ7VGeBqBCu9kgSty9EGnwVxwJ
	6qxqR0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjjH-00000004DH3-3Rda;
	Fri, 19 Sep 2025 22:37:23 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjjF-00000004DG2-2pMI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 22:37:22 +0000
Date: Fri, 19 Sep 2025 15:37:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758321439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wejgJvJ+telvOoqvjuYRyYA1GW2xJkDX688ipOO2264=;
	b=oMvitq2NwZVYf/vbOtHD66sru9qX10p1arlJYfA6krLSsktY+DMPq0bgCVAqtbWbU3b22L
	RD+B1P5flLGIaVcxDs4RqkLOZG6lltaQB+wzcs3t0ZMCOQrEXoA1hpGN4r70pGrgpTakOd
	kktb0CDfhLL3fuMQX3zPYSCLDpND4yU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 00/16] KVM: arm64: TTW reporting on SEA and 52bit PA
 in S1 PTW
Message-ID: <aM3bG1fkB4cYslUJ@linux.dev>
References: <20250915114451.660351-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915114451.660351-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_153721_853204_36A7CE3E 
X-CRM114-Status: GOOD (  19.60  )
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

On Mon, Sep 15, 2025 at 12:44:35PM +0100, Marc Zyngier wrote:
> Yes, $SUBJECT rolls off the tongue.
> 
> This series was triggered by the realisation that when injecting an
> SEA while on a S1PTW fault, we don't report the level of the walk and
> instead give a bare SEA, which definitely violates the architecture.
> 
> This state of things dates back to the pre-NV days, when we didn't
> have a S1 page table walker, and really didn't want to implement one.
> I've since moved on and reluctantly implemented one, which means we
> now *could* provide the level if we really wanted to.
> 
> However, nothing is that simple. The current code in at.c is firmly
> 48bit, as our NV implementation doesn't yet support 52bit PA, while an
> EL1 VM can happily enjoy LPA and LPA2. As a result, it is necessary to
> expand the S1 PTW to support both LPA and LPA2. Joy.
> 
> Then, once the above is achieved, we need to hook into the PTW
> machinery to match the first level of the walk that results in
> accessing the faulty address. For this, we introduce a simple filter
> mechanism that could be expanded if we needed to (no, please no).
> 
> Finally, we can plug this into the fault injection path, and enjoy
> seeing the translation level being populated in the ESR_ELx register.
> 
> Patches on top of 6.16-rc4. I intend to take this into 6.18, so shout
> if you don't like the idea!

Just some minor gripes, otherwise this LGTM.

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

