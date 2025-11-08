Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D69CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 11:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0i+5CC6oipqYl13UhGQr+9ghM37486zLwPqukqc/b0=; b=oQxbGiKH6c7P6NzxqMtyF6OOT7
	qvQvly5sUcTHbFDV//jSqHO8SLsSTWzEtidOyLGDwd4v8ZEPWjztNSYonYJRAiKaYg5mkiyLyICt+
	iTQP14QTPg3gcfpYBViWicwQtMk9RC+ABf6qpr3NkBIzaUYLNWie8Sks3fFsAvtSkcKwzwQBU/HIF
	RmVbLEWgolyTvHk9DkQETJlVNkPQQKgzxDcZfX8ZZyPA6bV2HDyrcLNahSS8AG0Qpwp9lZJgmusX9
	Qdu4UBhW+wigUA0V5fjg8QAJFbx1cLYFu2vEQR3xOsjzJmuXU4BTin1l13F32EQEvUx4whaqDJW4i
	xKNdyuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHhav-000000035wn-3PNG;
	Sat, 08 Nov 2025 11:59:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHhat-000000035wS-2Hjk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 11:59:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA79F43469;
	Sat,  8 Nov 2025 11:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821EEC116C6;
	Sat,  8 Nov 2025 11:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762603137;
	bh=71r+OcXQB1X7Xbdn1EcsiniewMLKe/3Ylt4UqFQfgeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MfKQI63Vbjwp935xilRzB7++lSedhoFohgzR9zEsNcklEA+133G3o1yz+5cQBQSz4
	 qOjcCgCMZWbtkP3MeT3Im8efloiXfyW9hR4mknFZmtGCUNmhtVXDFZzQW3EJ79+d1V
	 bpTm0dfzJbc/v+NS/gVSxP2wHanU/SzneKSBSki6QJEdO/P1AFRBAHGPR1IgbKxesz
	 qIScoFBBbgybCkwSxmkuKD+BMAj7NMzGcclNsHR9mG350P4ZS4NNaXy7udK4Bj685T
	 txsytUteQy8HlC3jwTeWjgrLxrMKMYGnjYN/fGxuo/IeqNqy4PfNM8IkzLaA9Qq/Q7
	 wl1kk+qsB6dhw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vHhap-00000003Ten-0jtr;
	Sat, 08 Nov 2025 11:58:55 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH v2 0/3] KVM: arm64: Fix handling of ID_PFR1_EL1.GIC
Date: Sat,  8 Nov 2025 11:58:47 +0000
Message-ID: <176260312692.1201099.17567101607721197970.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251030122707.2033690-1-maz@kernel.org>
References: <20251030122707.2033690-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, peter.maydell@linaro.org, oupton@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_035859_669928_D7277E0F 
X-CRM114-Status: GOOD (  10.28  )
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

On Thu, 30 Oct 2025 12:27:04 +0000, Marc Zyngier wrote:
> Peter reported[0] that restoring a GICv2 VM fails badly, and correctly
> points out that ID_PFR1_EL1.GIC isn't writable, while its 64bit
> equivalent is. I broke that in 6.12.
> 
> The other thing is that fixing the ID regs at runtime isn't great.
> specially when we could adjust them at the point where the GIC gets
> created.
> 
> [...]

Applied to fixes, thanks!

[1/3] KVM: arm64: Make all 32bit ID registers fully writable
      commit: 3f9eacf4f0705876a5d6526d7d320ca91d7d7a16
[2/3] KVM: arm64: Set ID_{AA64PFR0,PFR1}_EL1.GIC when GICv3 is configured
      commit: 8a9866ff860052efc5f9766f3f87fae30c983156
[3/3] KVM: arm64: Limit clearing of ID_{AA64PFR0,PFR1}_EL1.GIC to userspace irqchip
      commit: 50e7cce81b9b2fbd6f0104c1698959d45ce3cf58

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



