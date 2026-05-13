Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AABECD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jl47ZYREsTlWaqXWVBE+LgFscPxqupVBMLcOsOlaS+0=; b=N2abgfRFfYOC9xaktEvJaeyhxS
	ShYwhkRtSCtXTl4x3a3cmPG+HjLhKBi01FLLt6w3oo/9wZ9oT23jemLiAlDU0H5tsFjYTM6qvU3F6
	LOXGuwrAB8wfn242PW/og9dYpijnVmbUc6wp8UV4MENsNelN+XZmxmey4T3T2hHJ1veFIZ4ucaL4f
	bDGX/uDHjYNcUI5Kx7TGrAXeid3PpM8Pmm2hHs7Z8yT+21QW9vMjlu0KXmugxIEWO0Qpq9sptH/l6
	jWqZPIJj/PxINoobaIuJ8I+TnMNyMtH5dJtDDgva290KrIJfLLYTh3jVCMQBWLQKFVnOL2dIPa42f
	8iq+mnoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Uf-00000002eyZ-3LA6;
	Wed, 13 May 2026 13:19:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Ua-00000002epV-0gbe
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 13:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Jl47ZYREsTlWaqXWVBE+LgFscPxqupVBMLcOsOlaS+0=; b=ebs5V+Yur1Ppnnd8YjEzf+kl9l
	pmT5BBY1ClovOKGzycxdZ6cxyeqmSa3LKNLA2xsMJd3CRPFh7e61sWKV2Cihnt6kt5LlN8LyZ2jts
	xSdEKcRxv5CnVq366rZiw/ZPEEoIFrQw6erhsX7aBVk+CIK1a2nAcV6qZE9gqxmgaDNfdI6KCiW/j
	e9HmTDpvk/iEzedZbEwbUk9Se1+me0rPIt/Kw+NY6tT6Ts99fbxqdlhl1jy0/7qxALQNuz2IpcQ9i
	OpEjAU+E+pQfhB7ISRbaY/wLDiHDcx363fK2p3NllXFRnhZiIiwiNYFccDNOMcEOSAnZkR3hu/Ikp
	hty/UmJQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9UW-0000000HZ0m-1D0V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:19:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3A7B237B;
	Wed, 13 May 2026 06:19:04 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.68.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D0A13F836;
	Wed, 13 May 2026 06:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778678350; bh=sx0iPudOyRt31pW2A4BbkZbmKOR/eNhzTqthXdGUyuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=boCCdDlNsLYglc9bVoTTBEiphxVWEoPHT/wZskPfKZWoo3t3cb8m8vMtM4N/So8Di
	 5kYlUvXlZTVfyT1MuwPjBsMWyeDjqBraHUXrudJa/tBj1nevq5P7nqfsSdsEAbdoQS
	 oWo8FH6ovh1zwT+VL/KNOWROwJtWPDdEqnYZHpi0=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: [PATCH v14 09/44] arm64: RMI: Provide functions to delegate/undelegate ranges of memory
Date: Wed, 13 May 2026 14:17:17 +0100
Message-ID: <20260513131757.116630-10-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513131757.116630-1-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_141912_989807_D7E79B6F 
X-CRM114-Status: GOOD (  15.41  )
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

The RMM requires memory is 'delegated' to it so that it can be used
either for a realm guest or for various tracking purposes within the RMM
(e.g. for metadata or page tables). Memory that has been delegated
cannot be accessed by the host (it will result in a Granule Protection
Fault).

Undelegation may fail if the memory is still in use by the RMM. This
shouldn't happen (Linux should ensure it has destroyed the RMM objects
before attempting to undelegate). In the event that it does happen this
points to a programming bug and the only reasonable approach is for the
physical pages to be leaked - it is up to the caller of
rmi_undelegate_range() to handle this.

Signed-off-by: Steven Price <steven.price@arm.com>
---
v14:
 * Split into separate patch and moved out of KVM
---
 arch/arm64/include/asm/rmi_cmds.h | 13 +++++++++++
 arch/arm64/kernel/rmi.c           | 36 +++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
index 9078a2920a7c..eb213c8e6f26 100644
--- a/arch/arm64/include/asm/rmi_cmds.h
+++ b/arch/arm64/include/asm/rmi_cmds.h
@@ -33,6 +33,19 @@ struct rmi_sro_state {
 } while (RMI_RETURN_STATUS(res.a0) == RMI_BUSY ||			\
 	 RMI_RETURN_STATUS(res.a0) == RMI_BLOCKED)
 
+int rmi_delegate_range(phys_addr_t phys, unsigned long size);
+int rmi_undelegate_range(phys_addr_t phys, unsigned long size);
+
+static inline int rmi_delegate_page(phys_addr_t phys)
+{
+	return rmi_delegate_range(phys, PAGE_SIZE);
+}
+
+static inline int rmi_undelegate_page(phys_addr_t phys)
+{
+	return rmi_undelegate_range(phys, PAGE_SIZE);
+}
+
 bool rmi_is_available(void);
 
 unsigned long rmi_sro_execute(struct rmi_sro_state *sro, gfp_t gfp);
diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
index 52a415e99500..08cef54acadb 100644
--- a/arch/arm64/kernel/rmi.c
+++ b/arch/arm64/kernel/rmi.c
@@ -12,6 +12,42 @@ static bool arm64_rmi_is_available;
 unsigned long rmm_feat_reg0;
 unsigned long rmm_feat_reg1;
 
+int rmi_delegate_range(phys_addr_t phys, unsigned long size)
+{
+	unsigned long ret = 0;
+	unsigned long top = phys + size;
+	unsigned long out_top;
+
+	while (phys < top) {
+		ret = rmi_granule_range_delegate(phys, top, &out_top);
+		if (ret == RMI_SUCCESS)
+			phys = out_top;
+		else if (ret != RMI_BUSY && ret != RMI_BLOCKED)
+			return ret;
+	}
+
+	return ret;
+}
+
+int rmi_undelegate_range(phys_addr_t phys, unsigned long size)
+{
+	unsigned long ret = 0;
+	unsigned long top = phys + size;
+	unsigned long out_top;
+
+	WARN_ON(size == 0);
+
+	while (phys < top) {
+		ret = rmi_granule_range_undelegate(phys, top, &out_top);
+		if (ret == RMI_SUCCESS)
+			phys = out_top;
+		else if (ret != RMI_BUSY && ret != RMI_BLOCKED)
+			return ret;
+	}
+
+	return ret;
+}
+
 static int rmi_check_version(void)
 {
 	struct arm_smccc_res res;
-- 
2.43.0


