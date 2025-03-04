Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65862C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9qEsSg9jcpve+CwsRU4DZ4eVncjU6IKX3sFzRmX1D8=; b=1PMQhKt787KHjuCXW3EaKB/x9u
	jeinfrCpa/fnx0gbRUqK4VUvYOX5TomkdkK2qOjr0scx7Deo9K0ujCmj5IDENAnSWWndfekQ2KshK
	5oIcyE5OjC/X9CzuyQnoRPqswF4xZE5eGzZzjl6MAYNcEoZgf903h9fY6Na5Q9uFzNcZ6jV1KZn/e
	R/IWjVLJkdRAJq92syZscDZ84H1HMyL9r6RSprPiOVSCj4WyuJa68jRfWcNmHx62uW7mjqcljcHOa
	oizj+4/emgaVuEdRbZo19v6oU+Vn18MQLJjl36A1G6OoZ2rtKrlvBozddz9Jn0I7R6jKQ6yUMZQkj
	cZFscDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpM2p-00000003Kop-2jMF;
	Tue, 04 Mar 2025 06:46:23 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLlV-00000003H40-3vkL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:28:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741069705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a9qEsSg9jcpve+CwsRU4DZ4eVncjU6IKX3sFzRmX1D8=;
	b=lLtagYgBvJohD4x3FkvhSVUQdRYtTsqp1wUjTnue2MAGOkQovxA/7ffJiU5mxuayj5UJW2
	7l+E0nMjHo7JqncH6gFCYi5JwENK45yxkmkiAtOqlNjIgX61LtaiKyaMB7xlySVOK+1rCz
	wdYzsozbTbPjHAUPM+V4PDQ92+Np+CU=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 00/16] KVM: arm64: Add NV GICv3 support
Date: Mon,  3 Mar 2025 22:27:07 -0800
Message-Id: <174106961929.349492.6260089060201840223.b4-ty@linux.dev>
In-Reply-To: <20250225172930.1850838-1-maz@kernel.org>
References: <20250225172930.1850838-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_222830_190168_3F8BC464 
X-CRM114-Status: UNSURE (   8.66  )
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

On Tue, 25 Feb 2025 17:29:14 +0000, Marc Zyngier wrote:
> Here's a respin of the NV support for GICv3. The integration branch
> containing this (and the rest of the NV stack) is still at [4].
> 
> At this stage, I think this is good to go.
> 
> * From v3 [3]:
> 
> [...]

Fixed up a few typos here but overall this is in great shape, thank you.

Applied to next, thanks!

[01/16] arm64: sysreg: Add layout for ICH_HCR_EL2
        https://git.kernel.org/kvmarm/kvmarm/c/22513c0d2ad8
[02/16] arm64: sysreg: Add layout for ICH_VTR_EL2
        https://git.kernel.org/kvmarm/kvmarm/c/5815fb82dc67
[03/16] arm64: sysreg: Add layout for ICH_MISR_EL2
        https://git.kernel.org/kvmarm/kvmarm/c/b7a252e881f3
[04/16] KVM: arm64: nv: Load timer before the GIC
        https://git.kernel.org/kvmarm/kvmarm/c/16abeb60be62
[05/16] KVM: arm64: nv: Add ICH_*_EL2 registers to vpcu_sysreg
        https://git.kernel.org/kvmarm/kvmarm/c/182f1596941e
[06/16] KVM: arm64: nv: Plumb handling of GICv3 EL2 accesses
        https://git.kernel.org/kvmarm/kvmarm/c/96c2f03311de
[07/16] KVM: arm64: nv: Sanitise ICH_HCR_EL2 accesses
        https://git.kernel.org/kvmarm/kvmarm/c/21d29cd814d7
[08/16] KVM: arm64: nv: Nested GICv3 emulation
        https://git.kernel.org/kvmarm/kvmarm/c/146a050f2d8c
[09/16] KVM: arm64: nv: Handle L2->L1 transition on interrupt injection
        https://git.kernel.org/kvmarm/kvmarm/c/4b1b97f0d7cf
[10/16] KVM: arm64: nv: Add Maintenance Interrupt emulation
        https://git.kernel.org/kvmarm/kvmarm/c/201c8d40dde9
[11/16] KVM: arm64: nv: Respect virtual HCR_EL2.TWx setting
        https://git.kernel.org/kvmarm/kvmarm/c/69c9176c3862
[12/16] KVM: arm64: nv: Request vPE doorbell upon nested ERET to L2
        https://git.kernel.org/kvmarm/kvmarm/c/93078ae63f20
[13/16] KVM: arm64: nv: Propagate used_lrs between L1 and L0 contexts
        https://git.kernel.org/kvmarm/kvmarm/c/7682c023212e
[14/16] KVM: arm64: nv: Fold GICv3 host trapping requirements into guest setup
        https://git.kernel.org/kvmarm/kvmarm/c/89896cc15911
[15/16] KVM: arm64: nv: Allow userland to set VGIC maintenance IRQ
        https://git.kernel.org/kvmarm/kvmarm/c/faf7714a47a2
[16/16] KVM: arm64: nv: Fail KVM init if asking for NV without GICv3
        https://git.kernel.org/kvmarm/kvmarm/c/83c6cb20147b

--
Best,
Oliver

