Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5B4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUBzcP2SeBF3RR/M25RSGM44FYTD6oCe6SMuXYscDz8=; b=kxTVbThBApfy39M6YqNr+mk5fo
	YGeN0eoLvouN+Dbucs0CB3ItTr6eyukItbjEuhq85erJaA3yytJPCPapxqxTIhCKvYD9kKcR+/a5U
	jtmfFW9g7j9XD94B7v2hUwE/wU5wh9wOsm9iPy+N347uxKRyqgZm8qaDZuMe6B3gPK1TN1ePXgPfZ
	T7OCne9xhg9lo8UbyxR8NrLmbe92kxiSxDtIhA7yqKrdgrbvMIf9JYp3bzcPPQgZvuO/Qu82gp5pM
	lt0yisrCZvY4ogDHETZjsyU3Sp5KsZO8sY2zEgFNqlBEYbOoQdoKndSvsHNsuwxQmbm5FsKHM+33G
	4SzxDPng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgU8-00000005ZSi-3iY3;
	Fri, 20 Dec 2024 17:08:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgE7-00000005Vzy-3q2x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:51:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99678A42021;
	Fri, 20 Dec 2024 16:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F7FC4CEDE;
	Fri, 20 Dec 2024 16:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734713506;
	bh=UbPAO2RjCbS5UdMd6M1SYfFSDmJ+s49CndGfTDSD4Tg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qVIUMkZ2FTeYFFW6MzulXykk/p6vUYIuFCiTtX1PTCRXOJd5AFNunEsurBUu++y7J
	 xfsfagZ2OLab8zRFcKJporZxAKrl63777HR6iOLKuiXGKWwnpNAU9pLEYtUpovTG4+
	 X7SEHmlsZ6A9Mab8h3eRsdN0/dsAhuNafPiYubis834JW540tzWX/GxRNF2TPmMn7k
	 OBIKLj8KBNH4L8kL0n6rggloUFaWLMm/qUX8Q3xIOkaa50ji5CNihmRc92KfGSFoIl
	 dc4iYAx+ME8kWPPEU0v5v3vAPP73OlwNdUv//bqer9/beEdYHly9wscjZNSBtXD+ST
	 NSx6V+hPhEvUQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 20 Dec 2024 16:46:38 +0000
Subject: [PATCH RFC v3 13/27] KVM: arm64: Rename sve_state_reg_region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-kvm-arm64-sme-v3-13-05b018c1ffeb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2408; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UbPAO2RjCbS5UdMd6M1SYfFSDmJ+s49CndGfTDSD4Tg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnZaBezixYsQFK0OuTzhIjDQ9L5vedbkx8KdXI+oJ+
 MByXF6GJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2WgXgAKCRAk1otyXVSH0DFgB/
 4n1MpQ+jOywpaT+XfkmFTNXoUjjcWniJR6PZzwE3f/+HiNUo7qNhJmrjK4WsmqxJDxxFW9GI2MOtNe
 1Oc4OSu2kyc25wQX2pJwzaP/jF+V2xx92SI9d+ipJJBr+IZtrKO52UBsPn+iMl4b1ksBSH14nh7b0U
 Kf35rjwc8MK8u18CbYpLcNvYHDJD4LFxEXEvRB9xKwnmXnYnlEng9XAyAr7h4lPlgnwA1gzEb307k3
 GCa+eAw6IZIY46Hb3Ww8rWz6S6ofTp7BozSAkednJfD+05rJXn6vHelrW5zgwIXkBZfIYcfaI8qV6D
 sn02KtcFvcJndag9PqRThjvba09EZ7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_085148_091255_480D695A 
X-CRM114-Status: GOOD (  13.66  )
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
index 62ff51d6e4584acc71205f5d4b1d2f3d2e2d2f88..cde733417f25b5af4f5e996f91c2b962a4d361fd 100644
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


