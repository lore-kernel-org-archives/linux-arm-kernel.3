Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A310C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeQXcS3pEHXKPjpS1aBvSo5HEPQatvaCcC9yZ+tXu5k=; b=vwKEI4+WzUYXqeNNVZytDoY3Fs
	H/cPQUK6jfMvO8U30GYGjLzos0rPmSk+crzgVsAOf/EDZ8g6RaGbJar53dU+q4r+Iw3046+Xzt/iC
	bQAA4defO+0nuAb+n9YUAy7iXXwr5PoDiHDy5fc5E2ZHPp8jYa9LqvvGh9Pn4ukHiYgKkvMPEyku2
	Ys91xx/UJp+3wOGfPcD1M6Oa7jD6ZJx2JNSGP7z4Nam19Gwvzy81tfttehVBi/N7DtSEcPFFTeavq
	r/tTMwsyqgZX0CPtkBAG8SXdLvYzaWHC6jTpQbMHhg0ENc0o7LvsvXGZ9opdxZ1XqYxBKT6NxFzPi
	eryCCnOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQdA-000000090Rq-2tZZ;
	Tue, 18 Feb 2025 16:39:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQYe-00000008zcF-1C3K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 16:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739896491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NeQXcS3pEHXKPjpS1aBvSo5HEPQatvaCcC9yZ+tXu5k=;
	b=EB5AY1OlGGXUjRN54smarfmdWmFM5mi139/Gmy30QyK8VzHIIexxJqkCNDhzviuQ9P2RWV
	1dHqQng/syHPSwcUq6IvpiADNHD76zZ76pDpRZ6OyPGssfcq+OHtlQ9chl1iIMFDSqSPto
	JEgPPdhHYfe8XFH1xwnvxanY67S9ux0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-1e-psdybMm-QfsIZkgyjSA-1; Tue, 18 Feb 2025 11:34:49 -0500
X-MC-Unique: 1e-psdybMm-QfsIZkgyjSA-1
X-Mimecast-MFC-AGG-ID: 1e-psdybMm-QfsIZkgyjSA_1739896488
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4393e89e910so30365335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 08:34:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739896488; x=1740501288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NeQXcS3pEHXKPjpS1aBvSo5HEPQatvaCcC9yZ+tXu5k=;
        b=G4E6rZSpM+N30tCPpR++3dxIAbVbcvyMHTM9dmOjYT6AYcm4S16W4aOtsTyWdywfC3
         1s2idBJ7xP5gRZr2ReKZb5YMEEfeqIiSsxDSJ5+dGVXUy+/gyN+1Sqa3zzJIw0ZjlmzK
         G0w+mUcE08DOjF4t/HSRzkR1BAw1eq12kpLO5d8z9l17rVcdOfGiMgRAJMgj33rABnUK
         kTXV/QO0LfaCn12K1UPoGBZ02TujLh/sfN6rKyoCv01p46NLmVJc/0RxHtm6ex9PgkJI
         MERnlsZq2Idm3ZcqAoXr2FdOw2iaQDYh9MM/nUzG9TEtSWgrmqJP6Oi5RKyJqGXRj0KP
         3gHg==
X-Forwarded-Encrypted: i=1; AJvYcCUKjtZvcgrqGpJ9RJ5jGvPajtHODeiLY6cYC2ZHODXO59Tk/y4CAy3GlN7pT74go9JjWfBo266MhfFJno5O2UTZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyPIPfpDPYvP/ikwbVuWQPGUsh93e3TLP23il9Lhk2GpzSbEL6i
	/PKGybAWazdjg0VEHjZeyXqTp1n17TiMkOJsHSKkCbaPzflraFYxPxK7Odr9MIjKNJK9FxBH/an
	N5X+ouYAe5YSdHcJ5jjpbKVZctMX7eTPfR1Lq/E8lrR1QoSQwsVtytpXs5Lzf6lutc7zW9jHo
X-Gm-Gg: ASbGncvZ6so1MCIu9LCD211cNaPGbKS6FqMI05qNwFl4m+rHzb5AZ166kYAtiuHUA19
	uwhq7bqW/H77ePctLnU/++FtF3EkR9e5KdyS3RaM9hRC8G2Ydh6THCS580hDR8/b/TQSJO8JGZB
	OqUtuZ3K+hH0BWR681zVQZ+3O8zryaMoQwxFbUKZGJjPPVnR7CovujBgUtLr7h+ViUO58MIojha
	HyEtM7tC/JS2cdaZafMW68kCgxL0kKwT730zk18Zy/+BOvqC0U8xUnYbUvQqFFv4SiAB0DVim7A
	+IWONXoKvcOedeZkd4BzB24Le1dLzSOj9jkkm1I7QrvAi4Z/xVjFBYtHOXrIMpTgniLW
