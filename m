Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0029BD0EE3D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 21:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kv8JM8rAoJ+9apw6rggg242ThBSmhqiM+bfhxVII4Jg=; b=t8MjNGKshDtLchRrzfygegGsCL
	adccIOln20G0zcUaWrbbKb6JMhKwiMnRo1ox6Eqcp6ernnFTsKTwwhbh2q3l0R5SN1+7Nk0CYQLxJ
	r0iHgRvaLWzoiNBX1BgqYTJ9ACCTZGvmfHSYJuSfcLJ+5ryeo4RzscGhvQGeQV4cHzATRocBwAVBU
	sq3RuaUq865Scf+S1hvSEnwlFSWGHq7bKCc6cv+D4WfhiomuAtmSX5z/BAdieeOqSPOl4OQToFwH0
	Ycp6hG/4bZKPt0u6mtz8olFFONZeocuotM14ZsvTVJyCoftXPwpgjEqs9CTXE6Kn4JPECrQdkS0gQ
	VIkMXIZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO0Xy-0000000Dxai-3882;
	Tue, 25 Nov 2025 21:26:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO0Xx-0000000DxZz-0YhK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 21:26:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3853F60146;
	Tue, 25 Nov 2025 21:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF28C116D0;
	Tue, 25 Nov 2025 21:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764105959;
	bh=bef6yMABPv/hypevyI4Lq+80S7ARj2nTb5O5egnjE/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=orbMk4MHqTKNugXgoAHwkxwN3XU1m9vyqO25ZroD7/chhRdCoAixusAKJHXt1CQI4
	 iDRCKXxf8XHRXEmk2/T8LmPWC0VXrzD0nRZCo5Fkz3anm87X7TEpZywCTxkD4GU1X6
	 3FO200hJe+YWv4MgASwhXtZlg/w23j7mXDTlu67yqJRhZR11i+pgfJeaglMF7Zt4zW
	 QahubkEAGVCT5NzmMjCPyVAItov8Hdnrxix6STvkVO8iQMG7z0Zrx9JofTGOQHacIy
	 SmLGL5ZulvEVEyKMryM6T15hJjt03jsNJXcOQAtrNCc/pxaDTQVDTBpOQiVBZkvzAd
	 PkDClAS1OCsNQ==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH] KVM: arm64: Add break to default case in kvm_pgtable_stage2_pte_prot()
Date: Tue, 25 Nov 2025 13:25:56 -0800
Message-ID: <176410594557.1756747.6202745594251816164.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125-arm64-kvm-hyp-pgtable-fix-c23-ext-warn-v1-1-98b506ddefbf@kernel.org>
References: <20251125-arm64-kvm-hyp-pgtable-fix-c23-ext-warn-v1-1-98b506ddefbf@kernel.org>
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

On Tue, 25 Nov 2025 10:59:15 -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y / W=e):
> 
>   arch/arm64/kvm/hyp/pgtable.c:757:2: error: label at end of compound statement is a C23 extension [-Werror,-Wc23-extensions]
>     757 |         }
>         |         ^
> 
> With older versions of clang (15 and older) and GCC (at least the minimum
> supported, 8.1), this is an unconditional hard error:
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Add break to default case in kvm_pgtable_stage2_pte_prot()
      https://git.kernel.org/kvmarm/kvmarm/c/621e0a641f64

--
Best,
Oliver

