Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16ECCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtBDzQiTvTUic8H2WMvD7VO/oD+0Jf4bASTEX4hnFCc=; b=nZ80cZcrTFkTqAXlHUgzY83Au+
	hi+cmHU0AAGhfP5+9VxFd/rbXlG8JzBRGEgFg7qCKM4mm91L7aLI2fV91XyAORQkP3c6/Mc+86XkG
	BD36j8d/o2cdLl59q3PJktFqjeyZsaf6rvoEpYG+IdIDewL+gebaSNMLHXVfSXkiW5/r1oWbRQgiQ
	Hj68N65yRtHaOtrS77v0ReCtjdW/0w1pJ3vejEl6yJTjXsWmx2gkpI5uZj4pgcJ5+4V85psWqG1v5
	/lqqut4nC7eCFaRc7LhP10bp1fXNND6wIQFdGJ1sDcIsO2fRXulrm2rrMQgoQ4qWa9fjPMPjQ/u55
	0ivc6O2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlcY-00000005RM2-0xbY;
	Wed, 20 May 2026 18:26:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlcX-00000005RLm-11E1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 18:26:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F5AE600FF;
	Wed, 20 May 2026 18:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3049E1F00899;
	Wed, 20 May 2026 18:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779301576;
	bh=UtBDzQiTvTUic8H2WMvD7VO/oD+0Jf4bASTEX4hnFCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KOs8pp//UUBrbRCAKAHUxFpTLwhToz+ZsQ+ABWasVNkoYZEZHrhgVSWzwuMXoAxcW
	 X2+xbVi3Ku/QeWmWBwfjaJFeXKP3couyY/Kn1yzRM4d8wY9TKG+8X+fQSWzMfF61p8
	 2jr4orvctQmcApqwgkPR5lyvlEydA0K/CZ7Ev9DtfT35kwQopsvBVEBTK54+HGJjfm
	 SDaQOg8nhMRSWnZLfWjXpL9pzwedGoQ6/4SqSMb5DFAtw9HrxIoodDlXxQUjjs6d+H
	 n3c41O4lSRmd2Dner1YC1OU0s8IbjDYXlBspsTFC5yWm+HSyLMDutEGOa5XG58m68h
	 8a32ejOCEYtrQ==
Date: Wed, 20 May 2026 11:26:14 -0700
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v3 0/6] KVM: arm64: Don't perform vgic-v2 lazy init on
 timer injection
Message-ID: <ag38xu7sd_TT8uzu@kernel.org>
References: <20260520100200.543845-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520100200.543845-1-maz@kernel.org>
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

On Wed, May 20, 2026 at 11:01:54AM +0100, Marc Zyngier wrote:
> This is the third version of this series aiming at fixing issues with
> vgic-v2 being initialised from non-preemptible context.
> 
> * From v2 [2]:
> 
>   - Remove the PMU's irq level cache which was hidding in plain sight
> 
>   - Simplify the userspace notification of interrupt level update
> 
>   - Additional comment clarification in patch #1
> 
>   - Collected RB, with thanks
> 
> * From v1 [1]:
> 
>   - Repaint kvm_timer_irq_can_fire() to kvm_timer_enabled()
> 
>   - Drop duplicate kvm_timer_update_status() call
> 
>   - Force lazy init on the irqfd slow-path for SPIs
> 
> [1] https://lore.kernel.org/r/20260417124612.2770268-1-maz@kernel.org
> [2] https://lore.kernel.org/r/20260422100210.3008156-1-maz@kernel.org
> 
> Marc Zyngier (6):
>   KVM: arm64: timer: Repaint kvm_timer_{should,irq_can}_fire() to
>     kvm_timer_{pending,enabled}()
>   KVM: arm64: Simplify userspace notification of interrupt state
>   KVM: arm64: timer: Kill the per-timer irq level cache
>   KVM: arm64: pmu: Kill the PMU interrupt level cache
>   KVM: arm64: vgic-v2: Force vgic init on injection outside the run loop
>   KVM: arm64: vgic-v2: Don't init the vgic on in-kernel interrupt
>     injection

s/how/now/ on the first line of the changelog in the last patch... Too
lazy to draft another mail.

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

