Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAE0CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETO//ZHEIrAWcvZFpQcrmAKGm+pliNn3pzbd4bW/wbA=; b=eCkQBuBWfvJ05c3ISCjkNOsI6U
	DzkzWE/m5Sg0iX8nQd3TCAxNbIcjdvw7wvs3pDUF+9WNZGerCnTbyMdL2ohftGxkHaDxt87suqt7Z
	n8ofB8qJB6iuOSjWktgKWIolT/Ur8JCsrVID63AaRZLAjGyvd6w0f/4IEr6fPZVPoIVKJxoht/nu5
	FQPs8bOBwUzEcnjUuzRans/595TyIPo9LBvZ+J3olC5h8htIdXq+JqWgJU3UJZ8/Foh/fYPb9zOJn
	V6bqGa6Nmr4UTAvaVdGdo8Qqq51vREiyKpvMeclbz+tjJ6IpqKFTHMiuGBovbe8OfuadWWaHHNG6u
	zla6K85A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2B0-00000007IN2-0X4K;
	Wed, 30 Sep 2026 21:49:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2Ay-00000007IL1-2i4m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:49:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 67DA941A13;
	Wed, 30 Sep 2026 21:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C94C1F000FF;
	Wed, 30 Sep 2026 21:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790804960;
	bh=ETO//ZHEIrAWcvZFpQcrmAKGm+pliNn3pzbd4bW/wbA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ts8bHGm29D1eMA1ta/GX1aqLyyVAi8ruqECban51kmGbRcRgDMsWBcCDAl0t2f3Jh
	 Q/jLdqjBnV+OEHiSbInjqDYJW3odZYvT11P1QpbunBu4HFg50GGd3PsnO/OJfHwjv1
	 cyr+X5i7pYq83Sj6UiV09wpQGnCKVhSv/jpvOH2KXXxkPqugXlyJtbHWmiA1YUapYd
	 C2EPaZNy7XsHTcCZ3Oox0e1+FjyzInMk0f1opkKPGNIiXuqHaBK2Tqu1IibKtTBVaX
	 9XAlCbwpAzGbtk85ULfPQlGSBOguDVYMq/Be6o9croqMZ800dQpGmf9w//yIU3XOy9
	 3b9kjxhA7fITg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Sep 2026 22:48:17 +0100
Subject: [PATCH v21 07/15] KVM: arm64: Forward GCS exceptions to nested
 guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-arm64-gcs-v21-7-3556644cd927@kernel.org>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
In-Reply-To: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kVbReCZrKoi+cVaC6OJWcE+twh1TXQHikn7eWoOdtvk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqvYO4QbfvLeVqTJpjsPJjc0EbJR8LurVnuvWMa
 bAxPXZiG5WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCar2DuAAKCRAk1otyXVSH
 0EzLB/0X4o5J+Ob3x2kpC8lQ8ERNBXCpJ05jLcfpiazZPwXlKoGWfNoYBN6W1t/+QdQX/pWmMvF
 4/9rpQcNiHT8J3tHlFJ0/BsGvEmP3SdsYdVt12wgekEypSAgwPZ72VrzfW/nJlE+yhMTP2xP0o8
 oXzZxyDkTKHz7fihVqNfygtcv1cRcJvyq8c68xHosJaj+3rBUjswzk1DzJ4NHXa6MxNq8PhySPa
 UAJx7D4ehMg6Rbwgp723DbbbjdIBKGqwnkv6JtNYCGl5oyDvLaBUEWRM83zap9K9hxNsmoTc48p
 0/+lkUNYaRVU7dj9yWoo1LGKSQPHFWoTouPxFugwWMtXMgZm
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

For nested guests where HFGITR_EL2.nGCSSTR_EL1 is clear or when there are
L2 GCS data check exceptions we need to forward the exception to the guest.
Add handling to do so.

Reviewed-by: Leonardo Bras <leo.bras@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/handle_exit.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index db37678dcb05..a8198e96fcb4 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -304,12 +304,24 @@ static int handle_svc(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
+/*
+ * We might get GCS exceptions that need to be forwarded to the
+ * hypervisor when a nested guest has HFGITR_EL2.nGCSSTR_EL1 clear, or
+ * for a GCS data check exception for a L2 guest.
+ */
 static int kvm_handle_gcs(struct kvm_vcpu *vcpu)
 {
-	/* We don't expect GCS, so treat it with contempt */
-	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
-		WARN_ON_ONCE(1);
+	if (!kvm_has_gcs(vcpu->kvm)) {
+		kvm_inject_undefined(vcpu);
+		return 1;
+	}
 
+	if (vcpu_has_nv(vcpu)) {
+		kvm_inject_nested_sync(vcpu, kvm_vcpu_get_esr(vcpu));
+		return 1;
+	}
+
+	WARN_ON_ONCE(1);
 	kvm_inject_undefined(vcpu);
 	return 1;
 }

-- 
2.47.3


