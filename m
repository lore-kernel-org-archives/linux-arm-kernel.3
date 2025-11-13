Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9379CD8CAE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vi9owoVH6aUP0fVTf+FUnfCjOSXpbLhfI17rV+VhSrI=; b=k/RcOI6ToUZA9N/T1cZZV3xQ+r
	vC1pmqoii5kIFqXwhyrvsMX/dpauOPFvCPB0+amY6YJ0c2nlPoLjysFxASdb5zdQujc727KAqPk3W
	M41L+NeGMwWbGsHbMnIcNx0JrIexmN4cO1FmFdOYjLOK++Cow2sov8dirJ4TqFueYRZaJu2JCGUHw
	7+T0ap5xeiywdp6B8HbQ5nZR3NcjIFOcWQ5j1mu0D8zONPiRWaJcd3ZmPw9fnZkfQXU5wqqhnE0OF
	UrOoYY5mbuywdZjypddxp2ruPXeHnm81xT9Ifh1GRdwdWF/2Kds4s3vv1zUSDCsXtO5CzQHD2PGHa
	gJNl6n2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJb4g-0000000ArZ7-0Hfe;
	Thu, 13 Nov 2025 17:25:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJb4e-0000000ArYX-091q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 17:25:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B999D4362C;
	Thu, 13 Nov 2025 17:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C55AC4CEF5;
	Thu, 13 Nov 2025 17:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763054730;
	bh=MGcf2zVIHQnkSUY5McLemWtDefzifDwz1x3OzNPv4CY=;
	h=From:To:Cc:Subject:Date:From;
	b=fKlg/TxrqZ9J/vGmga9SZoE7TIeaZuqsEmxyMSIzWzombRjl7vqVjMQQ1wEoQy7JO
	 ntU0myS4O9Qh+/lpm1MQ4Jv38hDKApDPJ/YZia+126dHRJ/1UxUPCgSpyIWtgFMLyB
	 zOZe+ZzEo0HO+4qfo/2Tvt57cH2JAQyG1za+ZhwIsZWZvUIiAPJbTU5YePER+1ceXa
	 wYhBXpQCw7xOOLKy52yHBNUz5IX4IwfTMmsIqAx34wF9leG2kTXiBOs6kGx7UOxlrD
	 7AA0n0rTj38dunjHmLdrTOIDpksBGvPaUOn7CrA3bPx0IUlDBqgvtk76G4VdIYUk7/
	 L76pRuohXdFtQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vJb4a-00000004xKh-0h6Q;
	Thu, 13 Nov 2025 17:25:28 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] KVM: arm64: GICv3: Check the implementation before accessing ICH_VTR_EL2
Date: Thu, 13 Nov 2025 17:25:24 +0000
Message-ID: <20251113172524.2795158-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, m.szyprowski@samsung.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_092532_110763_FB9C175F 
X-CRM114-Status: GOOD (  11.43  )
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

The ICH_HCR_EL2 patching code is generally GIC implementation agnostic,
except when checking for broken Apple HW, which imposes to read
ICH_VTR_EL2.

It is therefore important to check whether we are running on such
HW before reading this register, as it will otherwise UNDEF when
run on HW that doesn't have GICv3.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Fixes: ca30799f7c2d ("KVM: arm64: Turn vgic-v3 errata traps into a patched-in constant")
Closes: https://lore.kernel.org/r/b618732b-fd26-49e0-84c5-bfd54be09cd2@samsung.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index fc7a4cb8e231d..598621b14a30d 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -829,8 +829,8 @@ static const struct midr_range broken_seis[] = {
 static bool vgic_v3_broken_seis(void)
 {
 	return (is_kernel_in_hyp_mode() &&
-		(read_sysreg_s(SYS_ICH_VTR_EL2) & ICH_VTR_EL2_SEIS) &&
-		is_midr_in_range_list(broken_seis));
+		is_midr_in_range_list(broken_seis) &&
+		(read_sysreg_s(SYS_ICH_VTR_EL2) & ICH_VTR_EL2_SEIS));
 }
 
 void noinstr kvm_compute_ich_hcr_trap_bits(struct alt_instr *alt,
-- 
2.47.3


