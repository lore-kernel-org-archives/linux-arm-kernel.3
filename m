Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C9CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X02ZOLUPeom9buw2w8ZqgNrrAMgh0Ax/tYhoCMB18bw=; b=N/17u7z4h4R72+ejKqPfIwVO8x
	9n/TmMt1bqIPNNjsoxeEB995rwvGDvY0YBONIE7nNxIpUjFqOIn2tLhPv3w87qG8ahCh6kllS3ER9
	UV94Fh9PY5CXJcfW/XMHAsfThbAQlhS8RGmMtXdmMzlpcHWCc4Lm9CEECB6B1+sNnbwBBbY7Erg6F
	YqpiOncx4051iqtdwLKsJZwz2m9ldCD5+FomqwYBYVMR/sVcspnAifVHLmUVheo2F0sx2C8PGIsoD
	eJmo94yjMV2m5SeM534YsdiWa0I0tJDB5mvHPn5a8ZhWpd9dvDic4BB9Y+dYGIjOmfJeAMer31KT4
	qi/MWMdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCHh-0000000AI0z-0RAK;
	Mon, 16 Dec 2024 14:41:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNC8h-0000000AGrt-3XyP
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Dec 2024 14:32:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=X02ZOLUPeom9buw2w8ZqgNrrAMgh0Ax/tYhoCMB18bw=; b=X+tqYWm48AacWOj3ZPe5kvU1Il
	2b+Y7h2Y1/wJ831/PKVsYYJOSspNODZu4MOjCNhjHesKHXxidqUdmmTFbMecBy2Md9xQ0xexcvh66
	Gzg0t0NXP7ZI6Cw6Ys7UKejLO1TZMMHeD/hNrygXDi16F/lOp0L63tTROjyUQqXl+M0tkf7ClAiRo
	EC/DDV7/JpvMAZRszNROwhRK+6cyPKCSYOuu683Z/N+urwuOKGycMNfA90gKnJxAJmxG5bHWoxvWC
	qhk0rpyzQhMaKNgMjNgIKTXr/dw1Z9/upasqv1hitQVBuKtlrCmcHs80UMNQX6xArE9b6B+6OeQWx
	6WLuOA3g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNC8e-00000004rL1-2DZI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 14:32:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50212113E;
	Mon, 16 Dec 2024 06:32:25 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7D693F58B;
	Mon, 16 Dec 2024 06:31:55 -0800 (PST)
Date: Mon, 16 Dec 2024 14:31:47 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Peter Collingbourne <pcc@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64/sme: Move storage of reg_smidr to
 __cpuinfo_store_cpu()
Message-ID: <Z2A502_EpqvLYN8g@J2N7QTR9R3.cambridge.arm.com>
References: <20241214-arm64-fix-boot-cpu-smidr-v1-1-0745c40772dd@kernel.org>
 <87a5cysfci.wl-maz@kernel.org>
 <709a0e75-0d0c-4bff-b9fd-3bbb55c97bd5@sirena.org.uk>
 <Z2Agntn52mY5bSTp@J2N7QTR9R3>
 <855dbb91-db37-4178-bd0b-511994d3aef7@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <855dbb91-db37-4178-bd0b-511994d3aef7@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_143201_097545_8FEC5039 
X-CRM114-Status: GOOD (  29.27  )
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

On Mon, Dec 16, 2024 at 01:23:55PM +0000, Mark Brown wrote:
> On Mon, Dec 16, 2024 at 12:44:14PM +0000, Mark Rutland wrote:
> 
> > ... didn't matter either way, and using '&boot_cpu_data' was intended to
> > make it clear that the features were based on the boot CPU's info, even
> > if you just grepped for that and didn't see the surrounding context.
> 
> Right, that was my best guess as to what was supposed to be going on
> but it wasn't super clear.  The code could use some more comments.
> 
> > I think the real fix here is to move the reading back into
> > __cpuinfo_store_cpu(), but to have an explicit check that SME has been
> > disabled on the commandline, with a comment explaining that this is a
> > bodge for broken FW which traps the SME ID regs.
> 
> That should be doable.
> 
> There's a few other similar ID registers (eg, we already read GMID_EL1
> and MPAMIDR_EL1) make me a bit nervous that we might need to generalise
> it a bit, but we can deal with that if it comes up.  Even for SME the
> disable was added speculatively, the factors that made this come up for
> SVE are less likely to be an issue with SME.

FWIW, I had a quick go (with only the SME case), and I think the shape
that we want is roughly as below, which I think is easy to generalise to
those other cases.

MarcZ, thoughts?

Mark.

---->8----
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 8b4e5a3cd24c8..f16eb99c10723 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -91,6 +91,16 @@ struct arm64_ftr_override {
 	u64		mask;
 };
 
+static inline u64
+arm64_ftr_override_apply(const struct arm64_ftr_override *override,
+			 u64 val)
+{
+	val &= ~override->mask;
+	val |= override->val & override->mask;
+
+	return val;
+}
+
 /*
  * @arm64_ftr_reg - Feature register
  * @strict_mask		Bits which should match across all CPUs for sanity.
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6ce71f444ed84..faad7d3e4cf5f 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1167,12 +1167,6 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
 	    id_aa64pfr1_sme(read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1))) {
 		unsigned long cpacr = cpacr_save_enable_kernel_sme();
 
-		/*
-		 * We mask out SMPS since even if the hardware
-		 * supports priorities the kernel does not at present
-		 * and we block access to them.
-		 */
-		info->reg_smidr = read_cpuid(SMIDR_EL1) & ~SMIDR_EL1_SMPS;
 		vec_init_vq_map(ARM64_VEC_SME);
 
 		cpacr_restore(cpacr);
@@ -1550,10 +1544,8 @@ u64 __read_sysreg_by_encoding(u32 sys_id)
 	}
 
 	regp  = get_arm64_ftr_reg(sys_id);
-	if (regp) {
-		val &= ~regp->override->mask;
-		val |= (regp->override->val & regp->override->mask);
-	}
+	if (regp)
+		val = arm64_ftr_override_apply(regp->override, val);
 
 	return val;
 }
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index d79e88fccdfce..1460e3541132f 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -439,6 +439,24 @@ static void __cpuinfo_store_cpu_32bit(struct cpuinfo_32bit *info)
 	info->reg_mvfr2 = read_cpuid(MVFR2_EL1);
 }
 
+static void __cpuinfo_store_cpu_sme(struct cpuinfo_arm64 *info)
+{
+	/*
+	 * TODO: explain that this bodge is to avoid trapping.
+	 */
+	u64 pfr1 = info->reg_id_aa64pfr1;
+	pfr1 = arm64_ftr_override_apply(&id_aa64pfr1_override, pfr1);
+	if (!id_aa64pfr1_sme(pfr1))
+		return;
+
+	/*
+	 * We mask out SMPS since even if the hardware
+	 * supports priorities the kernel does not at present
+	 * and we block access to them.
+	 */
+	info->reg_smidr = read_cpuid(SMIDR_EL1) & ~SMIDR_EL1_SMPS;
+}
+
 static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
 {
 	info->reg_cntfrq = arch_timer_get_cntfrq();
@@ -482,6 +500,8 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
 	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
 		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
 
+	__cpuinfo_store_cpu_sme(info);
+
 	cpuinfo_detect_icache_policy(info);
 }
 



