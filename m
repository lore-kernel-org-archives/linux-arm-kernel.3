Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0B8F589B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwtrSevDXsiP4ai9nAki7ynEwNWhGDuPbqk73+Idwtg=; b=h4CWAQuxrsKia5JdSwKFhUMKfp
	M4n2WMz1KTHLUg2uuBk0BrX2v46bPvXFVR4vNE2BpKzMVQRSpF9IMn9UgQF68/VUKvn1iRAGTsjiC
	69UUJ1xG2cvRRm/EZ11SiT0nevDjvkR8lLI0ToEJqxWzNKhpFTfY7e3w7eXtpcnm1jOojzH73EnqP
	hLY5VIfCWm+8NrV8TOtegIl92QZq6cf6A2rFX+ZTn3LenvsChS4/Pis43IB3UsUOci1WffJ4J7qv4
	xHqcikC2MEsjEEXRro/pE8IMCKi2dbIzCiPwwO8av2f4bv5irv97G2xpQN6M6OOMJH5O0QQz7fSvA
	dlqUYbdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtPe-0000000Beuw-0Sxj;
	Thu, 23 Apr 2026 12:44:10 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtPU-0000000Bekd-2h1D;
	Thu, 23 Apr 2026 12:44:07 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.18])
	by linux.microsoft.com (Postfix) with ESMTPSA id D685E20B7172;
	Thu, 23 Apr 2026 05:43:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D685E20B7172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776948240;
	bh=wwtrSevDXsiP4ai9nAki7ynEwNWhGDuPbqk73+Idwtg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oIKRO7GJl2Gm7dcJrQHwiTxm2axwxWGppTMKxuLoDn+EPRMGbsJTNvawOzU+7GVf6
	 vGvJcp2InOpXQHjLPEyByEnJuHw/OzOgIomchpySoIozcjj1QsjJdx4US2BOrqF9fz
	 6IASXptBiFTXx75DHr9XFAiKATMW22wSzKTDOqmE=
From: Naman Jain <namjain@linux.microsoft.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Kelley <mhklinux@outlook.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	vdso@mailbox.org,
	ssengar@linux.microsoft.com
Subject: [PATCH v2 12/15] mshv_vtl: Move VSM code page offset logic to x86 files
Date: Thu, 23 Apr 2026 12:42:02 +0000
Message-ID: <20260423124206.2410879-13-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124206.2410879-1-namjain@linux.microsoft.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_054400_725917_49A74AF7 
X-CRM114-Status: GOOD (  16.53  )
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

The VSM code page offset register (HV_REGISTER_VSM_CODE_PAGE_OFFSETS)
is x86 specific, its value configures the static call used to return
to VTL0 via the hypercall page. Move the register read from the common
mshv_vtl_get_vsm_regs() into the x86 mshv_vtl_return_call_init(),
which is the sole consumer of the offset.

Change mshv_vtl_return_call_init() from taking a u64 parameter
to taking no arguments, and rename mshv_vtl_get_vsm_regs() to
mshv_vtl_get_vsm_cap_reg() since it now only fetches
HV_REGISTER_VSM_CAPABILITIES.

No functional change on x86. This prepares the common driver code for
ARM64 where VSM code page offsets do not apply.

Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
 arch/x86/hyperv/hv_vtl.c        | 19 +++++++++++++++++--
 arch/x86/include/asm/mshyperv.h |  4 ++--
 drivers/hv/mshv_vtl_main.c      | 24 +++++++++++++-----------
 3 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/arch/x86/hyperv/hv_vtl.c b/arch/x86/hyperv/hv_vtl.c
index f3ffb6a7cb2d..7c10b34cf8a4 100644
--- a/arch/x86/hyperv/hv_vtl.c
+++ b/arch/x86/hyperv/hv_vtl.c
@@ -293,10 +293,25 @@ EXPORT_SYMBOL_GPL(hv_vtl_configure_reg_page);
 
 DEFINE_STATIC_CALL_NULL(__mshv_vtl_return_hypercall, void (*)(void));
 
