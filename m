Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D26CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzPwMVRHnsua+MMPFAPSMptThMMCWGE2wdCA+XcJT2Q=; b=lDBlfN8GoVUrB/gLZjIAv3T0t9
	btwBG1UChYualRBrl+nwgQZUlfLc9klddqCI01f77lngSwS7+h7OoTSaRH659mzRaaUUFBSZCW1F9
	+4Hd6dsyNcrvrguKG1p0AdEupGLlDPVtDjEiF1HOEMZW4OXSh7gVGHA/E8Om8sWFjaqLQjyfFDi/G
	E2VZeLiRvMfB+LnNXcvQ0K2qnOm7+yd9AW17zvtsFA8Q3lc/N/b5eEKLMzWhToXZlMXVEG9SZFbns
	Jcfm/aQhzL9jxjYeUNb/U1yiE3FEZPbABabvKBNhhipTAggnalcr4Tt+UR+TEmw3dsLiJG6coIrCr
	skXLGQTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPHW-00000002Esu-3zOc;
	Wed, 07 Oct 2026 10:53:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPHV-00000002Esf-1YBr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:53:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D57C5405B3;
	Wed,  7 Oct 2026 10:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60BD1F0089D;
	Wed,  7 Oct 2026 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791370432;
	bh=VzPwMVRHnsua+MMPFAPSMptThMMCWGE2wdCA+XcJT2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PuJJKRLM7po6vyyXkFG7qLIRflQp3azbcSUtERQiwtLbFsRj6KYzl35/iV8F7CrHg
	 S4T0tQyoWiYLlZkeRUMyNC8eUoKxyXFzXs67f77Ahpg9ByYyY79rT/7xEdNXZvgdnc
	 I7kJmEv0uUW4NetvZ9h1PJG2rDZvjwKkw8W7VcwQMb8aIaOzHX76h1Z/Uu6JQjjI8g
	 8gqmiG5i5MRVm75Ct6YlAlOe56TagG7QAGX2m2mIF2bR8eglwATAR/O0tZfLdUhqKJ
	 oF6wSCGhQJz4K0+YpLvu5Ii8yGtMR/aUUdYwS9mgywgBULkFl0I88rP7zATDcIZye6
	 tKRI2+unduEMQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xEPHS-00000000Edx-3Cur;
	Wed, 07 Oct 2026 10:53:50 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/3] KVM: arm64: timers: Program CVAL from the current count when the hardware won't apply the offset
Date: Wed,  7 Oct 2026 11:53:47 +0100
Message-ID: <179137042025.697424.15256970902221447316.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261007074343.324269-1-fuad.tabba@linux.dev>
References: <20261007074343.324269-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, zenghui.yu@linux.dev, gankulkarni@os.amperecomputing.com, will@kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
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

On Wed, 07 Oct 2026 08:43:40 +0100, Fuad Tabba wrote:
> Changes since v1 [1]:
>   - Patch 3 programs the new case's CVAL as an absolute value near the
>     wrap instead of a negative TVAL, so a host stall between the
>     counter and timer writes can't make it fire. (Sashiko)
> 
> A guest timer can fail to fire, or fire early, once the guest's counter
> is far enough from the host's. Where the hardware won't apply the
> offset itself (the physical timer without CNTPOFF_EL2, a CNTPOFF_EL2
> host while TGE is set, the virtual timer on x1e), KVM adds it to CVAL
> and lets the hardware compare the sum against the raw counter. The
> timer condition is an unsigned compare, and adding the offset to both
> sides of it preserves it only while both sums wrap or neither does: a
> guest whose counter is ahead of the host's by more than CVAL has an
> expired timer that never fires, and one behind it can have a far-future
> timer fire at once.
> 
> [...]

Applied to next, thanks!

[1/3] KVM: arm64: timers: Compute an offset-applied CVAL from the current count
      commit: 49930b1b557ceb698e0ab7f985ea41c99dc8bf22
[2/3] KVM: arm64: nv: Read a guest hypervisor's CNTV_CVAL_EL0 from memory on x1e
      commit: 1dbb5a2b5a21a62a223a2a2a0d775d417dca4242
[3/3] KVM: arm64: selftests: Test a timer set past the counter's wrap
      commit: 46e0f2c9d7d6f99a8f16290d4d4e2f3129edfa54

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



