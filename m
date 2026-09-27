Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9472C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 16:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RujpUbO0P+3HoDW6lFgN2NaCd44XmjPJC5yHMUlOFrg=; b=XzCFc5EXE5e1UEzJ2872Mbj5Vr
	F2Cps5BopTYYjcB1c07CAfXyu1ESBXLebNeDcnRsTNzJOGqwWc1n8oWalzlFEPwAamjGA1vLmMtMh
	gMfjLX15u+AD4Fi1U/7x+xrw8xdDAzLKQsS9nOWmD7wGpg3Q29D8mV168S23gjLhxl+uwc72XmKd7
	tftYk4NOcsMxkq7RGi9mx+f3b9ck/wgIBvm9ZN49p7hCBi7r+K+14j0Ayz1QjIMP84dDDOHNZ/GQW
	oEMxifxM/PJdrcCgVegXQCyNM5HjKWewaROn8yR2wNsvwtg3JObm6CE+7AP1YlyxxIaCpaBSE62xM
	AorTf/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArqI-0000000GbEJ-1sPd;
	Sun, 27 Sep 2026 16:35:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArqH-0000000GbE6-0tbV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 16:35:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB79F400E1;
	Sun, 27 Sep 2026 16:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2001F000FF;
	Sun, 27 Sep 2026 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790526908;
	bh=RujpUbO0P+3HoDW6lFgN2NaCd44XmjPJC5yHMUlOFrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RcA3jvfgqnPMNyRGlqN0CgN02mPLov1sw6eJux27LWTLQwbXs7AkfDKsDMEBikvPx
	 ptoQbXFsHQTinml1srSBUafLUmTNBSIgrpC7JHWPwUFDRe6yC1foPjSI9FI/Wu4VCF
	 7GX364aXDAXiURlsz/9UT46fEoGOsuUTDZSZrcOMHvRnJxOt59PHl3bLW0XqJ1nNqT
	 QsxoYsBEmIGVkiXNwZm70kZBYoHX1DmAfQzpm+UKRAf+Ha7XThjOfsVPo1FMjKSAHz
	 /MVUb7+iMkciuDM8ZjR8wou1Qog3P9E6DL7VPANVpfdXr/XjTNaj2oqLJVUgtXbOAI
	 gcuJb6EQ3yYCQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xArqE-0000000E2Sa-3OLw;
	Sun, 27 Sep 2026 16:35:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: Report SMCCC_VERSION and SMCCC_ARCH_FEATURES as implemented
Date: Sun, 27 Sep 2026 17:35:03 +0100
Message-ID: <179052685156.3528802.11780401181301860028.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914125827.1645980-1-fuad.tabba@linux.dev>
References: <20260914125827.1645980-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Mon, 14 Sep 2026 13:58:26 +0100, Fuad Tabba wrote:
> KVM reports SMCCC v1.1 to guests, which makes SMCCC_VERSION and
> SMCCC_ARCH_FEATURES mandatory, and DEN0028H 7.3.6 requires
> SMCCC_ARCH_FEATURES to return SUCCESS for both function ids: "This
> function must return SUCCESS when arch_func_id is the SMCCC_VERSION or
> SMCCC_ARCH_FEATURES function id." With arch_func_id set to either, KVM's
> guest handler returns NOT_SUPPORTED. Return SUCCESS.
> 
> [...]

Applied to next, thanks!

[1/2] KVM: arm64: Report SMCCC_VERSION and SMCCC_ARCH_FEATURES as implemented
      commit: 7ef1b9e11dd7b3832124e26a6fee703b342d6f7f
[2/2] KVM: arm64: selftests: Check the mandatory SMCCC_ARCH_FEATURES queries
      commit: 67d00fcc00761e9fe4debeac781eb4f992dd8506

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



