Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A604103E198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPoJFUR7F1IfiP7e5NE0hnI1aTP7z3f1v4PKT/xzj+k=; b=u/3rD9rRfTZvnH61fq4qqZPbX5
	fmb9kaiYOz02+8XvAPly/A1mb0Uxg7bCBnLF9OAHF08oEOsew0Z4WyN3If07U5TOTrUYn8HnGnzHT
	+wRQIFsQ1XU5m3jr55wYqP20ZgMi1uDKbF8wStcsbiQACrGA3ycmAhB1jY7QoAnjD2jVtsvmKhnTI
	I9mYs1KMIjbDivIzjL2poo+uhPDBG9oehG+mdc/cmH1o+VnmfJ6nxg6rLuKb9UN0Z8a/Q7rO0ozd7
	BtEScBtGHga8vkKqsJqS1+Ej2iDDlFTQUKRKAzXICJuq3UF/P3pOHo+Kymlwb7vEpQbBevmXRz7ej
	lhdCrRnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tEh-00000008oRX-2G8j;
	Wed, 18 Mar 2026 15:55:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tEa-00000008oKc-198d
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 15:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wPoJFUR7F1IfiP7e5NE0hnI1aTP7z3f1v4PKT/xzj+k=; b=pA0wZFPveLe7k9tOX4qOEdpSz1
	a580u1QsZn0EkOCWLQmnJGO7lgXX9ROTo01a1TtOp0PByKEDWlaCmBwhlJYvLeecaGR869Yyp7iSM
	1BC2Ytl/9mXyEd6tLrPzXsDij0L4Qlt09rPCWNuzq95VGOcU7ZwlR3EsU8lbgeLOykjIY3pW4O9MI
	vhpC3aTSMwfcazAhg08IwQ87Nty4Qlyf5aUBzoNIylgoUynEsHC1oLOBUCgp/3zTyBBRhNn5GOaeG
	IZYYH4FHZkTVSu41vpSnCeom64jV8BUNAkbBTqp6bwJmzTvf5tdqhvz4dmTbwwNYeGwsc+TIPhpL/
	XTMvVSug==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tEW-0000000BdPT-1vMi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:54:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FE311FCD;
	Wed, 18 Mar 2026 08:54:48 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.61.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 727FB3F73B;
	Wed, 18 Mar 2026 08:54:51 -0700 (PDT)
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
	Vishal Annapurve <vannapurve@google.com>
Subject: [PATCH v13 08/48] arm64: RMI: Configure the RMM with the host's page size
Date: Wed, 18 Mar 2026 15:53:32 +0000
Message-ID: <20260318155413.793430-9-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
References: <20260318155413.793430-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_155457_492924_97A7469F 
X-CRM114-Status: GOOD (  12.57  )
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

RMM v2.0 brings the ability to set the RMM's granule size. Read the
feature registers and configure the RMM so that it matches the host's
page size. This means that operations can be done with a granulatity
equal to PAGE_SIZE.

Signed-off-by: Steven Price <steven.price@arm.com>
---
New patch for v13
---
 arch/arm64/kvm/rmi.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index fac151580c01..482dc542451a 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -8,6 +8,9 @@
 #include <asm/rmi_cmds.h>
 #include <asm/virt.h>
 
+static unsigned long rmm_feat_reg0;
+static unsigned long rmm_feat_reg1;
+
 static int rmi_check_version(void)
 {
 	struct arm_smccc_res res;
@@ -47,11 +50,58 @@ static int rmi_check_version(void)
 	return 0;
 }
 
+static int rmi_configure(void)
+{
+	struct rmm_config *config __free(free_page) = NULL;
+	unsigned long ret;
+
+	config = (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
+	if (!config)
+		return -ENOMEM;
+
+	switch (PAGE_SIZE) {
+	case SZ_4K:
+		config->rmi_granule_size = RMI_GRANULE_SIZE_4KB;
+		break;
+	case SZ_16K:
+		config->rmi_granule_size = RMI_GRANULE_SIZE_16KB;
+		break;
+	case SZ_64K:
+		config->rmi_granule_size = RMI_GRANULE_SIZE_64KB;
+		break;
+	default:
+		kvm_err("Unsupported PAGE_SIZE for RMM\n");
+		return -EINVAL;
+	}
+
+	ret = rmi_rmm_config_set(virt_to_phys(config));
+	if (ret) {
+		kvm_err("RMM config set failed\n");
+		return -EINVAL;
+	}
+
+	ret = rmi_rmm_activate();
+	if (ret) {
+		kvm_err("RMM activate failed\n");
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
 void kvm_init_rmi(void)
 {
 	/* Continue without realm support if we can't agree on a version */
 	if (rmi_check_version())
 		return;
 
+	if (WARN_ON(rmi_features(0, &rmm_feat_reg0)))
+		return;
+	if (WARN_ON(rmi_features(1, &rmm_feat_reg1)))
+		return;
+
+	if (rmi_configure())
+		return;
+
 	/* Future patch will enable static branch kvm_rmi_is_available */
 }
-- 
2.43.0