-void mshv_vtl_return_call_init(u64 vtl_return_offset)
+int mshv_vtl_return_call_init(void)
 {
+	struct hv_register_assoc vsm_pg_offset_reg;
+	union hv_register_vsm_page_offsets offsets;
+	int ret;
+
+	vsm_pg_offset_reg.name = HV_REGISTER_VSM_CODE_PAGE_OFFSETS;
+
+	ret = hv_call_get_vp_registers(HV_VP_INDEX_SELF, HV_PARTITION_ID_SELF,
+				       1, input_vtl_zero, &vsm_pg_offset_reg);
+	if (ret)
+		return ret;
+
+	offsets.as_uint64 = vsm_pg_offset_reg.value.reg64;
+
 	static_call_update(__mshv_vtl_return_hypercall,
-			   (void *)((u8 *)hv_hypercall_pg + vtl_return_offset));
+			   (void *)((u8 *)hv_hypercall_pg + offsets.vtl_return_offset));
+
+	return 0;
 }
 EXPORT_SYMBOL(mshv_vtl_return_call_init);
 
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index b4d80c9a673a..b48f115c1292 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -286,14 +286,14 @@ struct mshv_vtl_cpu_context {
 #ifdef CONFIG_HYPERV_VTL_MODE
 void __init hv_vtl_init_platform(void);
 int __init hv_vtl_early_init(void);
-void mshv_vtl_return_call_init(u64 vtl_return_offset);
+int mshv_vtl_return_call_init(void);
 void mshv_vtl_return_hypercall(void);
 void __mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
 int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, bool shared);
 #else
 static inline void __init hv_vtl_init_platform(void) {}
 static inline int __init hv_vtl_early_init(void) { return 0; }
-static inline void mshv_vtl_return_call_init(u64 vtl_return_offset) {}
+static inline int mshv_vtl_return_call_init(void) { return 0; }
 static inline void mshv_vtl_return_hypercall(void) {}
 static inline void __mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0) {}
 #endif
diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index 4c9ae65ad3e8..be498c9234fd 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -79,7 +79,6 @@ struct mshv_vtl {
 };
 
 static struct mutex mshv_vtl_poll_file_lock;
-static union hv_register_vsm_page_offsets mshv_vsm_page_offsets;
 static union hv_register_vsm_capabilities mshv_vsm_capabilities;
 
 static DEFINE_PER_CPU(struct mshv_vtl_poll_file, mshv_vtl_poll_file);
@@ -203,21 +202,19 @@ static void mshv_vtl_synic_enable_regs(unsigned int cpu)
 	/* VTL2 Host VSP SINT is (un)masked when the user mode requests that */
 }
 
-static int mshv_vtl_get_vsm_regs(void)
+static int mshv_vtl_get_vsm_cap_reg(void)
 {
-	struct hv_register_assoc registers[2];
-	int ret, count = 2;
+	struct hv_register_assoc vsm_capability_reg;
+	int ret;
 
-	registers[0].name = HV_REGISTER_VSM_CODE_PAGE_OFFSETS;
-	registers[1].name = HV_REGISTER_VSM_CAPABILITIES;
+	vsm_capability_reg.name = HV_REGISTER_VSM_CAPABILITIES;
 
 	ret = hv_call_get_vp_registers(HV_VP_INDEX_SELF, HV_PARTITION_ID_SELF,
-				       count, input_vtl_zero, registers);
+				       1, input_vtl_zero, &vsm_capability_reg);
 	if (ret)
 		return ret;
 
-	mshv_vsm_page_offsets.as_uint64 = registers[0].value.reg64;
-	mshv_vsm_capabilities.as_uint64 = registers[1].value.reg64;
+	mshv_vsm_capabilities.as_uint64 = vsm_capability_reg.value.reg64;
 
 	return ret;
 }
@@ -1139,13 +1136,18 @@ static int __init mshv_vtl_init(void)
 	tasklet_init(&msg_dpc, mshv_vtl_sint_on_msg_dpc, 0);
 	init_waitqueue_head(&fd_wait_queue);
 
-	if (mshv_vtl_get_vsm_regs()) {
+	if (mshv_vtl_get_vsm_cap_reg()) {
 		dev_emerg(dev, "Unable to get VSM capabilities !!\n");
 		ret = -ENODEV;
 		goto free_dev;
 	}
 
-	mshv_vtl_return_call_init(mshv_vsm_page_offsets.vtl_return_offset);
+	ret = mshv_vtl_return_call_init();
+	if (ret) {
+		dev_err(dev, "mshv_vtl_return_call_init failed: %d\n", ret);
+		goto free_dev;
+	}
+
 	ret = hv_vtl_setup_synic();
 	if (ret)
 		goto free_dev;
-- 
2.43.0


