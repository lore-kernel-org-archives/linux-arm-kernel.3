Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6960D149E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 20:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Zy6kGgU90OTXWFjrU27ot0S1ZKtGk6pNy9r56UsKD0=; b=rIxT3m4aD2QTRo7HXzfHCnV/Md
	WwfGwz1huYEBH6S1QLR8EsejYXkjzSRM8iIHyD0DChNwQtkO29InboIBhlIlq4JazehSL+u+lnxHg
	bTviutwKBq8DAfbjyK24/jRPtJhve4rNhl6ySbUx3G253vwFVYzI4KqmjwgWrRByMG5njmSN+ZbVI
	fBe1Vm71v/aKD0NPs2ktNFAWA5vqPnqfMb/sUMsutQzOXHFAJuEYl7DWVB+dGi2BHcFZ+XLDjOwQK
	9sLZH4hRH05cslHgkHsyDUPBjdxjkhvFRsg7QwA37HUwPPTYER6IoOpo99Ge7HHIh1dxq6SmTNrhV
	ljOFHgVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QWo-000000053xi-1jvZ;
	Fri, 25 Oct 2024 20:03:22 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OzB-00000004mtj-1aFe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 18:24:34 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729880671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Zy6kGgU90OTXWFjrU27ot0S1ZKtGk6pNy9r56UsKD0=;
	b=A4y2jPMPE4BmR7TzBqQJGkn0DYhVlj3aXzkH85lk5syb6tnnb3I9YfE0upgTkJycKdcsUt
	HiS5Mu4JobQdcE6BNtc4hFKCajIzc5Hfb33q4Loxpv9Wzpc4y5p7Ff1PHzFvx76rPVVTdW
	GTCsQzpR30nsm4olM5vTfbpCJhh60Qw=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH v4 11/18] KVM: arm64: nv: Advertise support for FEAT_HPMN0
Date: Fri, 25 Oct 2024 18:23:46 +0000
Message-ID: <20241025182354.3364124-12-oliver.upton@linux.dev>
In-Reply-To: <20241025182354.3364124-1-oliver.upton@linux.dev>
References: <20241025182354.3364124-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_112433_583524_061F8C9A 
X-CRM114-Status: GOOD (  10.60  )
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

Everything is in place now for KVM to actually handle MDCR_EL2.HPMN. Not
only that, the emulation is capable of doing FEAT_HPMN0. Advertise
support for the feature in the VM's ID registers. It is possible to
emulate FEAT_HPMN0 on hardware that doesn't support it since KVM
currently traps all PMU registers. Having said that, let's only
advertise the feature on supporting hardware in case KVM ever provides
'direct' PMU support to VMs w/o involving host perf.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/nested.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index d256a495a6ba..762f3ea8126d 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -892,12 +892,13 @@ static void limit_nv_id_regs(struct kvm *kvm)
 				  ID_AA64MMFR4_EL1_E2H0_NI_NV1);
 	kvm_set_vm_id_reg(kvm, SYS_ID_AA64MMFR4_EL1, val);
 
-	/* Only limited support for PMU, Debug, BPs and WPs */
+	/* Only limited support for PMU, Debug, BPs, WPs, and HPMN0 */
 	val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64DFR0_EL1);
 	val &= (NV_FTR(DFR0, PMUVer)	|
 		NV_FTR(DFR0, WRPs)	|
 		NV_FTR(DFR0, BRPs)	|
-		NV_FTR(DFR0, DebugVer));
+		NV_FTR(DFR0, DebugVer)	|
+		NV_FTR(DFR0, HPMN0));
 
 	/* Cap Debug to ARMv8.1 */
 	tmp = FIELD_GET(NV_FTR(DFR0, DebugVer), val);
-- 
2.47.0.163.g1226f6d8fa-goog