X-Received: by 2002:a05:600c:1c86:b0:439:9863:e876 with SMTP id 5b1f17b1804b1-4399863e985mr12624725e9.24.1739896488303;
        Tue, 18 Feb 2025 08:34:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhjzSey7Os9gD/9cBHHf8QXaWprjYC5klxAlQo6nfv7hgprgS0BPQtKhe2iSIdbXKsawM7OA==
X-Received: by 2002:a05:600c:1c86:b0:439:9863:e876 with SMTP id 5b1f17b1804b1-4399863e985mr12624455e9.24.1739896487978;
        Tue, 18 Feb 2025 08:34:47 -0800 (PST)
Received: from rh.redhat.com (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4396b5267eesm85091845e9.0.2025.02.18.08.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 08:34:46 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] KVM: arm64: Allow userspace to change REVIDR_EL1
Date: Tue, 18 Feb 2025 17:34:41 +0100
Message-ID: <20250218163443.32836-3-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218163443.32836-1-sebott@redhat.com>
References: <20250218163443.32836-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 77qfmXys6Wlr9x65byvmcpXFs8UX6kWu_JM8-9wM6nM_1739896488
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_083452_398510_DE6DCE80 
X-CRM114-Status: GOOD (  15.85  )
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

Enable VMMs to write REVIDR_EL1 by treating it as a VM ID register.
Trap guest access of REVIDR_EL1 when the VMs value differs from hardware.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h |  3 +++
 arch/arm64/kvm/sys_regs.c         | 11 ++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3db8c773339e..c8fba4111b77 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -374,6 +374,7 @@ struct kvm_arch {
 	u64 id_regs[KVM_ARM_ID_REG_NUM];
 
 	u64 midr_el1;
+	u64 revidr_el1;
 	u64 ctr_el0;
 
 	/* Masks for VNCR-backed and general EL2 sysregs */
@@ -1472,6 +1473,8 @@ static inline u64 *__vm_id_reg(struct kvm_arch *ka, u32 reg)
 		return &ka->id_regs[IDREG_IDX(reg)];
 	case SYS_MIDR_EL1:
 		return &ka->midr_el1;
+	case SYS_REVIDR_EL1:
+		return &ka->revidr_el1;
 	case SYS_CTR_EL0:
 		return &ka->ctr_el0;
 	default:
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 3cd4dfdd287a..c12fd91574ab 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1666,7 +1666,8 @@ static bool is_feature_id_reg(u32 encoding)
  */
 static inline bool is_vm_ftr_id_reg(u32 id)
 {
-	if (id == SYS_CTR_EL0 || id == SYS_MIDR_EL1)
+	if (id == SYS_CTR_EL0 || id == SYS_MIDR_EL1 ||
+	    id == SYS_REVIDR_EL1)
 		return true;
 
 	return (sys_reg_Op0(id) == 3 && sys_reg_Op1(id) == 0 &&
@@ -2528,6 +2529,7 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
 	}
 
 FUNCTION_RESET(midr_el1)
+FUNCTION_RESET(revidr_el1)
 
 
 /*
@@ -2581,6 +2583,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ ID_DESC(MIDR_EL1), .set_user = set_id_reg_non_ftr, .visibility = id_visibility,
 	  .reset = reset_midr_el1, .val = GENMASK_ULL(31, 0) },
 	{ SYS_DESC(SYS_MPIDR_EL1), NULL, reset_mpidr, MPIDR_EL1 },
+	{ ID_DESC(REVIDR_EL1), .set_user = set_id_reg_non_ftr, .visibility = id_visibility,
+	  .reset = reset_revidr_el1, .val = -1ULL },
 
 	/*
 	 * ID regs: all ID_SANITISED() entries here must have corresponding
@@ -4632,12 +4636,10 @@ id_to_sys_reg_desc(struct kvm_vcpu *vcpu, u64 id,
 		return ((struct sys_reg_desc *)r)->val;			\
 	}
 
-FUNCTION_INVARIANT(revidr_el1)
 FUNCTION_INVARIANT(aidr_el1)
 
 /* ->val is filled in by kvm_sys_reg_table_init() */
 static struct sys_reg_desc invariant_sys_regs[] __ro_after_init = {
-	{ SYS_DESC(SYS_REVIDR_EL1), NULL, reset_revidr_el1 },
 	{ SYS_DESC(SYS_AIDR_EL1), NULL, reset_aidr_el1 },
 };
 
@@ -4985,6 +4987,9 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
 	else
 		vcpu->arch.hcr_el2 |= HCR_TID2;
 
+	if (kvm_read_vm_id_reg(kvm, SYS_REVIDR_EL1) != read_sysreg(REVIDR_EL1))
+		vcpu->arch.hcr_el2 |= HCR_TID1;
+
 	if (vcpu_el1_is_32bit(vcpu))
 		vcpu->arch.hcr_el2 &= ~HCR_RW;
 
-- 
2.42.0


