Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BD8C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 08:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gi/YOWM50f+6s+RLmyZNOIFUMY6xKCWoy3EB/2RsaYA=; b=vZsMRYOSTnXPB5qBqZPtWyG4Ep
	qWWdaQEd+j6tSqD16OsfzVp1MxQxMN+4wuok+Fdl04eedvKQ1FIN7EthRH/P693VA2lXZHCUGZjxm
	yp5nrecMmMRGWh7dAlgCdgDpRHnpoM/Km1aNw40dVyLVGxtpQbARTqoiIhCgJxg+eWCzwu9n41Qy4
	sUhH/hjxA4W6BeqdaOyfV7XVSnQ3Af6sx53kcmOPO/AU+lgpzZwZYRR1HLJxpBV4TTIcRxK4hUo/u
	5NOuI81/WYnQBY3jyaQI1aRVr3V7xmt+AtCcyZVSohCvHFn1qaB4WMuXnqO6/Ste5iiMdvw/iOxlW
	t6nqhjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9q7-00000007I06-0ZrQ;
	Tue, 21 Jan 2025 08:42:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9op-00000007Hua-1cKv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 08:41:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 532C85C56DD;
	Tue, 21 Jan 2025 08:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78028C4CEDF;
	Tue, 21 Jan 2025 08:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737448866;
	bh=ly915CsFIVxI/p5+bfchBNsCBHutAPPsxgSvZwYY+io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GM3Jc218irhc3CXpNOYXaoLuY8Q4UuQBItakNCpI1IFBYH5En3E5+jChedYEyXGvX
	 PFJsHKv/0OwECreHK2xmnGT7iX+Itwematkp5ouhBv4rY1YpqiNf9uf6Eo5rtWE5SM
	 11T7I5AeFyjtvQP8oa+FcFjJknyBXgVpyGtjXJhChLcY3Tjuvs8CzVVZoGiZj+0ObI
	 oet50BNFLHUk9/M1duPCFG0vUdwHlNtxH/IhiYqWKRskol5fskHjfYvUPu+j8Iw4/I
	 8fpwFkQrMSNndgsm23AIhStCZFAidumWChO1Atgmr+CyghJtnFeSuNXRO9RJIZ7xMc
	 JC/JEm0BRRWMw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ta9ol-00E0J4-5G;
	Tue, 21 Jan 2025 08:41:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Lokesh Vutla <lokeshvutla@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	sachinparekh@google.com
Subject: Re: [PATCH v2] KVM: arm64: Flush hyp bss section after initialization of variables in bss
Date: Tue, 21 Jan 2025 08:40:50 +0000
Message-Id: <173744884188.1663521.13719944692301643191.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250121044016.2219256-1-lokeshvutla@google.com>
References: <20250121044016.2219256-1-lokeshvutla@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, catalin.marinas@arm.com, will@kernel.org, tabba@google.com, lokeshvutla@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, sachinparekh@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_004107_462315_33736BC2 
X-CRM114-Status: GOOD (  10.18  )
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

On Tue, 21 Jan 2025 04:40:16 +0000, Lokesh Vutla wrote:
> To determine CPU features during initialization, the nVHE hypervisor
> utilizes sanitized values of the host's CPU features registers. These
> values, stored in u64 idaa64*_el1_sys_val variables are updated by the
> kvm_hyp_init_symbols() function at EL1. To ensure EL2 visibility with
> the MMU off, the data cache needs to be flushed after these updates.
> However, individually flushing each variable using
> kvm_flush_dcache_to_poc() is inefficient.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Flush hyp bss section after initialization of variables in bss
      commit: 9bcbb6104a344d3526e185ee1e7b985509914e90

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



