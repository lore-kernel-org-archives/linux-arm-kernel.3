Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF04FC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 10:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQON4yUhDZuxb8gaF10sc6vnH8fe+VK9AhY37O8cwS0=; b=KLX7duZUiUtgkccYi8dfCMEKVs
	2uwyzAevXaTAteY8koXCsAWLCqS4sWr7AtSnUugRcDv1mXvcxQXSO2FgZwl/9KJAoiGkUYczKH9WD
	kEv7Jmv3dDV8KH2Wdn+FtspNZb+tozC7NB78UuMGIybuXEH5IboxzdJH12F2ahEs0muiIOp6AzoSk
	zhSCKnEfmNKDyk26oVQiFI92NOWvTnXlzgnZMA6j2JghL4hWHq75FQFm6JozvFsxWSNRJGgni+Nir
	8zytwXY4zAIlLFwssf+yQT874YuiEaMkD9XZcvRH638PvKbdXhZFKbIKQwcRk1FNaj81MpMQ3E0Qa
	yq6XoGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3VD-0000000Eno9-0yNj;
	Tue, 07 Jul 2026 10:58:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3VC-0000000Ennx-0XGX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 10:58:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 644FC618AC;
	Tue,  7 Jul 2026 10:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D591F000E9;
	Tue,  7 Jul 2026 10:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783421889;
	bh=mQON4yUhDZuxb8gaF10sc6vnH8fe+VK9AhY37O8cwS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZmoPaXEpEZQFiYzdoJqj/qbj+DnlI3yBM/H1LIY38fkCEIM4CcXvF3z2dam3dnUwa
	 qKOtg54u7hnFUSzxPotBXi+S+MyolSbY8kNFLOVqzmsx5sOVjdgag7EeoZ8rf+kW5L
	 bsR8Nz8iWCVdCckvF6WTJBvv/3exef9ZhZjXPrbix4/yeLiIJ9V/gRIfKrziOZhBHk
	 tFZctlfL3mBUojs1cno1n8Q4qrmYIcTViuaZ6cY6NXUIA+aj3B7o/wZem3ep8e6u68
	 kD2ds9xF3xjPHN9D/b1EUTNZScVRbjrm8L2WAgWoKAUmqSYXv762cRlXhCs4FV7HIz
	 Z76Lv9I/uupmg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wh3V8-00000002MtZ-2yTw;
	Tue, 07 Jul 2026 10:58:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: catalin.marinas@arm.com,
	oupton@kernel.org,
	sudeep.holla@kernel.org,
	will@kernel.org,
	Sebastian Ene <sebastianene@google.com>
Cc: jens.wiklander@linaro.org,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	android-kvm@google.com,
	mrigendra.chaubey@gmail.com,
	op-tee@lists.trustedfirmware.org,
	perlarsen@google.com,
	seiden@linux.ibm.com,
	smostafa@google.com,
	sumit.garg@kernel.org,
	suzuki.poulose@arm.com,
	vdonnefort@google.com,
	yuzenghui@huawei.com
Subject: Re: (subset) [PATCH v9 0/6] arm_ffa, KVM: Fix FF-A emad offset calculations
Date: Tue,  7 Jul 2026 11:58:01 +0100
Message-ID: <178342187223.1892339.1923162787460489447.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702103848.1647249-1-sebastianene@google.com>
References: <20260702103848.1647249-1-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org, will@kernel.org, sebastianene@google.com, jens.wiklander@linaro.org, joey.gouly@arm.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, android-kvm@google.com, mrigendra.chaubey@gmail.com, op-tee@lists.trustedfirmware.org, perlarsen@google.com, seiden@linux.ibm.com, smostafa@google.com, sumit.garg@kernel.org, suzuki.poulose@arm.com, vdonnefort@google.com, yuzenghui@huawei.com
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

On Thu, 02 Jul 2026 10:38:37 +0000, Sebastian Ene wrote:
> This series fixes the Endpoint Memory Access Descriptor (EMAD) offset
> calculations and adds the necessary bounds checks for both the core
> FF-A driver and the pKVM hypervisor.
> 
> Prior to FF-A version 1.1, the memory region header didn't specify an
> explicit offset for the EMADs, leading to the assumption that they
> immediately follow the header.
> However, from v1.1 onwards, the specification dictates using the
> ep_mem_offset` field to determine the start of the memory access
> array.
> 
> [...]

Applied to fixes, thanks!

[3/6] KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
      commit: 8c6db30d79528279abbeb416e4f533f1f91b8724
[4/6] KVM: arm64: Validate the offset to the mem access descriptor
      commit: a6b49d27c17909608d54523220bb6f3498d4a1df
[5/6] KVM: arm64: Ensure FFA ranges are page aligned
      commit: 6a7a181f6921db3d9aed1bba7e15547fefd7eedc
[6/6] KVM: arm64: Zero out the stack initialized data in the FFA handler
      commit: 2bd3c6c702f3a9e2bcb3b536b0fbbaa645005d71

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



