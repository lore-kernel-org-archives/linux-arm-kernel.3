Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1839FC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXRN0zyGvVQVfOgWY2GtqrY9rd3XyOZvO48UQEs1vT0=; b=boBjs1oVAoC+bWGwnROWT1Sg6O
	MeHE5fYZmDthJH1zfHwL9M59opX02F15BRBE4aJ4nmdbkQpGo4/D/QlePlxzE9pZxS/iuA9em2DLL
	o1sdnkMlPueSh8sFFliRd4lvrB27jrDn0pOKohC11OkzNOodvR8FOqhhoMlnpIAifUq6minTMrFsy
	VIa5E+BOroyVLmiRWPL+Q7Zx2ClRSms+LPJ0k7W18hDe39GtVbWGZnORXOopZSiO7ZWlU1L8gGqre
	EtKJdPROR9KgQYtrGbSVwAhnrtZW9oBsCtizAH+ofgYPirq1ohS/Md9FfF9ex30t1PkNFfl0aell/
	dPt2qNVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W9L-00000006Qmg-3bIn;
	Mon, 07 Sep 2026 10:00:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W9F-00000006Qil-1Bxa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:00:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B93B81476;
	Mon,  7 Sep 2026 03:00:16 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A44453F7B4;
	Mon,  7 Sep 2026 03:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788775220; bh=Y4QX89Kcn05W76GumGdqUmJ8ztUjeh8UKnCPUSoyg34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tPr7Nd7z9xlbACYVkZVCyxPzXPXsX8Rle+EXAwSj1ooluqtYkHGQCij1f4EFVTCg/
	 U6vbOqDgR3treYX/g6St7kDb/kYEwjr1zFLjh7HnUqK+FWVR/wi5Q0l05uWOD0YjA3
	 BSFYS4//g+TbiR3rLvlYE56C2uKBJpf6fNasn0TU=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v17 7/7] firmware: arm_rmm: Add wrappers for Realm related RMI commands
Date: Mon,  7 Sep 2026 10:59:41 +0100
Message-ID: <20260907095942.1140734-8-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907095942.1140734-1-suzuki.poulose@arm.com>
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_030025_400635_D84C57AE 
X-CRM114-Status: GOOD (  19.09  )
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

From: Steven Price <steven.price@arm.com>

Introduce wrappers for the RMI functions needed for creating and
managing realm guests. This will be used by the KVM to manage the
Realms

Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v16:
  * Split into a separate patch and move away from arch/arm64 to
    include/linux/.
  * Also moved into the firmware_rmm series from the KVM CCA support.
    This is done in a hope to reduce the merge conflicts and make
    the KVM CCA upstreaming in independent parallel chunks
---
 include/linux/arm-rmi-cmds.h | 453 +++++++++++++++++++++++++++++++++++
 1 file changed, 453 insertions(+)

diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
index 79e2c1f165112..746257d77dd61 100644
--- a/include/linux/arm-rmi-cmds.h
+++ b/include/linux/arm-rmi-cmds.h
@@ -222,4 +222,457 @@ static inline long rmi_granule_range_undelegate(unsigned long base,
 	return ret;
 }
 
