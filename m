Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E83FED2E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wO9UqZFmvzWbbuTUTCg2zlIIvIAOlETFTacr5ltGemA=; b=UAs8CXMl1CXTEolpLGYoJPif95
	P7V2N/4iKEwBWEE7kfYgq1YGEbDbXEcrNWAJjpXaR7jqdl9qzcJT/uqNtJBunQLFdIihG6pNHXB6m
	pAyMnXh4PD03py0j/Mz1beCtJM3eSXAqMM9c5SyT49zNXXXuB5wyr2UcOgK7ffGFTayDpYAIeobI+
	reUVGpiVq9SFbs2+IAEbPOk+6leN4HleeN2NN8ysJlYcKlmhVnpa4XZQnab6lJfgnRqLwBRu9Mvup
	grAte/46cv14W1xRMPhd2Ibjllwo3quahbjG+7SKEbRMiaZhZci/N4mk9SgiM6zopqXjE244NdX5S
	9CuJjOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b6R-0000000DcJY-1HxF;
	Thu, 12 Mar 2026 08:09:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b6Q-0000000DcHn-1PBC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:09:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA6DD60131;
	Thu, 12 Mar 2026 08:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1860C19424;
	Thu, 12 Mar 2026 08:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302945;
	bh=jhZYbIx/ioIMcp6Qf6D0AyrmnhioxKZ41Sj/eUJHFfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gKYOE0yj56TVOGQs+HqiYrGUiscjS+7Paz0/3LYmU7nuBD/2Du3+nExFTdkh1ULgD
	 dGWs8qbF0H1tHb3oT+bLOPVxvIeMSCJTDnOyMfVMhOrMzzcCYjddcWnQYNUsM3/1xu
	 4LHflMegH/5Xmr2eCX3C1PMy5MCKnDUOgGVgHQpLSrLCtufw8bj35qmy+n01sF0tIs
	 jZEDf7uGl2YfdrlfgWm1SMlmaaz4DySbsmJ9xbULq+7cv7fZ/tZaRe8nY2EzC7e9iS
	 Yz1cTMfVShhB48tSs+Q0dAGo8M+QYeQqv1cwv0qCLG2DnkKselxARbDsrUNi0oY4Vw
	 6f3AC7mhAXJUg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Dan Williams <dan.j.williams@intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: [RFC PATCH v3 12/12] KVM: arm64: CCA: enable DA in realm create parameters
Date: Thu, 12 Mar 2026 13:37:43 +0530
Message-ID: <20260312080743.3487326-13-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080743.3487326-1-aneesh.kumar@kernel.org>
References: <20260312080743.3487326-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
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

Now that we have all the required steps for DA in-place, enable
DA while creating realm.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Samuel Ortiz <sameo@rivosinc.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/rmi_smc.h | 1 +
 arch/arm64/kvm/rmi.c             | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/rmi_smc.h b/arch/arm64/include/asm/rmi_smc.h
index 384bde2d423e..5598b19ffc1d 100644
--- a/arch/arm64/include/asm/rmi_smc.h
+++ b/arch/arm64/include/asm/rmi_smc.h
@@ -118,6 +118,7 @@ enum rmi_ripas {
 #define RMI_REALM_PARAM_FLAG_LPA2		BIT(0)
 #define RMI_REALM_PARAM_FLAG_SVE		BIT(1)
 #define RMI_REALM_PARAM_FLAG_PMU		BIT(2)
+#define RMI_REALM_PARAM_FLAG_DA			BIT(3)
 
 /*
  * Note many of these fields are smaller than u64 but all fields have u64
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 5de49a47d782..328eef406419 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -703,6 +703,9 @@ static int realm_create_rd(struct kvm *kvm)
 	if (r)
 		goto out_undelegate_tables;
 
+	/* For now default enable DA */
+	if (rmi_has_feature(RMI_FEATURE_REGISTER_0_DA))
+		params->flags |= RMI_REALM_PARAM_FLAG_DA;
 	params_phys = virt_to_phys(params);
 
 	if (rmi_realm_create(rd_phys, params_phys)) {
-- 
2.43.0


