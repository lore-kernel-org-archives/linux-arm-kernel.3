Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8008E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 10:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQKaCrLafnAeCsjenj8BSF9jYYSFkigm9jehL8ddLSo=; b=J7uzQRaKGLHHvy+yvuRkY01jhO
	cAhk/Ljpp+8JK6ZXMKzcEXgmEbfPcheg7NYOTN8F6CdpqkFdLRZY9/oeF0FEDcZNa7klFTpGwGJEi
	s5eaa6fBEp3+jFOhd2m4FRf/YgOTRFb/8MOtr6rh4ckxFLYrqNoFPTU2jhQxcLtL6vNcZI292fVWS
	gCVVcb5fbnFGtEwAVwZZSr5d6OyeRdxbubMUzVeYyIlqclk53zg3hays22VrfMdKdRKULaBAcFAy5
	XvSmTbDphbpEeHhMv1/DtYMep9TzKKRpyD234bJT7HS/KdwQGvbEKJZD2lnAbZNihcybW/KtY/esh
	k+2SdZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWvRN-00000002Wyz-3LQ1;
	Sun, 12 Jan 2025 10:43:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWvQ7-00000002WlX-2slD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 10:42:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F1A255C2DAE;
	Sun, 12 Jan 2025 10:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B29C4CEDF;
	Sun, 12 Jan 2025 10:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736678534;
	bh=R7njldLDOz8MV+CZLpoFpvBPG4OpdGcvpLOzHB78ebk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o79/IqzlgeWXj8aFVfeBJ0yTS6UJ4ZM5TaD2tf626OSCln+In8HPJnvW4+R2vDG68
	 7WfGLN8ZlnI1A/lNz66TRBgM81AFGCebhSViaRjfYTSG1k2S4xp3mWw4shP99vedJt
	 fAgWSAcSMfmv/2/fzCsF5SZqxttWAfsn27TuhCuoF83fEX6E4NbCyrCOsVzLZtkfbB
	 E0+pgCJSHiCKW6674OH0L15SVy12WoWkdWqwtl66PWXNBCWjhwoDC0Ua0Zn1Xd4+9v
	 HChnmpU5Ibxi1xVTeHBCL4pZD8Msl2wYs/kNFeqQiyXpyP3jYHfeihja2Px/n8rDYu
	 MfazNqKy6LvvA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tWvQ4-00BKDr-3a;
	Sun, 12 Jan 2025 10:42:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Cc: Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] KVM: arm64: Simplify pKVM memory transitions
Date: Sun, 12 Jan 2025 10:42:07 +0000
Message-Id: <173667852147.882737.8982373220700597868.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250110121936.1559655-1-qperret@google.com>
References: <20250110121936.1559655-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, qperret@google.com, tabba@google.com, vdonnefort@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_024215_812246_9424D1CC 
X-CRM114-Status: GOOD (  15.50  )
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

On Fri, 10 Jan 2025 12:19:33 +0000, Quentin Perret wrote:
> Since its early days, pKVM has formalized memory 'transitions' (shares
> and donations) using 'struct pkvm_mem_transition' and bunch of helpers
> to manipulate it. The intention was for all transitions to use this
> machinery to ensure we're checking things consistently. However, as
> development progressed, it became clear that the rigidity of this model
> made it really difficult to use in some use-cases which ended-up
> side-stepping it entirely. That is the case for the
> hyp_{un}pin_shared_mem() and host_{un}share_guest() paths upstream which
> use lower level helpers directly, as well as for several other pKVM
> features that should land upstream in the future (ex: when a guest
> relinquishes a page during ballooning, when annotating a page that is
> being DMA'd to, ...). On top of this, the pkvm_mem_transition machinery
> requires a lot of boilerplate which makes the code hard to read, but
> also adds layers of indirection that no compilers seems to see through,
> hence leading to suboptimal generated code.
> 
> [...]

Applied to next, thanks!

[1/3] KVM: arm64: Drop pkvm_mem_transition for FF-A
      commit: ed2f80fd76bd2c6e00d2e90f78d21a3055ee3562
[2/3] KVM: arm64: Drop pkvm_mem_transition for host/hyp sharing
      commit: d3b3473c15e4391673d8dca9c36dd5e9c3a8a4ac
[3/3] KVM: arm64: Drop pkvm_mem_transition for host/hyp donations
      commit: 2d2aa2eb275fa6f80d68ed442c3328273bbbecba

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



