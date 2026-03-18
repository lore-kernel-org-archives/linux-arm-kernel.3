Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0507103E197
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ftHpk/dIzeGCYoXV1xwUmBx6kfDgedehDuYAGPipFk=; b=nysNFbo4MszqRiKXANtORgiv7X
	NTlGz29gex19DTGEr0GdSc0JwbMXJd+3MTIPJT0rV0nXfQO/FFDxQcNMFe6mfCS1sx9W+CNbb9TtT
	XXo0+KWXxaKFIB8ie+pchYIioAfbK7iS/uSVO5ZRR/Im7Ox768Vaew+NpF51WtpVyunDTa9Kbf6kx
	3nYR/CkwOqeiB4xKVFCLa76yovZiN8Bzhin/Vhd0HaK1pSwvLbe6+conueNb8c70PPKn895kD+qet
	5GQ1rj5VNWxexYo24MBNtVudtYzjbbd9QEYBc39ZnFYyrvjMPfet7pkLNESzxT0SmzE0CbycOD7QY
	EA6HgXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tER-00000008oFR-0kUC;
	Wed, 18 Mar 2026 15:54:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tEL-00000008oCE-1z3o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:54:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA6DF1E2F;
	Wed, 18 Mar 2026 08:54:37 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.61.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 649383F73B;
	Wed, 18 Mar 2026 08:54:40 -0700 (PDT)
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
Subject: [PATCH v13 05/48] arm64: RMI: Temporarily add SMCs from RMM v1.0 spec
Date: Wed, 18 Mar 2026 15:53:29 +0000
Message-ID: <20260318155413.793430-6-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
References: <20260318155413.793430-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_085445_560760_A4AE335B 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

Not all the functionality has been migrated to the v2.0 specification,
so for now we still rely on some v1.0 SMCs. This mixture is not
spec-compliant, but is necessary until an updated RMM is available.

Signed-off-by: Steven Price <steven.price@arm.com>
---
New patch in v13
---
 arch/arm64/include/asm/rmi_smc.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/rmi_smc.h b/arch/arm64/include/asm/rmi_smc.h
index 8a42b83218f8..049d71470486 100644
--- a/arch/arm64/include/asm/rmi_smc.h
+++ b/arch/arm64/include/asm/rmi_smc.h
@@ -30,14 +30,15 @@
 #define SMC_RMI_REC_ENTER			SMC_RMI_CALL(0x015c)
 #define SMC_RMI_RTT_CREATE			SMC_RMI_CALL(0x015d)
 #define SMC_RMI_RTT_DESTROY			SMC_RMI_CALL(0x015e)
+#define SMC_RMI_RTT_MAP_UNPROTECTED		SMC_RMI_CALL(0x015f) //
 
 #define SMC_RMI_RTT_READ_ENTRY			SMC_RMI_CALL(0x0161)
-
+#define SMC_RMI_RTT_UNMAP_UNPROTECTED		SMC_RMI_CALL(0x0162) //
 #define SMC_RMI_RTT_DEV_VALIDATE		SMC_RMI_CALL(0x0163)
 #define SMC_RMI_PSCI_COMPLETE			SMC_RMI_CALL(0x0164)
 #define SMC_RMI_FEATURES			SMC_RMI_CALL(0x0165)
 #define SMC_RMI_RTT_FOLD			SMC_RMI_CALL(0x0166)
-
+#define SMC_RMI_REC_AUX_COUNT			SMC_RMI_CALL(0x0167) //
 #define SMC_RMI_RTT_INIT_RIPAS			SMC_RMI_CALL(0x0168)
 #define SMC_RMI_RTT_SET_RIPAS			SMC_RMI_CALL(0x0169)
 #define SMC_RMI_VSMMU_CREATE			SMC_RMI_CALL(0x016a)
-- 
2.43.0


