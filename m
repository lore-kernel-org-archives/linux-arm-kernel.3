Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AABC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 00:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBjnKoZUU2wKOtdx8Pfb/eQmSHN8+laJLZ5ZbuhVRdY=; b=HCCIFoSTFuwQV82TIa6e3jigv0
	jFQyhvkD3crW6QbpNpQ1+PnFjE2q+U4l33/0SWKg2iU6gy6Agf2UVhIPYKRifVQnKG6+MzBgdUqUK
	nrCuMQR1aNUnycXjv5ozp8s5EEPEVIOt+Z8nFNxRz4hL3wW5lAVe7+Om8TIDjTax8lr7xBU8TuEiB
	8iYNP7NTqqwJutYZpfO7kNBDnY/4aWzvQOj2iqunRQ88pqGxtvv5ZO3L/lH6QjoBon9VP8GarNLSH
	S1Ok2qdSTX3Qhxx6nneVqGDQYBrekmUoKRHXMsSljZ3EJ8UPhSFb0vq6A9f3Lb0LNYew2do0pw2OE
	6/KZBlAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5DT6-0000000BMoj-1HWT;
	Thu, 17 Apr 2025 00:51:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5D5J-0000000BGy9-4C2O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 00:26:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 76F2F5C20FE;
	Thu, 17 Apr 2025 00:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F318EC4CEEC;
	Thu, 17 Apr 2025 00:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744849589;
	bh=W9U/EIqt1ZpD/AI0aRJHQ2z1yafgwHeiK/I9nw34e+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XZB1ePwAD4xn+kJoCzFpd9PuTtr6S5KPxV1NdK5h9rwlIB1fu5BOjaSBoMLeoFljC
	 d3hoM788Nb2Q+znfBYo4J6DY7y81WsdY+s7T9yORk++gvuL6ynpUsZPVfUE8aYIe17
	 /SiZPeyr00dmOmuwOsBZlignpz70ACSVrF61s+Dg5sgauSXzyjis7sSg2mdR5yChuM
	 mieHx3FL76zZvMhquRJwjoUQRUdp4le58Y+M+/7N0alMge8/YXpohKgTZfZwp75AcQ
	 1b9woftk7JTlKNLalyIPwAzViDxFF1psLyyfseKG2pxHmpagbnFHMU+M/qgRi7CdXq
	 eLtRvkvHIQr0g==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Apr 2025 01:25:16 +0100
Subject: [PATCH v5 12/28] KVM: arm64: Rename sve_state_reg_region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-kvm-arm64-sme-v5-12-f469a2d5f574@kernel.org>
References: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
In-Reply-To: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352; i=broonie@kernel.org;
 h=from:subject:message-id; bh=W9U/EIqt1ZpD/AI0aRJHQ2z1yafgwHeiK/I9nw34e+w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoAEp4aYB+lTSBEvBGlKqa5ArcHrjS9+NUYvf34HDS
 cs96KduJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaABKeAAKCRAk1otyXVSH0IxnB/
 oDVpFjTwsx42rNNBW7KDL0zDS+LJuIuMIdcu0iQzS3p6e6NkHvYdCO4fht5WtwUKx+dquGFKVQc5af
 DXiz4X8MJ4NbvNT7t1dMMrJIVYg5rcVqj3h2EXiw7HxLT9Au/UdbwfwZlLzbNs8dk+JKGfcg5piFig
 WLlJoOys7FyombKnLbu/Vz2KqHF5s8mIL0orW/zYKSf0iZfOM5R0AQbxlNVzckUcTAzfWzh6CP6XZI
 GMHWMx9RdUdUFuRXJIgJeCfpy797RhiTnFcO4vHoa0vavS9oNL+tqKluCpfKYyVENkUXF/tEFqEOQ7
 IHZBdPE+BY7TnXf5jCQPFrxg9EgSVb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_172630_128134_1EDF8673 
X-CRM114-Status: GOOD (  13.90  )
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

As for SVE we will need to pull parts of dynamically sized registers out of
a block of memory for SME so we will use a similar code pattern for this.
Rename the current struct sve_state_reg_region in preparation for this.

No functional change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/guest.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 73e714133bb6..bb4b91e43923 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -404,9 +404,9 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
  */
 #define vcpu_sve_slices(vcpu) 1
 
-/* Bounds of a single SVE register slice within vcpu->arch.sve_state */
-struct sve_state_reg_region {
-	unsigned int koffset;	/* offset into sve_state in kernel memory */
+/* Bounds of a single register slice within vcpu->arch.s[mv]e_state */
+struct vec_state_reg_region {
+	unsigned int koffset;	/* offset into s[mv]e_state in kernel memory */
 	unsigned int klen;	/* length in kernel memory */
 	unsigned int upad;	/* extra trailing padding in user memory */
 };
@@ -415,7 +415,7 @@ struct sve_state_reg_region {
  * Validate SVE register ID and get sanitised bounds for user/kernel SVE
  * register copy
  */
-static int sve_reg_to_region(struct sve_state_reg_region *region,
+static int sve_reg_to_region(struct vec_state_reg_region *region,
 			     struct kvm_vcpu *vcpu,
 			     const struct kvm_one_reg *reg)
 {
@@ -485,7 +485,7 @@ static int sve_reg_to_region(struct sve_state_reg_region *region,
 static int get_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
 	int ret;
-	struct sve_state_reg_region region;
+	struct vec_state_reg_region region;
 	char __user *uptr = (char __user *)reg->addr;
 
 	/* Handle the KVM_REG_ARM64_SVE_VLS pseudo-reg as a special case: */
@@ -511,7 +511,7 @@ static int get_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 static int set_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
 	int ret;
-	struct sve_state_reg_region region;
+	struct vec_state_reg_region region;
 	const char __user *uptr = (const char __user *)reg->addr;
 
 	/* Handle the KVM_REG_ARM64_SVE_VLS pseudo-reg as a special case: */

-- 
2.39.5


