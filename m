Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEBCC55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZot6GFuhy9a+s0IugMlJ70eCJTGgM/zB3nf4mCWRaw=; b=WUdWk1IJI7BNE/573Ve3TQXC0C
	IDkCSq1fOa04Dcte/y8Wy4RWzESWHoFVDP8wO5wWgyHrUVEDBRm0/xEejG07Zz4KwCDU5smC7+Kwd
	P7QnBvW+rzPvZwBmK8geA7lK5mKNejFbsmA+tL469Sx8/4iYyxXd+iXlICsjDrDc16Urog2iuRAF7
	4MFyA/v8JkYYDXYCYHPT1VOmU+LCy2tAVcimMhfanbq7EcNPU6z68Jwja+eqHMgmjb++negTqG8U0
	t2FycwAaDb0FIWVeJig75vdMf7eP4cp7rb1ENj0Pq4y4y8Gzf1dvdGTRQo7OB2zwxCRkDFD4QSVty
	ZcKoQeVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpsKp-0000000DPmx-0iHA;
	Fri, 31 Jul 2026 18:51:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpsKn-0000000DPmD-3rwX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:51:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 390E740DB9;
	Fri, 31 Jul 2026 18:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B221F00AC4;
	Fri, 31 Jul 2026 18:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785523913;
	bh=WZot6GFuhy9a+s0IugMlJ70eCJTGgM/zB3nf4mCWRaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cWj+jl6+CIO586r12U21up84e9GPZCTcTt1faCSxLcxizMMQQYcGKJGz/RvwNUsY/
	 aNz08ZnrEy2GS4PI9u7HWHsjdy2cEuPiuw4/2ICAhpkLXV+jfknNspSWeB8GuyJdiZ
	 v4l033aztqBDf7SJKezD1t/ki1Ul0fh+H749i48g6EUXUccI/Kk1nM9juxWpPQahEK
	 hS5gBep5O6YqbxDTAEq0IbrHvL+dXmHxuPf6At3kVig8G23cbWX8/SnAMmXWMwo/vw
	 xdCfQCzCunPoMu9xqGAK4A18oKbFIOUJQhxkIJYMXhgFS/Ms+YHadkGCkOuth+dJTa
	 j/oVHggj+p9Hg==
From: Oliver Upton <oupton@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Congkai Tan <congkai@amazon.com>
Cc: Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Haris Okanovic <harisokn@amazon.com>,
	Geoff Blake <blakgeof@amazon.com>,
	Stanislav Spassov <stanspas@amazon.de>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] KVM: arm64: Expose PMMIR_EL1.SLOTS to guests
Date: Fri, 31 Jul 2026 11:51:44 -0700
Message-ID: <178552142318.30097.12495596662819704320.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722202702.4165917-1-congkai@amazon.com>
References: <20260722202702.4165917-1-congkai@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 22 Jul 2026 20:26:58 +0000, Congkai Tan wrote:
> Today when the perf tool runs in a guest on cores with PMUv3p4, it fails
> to parse the default metrics with "Failure to read '#slots'", since perf
> can only read 0 from sysfs caps/slots, which is backed by PMMIR_EL1.SLOTS
> that KVM traps as RAZ/WI.
> 
> Taking into account backward compatibility and heterogeneous systems, the
> exposure of PMMIR_EL1.SLOTS is gated behind a new vCPU feature flag:
> 
> [...]

Applied to next, thanks!

[1/4] KVM: arm64: Expose PMMIR_EL1.SLOTS under strict PMUv3 UAPI
      https://git.kernel.org/kvmarm/kvmarm/c/453f6ff04b8d
[2/4] KVM: arm64: Advertise STALL_SLOT* in PMCEID1 under strict PMUv3 UAPI
      https://git.kernel.org/kvmarm/kvmarm/c/203b22f76dc3
[3/4] KVM: arm64: Ignore writes to PMCR_EL0.N when using strict UAPI
      https://git.kernel.org/kvmarm/kvmarm/c/bbef6317f97b
[4/4] KVM: arm64: Add KVM_ARM_VCPU_PMU_V3_STRICT vCPU feature
      https://git.kernel.org/kvmarm/kvmarm/c/ad220e275c39

--
Best,
Oliver

