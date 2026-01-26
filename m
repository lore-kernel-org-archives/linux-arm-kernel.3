Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C52CF65F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onjDqlTOMWI8ZHCwAMNlWqocnMp1H7tfe//+SWdg78g=; b=jZp3uosXPYJpHRpnaaGE5cB6tq
	HKJOdfs9fpXZkKhE66sr6hp+BBVSVy5Smm7fDHVDsIp8E5I0W0+waHM6X/IWpST3U3Mdg1xd2RyCG
	avVtTMa6sVbgazGbiW1Ckq9bzaedTdbpcbSrSpyQP3V0OjYZ6VzjYfnhbXZFPZvDTGGGroEhN0kPZ
	/xVq0xWNReW58/OT7ht27rSQ89EML8GC153UK2rs+QSJWGMccimKkTi+k1ocHhAV3ROEqC54QSF+U
	GW+eod9mxMBFgHgIFFLcEt7SEgKRUekSeOR9ojc8/cS3HxNnPA5xC9Lk5HJMWKoMbpv6OENSXEPro
	M/zyYSag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXY-0000000CVE6-2ErF;
	Mon, 26 Jan 2026 12:17:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXG-0000000CUwP-23x9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A98C44426;
	Mon, 26 Jan 2026 12:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093AAC116C6;
	Mon, 26 Jan 2026 12:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429858;
	bh=rJgheB6THcstxt2wbh5QI4RzkAO+EKvuEAN0WWCmPRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KxYqgDIvPwCgbKnPAopDR2//Jz9pVsvT5YHWC738jTDv4KBhEAyrwcrY/NyqNNJOA
	 KUHBstcoKcMAdw6bGLLDK+mgfbJMd4nF6ew6cxdXvGv/KwM6ilQwhjr3j4SLSLJj+/
	 nuHt7kh9EpaEJ2kKQkt949FoyRmYnFNsEV7MbnNOycVyIolEhAp43rgfPEvteYHJCN
	 bi1cPvc7dRaiEO9gCF1hl4toIe/Sd7pubnURSoyovO38m7LkhQGpS3KmsnS02NG1C3
	 Q3xtsDgoTEwHdOh8NpDj6WXzpRweM4FwqfwI+h4RQXyQP6MuoF4PJYc7eK/kTdXPqS
	 BgRQqAajx4Pog==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkLXE-00000005hx6-1DLf;
	Mon, 26 Jan 2026 12:17:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 20/20] KVM: arm64: Add debugfs file dumping computed RESx values
Date: Mon, 26 Jan 2026 12:16:54 +0000
Message-ID: <20260126121655.1641736-21-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126121655.1641736-1-maz@kernel.org>
References: <20260126121655.1641736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_041738_597954_6CC196E9 
X-CRM114-Status: GOOD (  16.04  )
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

Computing RESx values is hard. Verifying that they are correct is
harder. Add a debugfs file called "resx" that will dump all the RESx
values for a given VM.

I found it useful, maybe you will too.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/kvm/sys_regs.c         | 98 +++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index c82b071ade2a5..54072f6ec9d4b 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -375,6 +375,7 @@ struct kvm_arch {
 
 	/* Iterator for idreg debugfs */
 	u8	idreg_debugfs_iter;
+	u16	sr_resx_iter;
 
 	/* Hypercall features firmware registers' descriptor */
 	struct kvm_smccc_features smccc_feat;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 88a57ca36d96c..f3f92b489b588 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5090,12 +5090,110 @@ static const struct seq_operations idregs_debug_sops = {
 
 DEFINE_SEQ_ATTRIBUTE(idregs_debug);
 
+static const struct sys_reg_desc *sr_resx_find(struct kvm *kvm, u16 pos)
+{
+	unsigned long i, sr_idx = 0;
+
+	for (i = 0; i < ARRAY_SIZE(sys_reg_descs); i++) {
+		const struct sys_reg_desc *r = &sys_reg_descs[i];
+
+		if (r->reg < __SANITISED_REG_START__)
+			continue;
+
+		if (sr_idx == pos)
+			return r;
+
+		sr_idx++;
+	}
+
+	return NULL;
+}
+
+static void *sr_resx_start(struct seq_file *s, loff_t *pos)
+{
+	struct kvm *kvm = s->private;
+	u16 *iter;
+
+	guard(mutex)(&kvm->arch.config_lock);
+
+	if (!kvm->arch.sysreg_masks)
+		return NULL;
+
+	iter = &kvm->arch.sr_resx_iter;
+	if (*iter != (u16)~0)
+		return ERR_PTR(-EBUSY);
+
+	*iter = *pos;
+	if (!sr_resx_find(kvm, *iter))
+		iter = NULL;
+
+	return iter;
+}
+
+static void *sr_resx_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	struct kvm *kvm = s->private;
+
+	(*pos)++;
+
+	if (sr_resx_find(kvm, kvm->arch.sr_resx_iter + 1)) {
+		kvm->arch.sr_resx_iter++;
+
+		return &kvm->arch.sr_resx_iter;
+	}
+
+	return NULL;
+}
+
+static void sr_resx_stop(struct seq_file *s, void *v)
+{
+	struct kvm *kvm = s->private;
+
+	if (IS_ERR(v))
+		return;
+
+	guard(mutex)(&kvm->arch.config_lock);
+
+	kvm->arch.sr_resx_iter = ~0;
+}
+
+static int sr_resx_show(struct seq_file *s, void *v)
+{
+	const struct sys_reg_desc *desc;
+	struct kvm *kvm = s->private;
+	struct resx resx;
+
+	desc = sr_resx_find(kvm, kvm->arch.sr_resx_iter);
+
+	if (!desc->name)
+		return 0;
+
+	resx = kvm_get_sysreg_resx(kvm, desc->reg);
+
+	seq_printf(s, "%20s:\tRES0:%016llx\tRES1:%016llx\n",
+		   desc->name, resx.res0, resx.res1);
+
+	return 0;
+}
+
+static const struct seq_operations sr_resx_sops = {
+	.start	= sr_resx_start,
+	.next	= sr_resx_next,
+	.stop	= sr_resx_stop,
+	.show	= sr_resx_show,
+};
+
+DEFINE_SEQ_ATTRIBUTE(sr_resx);
+
 void kvm_sys_regs_create_debugfs(struct kvm *kvm)
 {
 	kvm->arch.idreg_debugfs_iter = ~0;
+	kvm->arch.sr_resx_iter = ~0;
 
 	debugfs_create_file("idregs", 0444, kvm->debugfs_dentry, kvm,
 			    &idregs_debug_fops);
+	debugfs_create_file("resx", 0444, kvm->debugfs_dentry, kvm,
+			    &sr_resx_fops);
 }
 
 static void reset_vm_ftr_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *reg)
-- 
2.47.3


