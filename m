Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5B3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 19:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cq+uaLGWgexks9tP1wkTCPycv3w44z7GlNgs15ivN60=; b=CMg9peR0tA5N82lE6r6+vk+eG5
	qdgfofyoVu0PqZct6Y+cu/NPl08xprtsFvsfHU6UMn5YTYgbkV79VqqQcosNpm4n+JnlhE0JEEM07
	aAqYg32n6uWMhY7DkuljVXN9qb38JcechxyrtqDhWftQ+6RcJl18u/mSsB6zSYScbltisNibkF7L4
	59rbWuStYafvGK3nktNKHfMi1Cb/RVjTpUiuBlg02wG3vZ5ttPj6y+8NSIoQkvwE4rFQArTBKtulq
	iBLyj8fD7Hy+k5qOgoC2y5HBlQjRlr7vqrezjZdCC7KstBPlC2HHNbjYL7JLUrEzoZnxQjNFW0QA/
	FECVkL6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQq6-0000000BH22-2rJF;
	Thu, 02 Jan 2025 19:26:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQou-0000000BGul-12Ii
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 19:25:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47AFC5C61C0;
	Thu,  2 Jan 2025 19:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444CDC4CED0;
	Thu,  2 Jan 2025 19:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735845923;
	bh=KUMIyjQ4nZZlXB09ywwBTfalUhusJhQ+ekMU5Ns2Kms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nOco+yHXIBJL9y5HUEX/ZV5LCUhWE92rAY/QEoemcZFS9byEy1MQnvYZ1OQm7zdmk
	 9XypXaN0gbl5+Ek+tNOjv56jY5a7mrkGiXJsMfZWryTFEx9W8V2FrJfOlZXCgEU+RX
	 XvGbTxMaHtwEteHzi/55fLNQ0zbC0aGm4Ys2fKkrURMgEYBszwKPmtjjQacaT+wk3t
	 smKvkl2qhk18iS1KDnaxQi0q2B4srGhNVogsNl4eQc0cc5kB+wK4+V4Kmx3Y2jwlBf
	 bizg9b71KVa4Qnr5udHOcA+UeWOInx75yn+2GyKL+RuPmbbMhWILse5dp8amxzBfIa
	 0WbfNBJ+5VmvA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tTQor-008Vst-2S;
	Thu, 02 Jan 2025 19:25:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Chase Conklin <chase.conklin@arm.com>,
	Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v2 00/12] KVM: arm64: Add NV timer support
Date: Thu,  2 Jan 2025 19:25:17 +0000
Message-Id: <173584591101.1567893.2047112696934752500.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217142321.763801-1-maz@kernel.org>
References: <20241217142321.763801-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com, gankulkarni@os.amperecomputing.com, chase.conklin@arm.com, eauger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_112524_374088_2676A4A0 
X-CRM114-Status: GOOD (  11.48  )
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

On Tue, 17 Dec 2024 14:23:08 +0000, Marc Zyngier wrote:
> Here's another version of the series initially posted at [1], which
> implements support for timers in NV context.
> 
> From v1:
> 
> - Repainted EL0->EL1 when rambling about the timers
> 
> [...]

Applied to next, thanks!

[01/12] KVM: arm64: nv: Add handling of EL2-specific timer registers
        commit: b59dbb91f7636a89b54ab8fff756afe320ba6549
[02/12] KVM: arm64: nv: Sync nested timer state with FEAT_NV2
        commit: 4bad3068cfa9fc38dd767441871e0edab821105b
[03/12] KVM: arm64: nv: Publish emulated timer interrupt state in the in-memory state
        commit: cc45963cbf6334d2b9078f06efef9864639cddd0
[04/12] KVM: arm64: nv: Use FEAT_ECV to trap access to EL0 timers
        commit: 2cd2a77f9c32f1eaf599fb72cbcd0394938a8b58
[05/12] KVM: arm64: nv: Accelerate EL0 timer read accesses when FEAT_ECV in use
        commit: 338f8ea51944d02ea29eadb3d5fa9196e74a100d
[06/12] KVM: arm64: nv: Accelerate EL0 counter accesses from hypervisor context
        commit: 9b3b2f00291e1abd54bff345761a7fadd8df4daa
[07/12] KVM: arm64: Handle counter access early in non-HYP context
        commit: b86fc215dc26d8e1bb274f0a7990b5deab740ac8
[08/12] KVM: arm64: nv: Add trap routing for CNTHCTL_EL2.EL1{NVPCT,NVVCT,TVT,TVCT}
        commit: c271269e3570766724820bcb76a144125dead272
[09/12] KVM: arm64: nv: Propagate CNTHCTL_EL2.EL1NV{P,V}CT bits
        commit: 479428cc3dc99bbe28954b62b053b22accbfd1fd
[10/12] KVM: arm64: nv: Sanitise CNTHCTL_EL2
        commit: d1e37a50e1d781201768c89314532f6ab87e5a42
[11/12] KVM: arm64: Work around x1e's CNTVOFF_EL2 bogosity
        commit: 0bc9a9e85fcf4ffb69846b961273fde4eb0d03ab
[12/12] KVM: arm64: nv: Document EL2 timer API
        commit: affd1c83e090133a3d1750916c7911b20f8911c0

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



