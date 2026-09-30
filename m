Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B75CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GEwGzPFR3eS1g4eqL+386ChUqhdJX3OYn9ry9qloeg=; b=GOyO89bBr4ZjPliFL7/387W7pr
	L9+8VxFe7bYOFSsHWT2nHWjQWQUfD9D8qsG1JremBxTn6Z/aezTB8+KGTsLxpZ/qhfUtv1pMmyDpd
	wneyqI/Tl3qGa+7SZz7NNbzIR1yMSAXJA0rVm7nzUIsn2tKqX4yLDPGKmuhKUCfwNvGRzRwdgL1XS
	Rc2sEUpoOOrsKxhSCNL+PvQq3QbNyaotC9q5aOFlLuKUBmsUd0/BOcPs1Nu4PNzGRT+8ZW7/YnpcL
	MnbKpzbEmOPgiFWSGdT7aH9+a+77fCNt1EGaOHAXjRe/MMV8h/h8fT8b0taUQ+soWtb9t5cQD45Hi
	9QdIdZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpjl-00000005R67-1wlp;
	Wed, 30 Sep 2026 08:32:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpji-00000005R58-2JXh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:32:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE80C40111;
	Wed, 30 Sep 2026 08:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7AD1F000FF;
	Wed, 30 Sep 2026 08:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790757141;
	bh=7GEwGzPFR3eS1g4eqL+386ChUqhdJX3OYn9ry9qloeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a9UMJIgSn7nz3T1pogOL3Cfpo86EZ2RED9JQHQgU8+VgWCWsOJmrPygYc40OJN9s4
	 /W3EfWS4qiDE82jGEjSox+WrPqhuKdmK4v4Mg+pxwpadNEzPoOCycgO0EWuG4ukdjI
	 VG6XznwyIbIQttpV+EO7sT4Tj7cmjIF0PCQ828yWjUMfTny+0LWqzVs90YoL/iZrA+
	 Do5Yhxt/StPDSHiJYMuloikvQb3xypTIZIi5JYg7lmsfOZhCfp/gFw8VoUS7Kxt3O4
	 ci3bakGuc4/WaEwoxJ8GmQttrizsFCye7oEYoh/HFhL9N5BD34T+pJsFLm0TtjCx+w
	 Ug7b1OIdsFqIA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xBpjf-0000000FDC2-38Va;
	Wed, 30 Sep 2026 08:32:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Mark Brown <broonie@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v4 0/3] KVM: arm64: ID register finalisation fixes
Date: Wed, 30 Sep 2026 09:32:15 +0100
Message-ID: <179075713104.3615171.13350186839186516597.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929-kvm-arm64-idreg-final-v4-0-75296dde994d@kernel.org>
References: <20260929-kvm-arm64-idreg-final-v4-0-75296dde994d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, fuad.tabba@linux.dev, broonie@kernel.org, peter.maydell@linaro.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, ljs@kernel.org
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

On Tue, 29 Sep 2026 12:57:57 +0100, Mark Brown wrote:
> While looking at some feature enablement I noticed that there are some
> scenarios where we can end up with an inconsistently configured vCPU due
> to finalizing configuration based on ID registers before we have blocked
> writes to the ID registers. This series aims to clean up these issues.

Applied to next, thanks!

[1/3] KVM: arm64: Finalize guest-wide sysregs prior to per-vCPU sysregs
      commit: 19868b67e3e73c34493efdd5b0791ccfdc7bf192
[2/3] KVM: arm64: Block ID register changes after we rely on the values
      commit: 2ce80f62403200f0a59f898dd9cd2ccf756a5a1a
[3/3] KVM: arm64: selftests: Check ID regs are immutable after a failed run
      commit: 00e309933879cbf181a95a0bd02384715a381cff

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



