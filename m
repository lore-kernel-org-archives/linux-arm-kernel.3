Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A442CFF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XheZa3HDrnY6SFHBPj2B0DZ/+citwy4CQxORXYd+VYg=; b=HnBcimyNOp7kw/Mh3Vgu5sQHbt
	IFnlhwamm/ET+Xorst70ri1/0dnai1NUv6xLxlZgaDXJRawnty31U5iWYpuPLEa9KRm9i2fReqHBy
	6astD7JDRy36+ZwDJBhWZu0Yo7CNKe/XT7f2mCKsseNhnJjNBWUbVhKezi2pzLuPNLDRDjE/vSIbu
	oKTIMfKGlSnBcfAN//I6bbML1nPL7ASqKqTMF30HkBZCZ4v28KfP9X8RRiek6mPTJxOG4FHHnL7Fg
	uAx/aH6doTGQcPe7RIB655Px5v4i6l1ZIE7zpnbFLWEpMl3FFRigYhhBob4dCEc+Wx8kNEIpERZ0T
	oRO935/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHki-0000000GVv7-49FI;
	Mon, 27 Apr 2026 08:55:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHkf-0000000GVrX-1Ijj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:55:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05300438EA;
	Mon, 27 Apr 2026 08:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B750C19425;
	Mon, 27 Apr 2026 08:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777280136;
	bh=bOeW3wbvkkrlNUf/VIWIVhSCHUYQcXavZMh9tYHAPFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=el4gRSMhKtyPa8PfIyrtLcnxhEU67PzIeRckrMU2d/sCX6uHEDbYVpT1z9/3kcR3m
	 FhXZyRQefVv5RMhGqFZpoIrSX2eLxueKjxm5Lf745+Xx9Vl5vzvUI/QzJDmEk2bs6M
	 dXoNySpemHjGRhOdJV+1CbZ5rR9AzeScSn5m4cS7SIGQrBk2Mc5uQz8EjORYM9AND6
	 CzAruS+R8Ns3bdfknS3S6cZjM9LXRtUHF2jlw4BUIsA2kiqsD7xH8lvqLjESw0zc1O
	 q++suWnwXeV9RZIQqBt57xDCY853fmmbJ40ncaS4CQZh283hJx2N3oSQ+0Xee2k4Nv
	 BY3rWVUtKlVHA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH v4 16/16] KVM: arm64: CCA: enable DA in realm create parameters
Date: Mon, 27 Apr 2026 14:23:44 +0530
Message-ID: <20260427085344.941627-17-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427085344.941627-1-aneesh.kumar@kernel.org>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_015537_375182_8B6A28E4 
X-CRM114-Status: GOOD (  11.32  )
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

Now that we have all the required steps for DA in-place, enable
DA while creating realm.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rmi_smc.h | 1 +
 arch/arm64/kvm/rmi.c             | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/rmi_smc.h b/arch/arm64/include/asm/rmi_smc.h
index f3ad545d68b7..c02e2f087b1c 100644
--- a/arch/arm64/include/asm/rmi_smc.h
+++ b/arch/arm64/include/asm/rmi_smc.h
@@ -268,6 +268,7 @@ struct rmm_config {
 #define RMI_REALM_PARAM_FLAG_LPA2		BIT(0)
 #define RMI_REALM_PARAM_FLAG_SVE		BIT(1)
 #define RMI_REALM_PARAM_FLAG_PMU		BIT(2)
+#define RMI_REALM_PARAM_FLAG_DA			BIT(3)
 
 struct realm_params {
 	union { /* 0x0 */
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index cc9e045dcae9..e041c4caee79 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -691,6 +691,9 @@ static int realm_create_rd(struct kvm *kvm)
 	if (r)
 		goto out_undelegate_tables;
 
+	/* For now default enable DA */
+	if (rmm_has_reg2_feature(RMI_FEATURE_REGISTER_2_DA))
+		params->flags |= RMI_REALM_PARAM_FLAG_DA;
 	params_phys = virt_to_phys(params);
 
 	if (rmi_realm_create(rd_phys, params_phys)) {
-- 
2.43.0


