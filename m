Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C54CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KEBoR2NF5SFNxXTP9ERe3gk24NqRNbTEKVIDs5duuM=; b=P6RKs3SqUpSz7qH8YfLlx1wv+K
	XIEaiHv3MtQSj+mBDfVwI7cDPTYsh13UK/BsAwbk4qgbhlpg4PD97F482bLo/YRp2AhogRjFOS508
	yTVxxoTRz+cmMOy2y5r6vu49AglWWQVX8N7/7li1M/G8qiAeNC/axGTabIA85WqHAhy9VE6O/mQUJ
	Fm2sYyhlPRA4VLOp9Lq1Dln0iwGbNjlYRitI82fkXKzKKA7s69bfQP/oH3OJh2qzSHFJJyZQh8gPB
	i5BynABHrpunyXFXkd4GrrMwsfORuxz2ZFJwyAP/Aoi5mybgt1JnyllcGjmCXe/MdV+FEwMSlpae9
	8eT9Tntw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSqb-00000001mGN-0U86;
	Wed, 22 Oct 2025 07:01:25 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSqW-00000001m6l-2TH6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 07:01:23 +0000
Date: Wed, 22 Oct 2025 00:00:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761116457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9KEBoR2NF5SFNxXTP9ERe3gk24NqRNbTEKVIDs5duuM=;
	b=kFP9CdYpXFhlbYcBxvLZpwKZovKdHaNAHaCCudWiy6suLIs0ODT5J9cVI2s04HjjfNbudz
	taiovlVK8FDkQ/YF3Dg6TrgQvASB2YIzETsutcZ331Oxg/BRyCyEec0l/wfjYuHU49Nrpj
	lI7AtI8dGYdJoVHpT7Gj8RouzUqRxzg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] KVM: arm64: Make ID_PFR1_EL1.GIC writable
Message-ID: <aPiBH1_WZicoE7Od@linux.dev>
References: <20251013083207.518998-1-maz@kernel.org>
 <20251013083207.518998-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013083207.518998-2-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_000120_772381_26178252 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

Hey,

On Mon, Oct 13, 2025 at 09:32:05AM +0100, Marc Zyngier wrote:
> Similarly to ID_AA64PFR0_EL1.GIC, relax ID_PFR1_EL1.GIC to be writable.

This looks fine to me, although I do wonder if we should just allow
userspace to write whatever value it wants to the 32-bit ID registers
and be done with it.

Nowhere do we use a 32-bit ID register value as a condition for trap
configuration / emulation, so even if the VMM lies to the guest it
shouldn't trip up KVM.

Thanks,
Oliver

