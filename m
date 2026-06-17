Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE150CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 17:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9c4JXxUSHmrMHbwQQezcBaAvkJYq69p41kAusufWTpI=; b=s/Ub7RN+54Ea+NZYZ06nOAEP+/
	VkKPJKvlS/RZaBK8axdFAQoAdupHu7XN0Q/fT9kDFNxMevv+htJLnLyRK6+J1wbsKj/GXv263Oq0O
	b7MU6Zr3eyRrtafWa2vEhIphmsr6ynGCbozHoo5EOsSZsz14dMDc+fn5O0Ye6IWPAaHPwaH6bEvGe
	gjH42VEeEdN0G47uY0V/nOf/cnvHmL0Wgd7sfZXCVKVFA60SWRs0JelpbEKSSQh2ZL9haa2Hs58HX
	p3wkP4CkKitWgAzh+kE45jni2jTSil4UQQl4l47vmaHZF7IA1Rg0a71EvmVcmuWZU1kWE3jQwoyaB
	S7mVoumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZuBi-000000007R2-2UYJ;
	Wed, 17 Jun 2026 17:36:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZuBh-000000007Qm-14an
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 17:36:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8786940531;
	Wed, 17 Jun 2026 17:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C261F000E9;
	Wed, 17 Jun 2026 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781717788;
	bh=9c4JXxUSHmrMHbwQQezcBaAvkJYq69p41kAusufWTpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aDuOCp5FcyoOulq2FR+bh4HO1geXcFkVep1yQVImvGf0P1gdPhCqy/oQbqfw2kLff
	 3J19L8KfcIY+CJvWFiL0q1mXXr9yrh4pE2DwVJOSHhQ2wKkKMjktcPePgky3NANOwT
	 VJ3/0d07Zz5mZ7erZr6qlVhTTamFdHNZyt7Dzxvg+vzflCIXH1C9a/4VqbEoanP0Zk
	 qjSfrzgzpyqECZTML/rI6mxY/+CiRqMdHze95d/w4T4gIDpWvS7nDQFvrf/qWRnfC9
	 gUqlfrBAv93hFQqZeX0IvVKWHVTHcqMlvHjESL4UZA6ojMUCTddA9N/UF/lYmF/Aej
	 LhSzujhqJfkEA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wZuBe-0000000DlkU-2Mrq;
	Wed, 17 Jun 2026 17:36:26 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <tabba@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jintack Lim <jintack.lim@linaro.org>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: nv: Fix PSTATE construction on illegal exception return
Date: Wed, 17 Jun 2026 18:36:23 +0100
Message-ID: <178171777578.3090427.13421187058645390320.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260617144907.2972095-1-tabba@google.com>
References: <20260617144907.2972095-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tabba@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, jintack.lim@linaro.org, gankulkarni@os.amperecomputing.com, christoffer.dall@arm.com, linux-kernel@vger.kernel.org
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

On Wed, 17 Jun 2026 15:49:07 +0100, Fuad Tabba wrote:
> kvm_check_illegal_exception_return() sourced the flags {N,Z,C,V} and
> masks {D,A,I,F} of the resulting PSTATE from the current PSTATE, but
> R_VWJHB takes them from the SPSR being returned to and leaves
> PSTATE.{EL,SP,nRW} (and EXLOCK when FEAT_GCS) unchanged. PAN, ALLINT
> and PM were not applied at all.
> 
> Build the PSTATE by taking those fields from the SPSR while preserving
> EL, SP, nRW and EXLOCK from the current PSTATE, then set IL.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: nv: Fix PSTATE construction on illegal exception return
      commit: 0e8e955b9bcf84a70f20079390e19971fec1586d

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