+/**
+ * rmi_rtt_data_map_init() - Create a protected mapping with data contents
+ * @rd: PA of the RD
+ * @data: PA of the target granule
+ * @ipa: IPA at which the granule will be mapped in the guest
+ * @src: PA of the source granule
+ * @flags: RMI_MEASURE_CONTENT if the contents should be measured
+ *
+ * Create a mapping from Protected IPA space to conventional memory, copying
+ * contents from a Non-secure Granule provided by the caller.
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_rtt_data_map_init(unsigned long rd, unsigned long data,
+					 unsigned long ipa, unsigned long src,
+					 unsigned long flags)
+{
+	struct arm_smccc_1_2_regs regs = {
+		SMC_RMI_RTT_DATA_MAP_INIT, rd, data, ipa, src, flags
+	};
+
+	return rmi_sro_execute(&regs);
+}
+
+/**
+ * rmi_rtt_data_map() - Create mappings in protected IPA with unknown contents
+ * @rd: PA of the RD
+ * @base: Base of the target IPA range
+ * @top: Top of the target IPA range
+ * @flags: Flags
+ * @oaddr: Output address set descriptor
+ * @out_top: Top address of range which was processed.
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_rtt_data_map(unsigned long rd,
+				    unsigned long base,
+				    unsigned long top,
+				    unsigned long flags,
+				    unsigned long oaddr,
+				    unsigned long *out_top)
+{
+	struct arm_smccc_1_2_regs regs = {
+		SMC_RMI_RTT_DATA_MAP, rd, base, top, flags, oaddr
+	};
+	long ret;
+
+	ret = rmi_sro_execute(&regs);
+
+	if (ret == RMI_SUCCESS && out_top)
+		*out_top = regs.a1;
+
+	return ret;
+}
+
+/**
+ * rmi_rtt_data_unmap() - Remove mappings to conventional memory
+ * @rd: PA of the RD for the target Realm
+ * @base: Base of the target IPA range
+ * @top: Top of the target IPA range
+ * @flags: Flags
+ * @oaddr: Output address set descriptor
+ * @out_top: Returns top IPA of range which has been unmapped
+ * @out_range: Output address range
+ * @out_count: Number of entries in output address list
+ *
+ * Removes mappings to convention memory with a target Protected IPA range.
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_rtt_data_unmap(unsigned long rd,
+				      unsigned long base,
+				      unsigned long top,
+				      unsigned long flags,
+				      unsigned long oaddr,
+				      unsigned long *out_top,
+				      unsigned long *out_range,
+				      unsigned long *out_count)
+{
+	struct arm_smccc_1_2_regs regs = {
+		SMC_RMI_RTT_DATA_UNMAP, rd, base, top, flags, oaddr
+	};
+	long ret;
+
+	ret = rmi_sro_execute(&regs);
+
+	if (ret == RMI_SUCCESS) {
+		if (out_top)
+			*out_top = regs.a1;
+		if (out_range)
+			*out_range = regs.a2;
+		if (out_count)
+			*out_count = regs.a3;
+	}
+
+	return ret;
+}
+
+/**
+ * rmi_psci_complete() - Complete pending PSCI command
+ * @calling_rec: PA of the calling REC
+ * @status: Status of the PSCI request
+ *
+ * Completes a pending PSCI command.
+ *
+ * Return: RMI return code
+ */
+static inline long rmi_psci_complete(unsigned long calling_rec,
+				     unsigned long status)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_PSCI_COMPLETE, calling_rec, status, &res);
+
+	return res.a0;
+}
+
+/**
+ * rmi_realm_activate() - Active a realm
+ * @rd: PA of the RD
+ *
+ * Mark a realm as Active signalling that creation is complete and allowing
+ * execution of the realm.
+ *
+ * Return: RMI return code
+ */
+static inline long rmi_realm_activate(unsigned long rd)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_REALM_ACTIVATE, rd, &res);
+
+	return res.a0;
+}
+
+/**
+ * rmi_realm_create() - Create a realm
+ * @rd: PA of the RD
+ * @params: PA of realm parameters
+ * @sro: Preallocated SRO context to be used
+ *
+ * Create a new realm using the given parameters.
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_realm_create(unsigned long rd, unsigned long params,
+				    struct rmi_sro_state *sro)
+{
+	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL,
+				   SMC_RMI_REALM_CREATE, rd, params);
+}
+
+/**
+ * rmi_realm_terminate() - Terminate a realm
+ * @rd: PA of the RD
+ * @sro: Preallocated SRO context to be used
+ *
+ * Terminates a realm, moving it into a ZOMBIE state
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_realm_terminate(unsigned long rd,
+				       struct rmi_sro_state *sro)
+{
+	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL,
+				   SMC_RMI_REALM_TERMINATE, rd);
+}
+
+/**
+ * rmi_realm_destroy() - Destroy a realm
+ * @rd: PA of the RD
+ * @sro: Preallocated SRO context to be used
+ *
+ * Destroys a realm, all objects belonging to the realm must be destroyed first.
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_realm_destroy(unsigned long rd,
+				     struct rmi_sro_state *sro)
+{
+	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL,
+				   SMC_RMI_REALM_DESTROY, rd);
+}
+
+/**
+ * rmi_rec_create() - Create a REC
+ * @rd: PA of the RD
+ * @rec: PA of the target REC
+ * @params: PA of REC parameters
+ * @sro: Allocated SRO context to be used
+ *
+ * Create a REC using the parameters specified in the struct rec_params pointed
+ * to by @params.
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_rec_create(unsigned long rd,
+				  unsigned long rec,
+				  unsigned long params,
+				  struct rmi_sro_state *sro)
+{
+	long ret;
+
+	*sro = (struct rmi_sro_state){.regs = {
+		SMC_RMI_REC_CREATE, rd, rec, params
+	}};
+	ret = rmi_sro_memxfer_execute(sro, GFP_KERNEL);
+	rmi_sro_free(sro);
+
+	return ret;
+}
+
+/**
+ * rmi_rec_destroy() - Destroy a REC
+ * @rec: PA of the target REC
+ * @sro: Allocated SRO context to be used
+ *
+ * Destroys a REC. The REC must not be running.
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_rec_destroy(unsigned long rec,
+				   struct rmi_sro_state *sro)
+{
+	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_REC_DESTROY, rec);
+}
+
+/**
+ * rmi_rec_enter() - Enter a REC
+ * @rec: PA of the target REC
+ * @run_ptr: PA of RecRun structure
+ *
+ * Starts (or continues) execution within a REC.
+ *
+ * Return: RMI return code
+ */
+static inline long rmi_rec_enter(unsigned long rec, unsigned long run_ptr)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(SMC_RMI_REC_ENTER, rec, run_ptr, &res);
+
+	return res.a0;
+}
+
+/**
+ * rmi_rtt_create() - Creates an RTT
+ * @rd: PA of the RD
+ * @rtt: PA of the target RTT
+ * @ipa: Base of the IPA range described by the RTT
+ * @level: Depth of the RTT within the tree
+ *
+ * Creates an RTT (Realm Translation Table) at the specified level for the
+ * translation of the specified address within the realm.
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_rtt_create(unsigned long rd, unsigned long rtt,
+				  unsigned long ipa, long level)
+{
+	struct arm_smccc_1_2_regs regs = {
+		SMC_RMI_RTT_CREATE, rd, rtt, ipa, level
+	};
+
+	return rmi_sro_execute(&regs);
+}
+
+/**
+ * rmi_rtt_destroy() - Destroy an RTT
+ * @rd: PA of the RD for the target realm
+ * @ipa: Base of the IPA range described by the RTT
+ * @level: RTT level
+ * @out_rtt: Pointer to write the PA of the RTT which was destroyed
+ * @out_top: Pointer to write the top IPA of non-live RTT entries, from entry
+ * at which the RTT walk terminated.
+ *
+ * Destroys an RTT. The RTT must be non-live, i.e. none of the entries in the
+ * table are in ASSIGNED or TABLE state.
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code.
+ */
+static inline long rmi_rtt_destroy(unsigned long rd,
+				   unsigned long ipa,
+				   long level,
+				   unsigned long *out_rtt,
+				   unsigned long *out_top)
+{
+	struct arm_smccc_1_2_regs regs = {
+		SMC_RMI_RTT_DESTROY, rd, ipa, level
+	};
+	long ret = rmi_sro_execute(&regs);
+
+	if (ret == RMI_SUCCESS) {
+		if (out_rtt)
+			*out_rtt = regs.a1;
+		if (out_top)
+			*out_top = regs.a2;
+	}
+
+	return ret;
+}
+
+/**
+ * rmi_rtt_fold() - Fold an RTT
+ * @rd: PA of the RD
+ * @ipa: Base of the IPA range described by the RTT
+ * @level: Depth of the RTT within the tree
+ * @out_rtt: Pointer to write the PA of the RTT which was destroyed
+ *
+ * Folds an RTT. If all entries with the RTT are 'homogeneous' the RTT can be
+ * folded into the parent and the RTT destroyed.
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_rtt_fold(unsigned long rd, unsigned long ipa,
+				long level, unsigned long *out_rtt)
+{
+	struct arm_smccc_1_2_regs regs = {
+		SMC_RMI_RTT_FOLD, rd, ipa, level
+	};
+	long ret = rmi_sro_execute(&regs);
+
+	if (ret == RMI_SUCCESS && out_rtt)
+		*out_rtt = regs.a1;
+
+	return ret;
+}
+
+/**
+ * rmi_rtt_init_ripas() - Set RIPAS for new realm
+ * @rd: PA of the RD
+ * @base: Base of target IPA region
+ * @top: Top of target IPA region
+ * @out_top: Top IPA of range whose RIPAS was modified
+ *
+ * Sets the RIPAS of a target IPA range to RAM, for a realm in the NEW state.
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_rtt_init_ripas(unsigned long rd, unsigned long base,
+				      unsigned long top, unsigned long *out_top)
+{
+	struct arm_smccc_1_2_regs regs = {
+		SMC_RMI_RTT_INIT_RIPAS, rd, base, top
+	};
+	long ret = rmi_sro_execute(&regs);
+
+	if (ret == RMI_SUCCESS && out_top)
+		*out_top = regs.a1;
+
+	return ret;
+}
+
+/**
+ * rmi_rtt_unprot_map() - Map unprotected granules into a realm
+ * @rd: PA of the RD
+ * @base: Base IPA of the mapping
+ * @top: Top of the target IPA range
+ * @flags: Flags
+ * @oaddr: Output address set descriptor
+ * @out_top: Top IPA of range which has been mapped
+ *
+ * Create mappings to memory within a target unprotected IPA range.
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_rtt_unprot_map(unsigned long rd,
+				      unsigned long base,
+				      unsigned long top,
+				      unsigned long flags,
+				      unsigned long oaddr,
+				      unsigned long *out_top)
+{
+	struct arm_smccc_1_2_regs regs = {
+		SMC_RMI_RTT_UNPROT_MAP, rd, base, top, flags, oaddr
+	};
+	long ret = rmi_sro_execute(&regs);
+
+	if (ret == RMI_SUCCESS && out_top)
+		*out_top = regs.a1;
+
+	return ret;
+}
+
+/**
+ * rmi_rtt_set_ripas() - Set RIPAS for an running realm
+ * @rd: PA of the RD
+ * @rec: PA of the REC making the request
+ * @base: Base of target IPA region
+ * @top: Top of target IPA region
+ * @out_top: Pointer to write top IPA of range whose RIPAS was modified
+ *
+ * Completes a request made by the realm to change the RIPAS of a target IPA
+ * range.
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_rtt_set_ripas(unsigned long rd, unsigned long rec,
+				     unsigned long base, unsigned long top,
+				     unsigned long *out_top)
+{
+	struct arm_smccc_1_2_regs regs = {
+		SMC_RMI_RTT_SET_RIPAS, rd, rec, base, top
+	};
+	long ret = rmi_sro_execute(&regs);
+
+	if (ret == RMI_SUCCESS && out_top)
+		*out_top = regs.a1;
+
+	return ret;
+}
+
+/**
+ * rmi_rtt_unprot_unmap() - Remove mappings within an unprotected IPA range
+ * @rd: PA of the RD
+ * @base: Base IPA of the mapping
+ * @top: Top of the target IPA range
+ * @flags: Flags
+ * @oaddr: Output address set descriptor
+ * @out_top: Top IPA which has been unmapped
+ * @out_range: Output address range
+ * @out_count: Number of entries in output address list
+ *
+ * Removes mappings to memory within a target unprotected IPA range.
+ *
+ * Return: 0 on success, positive RMI result code or negative Linux error code
+ */
+static inline long rmi_rtt_unprot_unmap(unsigned long rd,
+					unsigned long base,
+					unsigned long top,
+					unsigned long flags,
+					unsigned long oaddr,
+					unsigned long *out_top,
+					unsigned long *out_range,
+					unsigned long *out_count)
+{
+	struct arm_smccc_1_2_regs regs = {
+		SMC_RMI_RTT_UNPROT_UNMAP, rd, base, top, flags, oaddr
+	};
+	long ret = rmi_sro_execute(&regs);
+
+	if (ret == RMI_SUCCESS) {
+		if (out_top)
+			*out_top = regs.a1;
+		if (out_range)
+			*out_range = regs.a2;
+		if (out_count)
+			*out_count = regs.a3;
+	}
+
+	return ret;
+}
+
 #endif
-- 
2.43.0


