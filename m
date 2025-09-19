Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259D5CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 13:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmN9JxObA4xvYdzKmgQyZRITEA6xcEiwos+25gfx/CI=; b=uUGUOX0q7kGXi3JWtJieVG+DXJ
	IQkBDliE3+YBwaZrSOgpJ/2unrtvRa4EEdnwpwd8R15TE2QNYnXcDvCFqr3Br1hiypiKtzVPWIE/O
	Aleg9eyJCe3U0poMzLdSHwvnZXAzdiyQp8bHziagknFHz8noE8aeUKOY1dIs2j4l8ixuyjLvRIZ2u
	SLN8aurP1BqekuqTMIGweOCxkTLRaqTcFpb+yFIsamNN2CzWiMUrm7314iINhr93aIe6idPZ3KWVd
	DWWmuk+uDoNiuVO8NyVOO6GUWnz6Tk5QAG3cYGLwVQ3bZszIuKL/pUhBsVLo+gjy6Y66sgVEK46sB
	PYJMorhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzaxG-00000002xIA-25s8;
	Fri, 19 Sep 2025 13:15:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzaxD-00000002xHM-1PfM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 13:15:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9EE840692;
	Fri, 19 Sep 2025 13:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9595AC4CEF5;
	Fri, 19 Sep 2025 13:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758287710;
	bh=Cmxn3fZATVDtlwX0ps6wKhNYpLOvAlnoFm75vvlWuI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MQ9M/SjTFizAJohHgPCjKHLfelcw3VeSF7tfXhYf90LTCSdR6/LunaP4aTyr7jnXD
	 16GJ+o3uJ9sYCdwz1df70kylmLwl247SJzcStBA2mX/jNwBIA1GK5cjhHO+MGcQ9ul
	 /0ULYfUvOxjgG8bWaACqeAc4ngfgCk/wsIpyYVzla7MhV6rPhjsWA4PaJcOd1zRev5
	 ezjnBdgpys8weFY6R/88R57029I9GRpan/f/lNlRpGdplRFDxhnACBYBxmeZJRhBeA
	 TXoV/C7M41g5eG+bmO7PkqHB55jzl1pSnND9by0yL0ruK4zInI+NeQGFX5XZxmbhL9
	 IasXQoAv0QyOg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzaxA-00000007mgb-1XEv;
	Fri, 19 Sep 2025 13:15:08 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: Re: [PATCH v2 00/10] KVM: arm64: Handle effective RES0 behaviour of undefined registers
Date: Fri, 19 Sep 2025 14:15:05 +0100
Message-ID: <175828769331.1762384.11349194735754864168.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918151402.1665315-1-maz@kernel.org>
References: <20250918151402.1665315-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, yangjinqian1@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_061511_424639_F1221314 
X-CRM114-Status: GOOD (  13.89  )
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

On Thu, 18 Sep 2025 16:13:52 +0100, Marc Zyngier wrote:
> [After yesterday's blunder, I'm reposting this, with proper commit
>  messages, and having taken Oliver's feedback into account.]
> 
> When a feature is removed from a guest, we ensure that the trap and
> control bits for that particular feature are made RES0.
> 
> For example, SCTLR2_EL2 contains a large number of bits. For any
> feature FEAT_FOO that is controlled by a bit FOO in SCTLR2_EL2, we
> make sure that SCTLR2_EL2.FOO is RES0 if FEAT_FOO is not visible to
> the guest.
> 
> [...]

Applied to next, thanks!

[01/10] KVM: arm64: Remove duplicate FEAT_{SYSREG128,MTE2} descriptions
        commit: c3b3bbd160d2014a638d40bda17909a0afd85d09
[02/10] KVM: arm64: Add reg_feat_map_desc to describe full register dependency
        commit: 559442afea8812814135ec6fa33bc62c9d09f5c4
[03/10] KVM: arm64: Enforce absence of FEAT_FGT on FGT registers
        commit: 7d3a4d048925d52e5511d82e479cbdcf7354aa7c
[04/10] KVM: arm64: Enforce absence of FEAT_FGT2 on FGT2 registers
        commit: 338a41e83c3dab81573ac33bc30f0f36bd29cd78
[05/10] KVM: arm64: Enforce absence of FEAT_HCX on HCRX_EL2
        commit: c99d62771f63116ffe54636980414fc74ab3471c
[06/10] KVM: arm64: Convert HCR_EL2 RES0 handling to compute_reg_res0_bits()
        commit: efe5406c55fb3203028507555c7da2bb417a397c
[07/10] KVM: arm64: Enforce absence of FEAT_SCTLR2 on SCTLR2_EL{1,2}
        commit: f89763efe86cc05f8465c7eea85a76183f218c56
[08/10] KVM: arm64: Enforce absence of FEAT_TCR2 on TCR2_EL2
        commit: 4870a8c1d18897681b6f6a50288d0b6dd5e21e24
[09/10] KVM: arm64: Convert SCTLR_EL1 RES0 handling to compute_reg_res0_bits()
        commit: d2a1d78ce5962b01500d09b15e2a854768552d44
[10/10] KVM: arm64: Convert MDCR_EL2 RES0 handling to compute_reg_res0_bits()
        commit: ac53365990a19e808fde2758074ee31be65d1015

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



