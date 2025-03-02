Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60437C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 08:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b49G2JWa7kOeHxP4WVX/xPZ1G3UT2Z18oMvBJnNuLlU=; b=yHOVkAiRHYU/FFIYdzgkodYLID
	W3eLZI90bMBNQu3rmfvx/OA4WdY5rere4UCb7VTQ7KPClgMDZlRC8PTfWHIkTJ4nrNHGSR/2OSo2X
	VH4xWPPixDB/wE79LIACKkHkm/5v72jm6DC1Nw6jv336Rh+OWO/6Um9M8uiGTvasAL2POrd7q4wNh
	DHuQHTIVlDMJEvn4LpPVl9+zgPvf2bQBDAUl9slZjvI9uLr0S+qjJQemn3l1wrNqoqHJU5OkMzgrx
	3xmyzxncUsC7N3NvfXhZYy9Ng2O46GaIjCRW+wPt350b2oBwiyNwUsbLNmbyUayCQ1kTDltT3P8Y2
	I37T3oqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toeuZ-0000000Fge3-2ON5;
	Sun, 02 Mar 2025 08:42:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toet3-0000000FgbQ-0oh8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 08:41:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72CB561150;
	Sun,  2 Mar 2025 08:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96744C4CED6;
	Sun,  2 Mar 2025 08:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740904883;
	bh=shygSG4jJZ0nMCTqJCVmz4MRExogp395qEunp5/6nE8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KnW5XC9Y+ZZ1MmxNnOpHUx/b0xDo6PGQhbEi9SakX+h8awXXephFYF05USFFEn6pG
	 IcWr8rdMUVJ/CtwmrV5ZSROpNZtRHLKozb0QaruhASpttZOX4wYmkw9KVkkQqHzZSn
	 2AiMXgLcdCMrrNcNDJ+T587GOgjDi6p85+na+bkjhCb3cbMp1gd9lKMAKv3GSWbdXy
	 /1nx0LtTKDd9IaG9VoxSBNNA8zQjHt3/ocwAPofRGyy0tzdWqT4gotoAbRLxBf66ko
	 DlKp4HhupIp0ys4avldhcRVkePlCjCFXdMVyAovBKAIyxpNexVGMvh9t+TKabP+w+G
	 9/HqX+O+KRZkg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1toesz-009WBm-9s;
	Sun, 02 Mar 2025 08:41:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: ahmed.genidi@arm.com,
	ben.horgan@arm.com,
	catalin.marinas@arm.com,
	kvmarm@lists.linux.dev,
	leo.yan@arm.com,
	oliver.upton@linux.dev,
	will@kernel.org
Subject: Re: [PATCH 0/2] KVM: arm64: PSCI relay fixes
Date: Sun,  2 Mar 2025 08:41:18 +0000
Message-Id: <174090487063.2316303.3603727860925384915.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250227180526.1204723-1-mark.rutland@arm.com>
References: <20250227180526.1204723-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, ahmed.genidi@arm.com, ben.horgan@arm.com, catalin.marinas@arm.com, kvmarm@lists.linux.dev, leo.yan@arm.com, oliver.upton@linux.dev, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Thu, 27 Feb 2025 18:05:24 +0000, Mark Rutland wrote:
> These patches fix some missing initialization in the PSCI relay code
> which can result in host kernel crashes shortly after entering the cold
> entry points used by PSCI CPU_ON, CPU_SUSPEND, and SYSTEM_SUSPEND.
> 
> The SCTLR_EL1 issue was originally reported by Leo Yan and debugged by
> Ahmed Genidi. While looking at Ahmed's patch I spotted a more general
> issue with E2H, so I've fixed that up with patch 1, and I've tweaked his
> patch accordingly. Any errors there are my fault.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: Initialize HCR_EL2.E2H early
      commit: 7a68b55ff39b0a1638acb1694c185d49f6077a0d
[2/2] KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu()
      commit: 3855a7b91d42ebf3513b7ccffc44807274978b3d

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



