Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB00C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 12:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCJHK0SeIvlWzxabLhFPeGESfHTjKksGVicGWZCTv30=; b=SmqpT1+sX7cuNIm4xn66swolno
	xkJU+PaxcF8OkfOdl7ncV7fQHTqqZhU03u/NJVRSV3tb20QM5bEOVOAkLCEjqbMLqPjxs+wgfq1oO
	1jZ1u5NAveoFvBnkDRVUtFyHXDRpVInHcL400WQqoB+a48WB3Ks6N5pzR7l28Uizn5RvTQkv6yWTM
	7LVSTHDQkPe5E+T4NWPz3GhQg6e0OD+9kGkbFVQS34u/01FJiXbTCpm6LSoqXnLoxMjnKMMeayfhf
	eWak5hLSH41igNcupR2v16rb/IaA954zvDbDV+qCgpuWFxx3yAXm+EnIqSJ28EZYziJKVTZzv0ZcE
	MzhEJ5DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmVM-0000000CUvS-09CP;
	Fri, 31 Jul 2026 12:38:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmUr-0000000CUgW-3MoR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 12:37:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FD4241A49;
	Fri, 31 Jul 2026 12:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5579B1F00A3A;
	Fri, 31 Jul 2026 12:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785501473;
	bh=zCJHK0SeIvlWzxabLhFPeGESfHTjKksGVicGWZCTv30=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iJqGMowAboxmy1P5IlGaEE38NkRkPK7mKjio3DeTheegYBbVYE32ZnIE4mZHqkZVo
	 1UAGyNaLpWiqYKNmHeZN0msfw4MM53eZbvOlew1MC2Kd/KKq6g23MhFArAc+U59MwN
	 YtHg/S0UwnP6Mah6Jelm6TvE9XKyfS+Fzy5AAunq9bzSdp4Q7bYN0gwbBKMMwfsWMn
	 Ka1alk8dxyUhg1c4y+BJ5RiXzEqUHdlidLBZqOyJEDZzYprmPEeJXEajRIatG4FRsX
	 +NYMhuuGDKO+NFKWAbccYFy20Y26lk6jgJKbnqKKW639MdDlb2eJL3WZR/ZGepRx/a
	 97WQ5YcOiLQ3g==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 31 Jul 2026 13:25:45 +0100
Subject: [PATCH v17 07/14] KVM: arm64: Forward GCS exceptions to nested
 guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-arm64-gcs-v17-7-5e39ca01b14e@kernel.org>
References: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
In-Reply-To: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rDHWQQxEJuusHon3I+fAxB9MIrb5YJQCMI7dak6KWEg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbJcB2ZA4mYrU3T/oePkXT6loWodvKV1DXz/et
 D9sDVptYMmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamyXAQAKCRAk1otyXVSH
 0NAtB/9rnnOR9pvvQytmU3HdeTpEdsReccrj1uWh0UJsc6rW9zLJOLGb2VNHYuNUslndlYG4Dxj
 sWhuSHo97JuPjxX/XFC4+uI1RRshl4SjGMlqGiI2s9nR6fTXw6IlWPsMxZ6Cyc334lyv3GHI1uH
 5Mk7hxCTN3cqE8jvR+UPz50Ps5tBpFY0BtmdOjDZErI4UtwciU7k28j9NZHZVlNQawo2yOi5k+K
 xkvTAbjc6vGsyvfp4b8ovc68w+je2bX9WmCC6rv/x0iAhpz3x4uGjH8U8si5dbV6RXVAjv8pHPY
 L5paL5Yu5Grga6aziC8Gt77jvMaN98BaNIxr1kHZMY06ny7J
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/handle_exit.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 54aedf93c78b..9db350891793 100644
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
 
+	if (is_nested_ctxt(vcpu)) {
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


