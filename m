Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6CCC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdghYHu234rwHRoSlAkfrkrUKfnT4YJfki186RS5/GU=; b=MnUeMIO8pPGpqn3N+q69Uo84aj
	0pS7SYb8cS0YlI8rN6nx6iKKBMYmzTCt/aJS+PdRZjGV9pqc5+M/Zq9lF3P4m2Ujwg1T6iAVvh4u6
	a4dHQKGwi7ovrnBIDg9Xpgu1FyZMbITY1O8FAqB1UAFQ1SdOBzSaiffYO3wd6Ehw7EkRFNpEzhGzU
	IgDf9yGITpj6dKChy4s1hhec/B6GC9/gcLfYoZRx62+1/F36zI5K/77Smw4zlV+4pvay+Sgy5AjuB
	iCTDZ/9d8BTG1Q0A/DJ5gsYmecTpkz251/lezeZ7Gr2TTRSkshM6NdnGUbyE3uNk0dvn5Pq5morXt
	UEpNJgOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrXk-00000004B9v-1ru7;
	Tue, 11 Feb 2025 14:47:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thrQ1-000000049Yi-1Jbv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 14:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739284760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RdghYHu234rwHRoSlAkfrkrUKfnT4YJfki186RS5/GU=;
	b=fCaj9jyUZN5lXpUm3DBY+R/LxdTx7XBoTw9fj7BLaYn9aJek+4Hsq2C+s4u2sNWhSbxrsg
	bX2RJs7atVkMbtb3u9GQXc8khxjN6KHQahnXNTShGiQbNaDhXdApeQBB0kcXMKBo15gL2J
	pZygIREgdrqRzNDzFVohBWyOU36V4TA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-Lq-NBZUbMT-JVuy_W5_uaw-1; Tue, 11 Feb 2025 09:39:19 -0500
X-MC-Unique: Lq-NBZUbMT-JVuy_W5_uaw-1
X-Mimecast-MFC-AGG-ID: Lq-NBZUbMT-JVuy_W5_uaw
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38dc6aad9f8so2232503f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 06:39:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284757; x=1739889557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdghYHu234rwHRoSlAkfrkrUKfnT4YJfki186RS5/GU=;
        b=b/CTV1W8HDKFVXlXoO1yKaVuiS/CPZZcwCjO0Y8sqw5NhrfwtI6StNStD54Buqpxjb
         DN7QOomP+7U90jIRVIf+Lqv0QweX7mGbiFCCEw+BT2F71xts6OxB9NRToquTb0cGzf5u
         ta6DKU/6MX0gP5AYgNrzkJXFuTaHkJpO/SiJ+EQN4AF6MKiOxE9FFP6DIpjS/E52We4K
         GDnbzCI37UxiR2OeRV/zR+pI5vvBBhyBF17zFfMRf5Fv7JGxiJfhRlqpt46aXNUU2Yto
         /5BPT5ZTtSjwMyVtlEEvkcfSHECAB1VBucmFHaBK9iHG6rvOCTya/2RaNofm1Et7ixid
         f3Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWzODg1LsR+Nr36fTKCcl7CEOGynHMyErN4SK5oo/a7dTYJfvWTl80d+OQFuiG9+/Ewqi7eZ1Mf/3Xb57QarfX6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzv/ptriktr9Gkz3PYTeUnB+19lTxROb9q+gy49Dwe0X71Ta37
	Sex2qImTzjgUo8shy0AV+O9+MioELEAsLPhiJB+HKwn6jAHvunKbQsibkA6wdWX/i6gKWL6js+m
	6efmRGVejj2cyXjUP+3pKWtwi/nvwNGnh61PjGyTT01Urzre53gl2yd3HBwQYawbbSW20w2xn
X-Gm-Gg: ASbGnct2T2GqTIaurWTohOX8ryFsyYqHVwf95TT3O4Ie1bUai3G7EWQO2Jqc0SgfJxl
	xqDOvIldeRS7UMMictZYGN3elbNpBNtWrqyVZuHiFQIbaX3Tvhe0Q5FzcE+xHUx4Y3dI3skeTZ7
	e3mb7ewDB5etry6fn/ev5GoMhgpOQTGgF5kWgpUKmtSmz9YNXezHVB2PvDgGYHlFw6Ishu7EN0/
	FOfMOXMfwtFVIe8tvHk1lyyXQLHf7+1xiSeBoxSGITmUcmHPYDD94+6619B+meKUn0HxTe+ab89
	ntmLA5oVOj1HUYi7B5qFsL+lutCY151zrYr5yxmCCRWKo3THtX7J6rXyuq6OYv4bamY=
X-Received: by 2002:a5d:648b:0:b0:38d:e259:4d10 with SMTP id ffacd0b85a97d-38de43aa5cfmr3602451f8f.13.1739284757119;
        Tue, 11 Feb 2025 06:39:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRoa6TpHpYjazCGXAA0zdDPm62ZyWpFuSI/jEW82VolHbg/Poh9pR7FaZIHb0wfaUNxzC+rg==
