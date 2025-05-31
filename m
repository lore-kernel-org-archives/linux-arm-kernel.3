Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F995C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 17:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIKaGfWeay4gmgyitDh7ECLUFubr+Qk+a6BxZ38Xhw4=; b=YI4m34sTQxMdnONC1yJq+6ea1s
	mAQm4RXE3aAfED0412d9Mbl0ttq2RSMRjbEpYKPEw8yk5mt2TEDxitGUrDV4MFke5a2nOJvOXsF6Q
	jVCpTWpm/ovkqoprPRX43KEWHsHlEV25/o5Vo/p1tXYbqnQ88XMaS2LqSmgyDlHpUt2LptC8uf+OJ
	cY3HC3tdmAGYu5/nTlwvedDOYSlt8ak73A8adVgDB94qWLO47OedCq7jBUf0g0Ms0KK4wwwVQP5K4
	+09LmNV2RgYc6Hmm7Ci3e/z0EH2teqFet4kkkdY1mk4asIlbEI1cDhA0AyEZWqMn1rn1rKbVHvKrb
	BslnK3nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLQPu-000000047ZR-2Tea;
	Sat, 31 May 2025 17:54:46 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLQNU-000000047TP-0PuB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 17:52:18 +0000
Date: Sat, 31 May 2025 10:52:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748713932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mIKaGfWeay4gmgyitDh7ECLUFubr+Qk+a6BxZ38Xhw4=;
	b=lh73EyMa2Ds6x5eHvP1OegrOq1lLDkdWfC2sOEGDrwumkDIpZDjAuBHm8RAzrD9BN+KmG/
	g4reFmDMcopUnKU/rM05GHnDDq9LtbGeqWjm4nZtwhZKv2waw9UspWtYXz8kfadLHktq8/
	0gmalqL7gcf5GhEhj1vCWtRAk2cEJPU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Add helper to identify a nested context
Message-ID: <aDtBx7BXLeCzofPf@linux.dev>
References: <20250531164901.1166892-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531164901.1166892-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_105217_006694_9770CFE6 
X-CRM114-Status: GOOD (  13.14  )
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

On Sat, May 31, 2025 at 05:49:01PM +0100, Marc Zyngier wrote:
> A common idiom in the KVM code is to check if we are currently
> dealing with a "nested" context, defined as having NV enabled,
> but being in the EL1&0 translation regime.
> 
> This is usually expressed as:
> 
> 	if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu) ... )
> 
> which is a mouthful and a bit hard to read, specially when followed
> by additional conditions.
> 
> Introduce a new helper that encapsulate these two terms, allowing
> the above to be written as
> 
> 	if (is_nested_context(vcpu) ... )
> 
> which is both shorter and easier to read, and makes more obvious
> the potential for simplification on some code paths.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Thanks! I'll probably pick this up as a prefix on my abort routing
series if that's OK with you.

Best,
Oliver

