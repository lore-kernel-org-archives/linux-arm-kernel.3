Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BB5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWmdVczZNzTBvgYhqBLWG38saCe5L4qLnfo2fRbcBuc=; b=qmmvXGobDYCU+Vxi58cNdEo8H4
	LlkdslDihUUdWZA4v9QNvChBcwsxl7fvma+pv4InXEUKzodk1sipoMzhKnBOwZxh97rxeO/4aSyPs
	g6z9lyQzboJXkwuhpF8N9OvDgW5mImPsePmIproAEJqAx0R8rV/tAoaW/utERj9GYOCLRci7C1xO0
	y+bz4yfgE61S6oFnDvA+8IByyHcEfvz2+RzyIbj/fwXL22JuQ6jXGwkrWV4dIHHg/P125SkghSFfy
	BQrxmIlyaWBUWI/q48wydAHpSA/miOuw6yoUrgtIpme3YUDyUPip/r+Rxkxw8X+wrc7bGFcQvkvvC
	RfFXuVww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6Po-0000000F6tE-17w4;
	Tue, 07 Jul 2026 14:04:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6Pm-0000000F6t8-2tQW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 14:04:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 64A4041AD9;
	Tue,  7 Jul 2026 14:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B551F00A3A;
	Tue,  7 Jul 2026 14:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783433086;
	bh=sWmdVczZNzTBvgYhqBLWG38saCe5L4qLnfo2fRbcBuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VORi0ayZvl8ZkSGFQeQ8nBgFBrpg7rJs7lS5cMipb05PoCqrRz4wKHl7lV0HnRwht
	 ausRGdW5rPZMzkFasC5B6rbmnkEh386iZNFBShkAnlWhXeld5ma4dY9JlP8x9eOZfC
	 G1hbl8M8jzNRrrf8VKMlIBuaGoOf0yq0Xub8HdtATAMJasbiamW18BVAuKR0DBp7mT
	 4UtdUBw6lZ2a+qQMT1EQ5r6501wpBo231CmAQjnfp9qQDWSCsis4A5udIiI4rxUHEg
	 YMTBm3nnsu72cR0FeeeQP+JggA5Uk66UAejpVW4RUm0ylRRg4Yz5QFo32DYlBrXqRp
	 Ck452iwzZgf9g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wh6Pk-00000002RIJ-0evq;
	Tue, 07 Jul 2026 14:04:44 +0000
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
Date: Tue,  7 Jul 2026 15:04:37 +0100
Message-ID: <178343306571.1899612.18300071098746030610.b4-ty@kernel.org>
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

[1/6] firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()
      commit: 3383ffb7ef937317361713ffcc21921a7848511a
[2/6] firmware: arm_ffa: Fix Endpoint Memory Access Descriptor offset calculation
      commit: b4d961351aa84fdf0148783fb1f3a1391b8a0adb

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