X-Received: by 2002:a5d:648b:0:b0:38d:e259:4d10 with SMTP id ffacd0b85a97d-38de43aa5cfmr3602425f8f.13.1739284756792;
        Tue, 11 Feb 2025 06:39:16 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcc9bd251sm11745833f8f.9.2025.02.11.06.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:39:16 -0800 (PST)
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
Subject: [PATCH v2 4/4] KVM: selftests: arm64: Test writes to MIDR,REVIDR,AIDR
Date: Tue, 11 Feb 2025 15:39:10 +0100
Message-ID: <20250211143910.16775-5-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211143910.16775-1-sebott@redhat.com>
References: <20250211143910.16775-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jsPNj2hHEUu3S7SZGeLCeF58wOntt9ujEDeqk2soxWg_1739284757
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_063921_427603_1AABF99C 
X-CRM114-Status: GOOD (  12.17  )
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

Assert that MIDR_EL1, REVIDR_EL1, AIDR_EL1 are writable from userspace,
that the changed values are visible to guests, and that they are
preserved across a vCPU reset.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 .../testing/selftests/kvm/arm64/set_id_regs.c | 32 +++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 217541fe6536..d719c2ab1e31 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -230,6 +230,9 @@ static void guest_code(void)
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR2_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64ZFR0_EL1);
 	GUEST_REG_SYNC(SYS_CTR_EL0);
+	GUEST_REG_SYNC(SYS_MIDR_EL1);
+	GUEST_REG_SYNC(SYS_REVIDR_EL1);
+	GUEST_REG_SYNC(SYS_AIDR_EL1);
 
 	GUEST_DONE();
 }
@@ -609,18 +612,31 @@ static void test_ctr(struct kvm_vcpu *vcpu)
 	test_reg_vals[encoding_to_range_idx(SYS_CTR_EL0)] = ctr;
 }
 
-static void test_vcpu_ftr_id_regs(struct kvm_vcpu *vcpu)
+static void test_id_reg(struct kvm_vcpu *vcpu, u32 id)
 {
 	u64 val;
 
+	val = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(id));
+	val++;
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(id), val);
+	test_reg_vals[encoding_to_range_idx(id)] = val;
+}
+
+static void test_vcpu_ftr_id_regs(struct kvm_vcpu *vcpu)
+{
 	test_clidr(vcpu);
 	test_ctr(vcpu);
 
-	val = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MPIDR_EL1));
-	val++;
-	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MPIDR_EL1), val);
+	test_id_reg(vcpu, SYS_MPIDR_EL1);
+	ksft_test_result_pass("%s\n", __func__);
+}
+
+static void test_vcpu_non_ftr_id_regs(struct kvm_vcpu *vcpu)
+{
+	test_id_reg(vcpu, SYS_MIDR_EL1);
+	test_id_reg(vcpu, SYS_REVIDR_EL1);
+	test_id_reg(vcpu, SYS_AIDR_EL1);
 
-	test_reg_vals[encoding_to_range_idx(SYS_MPIDR_EL1)] = val;
 	ksft_test_result_pass("%s\n", __func__);
 }
 
@@ -647,6 +663,9 @@ static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
 	test_assert_id_reg_unchanged(vcpu, SYS_MPIDR_EL1);
 	test_assert_id_reg_unchanged(vcpu, SYS_CLIDR_EL1);
 	test_assert_id_reg_unchanged(vcpu, SYS_CTR_EL0);
+	test_assert_id_reg_unchanged(vcpu, SYS_MIDR_EL1);
+	test_assert_id_reg_unchanged(vcpu, SYS_REVIDR_EL1);
+	test_assert_id_reg_unchanged(vcpu, SYS_AIDR_EL1);
 
 	ksft_test_result_pass("%s\n", __func__);
 }
@@ -675,13 +694,14 @@ int main(void)
 		   ARRAY_SIZE(ftr_id_aa64isar2_el1) + ARRAY_SIZE(ftr_id_aa64pfr0_el1) +
 		   ARRAY_SIZE(ftr_id_aa64pfr1_el1) + ARRAY_SIZE(ftr_id_aa64mmfr0_el1) +
 		   ARRAY_SIZE(ftr_id_aa64mmfr1_el1) + ARRAY_SIZE(ftr_id_aa64mmfr2_el1) +
-		   ARRAY_SIZE(ftr_id_aa64zfr0_el1) - ARRAY_SIZE(test_regs) + 2 +
+		   ARRAY_SIZE(ftr_id_aa64zfr0_el1) - ARRAY_SIZE(test_regs) + 3 +
 		   MPAM_IDREG_TEST;
 
 	ksft_set_plan(test_cnt);
 
 	test_vm_ftr_id_regs(vcpu, aarch64_only);
 	test_vcpu_ftr_id_regs(vcpu);
+	test_vcpu_non_ftr_id_regs(vcpu);
 	test_user_set_mpam_reg(vcpu);
 
 	test_guest_reg_read(vcpu);
-- 
2.42.0


