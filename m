Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF80E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChMM4nRYZ9enwACyK2xKbFLONDqUV7poeSzVRRt0NPE=; b=ZSxk9uli3ZvWBPtHLrCeeZBYdx
	vgRQCzGFCC0j2uSBd63xZZ3S6+U5C3pRvco4+7IIr7y41SdnmjCVbY5pjqVd/LeQa6jK2IQwsHBcm
	1w4TTXRZEpQILhanNUQLg/vyeutuzyOLLfSHZ8Cql2RrCMWGmPYUHmKzTDkxmF2zrtjx2H/tSGbEw
	tLvPmUDMWtQ/1cIpkm6YLy8QRJmBbE0RN2OmWojNvI8IIoQzqaMOEZ7kLsBDUTYexiqH+PyN/0k82
	q7bdvTF3npwkBv4jP8Nck5EhpyAaPoJnG+p1n6cuPAyvsacEu+MEQ2aYS/RQ8tgyJTuBeDrSxi/2L
	erSlSb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgPe-00000005Yd0-1Rww;
	Fri, 20 Dec 2024 17:03:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDw-00000005Vxe-0EZN
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Dec 2024 16:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ChMM4nRYZ9enwACyK2xKbFLONDqUV7poeSzVRRt0NPE=; b=CUPc0hzrKr/eLEOfB80dmOKqUd
	XhIxXAOfp6pgZeI9zButEWRf+TD/V9Ps3GNOLx3oPSxor8lbGcoh9onvyRh1XuO75qGuBno0xDBoC
	eC8aiBDGwYmc+yS22aO1oIFaOLcj16M+aRY2NWRtcfVfzKaNumGijJQ3UCreGe1t0zjOkLU+BKTsW
	9f48sNus3NFc8LJjAVql+Gd5JRf2+DyaKy+ZP6n26F/mnDkTlUTYnCIhKqf0+LE/dbej8kXoiYA6x
	37jXNNRi0Ih4pJYMO0CE4BhXksRlk4j4ai487zIX8tL968v98jQn7OyxsDwS8ERTwA7ooEKOc3f4e
	3lvUuRqA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDt-00000005jWh-0x0M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:51:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9EE9AA4202A;
	Fri, 20 Dec 2024 16:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCE2C4CECD;
	Fri, 20 Dec 2024 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734713491;
	bh=2lAEiIWK9uzi24UbNru8zKCgLUdInhjJdDB12WbDPZ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q1dx1hu+4QMc1mfXYgXW5GgGjr1mUzSxYFJgffUwtQmrpsnMXNfGgX8nb11rLLwX4
	 XrwGngKrIFIqsSMFXDHY+DeRYIkvUBxaj7lXGhbESDULbxOFuJP0m2annSQVOaftr6
	 /hnel/AIzS9qfRWSdb0e4LywnwIeogj15u6skZCozHsnbFB5upp0FdfsQid551iBVv
	 ky5aO+ca1oyoNRVkh/T5eu+O8F05tYl87lh8vFqxq6K0e7UrRwyXM2ZgMSmsnPk+vo
	 pmvCYRSDeBpeitZMZfu1C9xvwuRxmh4cksqhwFjs/SPBxZsVfkHIGZM4QyMOJKKLWx
	 V7AuoSMAXwjfg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 20 Dec 2024 16:46:34 +0000
Subject: [PATCH RFC v3 09/27] KVM: arm64: Factor SVE guest exit handling
 out into a function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-kvm-arm64-sme-v3-9-05b018c1ffeb@kernel.org>
References: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
In-Reply-To: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=3607; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2lAEiIWK9uzi24UbNru8zKCgLUdInhjJdDB12WbDPZ8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnZaBb/PNHOdXC2QqIWTml92xipzWpK0C3H1dFAHdq
 34bDHjSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2WgWwAKCRAk1otyXVSH0H5LB/
 47krYQyM/wfFiJzoZcaTezF83TBLhU5DbVnNlFyU3Egm70Ppq11143hsfCVTZd8BQ1p+1iWtkpMWVq
 1BVFdSxpQEeZ8bEmA/oTGLpm+MY3fKmHWviByjr1N6GedW9hPQcxyxVvtZhzu2slXSjRD3RMMYM3PT
 p61lT89WeRN/AIS3wtwEgYzqigpqu8Hlrv3dUDKYf5HnxmOmqdMd/rfu4Scw1D2z9ZnnO7SFSYzXKU
 sBXgBW2jIfIRcfTw5ro3Xe4PuKHVUV5bdAl/5/QzwuPwFRSanXJRr4Wo+zAZtyt324t5mz8Sc8N1E/
 9/cg7CYQeavXMq0CfnAD5jwEHozx9w
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_165133_552545_5ADC070F 
X-CRM114-Status: GOOD (  21.37  )
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

