Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3444ACA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 19:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVT57U21vtvicjHkKiVZv5bhClPz9hNyRghzXRiiLXU=; b=JQdH3RIlgsClSSrae2bL1Tq/75
	7tkQMrhgr0dYM0UlNqpSrfMp9N95ajzAtm2kzCIDxKWVDrZrTbGwK9vxlLrPdUnY/uk9VIOOSKtUH
	1K/EAfnDBktgJ8wejaMaWLs6d6pH+aMYHUsxK1EtN8kEyMXF4zwLfOh6jFMFco01ZnpMN1INAxpwh
	f0IhsxZk1M8cP4qM4IwvMjVdjWX5YkVKyzPJcQazlaQat57tmXV0KpYjdF1zf91VOP7WPe6VMj78X
	icCKpiLCyhbMrA6GYkw55xvKgRnFdbEm1MRjhVWvg2yPjR+QkJKFi38BKlu/w2GjLNX8muyD/w1TQ
	8YOJqWaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKYU-0000000119k-0vcu;
	Thu, 18 Sep 2025 19:44:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKYR-0000000118Q-2lal
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 19:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 193726021D;
	Thu, 18 Sep 2025 19:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66369C4CEF0;
	Thu, 18 Sep 2025 19:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758224670;
	bh=3YA+RKjt5eLwcy44RlCM6dNazad9TJ2w7e1lAKycE+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LsShNhSlOosgCCjv3ZZn1EVchSl3vU8pr8DxN45VfTpA5TG2NX6aNYeu9rPMq5DBg
	 udxhVjXaA1OG9vRBXO6ooa13dAV140tSVHM84bLL29YKK+CfS5jAFtU304qGLreLuD
	 0fcV0Z5wAlRxYX6CztaqfsoaovPvVn0IN0niD909yU01a1ebTtWyycg0U0Id17i1c3
	 QJFjj93cWYLoSNwhwpVYJBWVL+cwittfC4Lt4tTACTKH+/nNUgvaRGpFb15Y+lXeAC
	 /RDo3Sr/O1jJSP19VGLgtyY62tsYggT3lcx+iW6HMvLFGNRZVfimRTTmLpr5HNSbex
	 d04r+4NOL9KnQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 18 Sep 2025 20:42:06 +0100
Subject: [PATCH v4 1/2] KVM: arm64: Expose FEAT_LSFE to guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-arm64-lsfe-v4-1-0abc712101c7@kernel.org>
References: <20250918-arm64-lsfe-v4-0-0abc712101c7@kernel.org>
In-Reply-To: <20250918-arm64-lsfe-v4-0-0abc712101c7@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3YA+RKjt5eLwcy44RlCM6dNazad9TJ2w7e1lAKycE+4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBozGEXE5gzxW4DG9tsIWlE41BKvJvGpyQ63RKmO
 HOUNqzPdgaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaMxhFwAKCRAk1otyXVSH
 0F5vB/9btFoOAaaoJWCjjm7nW75Ob1/HiIkQfOGZ2fXHaFGNJBNqxyUxKlocd2E4VYhzrPXdqhn
 WIn8Be+Su4uKhY3qEuZkOxJHJ1popYnXrqdtq2PWVLZRlGKNHTWNNrpGRw9qeX2bsHnusJtACOu
 d9rkXvLKAX5t4K9pv4Khk652f8VCjBd7oIZWz2e1y+Vbiv/fHHyA6MvAodcFl88f5WX2Hge1Rvo
 GxtpOVwLqSv6J5I7gK1HmGsV3NPII5OmQoqD1w3g1jdrdK4D488GCMF4FYWs900EUPNlQHzu4IY
 eKEy/SfjPQLvbzN4fg1Zk71QJxkD0AeCRTjB1axR6IbenZlC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

FEAT_LSFE (Large System Float Extension), providing atomic floating point
memory operations, is optional from v9.5. This feature adds no new
architectural state, expose the relevant ID register field to guests so
they can discover it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82ffb3b3b3cf..08e2cb94bff3 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1642,7 +1642,8 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 			val &= ~ARM64_FEATURE_MASK(ID_AA64ISAR2_EL1_WFxT);
 		break;
 	case SYS_ID_AA64ISAR3_EL1:
-		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_FAMINMAX;
+		val &= ID_AA64ISAR3_EL1_FPRCVT | ID_AA64ISAR3_EL1_LSFE |
+			ID_AA64ISAR3_EL1_FAMINMAX;
 		break;
 	case SYS_ID_AA64MMFR2_EL1:
 		val &= ~ID_AA64MMFR2_EL1_CCIDX_MASK;
@@ -2991,6 +2992,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 					ID_AA64ISAR2_EL1_APA3 |
 					ID_AA64ISAR2_EL1_GPA3)),
 	ID_WRITABLE(ID_AA64ISAR3_EL1, (ID_AA64ISAR3_EL1_FPRCVT |
+				       ID_AA64ISAR3_EL1_LSFE |
 				       ID_AA64ISAR3_EL1_FAMINMAX)),
 	ID_UNALLOCATED(6,4),
 	ID_UNALLOCATED(6,5),

-- 
2.47.2


