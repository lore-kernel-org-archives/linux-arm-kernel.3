Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CAC606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C2G+wFGu;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Pjdur3pL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+XGY/v6BR2NT4up8v10Wc/v7759RgeWyYpEIAPxEWSM=; b=C2G+wFGu4k5opA
	Z6VNnMlVR9xQMDwtwNy2CyCxnV6U4eTw/WfDRsXxj+kFyxqjPT7bcQ0tXap9e3xYlRjR1HU4FFhQ4
	AID7h40HoBR93uY/P8SG3a6rbewWoDNSPLRw6ipEI4DQCkmLDTvxBI6ErDRWb62r5biPzaueoSIRB
	wPQZdoJ3OefRhorCP2qnV4NVVBCen6Cmw00XwZiZz0deK5yBjNBhP0LlHs3iMNZkErvjMqAULQ6Iw
	kXvR8hFWmXc88Rwoaeshx6ZgeegdGS4tIHNuv1e634rqer89dsPuLw9+sQ9yIvEDquJsyPMaf+lQd
	ONCKTShg0vPiT/hrXsrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrfk-0000000GXlY-3rgH;
	Mon, 02 Nov 2026 13:02:00 +0000
Received: from out-64.mta0.migadu.com ([2001:41d0:1004:224b::40] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrfh-0000000GXio-1vWp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:02:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=dmrpggB/4/cFopVedznZGtlVQgchY7JNs1MqKk3Qx8M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793624515; v=1; x=1794229315;
 b=Pjdur3pLSK2K2BqKtYGZl3kLkZfZMv3hJf+usQ6etUaTJxmto96AroKwDkZjalKt9xyLEVnn
 Ak8fQY3sG+MJgsa3QYBVFKMEo1QfrW2XDrYl6wr+mXrL2WbJ/4F7L9Nh7oYjy3b7Yvs8vK/Rle2
 C/brQXJoAZneoh6zd3BSv5Qc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9efc73450d7a3700;
	Mon, 02 Nov 2026 13:01:55 +0000
X-Mizu-Trace-ID: 9efc73450d7a3700
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/13] irqchip/gic-v3: Disable GICv4 features in protected KVM mode
Date: Mon,  2 Nov 2026 13:01:23 +0000
Message-ID: <20261102130133.3684226-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102130133.3684226-1-fuad.tabba@linux.dev>
References: <20261102130133.3684226-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_050157_637166_B50A86C2 
X-CRM114-Status: GOOD (  17.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Bartłomiej Grzesik <bgrzesik@google.com>

Later patches have the protected KVM hypervisor take the ITS from the
host and check each command the host queues. They don't emulate the
vLPI commands, as VMAPP's VPT_base, for one, is a host-chosen address
the ITS and the redistributors write to.

Clear has_vlpis and has_rvpeid at redistributor probe in protected mode,
so the host never issues a vLPI command, and print that GICv4 is off.
The host loses GICv4 direct injection for its non-protected guests,
which is off unless kvm-arm.vgic_v4_enable is set, and can't restore a
guest saved with GICD_TYPER2.nASSGIcap set.

The test is kvm_get_mode(), as the redistributors are probed before the
cpucaps are final. It lives in irq-gic-common.h as
gic_is_protected_kvm(), so that the ITS driver can use it too and
linux/kvm_host.h stays out of the rest of irqchip.

Signed-off-by: Bartłomiej Grzesik <bgrzesik@google.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/admin-guide/kernel-parameters.txt |  8 +++++---
 drivers/irqchip/irq-gic-common.h                | 13 +++++++++++++
 drivers/irqchip/irq-gic-v3.c                    |  8 ++++++++
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd94..3e63e44609522 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3275,8 +3275,9 @@ Kernel parameters
 				hardware (with FEAT_NV2).
 
 			Defaults to VHE/nVHE based on hardware support. Setting
-			mode to "protected" will disable kexec and hibernation
-			for the host. To force nVHE on VHE hardware, add
+			mode to "protected" will disable kexec, hibernation and
+			GICv4 direct LPI injection for the host. To force nVHE
+			on VHE hardware, add
 			"arm64_sw.hvhe=0 id_aa64mmfr1.vh=0" to the
 			command-line.
 			"nested" and "protected" are experimental and should be
@@ -3296,7 +3297,8 @@ Kernel parameters
 
 	kvm-arm.vgic_v4_enable=
 			[KVM,ARM,EARLY] Allow use of GICv4 for direct
-			injection of LPIs.
+			injection of LPIs. Has no effect when
+			kvm-arm.mode=protected.
 
 	kvm-arm.wfe_trap_policy=
 			[KVM,ARM] Control when to set WFE instruction trap for
diff --git a/drivers/irqchip/irq-gic-common.h b/drivers/irqchip/irq-gic-common.h
index 710cab61d9195..87b5c57dec0f1 100644
--- a/drivers/irqchip/irq-gic-common.h
+++ b/drivers/irqchip/irq-gic-common.h
@@ -10,6 +10,9 @@
 #include <linux/irqdomain.h>
 #include <linux/msi.h>
 #include <linux/irqchip/arm-gic-common.h>
+#ifdef CONFIG_ARM64
+#include <linux/kvm_host.h>
+#endif
 
 struct gic_quirk {
 	const char *desc;
@@ -29,6 +32,16 @@ void gic_enable_quirks(u32 iidr, const struct gic_quirk *quirks,
 void gic_enable_of_quirks(const struct device_node *np,
 			  const struct gic_quirk *quirks, void *data);
 
+#ifdef CONFIG_ARM64
+/* Not is_protected_kvm_enabled(): the GIC probes before the cpucaps are final. */
+static inline bool gic_is_protected_kvm(void)
+{
+	return kvm_get_mode() == KVM_MODE_PROTECTED;
+}
+#else
+static inline bool gic_is_protected_kvm(void) { return false; }
+#endif
+
 #define RDIST_FLAGS_PROPBASE_NEEDS_FLUSHING    (1 << 0)
 #define RDIST_FLAGS_RD_TABLES_PREALLOCATED     (1 << 1)
 #define RDIST_FLAGS_FORCE_NON_SHAREABLE        (1 << 2)
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 94873646d46fb..30ed17f26a208 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1123,6 +1123,14 @@ static void gic_update_rdist_properties(void)
 	gic_iterate_rdists(__gic_update_rdist_properties);
 	if (WARN_ON(gic_data.ppi_nr == UINT_MAX))
 		gic_data.ppi_nr = 0;
+
+	/* Protected KVM doesn't emulate the vLPI commands. */
+	if (gic_is_protected_kvm() && gic_data.rdists.has_vlpis) {
+		pr_info("GICv4 features disabled in protected KVM mode\n");
+		gic_data.rdists.has_vlpis = false;
+		gic_data.rdists.has_rvpeid = false;
+	}
+
 	pr_info("GICv3 features: %d PPIs%s%s\n",
 		gic_data.ppi_nr,
 		gic_data.has_rss ? ", RSS" : "",
-- 
2.47.3


