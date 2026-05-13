Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7A3CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5D25pwVwZCWcCX2/JtJND0go+wiyGT2CNWtxvBru/0=; b=m7PwyaiPHABlNxPo7sknx0TisO
	qA9DmDIbABLBS+cYQa/EdiL/T7biBFqlQH7NnpxzsLJ6gFObwVSH7NavZtgbu5KtHtzixjTWWRTTY
	Uce+4RqrB4Pqyo4WkN6a9xr1VHlhDyoymjjS3nny350nr+t03lUy6znX24A3qDBBhf4EW+Qwpyta2
	AAnvuYhpl/OmO0OqqIrVR1Q175Uc07+IVbi0Nz37rWsOf8ziD+dHT+pVANrD5FQZi6U2ICQO3zMoj
	jxGK7Kwk9vAuDUOfrLlK3ujO/6X6slNv7ewt6WtfD0HOkf+j2bTVV20rilJOdrWjEPS94fqMi+k8O
	N6m6uViw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Uf-00000002exJ-1RlY;
	Wed, 13 May 2026 13:19:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9UJ-00000002eRo-1Khr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:19:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A59CD1C14;
	Wed, 13 May 2026 06:18:52 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.68.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 109993F836;
	Wed, 13 May 2026 06:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778678337; bh=cG+9RtOTQ3thXfd8j6zA3ANwSbmme4UsvVw8z7/71yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HNCsvQpwmOkBeoSKcui3hUmxurM7KnUUNQhk6r+G1ltanJroq5edH5Yg/0zSiqp5c
	 lhYqa4B5RJAuxUGLpBQO8NJQTWTA6bGX5PjH1PVjtc/I9Z/QYnztDLYDSHwlRy4K7W
	 yBASKbLEdu+cEmNH4Xeb+HPslXA4tdSNYpgzZqxk=
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
Subject: [PATCH v14 07/44] arm64: RMI: Configure the RMM with the host's page size
Date: Wed, 13 May 2026 14:17:15 +0100
Message-ID: <20260513131757.116630-8-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513131757.116630-1-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_061859_764735_08974072 
X-CRM114-Status: GOOD (  11.38  )
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

RMM v2.0 brings the ability to set the RMM's granule size. Check the
feature registers and configure the RMM so that it matches the host's
page size. This means that operations can be done with a granulatity
equal to PAGE_SIZE.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v13:
 * Moved out of KVM.
---
 arch/arm64/kernel/rmi.c | 42 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
index 99c1ccc35c11..a14ead5dedda 100644
--- a/arch/arm64/kernel/rmi.c
+++ b/arch/arm64/kernel/rmi.c
@@ -49,6 +49,45 @@ static int rmi_check_version(void)
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
+		pr_err("Unsupported PAGE_SIZE for RMM\n");
+		return -EINVAL;
+	}
+
+	ret = rmi_rmm_config_set(virt_to_phys(config));
+	if (ret) {
+		pr_err("RMM config set failed\n");
+		return -EINVAL;
+	}
+
+	ret = rmi_rmm_activate();
+	if (ret) {
+		pr_err("RMM activate failed\n");
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
 static int __init arm64_init_rmi(void)
 {
 	/* Continue without realm support if we can't agree on a version */
@@ -60,6 +99,9 @@ static int __init arm64_init_rmi(void)
 	if (WARN_ON(rmi_features(1, &rmm_feat_reg1)))
 		return 0;
 
+	if (rmi_configure())
+		return 0;
+
 	return 0;
 }
 subsys_initcall(arm64_init_rmi);
-- 
2.43.0