The SVE portion of kvm_vcpu_put() is quite large, especially given the
comments required.  When we add similar handling for SME the function
will get even larger, in order to keep things managable factor the SVE
portion out of the main kvm_vcpu_put().

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/fpsimd.c | 67 +++++++++++++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 09b65abaf9db60cc57dbc554ad2108a80c2dc46b..3c2e0b96877ac5b4f3b9d8dfa38975f11b74b60d 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -151,6 +151,41 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
 	}
 }
 
+static void kvm_vcpu_put_sve(struct kvm_vcpu *vcpu)
+{
+	u64 zcr;
+
+	if (!vcpu_has_sve(vcpu))
+		return;
+
+	zcr = read_sysreg_el1(SYS_ZCR);
+
+	/*
+	 * If the vCPU is in the hyp context then ZCR_EL1 is loaded
+	 * with its vEL2 counterpart.
+	 */
+	__vcpu_sys_reg(vcpu, vcpu_sve_zcr_elx(vcpu)) = zcr;
+
+	/*
+	 * Restore the VL that was saved when bound to the CPU, which
+	 * is the maximum VL for the guest. Because the layout of the
+	 * data when saving the sve state depends on the VL, we need
+	 * to use a consistent (i.e., the maximum) VL.  Note that this
+	 * means that at guest exit ZCR_EL1 is not necessarily the
+	 * same as on guest entry.
+	 *
+	 * ZCR_EL2 holds the guest hypervisor's VL when running a
+	 * nested guest, which could be smaller than the max for the
+	 * vCPU. Similar to above, we first need to switch to a VL
+	 * consistent with the layout of the vCPU's SVE state. KVM
+	 * support for NV implies VHE, so using the ZCR_EL1 alias is
+	 * safe.
+	 */
+	if (!has_vhe() || (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)))
+		sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1,
+				       SYS_ZCR_EL1);
+}
+
 /*
  * Write back the vcpu FPSIMD regs if they are dirty, and invalidate the
  * cpu FPSIMD regs so that they can't be spuriously reused if this vcpu
@@ -179,38 +214,10 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
 	}
 
 	if (guest_owns_fp_regs()) {
-		if (vcpu_has_sve(vcpu)) {
-			u64 zcr = read_sysreg_el1(SYS_ZCR);
-
-			/*
-			 * If the vCPU is in the hyp context then ZCR_EL1 is
-			 * loaded with its vEL2 counterpart.
-			 */
-			__vcpu_sys_reg(vcpu, vcpu_sve_zcr_elx(vcpu)) = zcr;
-
-			/*
-			 * Restore the VL that was saved when bound to the CPU,
-			 * which is the maximum VL for the guest. Because the
-			 * layout of the data when saving the sve state depends
-			 * on the VL, we need to use a consistent (i.e., the
-			 * maximum) VL.
-			 * Note that this means that at guest exit ZCR_EL1 is
-			 * not necessarily the same as on guest entry.
-			 *
-			 * ZCR_EL2 holds the guest hypervisor's VL when running
-			 * a nested guest, which could be smaller than the
-			 * max for the vCPU. Similar to above, we first need to
-			 * switch to a VL consistent with the layout of the
-			 * vCPU's SVE state. KVM support for NV implies VHE, so
-			 * using the ZCR_EL1 alias is safe.
-			 */
-			if (!has_vhe() || (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)))
-				sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1,
-						       SYS_ZCR_EL1);
-		}
+		kvm_vcpu_put_sve(vcpu);
 
 		/*
-		 * Flush (save and invalidate) the fpsimd/sve state so that if
+		 * Flush (save and invalidate) the FP state so that if
 		 * the host tries to use fpsimd/sve, it's not using stale data
 		 * from the guest.
 		 *

-- 
2.39.5


