Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D652DC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhAepEKirx8ZaYnE7Y5fCctEuFQHARtSwEyRJ2D6aE8=; b=uzjXSI4hOTRwjtJPkGnJmafsup
	g6I2zIIhuCrSqLSaKHyI1I5Pq2BHXGwsgqxoYeApuq2asvBoYWtMILz7Whyb0CLXdioAQ7+1xSO8N
	Uywi69n1mdXix4vm1hNfDaaEAjH19icvbLwcKmgfIzr+1Eu+mxaNu7uUs5A+4HRCagfsWoLlgic7I
	Km5I0ni4nZPuw5KRDYrn+jR45981Enff32MdH5k/Rlj8Op4+2pVQBT5UqVF7ERdoDgcO8P3NKbEOM
	eXzIiGIHfRT875d6DyzvdtkLqzT0HDcM+TP/fgFYueTYExBJxjEPbYz/xTDmESX0Pha6tn4A4VWdr
	sE6j1mlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQh8-0000000DX5J-0d9Z;
	Tue, 06 May 2025 22:23:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOy-0000000CiRW-45b0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A18D54A796;
	Tue,  6 May 2025 16:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85292C4CEF1;
	Tue,  6 May 2025 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549856;
	bh=5X3YyZc0yV/prtY2KpDQtJAXr40u4CELtIg3JxZkaAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FHC+ubz6buW6plF+5AZ/I9W0CfHqbODtGZd+NU6vm3y8sEF2xl/UY1ioThVjxnr04
	 LUN/EP8QFRNfp3ClZuB7pLQH/DC+Q108Ctgb2CfYtaNGur3ccLJQ2aPZra4D/kIbp1
	 IqSrQr/qu2Q8NpX7F0KH5MKGb38qPu0sQczLbCIyC3FNIxiujGqRLM1Fu/ifdYwoum
	 tdznhgf5/jd6kqPtdsGy1mmeQEqxg7xKzWJbOz2ZiA904o0EAMn4CZA+iUOq080nNr
	 uR85IjHOqKkY9Y26mQfIn+l0RWYpSD5bSf+YHbiIVTzBQKkeIUcfrJahR0M0qPQTgi
	 JnASa5XNL0Ugg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOw-00CJkN-PB;
	Tue, 06 May 2025 17:44:14 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 37/43] KVM: arm64: Add FEAT_FGT2 registers to the VNCR page
Date: Tue,  6 May 2025 17:43:42 +0100
Message-Id: <20250506164348.346001-38-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094417_072777_C443B793 
X-CRM114-Status: GOOD (  10.99  )
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

The FEAT_FGT2 registers are part of the VNCR page. Describe the
corresponding offsets and add them to the vcpu sysreg enumeration.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h     | 5 +++++
 arch/arm64/include/asm/vncr_mapping.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3b5fc64c4085c..abe45f97266c5 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -562,6 +562,11 @@ enum vcpu_sysreg {
 	VNCR(HDFGRTR_EL2),
 	VNCR(HDFGWTR_EL2),
 	VNCR(HAFGRTR_EL2),
+	VNCR(HFGRTR2_EL2),
+	VNCR(HFGWTR2_EL2),
+	VNCR(HFGITR2_EL2),
+	VNCR(HDFGRTR2_EL2),
+	VNCR(HDFGWTR2_EL2),
 
 	VNCR(CNTVOFF_EL2),
 	VNCR(CNTV_CVAL_EL0),
diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
index 4f9bbd4d6c267..6f556e9936443 100644
--- a/arch/arm64/include/asm/vncr_mapping.h
+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -35,6 +35,8 @@
 #define VNCR_CNTP_CTL_EL0       0x180
 #define VNCR_SCXTNUM_EL1        0x188
 #define VNCR_TFSR_EL1		0x190
+#define VNCR_HDFGRTR2_EL2	0x1A0
+#define VNCR_HDFGWTR2_EL2	0x1B0
 #define VNCR_HFGRTR_EL2		0x1B8
 #define VNCR_HFGWTR_EL2		0x1C0
 #define VNCR_HFGITR_EL2		0x1C8
@@ -52,6 +54,9 @@
 #define VNCR_PIRE0_EL1		0x290
 #define VNCR_PIR_EL1		0x2A0
 #define VNCR_POR_EL1		0x2A8
+#define VNCR_HFGRTR2_EL2	0x2C0
+#define VNCR_HFGWTR2_EL2	0x2C8
+#define VNCR_HFGITR2_EL2	0x310
 #define VNCR_ICH_LR0_EL2        0x400
 #define VNCR_ICH_LR1_EL2        0x408
 #define VNCR_ICH_LR2_EL2        0x410
-- 
2.39.2


