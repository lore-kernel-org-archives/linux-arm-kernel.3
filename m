Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6F4D29FE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ui5ucFbccyXj13ISXUj4kSPvspJNkpSYnw3ZZwIl7bo=; b=fIcfUHRRTih2FVMQt+kPTdxzkQ
	s8yx8z6mgaIuw2uM3oYn2PN7w7fskFGuUX4FCYIlCeAB4Ntsd4cB7DzX2LhTWIg0pQcw1MGnJjwoN
	RMBRg0ggvIH4FhT+Uzn5Wv+ii4BPAv1HSi7LOzKOQemdAzb+wArTKMpU2aQ44mGyXI87tlkSBqs5s
	QgsR+fX+OaBuiL/jhLs6U3pPs4uAT/l7tso2D9FpGresB9EKcln0vHWVvS1jkpfh7UiqXEHMRmiDC
	7L2UnhG6IsEij1ZcLQXLVs2gh/QVKlbuKjq7zSn9m7QCr0NTrXQk1BCgSA7ZrOQ0TRev2vuuNDYFH
	3e4uLiKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyTi-00000008s2X-3MVC;
	Wed, 14 Jan 2026 10:51:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyTb-00000008s0s-49Eg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:51:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1303560052;
	Wed, 14 Jan 2026 10:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78BFC4CEF7;
	Wed, 14 Jan 2026 10:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768387906;
	bh=wSQt6iTfo1UGib9b417yObSp4mmt++JkZhlLk3sAcGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KT1EsKq4HelA+9mqCbB0nP9Xaa0Hf7XYTqCB10k4v6RkHiy3yUOM0K7z2rMr87leR
	 a/7DzFDzFPi2QFab8nswo2tStijl9NcBUHqgi9Y6IVUrfvf3uSpGtNPfOAhg3PL0hG
	 1zahwuWUU+NxnEVqZeNWI19p7QvOyQMUnD6jWOdZY+T3CjqCj5E1qBS5FSaMvs4mKo
	 sFRxMw+918rCwWENRrgHu2hDLkj6eBUkjg1pKhV//UlMrcG7r3Tk/IBBNn3hVEOux9
	 j3t0DB9cx3/xhn/TonPHDRLI4OG2FaplvzL1wASd+BXlc762diEFlIEb+FNhkhpojj
	 ghR5Y3S01uxZQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vfyTY-00000002975-0nDK;
	Wed, 14 Jan 2026 10:51:44 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	Petteri Kangaslampi <pekangas@google.com>
Cc: Vincent Donnefort <vdonnefort@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH v2 0/1] KVM: arm64: Calculate hyp VA size only once
Date: Wed, 14 Jan 2026 10:51:37 +0000
Message-ID: <176838788525.3448059.9914160373754507949.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260113194409.2970324-1-pekangas@google.com>
References: <20260113194409.2970324-1-pekangas@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, pekangas@google.com, vdonnefort@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, oupton@kernel.org
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

On Tue, 13 Jan 2026 19:44:08 +0000, Petteri Kangaslampi wrote:
> All,
> 
> Here's a reworked fix to keep VA size calculations consistent between
> the MMU and layout initialization code paths.
> 
> Previously, if the kernel was configured with a VA size of less than
> 48 bits (like happens in our environment), the assumptions used to
> calculate hyp_physvirt_offset in kvm_compute_layout() and the code
> that determines the VA size used in the rest of the system (calculated
> in kvm_mmu_init()) would get out of sync. This could eventually result
> in mapping failures.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Calculate hyp VA size only once
      commit: 8e8eb10c107e67f22f87cd8c963d30ea73f04d5f

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



